Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAA1F20E6E0
	for <linux-coco@lists.linux.dev>; Fri,  4 Apr 2025 18:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743793150; cv=none; b=qQOaV1vn2UiHiiM+BIxySP4aKPyU96Dw88Y0Lk9+tsehlJ2gnxeRjKaNUf7ZyRkeqCwB5VWwliUc03alGTnstSLQRrkuMTXul4IGVMf46kTPYo4nPAG1jHyp2ayf1J/Y3++YRLnnO5qHRuartVPMBlOOx4Ir+ISwidfOfkp1WIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743793150; c=relaxed/simple;
	bh=Akp8TP4w548YBYZdc4wbMePm744tCLFwdjDQVOlgw6k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jQYkdiAdehsR82B+ePGO8L3NIN75kdHD9bWahWlN1DyW+SJIp5/cxjjSZmkWUdqU0q77wcFfPyaEeHIOiQoEL2E1fPPXk9A63f6Tk3Rwp9PWDQrxTJ2wrGepJk4QZ2Wqy+DMfzcc2chrMsDkeGuKLyBuOQtCoD9w49vLOAqGunY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PXgYHPnH; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PXgYHPnH"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ac2bdea5a38so378909466b.0
        for <linux-coco@lists.linux.dev>; Fri, 04 Apr 2025 11:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743793147; x=1744397947; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fd2VmCaaJDc5tXmdk0MdBa4CIzTq2IXZ7VVk4lrC7Pg=;
        b=PXgYHPnHy0wvlWq7qywMB4aMEy9mm+EulY3m/vrT9ctT4cr88c1RKsOCwt8qhBtMyP
         abUQmBhhThCEG2CUq2444kNLwbnbvgJ9R0lrfDq5LnkKPHP/NoQcTZs1Bw/gh2JfU4NC
         OJcLl8ypStDI/ugZtmj8bh00mu4ullQMxnOMVkHQxJyRwYkPe0cAHB2gknjubgCWoIiI
         Tdkfldky5c+Ep11J7iZMwqIS82E3A4Dq8X/qQ1N5A5hoXzkQq3oNJCcans0fNTY0p0pw
         Px11sz/XpiLGvn15idwAyEGpjVNTKvwqrZQJkQ5eB/Urma0GF0bOTuq2jqVqPOvw3+H8
         C9yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743793147; x=1744397947;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fd2VmCaaJDc5tXmdk0MdBa4CIzTq2IXZ7VVk4lrC7Pg=;
        b=jBsR23kGt/jl0LjEjJ+cGoBGPahWfwD7BwbAxpudpEbuBVrIRRnsha0zRQqbK9uw4E
         lKE5gJz3mRsuviV2ph98OOgDPj6U1kbNOk13FFpJjIf84OMt8CKVHBSKgag4c2OdTQrD
         2iRDwuwL/OhC1+OkJ/Ztt0FBMyw6oRWbhglegbJ4RcH6E3dr5STDmy61BQTeKXPINFfJ
         qkuxxP8HwV3Tbp6p6NNWQi1LG8ZxnSEvexc4vpvQ+9PYGBclHTUuhFigYrGzEC9mUTQG
         eoiT0pvF7aUeomzden46jAshuha3RmZ6mCtvCxgw0TaeZgJycOuR9Hz3Mor5SI5Biel2
         ILeA==
X-Forwarded-Encrypted: i=1; AJvYcCX1mWzJFS/62/g1yuaBS0QJsqAbPfvnl4sHI/9KUtCz8dCTxbGQhA7f5M2yUYtHJ3adLpklGliArXjY@lists.linux.dev
X-Gm-Message-State: AOJu0YwtYVvSdQTHB/KA86Ei/rXKzIB0ot3ospgmKMm3YmpMfbXzU5oI
	6lYcsvIfpM12y3gsYTTd9c5oeSMnPor5CojESsUYYkiqOQ2RaQl9xR/Hyxw13fS9s9e6CUtxscS
	a5zLtBznubERcbvaGnUS+a0WcoPlfdLODCRyU
X-Gm-Gg: ASbGnctEsXpWh2+82o6QileS/uzKqk8/cQGtrCEXE24FQcBnSuqA84U5NYkgcoi3kNH
	UFyChiTP3ozr6QduBR0c8b/XsP7OiUPke/YkvR8gqTtsLYTHeAi1QI291/8HgG4zdlW4vVseIJN
	2kmst/ffmNf0L9undb7x947Q+gXg==
