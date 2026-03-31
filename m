Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10EF33A6B6F
	for <linux-coco@lists.linux.dev>; Tue, 31 Mar 2026 11:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774954830; cv=none; b=oFkrXL/C6ddDCp9gk+7EW+3i2IEEz/LicCZTGMr2q7pjQr/fx2Ik6aBjUSMMwjVlRgA4MJXBowRbVG/BW0XZeYjfPNdTVrfsdjy8ZNXmWCKJp9BlVeYrcFiuon1y29Gn0FT3BXbmd4GspOcyU+wzZQdrnu4WXj4LDipocVTngFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774954830; c=relaxed/simple;
	bh=hGiALNHuqe9lChW6zej1kx4xR06ikgMYVbl+kBtn1Rw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iopXO2zpKMCenVphewB1igQMVSLHJxVObAwdUeS/WotmBLquLRN/YMSKjy07xiTOX8SeffGE5UjT9nyxsvFNFJ8O1iXcr+usFBZeAoL5PzBvyj/X3emuihNoMKYzPFoNma8Or0NasV2N3h0o9rAlsbMZ+UivUdLvizbVNtLrvZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=QSrTUKFF; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="QSrTUKFF"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-43d02a71526so962363f8f.3
        for <linux-coco@lists.linux.dev>; Tue, 31 Mar 2026 04:00:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1774954827; x=1775559627; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4It0WZmVl5/qXPN0CzryvWQuSnTLqQkkeu2Hra/fxBs=;
        b=QSrTUKFFcn8ong5NxN4l8F9o79vKvCGnM2iKrtCOQII3wQ36RHqKU8FpZQQnOwwNGf
         +1J9W8BXYHgZYw0l57F0vEtn5uOk06jcgUKuOfrz8TqilG1JJn4qNO69ocYzM7ct2/Lk
         3VWGs/CgEoqUY8pEdEUqJ/XE0B9//OpohAF80uaDAUGj1283xEB9aQOf3OVeAJghSYS/
         IO5HZqaron/uUvNm5sIgm04ZshMOiX7Plv4JzRRrjWE/WzSCPRO62fOdWM9gmKl2gFrq
         U1D4Ihv5iIjoLDr1fmFcyJ0ps3N/RAtBNkJgCRyUN6ZZ6vS9U1y1HDpyROSLy8EkDY3e
         83eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774954827; x=1775559627;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4It0WZmVl5/qXPN0CzryvWQuSnTLqQkkeu2Hra/fxBs=;
        b=J8lMMvxb4vMwqAyz6gcSmS/ysoBqWtVW/YLL+ibgOas8o5nKhH2zFlEv66tBDXsvT7
         dR1sb3TM6yPtiu3sMEtRrOaB18yb2i3Mwp30hiM3Fda73eo66eaPKrP5/DG1ppVTIU2a
         eIzIMBf0s+rjMnIAUFPVzJxr9dTsaeag5a/gX3y5PYwnqnb5f/HmA4EqBvRyDFRq37qL
         OZ1MrK1fysYCRQpMY158WdmjkdbJZpFZz64c8o+ywEhx/MKsmfm3vCfF2kQ+KysKz8s3
         LfeXItH4t1HV4PHtFvO2hbwoq+meyd53oYC3VpFgjaJ0XR3Smof8XwYJfADhCevCWlV7
         jURA==
X-Forwarded-Encrypted: i=1; AJvYcCVDqwqpezhTmlHGr/XOjsVzlNom1QqP3Uk17pXRkC+78nOJv0xmfS0SBNJEzWKF9HkbBP2NPr9KvEbv@lists.linux.dev
X-Gm-Message-State: AOJu0Yx4KTvWLWdchaptXOsBJi1rk3G6y/9MYQoAtG/Z+gSOA+JimD4X
	RjxeelRdKGX5SjvmVIOZBD8519tbMIC9Kxwchv/E90djLZZvst3NrpuF9XFNqDG6SzA=
X-Gm-Gg: ATEYQzy4q/4ORtEYE4gwUAqSaN3GOxZ2/9IHzP0NLdyt10a0p3/4B8PjYxDREPOsXIs
	m9Y6S6bkmXDMUhkBbB9VKTeRGcrEwTTD8OvP+C89W76w4IZ4WhtQMl2M2Lv2L2f1/sf0T+iYmxS
	NrJ7cAWKpmSO4xBo1M/r82WK8tb/IadYiZZrmMunPrtvomeKRC3/7One/iudOWyBBUiiUePe2ct
	CvzGe/AhkyftwG8BMflnwIEgnchFNHFD5AKpYqiJyYsNYzeNX2bIUOY9x9X2O6FF0iOVJ3igZhI
	9mevXqTRZIldb7PWiCKSVtGiJg1A8ZH8nxXBB+tro3zTUKZlvCWjVuMj+fE1as7JQ2PmtbfvFEa
	rCtZIH3FZqOq3/Sn7jlAxjI5C9aA5SGwuEwrFssDbbhb3toSvJLyFpW2JBuTpz5u1Ut1YI3RraH
	fgjbErR0kwMU4vm81CkqtBBOTfcQ==
