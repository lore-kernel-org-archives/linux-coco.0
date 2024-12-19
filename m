Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC9242165F7
	for <linux-coco@lists.linux.dev>; Thu, 19 Dec 2024 16:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734624430; cv=none; b=X5HVDiPM4i2YNz8CPMgjINuEjzNi2cA5FvWynMQvzjmsLslsZNji7olIslsVDqvZGH36mZECZfL5W4xw/XX2zoiw2AM0e7zLKS5GVuUkVBJKHm+cjjZLyY2l8PhmprbBpIuyjg6NyE0ay7J8WXFxKRknukpk8p8JkbnlEN7ooEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734624430; c=relaxed/simple;
	bh=A0aKZ83JDldiNCQojVArEWJB/LRrGLTjJkXrVOs2jAE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=innDmopKPltYch069HBNaVbWjbrz6q3hiGQp4yT6ecNfMWnbRrUMPnFv+/NKP5aS+8BhDlf1hkcjtdGQIfJ6qy781H9FCCMsyw0j/u9ei7pYSD3ga1IhzD0atlhl2h51IGy6kQxglfQx0gqn42dps6nwhQYt402vCYnX8LAqldY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fr8U9syg; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fr8U9syg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1734624427;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cSEIOt+Dl/39K7+8+fjxrm9chDB16camj9uOLkCkitw=;
	b=fr8U9sygbpMHCor2cDQh7yDUY3lHFM8rO6mvYSMv2VwpTp0QsOJ7MwurlpWsKLuaYw1T2C
	p46F6vsEemdgO3PL8Lnct8VBwwvvXDJsAvBVhf18YdBudjuYI+moMQI/VKjtCf2QyMqoVN
	6SsDzfvktXnGHhFtNQMg6V0WM8DVVc0=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-369-yqGLtX_yO6K_ItL5KtunEA-1; Thu, 19 Dec 2024 11:07:06 -0500
X-MC-Unique: yqGLtX_yO6K_ItL5KtunEA-1
X-Mimecast-MFC-AGG-ID: yqGLtX_yO6K_ItL5KtunEA
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-5d3d2d60d3fso907914a12.3
        for <linux-coco@lists.linux.dev>; Thu, 19 Dec 2024 08:07:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734624425; x=1735229225;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cSEIOt+Dl/39K7+8+fjxrm9chDB16camj9uOLkCkitw=;
        b=Pe7sp0XoeDeDUpGFgSHDvAWp3kZnPkkz9KW+SZFGEJmgb8ToPvE0fPcQV9mxQEC/cm
         3DyOl1VtuXyXdAr6h7AFSPKAPlH0i6aJdjh5jBnG0N4XkX0GKR3boLqA7s2u17bkNIln
         9lRI/KyqQLIT6BNUiGiXpJCuzL4/yg10aqnhn1qAeueFqOAMDAFREJ+wZKnRW3nrOyOf
         ZjSb7ufgESmiPTxT65n4BeLtcpc3MkW+0klhdT3bCwIoGqB4kLkmXAu7W0VnttaRHxGq
         9V35D3UuoyOgZYw1LeUFqGw01dxpF2KyuZPNCa/olrjUtyg52CoyKXjXmyamfvjAJ9z/
         Xu1w==
X-Forwarded-Encrypted: i=1; AJvYcCXlY1jt78CLlMZQRv7GjSDSAlK7sp1dr4MsqmKn4dgmrZVI18BB1p78b6C0izR2pDjPB2AboJ+U33xa@lists.linux.dev
X-Gm-Message-State: AOJu0YzmlaS801uILjXKZeeddvBqYft2CBuWGJa87QIvhbtVcoIxYSGV
	Y7th49p0DsFeE6pszR5khI1hdGoI0zkbXp8umVR9BM36CkV2/2SC6J/AsoEOHqO25vpWSvbrOh8
	Mx3kT0M676lhgPDeXQVRKiqtjknTli85FZf5GWwGrQInSq8amAjM5zWGeL7E=
X-Gm-Gg: ASbGncu3AvcGmu2Sk18OKiXSVCtMoZfZum3UZgXbeoxtAbQLPqWvIOQOcWzgY/VjZzF
	DH4E+fNMH8y9ULAOdNuUGOkbTyGsfeBayb2YzazA1pb/DSVf+0W7OmqceBJWD8JcD4EqAQPoUb7
	Xqr5RRWm0GPn8Y13s2dCLQcSe0hN7LJyV+tlaqVhF/WP8d4vO7CRWi13CuUXYsC55DXHZX/JWMZ
	p1WS3ZRYBsocRSktkKOyv8SQJUogATdO9huub+AFl+QAJLkdWSNO14CEYEiY/+5rZqTFynOS9k1
	IGqpoSST4Ve/72TcS7wRbPW+IEp6HE0j
