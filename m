Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97D2426E148
	for <linux-coco@lists.linux.dev>; Wed,  9 Apr 2025 16:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744217532; cv=none; b=ue+XloCoyA82o7uUcw/zv7G9BMZG1vBv7TZ6GE4Pu3qA8K0/ol4ZFLM0L9FeUmFpAI8FNpi2q4y7ShQkJzZBmfHFg6+z9gbeO4Nkl4DXsKFjq3eYLiStZ/MuF2SHeVB/XZa+AZKXQqowGNvguXwGe6iDsWogQfEHTuUVV7yb5HE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744217532; c=relaxed/simple;
	bh=WmdXdssA04lzq+kg5zcA/34rnB+wjGgMZjhqBx5G1j0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I61sQZoYVJZu8nXozDgGs4QRr+ZfSpOTw43yFGzOgzaM+PayVX8Li9sOUSxR9Lx7klrJ9d7KkyAorOBKFertR0TkpNbeFhTGWvm0dMWFo3KLCacRKx3jeIEI1W8iePNzYW2efMOmVxD0xhoI3BIfhRRj2uVQsI5pfZ2YF1Vo89g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=V9Er/itY; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="V9Er/itY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744217529;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GcJmV42DoLO51Xqo6xJgLe2Sf0B0NEZebsChSe2rsW4=;
	b=V9Er/itYJ55wAPkhhyGIHHii05CK2uq62IVbv9jc080VgKcOlIDKj/j0qOIFXCh/Thlay/
	b1BB6b7tZ3kVdF4Ldhz4ptFVBOpZfp7Tmw689DQd+IOOwLdmXBa1UaJa4DU9A+L+X9tuEe
	7q5iSiHkxi4U4elll1q+7lk2ReZJCRc=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-310-0XOMos5wOsKKEHZEofH7NQ-1; Wed, 09 Apr 2025 12:52:08 -0400
X-MC-Unique: 0XOMos5wOsKKEHZEofH7NQ-1
X-Mimecast-MFC-AGG-ID: 0XOMos5wOsKKEHZEofH7NQ_1744217527
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-6ff4d1b7490so89423467b3.0
        for <linux-coco@lists.linux.dev>; Wed, 09 Apr 2025 09:52:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744217527; x=1744822327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GcJmV42DoLO51Xqo6xJgLe2Sf0B0NEZebsChSe2rsW4=;
        b=o8b94chtMzTms21iA1NhbJBZF5EQKIoJNue+VFoG5zsyuj9skeIenivTlzLJ/DvIei
         jiKA/yuYIDyapoehAJfDBVHDTDBBO8uOFQqpmkxt6ZzQp9ekv/pjAJ1zubR0Nh3yyrvZ
         RQdCWK/6W9gwcRjBjo5aigEkXvmrcweT2dpGKnk9NxMvMHtBCaWbbszwgQezBlIj0vYA
         H7ohhEEvYA/GnWnv0ZnwvdA/pq46rpCVmqeMdvgVggu4kV6Ry4MdUx/PGMn2tFKWXj2Q
         6OouoIdnGliNKFHEC3dVQN8kOmwF2eXpqjWcGvM4ywx/ap++248cWMx3QS3b3VXNpXUG
         XM2Q==
X-Forwarded-Encrypted: i=1; AJvYcCVJUieOab321nppov0uN/H5AMe8bteyObhkeb1Mwz8E/DnGN7QZli6i/bv57U7t0qAraL51NMKfIokf@lists.linux.dev
X-Gm-Message-State: AOJu0Yx1NW4f2YAGZqx4ZShP7OisotEYpxIvy/mGseaMUzqg3J9zK7RM
	iLvq4wZ0fDJNuQfV5XGc2psJdVWDTylyjVAWr0JW2zTBMRraFAJ2rDsIBuuIUsQ2cLMchuDr8s3
	rImcjoJrxa3YYnWng3DGME+9+gEY8PUhb7ZlD0dO2Wgzxhy/SpxfEc9QWlhli4eXA4y7+SGfBqV
	+bxnh/juiHMqoockIwcsqg4X6MrbwBC1bzxQ==
X-Gm-Gg: ASbGnct/4jUhMB6sHrF20Hr/49w4ENP9MiXPNwqgeJvUKj4j+YHl5HLw+fz8bsPDg/I
	FoUMuFu9ye2pxRbCrQpOJ6IvF6uEX3wtgDiwoQWZ8ldLQTQZPZ78KgH7dfofNeidLLCU=
