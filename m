Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0844E3009ED
	for <linux-coco@lists.linux.dev>; Wed, 14 Jan 2026 03:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768361180; cv=none; b=lrLmOaDaKzYkAhabyxwbw3HyGp8xgTnmNL7YvwrNxrvBVHKlr2tiJI3oLz3B2Buf55KBjYH0g7ltfvebBF4NMgPnUsfvAjbsGiKUYlJx0Aviho9IiyAm6T39YXdy1TC03oMk5w0fbiuL/tgayxcPNGq9bQzaRMNzx8FOIOMG2zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768361180; c=relaxed/simple;
	bh=lxOp9IoTBlRFOKaGQ01ipRu7SkgDB29+yykug1cJTxg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GLfe6umkmbc50OFG0CTx0oZisZzzQGJAGeg2fzcpDMv1Nz2ECCUQDm40HO+c+O3UQmtG7Gu7xz6nJTKauy9lRVF/YQcpGkpGAnxETRLG282DQxf4phB3Z9poif9mCplRXYujY/pGvoM/7Kk0Tn2+hOpfFsA8N2FpbIZSacxCvxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KayX63+J; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KayX63+J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768361179; x=1799897179;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lxOp9IoTBlRFOKaGQ01ipRu7SkgDB29+yykug1cJTxg=;
  b=KayX63+JtORR5XJ7tl+fG3yOsnlyMCfK2BKvh1LPEPDkwoFHrSorX7+I
   otGICxI822OocWLKBE75VOOjGoZjJZjyfeSEgI5f8qDr0BZaJwgTYb5KK
   6mvt16XU6CxY6mWPPr1GC3aW9l2AKvX8Aq7Us/XRfd6YvG0z5hwdUqTaQ
   i+ck7Eo/08BaRA26Jglkr9sm+VnqUsQtw0Mcd0tHD0jqCUNEgWs7T6HfO
   OpqrhS3E0nguYMz5vh2+w17kVDcHSAIsnwmuG5YCsBj16riHMxwijCiUG
   pcti5EMGaUTbwGDbaESkPrgkZQ+xnJlmz+vc1M31qH5Ebrj6UhVof8m3k
   Q==;
X-CSE-ConnectionGUID: 3bQFghC1SpehxxKpRkecpw==
X-CSE-MsgGUID: nGyk4V+ISWmvguMe0i9Fjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="69741738"
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; 
   d="scan'208";a="69741738"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 19:26:18 -0800
X-CSE-ConnectionGUID: 3VI6egs4QLmju1AVAiwL7w==
X-CSE-MsgGUID: V+Y+whUzRCuZmKKnq6Pt5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; 
   d="scan'208";a="205128222"
Received: from yilunxu-optiplex-7050.sh.intel.com (HELO localhost) ([10.239.159.165])
  by fmviesa010.fm.intel.com with ESMTP; 13 Jan 2026 19:26:13 -0800
Date: Wed, 14 Jan 2026 11:08:39 +0800
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
Subject: Re: [PATCH v2 08/21] coco/tdx-host: Implement FW_UPLOAD sysfs ABI
 for TDX Module updates
Message-ID: <aWcIt9AUMo2N9RKw@yilunxu-OptiPlex-7050>
References: <20251001025442.427697-1-chao.gao@intel.com>
 <20251001025442.427697-9-chao.gao@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251001025442.427697-9-chao.gao@intel.com>

