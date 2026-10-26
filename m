Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792980439;
	b=aJdXBQQ4KbkpwUDNhwtSeyxTfkhNBzMh3Y74Oqcbj8XPdWjL3SIYVNPaW+t24rD7DsLp
	 uaCKgI7+Ff97qAxe7X1lEflj5oY46xUH6SRKdLp6BX0lcT7QUjsKAOHweKWp7JH2FGfmk
	 M+qiT1OxnjPM8X+SabDdECa+S84jN4yuBzYp2z6ngIFcjGxIm7QkdvCfmOeflrWiXdku+
	 EfzqCjAGWcK1HExyp/ruoGjc3C+wagWvb+u4AyS+ZVTdTFH8SOSMyJJiEw/ajHBO9u8Ls
	 cO3AdZiya3f0hqwGfun4ArKglLINP1svazzC3RAh1LjvCdSphbaKlg4y2pEXPbuqM9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792980439;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=+RLvVOkXKlonAki+/AlKB2VSZdJqNFpXfIr0AQZXeJ8=;
	b=a3RVq9ixWsPD5yEKZ+MUEfWkEqDNraK1zPiw1a2O5md00nYHY9GpdPoQbnY3VMrMb+79
	 Pk527wCXSitQqL5imVSGcBByBU848YvpjSjAKQIl9STzWqDbbYROzG7tuEEVG2NjvZMg1
	 C1rTTFEpz4e6oLE6VL8fUucgcV3rkgcoHBoGmMEWFvlEklNGi4ekAvppcNP5cKMiKwXyk
	 EO0QkCJbLecZOfB03p0HGASF7/RrXq09exdKZ1JDuY3vO2eOji4/jY0oFw2jW1F2EQhCQ
	 5r3qcU8QuGN6udFNFNCSbM8zr1m/OQvnVUWPKpr5KoD2cUSLEE9nNYM5cLu9S9Igyig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jvR7up6h;
	arc=none smtp.remote-ip=198.175.65.11
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACB0D606A31B
	for <linux-coco@lists.linux.dev>; Mon, 26 Oct 2026 02:07:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ACB0D606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jvR7up6h
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792980438; x=1824516438;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=UbH39Nzis7IQ4u7GZ8WUe++P7dmeAdae6e8WWwZCX9A=;
  b=jvR7up6h11/MGlPmyQL/P3Aq3wRNY4fq1UItt3XRgN4nLgsyvTORkWbd
   udmBLG9fs/FttiXI0MsX5Irrg4Kr+KzqH2M+oIBqYpcxWyI7SjFmC7GlS
   ToD7JVLOSPkyq8wsZvJ14xpPYI0VMPhcSNUi0KRtPlxpplDefFnjfUgtx
   dV48YlzBEW4j4J6T0XQ5K4aBbEqTuqdoaFTEFAtX09k7IA1yCvT97ZLwn
   vTiPfuoOBDP2z3+ds9iYgR/5GBGm4hMa3ojejsW0GKutIRqD2JkdZ5ykd
   BKofJJ6JYcUJwApIUdjrqiwxiqPyBpO02dRU86chtyMG+LTZ9kXm5/Sd6
   w==;
X-CSE-ConnectionGUID: HfBObhsrSE+VLsWNNrkdhg==
X-CSE-MsgGUID: I/ZTd6XoQUqxfy9nJGgQ3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11946"; a="1525137"
X-IronPort-AV: E=Sophos;i="6.27,178,1787036400"; 
   d="scan'208";a="1525137"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2026 19:07:09 -0700
X-CSE-ConnectionGUID: 96XTXhBcTkWcPAMaSclZyA==
X-CSE-MsgGUID: n5dBZ9JrRw21hKbr80YZyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,178,1787036400"; 
   d="scan'208";a="4045467"
Received: from unknown (HELO [10.238.0.97]) ([10.238.0.97])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2026 19:06:47 -0700
Message-ID: <1b28a8e8-7836-463f-a2a5-129a1dba5b12@intel.com>
Date: Mon, 26 Oct 2026 10:06:45 +0800
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
Subject: Re: [RFC PATCH 05/15] virt: tdx-guest: Add TDCM helpers and TEE-IO
 support check
To: Zhenzhong Duan <zhenzhong.duan@intel.com>, x86@kernel.org,
 linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: dave.hansen@linux.intel.com, tglx@kernel.org, mingo@redhat.com,
 bp@alien8.de, hpa@zytor.com, dave.hansen@intel.com, kas@kernel.org,
 rick.p.edgecombe@intel.com, jgg@nvidia.com, nicolinc@nvidia.com,
 aik@amd.com, aneesh.kumar@kernel.org, seanjc@google.com,
 pbonzini@redhat.com, yilun.xu@linux.intel.com, chao.gao@intel.com,
 vishal.l.verma@intel.com, kevin.tian@intel.com, chao.p.peng@intel.com
References: <20260924041032.1096569-1-zhenzhong.duan@intel.com>
 <20260924041032.1096569-6-zhenzhong.duan@intel.com>
