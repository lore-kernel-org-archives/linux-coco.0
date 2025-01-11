Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B380634
	for <linux-coco@lists.linux.dev>; Sat, 11 Jan 2025 00:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736556569; cv=none; b=j2o0FI85ZeYRWToKyK7eZqrd6Gs3kCQjhaKM72P/PA5f3RoPDeb1stXeWuKJE4yEzMw7x17M9hx7iMRsunB4lTFwRNgQXV7PwlhpwpfXd7ZXJxK9FSpeDGcHdC0M7tsyHuuxz+u8HynJ4JYliKqCNgX4VttkigLZOiZmaJJBTUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736556569; c=relaxed/simple;
	bh=DqbsPM7pbMq3tNO53LpeaJ86ETg2ScGj8LGDaaUTLJM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=NNQgI2efJZJ9KyylWMeh5Yl88ZtowQN248ZdjHgqc0zER5m6EVXKTAUzX1O4gDQDLeuKtB4aOPI7WhjksLnu7He7i2Sj4ww4BOAbquD+l3yVDXdTrhESN164yMQKocUM1k8M9RN09xLzIVto5acPzdoOXlTlLIzDLFDoIRwYTqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=0GKZL/P1; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="0GKZL/P1"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-2eebfd6d065so6692236a91.3
        for <linux-coco@lists.linux.dev>; Fri, 10 Jan 2025 16:49:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736556567; x=1737161367; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YX28d/CEykAYv4b51S4uD+A1lpSwnJPjWn7kTo7F+wY=;
        b=0GKZL/P19SLEF/aDfsmP70cPJ3m+4oVTaY+t3jK/O6ZtGXXkXpL25X0xQuWXW1z3af
         XgyKPfuyBX8sRmh+00FHRZuCxHJ0+K02wiQHh2ZXO5XP+6/U/LX4mUf1wLX+ddYf5hdj
         UcXx9OuKqpRvpK6NwT3JSMcYqpCsvhCZ3oJPnUmWLPK/KEqeafU4De+oa/5NIr4w6vxv
         7wsYeUzkRG8h5cZIkfZ8YiZ4f6KJeEbT6FRq3AQkdf935Xxkam0BWFYSJgaoDuaSDrsU
         TBn5uhZCg67/I3/YDRYjdR8BmN5wVEwXzXaYrIlqUNuYD0SLNUxtgIIqmOpIVOUSlq9X
         ly0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736556567; x=1737161367;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=YX28d/CEykAYv4b51S4uD+A1lpSwnJPjWn7kTo7F+wY=;
        b=jcmD1WJohxRr5MKWRNNohiLLELHTyPFVNKGiQP22Um0EuVtKAQkCQYnUldlLG+U2tG
         5nkfTp0gOqSbqclUa3NPwAgTXAsdIHUanMy2d9m5b9AmcSad/RY4uRlleLeUxhXTfpoy
         SPGa972bDouQLVhRa1H7sMb6t0I2KWkTfbzZ9SdiVNAFuCOo1SvVkLYk7DtcT+MXAUXY
         fhQiRx7/qyiucQcIQWPH93i8AvakjObqlu3P2VH6Z6YTZbttZ7/zbgjjABo8zdBLGAb+
         IyYLnezHJAHs4xjobtipUeZg0rLLRLVTkeLHB4fb3/Qpkx1I1dU3ND6aQBAjBrfK8Kmp
         /fdw==
X-Forwarded-Encrypted: i=1; AJvYcCVxtuMECkySnKay+DRBkbTyt1muFC4BDzMQgMdKU9jBEFJ5ZVZGRpqmoDLBNX1ZeEqw5VoPwkOj0zRG@lists.linux.dev
X-Gm-Message-State: AOJu0YzbSPaYsYTkp6VRvLrJ/xoRKFnq7tgb41uvtDX6Zr6GJDRPzAoP
	Sg4W5LtWW/TtGyGEy5sZ2ImwkX8Xu/0cm79RSu4jBzkL0Y02gDfug3eb1GfKxiwQjjnqZeeaTJe
	Mqw==
