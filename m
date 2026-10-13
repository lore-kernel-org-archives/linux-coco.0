Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B6713FE348
	for <linux-coco@lists.linux.dev>; Tue, 13 Oct 2026 14:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791901917; cv=none; b=OPJLBQgRh7SQzmn6flUm4si2qual5P9JyjFFHwAoV+Kyg+PCPieoy3rKaUTh6v84ElTLCTVIVExZOclatb4IOhpboKpmC47o/f2LAP9FVlMwHER+fwB/z+kbo1iozQdjboonyBva0lOhh1no2YQiDf43BIgdyTxR1/WSoR5A44U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791901917; c=relaxed/simple;
	bh=Dn5YJ6fUeXM2FMyfRjq3GBx9DkfrtijKmNqEKmlSCtM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b8+U5njSi3raYIXPE7ux98estN9hS90KgpNqMDULyuG5SDqPx56Cjd6iyeDlNbyOQmDEdyeYJLifGzxaX6uFRo4Y3BAdvbN+FElYUrQ/86+WE8D+Ya2+Tq3/+0vOMZYrUqKQDrb56vYXFOC57g5mhrCqCjYcquflN0qi3sZTfbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=DG6j8PdH; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="DG6j8PdH"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-49ff680331aso26456425e9.3
        for <linux-coco@lists.linux.dev>; Tue, 13 Oct 2026 07:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1791901911; x=1792506711; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Nqy2u8JCfPcvEmUb25Y46fO++lcBUW0oicQeVhEHWMM=;
        b=DG6j8PdHD27xSJs4Sy0j0dUNVB4zQA+YAJImHYEbbZVj9LEM8R/aOBMS1Vn+s4daq/
         Aw1XxOiI5zP4DSmm/LfTGcGkouhYkfcAoHCWikTtwEpnwbDhJSxxstWrw3WS0MghO8ye
         /BTPQteXlhwSeFF749n2rYR0whABuNdcua1ElgFlIufi4g9MDLto1qy9Yetb6S1c9vJF
         YFnZ81Ztty8ENfG2DgM94cB9+XRoPrZL6l+o+m8nOLJRLH4n7ccVH6h+Bd1iQHgbYX7i
         0s5dh3tQjC5BWJ3fXKqb4lISHD1D+602ymClz7JwnLtq6R2I1n4uv3h3WY/wm8JCA25g
         bQRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791901911; x=1792506711;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Nqy2u8JCfPcvEmUb25Y46fO++lcBUW0oicQeVhEHWMM=;
        b=OI6sXQLcAh/mLtuuY3d1PX5cTzvH19hDFPD/z19yXv0CBnOl706JXwqK2lFkMSc5ku
         xvAnL3VVUuJGviqhWiCKM9qgZEMw3du5RRijfKlqEpIvlW2Snw98fjiNzgUotn6lXxrk
         2xcUlti+i5gDgibtB1qMWSU0Ya41BdO9r1nQk6emmGtW30R2YEkC/VDaKbrW7fMrjQMt
         qAQtWAHn521BnJipL1Kp7wzpDh4eK/wtwO2y/2sUZohFQJMRZPx7yMvrf/v3Ash5ak/E
         grXXRHpPLpioF5/lBPRo7HxtLh3xzvoJYQN0DFyvp+zuBSzEj275VrfiDDpwdI87OkeB
         zzgQ==
X-Forwarded-Encrypted: i=1; AKwUvBzjDKdI3zsa471Gu7uL8XDDo3Tha53ujKcYL/Hcq7d/ah19/K33Tjzc6XuGoV2p17darldnLC/gTpvp@lists.linux.dev
X-Gm-Message-State: AFq9FYI8rgpXYPlrvp9PxShe9/QnygBrigbHKWfvo02m8/PzLSrNi7lC
	CImNnP5oIEKOGYXASeArXPdkLiLLWS2ajwRz71OGlwuWhkgYWseedfm0t2q+YyOXQI4=
