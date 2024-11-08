Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7146820B808
	for <linux-coco@lists.linux.dev>; Fri,  8 Nov 2024 22:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731104013; cv=none; b=TuCAj2kAS+3TWQEBgDGsNP4+WX58BMEbbv5HvT/+CPkng/LcKQhBNyHJgowH5is/k9vyRRozjJ82kZuoSL+AlLepcr4D6C9yBk18qTWrfr1+QEdUg75P1PmwMvLuK0OTNoVKnUIfZSVduGqBwPFJHqkeV+CUKWJV/zJ9UtCF55A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731104013; c=relaxed/simple;
	bh=ikCgVYAtTIEdmp1kK+1Azwf7P/QUizVefMuASSNdAIs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R+dmNeISfjT4P6iXmazKdmdmNohZgzbtd4tUtOd/yK2FNc42Cw0p2FcISDBFqw/JaV2pqvDXbzlT2QbC4rVDznXl+79BhU//vzNKqfvIZ86/ebPIkk7JSkI0ZqVsNRTDetWJkMKEAqUWd+hQk0JIoNi/B7xJO7YM5qEjPvWSLDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XFe+7i65; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XFe+7i65"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5ceb03aadb1so3122676a12.0
        for <linux-coco@lists.linux.dev>; Fri, 08 Nov 2024 14:13:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731104010; x=1731708810; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XOfw7YpH370Zx1QaWqZUGVYJAXKMxoYRsgHinQRISWo=;
        b=XFe+7i65uO/qaq0zMuTniFp28LKVEoHrpKWwggC5RxH+1XJ1cykUYJEps/+qZcbkDk
         tzUruA5VsTSGcmVNMcCGRRfXD/mck6b/Wa9VKynd2LMrpdr5l7EmzF11gusoVcNXfMhh
         X5iMRD4dUJNZF6VIeCaoo5ck4QWI+DkQNiAck+f5FDif3AyRQlJlBRgd9KxbUsl8P/QY
         1nBMb9MrWK8NzYoIRVLsvoNgi4j2rTvUlqEIioKfoMsa9KJvupi/DymimBxrzExWiAiV
         EkTtb6ovyLNv/Bywiw/qKmGUEV2B2luRaxXZAG5jr4xD8qLnIFebrBTsGbZ56IsuP33L
         UtLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731104010; x=1731708810;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XOfw7YpH370Zx1QaWqZUGVYJAXKMxoYRsgHinQRISWo=;
        b=BmrS5OLbm9nh40rvQFhcWh2GhumqtI9ERPS8H5K1+p8C3v3egQu2i4ClDbYqyDdIuf
         O0hDECXXCCf0kqeeIbGW1HLhQxzM40mtjCyj0eteX3z4DH5Xa6gyrMQMkV7xXp8YUOSs
         PwIYoMZsDFvD+zi96AxnyCuQfwbJqiZnrRL30MocDJN24sW6xUV2mGDPgHLaXWze0J8c
         YEfrmK1vDNdSBuNg64KvYG0qJdVmU9eWJCezh9EH8Ttoca5tyyfrS8wnAFUtarAwv37k
         i9c0CF6n0Wyy/LJ4T91b/N5up8+Q5s2f4HrEBIoLeC7xBkZXV6ArZohGMGpC2gEy25+I
         cT9Q==
X-Forwarded-Encrypted: i=1; AJvYcCVFHiGhQymN5wqbmJVwH2fX5EYthBujoIT/0P0O/ceMR23NU0NJHApytBqDrePz3srV0erJkC1poLnz@lists.linux.dev
X-Gm-Message-State: AOJu0YyEaOkitqjbTTpIDXurZp2LdQUXsiGJrd7CAwWJ1cjFnZx2PgAx
	j6UVS/Lo9+nOCco47lLoqy/AqzmeBvcOu1AfOn3BLFGQn21/h8q7n8rhFN2DqPYcGJN4bbmJzZQ
	zFqVYxPZ+sqInfcEVIJnZNNH25VH9lRkY7uNW
X-Google-Smtp-Source: AGHT+IFhcXVJlkiYHUMpF/vhtrTeeySy0abkep3ztaxdn2fr4cbguFSFdKc5xYVAtXJHxI4cPorFAk1Ncayz4PsKpLE=
X-Received: by 2002:a17:907:9603:b0:a9e:b281:a212 with SMTP id
 a640c23a62f3a-a9ef00100a8mr435785766b.51.1731104009663; Fri, 08 Nov 2024
 14:13:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241107232457.4059785-1-dionnaglaze@google.com>
 <20241107232457.4059785-5-dionnaglaze@google.com> <6642c244-3360-9347-3836-59c5cda5834f@amd.com>
In-Reply-To: <6642c244-3360-9347-3836-59c5cda5834f@amd.com>
From: Dionna Amalie Glaze <dionnaglaze@google.com>
Date: Fri, 8 Nov 2024 14:13:18 -0800
Message-ID: <CAAH4kHYWCaE+s_-rzDS3YHy2yMPj=d=64bZHoFSpDxzJnDVL6g@mail.gmail.com>
Subject: Re: [PATCH v5 04/10] crypto: ccp: Fix uapi definitions of PSP errors
To: Tom Lendacky <thomas.lendacky@amd.com>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org, 
	Ashish Kalra <ashish.kalra@amd.com>, "Borislav Petkov (AMD)" <bp@alien8.de>, Michael Roth <michael.roth@amd.com>, 
	Brijesh Singh <brijesh.singh@amd.com>, linux-coco@lists.linux.dev, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, John Allen <john.allen@amd.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, 
	Luis Chamberlain <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>, 
	Danilo Krummrich <dakr@redhat.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Tianfei zhang <tianfei.zhang@intel.com>, 
	Alexey Kardashevskiy <aik@amd.com>, stable@vger.kernel.org, linux-crypto@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 8, 2024 at 8:15=E2=80=AFAM Tom Lendacky <thomas.lendacky@amd.co=