X-Google-Smtp-Source: AGHT+IH361hyEP8ZBxDjRVTWmQZDmlNvVhHg1tXUKZ2PrfsrRNnR2/vcWBj5z0ljoK7+gcYBV3qV4n3VGY0=
X-Received: from pjbhl13.prod.google.com ([2002:a17:90b:134d:b0:2e0:9fee:4b86])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2747:b0:2f2:a664:df1a
 with SMTP id 98e67ed59e1d1-2f548e9c9bcmr19626538a91.2.1736556567441; Fri, 10
 Jan 2025 16:49:27 -0800 (PST)
Date: Fri, 10 Jan 2025 16:49:26 -0800
In-Reply-To: <CAAH4kHZn_gtspOisv6gxQiD=JeZbZstQoR68mFCxn34Am76Bdg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <cover.1735931639.git.ashish.kalra@amd.com> <14f97f58d6150c6784909261db7f9a05d8d32566.1735931639.git.ashish.kalra@amd.com>
 <6241f868-98ee-592b-9475-7e6cec09d977@amd.com> <8ae7718c-2321-4f3a-b5b7-7fb029d150cf@amd.com>
 <8adf7f48-dab0-cbed-d920-e3b74d8411cf@amd.com> <ee9d2956-fa55-4c83-b17d-055df7e1150c@amd.com>
 <d6d08c6b-9602-4f3d-92c2-8db6d50a1b92@amd.com> <Z4G9--FpoeOlbEDz@google.com> <CAAH4kHZn_gtspOisv6gxQiD=JeZbZstQoR68mFCxn34Am76Bdg@mail.gmail.com>
Message-ID: <Z4HAFmyhw5DeIRBT@google.com>
Subject: Re: [PATCH v3 6/7] KVM: SVM: Add support to initialize SEV/SNP
 functionality in KVM
From: Sean Christopherson <seanjc@google.com>
To: Dionna Amalie Glaze <dionnaglaze@google.com>
Cc: Ashish Kalra <ashish.kalra@amd.com>, Tom Lendacky <thomas.lendacky@amd.com>, pbonzini@redhat.com, 
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, 
	john.allen@amd.com, herbert@gondor.apana.org.au, davem@davemloft.net, 
	michael.roth@amd.com, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-crypto@vger.kernel.org, linux-coco@lists.linux.dev
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 10, 2025, Dionna Amalie Glaze wrote:
> On Fri, Jan 10, 2025 at 4:40=E2=80=AFPM Sean Christopherson <seanjc@googl=
e.com> wrote:
> > > Is there a way to change the load order of built-in modules and/or ch=
ange
> > > dependency of built-in modules ?
> >
> > The least awful option I know of would be to have the PSP use a higher =
priority
> > initcall type so that it runs before the standard initcalls.  When comp=
iled as
> > a module, all initcall types are #defined to module_init.
> >
> > E.g. this should work, /cross fingers
> >
> > diff --git a/drivers/crypto/ccp/sp-dev.c b/drivers/crypto/ccp/sp-dev.c
> > index 7eb3e4668286..02c49fbf6198 100644
> > --- a/drivers/crypto/ccp/sp-dev.c
> > +++ b/drivers/crypto/ccp/sp-dev.c
> > @@ -295,5 +295,6 @@ static void __exit sp_mod_exit(void)
> >  #endif
> >  }
> >
> > -module_init(sp_mod_init);
> > +/* The PSP needs to be initialized before dependent modules, e.g. befo=
re KVM. */
> > +subsys_initcall(sp_mod_init);
>=20
> I was 2 seconds from clicking send with this exact suggestion. There
> are examples in 'drivers/' that use subsys_initcall / module_exit
> pairs.

Ha!  For once, I wasn't too slow due to writing an overly verbose message :=
-)
