Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE4BD4C224E
	for <linux-coco@lists.linux.dev>; Mon, 12 Oct 2026 17:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791827740; cv=pass; b=UkM0/wYEkp1pq+cUrA5KsygHN4CSGU+nck7ZkxArJ0e4uE9Iqi4m8edV9ga/P9kkFHqpDVKVJfmpo4rjWSB7aSGHb9Dj9XU9x2XcUB7Hpg3KkDmzm2FpiZAJwWbCWMdJyLH3FHWpOLQZ40SY6tthmx/F/epC4nfmmwWNxObNvv0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791827740; c=relaxed/simple;
	bh=kZdS4dF4wn+JWIPITemwpdYnrEbvaGpLaLJey0JUXyM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kDdCyRfP3ej19TvrXeJOfk4QiiMYhLuCLOuG63fK8DBF44K+P+jMDocGo4vVyOtbgY49TbV2qwfOncaspud5pq7yl6rp6tOjYrps9piQliqVVw5UUQLWA83CP0jeJ0bT7z6HRgag9n7KkFQYXxJeYYht9lZfUZ3VSpjrnJW1R5w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GHKyta1K; arc=pass smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GHKyta1K"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c31a34de844so321052166b.3
        for <linux-coco@lists.linux.dev>; Mon, 12 Oct 2026 10:55:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791827737; cv=none;
        d=google.com; s=arc-20260327;
        b=LuX5V/eUchWfeT53upE5OmhKt7c2hhwaRMQOnUNzc/RF82Y46o+8wtgiYGfpB4sgjM
         T72mcNTnNlvMbv9yQNEc1uekZ5VCLxckAsAuhzhDtETT2y3KjJmFw2jCN+xlyMS4FUD8
         2DtqngILXDV2k6WvTN8lcaZUQMll2VndGoc+DHpfRLYPXOq74QwnfRTWj0ApusFD3fe/
         sk3pgovZ3h5UMY7tpb3L0kJY1TUIIakd4SKguU8MGL8RxnFRczjinsiLr3HRpV3AoAmA
         hZHjpKNZZyM5Bivo/M8pNFSWZX8ITVrlsbRiLg5DtgFW8bPzRqIsWBgNgQc3Iwyo+eXL
         fzfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sxQuVKRIInAc/Z3AzZWZwMxHNHQeTzSvMjD6+JaMyKw=;
        fh=a/Vmxmk6sk6axRmMc551zH6I8fKgLN9MNar4RINyRes=;
        b=AskisVECevTnpoALjJkbkjOQRbJnYGqs+D1+N50Jo3O6FIRka/ObIb6gD0ghGvzM3E
         YGIIu52SnSyZfDWYDOEtSCbY7futve1apxVU+x+rAJob3gJnLA9hHxIu5GfQonNsoSm/
         +ZkuIEwkh+MDSpm701dyNSg5+177EGASPAXez0eMbkqmSmdkILfa60D1KU2jfAy0OZhP
         P/OyGohzfEvMZwfThbLq6PvhKnZxW7BDDR4u5TIxYGWUnNgCaB/ccpH20Yikx3zyFg1V
         9NOTPQSQRXQoiR8tcdJOUDJCkkd1CpSD8NUimdPbocLASg0HuZ92mlxFDBvz+K/mmb5H
         cNAg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791827737; x=1792432537; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sxQuVKRIInAc/Z3AzZWZwMxHNHQeTzSvMjD6+JaMyKw=;
        b=GHKyta1KB7OgCgTeHQrL/oU1bIKSfCsf8dw2QJJNtpBPStZR1hCWtutsTGGdqW1gFy
         gvKL8WGpEq/FV6SmgTrMuavVuX3sLOE87upuvZWDrLID2udZynICgXcWHKl3zk9u83JP
         6pynoTt8fvkpPiwLAsLZbuV8V6NIHe0c2YZrZRmBvoc7FG9UDLFrrUHtcitYXJRP9fgi
         TKwusRUDwsWBvk1YVXrS1z41YOEfURYdedKCZoaOI2Lex2/JdMAem9o3wDe0fdwJ8qZ6
         /VarK5yOYNIH/9GXi/Ty9yNaEpxK/2xR7yzEUigfTDZcibEmvN/Eap9a9lMbhLJxT9S0
         051Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791827737; x=1792432537;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sxQuVKRIInAc/Z3AzZWZwMxHNHQeTzSvMjD6+JaMyKw=;
        b=aPE7e7Z74urfOIVrBaAi5s/5YYb9Us8Npvr8Y/4eqierD9b7TPg2Ol/PkuIyrO3TFZ
         qN3xbQTggoIuIIN6gNJSZRUwo+vVYl8HNAEjNHqeCc0rbkbbKEJTidiDuCZ5WzvFidDo
         eqfube/LN8mILwO+6F9YdjHUQdot5HPa6d9i7/m1DyHK3GO8chGXB6CdXZNC8r6qEVGz
         qjgHLNPvd1DOgwUf37Hd/RlGmpkxvj1fiGrU38LDqi8zcy4JKjopTDowWRwBapcdzprO
         VqfSLUVlbovJ22w1PM6Hyoc8rt9ugiCOWwqAURSrmXll+T+e4kzeXLmzdhi2wlwZbPRp
         PWFQ==
