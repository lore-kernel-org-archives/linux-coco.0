Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09E9950391B
	for <linux-coco@lists.linux.dev>; Wed, 14 Oct 2026 12:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791982397; cv=none; b=bkKKxTEQrpMUYIAl08/9an4AuFTnIlWJ+v8MztkA8nvC3ajoTdWU8ihwIRcYm/xaAlHHO//iYTNX0hnjoiJQDCY3ZT5epyvV51Unpb1SHBJKE/fg7W9orKXzijtl31fmCf1UKS8Nlf1LXAZzZXF+6K6jFOJQBch/SXV2PO+A9KI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791982397; c=relaxed/simple;
	bh=M/AuqUeZeqqptr6S7+fLJ7PsEa0zA0B04uQhsnX8ZVI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I/BLjBP21gpkbG78em4Imq4+vfUSSFjrCGZj9vypO/14qp34Js4vwB8Uu5srR9GmFQG7snurdTbQosNyn7xCYa0wPZ7jMTzntXUgZyiecwm/k4xKELMOlCAUKbRJZBzX+Uj+CCoz+1kIjLtKuCWEWudyTTHs5L5aRqykXV6kLcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=aLlQsp6R; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="aLlQsp6R"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a16aaf2067so12016085e9.0
        for <linux-coco@lists.linux.dev>; Wed, 14 Oct 2026 05:52:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1791982360; x=1792587160; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=7agUasRQggBe8XU1P9665BVX4s2h0H7hyBLdn0AXob8=;
        b=aLlQsp6RUpL6VtpJItceApmpqLDWOE0ZpaGPk+wS5xLMXxRUo0PFbrszAjKrGeUHYv
         t23U0tWqL7Als8M8S60GmC2njv4PU0CPodytIMqZ63mr2EvOeNA9AqoJfKBCnZOGWvXk
         8VDQy+xenJSBX3vnD3etRye0JmKDRMBRBr9RnVgrZzXVG5zWVfTd9NdRe9nLRPBQzY58
         FBi2MSfv6Q8ypciu5KfCrd/juoT16ue3n7Rk8yDDdD5IwO0ZIh1aRbvnkCp0PLpEkyHB
         Ht/ZEdO0XF/uLkLyrOxXJ76RFtyD/Q5aoXbeCsR53R1l3KceJK9K9U0VU8y/RY7KkkTb
         J/Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791982360; x=1792587160;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7agUasRQggBe8XU1P9665BVX4s2h0H7hyBLdn0AXob8=;
        b=g/64rRQCLjSnm4CbO5a7nYO32ai+dTxBe37Qtm55gIHANznuJEmB8anRIFsoYqZMRx
         jvPjG8ZMX5emJVarz9OG9tRejAaftnhb+BKSfT185eWcOjxAIz99R4wutW5pVm9V+Rf4
         PPV8M6Frux9afxBZDtNIJI6aWQdeZD7kKYBf1ynIBjS+KwmygJ6FS2pR67v2K9tCyG+i
         qHwXJ5s9WUJPoGUSK5HeNTcUTA6dVqY4s0waKI/GRKTAF/QjfTF72Q9o6xlu3KVpyeBq
         0ZFeBq1LlIfD2TKyjHmGozBKWpf9pQzD7l+x119RgtBJVVzHVBmB4tSahbREmPV+q9Mm
         KMdA==
X-Forwarded-Encrypted: i=1; AKwUvBwF7Q/VRnFf+g+2fVY+JbGsk5NZo2N8EKmrOHnUdk2vYKR8NcVLzS53hvhfhIqafDznkFLXyVcwkNhq@lists.linux.dev
X-Gm-Message-State: AFq9FYLjf3luexot3o46TQny5gd7rCRIwyCSj2z504opTzM5VUF/XXgU
	wYzXf4bPhxKk1JXS6UTPKSTS1VEvXzg2LPjMvb19YXrENyE84IFm7E8mjFdLuRgEKtYWmxh0da1
	12NUCUJc=
X-Gm-Gg: AYBFou0u0anzNG1tH9pPFR4aIvCwyDVvWcu8z5XagJFIyzSJJ+kz0iWoI6731FNMKR9
	c0nGktffMCmq41OPWtnqyKH+nFDOvl7ja8pmk6bXj5wxigb/jl1Mfl3k//SSzxo9RgLMd83se3k
	p0L345zvKmCuQGpw7gqrrmg1zkXwMPMdZoHGG9XRXSOwePlqwIWRzdHj9UUMgUo1eqkGGXGFbmc
	2i5b/5blerMafyMel64gSRAhd8XciFU1ooJXyngquVP7ScRZESARH7GoS+yVp2sk9ymlsgVdfie
	LKXrciqoaOW/OEvTjA2KL9JE+xIXZLUfXeVQfqERFNKDlY4UD7jPByR7UEEkS44LVMHDWjeLW+F
	DHYD2laYkTk0ukcsznODiv3+Bqqi9xYvhw4IEBskaiCC46CrXm3AtYTMvrXpvIVYaVrohC0OkFA
	/tTVdxNq+2sFhtMZu6cIHGaV/uqJ401zinwi5Yhsrd+oIKIiKZrJ3dZ0OBN9XdDFQN2+9ditXkT
	qaVKbcDRrIJPsbpeca78umw4II13SXXkQ==
X-Received: by 2002:a05:600c:a01:b0:49f:ce72:e931 with SMTP id 5b1f17b1804b1-4a18e4fe3e1mr329265145e9.35.1791982359832;
        Wed, 14 Oct 2026 05:52:39 -0700 (PDT)
Received: from [192.168.0.20] (nborisov.ddns.nbis.net. [185.218.66.243])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1b2e9791csm46488065e9.1.2026.10.14.05.52.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 05:52:37 -0700 (PDT)
Message-ID: <0c5851bb-456f-4191-b951-94c8c3916ad3@suse.com>
Date: Wed, 14 Oct 2026 15:52:34 +0300
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

Since TDCM and all concepts around it are coupled to TDX Connect why are 
those defines in the shared tdx.h file? OTOH, why is struct tdcm_ctx {} 
defined in connect.c and not in the shared file? I think it's high time 
we decided whether code coming for additional functionality should go 
into the shared header or a file, specific to said functionality.

My 2 cents are that since TDCM is solely related to connect then it 
should probably be part of connect.h or some private header under 
tdx-guest/ directory. It's not expected for kernel proper to use that 
interface, no ?

<snip>
