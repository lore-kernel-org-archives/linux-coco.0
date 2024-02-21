Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80F4683CA0
	for <linux-coco@lists.linux.dev>; Wed, 21 Feb 2024 17:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708536000; cv=none; b=mYxo15J8cS/3AXv7PmlNmjEFqeH3NqEmpx1Z1liQ2QOmUSZRyYvsyaaD4YaSUBrO/PF2He7EWm5QNZ/Mx1ycpLGtuYB1tCIzRldPHjZl7zigOBRNpDPHcGtac2Ri1jb2l44KeM7DhTYKdiGPHk4Klm6jVLSss1RvvOnDDYzjtaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708536000; c=relaxed/simple;
	bh=mohUC8yf/GvhUgtVjjHOvP3YR1w8wLsVqsCFCBn5yXo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CxVC0drE4iyUq74/FjZUTnvRbM8gt2N6Q1S97U3kKTA008/X0b2WI3zCuiEN/y4y6aBBDiv6afyuykZfx+wgklscxCdVn4oQ8aaL4cZbCHhhTE5CVszaGjG9gsLoRzefTZeHhLS1tNnBOKlwWO3+0NHPi8RcWrdzxCSRurg6uOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b=J9luFRKb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="J9luFRKb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03145C433F1
	for <linux-coco@lists.linux.dev>; Wed, 21 Feb 2024 17:19:59 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="J9luFRKb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1708535995;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+OG+ecKsQYxVgvbBvL/TtgozTpt4MGBiORcM4WnZxHk=;
	b=J9luFRKbMsBggAKjcd6FoCQCFqK3url7Sdh3XZYJSr4mA1puXzkyaxHqj6pupLqSCWKODQ
	RNvHBA3KLaP2mjI97rQQtGZkGNkiNYfLecKiKSTRd4TZSrptHSQxNdrKhTN+qZxCisxLkS
	ewB8VipIPkj8LHt2k6mBzw1NRSS9BQk=
Received: 
	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 71916826 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
	for <linux-coco@lists.linux.dev>;
	Wed, 21 Feb 2024 17:19:55 +0000 (UTC)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-607dec82853so65232127b3.3
        for <linux-coco@lists.linux.dev>; Wed, 21 Feb 2024 09:19:54 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX9mRJnlXm3b+kE3A9yMyhYflFOKrYzF+SmecgVs4ST129QnMYTXI2d3l8H8d5fdjIxx/L0Dbu8Lh9ELhgCtmjcl80mMSQDMcz/sg==
X-Gm-Message-State: AOJu0Ywj0Wz7iIlKTvfwmt0VoqzFFAwSqi2puOl5dLe3Uab3ry/xc7KZ
	uWRzHJmfFmkpkiA32r+J0c6KKWompfQx6l5Lkpvg08nZbYHVwB0SVS1EdLrfCpWK3EXsicpcrJa
	mQoDIEOkMLcPHl4pxgpvrZd47pds=
X-Google-Smtp-Source: AGHT+IFiRSo8oJLeIG6A89DqtzR4YnG0l7JPRWlYtBL46DIFRZVdsbWf6zNNIK8u00F1s0mkvbKIVpuC66RE/4PkDno=
X-Received: by 2002:a0d:e250:0:b0:608:94b5:3e2 with SMTP id
 l77-20020a0de250000000b0060894b503e2mr418397ywe.4.1708535993716; Wed, 21 Feb
 2024 09:19:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240221123248.25570-1-Jason@zx2c4.com> <eada8acd-9341-401b-b6c9-a05848eb91d6@intel.com>
In-Reply-To: <eada8acd-9341-401b-b6c9-a05848eb91d6@intel.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 21 Feb 2024 18:19:41 +0100
X-Gmail-Original-Message-ID: <CAHmME9o75KzsfMRDtr2K0+N-UM-MX7MWL4AZhy27CedZRNd2Tg@mail.gmail.com>
Message-ID: <CAHmME9o75KzsfMRDtr2K0+N-UM-MX7MWL4AZhy27CedZRNd2Tg@mail.gmail.com>
Subject: Re: [PATCH v3] x86/coco: Require seeding RNG with RDRAND on CoCo systems
To: Dave Hansen <dave.hansen@intel.com>
Cc: x86@kernel.org, linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Borislav Petkov <bp@alien8.de>, =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Elena Reshetova <elena.reshetova@intel.com>, 
	"H . Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>, 
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, "Theodore Ts'o" <tytso@mit.edu>, 
	Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 21, 2024 at 5:55=E2=80=AFPM Dave Hansen <dave.hansen@intel.com>=
 wrote:
>
> On 2/21/24 04:32, Jason A. Donenfeld wrote:
> > +__init void cc_random_init(void)
> > +{
> > +     unsigned long rng_seed[32 / sizeof(long)];
>
> My only nit with this is the magic "32".
>
> Why not 16?  Or 64?

32 bytes =3D 256-bits =3D what we're targeting. Very normal thing to see
places in the RNG, used all over random.c and lots of platform
drivers. Pretty obvious and straightforward to anyone familiar with
this kind of code. Not the kind of thing you'd want to replace with
some abstracted constant that makes you search.
