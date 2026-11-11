Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794421508;
	b=mAGB3zFC2ZyjjoPkAorul+DfTRXtG3WhIFuhatRIvBRh2ueJSYkb94AGJbF9Vdh20vaJ
	 WGPQn6N2bEw+98Vr9mZ6e8fLwtTtK3NEwjwnmD2diPVaInGiQ529YiCCKP1bvH4Hv69Im
	 qof5Ddrp61xrYF6KXHgYIQ9HBwhF8oNhoWK50wR0jnTO806yYACrLVe/LxcaaMmI9EZIC
	 x0X7KGC1Zdw9QZd/8FQfsZwSbi9PysZ52t6pjUVr0o4nrBiHzRoc5Qa+tsgYg8HHc2PMk
	 pVoFbTpgVnYc15xHeah0AfAgfc+spCvliU4luZCbkBLr9pwWxqqn15/e1rIFCAYiA2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794421508;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=7BpI5fW2/hMGe9IG+sEWHrQ7qXPb5Z28TzoqgP3q+X8=;
	b=lTx73+Ozh771LnHkgoMDeS0e0T65JZPQkNc1OkaxsM9zN3/R9i4IKLrZMOFKskdrhJQy
	 B6qQpLSAI2BbpCrGqDZC39gya3BF33NasJ7oEJhenbpxmaMgIn//ngJjlIuN1tlmQv5Cl
	 gwhrfXSQ7fjCYYqryy5aWlo5l+Ezc+0OxcE8q69M/6Ob6pfF81v+KC7w6g4E73/ECi5iE
	 I2WfHS4yQa/JARpQH7RKomAl2CxwkSGtCfBXHN2LAY8Zwp4gkXoio4wQEjYCJ3meiXIda
	 MnVw3/6WKF4kBjnWoguBqSzdKD03BS0ln0OTAKUkxewL8LbQr1XAkNrFj6DvjmqqGbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SQoIYGF3;
	arc=none smtp.remote-ip=192.198.163.15
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75BA3606A31C
	for <linux-coco@lists.linux.dev>; Wed, 11 Nov 2026 18:25:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75BA3606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SQoIYGF3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794421508; x=1825957508;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PW8ygw6U+IfHEqRkrpbYM+fdlLBr9slpDXl0F4qbuvc=;
  b=SQoIYGF3lV07tqsUr1TOxREClceDkF9NY1Gd1Fr+bcfOVEdQrwAW4t2r
   fjB7RwxJlYjOGa6f2RTXP9j0bBydicjyOw6jGmxB0qHZ+SD9sAokrBECw
   a0h8xiAzQ6hnF9vmZ1llz6UWzH7BstTNTLRb35oTZwXRC+WDKBWJU5/I7
   k3K5e9SkJVqUQzwRWLPoGFmzOBuaCsYu8KpfgITDFDcjEc95f9d8vK1By
   luK0rA2B/khuN6aVBWyQ5cmTlnD4ichxa8rZaEImvW8bW7zbSJAK4Zi3+
   VE892OU+zt3z9XxSxYYZvP2Gwk5iNtPl+Qe2mtqxaeEPxFf3jxj8j0bPK
   Q==;
X-CSE-ConnectionGUID: o7KJP7+IStquo9o9wiAgdQ==
X-CSE-MsgGUID: 2ZxHyWGiSy66vFr/tK1MpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11963"; a="3206324"
X-IronPort-AV: E=Sophos;i="6.27,208,1787036400"; 
   d="scan'208";a="3206324"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2026 10:25:07 -0800
X-CSE-ConnectionGUID: A3SvYRl7RiaGRtKUwU4Xxw==
X-CSE-MsgGUID: Z5Et+HBiSJy3OBOssIcbXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,208,1787036400"; 
   d="scan'208";a="8917203"
Received: from yilunxu-optiplex-7050.sh.intel.com (HELO localhost) ([10.239.47.46])
  by fmviesa007.fm.intel.com with ESMTP; 11 Nov 2026 10:25:03 -0800
Date: Thu, 12 Nov 2026 02:17:02 +0800
From: Xu Yilun <yilun.xu@linux.intel.com>
To: Chao Gao <chao.gao@intel.com>
Cc: linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev,
	kvm@vger.kernel.org, yilun.xu@intel.com, arjan.van.de.ven@intel.com,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, Kiryl Shutsemau <kas@kernel.org>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>
