Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC540316190
	for <linux-coco@lists.linux.dev>; Mon,  6 Jul 2026 19:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783366286; cv=pass; b=ORk8ipcC7LT5tf72+AzTfvB8QYIZkArzPM/uNpTCfACaoX2Q9Z6tGT2RW9ty86+UuZELMXw6rCn574AC8LZ+mhJJ70s1H+hJ2Ry7DqWmksOB/IMiNOk2hI1dD/lTagPtsPagEWZUChHctdXY1QaR5tz8SnancawhQPCquRQ9TxA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783366286; c=relaxed/simple;
	bh=ZqWVpOj6fMq4bOzwenk+eFayci0sBP705y2M1gKjVSc=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mnrO8UDUEIstzAM1BDdSZAy5i7D3/AObmM8tEq5Ml3vusYKJMe+XKSLo79tkuVLzuuKIWENFhMCI0MNNotHGuWrtfDIjCJmvqv/UXTX7hcUpopZLUhkaphq5AETWOTI/1eSV4CJVBtAROMPgyqMN/YjA8HZ6dWUTrDUZUJXE6FA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VG5+X1o2; arc=pass smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VG5+X1o2"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2cab973140bso41750975ad.3
        for <linux-coco@lists.linux.dev>; Mon, 06 Jul 2026 12:31:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783366284; cv=none;
        d=google.com; s=arc-20260327;
        b=edS7e6b+YBr8fh0iUWhr5bg5z0FS3xJFRb3DyIsU9h72NK6CKvE5JmtrHt2foxRKde
         JQLH8XHN7Rkss893cNEy7PGhDIYdQO3/PMKgXV6oa44Ak4zaL+nyAIiJTaEcABj0NRbC
         8SupbgLQt5hUkcB90WZtgJNW3rxDSnJw+wbZp9gLOiSNAl9SsQSjiL89akrvD1T4f44J
         gh9NvuyHVxs7A8YIYINaXVozOJAslJj0NpnuzrW1Juk9aE2QD7S6YqOG7+RIRWBZCoSc
         jzJH5lk5bXUxzUfrL6Q3Xtz8CTbA3vEhzM3fi0HchFN87xIqQezQOFWStYB42oliJDRT
         KQvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=5sBbN6AQhjUw4Kzr8zci20KvZDn+C3bKKaEIfQEAul4=;
        fh=Il70fy/6GKvZ2+aTO7Gd7qMKXV23+1FapOSwBicTdHw=;
        b=Bui9r2qblKsExLnVs2U8Pl9JHNGM9ZuP9GwXbzur3uOHC1dNimWEAHmZvinrmgw1Ed
         Fq3JbPfgnq1ygksLYmqmzZs/iOmI1QCsMNoVNdLrF4fPCMgcGbktsWYAOtLNEut4fW9j
         9F+uPYkZ92eM4EsMlIRvgcFEoV03l/MIwAEuJNeNuh+Rhu1p617tZmP7SbH9Mo/y8Inq
         Y07PKtueeufxin9w6d+C5sPukS+Vxf1GdgSaGUzh7FKURT9R03O5Jce1IEtxjjQOr0As
         anWLdfeFDk+vK3eV05OXakYWjhp/rhXhgynvZGyLp3J774m3Mweq4185JbTPYYVlKzm5
         lDJg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783366284; x=1783971084; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5sBbN6AQhjUw4Kzr8zci20KvZDn+C3bKKaEIfQEAul4=;
        b=VG5+X1o2b6x/8AdLqdmcw0Mkojj5xZyBkRz/67GgShpodEHHl3YFrXG7W+IaYUqnlt
         HUZIjsfllZmm8JfnnoePq2Fpd5GwXhtdQsUkIS49YE2+IUXjo4Mm26E+Ij9gLnf1PNdY
         WcUy4KH5XNI17xHqng8N3B2qT7eKjWdVFIdfD3j0xdGOwmWevJt2hjjz/nv6LsWrHTxP
         rWSReZMXQ21On3NyVk0CBIIjoKici+PFZyPNW2KnfldGwawQVJpu96Gx+hBB0jPGlfds
         r//uNLdE09Yso7GXhbfCCly9aBc7PS4l7/KNCYRtv09XJhi7lRvps0IJMLA58nkBB0oC
         auxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783366284; x=1783971084;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5sBbN6AQhjUw4Kzr8zci20KvZDn+C3bKKaEIfQEAul4=;
        b=irTcW8TM/c0jrIpp0OuqX3B8olsnRAvGJuwGsKy/uem1O7Vi/oYLrofATk4D3LmrI8
         fakTjnhxIN0iUfw8Us2ZROieCegzJzb7xheXHQD3ZIjMtYp1tJ9S98K50XVC9aDO7baO
         xJQ3VKxLpnkAIKOlVXzJF3UuHVZT73gh7GpzO26vBj3bPBL9h/nQOOZJt1WqPb5FfCoY
         IRArGY6qyjYq06UjTCy/JOIFrqdjt9UbmGZqjILu6eZYUaRG6GYhCwqkXEuP7E+HeVb8
         AtvnB08FJrs6JWnXferUudApJF5OZlBvb4/1kWqy34z9TWWKexSeXyTg+Ai+ZMi9xs1c
         N8sA==
