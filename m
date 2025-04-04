Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0AB815990C
	for <linux-coco@lists.linux.dev>; Fri,  4 Apr 2025 18:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743791882; cv=none; b=XV6IYHFF+qJdNR2cwtOo0/NUzThP7SslxbluMutc/zKamCm3VR6wVe+N1CxmFh/93EZNPzWE/LTMEv0p3T2QIRJd3VvIMs8WWMNasW7Da+HGRA6W4/h+Q9Jf9x4ys8rmd5HPr9H/3PF2FFOp36NXQU4WKLrq3qOu9h/4sF6AZAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743791882; c=relaxed/simple;
	bh=SbEtg3AyFxTr/ZdtpsyqmMFloFhhusssy3YW2Vk6v2g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TSoz6WMX7JKLhQCC45WCgZZNLhGbRk3ybO5wBCwV4eYDoOpSLH6OVr8nxDU7nq+VmwmtK1RR7UHw5h2ApyTbD3VYuHX8JGH4re7zw4z/IJ0/42EnLPTihrNgLd+caIPpYlgz6LH6v1t8JPWyiRctiBHIH7zcnPxSwOAnQte3Iow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eoDNqXkJ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eoDNqXkJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743791879;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FH9uqPPYrtgbqQKtkDvqkLUyY8YkbRel0P0Eu4ZBawA=;
	b=eoDNqXkJR/8/mBWu3CS/+NvL0gAuWWC3UDYG4qEfY5/mxhq757Xl6ZiU4EG5Uqk/7p+Q7f
	moIqG7B5G+AJZhCo74c3I3WSPlozL2w+xlB7XcOyGIWA9OjuVE5knkUiXIN3T4uaNdGSe8
	3l/wKXyJWgYYGC1cso2kgUxJNTjhnLE=
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com
 [209.85.219.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-686-1tPyOFRePjaIWOyEpDpcDA-1; Fri, 04 Apr 2025 14:37:56 -0400
X-MC-Unique: 1tPyOFRePjaIWOyEpDpcDA-1
X-Mimecast-MFC-AGG-ID: 1tPyOFRePjaIWOyEpDpcDA_1743791876
Received: by mail-yb1-f199.google.com with SMTP id 3f1490d57ef6-e6ddf3f05easo3375338276.1
        for <linux-coco@lists.linux.dev>; Fri, 04 Apr 2025 11:37:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743791876; x=1744396676;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FH9uqPPYrtgbqQKtkDvqkLUyY8YkbRel0P0Eu4ZBawA=;
        b=Ugh3/UNP0h27FOKA3tieyxwMWF2FdH85RX4a1gDMt3OeOMav42zeCXVwwB+YwsXF5y
         zKKQz+r3u5AhNFFITtNzNA+0CGFW66CsZ8RVpR5V8HOaJQgyEerKB3z9xe3CVk1U2Z1/
         GlU6+XRJQrpqyP8Bw1rul3hMB559lL+zodjjHdrlF2Tw1K8eAPkL8f7g9N738GFDEeQO
         R/LutVsESxkQ6F3R14IIwsl7rRR0Lewx6jrv7FIcLpaATf2s2COzrwpE5t0omPh8+mfT
         Pr4+VwUrP6QuAN8xdtO0v/057dpkUrfVkRfGTkIf3o5NBZ6gqoy1H4wMrvfbqUx65KWR
         o57A==
X-Forwarded-Encrypted: i=1; AJvYcCXrvyj4CCNwWBQ3it87dERFIv4TPgVj2An4OBgz3m4HMSDy2I67AnZHLFIFAEZLVg79QsUUjybLHdRp@lists.linux.dev
X-Gm-Message-State: AOJu0YyQG3dyFF9kzuA56R9oKPSQu4XlahmM7lzBXCvqGHsCY1JaKjgW
	U2V4ltRsoC+vmODxDas3W0dX1XdUTdI0sMWT0BBCXwLqaQF3tL/WswEVhE202S6TjMfs4Lfo7Gp
	uU7uvUfxXJB84fMj6wi4p82TQ5AY5g91rcSE0Vo+5O4I6a38Zz1x7U/aTDK93Iok7bWvuoNm3Tc
	D5FU75LAwlCXKMMhXMvjoKq/ryuuBZkHf1BQ==
X-Gm-Gg: ASbGncvpZUmCnqafjnO2pBITidipdrc29o3jx3pR2DjsC+QOfBWheK2pqy+GbEw0pft
	Q41/tI7O3IUpReBThQz4+hX4ZzIB+m8n/UxAMJNvROzVB9Ysy5Pvg5cqexJGTWWpagB4S
X-Received: by 2002:a05:6902:158b:b0:e39:8e5f:adab with SMTP id 3f1490d57ef6-e6e1c44374amr7243199276.39.1743791876111;
        Fri, 04 Apr 2025 11:37:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEevyqGuidPZqVNBDj+KFxHl9JMJVo1UAIgY+YpK39FKnWBtQbNPTK6tAPKgm8JU8MU/JDBrWFIK50jN7+/iUU=
X-Received: by 2002:a05:6902:158b:b0:e39:8e5f:adab with SMTP id
 3f1490d57ef6-e6e1c44374amr7243157276.39.1743791875773; Fri, 04 Apr 2025
 11:37:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250403100943.120738-1-sgarzare@redhat.com> <20250403100943.120738-4-sgarzare@redhat.com>
 <CAAH4kHYcRm1TpcgbtryJAtc6sjeh3hXzW7ApXY4WhcfZ3HEpVw@mail.gmail.com>
In-Reply-To: <CAAH4kHYcRm1TpcgbtryJAtc6sjeh3hXzW7ApXY4WhcfZ3HEpVw@mail.gmail.com>
From: Stefano Garzarella <sgarzare@redhat.com>
Date: Fri, 4 Apr 2025 20:37:44 +0200
X-Gm-Features: ATxdqUHKn197Z_4aQy4LW5pv_IIGkWQEqk42058WikkJ9-SNy1cP1FmNt99U1KU
Message-ID: <CAGxU2F4Zf7Khfqy5UjjPJ096kHHPjhFMN+oxvRTfG1knKca9gA@mail.gmail.com>
Subject: Re: [PATCH v6 3/4] tpm: add SNP SVSM vTPM driver
To: Dionna Amalie Glaze <dionnaglaze@google.com>
Cc: Jarkko Sakkinen <jarkko@kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Peter Huewe <peterhuewe@gmx.de>, Jason Gunthorpe <jgg@ziepe.ca>, "H. Peter Anvin" <hpa@zytor.com>, 
	linux-coco@lists.linux.dev, linux-integrity@vger.kernel.org, 
	Borislav Petkov <bp@alien8.de>, Ingo Molnar <mingo@redhat.com>, x86@kernel.org, 
	Tom Lendacky <thomas.lendacky@amd.com>, Joerg Roedel <jroedel@suse.de>, 
	Claudio Carvalho <cclaudio@linux.ibm.com>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, linux-kernel@vger.kernel.org, 
	Dov Murik <dovmurik@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: yRv4nlPS2pHHzZJ1I0gXqYrfYNAva4eJHMXl8Iyy4mM_1743791876
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 4 Apr 2025 at 19:32, Dionna Amalie Glaze <dionnaglaze@google.com> w=
rote:
>
> On Thu, Apr 3, 2025 at 3:10=E2=80=AFAM Stefano Garzarella <sgarzare@redha=
t.com> wrote:
> >
> > From: Stefano Garzarella <sgarzare@redhat.com>
> >
> > Add driver for the vTPM defined by the AMD SVSM spec [1].
> >
> > The specification defines a protocol that a SEV-SNP guest OS can use to
> > discover and talk to a vTPM emulated by the Secure VM Service Module (S=
VSM)
> > in the guest context, but at a more privileged level (VMPL0).
> >
> > The new tpm-svsm platform driver uses two functions exposed by x86/sev
> > to verify that the device is actually emulated by the platform and to
> > send commands and receive responses.
> >
> > The device cannot be hot-plugged/unplugged as it is emulated by the
> > platform, so we can use module_platform_driver_probe(). The probe
> > function will only check whether in the current runtime configuration,
> > SVSM is present and provides a vTPM.
> >
> > This device does not support interrupts and sends responses to commands
> > synchronously. In order to have .recv() called just after .send() in
> > tpm_try_transmit(), the .status() callback returns 0, and both
> > .req_complete_mask and .req_complete_val are set to 0.
> >
> > [1] "Secure VM Service Module for SEV-SNP Guests"
> >     Publication # 58019 Revision: 1.00
> >
> > Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
> > ---
> > v6:
> > - removed the `locality` field (set to 0) and the FIXME comment [Jarkko=
]
> > v5:
> > - removed cancel/status/req_* ops after rebase on master that cotains
> >   commit 980a573621ea ("tpm: Make chip->{status,cancel,req_canceled} op=
t")
> > v4:
> > - moved "asm" includes after the "linux" includes [Tom]
> > - allocated buffer separately [Tom/Jarkko/Jason]
> > v3:
> > - removed send_recv() ops and followed the ftpm driver implementing .st=
atus,
> >   .req_complete_mask, .req_complete_val, etc. [Jarkko]
> > - removed link to the spec because those URLs are unstable [Borislav]
> > ---
> >  drivers/char/tpm/tpm_svsm.c | 128 ++++++++++++++++++++++++++++++++++++
> >  drivers/char/tpm/Kconfig    |  10 +++
> >  drivers/char/tpm/Makefile   |   1 +
> >  3 files changed, 139 insertions(+)
> >  create mode 100644 drivers/char/tpm/tpm_svsm.c
> >
> > diff --git a/drivers/char/tpm/tpm_svsm.c b/drivers/char/tpm/tpm_svsm.c
> > new file mode 100644
> > index 000000000000..b9242c9eab87
> > --- /dev/null
> > +++ b/drivers/char/tpm/tpm_svsm.c
> > @@ -0,0 +1,128 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Copyright (C) 2025 Red Hat, Inc. All Rights Reserved.
> > + *
> > + * Driver for the vTPM defined by the AMD SVSM spec [1].
> > + *
> > + * The specification defines a protocol that a SEV-SNP guest OS can us=
e to
> > + * discover and talk to a vTPM emulated by the Secure VM Service Modul=
e (SVSM)
> > + * in the guest context, but at a more privileged level (usually VMPL0=
).
> > + *
> > + * [1] "Secure VM Service Module for SEV-SNP Guests"
> > + *     Publication # 58019 Revision: 1.00
> > + */
> > +
> > +#include <linux/module.h>
> > +#include <linux/kernel.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/tpm_svsm.h>
> > +
> > +#include <asm/sev.h>
> > +
> > +#include "tpm.h"
> > +
> > +struct tpm_svsm_priv {
> > +       void *buffer;
> > +};
> > +
> > +static int tpm_svsm_send(struct tpm_chip *chip, u8 *buf, size_t len)
> > +{
> > +       struct tpm_svsm_priv *priv =3D dev_get_drvdata(&chip->dev);
> > +       int ret;
> > +
> > +       ret =3D svsm_vtpm_cmd_request_fill(priv->buffer, 0, buf, len);
> > +       if (ret)
> > +               return ret;
> > +
> > +       /*
> > +        * The SVSM call uses the same buffer for the command and for t=
he
> > +        * response, so after this call, the buffer will contain the re=
sponse
> > +        * that can be used by .recv() op.
> > +        */
> > +       return snp_svsm_vtpm_send_command(priv->buffer);
> > +}
> > +
> > +static int tpm_svsm_recv(struct tpm_chip *chip, u8 *buf, size_t len)
> > +{
> > +       struct tpm_svsm_priv *priv =3D dev_get_drvdata(&chip->dev);
> > +
> > +       /*
> > +        * The internal buffer contains the response after we send the =
command
> > +        * to SVSM.
> > +        */
> > +       return svsm_vtpm_cmd_response_parse(priv->buffer, buf, len);
> > +}
> > +
> > +static struct tpm_class_ops tpm_chip_ops =3D {
> > +       .flags =3D TPM_OPS_AUTO_STARTUP,
> > +       .recv =3D tpm_svsm_recv,
> > +       .send =3D tpm_svsm_send,
> > +};
> > +
> > +static int __init tpm_svsm_probe(struct platform_device *pdev)
> > +{
> > +       struct device *dev =3D &pdev->dev;
> > +       struct tpm_svsm_priv *priv;
> > +       struct tpm_chip *chip;
> > +       int err;
> > +
> > +       if (!snp_svsm_vtpm_probe())
> > +               return -ENODEV;
> > +
> > +       priv =3D devm_kmalloc(dev, sizeof(*priv), GFP_KERNEL);
> > +       if (!priv)
> > +               return -ENOMEM;
> > +
> > +       /*
> > +        * The maximum buffer supported is one page (see SVSM_VTPM_MAX_=
BUFFER
> > +        * in tpm_svsm.h).
> > +        */
> > +       priv->buffer =3D (void *)devm_get_free_pages(dev, GFP_KERNEL, 0=
);
> > +       if (!priv->buffer)
> > +               return -ENOMEM;
> > +
> > +       chip =3D tpmm_chip_alloc(dev, &tpm_chip_ops);
> > +       if (IS_ERR(chip))
> > +               return PTR_ERR(chip);
> > +
> > +       dev_set_drvdata(&chip->dev, priv);
> > +
> > +       err =3D tpm2_probe(chip);
>
> Our testing is showing that tpm2_probe is hitting a null pointer deref
> in tpm_transmit.

Next time, please share a backtrace.

BTW I suspect you're not using Linus' tree, so be sure to backport
also commit 980a573621ea ("tpm: Make
chip->{status,cancel,req_canceled} opt").

Without that, you will have a null ptr dereference since .status() is
NULL from v5 of this series (as specified in the changelog).

Stefano

