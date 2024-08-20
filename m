Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35C591547C9
	for <linux-coco@lists.linux.dev>; Tue, 20 Aug 2024 19:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724183077; cv=none; b=XRGNOCbxRfQmk6t681d62v4RUYaKcUc7yGw9ul7lTWT8OP/BFZKpvThDSkbFV55IAjiopMnWgiODVfonqmZt/wAnrc/NOa/b/QycBFRg9O1t3G21XD+tK6GX3ToGGo0A/p7y6dpCteKT08wGF1KMJYnEtCLCnUrzGFmOeTTVe68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724183077; c=relaxed/simple;
	bh=ZJaHs1/opTBSHJguuRopmUMDFqDizKViMy4knODnj3s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LWo3ibAv8Xkcu5kSzVkRvK4R8VIfrowIswAezgZOahqdm8KJhQx+12m/pjSUybYVRGAGGtsvFABnjj36yQutNq6mibyYC80Wa6qDKYhBqpgjNnAkH7Leua9xSR1ecMTQCyudn9Z8Cd5Xtxy7ITxzmiVc8vIqOYU45mqGy9a01kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VxgiEl1G; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VxgiEl1G"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-42817f1eb1fso47682175e9.1
        for <linux-coco@lists.linux.dev>; Tue, 20 Aug 2024 12:44:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1724183074; x=1724787874; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZJaHs1/opTBSHJguuRopmUMDFqDizKViMy4knODnj3s=;
        b=VxgiEl1G/8g1OiHkVoWckL9q0yfwMW/SyFvChIWKsw8c6Lq63PCc7jyOedmIznoTVP
         1E6JA+VTInsWM9/+BHDYza92EeIFwva4KroVQk02C2sOedm5Qf4A+xVjmcKcqYSzpVoq
         Lq9IxFYveQpsDDlRp3+pQbUVoC7Cj0V22fxqAN6Q8Ut+tmzPob4ot80kgSVJdtb7vJN2
         61DP+aIlKkaI29gzdH1Ac6PKe9+W8HDE87wFw3pDIIt+eoZyMZ0/se1QyV91gik7sLPn
         SZRzcpw/7ZIcpiw2tU8w5YNbCAga0WXfmCBW/64poDFY3nk8UitTZ5bdPxtMiGMiY1hy
         1WQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724183074; x=1724787874;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZJaHs1/opTBSHJguuRopmUMDFqDizKViMy4knODnj3s=;
        b=caw8mwX8q2lqiydz8i/eyl5fxgJ5fSX0qxNp27cHfe8pb5dJBlKxflAUBrspBpkx7d
         CCq4InLI3axkG2FwaRmhG+2zIFCAb1RHZjvtp7+2qAUrJ6YrISQNNpk3SAqKBQIFQ9eW
         4SeDz5ZTjbfLGOK05K/dv9lJU7pnc5orph4qPcdXBeUZUOCS4u2EpHmg4E0K5zVWqslu
         g9he9fGrrbcSOlKDLxLyNsJrYsy96H2tr/70CWbO0KDeXmgzY6a35stfhir9tRTfVaQH
         jdBdfvuTC8zxWA44xew/dwTYlD5J9KZ7ARqRIMzfCsEiN+GFGp2NAgiTSLT37/7x22vl
         CvJw==
X-Forwarded-Encrypted: i=1; AJvYcCXiXltZYCEdhdReeUjxSqeULZhU/qAvkvrYRhJ6uRZCOqTlPE9eLc9L8Mvd7Pfret3aih3KykIvNQk2@lists.linux.dev
X-Gm-Message-State: AOJu0Yzsclx8cbdhpznFTOESsFRUBovWiSLXTwbH/httYIGgbVDAFVtU
	ohkiPbj4gNpMhz0Tm+Z7eTAFDtDv7nO+iAA1qHYAPfcc2SgAwUPk2UYyJEqlC7zurd4FF8NAVQu
	GT971eK74galY4bKj93o4jVD+h4AOvICEYPQ0
X-Google-Smtp-Source: AGHT+IG70cBNlT3plfJxI4DIerzuiQ3N5SE9z/tYuZFz919tjmblvr4exlJJh/0zkmLgxr3lQyg/f/xWx10j6efsw5w=
X-Received: by 2002:a05:600c:46c4:b0:428:16a0:1c3d with SMTP id
 5b1f17b1804b1-42abd2282c3mr2591225e9.19.1724183073980; Tue, 20 Aug 2024
 12:44:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240128212532.2754325-1-sameo@rivosinc.com> <c17a31e4fb30f5f9d4a337e5bd8d54cc6f99eef7.camel@HansenPartnership.com>
 <6DEAEC08-420C-46A9-8877-EBF60331A931@google.com> <ZsSXxMn-E7OCvxST@vermeer.tail79c99.ts.net>
In-Reply-To: <ZsSXxMn-E7OCvxST@vermeer.tail79c99.ts.net>
From: Qinkun Bao <qinkun@google.com>
Date: Tue, 20 Aug 2024 12:44:22 -0700
Message-ID: <CAOjUGWfa9gUp2HFQbnDmHyhHd3ZacpF0ngkXeb3qkt=4uspv5w@mail.gmail.com>
Subject: Re: [RFC PATCH v2 0/4] tsm: Runtime measurement registers ABI
To: Samuel Ortiz <sameo@rivosinc.com>
Cc: Dan Williams <dan.j.williams@intel.com>, 
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, 
	"Yao, Jiewen" <jiewen.yao@intel.com>, "Xing, Cedric" <cedric.xing@intel.com>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, linux-coco@lists.linux.dev, 
	linux-integrity@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Vishal Annapurve <vannapurve@google.com>, Chong Cai <chongc@google.com>, 
	Dan Middleton <dan.middleton@intel.com>, Alex Crisan <alex.crisan@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Samuel,

Sounds great, thanks for the helpful information! I am looking forward to t=
he
new patch.

Thanks,
Qinkun


On Tue, Aug 20, 2024 at 6:19=E2=80=AFAM Samuel Ortiz <sameo@rivosinc.com> w=
rote:
>
> Qinkun,
>
> I am working on a adding a patch that generates and exports a CEL, but
> this takes longer than I was hoping for, mostly due to a lack of
> bandwidth on my side. I will send a PoC for this as soon as I can, and
> folks can improve it from there.
>
> Cheers,
> Samuel.
>
> On Mon, Aug 19, 2024 at 02:25:15PM -0700, Qinkun Bao wrote:
> > A gentle ping on this email thread. We have tested the patch series [1]=
 and will release a product based on the patch series.
> >
> > If the patch series can not get upstreamed, the whole confidential comp=
uting community can not have a way to measure the workload with RTMRs. With=
out the patch, RTMR3 is completely unused. The patch works perfectly for ou=
r usage case (Like the existing TPM ABI, the raw measurement is taken inste=
ad of recording the log entry.). Assuming RTMR serves as an alternative to =
TPM-based measurement, migrating existing software to the RTMR could be gre=
atly simplified by developing an ABI that resembles the TPM.
> >
> > I don=E2=80=99t object to having an ABI to take the log entry. For our =
usage case, we use the Canonical event log [2] to measure the workload. I d=
o think that we should NOT block the patch series for several months to sol=
ve an issue that TPM can not solve.
> >
> > Link:
> > [1] https://lore.kernel.org/lkml/20240128212532.2754325-1-sameo@rivosin=
c.com/
> > [2] https://trustedcomputinggroup.org/resource/canonical-event-log-form=
at/
