Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6DB222DC27
	for <linux-coco@lists.linux.dev>; Tue, 14 Jan 2025 10:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736851373; cv=none; b=nz2JvSDr50c8uI3a76DxZtbRptsz8jpop8b1EGb+P7wyEKqTr3/uoLgkA32dmJmJqsNsSuUG7pU68sO+tKgDgEVIFHMp399zVyulyLRW1915klSBL2Zkq4cY+Is1hRcZOfsw+ohoC7jJX+oxAkQms08bJP53pUANHBN4HfeFlcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736851373; c=relaxed/simple;
	bh=XUmwUb2mpX4ZIjItpQkbXH2upcyx/o8+os3uVGGcCto=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Hdo0zGVNX5eQJPlzZgtvBaBZvygwPHYJbjqxsSkiFgKlcIKPFym2cLMwy/TqOuRUqUxmpvG3kq++EE//gSO1oBJ2sdxO9QFANtr17l1NqMtVupsFuJBNs/JSiJHtmiSyH5n/ETlV82HC87p5ZDsnMbZHVutwnJCKAcL367ThsGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XJ905IAl; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XJ905IAl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736851370;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XUmwUb2mpX4ZIjItpQkbXH2upcyx/o8+os3uVGGcCto=;
	b=XJ905IAlPqdevsKBzP1g+EfyTF1zNB2oz8cnZSs2jP2xpelaK/rD+iR1fyA3QWrPK52Gz1
	YjQRCHs8yCq1shb2XKJRgkoL4GIfvT53JPRcPLvvDocf4bEALMrlQ7yQvPwGXGSBPKGjj4
	gscQGF8ib7buAYc604V00x1F7+CNN48=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-208-HfjB_27AMnOhR_8R7B2rpg-1; Tue, 14 Jan 2025 05:42:47 -0500
X-MC-Unique: HfjB_27AMnOhR_8R7B2rpg-1
X-Mimecast-MFC-AGG-ID: HfjB_27AMnOhR_8R7B2rpg
Received: by mail-yb1-f197.google.com with SMTP id 3f1490d57ef6-e3a1bc0c876so11608730276.1
        for <linux-coco@lists.linux.dev>; Tue, 14 Jan 2025 02:42:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736851367; x=1737456167;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XUmwUb2mpX4ZIjItpQkbXH2upcyx/o8+os3uVGGcCto=;
        b=L1Dv4AOUQr1fMQaSb2d8AZo9KzDmyficNszNQoSQ8B4PxUy/MP70aCns9nvh/2/Nwa
         WKDliw0wzLQnRqZ8i6WDcWeOtvj2jz+/EphD0ERvmdRiBpco+irM0vrYmSXk3suflRKE
         4iJE+ENWx2w0ndufW0R6/w28nBfpejgQ8Y1R1ShgPT3ZhayD2BKQvS7fNzl3hr8s9FtJ
         MruXTFooy0GJdneQqBPfCi7xAape5A1+/dNhinJMM8pc9s07IP1IkNmSgpFE3NkEh1m7
         3IizmszQpLIUkI/h5idFn9NpKYWh31UkH9x6JON5G+FeP6jQV8b6DX4OsKlz4Z4V3M/E
         XJtg==
X-Forwarded-Encrypted: i=1; AJvYcCV3Hh1JjJvw8ySRyREcFN6bo2pnMR3ggBqyGRNLlYYCuuSetr8bHbEG6t4CJ8hxNfAh6CyvlVZC5y3l@lists.linux.dev
X-Gm-Message-State: AOJu0YxCRkG6XPow7td27Ty9W+KBM7D8RUfH6budt9ecF5kDEz1mgiWJ
	/T1B4X5LzGrEhoKnYqxA1TcWnzQ62E0A5F7FcehGKqK9KP8++NxUGkTbxRDkx8HK1Ln80sOYqbo
	ncRrpb28JQ59cG3jTFnC/zdRvq/Gd+ZbQx3Jq5s7v4+ofzfVTD1LoTbQ37gPQ40TkuUCNX4SV47
	bHRY69mAgh/T2ABm9H9hAmALaV0SOOpz0gNQ==
X-Gm-Gg: ASbGncuoZw7lceneIaSnJ2Tn161uxjK15YtQGoPng664a4yMBJ6kdaiD60fxLFMgJYu
	ycQ0sezJHM7w8V5FaHyiiPtPDYBSvZqPDUJj8PQ==
X-Received: by 2002:a05:6902:2b8f:b0:e57:3635:8659 with SMTP id 3f1490d57ef6-e573635870fmr9141703276.25.1736851366892;
        Tue, 14 Jan 2025 02:42:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFOZIJlicLLrBAyQmDoeqAtFnyT1ImV+T1Uhx17NQT/QOC5LkDQJVhFAyMaYO7X972M5OFPus6XF/HZMq7kyU8=
