Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA43B3DA7FF
	for <linux-coco@lists.linux.dev>; Sat, 17 Oct 2026 18:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792262338; cv=none; b=tzmO8iBy2XWFkFkkt/H0imYJKO04H36L2BZq94O7M7InNiF3lfZdf3VCsL5gWd9YgsdzR96hiEwemZlXZLbVGT8Oekm48KOXxn0WDrAFeMOOTSmeun4iL1GamsztjcELg+Zjlv/Vyu7UXK7uBooPrfuf9rRHYRGNU5j0zXdB8bE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792262338; c=relaxed/simple;
	bh=i4/JSD98fkMP4EtaU0o0G/p/k04D/Fo6vmn6XJIipJc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nSMkUu4N8iiVJ9U9jG/Ksq2sb/cGG/CmD5ReLe5vQMZp5cCmxUkTB5RHdBRJRYvmYi9d1CBdqk4gXmnR88yTTjm3x5OP5sLwYMJ93/a81QfRAnwbzHBQi9A5glkkH/7IxJdYtjwARbhHdPqcAvfvuO+IrdX9q73aO0xIn9Acp8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=VEGmSRr/; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="VEGmSRr/"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a0286c981dso10110125e9.2
        for <linux-coco@lists.linux.dev>; Sat, 17 Oct 2026 11:38:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1792262334; x=1792867134; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=PTaBaJhyHT4J2O0wNH3BcAK19fYP6FDKgZiZPkF2z48=;
        b=VEGmSRr/cNcBxxh4lXIet5MXGsGbPyoN8DFY3Wcvxx9mKsBi0q2EAAvLXcfiydt1l6
         5TyKw/g/86BoQ9h7AKqKxFY+zFbrdqblxvkGsll7CPYkcuUiE6bPPs2dz+d5aGpyb0E9
         6BhKFCk+9HFhdHjTn6H9B8PUHLnoMUYU/GfBFM6LsldGml4XmR5GyZACn3SA5FabL2O2
         2QD3G4MvBIW/Xr7YvBVLiAiZbKKgpjMWN9fl07yexb4dRpP1NuwGttwGfBTZW8ZC/XLw
         Xp9Fhcthai2XyG3F14kFOwBZkw1ZELmxjoIMammfjvp/Kn0y/+jv/KlqaCUKRiQXZmUt
         Y0+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792262334; x=1792867134;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PTaBaJhyHT4J2O0wNH3BcAK19fYP6FDKgZiZPkF2z48=;
        b=NffQIB+OnByCclASInnIJdcVA2dYoQzo5jwLyP45ktMSRPO3D6rWQzFwQx3Ky0PEF/
         9jGGZmxgqeNrB8Xgf/B6wIS3hFS66hAT46mIDT5Ugx7phTBh8D2c986J8EV3xhVWqE1t
         XaoA4OxdkKvtAucvh9zRjoaYzhy0RfL+HrYsOdab1xAoiVFq2lsfRSdeQIT4Xxbkl8I2
         EPBzF07+1ODrjcZsZViyHrv0z0MtdvFeafV2yRJ+r4NJ83BHkx2NMcjRnKQKciN/9jZD
         ep+7bmSrPXOs2jj4yqDBWHmPv/QO2RuJAYxxTxwzN575T/vFrS+L8jOlQes2aPwic7xd
         uUTg==
X-Forwarded-Encrypted: i=1; AKwUvByN0Fay6xoFYq9po6pTQAnOtMwLRVUFuxuETwAZxnlhw36u3zzNq4DFAuW4/rrk01oT9Gc0329D33Gi@lists.linux.dev
X-Gm-Message-State: AFq9FYJdv9VjAg+IBWzdsFEH9QC1mf+CQaN7elexBcqSfK/nDOsEz7F4
	D9/oFKzQGwjhLEvZa7gxZ/SHRpcXtZs4m1kSUaF73awP717I3e9wZ4NrzEKBIepRkE0=
X-Gm-Gg: AYBFou021gL3L6VPvJGmrWlgXQMev1nyrqk3CtLCQqKaZuNhzT2S1gqvcwNyx41BI8t
	LWdy2BfgYfVC8pY8Ge0T7/G39a1R3F+ExwcBUbcy+d1ULi5I6XpRFS7i/jrz1inR0ZRbiPCoNlO
	apJ+12WW74YVbbcWdqUvp+1/DSqJQOTYz40EiVjV7ZaJTPapElpyWDX7J6sZfme5ossr5XWtjGP
	2HPiugID1PxW2CH4bXtveY0oPsiGBGcoy1QrA9k0AqTnfB5nc/oCHwDhbpJM4qEZDdbtvSLI7fy
	IrLVLIGyCYck3SnL4Pc7cl12m3cr0YWKtZBEofzXKq4uD5ClZmRYWdjMVZg0+irf5F3bdjLxCBT
	U0VPwnCvN0woiizB83yescwdbapWjKDWqFiZVA7kvS5CWqQeGWxtRQ+syn1TEB0k/DEPzJwB7fb
	CG/e8iqwNfUrJ6PBneJxsFmfYx7LveI5vcQnvNmrJbZcdopFh4qIo3b71VFB8S8EzbuD9aNJbXu
	sc/yI+TovwoO5uuVvIAf62U0vpUli180A==
