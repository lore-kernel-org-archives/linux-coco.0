Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40861238C1B
	for <linux-coco@lists.linux.dev>; Wed,  3 Dec 2025 03:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764733786; cv=none; b=l8EgidWZrnWYxz6r+KcHqYl2Qs2J49BsjMhMs6kuKqiMXNIOXtJ296a4YgNXSYmkmiMo0F6nuapf8VtaznqH71dtqqZTysaekcOvG5Sv2EBNomZK35OQ/91+MEbj4xHtJTMAAwRTQjIlhm39mi16W11M1Gl2POBFIPLv8i/4Mx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764733786; c=relaxed/simple;
	bh=olVBqmwGHiypsb48su6oNW2SHf9mfR+n842L8gT/Vng=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aozLoYEYy9fmQZal0zWUW+yQTRLt7FZKYgXxzXjqlANMk+/gzly6ZKpqXNe9SJkki2TZKd6/APYTL+X2qBY+259o08H4HUYM4hchGRDmErRHxjiqsObqdFYYZjPzerIYYmuCoWGJnN5MKHoK8Wj2y5eZusTz7dwkvbnyxhtxGoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LdUJnAgF; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LdUJnAgF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764733784; x=1796269784;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=olVBqmwGHiypsb48su6oNW2SHf9mfR+n842L8gT/Vng=;
  b=LdUJnAgF7FW06cQo0qanL34XN1qwibsaeUCNPci5PRi7iCB9IN8hBtcD
   Gx8G22nCniRmApaO7o0lK66Tl/Qxbs3suLWziwBf5LsWRvQo94aozPRSS
   k3eP0imjoUs0kRbpMLkIA1v3OkOstN5tbd70NFCjFcJKLjsByLvwfiLy4
   tluPVSXrgDAedvuWMc4gdD6uxPMwVbPFXoILQq+mLwNYkHhNelflvMIlR
   6y71w5b2NcESEVHwycxpaX/81xyjJhHrn7KY96n5FrnZSWDjgGSp3gWm5
   Z11GQ1psPSV8zPIfoDku7/y8H180Gte60ladiqBg9chFdbrERQopMi1z/
   g==;
X-CSE-ConnectionGUID: raoe75R9TimC9y7bfqpcHQ==
X-CSE-MsgGUID: lErBz0a4TlmLT1VDxjOR0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="66885122"
X-IronPort-AV: E=Sophos;i="6.20,244,1758610800"; 
   d="scan'208";a="66885122"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2025 19:49:43 -0800
X-CSE-ConnectionGUID: pzWujOgeTiqd8t6gn4SYYw==
X-CSE-MsgGUID: hX+nDZwfRxuXIcK/LFrJlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,244,1758610800"; 
   d="scan'208";a="193844139"
Received: from unknown (HELO [10.238.3.0]) ([10.238.3.0])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2025 19:49:39 -0800
Message-ID: <0a73607f-fe0b-4bd5-bc01-cd90841a39fa@linux.intel.com>
Date: Wed, 3 Dec 2025 11:49:36 +0800
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 19/21] x86/virt/tdx: Establish contexts for the new TDX
 Module
To: Chao Gao <chao.gao@intel.com>
Cc: linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, x86@kernel.org,
 reinette.chatre@intel.com, ira.weiny@intel.com, kai.huang@intel.com,
 dan.j.williams@intel.com, yilun.xu@linux.intel.com, sagis@google.com,
 vannapurve@google.com, paulmck@kernel.org, nik.borisov@suse.com,
 Farrah Chen <farrah.chen@intel.com>, "Kirill A. Shutemov" <kas@kernel.org>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>
References: <20251001025442.427697-1-chao.gao@intel.com>
 <20251001025442.427697-20-chao.gao@intel.com>
