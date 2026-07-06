Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 674E73D75D1
	for <linux-coco@lists.linux.dev>; Mon,  6 Jul 2026 19:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783365716; cv=pass; b=AXWbqBtEq7VI1BNBFjw11yQQflR3Aphokg7OhehVS+VpzpU105k6wIirlPtIAIuzAo3DXmzuvNWh/NGxZ+Ce31VeusdYfhiRD0U+p23RZcOkpKORcEsFlQdIMS9fq6XSq2iOKzPVxiqZ/PZS2E3K5tgJHLnT0I0+xexgo05scC4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783365716; c=relaxed/simple;
	bh=OWqGJ2RXJX8lewCAqOdEDrfTZRegAiM0hVxCTzGD9RM=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hbJVcm630Kh/JyKbvFD+ez9YTz87r8a3ueIDGTqb+rlq+zQg0wWIl2o9hzwi96lM3Y67nU+P2pK3W3qQsU7va9X1k4bhXWRzj5eFPtZESW0A1xryfjqJ1oKIS+KAA7k13s5OYhuNxMvEHCyaqK2lZiKRJQ9NkOsWPZOW0acidGI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bJWMCGhf; arc=pass smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bJWMCGhf"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-c96b08cdd1cso2448060a12.0
        for <linux-coco@lists.linux.dev>; Mon, 06 Jul 2026 12:21:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783365715; cv=none;
        d=google.com; s=arc-20260327;
        b=gV0xqwSPRfdail7FwXqD9ErvIc0aHw7IsnHKUj0DGqn0/3f4ACMjbn1rEH8cabofCS
         a1a7r086cKZvoiRZw+R3J5dZzXZ/0A253Rmxt/n9Qhwox9mnTddRAJ7Xp3Ctuv7oFiqC
         kHgLIRnVfE3TBhMSIt2uLmAb8T79CKIPu9jS5J4hHdDwQNpmiMIpIROqE3Yxfz8oU+ao
         78DRBjcaOzlVse5KwIcwrevcrKV4m5PDOvK6PfNzpYyGk/JnuIIebLecGNngYGeqRPd1
         HckEOG8dZ6AH3a8EJKcKKNLKr1O8JQAzTdTpXtdVBWmFsYUDsseLaupKGhulipOC49aI
         gD4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=3V+CQWicM3KLCiA78W5fLi8JtVISekHIFvC89/oYT3Q=;
        fh=j/PznWyg0br349nHN+nwZU3c/QvToivx9dH+4D9gwNQ=;
        b=g2pWF7uExJKF0QVkdwcdT/bkHVhyICLIV9KMp4M3rqwaOpWahxFLUTRvanPDeyXc0K
         eUY7qYti/JqUJLGG/maL2EOoZHXGRlUnZXZyaQPKm7mOeF7R5h2VYT3E4Y+GbFfqPRw3
         gqSEm4juqcLI7Kurxfc3B3BLAHJmt34uyoQz72Df5c7U+emIbqTBJJyiP0iMVw7WRfTC
         2yW4LSrSdpCMr+zXnTqtzKGzyFfILYn7P7ZfBBeYTpDfCPDTlWbHmCkfgGEuzxqPaCbb
         7mwTMQCpwK+CZcTbGHdw/mh+aqzeV8nVgnMUsnzgocXkep9kgyL4eGTplaO+hWn7pvtr
         jV0w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783365715; x=1783970515; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=3V+CQWicM3KLCiA78W5fLi8JtVISekHIFvC89/oYT3Q=;
        b=bJWMCGhfTgTQcw5GPGGhqM/jH9nSlPTeDu352T41+VfrJDluamHP+Sb5A1cOz7v5k7
         EnZND9Zhk4XA4UcjPymlHNG7ZDVSSqtKeJyU2d8zyxDV/GMpNEbmVngkv99wFOHJ1twS
         0H0P8V6laaAPlNgSK1q4gxnCKVVHg64SGF6BvCET5v7wi3+4xomC3zhBw8Fx8TURwk6B
         4AcK0uFicofuovhsMjgd3QGAgYmwwzBebLp7TnHlk8Y2T9YLEZCEZSZte+wpCyptWNXs
         WoRhi7CHsndztWFTYqAR9wuFU3uy3YCQTs9Aq64cRG5WASxZ6tgHRL9wXESdWvGhIXtR
         s0Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783365715; x=1783970515;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3V+CQWicM3KLCiA78W5fLi8JtVISekHIFvC89/oYT3Q=;
        b=SLldBm4yFKLYiXTZZc2AjzIVjGVEr0YJD56bS83t1HaxebfI/w3NNPvG8QcWlrKmk4
         d7ag90fSdgPUwMhT31Am8x/G10xTXq7cZeoOyBKJ2lgUj87Ig1n2YCk79JFixoIbN1XK
         hnZ85jnbYtIJPDuhmui1KWUyPrXpJbVvzEBKrIfdUetIOgCBaBmmAMFpBSK9sFKh+2nM
         kxHpk4GNk/bczNOKXSVM4LCjKWpG+93OE4gKoHlm+WawW3+fe+nW3SRu4MUSt2jnVwZs
         9vk41mvj1OQKkpnUFV2NhXx6MMyOK4mIMyK7YS8pE/EtnB8C+ZtF30vNXExm03pDkvVX
         9G7g==
