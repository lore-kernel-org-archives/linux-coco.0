Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09D2631619B
	for <linux-coco@lists.linux.dev>; Wed, 15 Apr 2026 16:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776269190; cv=none; b=s+YCpfuXAHvk73C+c7UHs8A2z//NNzv+zEpx5mwW8NdAY5jtKOG9rs5LAtiaIixyiSNC+M5aQF4jmqmneND7gbKkWiFFE8ufagTV2PrNS5LNQwDIkj7UxF38hzmeHQKDkYsv1jGX+AmIUYiCUaBYjRg6Q9mFx0JUjPBonqTEQO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776269190; c=relaxed/simple;
	bh=c+vUhR84wyQmroZfkLS/ZE9Rw0VctJ6NGd2t6s2S3s0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=gUIQdjXpAOB7h/2ouYDR2R0OHrLTW63ovNYjJRJnfPoiAKyfIdbspR6QyWDkOyU55PhGVvfiM+hgXH08hHhslQk9PkAakiwCaH00sCtxYKpEw93w8qf/pVL29AW56mYkuTKz3oDi2CRdebZOgrnS2ca5jyhETkROZXdHy6l5L0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XZSTGeKc; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XZSTGeKc"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-82f0f2b2641so3733416b3a.3
        for <linux-coco@lists.linux.dev>; Wed, 15 Apr 2026 09:06:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776269188; x=1776873988; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=IuR9lRlSt5iAGE84WMtxFD/sgzSTZJ0bTIXfpvpZtaQ=;
        b=XZSTGeKcCcZB6Hhad4bpSrDlbkldQ74qvHkuEXgNdHDmr1m8ZFkmDIo4SMLHdv9JNX
         us00O9aEfYKwTvukR0zwPwKOoO+cU28EoxPSTCI37P1A0mQtOsaOqfg33W9YwJfhHhVf
         i3pUufQXE5cIa63EKvVPoOQd0ai/Z6METcD5yoIadep1IIGbKLcT7cSLKdRWPqXLed5w
         aDdgxSaOFkEEdBojDU5Gsh5k8Ia2CULAFzliR9xYVrJhcwPYGg822IGAajiaq1knwmwD
         vuaGIHDfND1JSsxvDyRfGvTL+q54CTm5FuRfVo1OJaa9rcOGJ5NOzvSpx65sPqone2ap
         Q1kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776269188; x=1776873988;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IuR9lRlSt5iAGE84WMtxFD/sgzSTZJ0bTIXfpvpZtaQ=;
        b=r96xdzF9t/bT1M++zHMq8zsKNO5aQpmC2yI5260wlMGj3851uOjSsGHhmGa4j8DVxA
         pC52xTgOCdxtEXQcis1MkQLmmxXv/HSJeFHbnQJH6oQ3LwBa878VvvWk1MpkH2K42FMC
         KBQ+UdfeL9J5Nl2LgVkoHpFQgdLQVR7AtfGfUWuph0mPHUrifq99Pzs9e6DuJgfrgkoK
         XUzkkT7oeX2rAzFXosWn8HYpu3VPMrnDPHwNYzJImmk0ogVJ6JogTsao9qKaOCkJEZFC
         HuFblIgERQPX+P74sLaj0i6sNhni7o7kjPcLcfQFHzVVcX5yewA3tpJQrbS1SSTa3ZNZ
         9qFQ==
X-Forwarded-Encrypted: i=1; AFNElJ/HSLmSQec5D8p2BFDl20eQDcUVQZ6IeDeUyW+NwFC0rLJPBJncql5MOpPgq/dAemTuUPfql9vfqKZv@lists.linux.dev
X-Gm-Message-State: AOJu0YyratCcB3j/XhcvN35lpp4paGUClfS/59qYFBUL0Vx5+H7LzomR
	t4oYrgyhyPMYdflOMokGv9/6Bo/OhAHVU1cafTKsqCBk3B4hJFtimeIUf3CWZzPsXP++/TLIYxc
	fN4OlGA==
X-Received: from pfez20.prod.google.com ([2002:aa7:8894:0:b0:829:7245:b797])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:302a:b0:82c:daa4:ce29
 with SMTP id d2e1a72fcca58-82f0c2d93admr22444836b3a.47.1776269188019; Wed, 15
 Apr 2026 09:06:28 -0700 (PDT)
Date: Wed, 15 Apr 2026 09:06:26 -0700
In-Reply-To: <b6bc6b99-c8d5-4c2d-9ca8-42d36d60d197@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260409224236.2021562-1-seanjc@google.com> <20260409224236.2021562-2-seanjc@google.com>
 <20b82b65-b156-4a2c-8094-b86dccfb3025@intel.com> <87e767b6-0324-44e6-92cb-f933002dec43@intel.com>
 <ad5fUya3W9BKO_iA@google.com> <b6bc6b99-c8d5-4c2d-9ca8-42d36d60d197@intel.com>
Message-ID: <ad-3gvGCamQK4YHX@google.com>
Subject: Re: [PATCH v2 1/6] KVM: x86: Add dedicated storage for guest RIP
From: Sean Christopherson <seanjc@google.com>
To: Xiaoyao Li <xiaoyao.li@intel.com>
Cc: "Chang S. Bae" <chang.seok.bae@intel.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Kiryl Shutsemau <kas@kernel.org>, kvm@vger.kernel.org, x86@kernel.org, 
	linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Wed, Apr 15, 2026, Xiaoyao Li wrote:
> On 4/14/2026 11:37 PM, Sean Christopherson wrote:
> > On Tue, Apr 14, 2026, Chang S. Bae wrote:
> > > On 4/14/2026 5:31 AM, Xiaoyao Li wrote:
> > > > Even leave RIP in regs[], what is the problem by just allocating the
> > > > index 16-31 to R16-R31 and making RIP the index 32?
> > > 
> > > But why?
> > > 
> > > Even though the array isn't explicitly labeled as GPRs, that's effectively
> > > how it's being used, and RIP isn't part of that set.
> > > 
> > > I don't think there is any benefit of leaving it in regs[].
> > 
> > +1.  Chang's earlier argument that RIP isn't a proper GPR swayed me over, e.g. RIP
> > doesn't have an architectural index.
> > 
> > Keeping RIP in regs[] saves one line of code in arch/x86/include/asm/kvm_host.h,
> > at the cost of making the code less readable (IMO) and incorrectly suggesting that
> > RIP can be accessed like other regs[].
> 
> I'm not trying to object this patch. Instead, I'm trying to understand the
> justification of the change.
> 
> So I would expected an updated changelog with above justifications
> incorporated.

Noted, I'll expand the changelog for the next version.