Content-Language: en-US
From: Binbin Wu <binbin.wu@linux.intel.com>
In-Reply-To: <20251001025442.427697-20-chao.gao@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 10/1/2025 10:53 AM, Chao Gao wrote:
> After being installed, the new TDX Module shouldn't re-configure the
> global HKID, TDMRs or PAMTs. Instead, to preserve running TDs, it should
> import the handoff data from the old module to establish all necessary
> contexts.
> 
> Once the import is done, the TDX Module update is complete, and the new
> module is ready to handle requests from the VMM and guests.
> 
> Call the TDH.SYS.UPDATE SEAMCALL to import the handoff data from the old
> module.
> 
> Note that the location and the format of handoff data is defined by the
> TDX Module. The new module knows where to get the handoff data and how to
> parse it. The kernel doesn't need to provide its location, format etc.
> 
> Signed-off-by: Chao Gao <chao.gao@intel.com>
> Tested-by: Farrah Chen <farrah.chen@intel.com>
> ---
>  arch/x86/virt/vmx/tdx/seamldr.c |  5 +++++
>  arch/x86/virt/vmx/tdx/tdx.c     | 16 ++++++++++++++++
>  arch/x86/virt/vmx/tdx/tdx.h     |  2 ++
>  3 files changed, 23 insertions(+)
> 
> diff --git a/arch/x86/virt/vmx/tdx/seamldr.c b/arch/x86/virt/vmx/tdx/seamldr.c
> index 75bb650d8a16..a8ca6966beac 100644
> --- a/arch/x86/virt/vmx/tdx/seamldr.c
> +++ b/arch/x86/virt/vmx/tdx/seamldr.c
> @@ -236,6 +236,7 @@ enum tdp_state {
>  	TDP_SHUTDOWN,
>  	TDP_CPU_INSTALL,
>  	TDP_CPU_INIT,
> +	TDP_RUN_UPDATE,
>  	TDP_DONE,
>  };
>  
> @@ -310,6 +311,10 @@ static int do_seamldr_install_module(void *params)
>  			case TDP_CPU_INIT:
>  				ret = tdx_cpu_enable();
>  				break;
> +			case TDP_RUN_UPDATE:
> +				if (primary)
> +					ret = tdx_module_run_update();
> +				break;
>  			default:
>  				break;
>  			}
> diff --git a/arch/x86/virt/vmx/tdx/tdx.c b/arch/x86/virt/vmx/tdx/tdx.c
> index 280c2a9f3211..7613fd16a0ce 100644
> --- a/arch/x86/virt/vmx/tdx/tdx.c
> +++ b/arch/x86/virt/vmx/tdx/tdx.c
> @@ -1225,6 +1225,22 @@ void tdx_module_set_error(void)
>  	tdx_module_status = TDX_MODULE_ERROR;
>  }
>  
> +int tdx_module_run_update(void)
> +{
> +	struct tdx_module_args args = {};
> +	int ret;> +
> +	ret = seamcall(TDH_SYS_UPDATE, &args);

Since it's a seamcall error, shouldn't it be u64?

> +	if (ret) {
> +		tdx_module_status = TDX_MODULE_ERROR;
> +		pr_info("module update failed: %d\n", ret);

pr_info -> pr_err?
Also, use 0x%016llx as the format.

> +		return ret;
> +	}
> +
> +	tdx_module_status = TDX_MODULE_INITIALIZED;
> +	return 0;
> +}
> +
>  static bool is_pamt_page(unsigned long phys)
>  {
>  	struct tdmr_info_list *tdmr_list = &tdx_tdmr_list;
> diff --git a/arch/x86/virt/vmx/tdx/tdx.h b/arch/x86/virt/vmx/tdx/tdx.h
> index b903e479e46a..983c01c6949a 100644
> --- a/arch/x86/virt/vmx/tdx/tdx.h
> +++ b/arch/x86/virt/vmx/tdx/tdx.h
> @@ -47,6 +47,7 @@
>  #define TDH_VP_WR			43
>  #define TDH_SYS_CONFIG			45
>  #define TDH_SYS_SHUTDOWN		52
> +#define TDH_SYS_UPDATE		53
>  
>  /*
>   * SEAMCALL leaf:
> @@ -122,5 +123,6 @@ struct tdmr_info_list {
>  int tdx_module_shutdown(void);
>  void tdx_module_set_error(void);
>  int tdx_cpu_enable(void);
> +int tdx_module_run_update(void);
>  
>  #endif

