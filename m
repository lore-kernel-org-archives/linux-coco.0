Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDF7947D955
	for <linux-coco@lists.linux.dev>; Thu, 30 Apr 2026 19:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777576477; cv=none; b=OGPKhHZo4UaEKjbmR/rTMQLG2p+genqDA0xCC5Ezup2oh0Y8dL1qWw9crQl2j5diX4LhoIH24857+Kw9ocw4XTks86or/coBQALSgG8a9RHRXPG8YPMYkvkQd/yfHtad52IZImYuuetIdhE3ENjW/bPZS+v6nJgeRDFeb6LTYvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777576477; c=relaxed/simple;
	bh=U48yuVtxSb+ILG/ACII/o5SnLtDeduTQRmOxSeBlkqQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KvM2VgZ5XKy3faQk8M18L27pqEVC1gKi62Cwp7LGE3aUih35nfX2f8/ggBzI0EkvWFQlJURsKHp+plFE6MB09ZiNj0hcVSUSkpbJkIDMvQBqwqqrfu9wRHy1YadSknHInRqvh0r8BQgXTeKNNlGz3l7AjV75+7UnPJoiAajM5IQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=clBTfCBX; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="clBTfCBX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777576473; x=1809112473;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=U48yuVtxSb+ILG/ACII/o5SnLtDeduTQRmOxSeBlkqQ=;
  b=clBTfCBXt6RHKLyuJ77oZKv4H5KLA2lxULAUPU3ieicwVyCUylBaEskn
   x+wmj3jBHCR+V+7DJaDkXZRgRD38zG2qra1V2K3C9F7ayFT/3dOD1OiSO
   /BJ6D1Fx+kPzAspfss6/rEeR12hBlU4mroj6w+WArX1iVpq+CybM0JV0o
   iBe3GaRw1x/LrKZtpX5A81sYD5vyN1DKBdLKB/Yksabzv8rLw52IPWXNz
   wucbqUTvuJOzjmVLxc0dJ5hu6+QbM1im2b1SADUhhnG9vsE0aRauqkpEi
   m5S0BhxA05PzQifKiayCrG+t3mh5GqpMUA4jm+6Qg8FcNpHnMd5Vn4Y/7
   Q==;
X-CSE-ConnectionGUID: LyjrEpNWTTq2UJv5d7lXIQ==
X-CSE-MsgGUID: sL+TnZnKQw+orE5Xz/6Yjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11772"; a="78733467"
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; 
   d="scan'208";a="78733467"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 12:14:33 -0700
X-CSE-ConnectionGUID: O6YmuHlPRMOGD8RQybRNSg==
X-CSE-MsgGUID: O65fyP5cRVG/1T8t2ORpaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; 
   d="scan'208";a="234729269"
Received: from cjhill-mobl.amr.corp.intel.com (HELO [10.125.109.74]) ([10.125.109.74])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 12:14:33 -0700
Message-ID: <28be5180-ff74-4e4d-b392-7ba7a9b4c1c0@intel.com>
Date: Thu, 30 Apr 2026 12:14:32 -0700
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 15/21] x86/virt/tdx: Refresh TDX module version after
 update
To: Chao Gao <chao.gao@intel.com>, kvm@vger.kernel.org,
 linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, x86@kernel.org
Cc: binbin.wu@linux.intel.com, dave.hansen@linux.intel.com, djbw@kernel.org,
 ira.weiny@intel.com, kai.huang@intel.com, kas@kernel.org,
 nik.borisov@suse.com, paulmck@kernel.org, pbonzini@redhat.com,
 reinette.chatre@intel.com, rick.p.edgecombe@intel.com, sagis@google.com,
 seanjc@google.com, tony.lindgren@linux.intel.com, vannapurve@google.com,
 vishal.l.verma@intel.com, yilun.xu@linux.intel.com, xiaoyao.li@intel.com,
 yan.y.zhao@intel.com, Thomas Gleixner <tglx@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 "H. Peter Anvin" <hpa@zytor.com>
References: <20260427152854.101171-1-chao.gao@intel.com>
 <20260427152854.101171-16-chao.gao@intel.com>
