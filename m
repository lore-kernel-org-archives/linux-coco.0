Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 461581F237A
	for <linux-coco@lists.linux.dev>; Tue,  3 Jun 2025 12:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748954203; cv=none; b=ci0b7zgp2AljODXGhrSH5OmnIIavmZz2NhI8N8h3B6QNdwtdw5gixQ4DpTRM+d0BSG1oYAHGEDAcw399bKnArowMz0adIK6Vpt4nkU/ZeKuS4ZfuYZz7TtGybMA5F5C4YXC5XhnOuYHM8zdqfq1gNYcAhrhnffoY955QHKaURWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748954203; c=relaxed/simple;
	bh=LzLCbIVcH2zYcLtVoHxYEUbzvgGPV0xknpcXcZKIK54=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=urb4B4QOV2gQ/Qo37ECVABoZrB4LaHVTFdcDV75UYu7tIRulor6EsLfoBANtKMiphkiGG1ffFlBb80/s89XvxkzqQLWvb28OSOqSIK2tYRWgP0XwacUEE91JieupMMot+QyW8jVYO6KRaDL25gaFt0/0y20FZLgKh50gK/2dmoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Vi342mBO; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Vi342mBO"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-442e9c00bf4so36610855e9.3
        for <linux-coco@lists.linux.dev>; Tue, 03 Jun 2025 05:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748954198; x=1749558998; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2xViAWrRX5U+Z+Z6xznZc5dX8EHIRo93p2in+GG+LQ0=;
        b=Vi342mBOR3wOexmUXpZrNwhZclAARV9bC0d7fbAYpvvGwb7z61kESPYr/jQ9bpu9Q0
         c723226jrOkOe83LByrykFLz6fZ3dmlMpQFELYe1PwYX0e+lfukG+f4O36gcEDZZq7JD
         bxhUgcb/ZnVLHfogS4PySavnvLCrGJT46vbFsl69TME6+shQFxhNj5uYgY99aJd3HVSR
         PaMGg38OcCN7tuUdfjOlv0Q1RAKbztNgzaiVkl+vdUfP5px3ZBylp41Vr9Vq1wM/Qrcd
         TRZbz9wIlWFK2RXUgLLau/5sBY2NJLzcN0402emwPkuugBFUVCuelish6XPrNZ8uAnZ8
         uxKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748954198; x=1749558998;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2xViAWrRX5U+Z+Z6xznZc5dX8EHIRo93p2in+GG+LQ0=;
        b=UPR6JNjWGsXJ3JXGJIHFeQIBDv1D6jMxwCuEui3I+BjVpeSVVorBjl0To/jUwfUhsA
         lSi20X4YWP5W7gHUJbcG68gFDQcNfVGO8mDdd0nUDxBKTOmUxH5ZsCtEUG0KeU9m043x
         iC8tO4Fgiw6UEyAYDmjdMEXRwIiVC3V++FrrZU3Tt56NgycYi9avI1/T9fdGrZ3O56wL
         813JhRiBrSsfVBdX2OZbU4ArEvcxPea1R+jizijKxk/H8ndXezcuyjGzyB2vwDfTjdiL
         cKSabwPVoOOVkZHOsOcGrUkU8oMefDYVyrOr0miCQnQYFda6agf86jrXiaamQ9Fera7a
         8xZA==
X-Forwarded-Encrypted: i=1; AJvYcCXCd2taD38vTypLsegQ9RLrcf5gpoD9we4XNnjziL3pe9nYjlU93y7w6nsak3+oSBoWkJ7M69S/1tyL@lists.linux.dev
X-Gm-Message-State: AOJu0YyLsg3xUTnYjMyLuF2nBkpTwbFLDM1KytnFtwPNsV20EK2N0UJa
	leo3hc9nCY9W31pZ6J3CSUszDVao+iWGxs0y847X4c5xnsMu3DpNgE9PBP+wvY42Nzg=
X-Gm-Gg: ASbGnctQhUf1rZQPylbXHLjnSyAHt0/b3io/zE5UghJUeZCCAIVeBW+yj8YZvEf9Z+X
	0sNqts6uKLLGKzGZcgiRXsIEfQ01MqrMcWYuvpZkVHlefioSu8eZcT7u3LikUEUZG+aJDBrZwLQ
	NDTajJce6vEFADgKcFOXV7HzMQtzR7hwcRx0xb49j6Pz60VPk7ANw0Ye+A2BTOMS27kQrirzebX
	HesIKq3yfZE9bvzPjHKfGAI3QKr6snwYOWIF4bNeb5YNxgm3DazqOhJDQrIhf50R6gwqsNKjfcn
	HcQMpmkP5vLRK2nAWNCrwVdOq+t3Y+TQcvTaDH8hua1GhDFX0t4816P7