X-Received: by 2002:a05:6902:2b8f:b0:e57:3635:8659 with SMTP id
 3f1490d57ef6-e573635870fmr9141695276.25.1736851366585; Tue, 14 Jan 2025
 02:42:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241210143423.101774-1-sgarzare@redhat.com> <20241210143423.101774-4-sgarzare@redhat.com>
 <20241210144025.GG1888283@ziepe.ca> <50a2e1d29b065498146f459035e447851a518d1a.camel@HansenPartnership.com>
 <20241210150413.GI1888283@ziepe.ca> <CAGxU2F6yzqb0o_pQDakBbCj3RdKy_XfZfzGsiywnYL65g6WeGg@mail.gmail.com>
 <20241211150048.GJ1888283@ziepe.ca> <CAGxU2F7QjQTnXsqYeKc0q03SQCoW+BHbej9Q2Z8gxbgu-3O2fA@mail.gmail.com>
 <D6FSHG5Z9UJQ.CWQTAANBVIQQ@iki.fi> <6rwo7tkdst227kb4pwvr54w4mfz2zw3offux7mqfupi3rgwkaz@65yklvvqw6n4>
In-Reply-To: <6rwo7tkdst227kb4pwvr54w4mfz2zw3offux7mqfupi3rgwkaz@65yklvvqw6n4>
From: Stefano Garzarella <sgarzare@redhat.com>
Date: Tue, 14 Jan 2025 11:42:34 +0100
X-Gm-Features: AbW1kvaMP9hqrX7EbZd8ixyMHLxXzfJgXSkmu3Hcf4GyoCzHKWggJwOwPVU6IFE
Message-ID: <CAGxU2F4YQy-otsGtGiUHDiL7PGXic2_HzWL_+GHkn+Hs_ScGpQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] x86/sev: add a SVSM vTPM platform device
To: Jarkko Sakkinen <jarkko.sakkinen@iki.fi>
Cc: Jason Gunthorpe <jgg@ziepe.ca>, James Bottomley <james.bottomley@hansenpartnership.com>, 
	linux-coco@lists.linux.dev, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Peter Huewe <peterhuewe@gmx.de>, 
	"H. Peter Anvin" <hpa@zytor.com>, linux-integrity@vger.kernel.org, x86@kernel.org, 
	Joerg Roedel <jroedel@suse.de>, Jarkko Sakkinen <jarkko@kernel.org>, linux-kernel@vger.kernel.org, 
	Ingo Molnar <mingo@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Claudio Carvalho <cclaudio@linux.ibm.com>, Dov Murik <dovmurik@linux.ibm.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: hxLOFMtMh7PODgkWqX7hbAOTXyP3ZYDYm9m7u3qh0bQ_1736851367
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Hi Jarkko,

On Thu, 19 Dec 2024 at 17:07, Stefano Garzarella <sgarzare@redhat.com> wrote:
>
> On Thu, Dec 19, 2024 at 05:40:58PM +0200, Jarkko Sakkinen wrote:
> >On Thu Dec 19, 2024 at 5:35 PM EET, Stefano Garzarella wrote:
> >> So to use them directly in sev, we would have to move these definitions
> >> into include/linux/tpm.h or some other file in inlcude/. Is this
> >> acceptable for TPM maintainers?
> >
> >There's only me.
> >
> >I don't know.
> >
> >What you want to put to include/linux/tpm.h anyway?
>
> At least tpmm_chip_alloc(), tpm2_probe(), and tpm_chip_register()
>
> >I have not followed this discussion.
>
> Let me try to summarize what we are doing: We are writing a small TPM
> driver to support AMD SEV-SNP SVSM. Basically SVSM defines some sort of
> hypercalls, which the guest OS can call to talk to the emulated vTPM.
>
> In the current version of this series, based on James' RFC, we have an
> intermediate module (tpm_platform) and then another small driver
> (platform_device) in arch/x86/coco/sev/core.c that registers the
> callback to use.
>
> To avoid the intermediate driver (Jason correct me if I misunderstood),
> we want to register the `tpm_chip` with its `tpm_class_ops` directly in
> arch/x86/coco/sev/core.c where it's easy to use "SVSM calls" (i.e.
> svsm_perform_call_protocol()).
>
> And here I have this problem, so I was proposing to expose these APIs.
> BTW, we do have an alternative though that I proposed in the previous
> email that might avoid this.

Any thought on this?

Thanks,
Stefano

