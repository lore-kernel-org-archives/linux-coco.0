Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45DA612C499
	for <linux-coco@lists.linux.dev>; Wed, 14 May 2025 15:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747236106; cv=none; b=VGsr2eOi4l+TA/pmAmutSEXMj+wj8P96ldKycsB75/OFDfoxmPH9FK8GcybuH54yq40bmoE6PKuwUujYxfKROjKrcXTiofRHSIdIxVkhC6g2/WaofjBLI7c3bdCWQAsnbIxeeWAySgqSjCzkfhwMxaXp2XwyWT/hJdqv/fU3NFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747236106; c=relaxed/simple;
	bh=aqm8chgeUHE9w7V6OzdaFcFnAZV9Anw5fN17DWsCSJo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S4kw+TU6UGaN3573TCnM9LICOPPvOxKT8w1QJrX7PEieUMamYfX0n6pjPyQGzRoHT9oz8g/nN7rx3vdZ9bZvT0TAsH2MjWaiXkV4O96rJH7OAE6wtF8LlxSHeTN5npjK+IYVueND2heS03bhmR2JSt7si3nSMHDP7SXNAVMtm1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GdNegrF3; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GdNegrF3"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-22e39fbad5fso211905ad.1
        for <linux-coco@lists.linux.dev>; Wed, 14 May 2025 08:21:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747236104; x=1747840904; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A5kkfSfbrLWrkERpgfX2DFIg4PKuqh/HkLXjbsJIBtM=;
        b=GdNegrF3Mtakbq+ax23ke3Q1BpTPmwuNM5hY8iHG+fp6QbA6hIOYpwO7QtaxOw2I7Y
         e83A9WwIhprTtkD2/7XwUAxVFOtVxr8LJRxxq/JnF+QdV98bRmmbq4PwrBC6CMHeinNz
         yf7IBPz6SbjujB/DjYNsxpLwEN+bYhGoCSfVpTU4CXIkvB2ezH6mGUFIecQmQ20rou+L
         JCq2j0Q6EVSw4L2jCTKX0KoeqGAj1xeyJR9Y0Ha7z+KhoouuWDMf2yhBX6RTj9bj9w6l
         xeca7674V+Rxt7A4FRkmNS2sdP/Nisd2fbNOngyegTdhm1pTheTx+t+C+L/x7QxYcRFp
         1U6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747236104; x=1747840904;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A5kkfSfbrLWrkERpgfX2DFIg4PKuqh/HkLXjbsJIBtM=;
        b=qEfFhgV+Yw8VnFSyKBvNQ1XjIDyVjtG20j/03HZ9ZXgigxJCj0uywUAuZMZs62U1ey
         K2ncksX9KbdrHwQfbRr0CLHslGpMMtQLIGaCx//+VJjmTz9o1jAgelyHF1gOzezmyoQB
         cVSJ0tGHlYa2H8hfmjC5zxt+IPxVtuXvztyE0qm30Lq2sZfCSMBazgCA3SG5ii5F2/1w
         MUGvMbroUqDcNsy4zJ4YWsz6L47UXTjVJzZtdrfc60fBuh4JWo/uRGSQzT/oBxCzEIzB
         gQU3vyxZb7ZVdQ9u4oGKUlOZtHQcvtOg3UubxiQHDKqfe1XBG7nwMkfyB0gSrqiPrHkH
         Pyvw==
X-Forwarded-Encrypted: i=1; AJvYcCUkq3TThcKBi6yAvhgudImYr2qp8hoGtnDXwAR1Ac/STTOmzfiRxSOl+BqVca/J8Pf09aldaQGwtQDr@lists.linux.dev
X-Gm-Message-State: AOJu0YzxN6PGxtTh8feuQL5kiG/AOaBB8qv1jP6l5FxohnrY86GkfzZn
	rrskbT6Vib/CX5xEtZUAk0B7HOaWqlYqUIc/MO9d9p4civV21OmPIn/GxfWpTPknrGZteZLWrKc
	sjQ4Zp0Sxoi0277nMt0vIjlE6Z5esh32PGnY0ljo3
