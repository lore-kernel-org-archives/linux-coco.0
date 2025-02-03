Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 877EE20B7F3
	for <linux-coco@lists.linux.dev>; Mon,  3 Feb 2025 17:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738602117; cv=none; b=EoOGXvvIn8omaRyXONhX/P+uFRQenEVd2lDg3B3Xg/V80l4gt6HWrNIZSju2WPpB3jyLjrlo7mzxorsNRKyMaX2i0sqX9ItNFb1nPa5I/yR2opPyriBB09ogo6EScFIwHCbIHSFqJcxx9cCZ7+LFORc1CKRMISVlGHGT1CiFOZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738602117; c=relaxed/simple;
	bh=zjXH5kws7+knI9DbmzEjGDquVdWrIc8UIpcNiHa4Cuk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MLAlFXv4+RGUSZZ8JiurGPYZS88qnUjhxzWf0/zYGYyKylGbmq4g3rhgeGy19SzmqbsT2khaydSUKZFSgrmzMMVQrpv6vuRGFUEFmeXnVWdZiOD0Qkvb64GXvYRN6xC/FoAzxZJNhdH2CFzsZsPUJKtf3qYN24lk1KcGNpSCwK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TKeVhTMy; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TKeVhTMy"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-53e3a2264e1so10661e87.0
        for <linux-coco@lists.linux.dev>; Mon, 03 Feb 2025 09:01:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738602113; x=1739206913; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qb2BWOjM2AxjI76h/fY+Q764chvs+1zrd6CSA4WoxvA=;
        b=TKeVhTMyXN6Ojd0UVJdjpXG04I1MfhXwNbNGz3EvjJWstb0PaxBR2boMUPvZekYeO4
         yZ/HVSm6ZGVsY2O1qemwv+hy+Dkij5o/oLyy7HV1dZNCz9PA73toy5YEmxSbo5KIEdr/
         /8iWxBTv4FrA86wZWNTPb6KPQIsBPmwQfVVe68V2YMyHdh/5+LDsbObvsNy1OfYsLS6v
         aA1uajCUvr41du87/t5hGJjCPwci2qwedTmxx2pweq5tHIKS9TLHQaa6Sb/kBCfaMkXQ
         sFziCZ0EW0wDFs/KCTLf3RjGLYJtbUI83K4awT+tV56HKr8gLok0ecnCTHwuIxLL5tbc
         208g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738602113; x=1739206913;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qb2BWOjM2AxjI76h/fY+Q764chvs+1zrd6CSA4WoxvA=;
        b=fEa4gqy9HP5T/eN9q5KKgWLPWbo5XeJqzLCfIalUOrv4K5x+mXxKTmHdySY+hPiEPs
         0RF7HtUzPnWElQjywtZUQjaUqBGzv6CYV2mRMxBuUq6PnLdRWgnS5MgCd1NU9A2IZgfK
         wvW3EzuRWpQix1UKgxXz+FcXUorh4uZPi7MqHRtrqf47l7zFAC7WUZwLMCSchrDavZkA
         uxd9VZ7N3ed7R6bYS2X1r9Zyr/Ssa8/sANJIN6F4h6hU4Engdps+15xHNiyg9EV4ZAnA
         fTFtvl7p2bmW4PNLPf7uDYSoAfgfIJPWKyAOs/0v2l1msj5YmlC3Kt9xTKxYe7gKd6zy
         06uA==
X-Forwarded-Encrypted: i=1; AJvYcCXqFdDlIoFyUfiuovaCzlGGfIsf00Y6ZnD5Ee0E1C15vGeY1fMyGhJ8nLvrfCdxvykABj9HslhPG3CM@lists.linux.dev
X-Gm-Message-State: AOJu0YwT3eTWD8ObuM2TFy2H9/1LLEmPmSrbgoU/EIx3OBZ3Ll7Twu9m
	20EZx4u0e7gS2zNmlOnCtmRSy7pSXIeieLkwgwjJrx10YPYEKyMI189ra+7SjZd+5zWhpzWvsCK
	xPvsKeCyFzrrT9FvsR8zu573NDb3udi1sC5UDJYEXghKN3rgU0pvnXUU=
X-Gm-Gg: ASbGnct4UCqUMnm8DG7SJQuINXMAj8W7NX6FcDKdmZlavrZgptFY0SDdHpxst0VR97c
	/L+E/1j3UcVPfdXwBrVjtAYnO6o3rUYiES1esW7IwU0BSvaTlwZhr3SnJtrGkrXTm/xh8h2kEYY
	ZDSj3on7ZXu+HGnX8L2abV/RxYwLzscQ==
