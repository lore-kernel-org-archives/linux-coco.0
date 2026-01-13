Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 546B8313E20
	for <linux-coco@lists.linux.dev>; Tue, 13 Jan 2026 11:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768303570; cv=none; b=e5yobsaDHfHSAw6j3vmTZYVM5EfwJyrBE8oOawtC4/F/6dczy09Xos5Ba0xMsTyfSDerEOh7Y3UWevN3rlyoki3k9rqW2Np9SDd3Dofr8pZHYQqC8m17sG+dzo13I8Iz7bgvzQrJrVbUtcZb490HphwVe+91c3pUQie+ckrCJ0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768303570; c=relaxed/simple;
	bh=sPtxed02O4lBEAXRPF97y08gJPkNuJBiZZguqT8wHz4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c5kF9AmcSV0R9eq0ZF1XvgLKxXZ6eFRxVOsn3TSQ3GsBWB4iKySKPsD7HELzjaVAjaI8JeoTN93Pdxtlpjq+ER4uwGpVF2M6oacVMD3vA5ZrfiEWJX0smGKrgckcOyvQid1J8vXKZU3lM4x1LrO+BtcsQUIcIMEcNXFy7gM4miY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=np56r++y; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="np56r++y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768303569; x=1799839569;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sPtxed02O4lBEAXRPF97y08gJPkNuJBiZZguqT8wHz4=;
  b=np56r++yys4I/qmeN1M4MfJs1vWnDmcV/W2r6mfV3bO6RQT9bUVC2iXI
   v0H0P+k/K7Vy7gpjvL9nBNEZGYCtea7LWybzR+7psAcYJ0b2EePwRo0tY
   miLxMwYcNhhRmwQBAW2tJPqClC/n7kuPIQ3tO24vaT60nqsF4wUuoyNtz
   96DP+6bTFeh5U09Qxfgqn26eSVwvyTFXTNRz/dKieUeqzxM2GYcvjJqqD
   vFud1upayzR3XoPVXyT4fLc8Z+abkFDqPqfmv2tmJtJbgrGDKrSMORQsE
   oLgoep6OQ0Apg3nUYr7eRIpO7s0lhlOzqxLzCzJc2BxJJ4Vr8l4BU80R3
   w==;
X-CSE-ConnectionGUID: wp3VzbaBS5+rFrKmZgixyg==
X-CSE-MsgGUID: nOtFBDlHTkm50A8Ny6i6PQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="73217583"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="73217583"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 03:26:09 -0800
X-CSE-ConnectionGUID: p3wihQ+pSguc1pr+/yaWdg==
X-CSE-MsgGUID: iVUKZtdhRrWFpcOyeDc5Rw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="204168688"
Received: from yilunxu-optiplex-7050.sh.intel.com (HELO localhost) ([10.239.159.165])
  by orviesa009.jf.intel.com with ESMTP; 13 Jan 2026 03:26:05 -0800
Date: Tue, 13 Jan 2026 19:08:37 +0800
From: Xu Yilun <yilun.xu@linux.intel.com>
To: Chao Gao <chao.gao@intel.com>
Cc: linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org,
	x86@kernel.org, reinette.chatre@intel.com, ira.weiny@intel.com,
	kai.huang@intel.com, dan.j.williams@intel.com, sagis@google.com,
	vannapurve@google.com, paulmck@kernel.org, nik.borisov@suse.com,
	Farrah Chen <farrah.chen@intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	"Kirill A. Shutemov" <kas@kernel.org>
Subject: Re: [PATCH v2 05/21] x86/virt/seamldr: Introduce a wrapper for
 P-SEAMLDR SEAMCALLs
Message-ID: <aWYntT4AIRrnGvv0@yilunxu-OptiPlex-7050>
References: <20251001025442.427697-1-chao.gao@intel.com>
 <20251001025442.427697-6-chao.gao@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251001025442.427697-6-chao.gao@intel.com>

> diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
> index 58d890fe2100..6b47383d2958 100644
> --- a/arch/x86/Kconfig
> +++ b/arch/x86/Kconfig
> @@ -1905,6 +1905,16 @@ config INTEL_TDX_HOST
>  
>  	  If unsure, say N.
>  
> +config INTEL_TDX_MODULE_UPDATE
> +	bool "Intel TDX module runtime update"
> +	depends on TDX_HOST_SERVICES
> +	help
> +	  This enables the kernel to support TDX module runtime update. This
> +	  allows the admin to update the TDX module to the same or any newer
> +	  version without the need to terminate running TDX guests.

I'm wondering if it is better to put this option in
drivers/virt/coco/tdx-host. Just as TDX Connect, the
functionalities/uAPIs are exposed in /sys/devices/faux/tdx_host. Better
the 2 features could have aligned config pattern. The TDX Connect
configuration is here:

  https://lore.kernel.org/all/20251117022311.2443900-4-yilun.xu@linux.intel.com/

> +
> +	  If unsure, say N.
> +
>  config EFI
>  	bool "EFI runtime service support"
>  	depends on ACPI
> diff --git a/arch/x86/virt/vmx/tdx/Makefile b/arch/x86/virt/vmx/tdx/Makefile
> index 90da47eb85ee..26aea3531c36 100644
> --- a/arch/x86/virt/vmx/tdx/Makefile
> +++ b/arch/x86/virt/vmx/tdx/Makefile
> @@ -1,2 +1,3 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  obj-y += seamcall.o tdx.o
> +obj-$(CONFIG_INTEL_TDX_MODULE_UPDATE) += seamldr.o

And I'm wondering if we must disable seamldr core helpers if Update
uAPIs are not selected. TDX core now are expected to expose various
helpers for different features and is it necessary we have to mask
in/out all helpers in such a fine granularity? For example we may not
disable tdh_mem_sept_xx() helpers if KVM_INTEL is not selected.

BTW: We may finally get rid of the dependency between KVM_INTEL & TDX_HOST

-----8<-----
diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 80527299f859..e3e90d1fcad3 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -1898,7 +1898,6 @@ config INTEL_TDX_HOST
        bool "Intel Trust Domain Extensions (TDX) host support"
        depends on CPU_SUP_INTEL
        depends on X86_64
-       depends on KVM_INTEL
        depends on X86_X2APIC
        select ARCH_KEEP_MEMBLOCK
        depends on CONTIG_ALLOC

[...]

> +static __maybe_unused int seamldr_call(u64 fn, struct tdx_module_args *args)
> +{
> +	unsigned long flags;
> +	u64 vmcs;
> +	int ret;
> +
> +	if (!is_seamldr_call(fn))
> +		return -EINVAL;
> +
> +	/*
> +	 * SEAMRET from P-SEAMLDR invalidates the current VMCS.  Save/restore
> +	 * the VMCS across P-SEAMLDR SEAMCALLs to avoid clobbering KVM state.
> +	 * Disable interrupts as KVM is allowed to do VMREAD/VMWRITE in IRQ
> +	 * context (but not NMI context).
> +	 */
> +	local_irq_save(flags);
> +
> +	asm goto("1: vmptrst %0\n\t"
> +		 _ASM_EXTABLE(1b, %l[error])
> +		 : "=m" (vmcs) : : "cc" : error);
> +
> +	ret = seamldr_prerr(fn, args);

As I mentioned, just use seamcall_prerr(). This perfectly illustrates the
main difference between normal seamcalls & seamldr_calls - the additional
VMCS handling.

> +
> +	/*
> +	 * Restore the current VMCS pointer.  VMPTSTR "returns" all ones if the
> +	 * current VMCS is invalid.
> +	 */
> +	if (vmcs != -1ULL) {
> +		asm goto("1: vmptrld %0\n\t"
> +			 "jna %l[error]\n\t"
> +			 _ASM_EXTABLE(1b, %l[error])
> +			 : : "m" (vmcs) : "cc" : error);
> +	}
> +
> +	local_irq_restore(flags);
> +	return ret;
> +
> +error:
> +	local_irq_restore(flags);
> +
> +	WARN_ONCE(1, "Failed to save/restore the current VMCS");
> +	return -EIO;
> +}
> -- 
> 2.47.3
> 
