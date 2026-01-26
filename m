Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 020602E540C
	for <linux-coco@lists.linux.dev>; Mon, 26 Jan 2026 21:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769462381; cv=pass; b=fHp6imDsucJuKkAe8R2xg3LB0UPuU+sppdXXuKSlGw3ngq0AAfesV2MU4gdU6Hizl5G8AE8AIDVwp/cYZgmgY23EugE7sEuS9H9nZ6QLkDp63g2lkPo1KP5btyzFobzqhncRgdhy4wNoZQ2Ni2NI89wct2pyREgrUdpnY4pHgi0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769462381; c=relaxed/simple;
	bh=EajmaXlMel3x2Qhd8Sva3YsFx7J+EoTMXv80ZwUx7BM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K3aNhyLw+m9wQIPtwIuxqFr36fLqkUx+S4H738jGoGyk7uW2D6Xv/DkaJsSNlhwmHbluk6iBRG71ulpyHCwxpubpJRXt36TBV/TTqbFqsZVgTTosa2otkSivoAmyVA/6ooSq4mNHlYp6WE45N7SYReNFs1SXvzj1dacYZh+kPag=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ihlSKowZ; arc=pass smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ihlSKowZ"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b885a18f620so657903866b.3
        for <linux-coco@lists.linux.dev>; Mon, 26 Jan 2026 13:19:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769462378; cv=none;
        d=google.com; s=arc-20240605;
        b=GpKQ4cluhlJjrULNlJ5DataKXmE4+ryF5Lwic7sTJ2IYjSrXiDljwgHzndcmYoyc8i
         nKFWy6OeIleVuRRjuELChCTXCeHZm18k3SGZyz+TGZPhx6TO5GS0MLp1+0dsPm8ej7wg
         tgNFtBewVLrDqx519wgLn9Ja4tITMkA1m5enZzwTSLQ6xIb8F+NkuOh7ACLC7mRq8n0A
         qgMbP/3YUdvCSDRCWBt5mstjwXcsrnFUF6nZNu4Rv12nzSzQUfEbMmNnvQgMcmF8NLXO
         Tz1u09Yn5brlK2/OetEakTxom+/7TN9sFo2YGHsJa5UKGqBWp+pfuU/tl9kc2AVvU+jn
         M/0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=y7kOzl5aBqWnGzDbcYeZ8xAi35hWG/Z2n90QhcHfA+M=;
        fh=yz4w1dEpgLs3Oh9UtRlKJ3BuxWdthlPTdJKfwFsXYGQ=;
        b=PjWRVjQUM6H1ag/Ea6GYXt4iSDcTnbWPCdUkOGgCaCFoQHXAZAfjvu2atIsbtSd3F/
         4dg4CiUaMBQAMNJJYRQLVlW2Uu3sJsZp7f51d+L1OatgJRYoVeyJ6f+xCfLxSm6kc/kg
         K1/ljDBnZjFYQz4zOyABEF0DP41XD2mmblipoGR5626CwCu55w5wYjTKrcZ3CfNyUYXE
         qDjf86OmsIhhyXcCFPLCXHnrhD36EtIvEYRNDzktFYymSPlPj97yHsaJXpeN1zr+1VDO
         Dfyfn79/6gSObIZrr6xgtwF+Ie2lFzv80hj3L2clT07XxyJnm/N+QPAxxRNxmjkytO+5
         qpag==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1769462378; x=1770067178; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y7kOzl5aBqWnGzDbcYeZ8xAi35hWG/Z2n90QhcHfA+M=;
        b=ihlSKowZVg0xi08Pe3qOrB1VXNQ/6A1pvhw8ZQwCOy9oJqREkjaHTcAfY2UaxUvAX4
         js5nH38/gZDPt2D+qOzJcmjeKKnKFe8YlH/hWdXSniawomoz6ysUgB341SJgRAQnP8OK
         HT+TDixd8o8KIdcylpnvv/esRrhOS116sU5Pg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769462378; x=1770067178;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=y7kOzl5aBqWnGzDbcYeZ8xAi35hWG/Z2n90QhcHfA+M=;
        b=AXdYMnYUm6/k/zsRPqXKZ1K3V3QRp487EALpQ4gpd5nTgDqijmATUVwdoOFdIngU2F
         GR8BAy1r+FlGYzBssRCGA1h+F8GR7qq49OLiTR38umjGrEkXyeQ7h2WYKI04htKJBL2Z
         M4H3/d1qE4RdB8SoyGnXTTbphEYRwgO7sbAmYK0uQZzO68qyRCTKQmhtt7ctdEZgAOOD
         hEaGzQCP8wJIo10Jt5DhfFaFivCkvdfNEMCVXAsGhxTwCNKqE3lNTx28xPgteKmE+QMx
         /RkVCvPxio93TZvC9CJuAybQGXWxbxuZq6jWZYV8bCNo/VKWpwOfQOpX2vOHwTaYqbqO
         ZHrQ==