X-Received: by 2002:a05:6000:2505:b0:43b:962b:5314 with SMTP id ffacd0b85a97d-43b9e9e8f39mr27390891f8f.19.1774954827290;
        Tue, 31 Mar 2026 04:00:27 -0700 (PDT)
Received: from [192.168.0.20] ([212.21.133.10])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf21ebef9sm27611019f8f.13.2026.03.31.04.00.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 04:00:26 -0700 (PDT)
Message-ID: <d9f09a41-9d10-4778-b49a-d54504020636@suse.com>
Date: Tue, 31 Mar 2026 14:00:25 +0300
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/31] x86/virt/tdx: Add extra memory to TDX Module for
 Extensions
To: Xu Yilun <yilun.xu@linux.intel.com>, linux-coco@lists.linux.dev,
 linux-pci@vger.kernel.org, dan.j.williams@intel.com, x86@kernel.org
Cc: chao.gao@intel.com, dave.jiang@intel.com, baolu.lu@linux.intel.com,
 yilun.xu@intel.com, zhenzhong.duan@intel.com, kvm@vger.kernel.org,
 rick.p.edgecombe@intel.com, dave.hansen@linux.intel.com, kas@kernel.org,
 xiaoyao.li@intel.com, vishal.l.verma@intel.com, linux-kernel@vger.kernel.org
References: <20260327160132.2946114-1-yilun.xu@linux.intel.com>
 <20260327160132.2946114-11-yilun.xu@linux.intel.com>
