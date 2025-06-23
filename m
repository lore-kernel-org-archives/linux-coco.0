Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AC1B27A10F
	for <linux-coco@lists.linux.dev>; Mon, 23 Jun 2025 17:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750698512; cv=none; b=tPh7u+z8x+XqO4E8GPJDK/X9eeMygppKt08Jsqbw4ZM4aaNbiq3uNFxHWIsaP88s059BqAc07XnJovhKOEHpgSF0rCDx8R+c2OradZKkdCMW0E1O5VhgP2MUKcbVl2c0yO0PBReQ6tYphlAzDZ1uzH25CLY6KlJYpY5C2CH7Kug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750698512; c=relaxed/simple;
	bh=h254Eyian8uVimOCSSz1Q9ea712S+hpXcBlsP3TRgHM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RB9gPIk17jSEGXNGymtPNvYFQQ4wVnmNmCk4fybf2zJ0k6jWb5egz5D0uGgm5KuXoxmK9gPsPjIHilrrUGhFB0asZ3tbzCEzxL0EPWUZtHDfXu7suLXexHxCeaKwp3nY/gdxFCSFFqkSdjGm+D41eQdTMMK4jIWxJcXTbP+lAAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=c1TL0NeU; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="c1TL0NeU"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-b3226307787so673412a12.1
        for <linux-coco@lists.linux.dev>; Mon, 23 Jun 2025 10:08:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750698510; x=1751303310; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h254Eyian8uVimOCSSz1Q9ea712S+hpXcBlsP3TRgHM=;
        b=c1TL0NeUfWrLHUb4WqksLgoPLUtSsIwdxYU5PEYuetSoamFSpFw9k/LEZlU4B9sW4m
         RczZCouktQLgkEzQ+W63qMY7MTm9FYCr1bguIGuYwF2x8BdQMpd2YcYkaAI4IRQYvJ7t
         NYMP31QrMtAP7DPd8BjC6DEQ3GV/qWDahAOdM6Y93HRm6nLad3A8Q0q2iklFqDlchD3H
         um3Oy6OSAGfjosERokE6D69PLsWOS5EFiS7Mj2ReFH7pmANU0lLEk983wNzA4IaAJyfR
         K2p5reS1GSPAagfVUkWmoz2G+og7ug78HbFCba6IFMEPKoWkdzdVJpKl36QbhJiJXr27
         fZPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750698510; x=1751303310;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h254Eyian8uVimOCSSz1Q9ea712S+hpXcBlsP3TRgHM=;
        b=kNMyFlj/PjMkFIgYQIKrPrFJr5hy5pzibty1aVGoRdPeM3JDH4TWzCOJc2R76evhHm
         0tDyTa9tQ6Mr973a5TjUFpAzlabSBm/rIp4iAY1T2uxV00wV3P9WlpbjdZR46pw+jZGD
         NOHpQX+MC4N6lWRvnuOutKp9jQf6l10LSN1YkhXpy4MT2nmf5jZr7UnVD6HTrhHxW3c+
         HpvjKL/VjHNIIe68GADb2xGrjFaj42S0FwH1ijA2GZ/5GkKKr0c3W44znHY4FW301aZB
         ZdeylEGDVD8vOtV3+UiUaTZs6td3QqlVGGkO+/l7SoxLnfWeRJ11QeD5pjnrxDmgpVhQ
         8DFA==
X-Forwarded-Encrypted: i=1; AJvYcCX1Gk7yPj0udqsF31RcQ0VIhhzJ0XbJJ3IAZxNv/1OSVRXqKw/mBKuuGKsHgBWyPgGiyRj52RxTyHXD@lists.linux.dev
X-Gm-Message-State: AOJu0YwPSBFGLxpkaSAXgA9uIl099N4UO4ByUp9m+hjCsThG2dwV/cHv
	GwvC6FiY8Xwk3lK92RnbUDBryS67vbWm7kYxPJ6Yquuj/KbyPKIApD6nYYBy0nf/Xb5r/XHm43e
	wC1Dn9GhBKPYcb2UbYt5pITThv8kzuN4CnfL2X6wc
X-Gm-Gg: ASbGnctSnzDYtvx53hBCgb9ly8Ko3mE0L/wxC7suoyeFHWrkWwUSiy/e/SP8y9aMKoU
	pQ1wbvSlLyN4YZxmv2wSvJJm67o4+uJ+vaLLc4f32Uo3zhYbTPiczYVBfHhHcPJmFFuaFqm5LaM
	shbFKxEe/H2/FL08wezFZsD7PbQ9iskGUjxROhNptNNQMf