From: Dave Hansen <dave.hansen@intel.com>
Content-Language: en-US
Autocrypt: addr=dave.hansen@intel.com; keydata=
 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
In-Reply-To: <20260427152854.101171-16-chao.gao@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/27/26 08:28, Chao Gao wrote:
> The kernel exposes the TDX module version through sysfs so userspace can
> check update compatibility. That information needs to remain accurate
> across runtime updates.
> 
> A runtime update may change the module's update_version, so refresh the
> cached version after a successful update and emit a log message to show
> the version change.
> 
> Drop __ro_after_init from tdx_sysinfo because it is now updated at runtime.
> 
> Perform the refresh outside of stop_machine() since printk() within
> stop_machine() would add significant latency.
> 
> Do not refresh the rest of tdx_sysinfo. Refreshing them at runtime could
> disrupt running software that relies on the previously reported values.

This needs more explanation. I think the reasoning is quite nuanced.

tdx_sysinfo is just a cache of what the TDX module is and can do. If
that changes, it means the TDX module changed. So you somehow need to
argue why it's OK to hide those changes from the tdx_sysinfo users.

Why would they be confused by tdx_sysinfo changes but not by the TDX
module *itself* changing?

> Note that major and minor versions are not refreshed because runtime updates
> are supported only between releases with identical major and minor versions.

I'd rather have this in code than a changelog comment.

If they can't change then warn if they do.

> diff --git a/arch/x86/virt/vmx/tdx/seamldr.c b/arch/x86/virt/vmx/tdx/seamldr.c
> index 98a8d9d3ae25..c81b26c4bac1 100644
> --- a/arch/x86/virt/vmx/tdx/seamldr.c
> +++ b/arch/x86/virt/vmx/tdx/seamldr.c
> @@ -306,6 +306,8 @@ DEFINE_FREE(free_seamldr_params, struct seamldr_params *,
>   */
>  int seamldr_install_module(const u8 *data, u32 size)
>  {
> +	int ret;
> +
>  	struct seamldr_params *params __free(free_seamldr_params) =
>  						init_seamldr_params(data, size);
>  	if (IS_ERR(params))
> @@ -314,6 +316,10 @@ int seamldr_install_module(const u8 *data, u32 size)
>  	/* Ensure a stable set of online CPUs for the update process. */
>  	guard(cpus_read_lock)();
>  	set_target_state(MODULE_UPDATE_START + 1);
> -	return stop_machine_cpuslocked(do_seamldr_install_module, params, cpu_online_mask);
> +	ret = stop_machine_cpuslocked(do_seamldr_install_module, params, cpu_online_mask);
> +	if (ret)
> +		return ret;
> +
> +	return tdx_module_refresh_version();
>  }

This is one reason I rather dislike guard().

Does tdx_module_refresh_version() need to be guarded by 'cpus_read_lock'?

> +int tdx_module_refresh_version(void)
> +{
> +	struct tdx_sys_info_version *old, new;

Two variable definitions, please. IMNHO pointers and plain variables are
different types. Even if you can, they should not be defined together.

> +	int ret;
> +
> +	/* Shouldn't fail as the update has succeeded. */
> +	ret = get_tdx_sys_info_version(&new);
> +	WARN_ON_ONCE(ret);
> +
> +	old = &tdx_sysinfo.version;
> +	pr_info("version " TDX_VERSION_FMT " -> " TDX_VERSION_FMT "\n",
> +		old->major_version, old->minor_version, old->update_version,
> +		new.major_version, new.minor_version, new.update_version);

Having 'new' and 'old' be different types is really wonky. What's wrong
with:

	struct tdx_sys_info_version old = tdx_sysinfo.version;

?


> +	/* Major/minor versions should not change across updates. */
> +	tdx_sysinfo.version.update_version	= new.update_version;

					   ^ very odd tab

Also, how much of this do you *NEED*? You don't need to print the old
version. You don't really need to _print_ the new version either.

Isn't this arguably all fluff?

If the fluff went away would we even be talking about the funky pointer
versus plain type gunk?

Second, this is all open-coded and completely discrete from the code
that originally sets 'tdx_sysinfo.version'. Can it be unified?

