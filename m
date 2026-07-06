Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3868F3AFCEE
	for <linux-coco@lists.linux.dev>; Mon,  6 Jul 2026 17:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783360644; cv=none; b=UC1MDuQwd5eNriV9ihih4ylKbpeND5Op1oUjOB4Y0NrfnX2gI6PhXauCxo2r08DxWJU+NQvxVnLKPUi3QnvjkMJzUqlzkUuTNej8GYxfHCB7mbINddkBL4Xwpw355Zq7+0ghZU+HNXQfxdcPJgv1s2XJTgrgJMH+ii6ygdIAV6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783360644; c=relaxed/simple;
	bh=jXDxXZ6gH2575d3O+6kJFNEy1oA0rlO/F+OwnbftaWo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ZWylH+m5lueV8tT2Sejc1Va77XSFvyHTfrvprdhDZ4YIhXgXSPkr+hcRECgmCgWk7zXPNwapWYM2tP0dge6Z39saPhUp6n/dmPO5Oj4v0DYrtHP1PgG5AGCKGFY9gM2IMF2DS6V75qkTFWiCkc4JuNRa7XTaTBS479awgu/F1Ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=E7qvQrU6; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="E7qvQrU6"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-2cca5e0a0c9so24613605ad.1
        for <linux-coco@lists.linux.dev>; Mon, 06 Jul 2026 10:57:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783360642; x=1783965442; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uGyUQ6xGWDS7+9iSL97V29abhH29LTMSGW4wRSqfrOI=;
        b=E7qvQrU6NGdj5KMX9ev9vMVl5ojX1S0aKwckSZpOpzoMEKSChJ6jx0kLhcFXTPnclT
         mTWG7RvVoQCXJl4EAytpSYF+1nyFra6ioWNyo4bMUOtI8ZjT6FH3dEGw0XYdJCB/E4vH
         Bq5LyhqPGNCBhQrSzJIKV6NJJ0UO982O/5qzB0fE8bAKOyi7mSMfljDPi1KaDpXPfR3v
         rWz8DyNF2bK3samX00kyWCS/gC+GnhAC0QR94MOXoeZ53hupCVGbra97QlNweoBIngLR
         RM1NkAl3QzJvJisly4aT02Kf9rVxtFDv2tia3zde1HZPQwu904iCGxwtclORa0lS5Dgh
         pU5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783360642; x=1783965442;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uGyUQ6xGWDS7+9iSL97V29abhH29LTMSGW4wRSqfrOI=;
        b=IWlzuoK8WfMJ/FJzCexFikd/USnAhR8WRB+ZQA941CbordYhDAXV0+hB1YbINi1MYY
         BHXTTP6cWMCZ4xEzB8Eeg52odZ9mPNit39RBdKuhoT+gVJruuULASweHmNSHw/ZEPIhR
         V5ljnzZfi4yf/13xWni/EHEOJgzm3h6HNHYxfZEUc6cyBauDCN+3YzT1sRScb5n+A0r/
         g2SGG2ivZX9pOP51ObKsRUK+J+ChGrS83ft0R9YcM+WSXcxMcUk/pSBGHFduSu7Fs2ib
         +KigyLbX8gUe+vBFeWrlJUzcVwO9aN29ELZomJG3QXPSJ8QJ8FN8h1fOZAW1Qk5okmWL
         XjCg==
X-Forwarded-Encrypted: i=1; AHgh+RqfozIooJHhh7mNkpRbDB8zaCUOF9ZjCy0ix+I50RpLXo6SyeUyAQYgNNACtWTkTKKcl49LJuZcAX4E@lists.linux.dev
X-Gm-Message-State: AOJu0YxJMX4JhDUwW80EFumxzDzKXhdxRgEV7xw9Ew2Pl2jyg4cht5M0
	DoRvJ+Idjoao3w87NW6Qeu56OEByyst/AqfYS29yzkBZuf4VdtcA78utWrS3W9nMTBQRTmCFnUB
	8QgCvFg==
X-Received: from pldy3.prod.google.com ([2002:a17:902:cac3:b0:2ca:e02e:5b86])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:e78f:b0:2cc:b480:28ba
 with SMTP id d9443c01a7336-2ccbf1a8c31mr16143665ad.44.1783360642396; Mon, 06
 Jul 2026 10:57:22 -0700 (PDT)
Date: Mon, 6 Jul 2026 10:57:21 -0700
In-Reply-To: <20260704054342.GB2169894@pedri>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260618081355.3253581-1-yilun.xu@linux.intel.com>
 <20260618081355.3253581-17-yilun.xu@linux.intel.com> <aj1tFuwZWdPGfUoG@google.com>
 <20260629100301.GA1743876@pedri> <akMQ3J6fK3DUBsPH@google.com>
 <23a9173f6e278ca7dfedce3374626c6ea3e1b47a.camel@intel.com>
 <6a445e4be6b12_3a3568100db@djbw-dev.notmuch> <akVNdxCzk-n4bgMv@google.com>
 <9df36c49e6be69dd9eece71f70a404a84b1563ab.camel@intel.com> <20260704054342.GB2169894@pedri>
