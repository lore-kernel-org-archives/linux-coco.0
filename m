Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFE264779BC
	for <linux-coco@lists.linux.dev>; Wed,  1 Jul 2026 11:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782905112; cv=none; b=Ojb1NI9Qtxfzb1q93YT2NJqGpUOccSjJPVVdbzJUAWlGCSuMawn/zSvymso2Shtt5CKsUTx2QHqJNGTlMMWCZshbTrOIaJzjhWPxZ6ZCNRxCgQS8RkpklJMRaGs9H8KVTFBHWTnqA67znS2G5zwwbcQNpSCj5Ak4UMTfbroOOxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782905112; c=relaxed/simple;
	bh=HGNviWTGMLP+ILhAVnLf+Fxqvk2nLeIYHo1SvKNsQR4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lHLtmEC71ngzz8zDqAzLu3HRPvkD/Y61eRtDc0QxZ2TjbKukklKwNwi2qdzTNQtIsmgVoabDzghl6hdzwzPSlFIz0XQENu6m50TPMuQyfMUEmZ7bA5F5XwH0eamkc53Z542G5f9YlH1J1E+RS16m3wGlJnhgr6ffq8vdKL7tNoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=LwatYRf0; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="LwatYRf0"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4921eed3fa2so3494155e9.0
        for <linux-coco@lists.linux.dev>; Wed, 01 Jul 2026 04:25:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1782905108; x=1783509908; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6ruABWkVWDFmLEtYThMIgGJ8AeKk7VYjaiWNv96SVUY=;
        b=LwatYRf0jIYqaRABFpihNEd0TUCEa/uEOpEnY2UAMLw/mETxZv6C1KQMtIPu9TqUVh
         sZX7VJBHrlJohEV9aShNfr0pb9NaT5eIcmw1CcX51RrUsUrbFg4Tu9Y/trqrNOpQM0Bp
         QhEK8tDN9rWfnZ+F1wEaymb40jtUbsQU9NzQJpmZsb53yqwoUSO90p3rA7sBaHStAJk1
         2bG8UE0vMd1o/XixHam17QCD1jQIwCyruG6by4E1KQM9GOTuwdiQk6f9AWGNNkbPa6Xe
         IwJTZyg5F6mVz92TcUY0YXKAl14MWXoEw2L8lIJfDkq09iJB9Kua9+DGXZuGUW0a/Q3G
         hzBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782905108; x=1783509908;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6ruABWkVWDFmLEtYThMIgGJ8AeKk7VYjaiWNv96SVUY=;
        b=cocyNa11CDepH+U/vo2WOv+oDNqq7QjEQOfMDDkbAuzO9iRj9SPb513K1jUAdiBi7h
         sQzQtmTZ8MwXecToi3FpzSrdD/XT9VmQf9Greocbu302zCbPDHbKB6+WQuRPaC1/KDTm
         fmThjyuZueyfsuxhodLtpzTk5IYZIGJQIbLuTwhMmGTSMwnYe9ImzjQX8Rh5wEVOLRi6
         ME+aoCTDDo24dpkZJplbp+YLMyqm46Va6NOi5n55b3snkr4QvXMstBeWW6Ws1veJzK26
         d3nXhqbWCoAYX6Ssk/eq2TZYR0HOQXTgryL3Ii8+zAnDZCOQGYkyBwcdzQ71AtbFmS+L
         5ciQ==
X-Gm-Message-State: AOJu0YzfpjF3xn7CV+05PXCLWaSP0E3T78kL4C6lDw2vpW8OiPgFH6B/
	mSMpGpkLu9BGvcd63UqGhOf8zQnfs2s393nVgIgVZeSC06wnlbdkLEx3Ons2rhoLte8=
X-Gm-Gg: AfdE7clAwotDB+2EsvkDQEZ6NllvM/9VNB5BFtOZs3vYVdKtSRrr5SjCa6NDREVheqf
	6K36RzsJw4eeSSKZL4W7jwapCQireg0DdKG8GlhiXqutIaLROYSJ1EGh65N+hje3ziyXyQKKtIh
	C1kOe/InbChCPNz1dyzXM57uzTKex/3fE9ySVs9uGoYGK6Fin2XS5j91N1alsvQD+1MEeAjQbOy
	NGTHjXSeyJzMXokicG+nUh8ghsIcb2y6jTreY4psmewII+oLPr0UUevsZa3d+uFn6GGaLu4Yqwm
	o7kZhnFs8GqikE5WmbC2yRcq7B5kBhIVztWgT3Q1Qp2K8X1PvoT1A4C95qtCulpSKPfpO6gT/8o
	nhdBH2UMJCLuLrCtpBtykR4nOwIGkKNld3lYoIF9+Soz5GPd86bavC1dmcpYphbz69SbmmkK19N
	IKY4s2Y1g58LbQwsyRihY5XnO6jg==