On Tue, Sep 30, 2025 at 07:52:52PM -0700, Chao Gao wrote:
> The firmware upload framework provides a standard mechanism for firmware
> updates by allowing device drivers to expose sysfs interfaces for
> user-initiated updates.
> 
> Register with this framework to expose sysfs interfaces for TDX Module
> updates and implement operations to process data blobs supplied by
> userspace.
> 
> Note that:
> 1. P-SEAMLDR processes the entire update at once rather than
>    chunk-by-chunk, so .write() is called only once per update; so the
>    offset should be always 0.
> 2. TDX Module Updates complete synchronously within .write(), meaning
>    .poll_complete() is only called after successful updates and therefore
>    always returns success
> 
> Why fw_upload instead of request_firmware()?
> ============================================
> The explicit file selection capabilities of fw_upload is preferred over
> the implicit file selection of request_firmware() for the following
> reasons:
> 
> a. Intel distributes all versions of the TDX Module, allowing admins to
> load any version rather than always defaulting to the latest. This
> flexibility is necessary because future extensions may require reverting to
> a previous version to clear fatal errors.
> 
> b. Some module version series are platform-specific. For example, the 1.5.x
> series is for certain platform generations, while the 2.0.x series is
> intended for others.
> 
> c. The update policy for TDX Module updates is non-linear at times. The
> latest TDX Module may not be compatible. For example, TDX Module 1.5.x
> may be updated to 1.5.y but not to 1.5.y+1. This policy is documented
> separately in a file released along with each TDX Module release.
> 
> So, the default policy of "request_firmware()" of "always load latest", is
> not suitable for TDX. Userspace needs to deploy a more sophisticated policy
> check (e.g., latest may not be compatible), and there is potential
> operator choice to consider.
> 
> Just have userspace pick rather than add kernel mechanism to change the
> default policy of request_firmware().
> 
> Signed-off-by: Chao Gao <chao.gao@intel.com>
> Tested-by: Farrah Chen <farrah.chen@intel.com>
> ---
>  arch/x86/Kconfig                      |   2 +
>  arch/x86/include/asm/seamldr.h        |   2 +
>  arch/x86/include/asm/tdx.h            |   5 ++
>  arch/x86/virt/vmx/tdx/seamldr.c       |   7 ++
>  drivers/virt/coco/tdx-host/tdx-host.c | 122 +++++++++++++++++++++++++-
>  5 files changed, 137 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
> index 6b47383d2958..2bf4bb3dfe71 100644
> --- a/arch/x86/Kconfig
> +++ b/arch/x86/Kconfig
> @@ -1908,6 +1908,8 @@ config INTEL_TDX_HOST
>  config INTEL_TDX_MODULE_UPDATE
>  	bool "Intel TDX module runtime update"
>  	depends on TDX_HOST_SERVICES
> +	select FW_LOADER
> +	select FW_UPLOAD
>  	help
>  	  This enables the kernel to support TDX module runtime update. This
>  	  allows the admin to update the TDX module to the same or any newer
> diff --git a/arch/x86/include/asm/seamldr.h b/arch/x86/include/asm/seamldr.h
> index d1e9f6e16e8d..692bde5e9bb4 100644
> --- a/arch/x86/include/asm/seamldr.h
> +++ b/arch/x86/include/asm/seamldr.h
> @@ -20,8 +20,10 @@ struct seamldr_info {
>  
>  #ifdef CONFIG_INTEL_TDX_MODULE_UPDATE
>  const struct seamldr_info *seamldr_get_info(void);
> +int seamldr_install_module(const u8 *data, u32 size);
>  #else
>  static inline const struct seamldr_info *seamldr_get_info(void) { return NULL; }
> +static inline int seamldr_install_module(const u8 *data, u32 size) { return -EOPNOTSUPP; }
>  #endif
>  
>  #endif
> diff --git a/arch/x86/include/asm/tdx.h b/arch/x86/include/asm/tdx.h
> index 7ad026618a23..2422904079a3 100644
> --- a/arch/x86/include/asm/tdx.h
> +++ b/arch/x86/include/asm/tdx.h
> @@ -107,6 +107,11 @@ int tdx_enable(void);
>  const char *tdx_dump_mce_info(struct mce *m);
>  const struct tdx_sys_info *tdx_get_sysinfo(void);
>  
> +static inline bool tdx_supports_runtime_update(const struct tdx_sys_info *sysinfo)
> +{
> +	return false; /* To be enabled when kernel is ready */
> +}
> +
>  int tdx_guest_keyid_alloc(void);
>  u32 tdx_get_nr_guest_keyids(void);
>  void tdx_guest_keyid_free(unsigned int keyid);
> diff --git a/arch/x86/virt/vmx/tdx/seamldr.c b/arch/x86/virt/vmx/tdx/seamldr.c
> index 08c2e3fe6071..69c059194c61 100644
> --- a/arch/x86/virt/vmx/tdx/seamldr.c
> +++ b/arch/x86/virt/vmx/tdx/seamldr.c
> @@ -69,3 +69,10 @@ const struct seamldr_info *seamldr_get_info(void)
>  	return seamldr_call(P_SEAMLDR_INFO, &args) ? NULL : &seamldr_info;
>  }
>  EXPORT_SYMBOL_GPL_FOR_MODULES(seamldr_get_info, "tdx-host");
> +
> +int seamldr_install_module(const u8 *data, u32 size)
> +{
> +	/* TODO: Update TDX Module here */
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL_FOR_MODULES(seamldr_install_module, "tdx-host");
> diff --git a/drivers/virt/coco/tdx-host/tdx-host.c b/drivers/virt/coco/tdx-host/tdx-host.c
> index 42570c5b221b..418e90797689 100644
> --- a/drivers/virt/coco/tdx-host/tdx-host.c
> +++ b/drivers/virt/coco/tdx-host/tdx-host.c
> @@ -10,6 +10,7 @@
>  #include <linux/mod_devicetable.h>
>  #include <linux/sysfs.h>
>  #include <linux/device/faux.h>
> +#include <linux/firmware.h>
>  #include <asm/cpu_device_id.h>
>  #include <asm/seamldr.h>
>  #include <asm/tdx.h>
> @@ -21,6 +22,13 @@ static const struct x86_cpu_id tdx_host_ids[] = {
>  };
>  MODULE_DEVICE_TABLE(x86cpu, tdx_host_ids);
>  
> +struct tdx_fw_upload_status {
> +	bool cancel_request;
> +};
> +
> +struct fw_upload *tdx_fwl;
> +static struct tdx_fw_upload_status tdx_fw_upload_status;
> +
>  static struct faux_device *fdev;

Make the fdev declaration right before tdx_host_init(), try best to keep
the update stuff in one bluk.

[...]

> +static int seamldr_init(struct device *dev)
> +{
> +	const struct seamldr_info *seamldr_info = seamldr_get_info();
> +	const struct tdx_sys_info *tdx_sysinfo = tdx_get_sysinfo();
> +	int ret;
> +
> +	if (!tdx_sysinfo || !seamldr_info)
> +		return -ENXIO;
> +
> +	if (!tdx_supports_runtime_update(tdx_sysinfo)) {
> +		pr_info("Current TDX Module cannot be updated. Consider BIOS updates\n");
> +		return -EOPNOTSUPP;

I don't think we fail out the whole tdx-host here. We should skip the
optional feature if it is not supported to allow other features work.
E.g. the TDX Module version, the P-SEAMLOAD version, TDX Connect.

> +	}
> +
> +	if (!seamldr_info->num_remaining_updates) {
> +		pr_info("P-SEAMLDR doesn't support TDX Module updates\n");
> +		return -EOPNOTSUPP;
> +	}

Ditto. And keeping num_remaining_updates sysfs node visible and returning 0
is valuable, it clearly tells why update is impossible and aligns with
the situation when the user keeps on updating and exhausts the available
updates.

> +
> +	tdx_fwl = firmware_upload_register(THIS_MODULE, dev, "seamldr_upload",
> +					   &tdx_fw_ops, &tdx_fw_upload_status);
> +	ret = PTR_ERR_OR_ZERO(tdx_fwl);
> +	if (ret)
> +		pr_err("failed to register module uploader %d\n", ret);
> +
> +	return ret;
> +}