From: Nikolay Borisov <nik.borisov@suse.com>
Content-Language: en-US
Autocrypt: addr=nik.borisov@suse.com; keydata=
 xsFNBGcrpvIBEAD5cAR5+qu30GnmPrK9veWX5RVzzbgtkk9C/EESHy9Yz0+HWgCVRoNyRQsZ
 7DW7vE1KhioDLXjDmeu8/0A8u5nFMqv6d1Gt1lb7XzSAYw7uSWXLPEjFBtz9+fBJJLgbYU7G
 OpTKy6gRr6GaItZze+r04PGWjeyVUuHZuncTO7B2huxcwIk9tFtRX21gVSOOC96HcxSVVA7X
 N/LLM2EOL7kg4/yDWEhAdLQDChswhmdpHkp5g6ytj9TM8bNlq9I41hl/3cBEeAkxtb/eS5YR
 88LBb/2FkcGnhxkGJPNB+4Siku7K8Mk2Y6elnkOctJcDvk29DajYbQnnW4nhfelZuLNupb1O
 M0912EvzOVI0dIVgR+xtosp66bYTOpX4Xb0fylED9kYGiuEAeoQZaDQ2eICDcHPiaLzh+6cc
 pkVTB0sXkWHUsPamtPum6/PgWLE9vGI5s+FaqBaqBYDKyvtJfLK4BdZng0Uc3ijycPs3bpbQ
 bOnK9LD8TYmYaeTenoNILQ7Ut54CCEXkP446skUMKrEo/HabvkykyWqWiIE/UlAYAx9+Ckho
 TT1d2QsmsAiYYWwjU8igXBecIbC0uRtF/cTfelNGrQwbICUT6kJjcOTpQDaVyIgRSlUMrlNZ
 XPVEQ6Zq3/aENA8ObhFxE5PLJPizJH6SC89BMKF3zg6SKx0qzQARAQABzSZOaWtvbGF5IEJv
 cmlzb3YgPG5pay5ib3Jpc292QHN1c2UuY29tPsLBkQQTAQoAOxYhBDuWB8EJLBUZCPjT3SRn
 XZEnyhfsBQJnK6byAhsDBQsJCAcCAiICBhUKCQgLAgQWAgMBAh4HAheAAAoJECRnXZEnyhfs
 XbIQAJxuUnelGdXbSbtovBNm+HF3LtT0XnZ0+DoR0DemUGuA1bZAlaOXGr5mvVbTgaoGUQIJ
 3Ejx3UBEG7ZSJcfJobB34w1qHEDO0pN9orGIFT9Bic3lqhawD2r85QMcWwjsZH5FhyRx7P2o
 DTuUClLMO95GuHYQngBF2rHHl8QMJPVKsR18w4IWAhALpEApxa3luyV7pAAqKllfCNt7tmed
 uKmclf/Sz6qoP75CvEtRbfAOqYgG1Uk9A62C51iAPe35neMre3WGLsdgyMj4/15jPYi+tOUX
 Tc7AAWgc95LXyPJo8069MOU73htZmgH4OYy+S7f+ArXD7h8lTLT1niff2bCPi6eiAQq6b5CJ
 Ka4/27IiZo8tm1XjLYmoBmaCovqx5y5Xt2koibIWG3ZGD2I+qRwZ0UohKRH6kKVHGcrmCv0J
 YO8yIprxgoYmA7gq21BpTqw3D4+8xujn/6LgndLKmGESM1FuY3ymXgj5983eqaxicKpT9iq8
 /a1j31tms4azR7+6Dt8H4SagfN6VbJ0luPzobrrNFxUgpjR4ZyQQ++G7oSRdwjfIh1wuCF6/
 mDUNcb6/kA0JS9otiC3omfht47yQnvod+MxFk1lTNUu3hePJUwg1vT1te3vO5oln8lkUo9BU
 knlYpQ7QA2rDEKs+YWqUstr4pDtHzwQ6mo0rqP+zzsFNBGcrpvIBEADGYTFkNVttZkt6e7yA
 LNkv3Q39zQCt8qe7qkPdlj3CqygVXfw+h7GlcT9fuc4kd7YxFys4/Wd9icj9ZatGMwffONmi
 LnUotIq2N7+xvc4Xu76wv+QJpiuGEfCDB+VdZOmOzUPlmMkcJc/EDSH4qGogIYRu72uweKEq
 VfBI43PZIGpGJ7TjS3THX5WVI2YNSmuwqxnQF/iVqDtD2N72ObkBwIf9GnrOgxEyJ/SQq2R0
 g7hd6IYk7SOKt1a8ZGCN6hXXKzmM6gHRC8fyWeTqJcK4BKSdX8PzEuYmAJjSfx4w6DoxdK5/
 9sVrNzaVgDHS0ThH/5kNkZ65KNR7K2nk45LT5Crjbg7w5/kKDY6/XiXDx7v/BOR/a+Ryo+lM
 MffN3XSnAex8cmIhNINl5Z8CAvDLUtItLcbDOv7hdXt6DSyb65CdyY8JwOt6CWno1tdjyDEG
 5ANwVPYY878IFkOJLRTJuUd5ltybaSWjKIwjYJfIXuoyzE7OL63856MC/Os8PcLfY7vYY2LB
 cvKH1qOcs+an86DWX17+dkcKD/YLrpzwvRMur5+kTgVfXcC0TAl39N4YtaCKM/3ugAaVS1Mw
 MrbyGnGqVMqlCpjnpYREzapSk8XxbO2kYRsZQd8J9ei98OSqgPf8xM7NCULd/xaZLJUydql1
 JdSREId2C15jut21aQARAQABwsF2BBgBCgAgFiEEO5YHwQksFRkI+NPdJGddkSfKF+wFAmcr
 pvICGwwACgkQJGddkSfKF+xuuxAA4F9iQc61wvAOAidktv4Rztn4QKy8TAyGN3M8zYf/A5Zx
 VcGgX4J4MhRUoPQNrzmVlrrtE2KILHxQZx5eQyPgixPXri42oG5ePEXZoLU5GFRYSPjjTYmP
 ypyTPN7uoWLfw4TxJqWCGRLsjnkwvyN3R4161Dty4Uhzqp1IkNhl3ifTDYEvbnmHaNvlvvna
 7+9jjEBDEFYDMuO/CA8UtoVQXjy5gtOhZZkEsptfwQYc+E9U99yxGofDul7xH41VdXGpIhUj
 4wjd3IbgaCiHxxj/M9eM99ybu5asvHyMo3EFPkyWxZsBlUN/riFXGspG4sT0cwOUhG2ZnExv
 XXhOGKs/y3VGhjZeCDWZ+0ZQHPCL3HUebLxW49wwLxvXU6sLNfYnTJxdqn58Aq4sBXW5Un0Q
 vfbd9VFV/bKFfvUscYk2UKPi9vgn1hY38IfmsnoS8b0uwDq75IBvup9pYFyNyPf5SutxhFfP
 JDjakbdjBoYDWVoaPbp5KAQ2VQRiR54lir/inyqGX+dwzPX/F4OHfB5RTiAFLJliCxniKFsM
 d8eHe88jWjm6/ilx4IlLl9/MdVUGjLpBi18X7ejLz3U2quYD8DBAGzCjy49wJ4Di4qQjblb2
 pTXoEyM2L6E604NbDu0VDvHg7EXh1WwmijEu28c/hEB6DwtzslLpBSsJV0s1/jE=
