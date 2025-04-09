Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BA5525D542
	for <linux-coco@lists.linux.dev>; Wed,  9 Apr 2025 10:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744195397; cv=none; b=VAE8tKWLRWxCHPAPKNrW4WCi+v5qbMg5ZGptrZZ7jk75NuPHQQTe7xHX9xYam5JIuyezywtNqpKO/Sh+oRKen2uQm77K/udkFEeUs9P5907Flz/n4ksgNGHExlfbt7wIIBTmVvtsVRL3YgD8ij4Xj9QTWyNERkEJaeuWIjVMEnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744195397; c=relaxed/simple;
	bh=A/FlqmaIzcO4c8nAuBHIloGWE3rDWwPZOR27kQ1vVdA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P3uuvG6gWNNLJt2g6o7fmgp8rAyfT9BZfjt4LDjZPdw18UTwXPfwu6pFponne4W1xtzFuUxbU36f9AA85GDhO6fetDJm1DaFkCUfVDxPRF/J4jdSg512fyXbvOMJcPb3izsTpseuI6ousB1ZABTNuWPqjUAng32zKJyUAcA5u0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=faOg85dN; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="faOg85dN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744195395;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EnfObN/lFf683o8WuLfplJQb1/cYuQGkU+V1Bcc+zTA=;
	b=faOg85dNB73UyyYuViZ5JaBU2Z5/JC4V1aLvF2hI6jgsxqbeAjWF/q6bDFwSJkETQoJ9eJ
	44pRSgJPynh7bAAHYYr0RhX7muoQwgWQfEfWAEd+Db83RD6WyBuKFLjR4IoZg/Z+zlKsnN
	C1gT7BPCJlQHkpdeRroEXwAkqUgEuwA=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-570-6R8aEHuTMlSZPcaXrMYE0A-1; Wed, 09 Apr 2025 06:43:14 -0400
X-MC-Unique: 6R8aEHuTMlSZPcaXrMYE0A-1
X-Mimecast-MFC-AGG-ID: 6R8aEHuTMlSZPcaXrMYE0A_1744195393
Received: by mail-yb1-f198.google.com with SMTP id 3f1490d57ef6-e643fea7fd8so863382276.1
        for <linux-coco@lists.linux.dev>; Wed, 09 Apr 2025 03:43:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744195393; x=1744800193;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EnfObN/lFf683o8WuLfplJQb1/cYuQGkU+V1Bcc+zTA=;
        b=KoxThYOcF/mvz409TYo4UAqZqdnTSZuLUVXDHByDC3vzwVJG0Dkw5qsaqt9tQj4fGs
         9q8s4JaWO7SIS2BlxpcKxGIpo8mVea3N9o8JbYbOZgvmVb1xad6F+K8eqyUdt4C1odpF
         sSeoGuq7ASSt6DGZPbfRtz6P9YNr7Ueaa3TXpuQf1+B2I66pt/a6w18JQgrBgdpjbTYt
         0P4m32eKLuuo+279JfYNxPwaGFFYBWjrJWvaOk1wAtC9c+Ek/pNbU2NXMad4vae8Dteb
         RzB/wxVOuDxs8h89BNggAsLAP8hC3Vje42gVAape4J1TdbkJItiEvHE65Erqq5+y75AN
         aBng==
X-Forwarded-Encrypted: i=1; AJvYcCXyZtQKyDiEwYv9tIBDj87V4HtCwaSLQZ2b9guqdagowcf4WOtK2wppMdyM0wfmgt1Q9C2UCKZTq+VI@lists.linux.dev
X-Gm-Message-State: AOJu0Yx8Wln8SFYSBXnli5Eias3mkqLRVrR+7iuDqyhQxyG5hxbG8nZx
	EQTH9buYNG8x9ibFAShJxVtARw+zWYxplwW58SdNFIUS+hkCQhd7TnK1K20XrDr0GJ47gnmLM1L
	vcGRNJGAI6IQJTVx/xEK+p3gtzjkWnFr6mFsofCf9l4d/SZYq2xrU5pWHsQcPorjc2D7A//ZD38
	cN/3BNQfltPwJynqW9f7lzPWORXpO2hnrrZQ==
X-Gm-Gg: ASbGncuKDNJQ/HdlRrD/3PnwnDaFsmU4j04PNDRoKjZV1CPE/q265VuNwvMzaEwf2hQ
	/dINj7zmGFY5SFJqPOxcdofiODS353KXJf1ZX4xEFOtJHeRIclLByil6FlV6qJvik430=
