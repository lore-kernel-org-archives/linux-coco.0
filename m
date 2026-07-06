Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 117CC3BE646
	for <linux-coco@lists.linux.dev>; Mon,  6 Jul 2026 18:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783362937; cv=pass; b=iJbi8voQvV/AkkRmqrqeCDOLL1IMg1QNWTcRQc2rLIKATnv0gN3N/CzVtITy3oT2rBtD7xy+9L4ALRh/W41r15nvnhaFT0LNGu2DcXwlSWTqpinX0WUVPh9wzDp2e7yIc0krmFJfdbasbEmrLdBmvZecQzovFdsFd0Dqz/lajO0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783362937; c=relaxed/simple;
	bh=HPrlRjR/87Sgv7afW4R5TLpUfuybQzJj2nJz3LNjgt4=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QPrZIpBKdKKxAxWFyWcNLs2mp4kZlg3Ipjjqe8oHvf8pJeRl6rixi5LjmTwFjgJtxj9pz0spOSEOHztzg7FceVx6jrIckarMyqD9RoWpR6f1KgSxsguViX8rQpDGPHupL2O8+wTabFavxg18rP41JZp+Gso5tjaOXyHpl0lV4VA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RxKJcCLO; arc=pass smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RxKJcCLO"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2cc891373e0so15160845ad.2
        for <linux-coco@lists.linux.dev>; Mon, 06 Jul 2026 11:35:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783362935; cv=none;
        d=google.com; s=arc-20260327;
        b=dPLEKEpKPc1X6h/q2W29gendcnBFGNepwZu+MbiW+rpRHrbdne93ZMLzXqokYLaTKR
         96atDDQDwfNRETkSAn6p7Z5UTiRRQ4wp6oDSuFUTn4SnGLzgh+KI/L96aA2iQ9sdLXez
         3lOdZ5kD+p1r5qTIxiNhzdjRvqjBpZFb44Mi6jy1ket+JAjFVK5RmFk7NUA/r/HCxWKs
         6/61wRwSHpZj3aosTwuSxbCRjNxOY8PiJnvKujQ/gw0NwguYeVXGc2HnnrMthqzsRMxR
         4XHth/6LD+QdmGm0Fr1xwUMLjly9FU8tFQk7EPTyWQvYJXzegiWL1saGT12sqNHyz7Pp
         ZMBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=WnS2RNIXat7zDN2phUDyBGT8PFFJ5aIBlxvkpKQm44c=;
        fh=L2AveHFpNUWCrmMqAOTHF2rRLXpZV70Ti1xLZaTRvkY=;
        b=TN5OJteWge8Rbj869cWOKYKA0dpelWkKu/0t89B2BMbehxngQZwlsOKPpMjqJf7Utp
         XNQitW384AUAQBeY2jZ9ZaLkwOZgFFJMt9W7SbkzXDBUDC0IKUvVzdEU+aceLLHfjh8e
         qyi7aquJi1TeigkmQ7sptHAIkRAO6gpE2Q++pBl/TZ7c+8J0Dt4HolfvDuy2Fd1rJT/e
         cwah0bCoex7XrClM4rYnpJvvXFGXd1La0wKYxea8jLFZOnT7QdQ87FHS9M07tFX7CBNj
         jOxgH8w3xWfpy9zw2pulzn8qm746T3TqUFOzG3bweg5nFmcfSWQ2PAY3zYT+Pg+lNMV/
         qfNA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783362935; x=1783967735; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=WnS2RNIXat7zDN2phUDyBGT8PFFJ5aIBlxvkpKQm44c=;
        b=RxKJcCLOY8diYRtvXASiDZ+A1qBllKcu285RkjJCTQflVYwK/1ofBJ3vfdkq0l6lId
         MyajFBPMS986xM5m91ipYznjt22xrdyUeNDOjP/wVHNzOIyoIwXSMm5LH1JQEzLbKppi
         CKIBtwlEzJd4VdXLMoRW9IoStx9UugiHh1hR316KVAqex9Q//VqQ/xGMBIHqZFJ22qT5
         PFXiSuyvFwkDzzm6Ey3ZurDEPHRWzgZuuW6G5QuRxBRV0ntjEkC0207KlnL1KP7SHuYr
         9ArDaAPFC3x+qRKXxS7ep5JIDzFr9BLizkFXOrds61T0c9XBH9RIGsuMI1kl2aSC+Sho
         qIlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783362935; x=1783967735;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WnS2RNIXat7zDN2phUDyBGT8PFFJ5aIBlxvkpKQm44c=;
        b=c985W6BRgHeRv5Mz/JLvdN6W5t+2zv3B6I/EdJV44Lsk0CVIcPwPr3kZrj2o8jv1sP
         /MWe0h/UzQFcjXm9HP9qDqaMq3MBMzcj73ihTHSZ3SUxCbKaBJ3tOHosCGNH4j4p9Pof
         37U6otvv+MiSXWLgaG/O1B43iBMBbgykGio/8hz+FtCBz4K2g3VgHXThmDKNJ4cS83eh
         lYz3TsG4yn9VQYS/6fkEVAJb8p6tw6mm8q7rR0mVJpOMp40Zv5//7svooOnQVgv20SNK
         UwcTIAX6FSv8OQ3E1xZUBdDRq1v6oEmNPgNMGR6gk+Wgs1oIzLUWU3e2H3G2Tz9YdaLf
         YhJA==