X-Received: by 2002:a05:600c:8189:b0:493:b56b:c45c with SMTP id 5b1f17b1804b1-493c2b9cc74mr19272195e9.30.1782905108034;
        Wed, 01 Jul 2026 04:25:08 -0700 (PDT)
Received: from [10.20.4.146] ([149.62.207.101])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493be4eee27sm65604685e9.12.2026.07.01.04.25.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2026 04:25:07 -0700 (PDT)
Message-ID: <3cf04184-c34a-4d49-926f-5791f12cd74e@suse.com>
Date: Wed, 1 Jul 2026 14:25:05 +0300
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 08/15] x86/virt/tdx: Add interface to check Quoting
 availability
To: Xu Yilun <yilun.xu@linux.intel.com>, kas@kernel.org, djbw@kernel.org,
 rick.p.edgecombe@intel.com, x86@kernel.org, peter.fang@intel.com
Cc: linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org,
 kvm@vger.kernel.org, sohil.mehta@intel.com, yilun.xu@intel.com,
 baolu.lu@linux.intel.com, zhenzhong.duan@intel.com, xiaoyao.li@intel.com
References: <20260522034128.3144354-1-yilun.xu@linux.intel.com>
 <20260522034128.3144354-9-yilun.xu@linux.intel.com>
From: Nikolay Borisov <nik.borisov@suse.com>
Content-Language: en-US
Autocrypt: addr=nik.borisov@suse.com; keydata=
 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
In-Reply-To: <20260522034128.3144354-9-yilun.xu@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 5/22/26 06:41, Xu Yilun wrote:
> From: Peter Fang <peter.fang@intel.com>
> 
> KVM needs to know if the Quoting extension is available to determine
> whether userspace must be involved in Quote generation.
> 
> Since the Quote buffer is always created during Quoting extension
> bringup, checking whether the buffer exists is sufficient.
> 
> Signed-off-by: Peter Fang <peter.fang@intel.com>
> Signed-off-by: Xu Yilun <yilun.xu@linux.intel.com>
> ---
>   arch/x86/include/asm/tdx.h  |  2 ++
>   arch/x86/virt/vmx/tdx/tdx.c | 15 +++++++++++++++
>   2 files changed, 17 insertions(+)
> 
> diff --git a/arch/x86/include/asm/tdx.h b/arch/x86/include/asm/tdx.h
> index 15eac89b0afb..7b257088aa1e 100644
> --- a/arch/x86/include/asm/tdx.h
> +++ b/arch/x86/include/asm/tdx.h
> @@ -176,6 +176,8 @@ struct tdx_vp {
>   	struct page **tdcx_pages;
>   };
>   
> +bool tdx_quote_enabled(void);
> +
>   static inline u64 mk_keyed_paddr(u16 hkid, struct page *page)
>   {
>   	u64 ret;
> diff --git a/arch/x86/virt/vmx/tdx/tdx.c b/arch/x86/virt/vmx/tdx/tdx.c
> index 9d04293394d7..b305fa5aab5c 100644
> --- a/arch/x86/virt/vmx/tdx/tdx.c
> +++ b/arch/x86/virt/vmx/tdx/tdx.c
> @@ -1213,6 +1213,21 @@ static inline u64 tdx_tdr_pa(struct tdx_td *td)
>   	return page_to_phys(td->tdr_page);
>   }
>   
> +/**
> + * tdx_quote_enabled() - Check whether TDX Quoting extension is available
> + *
> + * Return: %true if the Quoting extension is available, otherwise %false.
> + */
> +bool tdx_quote_enabled(void)

nit: Probably rename the function to tdx_quoting_ext_enabled or 
tdx_quote_ext_enabled, so it's abundantly clear it's about an extension 
and not the quoting functionality in general.


> +{
> +	/*
> +	 * No need for locking here. The quote buffer is initialized as part of
> +	 * core TDX bringup, which comes before KVM is ready for userspace.
> +	 */
> +	return !!quote_data.buf;

While this works it feels a bit like a hack, perhaps have a static 
boolean variable being set by the init code which is simply returned by 
this function.

> +}
> +EXPORT_SYMBOL_FOR_KVM(tdx_quote_enabled);
> +
>   #define HPAS_PER_PAGE			(PAGE_SIZE / sizeof(u64))
>   
>   static int tdx_quote_create_buf(unsigned int nr_pages, struct quote_data *qdata)