X-Gm-Gg: AYBFou3bAJsZqMzG9QlrSeXDaJCxoKTjbJ4see47E+vpVuTd3QY7XXMrX400cLRutZa
	s4KLMQaxtztqIRVukoA9i7D5LNSSYXtJJm7j1WgkdXe7LW1Xof8yy+2TVyfo295EuRQWZ+LA+QS
	qUa/RT1lz6E8tk81oqU2PufoE02qdvRgwTDWWgAzhPx7sC3ZKWh73SKLPodG/5vx3h4p9YI7Oje
	MBL50ShOZRSekxlQ2nweIRQTP7GPO5WRAkUxMCynj9F3Pbentx8ig2KofKGZQvk740jGHwY/TRQ
	XTLPxQyvM2skbEML36OxR41eo6gDWzXKlAwXQIUGVccMBBqjADDvzm4ra9+ztjWdd0XKPU9OMrx
	ood3II5PIECbx1zfth3LshXaI40z6X97ZqU6L/3VonwMpOEwwEH+u+wQEQICGkVHnPVWLNXH1rw
	pY2lEAFHGY6OK+1b69xkp+n+0yR3kvwUwDRWLL6mT7zE3WP/OoplPir2x1xL2q/9my6BeIzVWcX
	vmgeytMFSqGXDIQhck3LVo=
X-Received: by 2002:a05:600c:4504:b0:49c:fc6e:a3da with SMTP id 5b1f17b1804b1-4a18e4a7839mr272468475e9.25.1791901911290;
        Tue, 13 Oct 2026 07:31:51 -0700 (PDT)
Received: from [192.168.0.20] (nborisov.ddns.nbis.net. [185.218.66.243])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a19303d518sm340155175e9.0.2026.10.13.07.31.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 07:31:47 -0700 (PDT)
Message-ID: <686a2511-1d4b-47cc-abdb-951693cf1771@suse.com>
Date: Tue, 13 Oct 2026 17:31:44 +0300
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
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
 vishal.l.verma@intel.com, xiaoyao.li@intel.com, kevin.tian@intel.com,
 chao.p.peng@intel.com
References: <20260924041032.1096569-1-zhenzhong.duan@intel.com>
 <20260924041032.1096569-6-zhenzhong.duan@intel.com>
From: Nikolay Borisov <nik.borisov@suse.com>
Content-Language: en-US
Autocrypt: addr=nik.borisov@suse.com; keydata=
 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
In-Reply-To: <20260924041032.1096569-6-zhenzhong.duan@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 24.09.26 г. 7:10 ч., Zhenzhong Duan wrote:
> Implement internal helper wrappers tdx_tdcm_alloc(), tdx_tdcm_run(),
> and tdx_tdcm_free() to manage execution context lifecycle for TDX Connect
> TEE-IO Device Control and Management (TDCM) commands.
> 
> Use these infrastructures to deploy all TDCM commands to orchestrate
> trusted device management, beginning with the first command,
> TDCM_OP_CHECK_TEEIO_SUPP, executed during the secure device locking
> sequence.
> 
> Signed-off-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
> ---
>   arch/x86/include/asm/tdx.h            |  48 +++++++++
>   drivers/virt/coco/tdx-guest/connect.c | 139 ++++++++++++++++++++++++++
>   2 files changed, 187 insertions(+)
> 
> diff --git a/arch/x86/include/asm/tdx.h b/arch/x86/include/asm/tdx.h
> index 4937e23d5483..71cd701d346f 100644
> --- a/arch/x86/include/asm/tdx.h
> +++ b/arch/x86/include/asm/tdx.h
> @@ -105,6 +105,54 @@ int tdx_mcall_extend_rtmr(u8 index, u8 *data);
>   u64 tdx_hcall_get_quote(u8 *buf, size_t size);
>   
>   #ifdef CONFIG_TDX_CONNECT_GUEST
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
> +} __packed;
> +
> +#define MAX_TDI_REPORT_SIZE	(16 * PAGE_SIZE)

nit: You can use SZ_64K, no  or the report's size indeed scales with 
whether PAGE_SIZE is 4k or 2m for example?