In-Reply-To: <20260327160132.2946114-11-yilun.xu@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 27.03.26 г. 18:01 ч., Xu Yilun wrote:
> Adding more memory to TDX Module is the first step to enable Extensions.
> 
> Currently, TDX Module memory use is relatively static. But, some new
> features (called "TDX Module Extensions") need to use memory more
> dynamically. While 'static' here means the kernel provides necessary
> amount of memory to TDX Module for its basic functionalities, 'dynamic'
> means extra memory is needed only if new optional features are to be
> enabled. So add a new memory feeding process backed by a new SEAMCALL
> TDH.EXT.MEM.ADD.
> 
> The process is mostly the same as adding PAMT. The kernel queries TDX
> Module how much memory needed, allocates it, hands it over, and never
> gets it back.
> 
> TDH.EXT.MEM.ADD uses tdx_page_array to provide control (private) pages
> to TDX Module. Introduce a tdx_clflush_page_array() helper to flush
> shared cache before SEAMCALL, to avoid shared cache write back damages
> these private pages.
> 
> For now, TDX Module Extensions consume relatively large amount of
> memory (~50MB). Use contiguous page allocation to avoid permanently
> fragment too much memory. Print this readout value on TDX Module
> Extensions initialization for visibility.
> 
> Co-developed-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
> Signed-off-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
> Signed-off-by: Xu Yilun <yilun.xu@linux.intel.com>
> ---
>   arch/x86/virt/vmx/tdx/tdx.h |  1 +
>   arch/x86/virt/vmx/tdx/tdx.c | 92 ++++++++++++++++++++++++++++++++++++-
>   2 files changed, 91 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/x86/virt/vmx/tdx/tdx.h b/arch/x86/virt/vmx/tdx/tdx.h
> index 870bb75da3ba..31ccdfcf518c 100644
> --- a/arch/x86/virt/vmx/tdx/tdx.h
> +++ b/arch/x86/virt/vmx/tdx/tdx.h
> @@ -60,6 +60,7 @@
>   #define TDH_VP_WR			43
>   #define TDH_SYS_CONFIG_V0		45
>   #define TDH_SYS_CONFIG			SEAMCALL_LEAF_VER(TDH_SYS_CONFIG_V0, 1)
> +#define TDH_EXT_MEM_ADD			61
>   
>   /* TDX page types */
>   #define	PT_NDA		0x0
> diff --git a/arch/x86/virt/vmx/tdx/tdx.c b/arch/x86/virt/vmx/tdx/tdx.c
> index 4fb56bb442f0..5fae17c13191 100644
> --- a/arch/x86/virt/vmx/tdx/tdx.c
> +++ b/arch/x86/virt/vmx/tdx/tdx.c
> @@ -560,7 +560,7 @@ static int tdx_alloc_pages_contig(unsigned int nr_pages, struct page **pages,
>    * Similar to tdx_page_array_alloc(), after allocating with this
>    * function, call tdx_page_array_populate() to populate the tdx_page_array.
>    */
> -static __maybe_unused struct tdx_page_array *
> +static struct tdx_page_array *
>   tdx_page_array_alloc_contig(unsigned int nr_pages)
>   {
>   	return tdx_page_array_alloc(nr_pages, tdx_alloc_pages_contig, NULL);
> @@ -643,7 +643,7 @@ EXPORT_SYMBOL_GPL(tdx_page_array_create_iommu_mt);
>   #define HPA_LIST_INFO_PFN		GENMASK_U64(51, 12)
>   #define HPA_LIST_INFO_LAST_ENTRY	GENMASK_U64(63, 55)
>   
> -static u64 __maybe_unused hpa_list_info_assign_raw(struct tdx_page_array *array)
> +static u64 hpa_list_info_assign_raw(struct tdx_page_array *array)
>   {
>   	return FIELD_PREP(HPA_LIST_INFO_FIRST_ENTRY, 0) |
>   	       FIELD_PREP(HPA_LIST_INFO_PFN,
> @@ -1513,6 +1513,94 @@ static void tdx_clflush_page(struct page *page)
>   	clflush_cache_range(page_to_virt(page), PAGE_SIZE);
>   }
>   
> +static void tdx_clflush_page_array(struct tdx_page_array *array)
> +{
> +	for (int i = 0; i < array->nents; i++)

shouldn't the actual number of entries be adjusted as per offset, 
similarly to how 'nents' in tdx_page_array_validate_release is calculated?


<snip>
