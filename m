Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792977136;
	b=SoEB6trWL/c+9aoKq3j8ojnTXzyd648gQYhaOOYju5WaVS5Dof6eNp2urdx8TUFvj/vh
	 gmrVk06nBvgWnW6L2VXi0Oqhnh1B68M9bVfkvAk8FMdMXVsb/et/EhEsF9MDhNROYOcKD
	 H/2dpcrH573VIpBLIUezIWYCrhKxJgsoZ2O+vQMXybsK+lJMZY1wSmE9/d/89ZUuZSlv9
	 866W+wpi6X+dvBXWCTTOjAFwbuyIMXdg6wlfrA5vuQp1Clu9IzVhHzlqOxNrHeEy/cVBB
	 aVUcBcZncDgazRNjbJSbed7Xwm/1+U/UU/9ijtEbZkgeYgJvqKoopVmklnvwadASjMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792977136;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=3X51DrL+h3p2iTcU0G73FAwwj+hmcogr8rUVwNWHjjY=;
	b=s0Cg1NUk7U5qTqg037yZ9KEJD72ZWO5XSpSV6ZcEmyM2yI/kWDd4TFJDo6A3QcsN1AbK
	 6qovuNXViVysD246HGsr3hQJDCFLg9T8UfW7126dIh+5oBrgYEj5iGc3GJeqY1iDlcsrv
	 I9R7GW2Dc5AcJ3RMfgiYfgEpdi2o7+tijzBnZGmNUKyIW118kjOg5J7ZO1jPmaRbV/wyM
	 Df2A/WU54OqGRyXd0v3i9yxufc3i9R6/b4sDzy2+jUzqqFUOC1gE6SyBwK8l3Eeub2FtD
	 SjWtjlusQOEeV05U5QB+9S/9uv3QQRZ/CLIZoBP+KOFNgwcYS8unh4oDWrfYjDou6AQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="B/qOaqfh";
	arc=none smtp.remote-ip=198.175.65.10
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38C0F606A31B
	for <linux-coco@lists.linux.dev>; Mon, 26 Oct 2026 01:12:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38C0F606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=B/qOaqfh
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792977136; x=1824513136;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=7vxOB6c1LDsjNrFUi3kDjbYiRM3DXA8ZtuHRDPgm3SM=;
  b=B/qOaqfhlT/rcCg5wgww2PHvFKFimcpmRHv6GmhDx7nlV9Vi6mZ7rJg6
   BhqFW+piXTkT1emPI6DJ8e+fXdvIS6wMh6Zq0Au8ne+9OfJ77hM5v+70U
   aT7+O9WgPH5srdH1qn7q8oblSYBSlKMVa2dHcO8xvSaA/KHdiQtZ8IZQm
   rPeNXLCElbLn82UDuu5gwW329FXp5XcvUVGN5xz5M6X2JiAi3ApDLK2Xd
   K7JQZ1htsW1Ti+k95psszLNSxHbS5OPmXRgrZcDVnRNvCmqNyHM0RVJkK
   27prLFR15wCiQDr9JVMpdjR+9k1g3SqcJSFlSGbXL6WSJ58bBKgxQew2A
   Q==;
X-CSE-ConnectionGUID: m8R+kehNT1y0lCnlJDqBcQ==
X-CSE-MsgGUID: fk6HtGS6TXqr2EytGTLuTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11946"; a="1524178"
X-IronPort-AV: E=Sophos;i="6.27,178,1787036400"; 
   d="scan'208";a="1524178"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2026 18:12:15 -0700
X-CSE-ConnectionGUID: Bft3j/rkRm66jbfs8CYX4w==
X-CSE-MsgGUID: Sm1CsZSSRFq8qP9e2dp39Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,178,1787036400"; 
   d="scan'208";a="4182616"
Received: from unknown (HELO [10.238.0.97]) ([10.238.0.97])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2026 18:12:09 -0700
Message-ID: <59b997ce-f5b9-4a3b-9de8-91533289bfe7@intel.com>
Date: Mon, 26 Oct 2026 09:12:07 +0800
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Post: <mailto:linux-coco@lists.linux.dev>
List-Help: <mailto:linux-coco+help@lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-coco+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 04/15] virt: tdx-guest: Support devsec TSM for secure
 devices
To: Zhenzhong Duan <zhenzhong.duan@intel.com>, x86@kernel.org,
 linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: dave.hansen@linux.intel.com, tglx@kernel.org, mingo@redhat.com,
 bp@alien8.de, hpa@zytor.com, dave.hansen@intel.com, kas@kernel.org,
 rick.p.edgecombe@intel.com, jgg@nvidia.com, nicolinc@nvidia.com,
 aik@amd.com, aneesh.kumar@kernel.org, seanjc@google.com,
 pbonzini@redhat.com, yilun.xu@linux.intel.com, chao.gao@intel.com,
 vishal.l.verma@intel.com, kevin.tian@intel.com, chao.p.peng@intel.com