X-Forwarded-Encrypted: i=1; AKwUvBx9dMo5gOCEkI5ef9Vvv0IOIp/iJ1g7PMkTVDcZ4XQmEINFQOeGEy7C5AMRQkuiKTHwkyPSVgee6U1I@lists.linux.dev
X-Gm-Message-State: AFq9FYI6pNw1cjUyrjNO2bDqJ1ICIGLfAg0/D18u/RLbew3Xq0nazgG9
	MI4f23Fvw04rLna4uZWvS50lnskE9+SfxrOt4Cp0afsvftDDGe0m0+705SHrhA3YsgKp8miCI3C
	lRs0gmf13IPyLEoMTbnGT9IIrIfxDvdU=
X-Gm-Gg: AYBFou0d/6u50phOeC88DiAi6f35cS6YUfrqEj+0arsqwrXYIIhs14n9xDYHgUgKB7J
	4cYd3VIvXLvFO/zeEnsWBSO5X4/wSe6mpTfyuWrAbM7RDj4MHbPmzgtjVMPrijenPHckIh6EKUu
	mnGq7fvtINJfx3yTfzYHxBud1ooCXdgOWh1L6su2TguOnfZvhHdyidpwPaLwMxND7UwAh5dxC6y
	SUoeUALf3mrxriGRcyHvo7k6MuE0YDZBeTjk8v7O8EvE2z/h/maxB88pZgFdzwpPDKqZVcSpjXP
	LkTS7keWvdnK8Zi95WAkMqFkwJgEiQVZB47WaCo7aTqwcbaxOq3o0ECjzKJwO6NtnJU2YfVRgUu
	l0LrH7EEnLSXZgHrr13qHmh+fK6DaK+JvgsoguOpdXHUXNqsEg2WAJ26pSgmKJx0qjNgs
X-Received: by 2002:a17:907:c0d:b0:c2e:3ed7:7db4 with SMTP id
 a640c23a62f3a-c31aa00dc1bmr971765166b.23.1791827736975; Mon, 12 Oct 2026
 10:55:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261003223237.513456-1-voytikd@gmail.com> <aszHlWi_aLIh8r9F@thinkstation>
In-Reply-To: <aszHlWi_aLIh8r9F@thinkstation>
From: Dmitry Voytik <voytikd@gmail.com>
Date: Mon, 12 Oct 2026 19:55:10 +0200
X-Gm-Features: AclHuK8QxOWUKD8tjoKoD_vULn_acAenrN-17lB0n0Wf19SoI_dhhDRr9qFGuro
Message-ID: <CAAX90H0PGW_PF53FpWYExaQPKmDdrAP+_b89gq5+a0wK=AicMg@mail.gmail.com>
Subject: Re: [PATCH] coco/tdx-host: add Kconfig description
To: Kiryl Shutsemau <kas@kernel.org>
Cc: Chao Gao <chao.gao@intel.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	linux-coco@lists.linux.dev, x86@kernel.org, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Kiryl,

Thanks for the review!

On Mon, Oct 12, 2026 at 1:42=E2=80=AFPM Kiryl Shutsemau <kas@kernel.org> wr=
ote:
>
> On Sun, Oct 04, 2026 at 12:32:37AM +0200, Dmitry Voytik wrote:
> > Fix the issue when the driver always gets compiled as a module.
> > How to reproduce the issue:
> >       make mrproper
> >       make defconfig
> >
> >       ./scripts/config \
> >         -e CMA \
> >         -e ALLOC \
> >         -e KVM \
> >         -e KVM_INTEL \
> >         -e KVM_INTEL_TDX \
> >         -e INTEL_TDX_HOST \
> >         -e TDX_HOST_SERVICES \
> >         --refresh
> >       make olddefconfig
> >       make mod2yesconfig
> >       grep '=3Dm$' .config
> >
> >       returns only this driver as module:
> >         CONFIG_TDX_HOST_SERVICES=3Dm
> >
> > "make menuconfig" doesn't let switch from =3Dm to =3Dy either.
> >
> > Signed-off-by: Dmitry Voytik <voytikd@gmail.com>
> > ---
> >  drivers/virt/coco/tdx-host/Kconfig | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/virt/coco/tdx-host/Kconfig b/drivers/virt/coco/tdx=
-host/Kconfig
> > index 57d0c01a4357..5a13ec6f51e8 100644
> > --- a/drivers/virt/coco/tdx-host/Kconfig
> > +++ b/drivers/virt/coco/tdx-host/Kconfig
> > @@ -1,6 +1,10 @@
> >  config TDX_HOST_SERVICES
> > -     tristate
> > +     tristate "TDX host user interface driver"
> >       depends on INTEL_TDX_HOST
> >       select FW_LOADER
> >       select FW_UPLOAD
> >       default m
> > +     help
> > +       See INTEL_TDX_HOST for details.
> > +
> > +       If unsure, say N.
>
> I would rather keep it hidden and make it follow KVM_INTEL instead:
>
> config TDX_HOST_SERVICES
>         tristate
>         depends on INTEL_TDX_HOST
>         select FW_LOADER
>         select FW_UPLOAD
>         default KVM_INTEL
>
> INTEL_TDX_HOST depends on KVM_INTEL, so this gives =3Dm with kvm-intel as=
 a
> module and =3Dy with it built in, which covers your mod2yesconfig case.
>
> Does it work for you?

Sure, I've retested and sent a v2.

I also rechecked that it still can be built as =3Dm:
./scripts/config \
 -e CMA \
 -e ALLOC \
 -e KVM \
 -m KVM_INTEL \
 -e KVM_INTEL_TDX \
 -e INTEL_TDX_HOST \
 -m TDX_HOST_SERVICES \
 --refresh
I did this because sashiko produced a false warning that it can't be
built as =3Dm.

Thanks!

> --
>   Kiryl Shutsemau / Kirill A. Shutemov