X-Received: by 2002:a17:907:728a:b0:aa6:25c6:d94f with SMTP id a640c23a62f3a-aac07952880mr326061166b.31.1734624425178;
        Thu, 19 Dec 2024 08:07:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH93jwst7HGR8fbtTFBzBd4WHWnWQ7D9jH0jl2qZrx1lTc4+74MEteF4Sm/hWaXI73/yPDyWw==
X-Received: by 2002:a17:907:728a:b0:aa6:25c6:d94f with SMTP id a640c23a62f3a-aac07952880mr326051066b.31.1734624424311;
        Thu, 19 Dec 2024 08:07:04 -0800 (PST)
Received: from sgarzare-redhat (host-82-53-134-100.retail.telecomitalia.it. [82.53.134.100])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0eae5902sm78939866b.85.2024.12.19.08.07.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2024 08:07:03 -0800 (PST)
Date: Thu, 19 Dec 2024 17:06:57 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Jarkko Sakkinen <jarkko.sakkinen@iki.fi>
Cc: Jason Gunthorpe <jgg@ziepe.ca>, 
	James Bottomley <james.bottomley@hansenpartnership.com>, linux-coco@lists.linux.dev, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Peter Huewe <peterhuewe@gmx.de>, 
	"H. Peter Anvin" <hpa@zytor.com>, linux-integrity@vger.kernel.org, x86@kernel.org, 
	Joerg Roedel <jroedel@suse.de>, Jarkko Sakkinen <jarkko@kernel.org>, 
	linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Claudio Carvalho <cclaudio@linux.ibm.com>, 
	Dov Murik <dovmurik@linux.ibm.com>, Tom Lendacky <thomas.lendacky@amd.com>
Subject: Re: [PATCH 3/3] x86/sev: add a SVSM vTPM platform device
Message-ID: <6rwo7tkdst227kb4pwvr54w4mfz2zw3offux7mqfupi3rgwkaz@65yklvvqw6n4>
References: <20241210143423.101774-1-sgarzare@redhat.com>
 <20241210143423.101774-4-sgarzare@redhat.com>
 <20241210144025.GG1888283@ziepe.ca>
 <50a2e1d29b065498146f459035e447851a518d1a.camel@HansenPartnership.com>
 <20241210150413.GI1888283@ziepe.ca>
 <CAGxU2F6yzqb0o_pQDakBbCj3RdKy_XfZfzGsiywnYL65g6WeGg@mail.gmail.com>
 <20241211150048.GJ1888283@ziepe.ca>
 <CAGxU2F7QjQTnXsqYeKc0q03SQCoW+BHbej9Q2Z8gxbgu-3O2fA@mail.gmail.com>
 <D6FSHG5Z9UJQ.CWQTAANBVIQQ@iki.fi>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <D6FSHG5Z9UJQ.CWQTAANBVIQQ@iki.fi>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 7UVeCCSThz4B8VjBtJjScfHSzGwHqYX5b9jTs5V3z_c_1734624425
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline

On Thu, Dec 19, 2024 at 05:40:58PM +0200, Jarkko Sakkinen wrote:
>On Thu Dec 19, 2024 at 5:35 PM EET, Stefano Garzarella wrote:
>> So to use them directly in sev, we would have to move these definitions
>> into include/linux/tpm.h or some other file in inlcude/. Is this
>> acceptable for TPM maintainers?
>
>There's only me.
>
>I don't know.
>
>What you want to put to include/linux/tpm.h anyway?

At least tpmm_chip_alloc(), tpm2_probe(), and tpm_chip_register()

>I have not followed this discussion.

Let me try to summarize what we are doing: We are writing a small TPM
driver to support AMD SEV-SNP SVSM. Basically SVSM defines some sort of
hypercalls, which the guest OS can call to talk to the emulated vTPM.

In the current version of this series, based on James' RFC, we have an
intermediate module (tpm_platform) and then another small driver
(platform_device) in arch/x86/coco/sev/core.c that registers the
callback to use.

To avoid the intermediate driver (Jason correct me if I misunderstood),
we want to register the `tpm_chip` with its `tpm_class_ops` directly in
arch/x86/coco/sev/core.c where it's easy to use "SVSM calls" (i.e.
svsm_perform_call_protocol()).

And here I have this problem, so I was proposing to expose these APIs.
BTW, we do have an alternative though that I proposed in the previous 
email that might avoid this.

Thanks,
Stefano