References: <20260924041032.1096569-1-zhenzhong.duan@intel.com>
 <20260924041032.1096569-5-zhenzhong.duan@intel.com>
Content-Language: en-US
From: Xiaoyao Li <xiaoyao.li@intel.com>
In-Reply-To: <20260924041032.1096569-5-zhenzhong.duan@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/24/2026 12:10 PM, Zhenzhong Duan wrote:
> Register Intel TDX secure device (devsec TSM) to the TSM framework and
> supply the tdx_devsec_ops callback operations. This enables control and
> management of the Trust Device Interface (TDI) through those hooks in
> accordance with the TDISP protocol.

It only implements the placeholders for these hooks. Please state them accurately.

> Check the TDCS configuration flags during driver initialization to
> ensure the hardware interface is supported before attempting device
> registration.
> 
> Signed-off-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
> ---
>  arch/x86/include/asm/shared/tdx.h             |  1 +
>  drivers/virt/coco/tdx-guest/Kconfig           | 15 ++++
>  drivers/virt/coco/tdx-guest/Makefile          |  3 +
>  drivers/virt/coco/tdx-guest/connect.c         | 81 +++++++++++++++++++
>  .../coco/tdx-guest/{tdx-guest.c => main.c}    |  6 ++
>  drivers/virt/coco/tdx-guest/tdx-guest.h       | 20 +++++
>  6 files changed, 126 insertions(+)
>  create mode 100644 drivers/virt/coco/tdx-guest/connect.c
>  rename drivers/virt/coco/tdx-guest/{tdx-guest.c => main.c} (98%)
>  create mode 100644 drivers/virt/coco/tdx-guest/tdx-guest.h
> 
> diff --git a/arch/x86/include/asm/shared/tdx.h b/arch/x86/include/asm/shared/tdx.h
> index 665c12925ff6..499103f7a01b 100644
> --- a/arch/x86/include/asm/shared/tdx.h
> +++ b/arch/x86/include/asm/shared/tdx.h
> @@ -56,6 +56,7 @@
>  
>  /* TDCS_CONFIG_FLAGS bits */
>  #define TDCS_CONFIG_FLEXIBLE_PENDING_VE	BIT_ULL(1)
> +#define TDCS_CONFIG_TDX_CONNECT		BIT_ULL(5)
>  
>  /* TDCS_TD_CTLS bits */
>  #define TD_CTLS_PENDING_VE_DISABLE_BIT	0
> diff --git a/drivers/virt/coco/tdx-guest/Kconfig b/drivers/virt/coco/tdx-guest/Kconfig
> index dbbdc14383b1..2e9407f8bc70 100644
> --- a/drivers/virt/coco/tdx-guest/Kconfig
> +++ b/drivers/virt/coco/tdx-guest/Kconfig
> @@ -10,3 +10,18 @@ config TDX_GUEST_DRIVER
>  
>  	  To compile this driver as module, choose M here. The module will
>  	  be called tdx-guest.
> +
> +config TDX_CONNECT_GUEST
> +	bool "Intel TDX Connect Guest Support"
> +	depends on TDX_GUEST_DRIVER

maybe select TDX_GUEST_DRIVER ?

