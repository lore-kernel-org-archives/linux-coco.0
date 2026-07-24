Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 064D43CF976
	for <linux-coco@lists.linux.dev>; Fri, 24 Jul 2026 08:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784880988; cv=none; b=I0gL97fSNoJ2HEUiai+oc9PIJZF205ZRmzDs2Kzvp/R3GOLestiTAXikN/+GQUJlkGZ8gU8qmvk9S1ar8BOasRV4RGz07Hsdza+m/CyQolDirfTGar7w8K7GmrBS7z0ZqiYT1MM+KsR8w8nUA17dR2CwOyVV3oKrSRK/mrZim7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784880988; c=relaxed/simple;
	bh=eg0RbmSqnpanchs9JmzO0r+GsNFi5NOA/CLbL3kiJeo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XcJvAvqF+NcpVlJQnfMfCzsYQR4WTCCyjn+vetqx1BRBT/JDC76KChiFbxfTpgQeMRU3Gx9Kbnd9viXd6g3RpwYcY5hBszkmr8gJEb3jIFRgBuixthu32oQh8LxiEeOcHSb/JBeSo5K0swYe6+K3zNex5zn2ALLKDKlJyNeWqsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XRw2l+HA; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XRw2l+HA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784880961; x=1816416961;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=eg0RbmSqnpanchs9JmzO0r+GsNFi5NOA/CLbL3kiJeo=;
  b=XRw2l+HAq9LttQk1xZbNWwBF01MMFc3H7LzfiR1gU0bYVKMKXGVUmQ3R
   cK1AR3/NpKJN23GYlGdbaZsBxYC9RPVtWbc7rMNtMUPHp/o/If8HvWvjZ
   uaQqxXjNCnZgc2HUH2mdKvzogAZ/a/a+nYcQJsQ/l8+iV0iyBkFUqQrKO
   yHWueQfkWt7ZRrqI0ojMK63KQf23dRSIziPdSAJc5WnD1Tt9IwmyRP9nT
   U3YukNgACLySKqI3TukcfDhtm+fh4ZKTymubBnZfNFy+SgPp2H024OD1S
   dLXeknBNycalNSbEzQrFzq1/SWWtnJSEK9KlUTtlpH16urXA+ebRAYVxb
   g==;
X-CSE-ConnectionGUID: aMAUMt1SREuSt78PCYmdLg==
X-CSE-MsgGUID: bA3IyfVAQvGDoOTk2KJI8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="96692974"
X-IronPort-AV: E=Sophos;i="6.25,182,1779174000"; 
   d="scan'208";a="96692974"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2026 01:15:29 -0700
X-CSE-ConnectionGUID: hhFMJjWTS2a2Nmzaw6vN5A==
X-CSE-MsgGUID: O0d9viwGSrKH5CQS1aVXqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,182,1779174000"; 
   d="scan'208";a="256001656"
Received: from xiaoyaol-hp-g830.ccr.corp.intel.com (HELO [10.124.240.232]) ([10.124.240.232])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2026 01:15:24 -0700
Message-ID: <823bf577-51a1-4a8a-b240-ef4a0d5573be@intel.com>
Date: Fri, 24 Jul 2026 16:15:21 +0800
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/17] x86/virt/tdx: Configure add-on features on TDX
 module init and update
To: Xu Yilun <yilun.xu@linux.intel.com>, x86@kernel.org, kvm@vger.kernel.org,
 linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: djbw@kernel.org, kas@kernel.org, rick.p.edgecombe@intel.com,
 yilun.xu@intel.com, sohil.mehta@intel.com, adrian.hunter@intel.com,
 kishen.maloor@intel.com, tony.lindgren@linux.intel.com,
 peter.fang@intel.com, baolu.lu@linux.intel.com, zhenzhong.duan@intel.com,
 dave.hansen@intel.com, dave.hansen@linux.intel.com, seanjc@google.com
References: <20260618081355.3253581-1-yilun.xu@linux.intel.com>
 <20260618081355.3253581-3-yilun.xu@linux.intel.com>
Content-Language: en-US
From: Xiaoyao Li <xiaoyao.li@intel.com>
In-Reply-To: <20260618081355.3253581-3-yilun.xu@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/18/2026 4:13 PM, Xu Yilun wrote:
> In addition to basic TDX functionalities, TDX module provides add-on
> features that can be progressively enabled as the kernel supports them.

"add-on features" looks like a new term introduced by this sereis for 
TDX. So what is add-on features? all the features defined in 
TDX_FEATURE0/1? Or only the features needs to be explicitly enabled by 
R9 and R10 of TDH.SYS.CONFIG? ...

> The kernel should explicitly configure these features at boot or
> post-update initialization time. 

... So the answer is the latter. Then why only these bits are add-on 
features while the rest in TDX_FEATURES01 are not?

btw, s/should/needs/ is better?

> Configuring an add-on feature, such as
> TDX Quoting, that uses extension SEAMCALLs is the prerequisite for
> initializing TDX module extensions. 

Though the statement is right, it leads to the impression that the 
reason we are configuring the add-on feature is to initialize the TDX 
module extensions.

However, the truth is kenrel wants to enable/use an add-on feature and 
the add-on feature requires the functionalities provided by some TDX 
module extension. So kernel needs to enable the TDX module extensions.

