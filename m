Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9269D17AB7
	for <linux-coco@lists.linux.dev>; Mon, 12 Jun 2023 17:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686589205; x=1718125205;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=lINzTdir4qaEtcszrtUnYr0rUxQ02JyprEtg0yNn6yc=;
  b=DpxMsfo6myF69wpEuQCBW5QSNhjbDYyi0y0JmzTKEB45dM8chp6xeCFW
   i5pJRj8nhQ56SfdmQOUNVnCWo5s7LHp4RYTf40VvU/0Npi8x9yLS5gKqE
   VRTp220XH2MQ6lvgb8UAyhE6okte728ZYJsREFxWCoFY06zcNDAPnHT9o
   OxuOF3y+O+iVl+1UU0REQKG/7YiQwUlXP7A/9Itf9iq8W0fiez05bZNsB
   2MgGU0jrB+TjgIyfPJi3Dl/SrkLjP1fEk3Ifymkrhjv8c/SSAafd2l/+b
   5EE5+5phQkGaAAYeN3HOTLCVD43G7txko2jU37JEonXYcE9kM6TYCuFRz
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="355600416"
X-IronPort-AV: E=Sophos;i="6.00,236,1681196400"; 
   d="scan'208";a="355600416"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2023 10:00:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="741098047"
X-IronPort-AV: E=Sophos;i="6.00,236,1681196400"; 
   d="scan'208";a="741098047"
Received: from spmantha-mobl1.amr.corp.intel.com (HELO [10.209.43.2]) ([10.209.43.2])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2023 10:00:01 -0700
Message-ID: <d627220d-e8e0-7a8d-73a7-ce3633359f57@intel.com>
Date: Mon, 12 Jun 2023 10:00:00 -0700
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH RFC v9 14/51] x86/sev: Add helper functions for RMPUPDATE
 and PSMASH instruction
Content-Language: en-US
To: Michael Roth <michael.roth@amd.com>, kvm@vger.kernel.org
Cc: linux-coco@lists.linux.dev, linux-mm@kvack.org,
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
 ashish.kalra@amd.com, nikunj.dadhania@amd.com, liam.merwick@oracle.com,
 zhi.a.wang@intel.com, Brijesh Singh <brijesh.singh@amd.com>
References: <20230612042559.375660-1-michael.roth@amd.com>
 <20230612042559.375660-15-michael.roth@amd.com>
From: Dave Hansen <dave.hansen@intel.com>
In-Reply-To: <20230612042559.375660-15-michael.roth@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/11/23 21:25, Michael Roth wrote:
> +/*
> + * Assign a page to guest using the RMPUPDATE instruction.
> + */
> +int rmp_make_private(u64 pfn, u64 gpa, enum pg_level level, int asid, bool immutable)
> +{
> +	struct rmp_state val;
> +
> +	pr_debug("%s: GPA: 0x%llx, PFN: 0x%llx, level: %d, immutable: %d\n",
> +		 __func__, gpa, pfn, level, immutable);

Is this needed *EVERY* time a page is assigned to a guest?  As in, if I
create a 4GB guest, I'll see a literal million of these pr_debug()s in
dmesg?