X-Forwarded-Encrypted: i=1; AHgh+RpiAVvIxkxQoWxWtFGcZQWY6DW65LfvhhsXEVHZMUivWJ4cqfehQNYbVtcGnt/qmDBAETZsJWK5SELL@lists.linux.dev
X-Gm-Message-State: AOJu0YyvGhNsiTN0sVZeJXGXY0SEVAipZeu4TS94JmIwiFU8QrYsvGpx
	IbuBXzC2xaaE07nm+MxFSRqRYnxAZzcIBgVDgb3toKBqi/yFujIiF72SJJm8Ya0bqqeMapdpFtF
	hKMrO7pMmOnPSakKFLicUmkwfwvm6Y0Hx/rz8axCCjBJceYXXljavkf220mg=
X-Gm-Gg: AfdE7clGDc5Kh9GbAhtUp9zKZPtJ9vDarnhVSZLZF0jYTLl2p6Xp4IOJcqsO5bJqID+
	SXdBEzDhdltb0zJ+pkiGroO3RTrYso9mFZ6YNx7MP41EWpOthFA4FJEkBZPQYUONsPCUlaYtfdG
	PyZKy8hXfjzdjxqdE+IH1a6Y697ik+dJBBGXpvGO/Vixy5SAyabvVJSOOVBYXvJUKuinxw1tTYi
	FhLa0dK3M2XmUPx4k62zPD5QZF/OJEbnnPuq1gY7wvZZrSUS4OvdAYSj7s/SVmPGQnA6UtAUby7
	4Tjy/uBZn0sNjg73glKlRA4gP96teuY9UbGiILoNlMlI4Z9jGESa9qhS9u4=
X-Received: by 2002:a05:6a20:d499:b0:3b2:a809:1000 with SMTP id
 adf61e73a8af0-3c08ed14337mr2309434637.3.1783365714229; Mon, 06 Jul 2026
 12:21:54 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 6 Jul 2026 12:21:53 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 6 Jul 2026 12:21:53 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20260327160132.2946114-24-yilun.xu@linux.intel.com>
References: <20260327160132.2946114-1-yilun.xu@linux.intel.com> <20260327160132.2946114-24-yilun.xu@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Mon, 6 Jul 2026 12:21:53 -0700
X-Gm-Features: AVVi8Cd9CK0d5hkj-fvDpFPP8e629cstUI2GaeEwDwzmHyMfLj4nBn8EKPgaG0Y
Message-ID: <CAEvNRgGg9YVnLzanueJrHyt9Ra3-q7CmRvP2Sg5dkdctaZpKqw@mail.gmail.com>
Subject: Re: [PATCH v2 23/31] coco/tdx-host: Setup all trusted IOMMUs on TDX
 Connect init
To: Xu Yilun <yilun.xu@linux.intel.com>, linux-coco@lists.linux.dev, 
	linux-pci@vger.kernel.org, dan.j.williams@intel.com, x86@kernel.org
Cc: chao.gao@intel.com, dave.jiang@intel.com, baolu.lu@linux.intel.com, 
	yilun.xu@intel.com, zhenzhong.duan@intel.com, kvm@vger.kernel.org, 
	rick.p.edgecombe@intel.com, dave.hansen@linux.intel.com, kas@kernel.org, 
	xiaoyao.li@intel.com, vishal.l.verma@intel.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Xu Yilun <yilun.xu@linux.intel.com> writes:

> Setup all trusted IOMMUs on TDX Connect initialization and clear all on
> TDX Connect removal.
>
> Trusted IOMMU setup is the pre-condition for all following TDX Connect
> operations such as SPDM/IDE setup. It is more of a platform
> configuration than a standalone IOMMU configuration, so put the
> implementation in tdx-host driver.
>

I was wondering about hotplug. There's dmar_device_hotplug(). Does it
make sense to do TDH.IOMMU.SETUP from there?