X-Received: by 2002:a05:690c:60c7:b0:6f8:c7e5:9dc8 with SMTP id 00721157ae682-70538813622mr55109967b3.21.1744217527675;
        Wed, 09 Apr 2025 09:52:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHoPo+db453A3VRpl2iuqkn3Bsgq1KRMvfk6tMOx+Z2OH7fXGulE/SBM8lBhRiSM2h3KS/aGeaNttVPvceLLUM=
X-Received: by 2002:a05:690c:60c7:b0:6f8:c7e5:9dc8 with SMTP id
 00721157ae682-70538813622mr55109687b3.21.1744217527344; Wed, 09 Apr 2025
 09:52:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250403100943.120738-1-sgarzare@redhat.com> <20250403100943.120738-5-sgarzare@redhat.com>
 <20250408110012.GFZ_UBvOcEfEcIM4mI@fat_crate.local> <eqtiiphs6rtjo7nirkw7zcicew75wnl4ydenrt5vl6jdpqdgj6@2brjlyjbqhoq>
 <20250408112820.GBZ_UIVPp-LuIiVrIV@fat_crate.local> <o2u7p3wb64lcc4sziunr274hyubkgmspzdjcvihbpzkw6mkvpo@sjq3vi4y2qfl>
 <20250409102120.GCZ_ZKIJw9WkXpTz4u@fat_crate.local> <CAGxU2F7r_fWgr2YRmCvh2iQ1vPg30f-+W6FXyuidbakZkwhw2w@mail.gmail.com>
 <20250409113154.GGZ_ZaqgfRrrMij_Zm@fat_crate.local> <6e5bf479-ee95-a996-5845-1f76730e2488@amd.com>
In-Reply-To: <6e5bf479-ee95-a996-5845-1f76730e2488@amd.com>
From: Stefano Garzarella <sgarzare@redhat.com>
Date: Wed, 9 Apr 2025 18:51:56 +0200
X-Gm-Features: ATxdqUGEYS-HBaML_tAhrP8B1crvRL_OaCpNp5JHB_LYoxbYRpqgOrV3UZSt1ms
Message-ID: <CAGxU2F55VWoBJ92gM+Rora=+_B94PzW+DwRYjsa6=sdS+ZWLVQ@mail.gmail.com>
Subject: Re: [PATCH v6 4/4] x86/sev: register tpm-svsm platform device
To: Tom Lendacky <thomas.lendacky@amd.com>
Cc: Borislav Petkov <bp@alien8.de>, Jarkko Sakkinen <jarkko@kernel.org>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Peter Huewe <peterhuewe@gmx.de>, 
	Jason Gunthorpe <jgg@ziepe.ca>, "H. Peter Anvin" <hpa@zytor.com>, linux-coco@lists.linux.dev, 
	linux-integrity@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, x86@kernel.org, 
	Joerg Roedel <jroedel@suse.de>, Dionna Glaze <dionnaglaze@google.com>, 
	Claudio Carvalho <cclaudio@linux.ibm.com>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, linux-kernel@vger.kernel.org, 
	Dov Murik <dovmurik@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: GHG43cflbHWMb3HplQzzFhcb6MGXmVJOhdRdaXVGt1I_1744217527
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Wed, 9 Apr 2025 at 18:08, Tom Lendacky <thomas.lendacky@amd.com> wrote:
>
> On 4/9/25 06:31, Borislav Petkov wrote:
> > On Wed, Apr 09, 2025 at 12:43:01PM +0200, Stefano Garzarella wrote:
> >> Sorry, maybe I missed something.
> >>
> >> tpm_svsm.c registers the driver with module_platform_driver_probe().
> >>
> >> Someone (the platform I guess) has to register the device by calling
> >> platform_device_register(), as we already do for example for
> >> sev_guest.
> >
> > Maybe that platform device thing is the wrong approach. Why does the core code
> > need to register some dummy platform device in the first place? Why can't
> > drivers/char/tpm/tpm_svsm.c probe and init without it?
>
> I think the platform device is the right approach (just like we do for the
> sev-guest driver), but I think we should only register the device if an
> SVSM is present. Then let the vTPM driver probe routine check if the SVSM
> vTPM support is present.

I see, agree.

>
> So the vTPM driver wouldn't change, just snp_init_platform_device():
>
>         if (snp_vmpl && platform_device_register(&tpm_svsm_device))

I can do if we agree on that.

>
> Looking at the message that is issued after, maybe it should read
> "devices" now.

Good catch, I'll update the pr_info() message!

Thanks,
Stefano

