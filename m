Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B77B11C175A
	for <linux-coco@lists.linux.dev>; Wed, 11 Dec 2024 08:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733905160; cv=none; b=kiX1ykJPX6AE0XMk5Ln5T3iCqFnW68XP+EVnJGP2M8W1sWVVwm51apNQVN5f6wEQTR/dcW/zA94Fy6MS/qdNT8+p1cif4kI661/LV2cgwBfB3f6aJrgd+eH/w5DefBryVLzbDdLYr/VqI62asV1ObJYrA80FvVpziRfCCs/Mvfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733905160; c=relaxed/simple;
	bh=kK/MJU/Q9OBs7J/to7TFQAxF5400ypJLjs8WUycDgxw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sYClSZHb3kNDHaDqDY1qqJRHWAYMotXvPATM+adrSSPltB80tcFz1gGurOThpJoKL0qL0MJF585d7duiCaGlXC1N37vv8iaDYW1x/DaYDpopOUTmdeJsGdX+zRvVCbuXxHBRxO0QomK+2ojpJFn5f5+NNslg8TIFqZnB2g5JiWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=B8/nwdZj; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="B8/nwdZj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733905157;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Df7gzbgWME26R9rpVKPWThUShTeBvSI36yYMQF09Oe4=;
	b=B8/nwdZj3wKjzVZ/alDn1yvyybfLH8U8s2R4YcEyAf6EkS9pO2EZIjpLcYu4CaH2OptiJe
	VkrrxDKJuHbAknPOxLRDxDwGUHEajeGzgfPfoZM3Sl3qevau3+pYDniuUcN9/1zjNiCGp6
	PMSWnnqtqabb29+vd4MrxzFtJ17/iXA=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-695-tdiGO88tMYCPGgXJIe_oZg-1; Wed, 11 Dec 2024 03:19:16 -0500
X-MC-Unique: tdiGO88tMYCPGgXJIe_oZg-1
X-Mimecast-MFC-AGG-ID: tdiGO88tMYCPGgXJIe_oZg
Received: by mail-yb1-f198.google.com with SMTP id 3f1490d57ef6-e38dbc5d05bso11350091276.1
        for <linux-coco@lists.linux.dev>; Wed, 11 Dec 2024 00:19:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733905155; x=1734509955;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Df7gzbgWME26R9rpVKPWThUShTeBvSI36yYMQF09Oe4=;
        b=sp/jas7dJXfePmJBViGSVp/UcXHNTUw0w0Ox0gsnchOF3aMy8hAgGXIL09O1rdERLb
         NShl1qQ3cyuq/D62Pr9hJ3kCPAY5VtUdBx7tL5OQO4hr3xdFK2APTQxV2Yd/QSNweKQO
         DiZmizHQhaFRJpEGuDfQeMMqIgJfASSGyle/Li4q+HFWYgWlF/UTmIr20yLlx5XumW5L
         Qp23siCAIVbHuGU0Tvfp/3K4tsSZrHIebdiTXG3qn/3UQDVo18ErJ09bcKtXBoWbM/jp
         pupRxiLq1Wy5BJZjHMBa0ruqXMY0X74qFYoZqWrfBbrkFGjKwrkMe/gVur52IFxaCz/b
         3S/w==
X-Forwarded-Encrypted: i=1; AJvYcCVYS5GwRhet3eh3cRiMhcPprObN6eiu1jzEpJFJawh5QOL3AIdTRe/E37/d1zDhorI+4U76PWwhMLLZ@lists.linux.dev
X-Gm-Message-State: AOJu0Yysg8fY+FBCn9tXJEDLj7sKW5BeUgr8TyUGDKwq0C+JrfN98p6B
	orcmV6KuTvq7L6u8jpQiuuHWAJBKmbNxfuMv6utSpxvtF+zodvVqxQ2Mbd4nL6Sg/kfj7vsGsJ2
	CVdKFgv42OlYcO10khs9Mom+1/D4djPheYHftdMdCXx8ceNS4EHBGrV045SiV0YH7CjbhHIDcu4
	yjfNtxAPDn+CvWyV2HPfQgR9o+y+zFyL3CXiRMNzVj1PCV
X-Gm-Gg: ASbGncvxnMNwDo/ZXHEQ8/sPmxR0wD9pgmE2HZIq5KZl1yG4s5319mykJEvEF6qE+Lx
	1Sf6I7d3vnl4mbappPV7rh7lS/Ofz00/vXQ==