For boot, is the platform-level configuration due to dependencies? Is it
because TDX is set up after IOMMUs and hence TDH.IOMMU.SETUP is done
from the creation of the faux device?

> There is no dedicated way to enumerate which IOMMU devices support
> trusted operations. The host has to call TDH.IOMMU.SETUP on all IOMMU
> devices and tell their trusted capability by the return value.
>
>
> [...snip...]
>
> @@ -119,6 +120,82 @@ static void unregister_link_tsm(void *link)
>  	tsm_unregister(link);
>  }
>
> +static DEFINE_XARRAY(tlink_iommu_xa);
> +
> +static void tdx_iommu_clear(u64 iommu_id, struct tdx_page_array *iommu_mt)
> +{
> +	u64 r;
> +
> +	r = tdh_iommu_clear(iommu_id, iommu_mt);
> +	if (r) {
> +		pr_err("fail to clear tdx iommu 0x%llx\n", r);
> +		goto leak;
> +	}
> +
> +	if (tdx_page_array_ctrl_release(iommu_mt, iommu_mt->nr_pages,
> +					virt_to_phys(iommu_mt->root))) {
> +		pr_err("fail to release iommu_mt pages\n");
> +		goto leak;
> +	}
> +
> +	return;
> +
> +leak:
> +	tdx_page_array_ctrl_leak(iommu_mt);
> +}
> +
> +static int tdx_iommu_enable_one(struct dmar_drhd_unit *drhd)
> +{
> +	unsigned int nr_pages = tdx_sysinfo->connect.iommu_mt_page_count;
> +	u64 r, iommu_id;
> +	int ret;
> +
> +	struct tdx_page_array *iommu_mt __free(tdx_page_array_free) =
> +		tdx_page_array_create_iommu_mt(1, nr_pages);
> +	if (!iommu_mt)
> +		return -ENOMEM;
> +
> +	r = tdh_iommu_setup(drhd->reg_base_addr, iommu_mt, &iommu_id);
> +	/* This drhd doesn't support tdx mode, skip. */
> +	if ((r & TDX_SEAMCALL_STATUS_MASK)  == TDX_OPERAND_INVALID)

Extra space here before ==.

Is there a chance that TDX_OPERAND_INVALID might be returned for some
other reason other than that the drhd doesn't support TDX? I'm concerned
that some drhd would be silently skipped for some other error.

> +		return 0;
> +
> +	if (r) {
> +		pr_err("fail to enable tdx mode for DRHD[0x%llx]\n",
> +		       drhd->reg_base_addr);
> +		return -EFAULT;
> +	}
> +
> +	ret = xa_insert(&tlink_iommu_xa, (unsigned long)iommu_id,
> +			no_free_ptr(iommu_mt), GFP_KERNEL);
> +	if (ret) {
> +		tdx_iommu_clear(iommu_id, iommu_mt);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static void tdx_iommu_disable_all(void *data)
> +{
> +	struct tdx_page_array *iommu_mt;
> +	unsigned long iommu_id;
> +
> +	xa_for_each(&tlink_iommu_xa, iommu_id, iommu_mt)
> +		tdx_iommu_clear(iommu_id, iommu_mt);
> +}
> +

Is there an equivalent teardown operation? Like on kexec, if TDX is torn
down, would tdx_iommu_disable_all() need to be called to undo
everything, so that after TDX is started again tdx_iommu_enable_all()
would be set up again?

For hot-unplug, would the TDX IOMMU config need to be disabled?

> +static int tdx_iommu_enable_all(void)
> +{
> +	int ret;
> +
> +	ret = do_for_each_drhd_unit(tdx_iommu_enable_one);
> +	if (ret)
> +		tdx_iommu_disable_all(NULL);
> +
> +	return ret;
> +}
> +
>  static int __maybe_unused tdx_connect_init(struct device *dev)
>  {
>  	struct tsm_dev *link;
> @@ -130,6 +207,14 @@ static int __maybe_unused tdx_connect_init(struct device *dev)
>  	if (!(tdx_sysinfo->features.tdx_features0 & TDX_FEATURES0_TDXCONNECT))
>  		return 0;
>
> +	ret = tdx_iommu_enable_all();
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Enable tdx iommu failed\n");
> +
> +	ret = devm_add_action_or_reset(dev, tdx_iommu_disable_all, NULL);
> +	if (ret)
> +		return ret;
> +
>  	link = tsm_register(dev, &tdx_tsm_link_ops);
>  	if (IS_ERR(link))
>  		return dev_err_probe(dev, PTR_ERR(link),
> --
> 2.25.1
