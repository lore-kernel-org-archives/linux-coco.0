Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AA1738F65F
	for <linux-coco@lists.linux.dev>; Wed, 27 May 2026 22:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779919720; cv=none; b=bOs2Swyit/hk5k/6I47CHqsdP2PlEan5NxxolT32zjICJNQrZbnOm9EamiNmkhJgh6+tLU+p3Xg30mkewW4QlPt+qBaDiSfIiPGimRhtsS2aXDolHPHUWLJAiBJEK+q9fGXweFXK2f1yAGoAZBaunmE6yktkCXbB1H6siPiXpds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779919720; c=relaxed/simple;
	bh=i7wbfpftAHOze6/LqECcmjGsJrtyORuEDEH2Qu6CHmU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=EN64Ml8V//MFh5O3AVWlH2EHYP++TXl9zgtEuie8mXXsOcLMS10oRYssZghEYvopm1feIoob0+YxuACGj4cTdNnwrxcStxFNWizn7VIgx+mXmdd/lJXcLTxjp2X5aC8JUi7DWWAf/0iU3PHGQqId2oPQzWKB7ahNKATDBIpDMbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rpV55pXn; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rpV55pXn"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-3662668b825so5863702a91.3
        for <linux-coco@lists.linux.dev>; Wed, 27 May 2026 15:08:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779919718; x=1780524518; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=iIKX16irW4EH5cTo/fgiXG4rRWB7A4t/PlB8ZgkXoDs=;
        b=rpV55pXnWzDqjChWoc8JBSrJoIjLjdGs/FMZHiq5hkKKnQPe3TG+YywzlTGR8LcIT/
         4f5yZwiMqsReHtNG7XMT81uwHQtETto/hdRLBmYeNqzcqSbnz1jQvwPIdZB5SvN9eTS7
         Pzmt+cLhwYUjbja33BMYO3c38+Al91gyuD3y6h1cXn0yL6n6LAPVgX9vCv0k/vny6OK7
         PRQ+KMJbctSLh24rkP34cfRxwsdzkw1KT6SP9mTOipFMLFNNTwu0cTHYpm4RvTDvrwmL
         SzugTmIeOXp3zoVdVI9/7ST9y9hhsQ0xnZQH8/15BUu9nBUyxlORQyFcsvSPasZZCYh8
         aAFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779919718; x=1780524518;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iIKX16irW4EH5cTo/fgiXG4rRWB7A4t/PlB8ZgkXoDs=;
        b=FQwsP+H1GrfEk3l79b6EQtwo7O6zxRIvpjFRr+MrA0W17egYW0HrkfdsMC2a+VzUVQ
         41yEUYno2rq3y72nq9KnN48Lnd6TdIEfWFHSWGRq2mqg021y+OedXmEooM3Bm4pEEpAR
         pYppylppKv8umlF3wy6xsLxU/Dwg5pFpki/pykqHUYDQewOH3VDjBxvtsFGSOXb/i4TL
         gWBV2/2/2c6gQfKINj0gKI/wnfwl5BqbLmZ2+Dy7m7UgDHc0zqOrJwBcl343F+PvZpnD
         XcXcHSwIcAC9v/mbKMGecLYV07mTkqv9gVrJrBGhf5PoHlpWioAXiNQ5dSy+pXFenrZE
         2ipg==
X-Forwarded-Encrypted: i=1; AFNElJ8JDvnjA+KosddBWebOWGhkP+UaXOu8+xrymUHH70FKQDYTmDrUGNikT+F6N6V9uYVJm51stkZs/2mo@lists.linux.dev
X-Gm-Message-State: AOJu0Yxa982K/jrftP8RFapS18gg0yBuDDyYlOSJBcYUEnxk3cY7KYUA
	B38nPqwsUZz8c4sTMRhH9n3hdqKZLbJLRhr1NPFeuF5Nwfl2SEUeX255bA4Snhr46GRRpQX9r8U
	sAjlpfQ==
X-Received: from pgfu7.prod.google.com ([2002:a65:6707:0:b0:c79:7991:6d2f])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:e545:b0:3b2:a8cd:ef4b
 with SMTP id adf61e73a8af0-3b328e5ae80mr24472025637.25.1779919718163; Wed, 27
 May 2026 15:08:38 -0700 (PDT)
