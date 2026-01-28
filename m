Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AF22227BB5
	for <linux-coco@lists.linux.dev>; Wed, 28 Jan 2026 03:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769570698; cv=none; b=KkiOsHPNLvGX6VAl7aFgSPp2MZ/Fwa6b8TA+HMAeXDJAGS1TD7nVQ/04RebPl9iNVyYJHzBQlruItr3tZet9dO6vh/K4tJJSZZcNGkgxCpOmUBPR2RmQgZtfY3y6IwRbCL2jSNCkSqjD6fGxnq7M2vYCqDRILQTWdavfi00M58s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769570698; c=relaxed/simple;
	bh=UaU2wUKDMyehkRl6zgzDMweY+3gos4+RMGZ7pfmkZzk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bQ4PK6wMz0U9bT6TF6kTD8AF0+m4Mbb4Fyo34xzIaSrFG+T1RAMPBhBLbO/L9MHaAriVNJmA67xOa0oAg3gt9Ioehxv//nILLSDM1AI8RLIEPUnzDNletXgDAm6hxavsVDflY4L7LjURDkvXbRT7u4Judlnw+NUgEcd/0ZpEjFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fYEU9xW/; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fYEU9xW/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769570696; x=1801106696;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=UaU2wUKDMyehkRl6zgzDMweY+3gos4+RMGZ7pfmkZzk=;
  b=fYEU9xW/dEOu6m3Q0B//TrSgoQGindW1JycXAjp6JqtSWzcpWEIPp71n
   IcZBIjZVzfu+EzzWgX/SHi0tdf8bHKeH5Iw8j0DofxXoVZ8XS1IDFzEfR
   w95CWpJvbD5biyiIdnr4g32vqBSvxpShhaRBxMgm7rTdzXzCax87VhD1r
   e1mBnpOjajvDq/ypTBys3yi67mHj1Eh+v6TpRAM0318l7FGw6l0HA6aTS
   TVWjau28FTKOz5OEQYDgZQ8h/IPNx6P/ytC5BlHWfImH/reCv1ARYciCJ
   bJ8XvV/44G30cDczKA8AW57A3khqjJjJt570+DGo9PZBr1F85t0Wn/AgN
   Q==;
X-CSE-ConnectionGUID: IkIuLo+zQ8m2M6SMRpNBqw==
X-CSE-MsgGUID: f7fsx2ktSPqzWkvpuXZDhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="74624258"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="74624258"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 19:24:56 -0800
X-CSE-ConnectionGUID: jjVdla45T7aEIAbI8c/FwA==
X-CSE-MsgGUID: 6oEjP+k+T2WHi3nX68Ifmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="207769469"
Received: from unknown (HELO [10.238.1.231]) ([10.238.1.231])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 19:24:50 -0800
Message-ID: <2db22e08-88cd-4873-9645-a2e17af29220@linux.intel.com>
Date: Wed, 28 Jan 2026 11:24:48 +0800
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/26] coco/tdx-host: Introduce a "tdx_host" device
To: Chao Gao <chao.gao@intel.com>
Cc: linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org,
 kvm@vger.kernel.org, x86@kernel.org, reinette.chatre@intel.com,
 ira.weiny@intel.com, kai.huang@intel.com, dan.j.williams@intel.com,
 yilun.xu@linux.intel.com, sagis@google.com, vannapurve@google.com,
 paulmck@kernel.org, nik.borisov@suse.com, zhenzhong.duan@intel.com,
 seanjc@google.com, rick.p.edgecombe@intel.com, kas@kernel.org,
 dave.hansen@linux.intel.com, vishal.l.verma@intel.com,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>
References: <20260123145645.90444-1-chao.gao@intel.com>
 <20260123145645.90444-5-chao.gao@intel.com>
Content-Language: en-US
From: Binbin Wu <binbin.wu@linux.intel.com>
In-Reply-To: <20260123145645.90444-5-chao.gao@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 1/23/2026 10:55 PM, Chao Gao wrote:
[...]
> diff --git a/drivers/virt/coco/Kconfig b/drivers/virt/coco/Kconfig
> index df1cfaf26c65..f7691f64fbe3 100644
> --- a/drivers/virt/coco/Kconfig
> +++ b/drivers/virt/coco/Kconfig
> @@ -17,5 +17,7 @@ source "drivers/virt/coco/arm-cca-guest/Kconfig"
>  source "drivers/virt/coco/guest/Kconfig"
>  endif
>  
> +source "drivers/virt/coco/tdx-host/Kconfig"
> +
>  config TSM
>  	bool
> diff --git a/drivers/virt/coco/Makefile b/drivers/virt/coco/Makefile
> index cb52021912b3..b323b0ae4f82 100644
> --- a/drivers/virt/coco/Makefile
> +++ b/drivers/virt/coco/Makefile
> @@ -6,6 +6,7 @@ obj-$(CONFIG_EFI_SECRET)	+= efi_secret/
>  obj-$(CONFIG_ARM_PKVM_GUEST)	+= pkvm-guest/
>  obj-$(CONFIG_SEV_GUEST)		+= sev-guest/
>  obj-$(CONFIG_INTEL_TDX_GUEST)	+= tdx-guest/
> +obj-$(CONFIG_INTEL_TDX_HOST)	+= tdx-host/

IIUC, the folder name "tdx-host" here stands for TDX host services?
Should it use CONFIG_TDX_HOST_SERVICES here?

>  obj-$(CONFIG_ARM_CCA_GUEST)	+= arm-cca-guest/
>  obj-$(CONFIG_TSM) 		+= tsm-core.o
>  obj-$(CONFIG_TSM_GUEST)		+= guest/
> diff --git a/drivers/virt/coco/tdx-host/Kconfig b/drivers/virt/coco/tdx-host/Kconfig
> new file mode 100644
> index 000000000000..e58bad148a35
> --- /dev/null
> +++ b/drivers/virt/coco/tdx-host/Kconfig
> @@ -0,0 +1,10 @@
> +config TDX_HOST_SERVICES
> +	tristate "TDX Host Services Driver"
> +	depends on INTEL_TDX_HOST
> +	default m
> +	help
> +	  Enable access to TDX host services like module update and
> +	  extensions (e.g. TDX Connect).
> +
> +	  Say y or m if enabling support for confidential virtual machine
> +	  support (CONFIG_INTEL_TDX_HOST). The module is called tdx_host.ko
> diff --git a/drivers/virt/coco/tdx-host/Makefile b/drivers/virt/coco/tdx-host/Makefile
> new file mode 100644
> index 000000000000..e61e749a8dff
> --- /dev/null
> +++ b/drivers/virt/coco/tdx-host/Makefile
> @@ -0,0 +1 @@
> +obj-$(CONFIG_TDX_HOST_SERVICES) += tdx-host.o
> diff --git a/drivers/virt/coco/tdx-host/tdx-host.c b/drivers/virt/coco/tdx-host/tdx-host.c
> new file mode 100644
> index 000000000000..c77885392b09
> --- /dev/null
> +++ b/drivers/virt/coco/tdx-host/tdx-host.c
> @@ -0,0 +1,43 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * TDX host user interface driver
> + *
> + * Copyright (C) 2025 Intel Corporation

Nit:
Update the year to 2026?