X-Forwarded-Encrypted: i=1; AHgh+RpKzziY+5h/63GAyyeT/L4NuJbCYChqLj0moUPQxE2FI+XPdsvcWdQPhIPnCvWKe90+5uUZY7RiVK1e@lists.linux.dev
X-Gm-Message-State: AOJu0Yy3DtLw9XZJVKbERBl6m3M4evnN85k27y8q3riGQiqwbKX6rmrx
	VqPwHC1aKEZfcSAPodLbNwoFb43eBcftjLzH06LcZmusUN3CzFqQoO00BTHbG2H9AhC+cVtW19s
	EPIq0KZiIfne/PsC8tnAF1UJRvtkz+v6yw9uvoVVtv5RleT+3mf58JkDTsS0=
X-Gm-Gg: AfdE7ckUdDRf9drBWFoDCD8C2WEbiQK88ZaDa5ZcWRqV23fRJNHcsM1r/S8q47aC0du
	QhChpcd8XEX7C+B+2q++HAjFH//+iA8/l5Ee8rmMJujxTLeo55zrdHESN1A6Eew5RSMBzbmJ2Ui
	Qmfvh1U4IHoSz36wuguWELrELNRyNcPuaUea3Xw2vFViKOtn7Nk5LbSbxUVElUtDHs/i+Jyf6FZ
	yIZ6V2369sS/70aOd4F/le4cZf5R8dTn0QJcZ86yiZdHJA6VJrMKYhy60fvEr4nXFmtylvNDAjX
	CFnk46gxrCvY0RIXpLvbfJbvc6Lbh18YKIjSpU0S58B0Ct8Pe7jh5qAFTGg=
X-Received: by 2002:a05:6a21:1f83:b0:3bf:6c04:a812 with SMTP id
 adf61e73a8af0-3c08ef1dd4dmr2080840637.51.1783362934943; Mon, 06 Jul 2026
 11:35:34 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 6 Jul 2026 11:35:34 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 6 Jul 2026 11:35:34 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20260327160132.2946114-23-yilun.xu@linux.intel.com>
References: <20260327160132.2946114-1-yilun.xu@linux.intel.com> <20260327160132.2946114-23-yilun.xu@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Mon, 6 Jul 2026 11:35:34 -0700
X-Gm-Features: AVVi8CdqD5g74lv_vdWGXV2KWJo0HCHGQ2q9sBsYTjhrRT829V9HzSMACy2bRlo
Message-ID: <CAEvNRgG-6aOgtW9cB6zE7278B=0fB9KSEH18Kw8qNF2sBtUBsQ@mail.gmail.com>
Subject: Re: [PATCH v2 22/31] iommu/vt-d: Export a helper to do function for
 each dmar_drhd_unit
To: Xu Yilun <yilun.xu@linux.intel.com>, linux-coco@lists.linux.dev, 
	linux-pci@vger.kernel.org, dan.j.williams@intel.com, x86@kernel.org
Cc: chao.gao@intel.com, dave.jiang@intel.com, baolu.lu@linux.intel.com, 
	yilun.xu@intel.com, zhenzhong.duan@intel.com, kvm@vger.kernel.org, 
	rick.p.edgecombe@intel.com, dave.hansen@linux.intel.com, kas@kernel.org, 
	xiaoyao.li@intel.com, vishal.l.verma@intel.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Xu Yilun <yilun.xu@linux.intel.com> writes:

> Enable the tdx-host module to get VTBAR address for every IOMMU device.
> The VTBAR address is for TDX Module to identify the IOMMU device and
> setup its trusted configuraion.
>

I think this commit message doesn't match the commit subject or the
change, unless I'm misunderstanding something

> Suggested-by: Lu Baolu <baolu.lu@linux.intel.com>
> Signed-off-by: Xu Yilun <yilun.xu@linux.intel.com>
> ---
>  include/linux/dmar.h       |  2 ++
>  drivers/iommu/intel/dmar.c | 16 ++++++++++++++++
>  2 files changed, 18 insertions(+)
>
> diff --git a/include/linux/dmar.h b/include/linux/dmar.h
> index 692b2b445761..cd8d9f440975 100644
> --- a/include/linux/dmar.h
> +++ b/include/linux/dmar.h
> @@ -86,6 +86,8 @@ extern struct list_head dmar_drhd_units;
>  				dmar_rcu_check())			\
>  		if (i=drhd->iommu, 0) {} else
>
> +int do_for_each_drhd_unit(int (*fn)(struct dmar_drhd_unit *));
> +
>  static inline bool dmar_rcu_check(void)
>  {
>  	return rwsem_is_locked(&dmar_global_lock) ||
> diff --git a/drivers/iommu/intel/dmar.c b/drivers/iommu/intel/dmar.c
> index 4f9571eee1d4..eea9ba691f99 100644
> --- a/drivers/iommu/intel/dmar.c
> +++ b/drivers/iommu/intel/dmar.c
> @@ -2452,3 +2452,19 @@ bool dmar_platform_optin(void)
>  	return ret;
>  }
>  EXPORT_SYMBOL_GPL(dmar_platform_optin);
> +
> +int do_for_each_drhd_unit(int (*fn)(struct dmar_drhd_unit *))
> +{
> +	struct dmar_drhd_unit *drhd;
> +	int ret;
> +
> +	guard(rwsem_read)(&dmar_global_lock);
> +
> +	for_each_drhd_unit(drhd) {
> +		ret = fn(drhd);
> +		if (ret)
> +			return ret;
> +	}
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(do_for_each_drhd_unit);
> --
> 2.25.1
