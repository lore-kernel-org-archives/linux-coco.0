Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61FCC2F3E
	for <linux-coco@lists.linux.dev>; Wed,  1 Mar 2023 23:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677713967; x=1709249967;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=+dcuSCOUvlfWlgKnuNOG5M7WjDU7LQAEWia+60P3lYo=;
  b=WUPiqEdUIofOy2HH4wJLp+KlMu1ZoQeFcFRl5m3S5J0W2TyEdkqb3PdJ
   lT6nq4csM5mjMYQfauC3uotxCABmDcX7axGZaH6VEUgbAF0ECq/gfqQtv
   314Jmd2u3IOw8WdiIo4bEUFBScpR3UHWGrc8XkzpMzGEEyHlon4weOirg
   OxJtnd03UJk+cNtgBxgaD/k2b7qBE7oHtEBZRxyrNruYEg0H58l3S0p1s
   PRBA0vFf6nZUxM3cdBXEycD111oYg3LGHV00jnJzoyjJvveKoOdGAPd6A
   8sbJDKIywhgWWqTBIEYJglm67qDGmBlRM+tU8BHX31rRQVp1hW80Bte1R
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="420819145"
X-IronPort-AV: E=Sophos;i="5.98,225,1673942400"; 
   d="scan'208";a="420819145"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2023 15:39:23 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="738827318"
X-IronPort-AV: E=Sophos;i="5.98,225,1673942400"; 
   d="scan'208";a="738827318"
Received: from asaha3-mobl1.amr.corp.intel.com (HELO [10.251.12.67]) ([10.251.12.67])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2023 15:39:21 -0800
Message-ID: <4c34773e-31e9-927f-c593-30bbe3b75fd7@intel.com>
Date: Wed, 1 Mar 2023 15:39:20 -0800
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH RFC v8 00/56] Add AMD Secure Nested Paging (SEV-SNP)
 Hypervisor Support
Content-Language: en-US
To: Zhi Wang <zhi.wang.linux@gmail.com>
Cc: Michael Roth <michael.roth@amd.com>, kvm@vger.kernel.org,
 linux-coco@lists.linux.dev, linux-mm@kvack.org,
 linux-crypto@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org,
 tglx@linutronix.de, mingo@redhat.com, jroedel@suse.de,
 thomas.lendacky@amd.com, hpa@zytor.com, ardb@kernel.org,
 pbonzini@redhat.com, seanjc@google.com, vkuznets@redhat.com,
 jmattson@google.com, luto@kernel.org, dave.hansen@linux.intel.com,
 slp@redhat.com, pgonda@google.com, peterz@infradead.org,
 srinivas.pandruvada@linux.intel.com, rientjes@google.com,
 dovmurik@linux.ibm.com, tobin@ibm.com, bp@alien8.de, vbabka@suse.cz,
 kirill@shutemov.name, ak@linux.intel.com, tony.luck@intel.com,
 marcorr@google.com, sathyanarayanan.kuppuswamy@linux.intel.com,
 alpergun@google.com, dgilbert@redhat.com, jarkko@kernel.org,
 ashish.kalra@amd.com, nikunj.dadhania@amd.com
References: <20230220183847.59159-1-michael.roth@amd.com>
 <f2c904f6-996a-e903-5d56-662781567578@intel.com>
 <20230302005943.00001a8e@intel.com>
From: Dave Hansen <dave.hansen@intel.com>
In-Reply-To: <20230302005943.00001a8e@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/1/23 14:59, Zhi Wang wrote:
> When the userspace sets the memory attribute of a GFN range through the
> restricted memory ioctl, the sev logic (sev_update_mem_attr() in PATCH 48, to
> be precise) will try to build a large page description in the RMP table if the
> PFNs are continuous. When kernel mm breaks the the large page due to THP, KVM
> updates the NPT accordingly.

Gah, this really confused me.

It's *NOT* looking for contiguous PFNs.  It's looking for a
restrictedmem THP, which really is something different.  Restrictedmem
THPs have contiguous PFNs, but not all contiguous PFNs will result in
trying to build a large page.

Anyway, I'll reply over to the other patch.

But, either way, I'd appreciate this kind of summary in the changelogs
and probably a comment or two:

	The RMP needs to be consistent with the contents of the NPT.
	KVM updates the NPT but will neglect to update the RMP.  It is
	updated in response to faults when RMP and NPT get out of sync.

Right?

BTW, why doesn't KVM just update the RMP?  Why bother taking the fault?