X-Google-Smtp-Source: AGHT+IEmSuB7VBhtVy5m9A6RQJKCKnY6TvtFiP4Koiz2XhTPlIPNcYTYt8gFZ1pj9vkQeovJQwl6tA==
X-Received: by 2002:a5d:6205:0:b0:3a4:f902:3845 with SMTP id ffacd0b85a97d-3a4f9023860mr9622830f8f.21.1748954198308;
        Tue, 03 Jun 2025 05:36:38 -0700 (PDT)
Received: from [192.168.0.20] ([212.21.159.167])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe73eadsm17911159f8f.41.2025.06.03.05.36.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Jun 2025 05:36:37 -0700 (PDT)
Message-ID: <1f6956aa-5fa4-404f-bce4-3ddf87c50114@suse.com>
Date: Tue, 3 Jun 2025 15:36:36 +0300
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 12/20] x86/virt/seamldr: Shut down the current TDX
 module
To: Chao Gao <chao.gao@intel.com>, linux-coco@lists.linux.dev,
 x86@kernel.org, kvm@vger.kernel.org
Cc: seanjc@google.com, pbonzini@redhat.com, eddie.dong@intel.com,
 kirill.shutemov@intel.com, dave.hansen@intel.com, dan.j.williams@intel.com,
 kai.huang@intel.com, isaku.yamahata@intel.com, elena.reshetova@intel.com,
 rick.p.edgecombe@intel.com, Farrah Chen <farrah.chen@intel.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 linux-kernel@vger.kernel.org
References: <20250523095322.88774-1-chao.gao@intel.com>
 <20250523095322.88774-13-chao.gao@intel.com>
From: Nikolay Borisov <nik.borisov@suse.com>
Content-Language: en-US
Autocrypt: addr=nik.borisov@suse.com; keydata=
 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