X-Google-Smtp-Source: AGHT+IE2AuMeshEAVyW/1Ay4z70ZZsZRIFYqKzbxfeXFAHlVKVP83LScLaPkPeUcAZeKJ3OlA0ADJ00weYtER1IOhsQ=
X-Received: by 2002:a17:90a:e185:b0:313:d343:4e09 with SMTP id
 98e67ed59e1d1-3159d62ace0mr20309115a91.3.1750698510329; Mon, 23 Jun 2025
 10:08:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAAH4kHZ2yO3ju_iJinR9y4BDXXdWBnEP1wcv09JWMzaqp1ZP+g@mail.gmail.com>
 <CAK3XEhOs4ijnbqmv8UrNmKN4=nv6+_A7fESLibGBRR9u8rXi6w@mail.gmail.com>
 <87frifm75c.fsf@redhat.com> <CABayD+eRjjknqJNRkkh9_KraC-jZyXb1BL_D79m04po1_hR-_g@mail.gmail.com>
 <CAAH4kHbCduQr_+oj0X8QeTjgDgh6aBncPV-1+mvB_r1R3i7Lqg@mail.gmail.com>
 <3d9fa17e-2b74-4c90-99b8-5b1dc8d15356@linux.intel.com> <100D7ECF-1292-450A-9F65-FEBA5843AB99@redhat.com>
 <7c650817-09d9-4c41-96db-62c0950d71d5@amazon.com> <0E0BB5C5-457F-49B3-A61D-98BCD10CC430@redhat.com>
 <95a3e3ca-4fba-411c-b979-4dc8ecc1f902@amazon.com> <64D33153-BCA6-4971-97A7-110504B4AAA3@redhat.com>
In-Reply-To: <64D33153-BCA6-4971-97A7-110504B4AAA3@redhat.com>
From: Dionna Amalie Glaze <dionnaglaze@google.com>
Date: Mon, 23 Jun 2025 10:08:16 -0700
X-Gm-Features: AX0GCFtJPIi2pzcXnKNEYIt3lTsnqMB414ZlpOrdNDkdIbAuMWzU9aiYFa4a-xc
Message-ID: <CAAH4kHZUMP6it5jwnNv6XdC9NFzj3qAi1DmCTmajTDTYm1NYZA@mail.gmail.com>
Subject: Re: Linux kernel SIG meeting for vwfwupdate discussion
To: Ani Sinha <anisinha@redhat.com>
Cc: Alexander Graf <graf@amazon.com>, Dan Middleton <dan.middleton@linux.intel.com>, 
	Steve Rutherford <srutherford@google.com>, linux-coco@lists.linux.dev, 
	Vitaly Kuznetsov <vkuznets@redhat.com>, Joerg Roedel <jroedel@suse.de>, Gerd Hoffmann <kraxel@redhat.com>, 
	Jon Lange <jlange@microsoft.com>, "cho@microsoft.com" <cho@microsoft.com>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hey all, I've been looking into the least friction-y way to make an
IGVM readable from disk without having to add a complex device driver
to the VMM.
If the FUKI application chooses to read the firmware from disk instead
of having the binary embedded, then we can insist that there exists a
GPT partition on the same device as the ESP with IGVM partition type
(let's say GUID C647E858-C402-4D1E-9497-95FF0A4B4465) that's the
simplest filesystem format ever: "1FILE FS", 4 bytes of file size in
little endian, followed by a contiguous representation of the IGVM
file. If you want to change your firmware, create a new partition with
this type and delete the old one. It's a simple enough file system to
propose a DXE driver to OVMF for the FUKI application to use existing
EFI protocols to read the file.

There's the matter of reading the GPT sector and finding the IGVM
partition, then reading the file in the single file filesystem, all
using some method of reading the block device that has mounted the
disk image already that the VMM would have to mess with. The block
device access depends on VMM architecture that I couldn't really
comment on other than folks could probably make it work for Google's
VMM. It'd need to do some funky continuation passing style for the I/O
threads to string together the block read requests, but it shouldn't
be too terrible.






On Tue, May 20, 2025 at 7:41=E2=80=AFAM Ani Sinha <anisinha@redhat.com> wro=
te:
>
>
>
> > On 19 May 2025, at 4:55=E2=80=AFPM, Alexander Graf <graf@amazon.com> wr=
ote:
> >
> >
> > On 19.05.25 10:37, Ani Sinha wrote:
> >>> On 16 May 2025, at 2:55=E2=80=AFPM, Alexander Graf <graf@amazon.com> =
wrote:
> >>>
> >>> Hey Ani,
> >>>
> >>> We already presented concepts last year. If we want to preserve credi=
bility, this year we need to show a solution that's either merged or almost=
 merged upstream and ready to use.
> >> Hmm ok I think it will be hard to get anything merged before the deadl=
ine on June 9th.
> >
> >
> > It doesn't have to be merged on the 9th, but it should have a realistic=
 avenue to be merged by September 4th :).
>
> One blocker in this path is that IGVM support has not yet been merged int=
o QEMU. I know Roy (now at MSFT) is working on it and I pinged him today in=
 the mailing list.
>


--
-Dionna Glaze, PhD, CISSP, CCSP (she/her)