> +	depends on PCI_TSM
> +	default y
> +	help
> +	  Support Trust Device Interface (TDI) feature enumeration,
> +	  validation, and activation within an Intel TDX guest.
> +
> +	  This option enables the guest kernel to establish secure,
> +	  isolated connections with trusted devices assigned to the TD,
> +	  validating MMIO maps and authorizing DMA remapping tables.
> +
> +	  If unsure, say Y.
> diff --git a/drivers/virt/coco/tdx-guest/Makefile b/drivers/virt/coco/tdx-guest/Makefile
> index 775cb463f9c8..cfa991c7aeb5 100644
> --- a/drivers/virt/coco/tdx-guest/Makefile
> +++ b/drivers/virt/coco/tdx-guest/Makefile
> @@ -1,2 +1,5 @@
>  # SPDX-License-Identifier: GPL-2.0
>  obj-$(CONFIG_TDX_GUEST_DRIVER) += tdx-guest.o
> +
> +tdx-guest-y := main.o
> +tdx-guest-$(CONFIG_TDX_CONNECT_GUEST) += connect.o
> diff --git a/drivers/virt/coco/tdx-guest/connect.c b/drivers/virt/coco/tdx-guest/connect.c
> new file mode 100644
> index 000000000000..80ae7c19e179
> --- /dev/null
> +++ b/drivers/virt/coco/tdx-guest/connect.c
> @@ -0,0 +1,81 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * TDX Connect guest driver
> + *
> + * Copyright (C) 2026 Intel Corporation
> + */
> +
> +#define pr_fmt(fmt)		KBUILD_MODNAME ": tdx_connect: " fmt
> +
> +#include <linux/pci.h>
> +#include <linux/pci-tsm.h>
> +#include <linux/tsm.h>
> +#include <asm/tdx.h>
> +
> +#include "tdx-guest.h"
> +
> +struct tdx_devsec {
> +	struct pci_tsm_devsec pci;
> +};
> +
> +static struct tdx_devsec *to_tdx_devsec(struct pci_tsm *tsm)
> +{
> +	return container_of(tsm, struct tdx_devsec, pci.base_tsm);
> +}
> +
> +static struct pci_tsm *tdx_devsec_lock(struct tsm_dev *tsm_dev, struct pci_dev *pdev)
> +{
> +	int ret;
> +
> +	struct tdx_devsec *tdevsec __free(kfree) = kzalloc(sizeof(*tdevsec), GFP_KERNEL);
> +	if (!tdevsec)
> +		return ERR_PTR(-ENOMEM);
> +
> +	ret = pci_tsm_devsec_constructor(pdev, &tdevsec->pci, tsm_dev);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
> +	return &no_free_ptr(tdevsec)->pci.base_tsm;
> +}
> +
> +static void tdx_devsec_unlock(struct pci_tsm *tsm)
> +{
> +	struct tdx_devsec *tdevsec = to_tdx_devsec(tsm);
> +
> +	kfree(tdevsec);
> +}
> +
> +static int tdx_devsec_run(struct pci_dev *pdev)
> +{
> +	return -EOPNOTSUPP;
> +}
> +
> +static struct pci_tsm_ops tdx_devsec_ops = {
> +	.lock = tdx_devsec_lock,
> +	.unlock = tdx_devsec_unlock,
> +	.run = tdx_devsec_run,
> +};
> +
> +static void devsec_tsm_remove(void *tsm_dev)
> +{
> +	tsm_unregister(tsm_dev);
> +}
> +
> +int tdx_connect_init(struct device *dev)
> +{
> +	struct tsm_dev *tsm_dev;
> +	u64 config, ret;
> +
> +	ret = tdg_vm_rd(TDCS_CONFIG_FLAGS, &config);
> +	if (ret)
> +		return -EIO;

The kernel already manadates and assumes TDCS_CONFIG_FLAGS is always supported
in disable_sept_ve().

Can we make them consistent? Maybe just treat config as 0 when reading
TDCS_CONFIG_FLAGS fails?

> +
> +	if (!(config & TDCS_CONFIG_TDX_CONNECT))
> +		return 0;
> +
> +	tsm_dev = tsm_register(dev, &tdx_devsec_ops);
> +	if (IS_ERR(tsm_dev))
> +		return PTR_ERR(tsm_dev);
> +
> +	return devm_add_action_or_reset(dev, devsec_tsm_remove, tsm_dev);
> +}
> diff --git a/drivers/virt/coco/tdx-guest/tdx-guest.c b/drivers/virt/coco/tdx-guest/main.c
> similarity index 98%
> rename from drivers/virt/coco/tdx-guest/tdx-guest.c
> rename to drivers/virt/coco/tdx-guest/main.c
> index d0303e31e816..801a1f2b5f3d 100644
> --- a/drivers/virt/coco/tdx-guest/tdx-guest.c
> +++ b/drivers/virt/coco/tdx-guest/main.c
> @@ -25,6 +25,8 @@
>  #include <asm/cpu_device_id.h>
>  #include <asm/tdx.h>
>  
> +#include "tdx-guest.h"
> +
>  /* TDREPORT buffer */
>  static u8 *tdx_report_buf;
>  
> @@ -428,6 +430,10 @@ static int __init tdx_guest_init(void)
>  	if (ret)
>  		goto free_quote;
>  
> +	ret = tdx_connect_init(tdx_misc_dev.this_device);
> +	if (ret)
> +		pr_warn("Failed to enable TDX Connect: %d\n", ret);
> +
>  	return 0;
>  
>  free_quote:
> diff --git a/drivers/virt/coco/tdx-guest/tdx-guest.h b/drivers/virt/coco/tdx-guest/tdx-guest.h
> new file mode 100644
> index 000000000000..4218541c7f3b
> --- /dev/null
> +++ b/drivers/virt/coco/tdx-guest/tdx-guest.h
> @@ -0,0 +1,20 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * TDX guest driver private declarations
> + *
> + * Copyright (C) 2026 Intel Corporation
> + */
> +
> +#ifndef __TDX_GUEST_H
> +#define __TDX_GUEST_H
> +
> +#include <linux/kernel.h>
> +#include <linux/device.h>
> +
> +#ifdef CONFIG_TDX_CONNECT_GUEST
> +extern int tdx_connect_init(struct device *dev);

extern is not needed.

> +#else
> +static inline int tdx_connect_init(struct device *dev) { return 0; }
> +#endif /* CONFIG_TDX_CONNECT_GUEST */
> +
> +#endif /* __TDX_GUEST_H */