X-Gm-Gg: ASbGncuvI+0fWlrCIA9r93eekCf0aF3YUa8xYP8GBMc9UlYhL2WiGyyOLGer6ODWJIP
	RYB+D5qaZtgh/Uch4eDEurITl5NWUWRC4Cs/nhIsLTsc7GD/cWm0klIZerDuXYzwbtxT1NzPl3D
	89SWKJh9hC3rdNSalySyt4kgMnmpBMlDWrjAas3Vvw9QLMa7f2hmUO9g76GKaHYIJXIQ==
X-Google-Smtp-Source: AGHT+IEDFjAEViaETl+HXGG3nCMSzRvQ2B8Cbr4reJBBfbEw48+Tr0BGQ9AFALmBDU3tuYflnPtNSELVDngmLibLraQ=
X-Received: by 2002:a17:903:1109:b0:215:f0c6:4dbf with SMTP id
 d9443c01a7336-2319909c216mr3419965ad.14.1747236104067; Wed, 14 May 2025
 08:21:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250502130828.4071412-1-kirill.shutemov@linux.intel.com>
 <20250502130828.4071412-12-kirill.shutemov@linux.intel.com> <6a7f0639-78fc-4721-8d84-6224c83c07d2@intel.com>
In-Reply-To: <6a7f0639-78fc-4721-8d84-6224c83c07d2@intel.com>
From: Vishal Annapurve <vannapurve@google.com>
Date: Wed, 14 May 2025 08:21:32 -0700
X-Gm-Features: AX0GCFscmcl35uOjE18U2ra8ong5Qbdrs0qjWEtEJdayACylFUy94ngUS-DfONY
Message-ID: <CAGtprH--e6i6b9grOLTUwYXKSNb=Ws5sNPniY+oJpyctM1cdTA@mail.gmail.com>
Subject: Re: [RFC, PATCH 11/12] KVM: TDX: Reclaim PAMT memory
To: "Huang, Kai" <kai.huang@intel.com>
Cc: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, pbonzini@redhat.com, seanjc@google.com, 
	rick.p.edgecombe@intel.com, isaku.yamahata@intel.com, yan.y.zhao@intel.com, 
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, kvm@vger.kernel.org, x86@kernel.org, 
	linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 13, 2025 at 6:12=E2=80=AFPM Huang, Kai <kai.huang@intel.com> wr=
ote:
>
>
>
> On 3/05/2025 1:08 am, Kirill A. Shutemov wrote:
> > The PAMT memory holds metadata for TDX-protected memory. With Dynamic
> > PAMT, PAMT_4K is allocated on demand. The kernel supplies the TDX modul=
e
> > with a few pages that cover 2M of host physical memory.
> >
> > PAMT memory can be reclaimed when the last user is gone. It can happen
> > in a few code paths:
> >
> > - On TDH.PHYMEM.PAGE.RECLAIM in tdx_reclaim_td_control_pages() and
> >    tdx_reclaim_page().
> >
> > - On TDH.MEM.PAGE.REMOVE in tdx_sept_drop_private_spte().
> >
> > - In tdx_sept_zap_private_spte() for pages that were in the queue to be
> >    added with TDH.MEM.PAGE.ADD, but it never happened due to an error.
> >
> > Add tdx_pamt_put() in these code paths.
>
> IMHO, instead of explicitly hooking tdx_pamt_put() to various places, we
> should just do tdx_free_page() for the pages that were allocated by
> tdx_alloc_page() (i.e., control pages, SEPT pages).
>
> That means, IMHO, we should do PAMT allocation/free when we actually
> *allocate* and *free* the target TDX private page(s).  I.e., we should:

I think it's important to ensure that PAMT pages are *only* allocated
for a 2M range if it's getting mapped in EPT at 4K granularity.
Physical memory allocation order can be different from the EPT mapping
granularity.