Subject: Re: [RFC PATCH v2 2/2] x86/virt/seamldr: Support multiple sigstruct
 pages
Message-ID: <avSxHkwvLYVKrhCv@yilunxu-OptiPlex-7050>
References: <20261106132159.1551365-1-chao.gao@intel.com>
 <20261106132159.1551365-3-chao.gao@intel.com>
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Post: <mailto:linux-coco@lists.linux.dev>
List-Help: <mailto:linux-coco+help@lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-coco+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261106132159.1551365-3-chao.gao@intel.com>

> Extend 'struct seamldr_params' to match the new ABI. The sigstruct
> address list is already populated in a loop over all sigstruct pages, so
> raising SEAMLDR_MAX_NR_SIG_PAGES is enough to fill the new slots

As you mentioned [*], could you add a note maybe in populate_pa_list(),
that chaining is only intended for the module binary, in case anyone
gets lost when revisiting the sigstruct part.

[*] https://lore.kernel.org/kvm/aumh_q8olQPwH0pe@intel.com/

> 
> Set 'version' to 1 only when the sigstruct spans more than one page. Old
> P-SEAMLDRs reject version 1, so this keeps updates with a single-page
> sigstruct working on them.

[...]

> 
> Do not query P-SEAMLDR for version 1 support. Userspace selects the
> update image and is responsible for ensuring the module is compatible
> with P-SEAMLDR.
> 
> AI was used under supervision to review code and workshop logs
> 
> Signed-off-by: Chao Gao <chao.gao@intel.com>
> ---
> v2:
>  - drop macros for versions to keep the diff minimal
>  - explain why the sigstruct filling code needs no change
> ---
>  arch/x86/virt/vmx/tdx/seamldr.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/x86/virt/vmx/tdx/seamldr.c b/arch/x86/virt/vmx/tdx/seamldr.c
> index 087bdf10a9a7..9cef6fff2a6c 100644
> --- a/arch/x86/virt/vmx/tdx/seamldr.c
> +++ b/arch/x86/virt/vmx/tdx/seamldr.c
> @@ -36,7 +36,7 @@
>  #define SEAMLDR_PARAMS_NR_PAGES		16
>  #define SEAMLDR_NR_MODULE_PA_ENTRIES	(496 + 512 * (SEAMLDR_PARAMS_NR_PAGES - 1))
>  #define SEAMLDR_MAX_NR_MODULE_PAGES	(SEAMLDR_NR_MODULE_PA_ENTRIES - SEAMLDR_PARAMS_NR_PAGES)
> -#define SEAMLDR_MAX_NR_SIG_PAGES	1
> +#define SEAMLDR_MAX_NR_SIG_PAGES	4
>  
>  /*
>   * The seamldr_params "scenario" field specifies the operation mode:
> @@ -57,7 +57,7 @@ struct seamldr_params {
>  	u32	version;
>  	u32	scenario;
>  	u64	sigstruct_pages_pa_list[SEAMLDR_MAX_NR_SIG_PAGES];
> -	u8	reserved[104];
> +	u8	reserved[80];
>  	u64	module_nr_pages;
>  	u64	module_pages_pa_list[SEAMLDR_NR_MODULE_PA_ENTRIES];
>  } __packed;
> @@ -166,6 +166,13 @@ static void populate_seamldr_params(struct seamldr_params *params,
>  				    const u8 *mod, u32 mod_nr_pages)
>  {
>  	params->version		= 0;
> +	/*
> +	 * Use version 1 only for multi-page sigstructs, to stay
> +	 * compatible with old P-SEAMLDRs that lack version 1 support.
> +	 */
> +	if (sig_nr_pages > 1)
> +		params->version	= 1;

If in future sig grows to more than 4 pages, can we stick to version 1?
What's the planned boundary for sigstruct_pages_pa_list? I hope we don't
further bump version on this.

> +
>  	params->scenario	= SEAMLDR_SCENARIO_UPDATE;
>  	params->module_nr_pages	= mod_nr_pages;
>  
> -- 
> 2.52.0
> 
> 