Message-ID: <akvsgVjwb00P1EuA@google.com>
Subject: Re: [PATCH v2 16/17] KVM: TDX: Add in-kernel Quote generation
From: Sean Christopherson <seanjc@google.com>
To: Peter Fang <peter.fang@intel.com>
Cc: Rick P Edgecombe <rick.p.edgecombe@intel.com>, "djbw@kernel.org" <djbw@kernel.org>, 
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, Xiaoyao Li <xiaoyao.li@intel.com>, 
	Dave Hansen <dave.hansen@intel.com>, 
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, 
	"baolu.lu@linux.intel.com" <baolu.lu@linux.intel.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	"kas@kernel.org" <kas@kernel.org>, 
	"tony.lindgren@linux.intel.com" <tony.lindgren@linux.intel.com>, Yilun Xu <yilun.xu@intel.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Sohil Mehta <sohil.mehta@intel.com>, 
	Zhenzhong Duan <zhenzhong.duan@intel.com>, Kishen Maloor <kishen.maloor@intel.com>, 
	"yilun.xu@linux.intel.com" <yilun.xu@linux.intel.com>, "x86@kernel.org" <x86@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 03, 2026, Peter Fang wrote:
> On Wed, Jul 01, 2026 at 11:45:53AM -0700, Edgecombe, Rick P wrote:
> > On Wed, 2026-07-01 at 10:25 -0700, Sean Christopherson wrote:
> > > > > That is a good question. The answer is partly historical reasons,=
 but I
> > > > > think the pros/cons don=E2=80=99t really move the needle too much=
.
> > > > >=20
> > > > > The main benefit of doing it with the host in the loop is that th=
e guest
> > > > > side TDVMCALL quoting interface can stay the same. There is also =
a wrinkle
> > > > > in that there is a limited HW resource involved in the quoting,
> > >=20
> > > What is this magical resource?
> >=20
> > It's a HW crypto thing. I'll let Peter explain more.
>=20
> It's called S3M (Secured Startup Services). There was once a public
> document about it, but it was removed for some reason. It basically
> provides a number of boot and security services through dedicated HW.
> Attestation is one of them. This is part of our plan to develop new
> attestation schemes without using SGX.
>=20
> There was a lot of internal debate about how this HW should be managed.
> We decided to let the TDX module handle it and sort of hide it from the
> host kernel and only expose it as SEAMCALLs. It however impacted how the
> quoting SEAMCALLs look, so apologies for not calling out these factors.
>=20
> >=20
> > >=20
> > > > > so we want to do these operations one at a time. Having a mutex o=
n the
> > > > > host is the KISS way of accomplishing some level of fairness for =
DOS
> > > > > prevention.
> > >=20
> > > At the risk of unintentionally causing effecitvely DoS by introducing=
 a
> > > system-wide lock.
> >=20
> > The DoS that people are interested in trying to prevent is a TD getting=
 starved
> > of quotes forever. So the lock is supposed to give some eventual fairne=
ss.
> > Eventually the guest gets its quote even if it has to wait.
> >=20
> > If instead contention throws a BUSY code to the guest, the guest spins =
trying.
> > That wouldn't have the guarantees.
> >=20
> > So I think the two options are: have some lock in the TDX module, or ha=
ve a lock
> > of some sort in the host. I think actually a waiting lock in the TDX mo=
dule is
> > possible. But I think there are tradeoffs besides where the extra code =
is. If
> > it's in Linux we get a lot more control, lockdep, etc.
> >=20
> > BTW the "historical reasons" part I mentioned involves a past effort to=
 create
> > configurable host controlled policies around managing these resources. =
So part
> > of the simplification is doing a simple eventually fair global lock ins=
tead of
> > something more complicated.
>=20
> Yeah my bad for not including a lot more background. There were several
> design aspects that influenced this implementation. I'll do a better job
> of explaining them in the next version, but basically:
>=20
>   1. Performance requirements: For this first implementation, the
>      priority is to not starve a legit guest from getting a quote, even
>      when there's a malicious guest DoSing the host. A mutex is sort of
>      a "fair enough queue" for this problem. A guest's authenticity can
>      only be verified after the quote is generated.
>=20
>   2. HW limitation: The TDX module implements different attestation
>      schemes, some of which use the S3M during TDH.QUOTE.GET. This

What is "the S3M" though?  Is it a separate chip a la AMD's PSP/ASP?  Is it=
 a
per-package thing?  Per-core?  How is it accessed, and what are the "rules"=
 for
for those accesses?  What types of latencies are we looking at?  What else =
uses
the S3M?  Do we have to worry about contending with non-TDX usage?

>      limits the amount of concurrency this SEAMCALL supports and is also
>      part of why we chose a mutex for TDH.QUOTE.GET. (The shared buffer
>      in core TDX doesn't seem great, so I will improve it.)
>=20
>   3. Host policies: Preserving the GetQuote GHCI also allows the host to
>      participate in the quoting process, e.g. add host-controlled
>      policies or fetch host-side quote information. It's a bit similar
>      to SEV-SNP's KVM_EXIT_SNP_REQ_CERTS [1]. This series does not
>      implement host policies though.
>=20
>=20
> Ultimately, there are ways to push more of this into the module, and the
> current design is kind of a tradeoff between the complexities of the
> work needed in the guest, the host, and the TDX module. Like Rick said,
> there were past versions that required way more work in the host and the
> guest, such as managing the S3M, new GHCI calls, etc.
>=20
> [1] Commit fa9893fadbc2 ("KVM: Introduce KVM_EXIT_SNP_REQ_CERTS for SNP
> certificate-fetching"
>=20
> >=20
