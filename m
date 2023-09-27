Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25A4314292
	for <linux-coco@lists.linux.dev>; Wed, 27 Sep 2023 14:38:29 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-50348c54439so4170e87.1
        for <linux-coco@lists.linux.dev>; Wed, 27 Sep 2023 07:38:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1695825508; x=1696430308; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kwuHSbCRREo5aUbdJ9sWu968f7uoQohrIUFOvrQTtAQ=;
        b=YE3MxwRvO0NmeAzkB3VgPPwkH+PacPD4IMmKmGo/TS+p0sKEC1YUG4MwBuLAef6Yam
         tZu5rRD1ijbr3LyGwnIc2nXmI3qLnPw51c3mr2QIQuuuveqwXbBr98NBT9a/eb9ULS17
         cCuZyqHiRQ5FEtQvCOKeKjj85BWC6wVfwmmW4v2RxoWs+3IoaTa8+1D3KfozvVxeTfxh
         CJH2NZ4mgj16TBim2Av2wme7m8QKFTHm4nv7VUCqC3fb7hKdOBble9G3zg0w76Kl3ZLV
         BoNLoq76ha8z1wu7bI3VkYKukrDTEAJnrqsEeDr7wauo9oafrqB0ZoKzRpYWEl+A5Uu0
         8vrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695825508; x=1696430308;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kwuHSbCRREo5aUbdJ9sWu968f7uoQohrIUFOvrQTtAQ=;
        b=Gwet4vErwYoGDGWD/2KCtqTGQ5uuvtdTrB+1utZOD2MdjC131ONQzBtcfKP4b19XcF
         K0YHTRcD6OUMbtITg36O5H2kuRyDuMhKkNnFWU7cGtkFtepG94NK4nOL89273WQV/zNI
         F7rFdT8ZIeuShdz8aMeXxHV+9nqH2ybQwuUm4/dUimeLTrSndT9UfMIjLiyEY4G7hYgq
         Z57wlLDA7qvdOseV153hSVdAyeB0lZKNwUWoGohmED+tM3WZECrLswlpvB52xmrQznfV
         CnUwi9sgfea5GXFitXLonCrnzHhEH9/EdQ+zLCo1gwUzh4yBQWWQEjcYG0y/IorZ9nBA
         xBuQ==
X-Gm-Message-State: AOJu0Yzqwv51y+IypYg5aX1lc0sfUOz60Ja4woK4XimXm6TrmDvmIwqi
	fm9/186czFd4vB67FPsJevv4Qx320YOm1O2Btst/qQ==
X-Google-Smtp-Source: AGHT+IE0gH7zFleu7xoNGGBjmrFt70/G7NBdkx0ikfMBUwovBQX/1Ee6zh2CoeyoR1CwduIBaNurXRUJ/dV7DFnbRF4=
X-Received: by 2002:a05:6512:3e0b:b0:504:7b50:ec9a with SMTP id
 i11-20020a0565123e0b00b005047b50ec9amr121228lfv.1.1695825507825; Wed, 27 Sep
 2023 07:38:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <169570181657.596431.6178773442587231200.stgit@dwillia2-xfh.jf.intel.com>
 <169570182987.596431.14062417344858914481.stgit@dwillia2-xfh.jf.intel.com>
 <c3d347a7-58d6-4830-aad4-d354b83f0704@linux.intel.com> <CA+1=6yfmLXJbZu7Gd7cp_HOAbmHwx54aPgozWKBikWwZSYTOZw@mail.gmail.com>
 <6513e6079a427_91c1e294e@dwillia2-xfh.jf.intel.com.notmuch> <CA+1=6yeP6dDiXVQrxMt0AaEF_7S05p4Do67=ysXK-Chfvu-9ow@mail.gmail.com>
In-Reply-To: <CA+1=6yeP6dDiXVQrxMt0AaEF_7S05p4Do67=ysXK-Chfvu-9ow@mail.gmail.com>
From: Peter Gonda <pgonda@google.com>
Date: Wed, 27 Sep 2023 08:38:16 -0600
Message-ID: <CAMkAt6ohEnYwC8yVzye0F4gApvuyktHDP-q8-p7gJnSAyRMR_Q@mail.gmail.com>
Subject: Re: [PATCH v4 2/6] configfs-tsm: Introduce a shared ABI for
 attestation reports
To: Thomas Fossati <thomas.fossati@linaro.org>
Cc: Dan Williams <dan.j.williams@intel.com>, linux-coco@lists.linux.dev, 
	Dionna Amalie Glaze <dionnaglaze@google.com>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Samuel Ortiz <sameo@rivosinc.com>, 
	Thomas Gleixner <tglx@linutronix.de>, peterz@infradead.org, linux-kernel@vger.kernel.org, 
	x86@kernel.org, dave.hansen@linux.intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 27, 2023 at 2:25=E2=80=AFAM Thomas Fossati
<thomas.fossati@linaro.org> wrote:
>
> On Wed, 27 Sept 2023 at 10:21, Dan Williams <dan.j.williams@intel.com> wr=
ote:
> > It can be expanded when/if those platforms expand the
> > size of the supported user data, or another configfs-tsm backend arrive=
s
> > that needs that capability.
>
> Makes sense, thanks.

I'm not familiar with the rats eat spec but I would assume the
protocol would acquire more than just the nonce in the inblob.
Probably some combination of claims, nonce, and information about a
public key? Does the specification allow for the data needing to be
signed by the TSM to be hashed first?
