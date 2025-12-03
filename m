Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85D4A1F4181
	for <linux-coco@lists.linux.dev>; Wed,  3 Dec 2025 07:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764747724; cv=none; b=AJK/a6FnhbhZGv00ijl2eEQZ8mbh4paBn1mHm4YVFxLvVIumtvVPvlrw3fIzT7WbT98NZ7QIltYtQaOQG2xZL2Ap79s5tGhpjKcy3UVlvznMWdFt2254qPpZPZWGxYTWNyu9V1//U21X9AjiWfSERSfSKoAjbxM2tdep+VvFQkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764747724; c=relaxed/simple;
	bh=fvJqRIBOhw+9vov61CR/z71P0uJTmK3WyyKuKM864qo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=vCb933rsRgvLDMlmmOsP70BbspmGwMmhsqwfiLx9sdCE4hJ1q+2gri5WTVc9KxSA6aYoz+gvNuVHSrnRryfHjsE8SVBUwd49HCRCWIzeHdjmZvacKrx0Xs6Z3FVg5MvZJgEQhToHj82ufIeJDDTN9ZVFOQON4dsj1bHmYDUtz+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iqG/51AI; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iqG/51AI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764747723; x=1796283723;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=fvJqRIBOhw+9vov61CR/z71P0uJTmK3WyyKuKM864qo=;
  b=iqG/51AI1J2XNGtqgk4JXyXFSybU8QtdSwOnL6p7f9eWkxxw7YbzYj9l
   GlIRtegNldcIBerX0XnXW7mowFwCLRl1CcpNnU8uJPxdgsPRrQS+kDdwT
   GOkoo+800w0jzHglEmFrGGgAXklx+QOHhdgMYNqFsSzdEwqYAwIUlEAf4
   YqDikx/Ig2oWNmWBkqpr/13ohyP55hmkLBC9PIVB7bbuiNrKI8k8e1Jgc
   XHzMEvZ/GK3tAbWAb70bdcuIYJjQ4mVnZ4P6pGXdRZJtEkWBggpmnockz
   FaIWX6xWnRX4Xifm8/NnXqFosns+2BHe/bnMWcKr14MIF8BAtxV9jlXtD
   A==;
X-CSE-ConnectionGUID: YEKZeko9R36yo4+KKiS7UA==
X-CSE-MsgGUID: p93d1qyyT6+cOn/JIcjWiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="77413647"
X-IronPort-AV: E=Sophos;i="6.20,245,1758610800"; 
   d="scan'208";a="77413647"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2025 23:42:02 -0800
X-CSE-ConnectionGUID: sLeGP6jlSgGmsi31spqoVw==
X-CSE-MsgGUID: WrTwhU3YTGGr1WoasUTPgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,245,1758610800"; 
   d="scan'208";a="217936779"
Received: from unknown (HELO [10.238.3.0]) ([10.238.3.0])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2025 23:41:52 -0800
Message-ID: <a648b7bc-11aa-41f0-bf42-ca9b66afe6dc@linux.intel.com>
Date: Wed, 3 Dec 2025 15:41:50 +0800
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 20/21] x86/virt/tdx: Update tdx_sysinfo and check
 features post-update
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
 <20251001025442.427697-21-chao.gao@intel.com>
Content-Language: en-US
From: Binbin Wu <binbin.wu@linux.intel.com>
In-Reply-To: <20251001025442.427697-21-chao.gao@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 10/1/2025 10:53 AM, Chao Gao wrote:

[...]
>  
> +/*
> + * Update tdx_sysinfo and check if any TDX module features changed after
> + * updates
> + */
> +int tdx_module_post_update(struct tdx_sys_info *info)
> +{
> +	struct tdx_sys_info_version *cur, *new;
> +	int ret;
> +
> +	/* Shouldn't fail as the update has succeeded */
> +	ret = get_tdx_sys_info(info);
> +	if (ret) {
> +		WARN_ONCE(1, "version retrieval failed after update, replace TDX Module\n");

Nit:
Could be if (WARN_ONCE(ret, "..."))

> +		return ret;
> +	}
> +
> +	guard(mutex)(&tdx_module_lock);
> +
> +	cur = &tdx_sysinfo.version;

Nit:
After update, the current TDX module is the new TDX module already, may be
better to use old instead of cur.

> +	new = &info->version;
> +	pr_info("version %u.%u.%02u -> %u.%u.%02u\n", cur->major_version,
> +						      cur->minor_version,
> +						      cur->update_version,
> +						      new->major_version,
> +						      new->minor_version,
> +						      new->update_version);
> +
> +	/*
> +	 * Blindly refreshing the entire tdx_sysinfo could disrupt running
> +	 * software, as it may subtly rely on the previous state unless
> +	 * proven otherwise.
> +	 *
> +	 * Only refresh version information (including handoff version)
> +	 * that does not affect functionality, and ignore all other
> +	 * changes.
> +	 */
> +	tdx_sysinfo.version	= info->version;
> +	tdx_sysinfo.handoff	= info->handoff;
> +
> +	if (!memcmp(&tdx_sysinfo, info, sizeof(*info)))
> +		return 0;
> +
> +	pr_info("TDX module features have changed after updates, but might not take effect.\n");
> +	pr_info("Please consider a potential BIOS update.\n");


BIOS update?
I guess it's "TDX module update via BIOS"?

Does it mean after a system reboot, the change done by TD preserving update will
be gone? If we want the TDX module upgrade to be permanent, it needs to replace
the TDX module binary the BIOS will load, right?

So the scenario of TD preserving update seems to be limited to security fixes?
(I guess the security fixes will take effect directly after TD preserving
update?)


> +	return 0;
> +}
> +
>  static bool is_pamt_page(unsigned long phys)
>  {
>  	struct tdmr_info_list *tdmr_list = &tdx_tdmr_list;
> diff --git a/arch/x86/virt/vmx/tdx/tdx.h b/arch/x86/virt/vmx/tdx/tdx.h
> index 983c01c6949a..ca76126880ee 100644
> --- a/arch/x86/virt/vmx/tdx/tdx.h
> +++ b/arch/x86/virt/vmx/tdx/tdx.h
> @@ -3,6 +3,7 @@
>  #define _X86_VIRT_TDX_H
>  
>  #include <linux/bits.h>
> +#include <asm/tdx_global_metadata.h>
>  
>  /*
>   * This file contains both macros and data structures defined by the TDX
> @@ -124,5 +125,6 @@ int tdx_module_shutdown(void);
>  void tdx_module_set_error(void);
>  int tdx_cpu_enable(void);
>  int tdx_module_run_update(void);
> +int tdx_module_post_update(struct tdx_sys_info *info);
>  
>  #endif