> TDX Quoting is the target feature to
> enable but defer it for now until full kernel support is in place.
> 
> TDX module extends TDH.SYS.CONFIG and TDH.SYS.UPDATE with new bitmap
> input parameters to specify which add-on features to configure. The
> bitmap uses the same definitions as TDX_FEATURES0.
> 
> For runtime update, Linux applies a policy that no newer features should
> be added after update to avoid disrupting live TDX operations. To adhere
> to this, TDH.SYS.UPDATE must configure the same features as the
> TDH.SYS.CONFIG. Record the kernel required add-on feature bitmap in a
> global var so that both phases can use it.
> 
> TDX module advances the version of TDH.SYS.CONFIG and TDH.SYS.UPDATE for
> the change, so use the latest version (v1) for add-on feature enabling.
> But supporting existing modules which only support v0 is still necessary
> until they are deprecated. In fact, it is unlikely that TDH.SYS.CONFIG
> ever needs to change again and the code would stay in v1. So there is
> little value in worrying about deprecating v0 to save a couple lines of
> code in 5-7 years when these original TDX platforms sunset.
> 
> Signed-off-by: Xu Yilun <yilun.xu@linux.intel.com>
> ---
>   arch/x86/virt/vmx/tdx/tdx.h |  6 ++++--
>   arch/x86/virt/vmx/tdx/tdx.c | 28 ++++++++++++++++++++++++++--
>   2 files changed, 30 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/x86/virt/vmx/tdx/tdx.h b/arch/x86/virt/vmx/tdx/tdx.h
> index fbb520704662..a47e872480c7 100644
> --- a/arch/x86/virt/vmx/tdx/tdx.h
> +++ b/arch/x86/virt/vmx/tdx/tdx.h
> @@ -58,9 +58,11 @@
>   #define TDH_PHYMEM_CACHE_WB		40
>   #define TDH_PHYMEM_PAGE_WBINVD		41
>   #define TDH_VP_WR			43
> -#define TDH_SYS_CONFIG			45
> +#define TDH_SYS_CONFIG_V0		45
> +#define TDH_SYS_CONFIG			SEAMCALL_LEAF_VER(TDH_SYS_CONFIG_V0, 1)
>   #define TDH_SYS_SHUTDOWN		52
> -#define TDH_SYS_UPDATE			53
> +#define TDH_SYS_UPDATE_V0		53
> +#define TDH_SYS_UPDATE			SEAMCALL_LEAF_VER(TDH_SYS_UPDATE_V0, 1)
>   #define TDH_SYS_DISABLE			69
>   
>   /* TDX page types */
> diff --git a/arch/x86/virt/vmx/tdx/tdx.c b/arch/x86/virt/vmx/tdx/tdx.c
> index 2a03152796e6..92305b5ea90d 100644
> --- a/arch/x86/virt/vmx/tdx/tdx.c
> +++ b/arch/x86/virt/vmx/tdx/tdx.c
> @@ -57,6 +57,7 @@ static struct tdx_module_state tdx_module_state;
>   static u32 tdx_global_keyid __ro_after_init;
>   static u32 tdx_guest_keyid_start __ro_after_init;
>   static u32 tdx_nr_guest_keyids __ro_after_init;
> +static u64 tdx_addon_feature0 __ro_after_init;
>   
>   static DEFINE_IDA(tdx_guest_keyid_pool);
>   
> @@ -1004,9 +1005,18 @@ static __init int construct_tdmrs(struct list_head *tmb_list,
>   	return ret;
>   }
>   
> +static __init void set_tdx_addon_features(void)
> +{
> +	/*
> +	 * To add DICE-based TDX Quoting feature bit in tdx_addon_feature0 when
> +	 * kernel is ready.
> +	 */
> +}
> +
>   static __init int config_tdx_module(struct tdmr_info_list *tdmr_list,
>   				    u64 global_keyid)
>   {
> +	u64 seamcall_fn = TDH_SYS_CONFIG_V0;
>   	struct tdx_module_args args = {};
>   	u64 *tdmr_pa_array;
>   	size_t array_sz;
> @@ -1032,7 +1042,15 @@ static __init int config_tdx_module(struct tdmr_info_list *tdmr_list,
>   	args.rcx = __pa(tdmr_pa_array);
>   	args.rdx = tdmr_list->nr_consumed_tdmrs;
>   	args.r8 = global_keyid;
> -	ret = seamcall_prerr(TDH_SYS_CONFIG, &args);
> +
> +	set_tdx_addon_features();

Maybe move the set_tdx_addon_features() out of config_tdx_module()? how 
about putting it after check_features(). config_tdx_module() looks like 
just a wrapper to invoke TDH.SYS.CONFIG, while the params of it are 
determined outside of it.

Just my feeling.

> +
> +	if (tdx_addon_feature0) {
> +		args.r9 = tdx_addon_feature0;
> +		seamcall_fn = TDH_SYS_CONFIG;
> +	}
> +
> +	ret = seamcall_prerr(seamcall_fn, &args);
>   
>   	/* Free the array as it is not required anymore. */
>   	kfree(tdmr_pa_array);
> @@ -1314,10 +1332,16 @@ int tdx_module_shutdown(void)
>   
>   int tdx_module_run_update(void)
>   {
> +	u64 seamcall_fn = TDH_SYS_UPDATE_V0;
>   	struct tdx_module_args args = {};
>   	int ret;
>   
> -	ret = seamcall_prerr(TDH_SYS_UPDATE, &args);
> +	if (tdx_addon_feature0) {
> +		args.r9 = tdx_addon_feature0;
> +		seamcall_fn = TDH_SYS_UPDATE;
> +	}
> +
> +	ret = seamcall_prerr(seamcall_fn, &args);
>   	if (ret)
>   		return ret;
>   