Content-Language: en-US
From: Xiaoyao Li <xiaoyao.li@intel.com>
In-Reply-To: <20260924041032.1096569-6-zhenzhong.duan@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/24/2026 12:10 PM, Zhenzhong Duan wrote:
> Implement internal helper wrappers tdx_tdcm_alloc(), tdx_tdcm_run(),
> and tdx_tdcm_free() to manage execution context lifecycle for TDX Connect
> TEE-IO Device Control and Management (TDCM) commands.
> 
> Use these infrastructures to deploy all TDCM commands to orchestrate
> trusted device management, beginning with the first command,
> TDCM_OP_CHECK_TEEIO_SUPP, executed during the secure device locking
> sequence.

I think it needs to be split into 2 patches:
- implement tdx_tdcm_* and justify why poll mode in chosen instread of notification.

- Add TDCM_OP_CHECK_TEEIO_SUPP check to tdx_devsec_lock(). We need explain what
it does, why we need it, and why it needs to be in tdx_devsec_lock() as the
first step.

> Signed-off-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
> ---
>  arch/x86/include/asm/tdx.h            |  48 +++++++++
>  drivers/virt/coco/tdx-guest/connect.c | 139 ++++++++++++++++++++++++++
>  2 files changed, 187 insertions(+)
> 
> diff --git a/arch/x86/include/asm/tdx.h b/arch/x86/include/asm/tdx.h
> index 4937e23d5483..71cd701d346f 100644
> --- a/arch/x86/include/asm/tdx.h
> +++ b/arch/x86/include/asm/tdx.h
> @@ -105,6 +105,54 @@ int tdx_mcall_extend_rtmr(u8 index, u8 *data);
>  u64 tdx_hcall_get_quote(u8 *buf, size_t size);
>  
>  #ifdef CONFIG_TDX_CONNECT_GUEST
> +enum tdcm_operation {
> +	TDCM_OP_CHECK_TEEIO_SUPP	= 1,
> +	TDCM_OP_BIND			= 2,
> +	TDCM_OP_GET_DEV_INFO		= 3,
> +	TDCM_OP_GET_TDI_REPORT		= 4,
> +	TDCM_OP_START_TDI		= 5,
> +	TDCM_OP_GET_TDI_STATE		= 6,
> +	TDCM_OP_UNBIND			= 7,
> +};
> +
> +enum tdcm_status {
> +	TDCM_STATUS_WAIT		= 0,
> +	TDCM_STATUS_COMPLETED		= 1,
> +	TDCM_STATUS_ERROR		= 2,
> +};
> +
> +enum tdcm_error {
> +	TDCM_ERROR_TDX_MODULE		= 10,
> +	TDCM_ERROR_TDXIO_DEVICE		= 11,
> +	TDCM_ERROR_SPDM_MESSAGE		= 12,
> +	TDCM_ERROR_IDE_KM_MESSAGE	= 13,
> +	TDCM_ERROR_TDISP_MESSAGE	= 14,
> +	TDCM_ERROR_INVALID_STATE	= 15,

why not naming them TDCM_xxx_ERROR as GHCI definitions?

TDCM_ERROR_TDX_MODULE reads like lacking some information at the end. For
example, it can be TDCM_ERROR_TDX_MODULE_DURING_UPDATE.

> +};
> +
> +struct tdvmcall_tdcm {
> +	__u16 operation;  /* See enum tdcm_operation */
> +	__u8  version;
> +	__u8  rsvd0;
> +	__u32 rsvd1;
> +
> +	__u8  status;     /* See enum tdcm_status */
> +	__u8  error;      /* See enum tdcm_error */
> +	__u16 rsvd2;
> +	__u32 rsvd3;
> +
> +	__u32 data_length;
> +
> +	__u8  data[];
> +} __packed;
> +
> +struct tdcm_rsp_check_teeio_supp {
> +	__u8 is_supported;
> +	__u8  data[];

since data is not used in tdx_is_dev_teeio_support(), is it really needed?

> +} __packed;
> +
> +#define MAX_TDI_REPORT_SIZE	(16 * PAGE_SIZE)

Add some info in the changelog of where the 16 comes?

>  u64 tdx_hcall_tdcm(u16 devid, void *buf, size_t size, u8 vector);
>  int tdx_mcall_tdi_read(u64 func_id, u64 field, u64 *value);
>  #endif
> diff --git a/drivers/virt/coco/tdx-guest/connect.c b/drivers/virt/coco/tdx-guest/connect.c
> index 80ae7c19e179..1f52a187b30f 100644
> --- a/drivers/virt/coco/tdx-guest/connect.c
> +++ b/drivers/virt/coco/tdx-guest/connect.c
> @@ -7,13 +7,127 @@
>  
>  #define pr_fmt(fmt)		KBUILD_MODNAME ": tdx_connect: " fmt
>  
> +#include <linux/iopoll.h>
>  #include <linux/pci.h>
>  #include <linux/pci-tsm.h>
> +#include <linux/set_memory.h>
>  #include <linux/tsm.h>
>  #include <asm/tdx.h>
>  
>  #include "tdx-guest.h"
>  
> +/**
> + * struct tdcm_ctx - TEE-IO Device Configuration and Management (TDCM) context
> + * @buf: Pointer to 4KB-aligned shared memory (>= one page) used as the command
> + *       buffer on input and the response buffer on output.
> + * @buf_size: Total size of the shared memory buffer.
> + * @max_rsp_data_sz: Maximum expected size of the response data.
> + * @rsp_data_sz: Actual size of the response data populated by the VMM.
> + * @devid: Device Identifier.

As I commented in patch 3, can we add more info of devid. What is it supposed to be?