X-Forwarded-Encrypted: i=1; AJvYcCWfmOtisCVv+xn9XPowa4ZZaKsyWJHY/5so08uyS732Bju9KdQXH+u7h6gVyaBGKI92DW2mNqm7VB/R@lists.linux.dev
X-Gm-Message-State: AOJu0YzN/bOgCkU46IeKAxpLpwxB0IL/Fn0LEv85drWGpvdFmOsmlXLm
	PTMMB6Zb0878LwIxA5x+lhv96sSBaZgcq000QC71ridLyFQIE3LxMScew2tZNJgWPEJnvDzuQSM
	rJis1zluMkRXNMYjGbjdqdEs/EzkfJ1zkGICnK4ei
X-Gm-Gg: AZuq6aJvHSX5j8py+FgdsMSdMwScRfwxixo0qjZRi2JeWANIvMG9QHz4Y5ePx07Voux
	94qoBWG4k4fdIFTZz2qbXj6v35ozhLRBtMxDm6INwzdEV5E2R7WgWZDsK08gzRw5P8JXw1ssW0l
	XIl0lcARhipXL1uISawT+HoRBvMty0huHZupj5Nk78Lw6FB1zzbGYdwYRasRQJDAsT3ZGw2JqMW
	rtDfSk3vAiUzl3suBFx5B0sxR0Ihh1SyoDXxrq1gjG9C0pk43NI64lxNF8vzechaDiHGjv7
X-Received: by 2002:a17:907:7fa7:b0:b88:4b1f:5aff with SMTP id
 a640c23a62f3a-b8d2e6f95bfmr429107566b.44.1769462378352; Mon, 26 Jan 2026
 13:19:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAFULd4bV6jKqHb-vC47skjNvbctit3VccXpF02oYt0icaq1r-Q@mail.gmail.com>
 <20260122185740.50298-1-sjg@chromium.org> <90DAAB54-CBF0-47BD-981A-FEDD26CDA0FD@zytor.com>
In-Reply-To: <90DAAB54-CBF0-47BD-981A-FEDD26CDA0FD@zytor.com>
From: Simon Glass <sjg@chromium.org>
Date: Tue, 27 Jan 2026 10:19:37 +1300
X-Gm-Features: AZwV_QhGUSmleKYNlEMOBF-WEPAQKNwa1aLnDvtAnHJl9JqUYKyILfSn6DG4Lac
Message-ID: <CAFLszTi+N7Yj0yYHKroypmBoFSx+9m5er8pgULsKbPuooFYj-A@mail.gmail.com>
Subject: Re: [PATCH v1 08/14] x86: make CONFIG_EFI_STUB unconditional
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: ubizjak@gmail.com, linux-kernel@vger.kernel.org, akpm@linux-foundation.org, 
	bp@alien8.de, dave.hansen@linux.intel.com, kas@kernel.org, kees@kernel.org, 
	linux-coco@lists.linux.dev, mingo@redhat.com, nathan@kernel.org, 
	peterz@infradead.org, pmladek@suse.com, rick.p.edgecombe@intel.com, 
	tglx@kernel.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Peter,

On Fri, 23 Jan 2026 at 13:11, H. Peter Anvin <hpa@zytor.com> wrote:
>
> On January 22, 2026 10:57:39 AM PST, Simon Glass <sjg@chromium.org> wrote=
:
> >Hi Peter,
> >
> >On Tue, Jan 20, 2026 at 8:54=E2=80=AFPM H. Peter Anvin <hpa@zytor.com> w=
rote:
> >>
> >> The EFI stub code is mature, most current x86 systems require EFI to
> >> boot, and as it is exclusively preboot code, it doesn't affect the
> >> runtime memory footprint at all.
> >>
> >> It makes absolutely no sense to omit it anymore, so make it
> >> unconditional.
> >>
> >> Signed-off-by: H. Peter Anvin (Intel) <hpa@zytor.com>
> >> ---
> >>  arch/x86/Kconfig                  | 14 ++------------
> >>  arch/x86/boot/compressed/Makefile |  2 --
> >>  arch/x86/boot/compressed/error.c  |  2 --
> >>  arch/x86/boot/header.S            |  3 ---
> >>  4 files changed, 2 insertions(+), 19 deletions(-)
> >
> >At least with QEMU the EFI protocol adds quite a lot of overhead.
> >
> >Is there any actual need for this?
> >
> >Regards,
> >Simon
> >
>
> Including the EFI stub doesn't mean using EFI to boot is required.

Yes, understood, but it adds bloat. More importantly it will lead to
people assuming that the stub is always used and thus unwittingly blur
the boundary between the stub and the kernel itself.

What is the actual need for this?

Regards,
Simon