X-Received: by 2002:a05:600c:5250:b0:4a0:1c0e:b136 with SMTP id 5b1f17b1804b1-4a1d7616bfdmr68137185e9.29.1792262334073;
        Sat, 17 Oct 2026 11:38:54 -0700 (PDT)
Received: from [192.168.0.20] (nborisov.ddns.nbis.net. [185.218.66.243])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1cf04ffe9sm98606395e9.0.2026.10.17.11.38.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Oct 2026 11:38:52 -0700 (PDT)
Message-ID: <8c892695-7ec5-4d93-a74b-487fe535c3f4@suse.com>
Date: Sat, 17 Oct 2026 21:38:50 +0300
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 06/15] virt: tdx-guest: Support TDI bind and unbind
 operations
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
 <20260924041032.1096569-7-zhenzhong.duan@intel.com>
From: Nikolay Borisov <nik.borisov@suse.com>
Content-Language: en-US
Autocrypt: addr=nik.borisov@suse.com; keydata=
 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
In-Reply-To: <20260924041032.1096569-7-zhenzhong.duan@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 24.09.26 г. 7:10 ч., Zhenzhong Duan wrote:
> Introduce support for binding and unbinding the Trust Device Interface
> (TDI) using the TDCM_OP_BIND and TDCM_OP_UNBIND commands.
> 
> Executing TDCM_OP_BIND transitions the TDI state to a locked state
> (TDI_STATE_CONFIG_LOCKED). Add a sanity check following the bind operation
> to verify this state transition succeeded before finalizing device locking.
> 
> Signed-off-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
> ---
>   drivers/virt/coco/tdx-guest/connect.c | 75 +++++++++++++++++++++++++++
>   1 file changed, 75 insertions(+)
> 
> diff --git a/drivers/virt/coco/tdx-guest/connect.c b/drivers/virt/coco/tdx-guest/connect.c
> index 1f52a187b30f..e36515fc43ef 100644
> --- a/drivers/virt/coco/tdx-guest/connect.c
> +++ b/drivers/virt/coco/tdx-guest/connect.c
> @@ -159,8 +159,67 @@ static bool tdx_is_dev_teeio_support(struct tdx_devsec *tdevsec)
>   	return !!rsp->is_supported;
>   }
>   

<snip>

> +
>   static struct pci_tsm *tdx_devsec_lock(struct tsm_dev *tsm_dev, struct pci_dev *pdev)
>   {
> +	u8 state;
>   	int ret;
>   
>   	struct tdx_devsec *tdevsec __free(kfree) = kzalloc(sizeof(*tdevsec), GFP_KERNEL);
> @@ -174,6 +233,19 @@ static struct pci_tsm *tdx_devsec_lock(struct tsm_dev *tsm_dev, struct pci_dev *
>   	if (!tdx_is_dev_teeio_support(tdevsec))
>   		return ERR_PTR(-EOPNOTSUPP);
>   
> +	struct tdx_devsec *tdevsec_bind __free(tdx_tdi_unbind_dev) = tdx_tdi_bind_dev(tdevsec);
> +	if (IS_ERR(tdevsec_bind))
> +		return ERR_CAST(tdevsec_bind);
> +
> +	ret = tdx_tdi_read_state(tdevsec, &state);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
> +	if (state != TDI_STATE_CONFIG_LOCKED)
> +		return ERR_PTR(-EIO);
> +
> +	retain_and_null_ptr(tdevsec_bind);
> +
>   	return &no_free_ptr(tdevsec)->pci.base_tsm;
>   }
>   
> @@ -181,6 +253,9 @@ static void tdx_devsec_unlock(struct pci_tsm *tsm)
>   {
>   	struct tdx_devsec *tdevsec = to_tdx_devsec(tsm);
>   
> +	if (WARN_ON(tdx_tdi_unbind_dev(tdevsec)))
> +		return;

<Thinking out loud>

So unlock involves calling TDCM_UNBIND which in turn might fail for any 
number of reasons and yet we have no way of communicating that. So after 
an unlock a TD might want to rebind and issue bind on a device which is 
already bound because prior unbind failed. Is this something we should 
be worried about ?

> +
>   	kfree(tdevsec);
>   }
>   