X-Google-Smtp-Source: AGHT+IERgbXu4cZMbowmhVW8KSIRv9nsWeHKT5DJAWPkiUFMWjoeG2P3EHYpBuBLck0a8kHsQSZGuCEMrY5xfJ73NYU=
X-Received: by 2002:a05:6512:aca:b0:542:7130:badc with SMTP id
 2adb3069b0e04-543ffa52a17mr4941e87.5.1738602113129; Mon, 03 Feb 2025 09:01:53
 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250129232525.3519586-1-vannapurve@google.com>
 <p6sbwtdmvwcbr55a4fmiirabkvp3f542nawdgxoyq22cdhnu33@ffbmyh2zuj2z>
 <CAGtprH8pJ3Zj_umygzxp8=4sJTdwY5v2bFDhoBdX=-3KQaDnCw@mail.gmail.com>
 <wmdg54v56uizuifhaufllnjtecmvhllv35jyrvdilf4ty4pfs5@y4zppjm2sthr>
 <CAGtprH82OjizyORJ91d6f6VAn_E9LY7WptN-DsoxwLT4VwOccg@mail.gmail.com>
 <2wooixyr7ekw3ebi4oytuolk5wtyi2gqhsiveshfcfixlz3kuq@d5h6gniewqzk>
 <CAGtprH-n=cfH_BJAmiNMoRbqq0XdGCf3RE67TYW8z7RARnsCiQ@mail.gmail.com> <baiv6tl2lkr25i2ry2q2jaylu5y6hhioqfwhc4yafk2uwqbgf5@sqxlpg2r6kcc>
In-Reply-To: <baiv6tl2lkr25i2ry2q2jaylu5y6hhioqfwhc4yafk2uwqbgf5@sqxlpg2r6kcc>
From: Vishal Annapurve <vannapurve@google.com>
Date: Mon, 3 Feb 2025 09:01:41 -0800
X-Gm-Features: AWEUYZm1pUNVQSKvKstcecqYl2-3LVWaTH9LroDV3vXolYlnD_tCGouWLYwnW2U
Message-ID: <CAGtprH-5bL44c7ZQHKsDuOQNNd4dsBd-uR8GT9OyqffEXW963Q@mail.gmail.com>
Subject: Re: [PATCH V2 1/1] x86/tdx: Route safe halt execution via tdx_safe_halt()
To: "Kirill A. Shutemov" <kirill@shutemov.name>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, pbonzini@redhat.com, 
	seanjc@google.com, erdemaktas@google.com, ackerleytng@google.com, 
	jxgao@google.com, sagis@google.com, oupton@google.com, pgonda@google.com, 
	dave.hansen@linux.intel.com, linux-coco@lists.linux.dev, 
	chao.p.peng@linux.intel.com, isaku.yamahata@gmail.com, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 3, 2025 at 8:00=E2=80=AFAM Kirill A. Shutemov <kirill@shutemov.=
name> wrote:
>
> ...
> >
> > Are you hinting towards a model where TDX guest prohibits such call
> > sites from being configured? I am not sure if it's a sustainable model
> > if we just rely on the host not advertising these features as the
> > guest kernel can still add new paths that are not controlled by the
> > host that lead to *_safe_halt().
>
> I've asked TDX module folks to provide additional information in ve_info
> to help handle STI shadow correctly. They will implement it, but it will
> take some time.

What will the final solution look like?

>
> So we need some kind of stopgap until we have it.

Does it make sense to carry the patch suggested by Sean [1] as a
stopgap for now?

[1] https://lore.kernel.org/lkml/Z5l6L3Hen9_Y3SGC@google.com/

>
> I am reluctant to commit to paravirt calls for this workaround. They will
> likely stick forever. It is possible, I would like to avoid them. If not,
> oh well.
>
> > > > 2) acpi_safe_halt() -> safe_halt() -> raw_safe_halt() -> arch_safe_=
halt()
> > >
> > > Have you checked why you get there? I don't see a reason for TDX gues=
t to
> > > get into ACPI idle stuff. We don't have C-states to manage.
> >
> > Apparently userspace VMM is advertising pblock_address through SSDT
> > tables in my configuration which causes guests to enable ACPI cpuidle
> > drivers. Do you know if future generations of TDX hardware will not
> > support different c-states for TDX VMs?
>
> I have very limited understanding of power management, but I don't see ho=
w
> C-states can be meaningfully supported by any virtualized environment.
> To me, C-states only make sense for baremetal.

One possibility is that host can convey guests about using "mwait" as
cstate entry mechanism as an alternative to halt if supported.

>
> --
>   Kiryl Shutsemau / Kirill A. Shutemov