X-Forwarded-Encrypted: i=1; AHgh+Ro2LwUeq5IpwoxZIHDwEooe+rgiBzdBsEaGFo1ROJc2OPsjxtTlXNlbRmFL7efsrKODaH2t2Ij0k9Qw@lists.linux.dev
X-Gm-Message-State: AOJu0Ywg2Zm1B9/2ZYpoKmFvpTs6sBx+Iw1fWUhqEbx/M65BPnsGxPLx
	NqZM2SOHTIJyYzEwUNfu3+Ny/zb6N4NFQiIiHS1nqYB/+1BNIiXf6+Irxt5UROlmSzjpU0tLPsp
	m8/riuLaT4flYLPgbC/D2IDXaRlMhh77jL0g05u5H
X-Gm-Gg: AfdE7cn07pcJvxQ4CtHRbxPqoMNzUDqbnGISGXl6L1K/AauQ+4GqPQXecx6IToRCGrc
	W2xPKkYuX4fxrx4VoE/dHbRspuckN+mDHjxMqNN6un2I4+M/OFhJQY6x+YM4diHc9zna5LBC7Zd
	5xk5f+gvgg9d8ABVf+WeXcOHIQX5+HcDHayS2wqvsOMk6a0Iz4ri19OMZY7HI8m0ivGC5J2ysEe
	pHzTZAdRxPvmELTH+ecH88tpaHuL6yXs+pr2sdfOsI4AnF6Aqi/lEa9HKQGAL9bcohD76bVxZLj
	PCHmpPL1UCj9pxCUqd4qwZgs5DeQnrBBQKZ5KieiHokQRdY1/ZxGQ8KvWhI=
X-Received: by 2002:a17:902:eccd:b0:2ca:a284:a136 with SMTP id
 d9443c01a7336-2ccbf188823mr18530635ad.42.1783366283312; Mon, 06 Jul 2026
 12:31:23 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 6 Jul 2026 12:31:22 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 6 Jul 2026 12:31:22 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20260327160132.2946114-27-yilun.xu@linux.intel.com>
References: <20260327160132.2946114-1-yilun.xu@linux.intel.com> <20260327160132.2946114-27-yilun.xu@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Mon, 6 Jul 2026 12:31:22 -0700
X-Gm-Features: AVVi8Cc5ZxA9qF5433WWwdnaZDh9j1Ge4U5yFtnsyhw7BB1GFtQumPojoRxoK00
Message-ID: <CAEvNRgE4fbMWpTJTMLru-8QW9bJyUEan=K1GYWxvpXY8+LUBrw@mail.gmail.com>
Subject: Re: [PATCH v2 26/31] mm: Add __free() support for __free_page()
To: Xu Yilun <yilun.xu@linux.intel.com>, linux-coco@lists.linux.dev, 
	linux-pci@vger.kernel.org, dan.j.williams@intel.com, x86@kernel.org
Cc: chao.gao@intel.com, dave.jiang@intel.com, baolu.lu@linux.intel.com, 
	yilun.xu@intel.com, zhenzhong.duan@intel.com, kvm@vger.kernel.org, 
	rick.p.edgecombe@intel.com, dave.hansen@linux.intel.com, kas@kernel.org, 
	xiaoyao.li@intel.com, vishal.l.verma@intel.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Xu Yilun <yilun.xu@linux.intel.com> writes:

> Allow for the declaration of struct page * variables that trigger
> __free_page() when they go out of scope.
>
> A example usage would be in the following patch:
>
>   static struct pci_tsm *tdx_tsm_link_pf0_probe(...)
>   {
> 	...
>
> 	struct page *in_msg_page __free(__free_page) =
> 		alloc_page(GFP_KERNEL | __GFP_ZERO);
> 	if (!in_msg_page)
> 		return NULL;
>
> 	struct page *out_msg_page __free(__free_page) =
> 		alloc_page(GFP_KERNEL | __GFP_ZERO);
> 	if (!out_msg_page)
> 		return NULL;
>
> 	...
>
> 	tlink->in_msg = no_free_ptr(in_msg_page);
> 	tlink->out_msg = no_free_ptr(out_msg_page);
>
> 	...
>   }
>
> Signed-off-by: Xu Yilun <yilun.xu@linux.intel.com>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> ---
>  include/linux/gfp.h | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/include/linux/gfp.h b/include/linux/gfp.h
> index 51ef13ed756e..d37e5564234e 100644
> --- a/include/linux/gfp.h
> +++ b/include/linux/gfp.h
> @@ -391,6 +391,7 @@ extern void free_pages_nolock(struct page *page, unsigned int order);
>  extern void free_pages(unsigned long addr, unsigned int order);
>
>  #define __free_page(page) __free_pages((page), 0)
> +DEFINE_FREE(__free_page, struct page *, if (_T) __free_page(_T))
>  #define free_page(addr) free_pages((addr), 0)
>
>  void page_alloc_init_cpuhp(void);
> --
> 2.25.1

This is nice to have, independent of this series. Perhaps it should be
sent separately, and some existing function could be refactored to use
this, maybe __tdx_td_init?

Reviewed-by: Ackerley Tng <ackerleytng@google.com>
