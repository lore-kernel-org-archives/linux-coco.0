Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA22D1C34
	for <linux-coco@lists.linux.dev>; Wed, 22 Jun 2022 18:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655923387; x=1687459387;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=vLhzMi2QzzK4JidKA8EX0YX95XP0Zt+Cm+d/NMCKTa8=;
  b=cRrpQJbDCIAiOurfHHNVOVFnui/lDCkecrxJ+MMK+RxRfPeuybe4FM8u
   Sqhlgeh2tM6P5ZCGyv+Gg12+lRQkSqM0i5E1DYh256gqvk5rqJ9EsOr63
   r11qlccXPkay4cwD9amf/40NDUhIj1LpcOvS9nQIUZGVL23pY3EGbmyae
   zKO/a407RL+vVIx49IPi276CtjPXNGJWQ/hfaEpi8run84JF3B/OrL4g5
   uDTy4DwUWQBNzGxvP+tIyrsGcqveoGF9zNF6eiP1fF+N+wFXlaUOAU2EQ
   Tgqn+WTcxizqsCe1G/feei7EL6FRyXDTec+Cq8H3dMm/dB6xtjk+RD+vC
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10386"; a="260332086"
X-IronPort-AV: E=Sophos;i="5.92,212,1650956400"; 
   d="scan'208";a="260332086"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2022 11:43:06 -0700
X-IronPort-AV: E=Sophos;i="5.92,212,1650956400"; 
   d="scan'208";a="677695719"
Received: from bshakya-mobl.amr.corp.intel.com (HELO [10.212.188.76]) ([10.212.188.76])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2022 11:43:05 -0700
Message-ID: <99d72d58-a9bb-d75c-93af-79d497dfe176@intel.com>
Date: Wed, 22 Jun 2022 11:42:46 -0700
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH Part2 v6 05/49] x86/sev: Add RMP entry lookup helpers
Content-Language: en-US
To: "Kalra, Ashish" <Ashish.Kalra@amd.com>, "x86@kernel.org"
 <x86@kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>
Cc: "tglx@linutronix.de" <tglx@linutronix.de>,
 "mingo@redhat.com" <mingo@redhat.com>, "jroedel@suse.de" <jroedel@suse.de>,
 "Lendacky, Thomas" <Thomas.Lendacky@amd.com>, "hpa@zytor.com"
 <hpa@zytor.com>, "ardb@kernel.org" <ardb@kernel.org>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "seanjc@google.com" <seanjc@google.com>,
 "vkuznets@redhat.com" <vkuznets@redhat.com>,
 "jmattson@google.com" <jmattson@google.com>,
 "luto@kernel.org" <luto@kernel.org>,
 "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
 "slp@redhat.com" <slp@redhat.com>, "pgonda@google.com" <pgonda@google.com>,
 "peterz@infradead.org" <peterz@infradead.org>,
 "srinivas.pandruvada@linux.intel.com" <srinivas.pandruvada@linux.intel.com>,
 "rientjes@google.com" <rientjes@google.com>,
 "dovmurik@linux.ibm.com" <dovmurik@linux.ibm.com>,
 "tobin@ibm.com" <tobin@ibm.com>, "bp@alien8.de" <bp@alien8.de>,
 "Roth, Michael" <Michael.Roth@amd.com>, "vbabka@suse.cz" <vbabka@suse.cz>,
 "kirill@shutemov.name" <kirill@shutemov.name>,
 "ak@linux.intel.com" <ak@linux.intel.com>,
 "tony.luck@intel.com" <tony.luck@intel.com>,
 "marcorr@google.com" <marcorr@google.com>,
 "sathyanarayanan.kuppuswamy@linux.intel.com"
 <sathyanarayanan.kuppuswamy@linux.intel.com>,
 "alpergun@google.com" <alpergun@google.com>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>,
 "jarkko@kernel.org" <jarkko@kernel.org>
References: <cover.1655761627.git.ashish.kalra@amd.com>
 <8f63961f00fd170ba0e561f499292175f3155d26.1655761627.git.ashish.kalra@amd.com>
 <cc0c6bd1-a1e3-82ee-8148-040be21cad5c@intel.com>
 <BYAPR12MB2759A8F48D6D68EE879EEF648EB29@BYAPR12MB2759.namprd12.prod.outlook.com>
 <25be3068-be13-a451-86d4-ff4cc12ddb23@intel.com>
 <BYAPR12MB27599BCEA9F692E173911C3B8EB29@BYAPR12MB2759.namprd12.prod.outlook.com>
 <681e4e45-eff1-600c-9b81-1fa9bdf24232@intel.com>
 <BYAPR12MB27595CF4328B15F0F9573D188EB29@BYAPR12MB2759.namprd12.prod.outlook.com>
From: Dave Hansen <dave.hansen@intel.com>
In-Reply-To: <BYAPR12MB27595CF4328B15F0F9573D188EB29@BYAPR12MB2759.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/22/22 11:34, Kalra, Ashish wrote:
>> So, if the RMP entry format changes in future processors, how do we
>> make sure that the kernel does not try to use *this* code on those
>> processors?
> Functions snp_lookup_rmpentry() and dump_rmpentry() which rely on
> this structure definition will need to handle it accordingly.

In other words, old kernels will break on new hardware?

I think that needs to be fixed.  It should be as simple as a
model/family check, though.  If someone (for example) attempts to use
SNP (and thus snp_lookup_rmpentry() and dump_rmpentry()) code on a newer
CPU, the kernel should refuse.