X-Received: by 2002:a05:6902:2487:b0:e61:142a:82b1 with SMTP id 3f1490d57ef6-e6e5da76d6dmr11417305276.16.1744195393475;
        Wed, 09 Apr 2025 03:43:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH9XLCSiAWV0l0Xyy3erc/2RwiuGpJfzHLbxLJRgI2MfphnLTk5GZMmDYdIvEsBTniIkRBZyC9Yc3m0F9mrx/U=
X-Received: by 2002:a05:6902:2487:b0:e61:142a:82b1 with SMTP id
 3f1490d57ef6-e6e5da76d6dmr11417256276.16.1744195393057; Wed, 09 Apr 2025
 03:43:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250403100943.120738-1-sgarzare@redhat.com> <20250403100943.120738-5-sgarzare@redhat.com>
 <20250408110012.GFZ_UBvOcEfEcIM4mI@fat_crate.local> <eqtiiphs6rtjo7nirkw7zcicew75wnl4ydenrt5vl6jdpqdgj6@2brjlyjbqhoq>
 <20250408112820.GBZ_UIVPp-LuIiVrIV@fat_crate.local> <o2u7p3wb64lcc4sziunr274hyubkgmspzdjcvihbpzkw6mkvpo@sjq3vi4y2qfl>
 <20250409102120.GCZ_ZKIJw9WkXpTz4u@fat_crate.local>
In-Reply-To: <20250409102120.GCZ_ZKIJw9WkXpTz4u@fat_crate.local>
From: Stefano Garzarella <sgarzare@redhat.com>
Date: Wed, 9 Apr 2025 12:43:01 +0200
X-Gm-Features: ATxdqUEEmadHBgiIuGJgxnDt-QGQF_QGugtY5XSP7f88rY67_2s-xBx1Kyl3594
Message-ID: <CAGxU2F7r_fWgr2YRmCvh2iQ1vPg30f-+W6FXyuidbakZkwhw2w@mail.gmail.com>
Subject: Re: [PATCH v6 4/4] x86/sev: register tpm-svsm platform device
To: Borislav Petkov <bp@alien8.de>
Cc: Jarkko Sakkinen <jarkko@kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Peter Huewe <peterhuewe@gmx.de>, Jason Gunthorpe <jgg@ziepe.ca>, "H. Peter Anvin" <hpa@zytor.com>, 
	linux-coco@lists.linux.dev, linux-integrity@vger.kernel.org, 
	Ingo Molnar <mingo@redhat.com>, x86@kernel.org, Tom Lendacky <thomas.lendacky@amd.com>, 
	Joerg Roedel <jroedel@suse.de>, Dionna Glaze <dionnaglaze@google.com>, 
	Claudio Carvalho <cclaudio@linux.ibm.com>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, linux-kernel@vger.kernel.org, 
	Dov Murik <dovmurik@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: pJ9jDz-m6Z8itDFkQhIXCxZwQTfK_QyfyHnLQC95sGk_1744195393
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Wed, 9 Apr 2025 at 12:21, Borislav Petkov <bp@alien8.de> wrote:
>
> On Tue, Apr 08, 2025 at 01:54:07PM +0200, Stefano Garzarella wrote:
> > I see, so IIUC I can just apply the following change to this patch and avoid
> > to export snp_svsm_vtpm_probe() at all, right?
> >
> > diff --git a/arch/x86/coco/sev/core.c b/arch/x86/coco/sev/core.c
> > index acbd9bc526b1..fa83e6c7f990 100644
> > --- a/arch/x86/coco/sev/core.c
> > +++ b/arch/x86/coco/sev/core.c
> > @@ -2702,8 +2702,10 @@ static int __init snp_init_platform_device(void)
> >         if (platform_device_register(&sev_guest_device))
> >                 return -ENODEV;
> > -       if (platform_device_register(&tpm_svsm_device))
> > -               return -ENODEV;
> > +       if (snp_svsm_vtpm_probe()) {
> > +               if (platform_device_register(&tpm_svsm_device))
> > +                       return -ENODEV;
> > +       }
> >         pr_info("SNP guest platform device initialized.\n");
> >         return 0;
>
> No, this should go in tpm_svsm_probe().

Sorry, maybe I missed something.

tpm_svsm.c registers the driver with module_platform_driver_probe().

Someone (the platform I guess) has to register the device by calling
platform_device_register(), as we already do for example for
sev_guest.

If we move platform_device_register() to tpm_svsm_probe() how will the
probe be invoked?

Thanks,
Stefano