X-Google-Smtp-Source: AGHT+IHqCOEoVg/cVEabRgMbyepnPj+9o+omnNnoFUpz0K2+9E+TojQ8uIMehRo28tc0RIsdXVGT4xli6xdYcJ/v1sE=
X-Received: by 2002:a17:907:968d:b0:ac7:9817:60aa with SMTP id
 a640c23a62f3a-ac7d6c9fefamr255269966b.2.1743793146895; Fri, 04 Apr 2025
 11:59:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250403100943.120738-1-sgarzare@redhat.com> <20250403100943.120738-4-sgarzare@redhat.com>
 <CAAH4kHYcRm1TpcgbtryJAtc6sjeh3hXzW7ApXY4WhcfZ3HEpVw@mail.gmail.com> <CAGxU2F4Zf7Khfqy5UjjPJ096kHHPjhFMN+oxvRTfG1knKca9gA@mail.gmail.com>
In-Reply-To: <CAGxU2F4Zf7Khfqy5UjjPJ096kHHPjhFMN+oxvRTfG1knKca9gA@mail.gmail.com>
From: Dionna Amalie Glaze <dionnaglaze@google.com>
Date: Fri, 4 Apr 2025 11:58:54 -0700
X-Gm-Features: ATxdqUGgbFUW9C8F8OO_2JG0wrtdd1BxQD8N08wZ94rnrpOaYv3GcerIOUR9g-k
Message-ID: <CAAH4kHZhsUoxNdJ0F3GeRPhC_JpB4suUA1z44bQ=RpGoR2oHkA@mail.gmail.com>
Subject: Re: [PATCH v6 3/4] tpm: add SNP SVSM vTPM driver
To: Stefano Garzarella <sgarzare@redhat.com>
Cc: Jarkko Sakkinen <jarkko@kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Peter Huewe <peterhuewe@gmx.de>, Jason Gunthorpe <jgg@ziepe.ca>, "H. Peter Anvin" <hpa@zytor.com>, 
	linux-coco@lists.linux.dev, linux-integrity@vger.kernel.org, 
	Borislav Petkov <bp@alien8.de>, Ingo Molnar <mingo@redhat.com>, x86@kernel.org, 
	Tom Lendacky <thomas.lendacky@amd.com>, Joerg Roedel <jroedel@suse.de>, 
	Claudio Carvalho <cclaudio@linux.ibm.com>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, linux-kernel@vger.kernel.org, 
	Dov Murik <dovmurik@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 4, 2025 at 11:37=E2=80=AFAM Stefano Garzarella <sgarzare@redhat=
.com> wrote:
>
> On Fri, 4 Apr 2025 at 19:32, Dionna Amalie Glaze <dionnaglaze@google.com>=
 wrote:
> >
> > On Thu, Apr 3, 2025 at 3:10=E2=80=AFAM Stefano Garzarella <sgarzare@red=
hat.com> wrote:
> > >
> > > From: Stefano Garzarella <sgarzare@redhat.com>
> > >
> > > Add driver for the vTPM defined by the AMD SVSM spec [1].
> > >
> > > The specification defines a protocol that a SEV-SNP guest OS can use =
to
> > > discover and talk to a vTPM emulated by the Secure VM Service Module =
(SVSM)
> > > in the guest context, but at a more privileged level (VMPL0).
> > >
> > > The new tpm-svsm platform driver uses two functions exposed by x86/se=
v
> > > to verify that the device is actually emulated by the platform and to
> > > send commands and receive responses.
> > >
> > > The device cannot be hot-plugged/unplugged as it is emulated by the
> > > platform, so we can use module_platform_driver_probe(). The probe
> > > function will only check whether in the current runtime configuration=
,
> > > SVSM is present and provides a vTPM.
> > >
> > > This device does not support interrupts and sends responses to comman=
ds
> > > synchronously. In order to have .recv() called just after .send() in
> > > tpm_try_transmit(), the .status() callback returns 0, and both
> > > .req_complete_mask and .req_complete_val are set to 0.
> > >
> > > [1] "Secure VM Service Module for SEV-SNP Guests"
> > >     Publication # 58019 Revision: 1.00
> > >
> > > Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
> > > ---
> > > v6:
> > > - removed the `locality` field (set to 0) and the FIXME comment [Jark=
ko]
> > > v5:
> > > - removed cancel/status/req_* ops after rebase on master that cotains
> > >   commit 980a573621ea ("tpm: Make chip->{status,cancel,req_canceled} =
opt")
> > > v4:
> > > - moved "asm" includes after the "linux" includes [Tom]
> > > - allocated buffer separately [Tom/Jarkko/Jason]
> > > v3:
> > > - removed send_recv() ops and followed the ftpm driver implementing .=
status,
> > >   .req_complete_mask, .req_complete_val, etc. [Jarkko]
> > > - removed link to the spec because those URLs are unstable [Borislav]
> > > ---
> > >  drivers/char/tpm/tpm_svsm.c | 128 ++++++++++++++++++++++++++++++++++=
++
> > >  drivers/char/tpm/Kconfig    |  10 +++
> > >  drivers/char/tpm/Makefile   |   1 +
> > >  3 files changed, 139 insertions(+)
> > >  create mode 100644 drivers/char/tpm/tpm_svsm.c
> > >
> > > diff --git a/drivers/char/tpm/tpm_svsm.c b/drivers/char/tpm/tpm_svsm.=
c
> > > new file mode 100644
> > > index 000000000000..b9242c9eab87
> > > --- /dev/null
> > > +++ b/drivers/char/tpm/tpm_svsm.c
> > > @@ -0,0 +1,128 @@
> > > +// SPDX-License-Identifier: GPL-2.0-only
> > > +/*
> > > + * Copyright (C) 2025 Red Hat, Inc. All Rights Reserved.
> > > + *
> > > + * Driver for the vTPM defined by the AMD SVSM spec [1].
> > > + *
> > > + * The specification defines a protocol that a SEV-SNP guest OS can =
use to
> > > + * discover and talk to a vTPM emulated by the Secure VM Service Mod=
ule (SVSM)
> > > + * in the guest context, but at a more privileged level (usually VMP=
L0).
> > > + *
> > > + * [1] "Secure VM Service Module for SEV-SNP Guests"
> > > + *     Publication # 58019 Revision: 1.00
> > > + */
> > > +
> > > +#include <linux/module.h>
> > > +#include <linux/kernel.h>
> > > +#include <linux/platform_device.h>
> > > +#include <linux/tpm_svsm.h>
> > > +
> > > +#include <asm/sev.h>
> > > +
> > > +#include "tpm.h"
> > > +
> > > +struct tpm_svsm_priv {
> > > +       void *buffer;
> > > +};
> > > +
> > > +static int tpm_svsm_send(struct tpm_chip *chip, u8 *buf, size_t len)
> > > +{
> > > +       struct tpm_svsm_priv *priv =3D dev_get_drvdata(&chip->dev);
> > > +       int ret;
> > > +
> > > +       ret =3D svsm_vtpm_cmd_request_fill(priv->buffer, 0, buf, len)=
;
> > > +       if (ret)
> > > +               return ret;
> > > +
> > > +       /*
> > > +        * The SVSM call uses the same buffer for the command and for=
 the
> > > +        * response, so after this call, the buffer will contain the =
response
> > > +        * that can be used by .recv() op.
> > > +        */
> > > +       return snp_svsm_vtpm_send_command(priv->buffer);
> > > +}
> > > +
> > > +static int tpm_svsm_recv(struct tpm_chip *chip, u8 *buf, size_t len)
> > > +{
> > > +       struct tpm_svsm_priv *priv =3D dev_get_drvdata(&chip->dev);
> > > +
> > > +       /*
> > > +        * The internal buffer contains the response after we send th=
e command
> > > +        * to SVSM.
> > > +        */
> > > +       return svsm_vtpm_cmd_response_parse(priv->buffer, buf, len);
> > > +}
> > > +
> > > +static struct tpm_class_ops tpm_chip_ops =3D {
> > > +       .flags =3D TPM_OPS_AUTO_STARTUP,
> > > +       .recv =3D tpm_svsm_recv,
> > > +       .send =3D tpm_svsm_send,
> > > +};
> > > +
> > > +static int __init tpm_svsm_probe(struct platform_device *pdev)
> > > +{
> > > +       struct device *dev =3D &pdev->dev;
> > > +       struct tpm_svsm_priv *priv;
> > > +       struct tpm_chip *chip;
> > > +       int err;
> > > +
> > > +       if (!snp_svsm_vtpm_probe())
> > > +               return -ENODEV;
> > > +
> > > +       priv =3D devm_kmalloc(dev, sizeof(*priv), GFP_KERNEL);
> > > +       if (!priv)
> > > +               return -ENOMEM;
> > > +
> > > +       /*
> > > +        * The maximum buffer supported is one page (see SVSM_VTPM_MA=
X_BUFFER
> > > +        * in tpm_svsm.h).
> > > +        */
> > > +       priv->buffer =3D (void *)devm_get_free_pages(dev, GFP_KERNEL,=
 0);
> > > +       if (!priv->buffer)
> > > +               return -ENOMEM;
> > > +
> > > +       chip =3D tpmm_chip_alloc(dev, &tpm_chip_ops);
> > > +       if (IS_ERR(chip))
> > > +               return PTR_ERR(chip);
> > > +
> > > +       dev_set_drvdata(&chip->dev, priv);
> > > +
> > > +       err =3D tpm2_probe(chip);
> >
> > Our testing is showing that tpm2_probe is hitting a null pointer deref
> > in tpm_transmit.
>
> Next time, please share a backtrace.

Right, my bad.
>
> BTW I suspect you're not using Linus' tree, so be sure to backport
> also commit 980a573621ea ("tpm: Make
> chip->{status,cancel,req_canceled} opt").
>
> Without that, you will have a null ptr dereference since .status() is
> NULL from v5 of this series (as specified in the changelog).

Thanks, I missed that detail. Will report back.
>
> Stefano

>


--
-Dionna Glaze, PhD, CISSP, CCSP (she/her)
