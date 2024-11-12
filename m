Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CB88217F27
	for <linux-coco@lists.linux.dev>; Tue, 12 Nov 2024 19:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731440890; cv=none; b=BAv/LaJcACEYpcYHav/hVftynCrg0rpEIgnlPjuTxLjWiqidD6/bR3SeS9XhZmg8R1baKZr6bF8HERdG4q7HRjAlj6SlDhSom/yzqvm/lJIoBrXS+rroF4BESlOa6BfxbI7SZoCTplxrZZhkvESTnxtXarisVYMArL0cTgpCUVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731440890; c=relaxed/simple;
	bh=o8eOdtHtMHFg2vs8SZ/DKu2qO40wUv2AUpZc54PgLH0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eP6C/LvKVEZ6KursypLFdv9TZRNR/FDhb1zPoLkdXkgSmiw+IwLTswS2am5hxLAiQpDWIwaMsc8ijofc3410suPkMG1KiSFkJqPJKTMTgQDRcPOB5ZLGmT7nyLf6we0gc3GJvAnfkP61tPCSnrTq3BGaY4UmISSrm+DMX/76YdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=EK08aeE3; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EK08aeE3"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a9a0ef5179dso1027051566b.1
        for <linux-coco@lists.linux.dev>; Tue, 12 Nov 2024 11:48:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731440887; x=1732045687; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o8eOdtHtMHFg2vs8SZ/DKu2qO40wUv2AUpZc54PgLH0=;
        b=EK08aeE3aWPd9VJ0aOg5qcnSVjlkn6zq5rAw656LS7yw9vb44Ask06IAg4123bamZC
         pGw6Ksb15s6OBF19Aaq7+GX55ZX5/wQgTXgluZukyei4p2BfCok1+EegloZUPHlYFAV4
         jsx0SLVKRdCdQ4fLO8NQ3uGDFASUqqnK+A8iJtIHag+IXsUjBpBgwa8U5QFuGmiRDc2p
         Rnjtp4Nh+hTUQ1Mm/kAAqklVhNYGnCquAb2tqvEcE/X8rZDdeGoG9rFZFpeYd+m77uCx
         eC+0k19kPOVuadjJdF3tCgBLcCQxkPIX/OutStxJezkZwtAWwwClCBCdVPcEA2RZaBHf
         5r5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731440887; x=1732045687;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o8eOdtHtMHFg2vs8SZ/DKu2qO40wUv2AUpZc54PgLH0=;
        b=FhjhUzEEHzyAj/VhNUoRRUK9kISnDTd4ubKiE7d2pKOx8r/V71cRK4S4bCMIPBl1CO
         J1g9BZY1dS9PTGVt1sIr5X+CtlU+LhEjL9RPxp9g4hDKzv6WukxPC1kEXPV3OGRWQQhh
         hcQe/lw3fDFCRGgDfH39fA5xxO5Ch0hmpyHUlNp8ze3+NJ0TangBW7LFspWxBP8CW2m6
         PGqWJcOq2JXzVgVayUCerp0DP1TRHr2O55ky+dmrRic5IYedOZCQDAIHyHPwzdCoNGnB
         tzJuISKPEY1RZqZR9M5fprwgtwylg5DbUiPIjqEMSw87gUZ3p/vcXxxoZup2X1mA/yPf
         4GCg==
X-Forwarded-Encrypted: i=1; AJvYcCUVRrp1D1os6Ipa0q6Qb+cNBg6Wy0cYsrI1Cf5DH1jjcnh681RrQmC7ujuuUj9MDdLUqvw8rpM7go9u@lists.linux.dev
X-Gm-Message-State: AOJu0YyoIZBvNtpa9A1dPUTqNBBoLbS2mbtFpBmQqiRaGKHCTO1vl+np
	uslOMYOcV+DpQElh87BYD+PTxnf9EGRKfAFSRr3P6s2u29cAaeK0xNwvbj/5PktWE4TzcJ0EChH
	dL5bivohYbQCBSRTOxXZA62WO5TR2KG0g+GWb
X-Google-Smtp-Source: AGHT+IEFgQusI2LRG8yS8c+lKwjb4SOnATX6OL+zJ6TrY0kBJRmVDcTAeTIKs1eTWUeRMWkbTKPLqC6ZZa3hgOujSU0=
X-Received: by 2002:a17:907:318e:b0:a9a:cf6:b629 with SMTP id
 a640c23a62f3a-a9eeff4458amr1685921066b.29.1731440886519; Tue, 12 Nov 2024
 11:48:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241107232457.4059785-1-dionnaglaze@google.com>
 <20241107232457.4059785-8-dionnaglaze@google.com> <4ec6b73f-4707-c93a-f046-213ac4d4549d@amd.com>
In-Reply-To: <4ec6b73f-4707-c93a-f046-213ac4d4549d@amd.com>
From: Dionna Amalie Glaze <dionnaglaze@google.com>
Date: Tue, 12 Nov 2024 11:47:51 -0800
Message-ID: <CAAH4kHaAqh1R6CGBKXNsO+uQnscwGo0Y06MTny8CebSWK9QMaw@mail.gmail.com>
Subject: Re: [PATCH v5 07/10] crypto: ccp: Add preferred access checking method
To: Tom Lendacky <thomas.lendacky@amd.com>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org, 
	Ashish Kalra <ashish.kalra@amd.com>, John Allen <john.allen@amd.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, 
	linux-coco@lists.linux.dev, Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Michael Roth <michael.roth@amd.com>, Luis Chamberlain <mcgrof@kernel.org>, 
	Russ Weight <russ.weight@linux.dev>, Danilo Krummrich <dakr@redhat.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Tianfei zhang <tianfei.zhang@intel.com>, Alexey Kardashevskiy <aik@amd.com>, linux-crypto@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 11, 2024 at 2:46=E2=80=AFPM Tom Lendacky <thomas.lendacky@amd.c=
om> wrote:
>
> On 11/7/24 17:24, Dionna Glaze wrote:
> > sev_issue_cmd_external_user is the only function that checks permission=
s
> > before performing its task. With the new GCTX API, it's important to
> > establish permission once and have that determination dominate later AP=
I
> > uses. This is implicitly how ccp has been used by dominating uses of
> > sev_do_cmd by a successful sev_issue_cmd_external_user call.
> >
> > Consider sev_issue_cmd_external_user deprecated by
> > checking if a held file descriptor passes file_is_sev, similar to the
> > file_is_kvm function.
> >
> > This also fixes the header comment that the bad file error code is
> > -%EINVAL when in fact it is -%EBADF.
>
> Same comment as before. This commit merely creates a helper function, so
> this commit message is not appropriate.
>

Is this a meta-comment about how the commit presupposes being in a
series with a goal, but should have a self-contained commit message? I
don't know what "same comment as before" you're referring to.
How about this:

crypto: ccp: Add file_is_sev to identify access

Access to the ccp driver only needs to be determined once, so
sev_issue_cmd_external_user called in a loop (e.g. for
SNP_LAUNCH_UPDATE) does more than it needs to.

The file_is_sev function allows the caller to determine access before using
sev_do_cmd or other API methods multiple times without extra access
checking.

This also fixes the header comment that the bad file error code is
-%EINVAL when in fact it is -%EBADF.




--=20
-Dionna Glaze, PhD, CISSP, CCSP (she/her)