> +
>   u64 tdx_hcall_tdcm(u16 devid, void *buf, size_t size, u8 vector);
>   int tdx_mcall_tdi_read(u64 func_id, u64 field, u64 *value);
>   #endif
> diff --git a/drivers/virt/coco/tdx-guest/connect.c b/drivers/virt/coco/tdx-guest/connect.c
> index 80ae7c19e179..1f52a187b30f 100644
> --- a/drivers/virt/coco/tdx-guest/connect.c
> +++ b/drivers/virt/coco/tdx-guest/connect.c
> @@ -7,13 +7,127 @@
>   
>   #define pr_fmt(fmt)		KBUILD_MODNAME ": tdx_connect: " fmt
>   
> +#include <linux/iopoll.h>
>   #include <linux/pci.h>
>   #include <linux/pci-tsm.h>
> +#include <linux/set_memory.h>
>   #include <linux/tsm.h>
>   #include <asm/tdx.h>
>   
>   #include "tdx-guest.h"
>   
> +/**
> + * struct tdcm_ctx - TEE-IO Device Configuration and Management (TDCM) context
> + * @buf: Pointer to 4KB-aligned shared memory (>= one page) used as the command
> + *       buffer on input and the response buffer on output.
> + * @buf_size: Total size of the shared memory buffer.
> + * @max_rsp_data_sz: Maximum expected size of the response data.
> + * @rsp_data_sz: Actual size of the response data populated by the VMM.
> + * @devid: Device Identifier.
> + */
> +struct tdcm_ctx {
> +	struct tdvmcall_tdcm *buf;
> +	size_t buf_size;
> +	u32 max_rsp_data_sz;
> +	u32 rsp_data_sz;
> +	u16 devid;
> +};
> +
> +#define to_tdcm_rsp_data(tdcm)	((tdcm)->buf->data)
> +
> +#define TDCM_POLL_DELAY_US	10000
> +#define TDCM_POLL_TIMEOUT_US	(10 * USEC_PER_SEC)

Shouldn't  POLL_TIMEOUT be a multiple of DELAY_US  for the sake of 
simplicity? I.e DELAY_US 1000 (wait for 1k usecs) TIME_OUT 10 * DELAY_US 
(try up to 10 times to get a response?)

> +
> +static int tdx_tdcm_run(struct tdcm_ctx *tdcm)
> +{
> +	struct tdvmcall_tdcm *buf = tdcm->buf;
> +	u8 status;
> +	int ret;
> +	u64 r;
> +
> +	r = tdx_hcall_tdcm(tdcm->devid, buf, tdcm->buf_size, 0);
> +	if (r)
> +		return -EFAULT;
> +
> +	ret = read_poll_timeout(READ_ONCE, status, status != TDCM_STATUS_WAIT,
> +				TDCM_POLL_DELAY_US, TDCM_POLL_TIMEOUT_US, false, buf->status);
> +	if (ret) {
> +		pr_err("TDCM request %d timed out\n", buf->operation);
> +		return ret;
> +	}

It's not entirely clear to me why do we have this asynchronous handling 
of TDCM, we don't have that for any of the other VP.VMCALL leafs? Can 
you explain this in the changelog. According to GHCI 2.0 TDCM is used:

This is used to allow TD guest TEE-IO Device Control and Management 
(TDCM) module to
manage the device. The TDCM leaf functions are defined in the following 
table

Is TDCM module implemented via the NRX facility ?  The TDX Connect spec 
never mentions the TDCM module. A bit more details are required in order 
to better understand why you've implemented this the way you have.



> +
> +	/* Ensure subsequent data reads are ordered after the status observation */
> +	virt_rmb();
> +
> +	/*
> +	 * Cache VMM response data length to avoid referencing buf->data_length
> +	 * directly in case a malicious VMM changes buf->data_length between the
> +	 * validation below and the subsequent reads.
> +	 */
> +	tdcm->rsp_data_sz = READ_ONCE(buf->data_length);
> +
> +	if (status != TDCM_STATUS_COMPLETED || tdcm->rsp_data_sz > tdcm->max_rsp_data_sz ||
> +	    (tdcm->max_rsp_data_sz && !tdcm->rsp_data_sz)) {
> +		pr_err("TDCM request %d failed: status 0x%x, error 0x%x, max_rsp_data_sz 0x%x, returned 0x%x\n",
> +		       buf->operation, status, buf->error, tdcm->max_rsp_data_sz,
> +		       tdcm->rsp_data_sz);
> +		return -EIO;
> +	}
> +
> +	return 0;
> +}

<snip>

