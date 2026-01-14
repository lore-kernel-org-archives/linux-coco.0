Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C65882D5408
	for <linux-coco@lists.linux.dev>; Wed, 14 Jan 2026 07:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768374163; cv=none; b=kQSU1eE8ICNnfRC2RSk/BiSHCLLTA2mqvnequAAdCcm8uN5tVE/rTalKX/6A/rdg1PUR18obS4fRoc3oPvbTPt3Wex/YRczDsi6UzVcD5UNqFSQyDhA7AJEIgNXPcNpzwSt9ZRzGNbwc3rS/8dxMVz2b65RYrU4qJRmcQKFXBlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768374163; c=relaxed/simple;
	bh=T+Kc+yzIPbNwm3QE+AjcLiqkMokfZeWM4l5x3FrBqDI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uK/hr+SIDAuqIrBFK0z4zYNpGrsCGD4xlp1nvx1PKn7SHeGQdNg1OpnEKaW1Xg5faErEkDpfMLaFgncvvJZ7B/7VNXiHVyF3KLdRvWJ3fTQiDXJCBuAOY0ezQjj4Lckacm/FuGqhiyzzxI7JRVAdUWLNcDG9ezI+pya6XsIGP0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fA1d9yHU; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fA1d9yHU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768374160; x=1799910160;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=T+Kc+yzIPbNwm3QE+AjcLiqkMokfZeWM4l5x3FrBqDI=;
  b=fA1d9yHUcXTnCfGsFhkO+cUO0zmknu900PW0M0mQTS7lOR68R4fzCRCB
   3H5VHwZxPauHOK8Rmav0BRb+FpAq8GHx1SAs5kX78fNXdyc5QOsa41DeQ
   tRoq9NCTebV80dIv8IuI9/lgr1HxJeuPWtNf1eBNvmshSCENfWsK3PLTj
   1Iq06Uk4hCmRZXOUoMaLAfodgnE/8mze8yCjsaFNVk8SuHjBT5kcf6u1h
   tx83wv3sp/M3UCN1t2p12wi1XVr5tDwv35ivbfkVk2w/2ep65skFBd5Le
   Gmy1ZKkmyddiZf59GXAkK19RMkv5VZ+wRO4jxcquHfgdWqniSuC/jxy5P
   w==;
X-CSE-ConnectionGUID: eZO975ryRsqBd9ibgWhsNQ==
X-CSE-MsgGUID: qdilAwwORf+YiTgZosYyIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="87249724"
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; 
   d="scan'208";a="87249724"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 23:02:37 -0800
X-CSE-ConnectionGUID: WezfwWpWRUSRWkExOcDiFg==
X-CSE-MsgGUID: 7dVju92yTQu38BaZAl5gfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; 
   d="scan'208";a="208757294"
Received: from yilunxu-optiplex-7050.sh.intel.com (HELO localhost) ([10.239.159.165])
  by orviesa003.jf.intel.com with ESMTP; 13 Jan 2026 23:02:33 -0800
Date: Wed, 14 Jan 2026 14:45:02 +0800
From: Xu Yilun <yilun.xu@linux.intel.com>
To: Chao Gao <chao.gao@intel.com>
Cc: linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org,
	x86@kernel.org, reinette.chatre@intel.com, ira.weiny@intel.com,
	kai.huang@intel.com, dan.j.williams@intel.com, sagis@google.com,
	vannapurve@google.com, paulmck@kernel.org, nik.borisov@suse.com,
	Farrah Chen <farrah.chen@intel.com>,
	"Kirill A. Shutemov" <kas@kernel.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH v2 11/21] x86/virt/seamldr: Allocate and populate a
 module update request
Message-ID: <aWc7bq+EiQiME8nl@yilunxu-OptiPlex-7050>
References: <20251001025442.427697-1-chao.gao@intel.com>
 <20251001025442.427697-12-chao.gao@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251001025442.427697-12-chao.gao@intel.com>

> +/* Allocate and populate a seamldr_params */
> +static struct seamldr_params *alloc_seamldr_params(const void *module, int module_size,
> +						   const void *sig, int sig_size)
> +{
> +	struct seamldr_params *params;
> +	const u8 *ptr;
> +	int i;
> +
> +	BUILD_BUG_ON(sizeof(struct seamldr_params) != SZ_4K);
> +	if (module_size > SEAMLDR_MAX_NR_MODULE_4KB_PAGES * SZ_4K)
> +		return ERR_PTR(-EINVAL);
> +
> +	if (!IS_ALIGNED(module_size, SZ_4K) || !IS_ALIGNED(sig_size, SZ_4K) ||
> +	    !IS_ALIGNED((unsigned long)module, SZ_4K) ||
> +	    !IS_ALIGNED((unsigned long)sig, SZ_4K))
> +		return ERR_PTR(-EINVAL);
> +
> +	/* seamldr_params accepts one 4KB-page for sigstruct */
> +	if (sig_size != SZ_4K)

Why we check both IS_ALIGNED(sig_size, SZ_4K) and sig_size != SZ_4K, I
assume the former is redundant.

> +		return ERR_PTR(-EINVAL);
> +
> +	params = (struct seamldr_params *)get_zeroed_page(GFP_KERNEL);
> +	if (!params)
> +		return ERR_PTR(-ENOMEM);
> +
> +	params->scenario = SEAMLDR_SCENARIO_UPDATE;
> +	params->sigstruct_pa = (vmalloc_to_pfn(sig) << PAGE_SHIFT) +

This void * buffer comes from FW_UPLOAD callback, which is a kvmalloc
buffer, so we do vmalloc_to_pfn() here. But that knowledge resides in
FW_UPLOAD driver context, the kAPI entry, seamldr_install_module()
doesn't say that. So could we add the kernel-doc to specify this
"const u8 *data" at ...

... here
>  int seamldr_install_module(const u8 *data, u32 size)
>  {
>  	const struct seamldr_info *info = seamldr_get_info();
> @@ -82,6 +232,11 @@ int seamldr_install_module(const u8 *data, u32 size)
>  	if (!info->num_remaining_updates)
>  		return -ENOSPC;
>  
> +	struct seamldr_params *params __free(free_seamldr_params) =
> +						init_seamldr_params(data, size);
> +	if (IS_ERR(params))
> +		return PTR_ERR(params);
> +
>  	guard(cpus_read_lock)();
>  	if (!cpumask_equal(cpu_online_mask, cpu_present_mask)) {
>  		pr_err("Cannot update TDX module if any CPU is offline\n");
> -- 
> 2.47.3
> 
