Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1804B11C8A
	for <linux-coco@lists.linux.dev>; Wed, 27 Sep 2023 19:05:58 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2c135cf2459so181681421fa.0
        for <linux-coco@lists.linux.dev>; Wed, 27 Sep 2023 12:05:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695841557; x=1696446357; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cthrC2AE+hQRI1g23zDyJaz/ao2H94DB6TkDVFhMAT8=;
        b=GxmHaCguoHLl5hmuuqhBXOvBxp7gq5nEm4L/1D3bmUXp1Pny6oKDs2ohZ0lUFMfyvq
         SEahxRfki+COZhE9EORna9LNL3QG6yNiaQboOblqIGzSC13nmnSPB34fZIk6qOCLRAY0
         xTp/OKAytzpCn0xhV5jkDmbQwbqI4+XDxv0FXF4TXjXb30gDHjBNan+QxdwZXqgjQ47i
         0/yIMzIC5SM9YxMvwDwtBXt0sc7Q0MxUvnC7z0vHVLuBQ8UZLnQ40orJOgHCtQRi0TaY
         Bdl1V9rdgdUnHQqxeBiXq8bbcHRX73Q59ygyn2RSrUN7m1gSpxhFi7QLENuTWJL6QRC+
         ncXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695841557; x=1696446357;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cthrC2AE+hQRI1g23zDyJaz/ao2H94DB6TkDVFhMAT8=;
        b=QQqs5AMCSleSof97QuYl2AzajoPCNEjGkKUzEc+zpJ4J3sPp2tSEPlK76lXjcxWkld
         /u3ooE1NwXZplb7lH5uSfc6x5xsPVIPiwse/EvvUp5d4oBJk3vaNyBgB/H6Q8wwbnxSj
         mTFgoR3L0yrvqOeUgrXMNZlywalQ3RysVdE0rjzBnVPmHCZQRzWyIEUdswBF+IoqwNnr
         1YWS6qDP9TVm6Xh1IzsgqHpqJuQrgEnpuOePs/bgMLLgqpQ7qF/OAiCoqSqRny2kFMfg
         2LjftyrkfL8dmgq6lLhSXfIIX6lxpuHi1DdtXuD94olVk2EmCAogyDVTlVWhLtiTUIfJ
         ESaQ==
X-Gm-Message-State: AOJu0Yy6x/JP2+kDMrtmFnCmUqcP4EFO298JDgtC0cN0tFYX4+NmTxxa
	sJOHH5aWPaIKvpWwjQucb1x/wCUwm2ZnORvIa9Ecgw==
X-Google-Smtp-Source: AGHT+IEG0GkBc5auFmv1wHBXddUXWoWjQW9Z1kvH5V3ktssd5ya+XFoxO3wtAkfETADcwfDgbMgCpIp9vEJoQNv/VyQ=
X-Received: by 2002:a2e:9b94:0:b0:2bf:df8c:4e5e with SMTP id
 z20-20020a2e9b94000000b002bfdf8c4e5emr3021856lji.15.1695841555896; Wed, 27
 Sep 2023 12:05:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <169570181657.596431.6178773442587231200.stgit@dwillia2-xfh.jf.intel.com>
 <169570182987.596431.14062417344858914481.stgit@dwillia2-xfh.jf.intel.com>
 <c3d347a7-58d6-4830-aad4-d354b83f0704@linux.intel.com> <CA+1=6yfmLXJbZu7Gd7cp_HOAbmHwx54aPgozWKBikWwZSYTOZw@mail.gmail.com>
 <6513e6079a427_91c1e294e@dwillia2-xfh.jf.intel.com.notmuch>
 <CA+1=6yeP6dDiXVQrxMt0AaEF_7S05p4Do67=ysXK-Chfvu-9ow@mail.gmail.com> <CAMkAt6ohEnYwC8yVzye0F4gApvuyktHDP-q8-p7gJnSAyRMR_Q@mail.gmail.com>
In-Reply-To: <CAMkAt6ohEnYwC8yVzye0F4gApvuyktHDP-q8-p7gJnSAyRMR_Q@mail.gmail.com>
From: Thomas Fossati <thomas.fossati@linaro.org>
Date: Wed, 27 Sep 2023 21:05:39 +0200
Message-ID: <CA+1=6yczjPCaPsVc+s9_HC-6pNk52VsFviMeqqDWR4v2RFDBjw@mail.gmail.com>
Subject: Re: [PATCH v4 2/6] configfs-tsm: Introduce a shared ABI for
 attestation reports
To: Peter Gonda <pgonda@google.com>
Cc: Dan Williams <dan.j.williams@intel.com>, linux-coco@lists.linux.dev, 
	Dionna Amalie Glaze <dionnaglaze@google.com>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Samuel Ortiz <sameo@rivosinc.com>, 
	Thomas Gleixner <tglx@linutronix.de>, peterz@infradead.org, linux-kernel@vger.kernel.org, 
	x86@kernel.org, dave.hansen@linux.intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Peter,

On Wed, 27 Sept 2023 at 16:38, Peter Gonda <pgonda@google.com> wrote:
>
> On Wed, Sep 27, 2023 at 2:25=E2=80=AFAM Thomas Fossati
> <thomas.fossati@linaro.org> wrote:
> >
> > On Wed, 27 Sept 2023 at 10:21, Dan Williams <dan.j.williams@intel.com> =
wrote:
> > > It can be expanded when/if those platforms expand the
> > > size of the supported user data, or another configfs-tsm backend arri=
ves
> > > that needs that capability.
> >
> > Makes sense, thanks.
>
> I'm not familiar with the rats eat spec but I would assume the
> protocol would acquire more than just the nonce in the inblob.
> Probably some combination of claims, nonce, and information about a
> public key?

Looking at existing EAT-based (or EAT-like) serialisations:

Arm CCA has a single, 64 bytes challenge (see =C2=A7A7 of =E2=80=9CRealm Ma=
nagement
Monitor (RMM) Specification=E2=80=9D [1].)

CoVE too, see [2].

Nitro instead is doing something different: GetAttestationDoc() has
optional user-provided public key, custom user data, and a custom
nonce passed in as separate input arguments [3].

So, what @inblob's structure looks like really is a choice of the
attester's vendor.

> Does the specification allow for the data needing to be
> signed by the TSM to be hashed first?

EAT per se is mostly agnostic, it has a flexible and extensible type
system, which can adapt to most attester =E2=80=9Cshapes=E2=80=9D.

Hope this answers your questions.

cheers, t

[1] https://developer.arm.com/documentation/den0137/latest
[2] https://github.com/riscv-non-isa/riscv-ap-tee/blob/main/specification/a=
ttestation.adoc#tvm-challenge-claim
[3] https://github.com/aws/aws-nitro-enclaves-nsm-api/blob/4b851f3006c6fa98=
f23dcffb2cba03b39de9b8af/nsm-lib/src/lib.rs#L218