m> wrote:
>
> On 11/7/24 17:24, Dionna Glaze wrote:
> > Additions to the error enum after the explicit 0x27 setting for
> > SEV_RET_INVALID_KEY leads to incorrect value assignments.
> >
> > Use explicit values to match the manufacturer specifications more
> > clearly.
> >
> > Fixes: 3a45dc2b419e ("crypto: ccp: Define the SEV-SNP commands")
> >
> > CC: Sean Christopherson <seanjc@google.com>
> > CC: Paolo Bonzini <pbonzini@redhat.com>
> > CC: Thomas Gleixner <tglx@linutronix.de>
> > CC: Ingo Molnar <mingo@redhat.com>
> > CC: Borislav Petkov <bp@alien8.de>
> > CC: Dave Hansen <dave.hansen@linux.intel.com>
> > CC: Ashish Kalra <ashish.kalra@amd.com>
> > CC: Tom Lendacky <thomas.lendacky@amd.com>
> > CC: John Allen <john.allen@amd.com>
> > CC: Herbert Xu <herbert@gondor.apana.org.au>
> > CC: "David S. Miller" <davem@davemloft.net>
> > CC: Michael Roth <michael.roth@amd.com>
> > CC: Luis Chamberlain <mcgrof@kernel.org>
> > CC: Russ Weight <russ.weight@linux.dev>
> > CC: Danilo Krummrich <dakr@redhat.com>
> > CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > CC: "Rafael J. Wysocki" <rafael@kernel.org>
> > CC: Tianfei zhang <tianfei.zhang@intel.com>
> > CC: Alexey Kardashevskiy <aik@amd.com>
> > CC: stable@vger.kernel.org
> >
> > From: Alexey Kardashevskiy <aik@amd.com>
>
> It looks like you used the patch command to apply Alexey's patch, which
> will end up making you the author.
>
> You'll need to use git to make Alexey the author or use git to import the
> patch from Alexey. Then you would just have Alexey's signed off followed
> by yours as you have below without having to specify the From: in the
> commit message.
>

Ah, okay. Amended with --author=3D"Alexey Kardashevskiy <aik@amd.com>"


> Thanks,
> Tom
>
> > Signed-off-by: Alexey Kardashevskiy <aik@amd.com>
> > Signed-off-by: Dionna Glaze <dionnaglaze@google.com>
> > ---
> >  include/uapi/linux/psp-sev.h | 21 ++++++++++++++-------
> >  1 file changed, 14 insertions(+), 7 deletions(-)
> >
> > diff --git a/include/uapi/linux/psp-sev.h b/include/uapi/linux/psp-sev.=
h
> > index 832c15d9155bd..eeb20dfb1fdaa 100644
> > --- a/include/uapi/linux/psp-sev.h
> > +++ b/include/uapi/linux/psp-sev.h
> > @@ -73,13 +73,20 @@ typedef enum {
> >       SEV_RET_INVALID_PARAM,
> >       SEV_RET_RESOURCE_LIMIT,
> >       SEV_RET_SECURE_DATA_INVALID,
> > -     SEV_RET_INVALID_KEY =3D 0x27,
> > -     SEV_RET_INVALID_PAGE_SIZE,
> > -     SEV_RET_INVALID_PAGE_STATE,
> > -     SEV_RET_INVALID_MDATA_ENTRY,
> > -     SEV_RET_INVALID_PAGE_OWNER,
> > -     SEV_RET_INVALID_PAGE_AEAD_OFLOW,
> > -     SEV_RET_RMP_INIT_REQUIRED,
> > +     SEV_RET_INVALID_PAGE_SIZE          =3D 0x0019,
> > +     SEV_RET_INVALID_PAGE_STATE         =3D 0x001A,
> > +     SEV_RET_INVALID_MDATA_ENTRY        =3D 0x001B,
> > +     SEV_RET_INVALID_PAGE_OWNER         =3D 0x001C,
> > +     SEV_RET_AEAD_OFLOW                 =3D 0x001D,
> > +     SEV_RET_EXIT_RING_BUFFER           =3D 0x001F,
> > +     SEV_RET_RMP_INIT_REQUIRED          =3D 0x0020,
> > +     SEV_RET_BAD_SVN                    =3D 0x0021,
> > +     SEV_RET_BAD_VERSION                =3D 0x0022,
> > +     SEV_RET_SHUTDOWN_REQUIRED          =3D 0x0023,
> > +     SEV_RET_UPDATE_FAILED              =3D 0x0024,
> > +     SEV_RET_RESTORE_REQUIRED           =3D 0x0025,
> > +     SEV_RET_RMP_INITIALIZATION_FAILED  =3D 0x0026,
> > +     SEV_RET_INVALID_KEY                =3D 0x0027,
> >       SEV_RET_MAX,
> >  } sev_ret_code;
> >



--
-Dionna Glaze, PhD, CISSP, CCSP (she/her)