Date: Wed, 27 May 2026 15:08:37 -0700
In-Reply-To: <CAEvNRgEW8nph=Hz-3pcQD7ZxRuAOcjcOfj8afgJMsRgESD-Wbw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260522-fix-sev-gmem-post-populate-v2-0-3f196bfad5a1@google.com>
 <20260522-fix-sev-gmem-post-populate-v2-2-3f196bfad5a1@google.com>
 <ahXB_tBWakUUjt6q@google.com> <CAEvNRgEN6syKVLjvFX-s=xU=r3CBZ3KtmeKvVYOC09uvFGXSFg@mail.gmail.com>
 <ahdFSxXnWhhsjhKe@google.com> <CAEvNRgEW8nph=Hz-3pcQD7ZxRuAOcjcOfj8afgJMsRgESD-Wbw@mail.gmail.com>
Message-ID: <ahdrZZxE4O0jqmpB@google.com>
Subject: Re: [PATCH v2 2/5] KVM: guest_memfd: Fix possible signed integer overflow
From: Sean Christopherson <seanjc@google.com>
To: Ackerley Tng <ackerleytng@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Kiryl Shutsemau <kas@kernel.org>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Vishal Annapurve <vannapurve@google.com>, 
	Yan Zhao <yan.y.zhao@intel.com>, Michael Roth <michael.roth@amd.com>, 
	Isaku Yamahata <isaku.yamahata@intel.com>, Chao Peng <chao.p.peng@linux.intel.com>, 
	Xiaoyao Li <xiaoyao.li@intel.com>, Zongyao Chen <ZongYao.Chen@linux.alibaba.com>, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev, 
	Yu Zhang <yu.c.zhang@linux.intel.com>, Fuad Tabba <tabba@google.com>
Content-Type: text/plain; charset="us-ascii"

On Wed, May 27, 2026, Ackerley Tng wrote:
> Sean Christopherson <seanjc@google.com> writes:
> > I like pgoff_t more than size_t because, for KVM, it's really all about addressing
> > memory, thanks to the offset into guest_memfd being associated 1:1 with a GPA.
> 
> The offset into guest_memfd is associated 1:1 with a GPA, and this
> offset is
> 
>     offset = index << PAGE_SHIFT
> 
> > It's not perfect, because GPAs are tracked as 64-bit values, whereas the kernel
> > restricts itself to "unsigned long".  But that's a non-issue in practice since
> > guest_memfd is 64-bit only.
> >
> > But conceptually, I like tracking the gmem offset as a pgoff_t to tie it back
> > to using GPAs to offset/index into gmem.  And for all intents and purposes, gmem
> > is nothing more than a glorified pagecache :-)
> 
> So we actually want to use u64s for gmem offsets (where offset = index
> << PAGE_SHIFT), 

Hrm, poking around, I guess what we really should use for the byte offset is
uoff_t.  My only hesitation to using uoff_t was that it's hardly used anywhere,
but it does seem to fix exactly what we're trying to do.

I don't want to use a raw u64, because I dislike using u{8,16,32,64} (in KVM)
unless something absolutely _must_ be that size (and ideally _exactly_ that size).
Limiting use of raw uNN helps identify fields/variables that correspond to some
hardware asset, versus fields/variables that just need to be "big enough".  It's
not a 100% comprehensive rule of anything, e.g. there are still many "naturally
sized" hardware assets that need to be tracked with "unsigned long", but I still
find it helpful/valuable to highlight hardware-derived fields/variables.

> and pgoff_t for indices, since indices (aka page
> offsets) are semantically the offset, counted in units of pages?

Yeah, I agree the distinction will help us differentiate between byte offsets
and pfn offsets, especially with another compile-time assert to show the
relationship:

	BUILD_BUG_ON(sizeof(gpa_t) != sizeof(offset));
	BUILD_BUG_ON(sizeof(gfn_t) != sizeof(slot->gmem.pgoff));

> I pulled this conclusion together from filemap-related code like
> filemap_add_folio() takes a pgoff_t index, so I thought gmem should
> follow that and stick with pgoff_t for index/indices.