X-Received: by 2002:a05:6902:11c9:b0:e3c:8df7:4cdb with SMTP id 3f1490d57ef6-e3c8e67b517mr2108660276.32.1733905155736;
        Wed, 11 Dec 2024 00:19:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHOSTE2WV/b1b9f1XmObRSLBn8v86IpzkAt8gBR0gdzUUukOkFtjbiPnJpDos/gaChbfGYffrt6LB23Z0mJj7U=
X-Received: by 2002:a05:6902:11c9:b0:e3c:8df7:4cdb with SMTP id
 3f1490d57ef6-e3c8e67b517mr2108649276.32.1733905155363; Wed, 11 Dec 2024
 00:19:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241210143423.101774-1-sgarzare@redhat.com> <20241210143423.101774-4-sgarzare@redhat.com>
 <20241210144025.GG1888283@ziepe.ca> <50a2e1d29b065498146f459035e447851a518d1a.camel@HansenPartnership.com>
 <20241210150413.GI1888283@ziepe.ca>
In-Reply-To: <20241210150413.GI1888283@ziepe.ca>
From: Stefano Garzarella <sgarzare@redhat.com>
Date: Wed, 11 Dec 2024 09:19:04 +0100
Message-ID: <CAGxU2F6yzqb0o_pQDakBbCj3RdKy_XfZfzGsiywnYL65g6WeGg@mail.gmail.com>
Subject: Re: [PATCH 3/3] x86/sev: add a SVSM vTPM platform device
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>, linux-coco@lists.linux.dev, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Peter Huewe <peterhuewe@gmx.de>, "H. Peter Anvin" <hpa@zytor.com>, linux-integrity@vger.kernel.org, 
	x86@kernel.org, Joerg Roedel <jroedel@suse.de>, Jarkko Sakkinen <jarkko@kernel.org>, 
	linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Claudio Carvalho <cclaudio@linux.ibm.com>, 
	Dov Murik <dovmurik@linux.ibm.com>, Tom Lendacky <thomas.lendacky@amd.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: EwHii6hTxGJ2FMl_LZ-0hHtKq9g185Sb3EC8Jxd-myA_1733905156
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 10, 2024 at 4:04=E2=80=AFPM Jason Gunthorpe <jgg@ziepe.ca> wrot=
e:
>
> On Tue, Dec 10, 2024 at 09:55:41AM -0500, James Bottomley wrote:
> > On Tue, 2024-12-10 at 10:40 -0400, Jason Gunthorpe wrote:
> > > On Tue, Dec 10, 2024 at 03:34:23PM +0100, Stefano Garzarella wrote:
> > >
> > > > +               if (platform_device_add_data(&tpm_device, &pops,
> > > > sizeof(pops)))
> > > > +                       return -ENODEV;
> > > > +               if (platform_device_register(&tpm_device))
> > > > +                       return -ENODEV;
> > >
> > > This seems like an old fashioned way to instantiate a device. Why do
> > > this? Just put the TPM driver here and forget about pops? Simple tpm
> > > drivers are not very complex.
> >
> > This driver may be for the AMD SEV SVSM vTPM module, but there are
> > other platforms where there's an internal vTPM which might be contacted
> > via a platform specific enlightenment (Intel SNP and Microsoft
> > OpenHCL).
>
> Sure, that's what TPM drivers are for, give those platforms TPM drivers
> too.
>
> Why put a mini driver hidden under an already mini driver?
>
> > This separation of the platform device from the contact
> > mechanism is designed to eliminate the duplication of having a platform
> > device within each implementation and to make any bugs in the mssim
> > protocol centrally fixable (every vTPM currently speaks this).
>
> That makes sense, but that isn't really what I see in this series?
>
> Patch one just has tpm_class_ops send() invoke pops sendrcv() after
> re-arranging the arguments?
>
> It looks to me like there would be mert in adding a new op to
> tpm_class_ops for the send/recv type operating mode and have the core
> code manage the buffer singleton (is a global static even *correct*??)
>
> After that, there is no meaningful shared code here, and maybe the
> TPM_CHIP_FLAG_IRQ hack can be avoided too.

IIUC you are proposing the following steps:
- extend tpm_class_ops to add a new send_recv() op and use it in
tpm_try_transmit()
- call the code in tpm_platform_probe() directly in sev

This would remove the intermediate driver, but at this point is it
worth keeping tpm_platform_send() and tpm_platform_recv() in a header
or module, since these are not related to sev, but to MSSIM?

As James mentioned, other platforms may want to reuse it.

Thanks,
Stefano

>
> Simply call tpm_chip_alloc/register from the sev code directly and
> provide an op that does the send/recv. Let the tpm core code deal with
> everything else. It is much cleaner than platform devices and driver
> data..