In-Reply-To: <20250523095322.88774-13-chao.gao@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 5/23/25 12:52, Chao Gao wrote:
> TD-Preserving updates request shutting down the existing TDX module.
> During this shutdown, the module generates hand-off data, which captures
> the module's states essential for preserving running TDs. The new TDX
> module can utilize this hand-off data to establish its states.
> 
> Invoke the TDH_SYS_SHUTDOWN API on one CPU to perform the shutdown. This
> API requires a hand-off module version. Use the module's own hand-off
> version, as it is the highest version the module can produce and is more
> likely to be compatible with new modules.
> 
> Changes to tdx_global_metadata.{hc} are auto-generated by following the
> instructions detailed in [1], after adding the following section to the
> tdx.py script:
> 
>      "handoff": [
>         "MODULE_HV",
>      ],
> 
> Add a check to ensure that module_hv is guarded by the TDX module's
> support for TD-Preserving.
> 
> Signed-off-by: Chao Gao <chao.gao@intel.com>
> Tested-by: Farrah Chen <farrah.chen@intel.com>
> Link: https://lore.kernel.org/kvm/20250226181453.2311849-12-pbonzini@redhat.com/ [1]
> ---
>   arch/x86/include/asm/tdx_global_metadata.h  |  5 +++++
>   arch/x86/virt/vmx/tdx/seamldr.c             | 11 +++++++++++
>   arch/x86/virt/vmx/tdx/tdx.c                 | 18 ++++++++++++++++++
>   arch/x86/virt/vmx/tdx/tdx.h                 |  4 ++++
>   arch/x86/virt/vmx/tdx/tdx_global_metadata.c | 13 +++++++++++++
>   5 files changed, 51 insertions(+)
> 
> diff --git a/arch/x86/include/asm/tdx_global_metadata.h b/arch/x86/include/asm/tdx_global_metadata.h
> index ce0370f4a5b9..a2011a3575ff 100644
> --- a/arch/x86/include/asm/tdx_global_metadata.h
> +++ b/arch/x86/include/asm/tdx_global_metadata.h
> @@ -40,12 +40,17 @@ struct tdx_sys_info_td_conf {
>   	u64 cpuid_config_values[128][2];
>   };
>   
> +struct tdx_sys_info_handoff {
> +	u16 module_hv;
> +};
> +
>   struct tdx_sys_info {
>   	struct tdx_sys_info_versions versions;
>   	struct tdx_sys_info_features features;
>   	struct tdx_sys_info_tdmr tdmr;
>   	struct tdx_sys_info_td_ctrl td_ctrl;
>   	struct tdx_sys_info_td_conf td_conf;
> +	struct tdx_sys_info_handoff handoff;
>   };
>   
>   #endif
> diff --git a/arch/x86/virt/vmx/tdx/seamldr.c b/arch/x86/virt/vmx/tdx/seamldr.c
> index 9d0d37a92bfd..11c0c5a93c32 100644
> --- a/arch/x86/virt/vmx/tdx/seamldr.c
> +++ b/arch/x86/virt/vmx/tdx/seamldr.c
> @@ -241,6 +241,7 @@ static struct seamldr_params *init_seamldr_params(const u8 *data, u32 size)
>   
>   enum tdp_state {
>   	TDP_START,
> +	TDP_SHUTDOWN,
>   	TDP_DONE,
>   };
>   
> @@ -281,8 +282,12 @@ static void ack_state(void)
>   static int do_seamldr_install_module(void *params)
>   {
>   	enum tdp_state newstate, curstate = TDP_START;
> +	int cpu = smp_processor_id();
> +	bool primary;
>   	int ret = 0;
>   
> +	primary = !!(cpumask_first(cpu_online_mask) == cpu);

nit: the !! is not needed here, as the check is clearly boolean.

 > +>   	do {
>   		/* Chill out and ensure we re-read tdp_data. */
>   		cpu_relax();
> @@ -291,6 +296,12 @@ static int do_seamldr_install_module(void *params)
>   		if (newstate != curstate) {
>   			curstate = newstate;
>   			switch (curstate) {
> +			case TDP_SHUTDOWN:
> +				if (!primary)
> +					break;
> +
> +				ret = tdx_module_shutdown();
> +				break;
>   			default:
>   				break;
>   			}
> diff --git a/arch/x86/virt/vmx/tdx/tdx.c b/arch/x86/virt/vmx/tdx/tdx.c
> index 22ffc15b4299..fa6b3f1eb197 100644
> --- a/arch/x86/virt/vmx/tdx/tdx.c
> +++ b/arch/x86/virt/vmx/tdx/tdx.c
> @@ -295,6 +295,11 @@ static int read_sys_metadata_field(u64 field_id, u64 *data)
>   	return 0;
>   }
>   
> +static bool tdx_has_td_preserving(void)
> +{
> +	return tdx_sysinfo.features.tdx_features0 & TDX_FEATURES0_TD_PRESERVING;
> +}
> +
>   #include "tdx_global_metadata.c"
>   
>   static int check_features(struct tdx_sys_info *sysinfo)
> @@ -1341,6 +1346,19 @@ int tdx_enable(void)
>   }
>   EXPORT_SYMBOL_GPL(tdx_enable);
>   
> +int tdx_module_shutdown(void)
> +{
> +	struct tdx_module_args args = {};
> +
> +	/*
> +	 * Shut down TDX module and prepare handoff data for the next TDX module.
> +	 * Following a successful TDH_SYS_SHUTDOWN, further TDX module APIs will
> +	 * fail.
> +	 */
> +	args.rcx = tdx_sysinfo.handoff.module_hv;
> +	return seamcall_prerr(TDH_SYS_SHUTDOWN, &args);
> +}
> +
>   static bool is_pamt_page(unsigned long phys)
>   {
>   	struct tdmr_info_list *tdmr_list = &tdx_tdmr_list;
> diff --git a/arch/x86/virt/vmx/tdx/tdx.h b/arch/x86/virt/vmx/tdx/tdx.h
> index 48c0a850c621..3830dee4da91 100644
> --- a/arch/x86/virt/vmx/tdx/tdx.h
> +++ b/arch/x86/virt/vmx/tdx/tdx.h
> @@ -48,6 +48,7 @@
>   #define TDH_PHYMEM_PAGE_WBINVD		41
>   #define TDH_VP_WR			43
>   #define TDH_SYS_CONFIG			45
> +#define TDH_SYS_SHUTDOWN		52
>   
>   /*
>    * SEAMCALL leaf:
> @@ -87,6 +88,7 @@ struct tdmr_info {
>   } __packed __aligned(TDMR_INFO_ALIGNMENT);
>   
>   /* Bit definitions of TDX_FEATURES0 metadata field */
> +#define TDX_FEATURES0_TD_PRESERVING	BIT(1)
>   #define TDX_FEATURES0_NO_RBP_MOD	BIT(18)
>   
>   /*
> @@ -122,4 +124,6 @@ struct tdmr_info_list {
>   
>   int seamldr_prerr(u64 fn, struct tdx_module_args *args);
>   
> +int tdx_module_shutdown(void);
> +
>   #endif
> diff --git a/arch/x86/virt/vmx/tdx/tdx_global_metadata.c b/arch/x86/virt/vmx/tdx/tdx_global_metadata.c
> index 088e5bff4025..a17cbb82e6b8 100644
> --- a/arch/x86/virt/vmx/tdx/tdx_global_metadata.c
> +++ b/arch/x86/virt/vmx/tdx/tdx_global_metadata.c
> @@ -100,6 +100,18 @@ static int get_tdx_sys_info_td_conf(struct tdx_sys_info_td_conf *sysinfo_td_conf
>   	return ret;
>   }
>   
> +static int get_tdx_sys_info_handoff(struct tdx_sys_info_handoff *sysinfo_handoff)
> +{
> +	int ret = 0;
> +	u64 val;
> +
> +	if (!ret && tdx_has_td_preserving() &&

nit: That first !ret is redundant since it's always true.

<snip>

