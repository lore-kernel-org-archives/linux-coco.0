Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 354D04562B0
	for <linux-coco@lists.linux.dev>; Thu, 10 Sep 2026 19:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789068026; cv=pass; b=AyGC3eDCX4rhkyBe/VlONikJGXuge4vkyUIxQCggkDUEH3t/8yGq8bn+oYoS7YnAn8X/h1rWZqvSNBkLM0Mvi4tGbI9EBcX+dGwIXRLYucOFOkQ/WlB51klHwaVvYQheDXFmyLo/ivtwTrOE5fTuz7BWV1GJ0y5EMLhdILpDKD8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789068026; c=relaxed/simple;
	bh=fiGuXF8pnYZgt9VLhaHvZD8ERe5p+iX/cvkRE6nZgx0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HtZ12fWQCNiaRUCKwfkMdFmOG3cEANrqVTbRC4GayMFr9wzXNH4UrIPlbeOqKEGK1xuaarSsABmq5QhZJWaDaUjmzVECP8ub+UFdyf0oGtdDbVySfLhVSExZAahBqaiLrDbEwW3PjwZMBRIJw7T4STpJ+0RRoTn2OsFmXYyqtF8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Rexn4DnL; arc=pass smtp.client-ip=74.125.224.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Rexn4DnL"
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-67124ad7615so67048d50.0
        for <linux-coco@lists.linux.dev>; Thu, 10 Sep 2026 12:20:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789068024; cv=none;
        d=google.com; s=arc-20260327;
        b=o478QkdEZBiZ2FVG6g2sfYkqLyD6ge50Vi+iigvn3NthiyVHh3rCeTYDYxCPs6Tpw0
         70XtRLQD+erXME6vYQVOjaURhXv4pd5R3rQ8a8XdRNzFAMUv3PRJ0ZlyTbwws/3q2LR9
         hjUiIogOOXS9Xd3KNdSjyty2iEwZUO+FRdWTKZh7AtLk+wvtUf1sexqIh6XFzF/0U7PC
         hidQfJPpm8upNVEqBQ6+Icf1zjxs8tNA/5JNYKj7SubUVM2jkoP77RKUB1GcChBPqmWL
         McdMxmM6IbkxUzKpxBHp8HHW4kKAh1FMSvIrjM6wSrEJjh9Onty3Pt736k5hcxFub9kr
         R5GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=b6AZ6dwl+nPhR9lRn8ryaNJ3HAjOQF7wNnV4eGAN9b4=;
        fh=a77WNBuolaW/GFRctDJisNxBYAL8mwoAtti2Xqr1naY=;
        b=actm/q4e6t0LeK311QCah4xyOjjOme3qxIkfMvL8jPIif2bLtQNUa2azFKILLbEE2u
         fSqLaEQ5H+wkqsr8StEpTVOBHqn3eecVzAH7sTVqUy2UCWvicoXlExhnyvoTWWeyeLrB
         REQY2f1BJ2pXa4wJL6MEQjHvy2LFYQEhLeKcBw6BUddpzkv/1d866CWBHpnjUqeOTrMX
         LKuIEsqbTOFL/0boY3pWNF3nfmhK5GuynPdDyDGcGVR5m0pRsNgSsXXPtDO3t6wBQm3r
         8/63vy29f3eBuB+wBL/YjJaSHG+bXbnsD9ls/mqq4ucFzKQm5uejiltqs2fNyU/FURHA
         f4+A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789068024; x=1789672824; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b6AZ6dwl+nPhR9lRn8ryaNJ3HAjOQF7wNnV4eGAN9b4=;
        b=Rexn4DnLn4o9a3Rd+9ZhbUtHYy/SSVOl2VnyYy9UY6q6jZKYiTwUIDG6IjvAagfFkP
         41TpfZQN5sItQp6GVW+IUfa1FDJTyoQKbxihBaMXhnzl/ZXToUXeS4MZachG+UNlM6Jo
         Lrb0GJckRhWiEbDHwP77F6nWuBaunM+1H+hnXExV5LYvYqqVAwUdfkEQ68WFaEoROe4u
         07Yt5hv0c+CY8fRDlKzc7C/U3eT+7pMS3bnZ3TCd9dFV73HrF3oHSJZckPV+qJXJXBi7
         /CaoNIjogGEvcBznzMYFDQmH7bx+/ZRu1/YfgNwclCSFnFBi/rQ0U2Bo5+Mq8zmDniYo
         2Liw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789068024; x=1789672824;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=b6AZ6dwl+nPhR9lRn8ryaNJ3HAjOQF7wNnV4eGAN9b4=;
        b=j4pKzqfnNU3GY3qPouPxcBjws2rZ6CFj6I0akmMkp6Nq3x9674BfHJlr24WMlCqOvw
         5teGq70utLU7tzqusan+QjXz26ZaqtUhpuJQbdPUan16+A1rUzg++L8q4iM/OrXXOZ9K
         hZ7Och0s8yM/NEmKAgfyZL3EvXqQ0MLOriKc7J19yHDhq0ITnnZo+bOkig6O6ggxhPcr
         tfa139rPYCmokKsDFOvfDbjh2QgYxSgJFy0cClHY9+ukovFf0ySiiZRmQB/8UPM1tgoR
         eAW4BfmvR3uVGpokopfBZT4aoRUWJQk+66jlck/OP526RguWBZBrQKCdsb2nNpQQQMQo
         ObCA==
X-Forwarded-Encrypted: i=1; AKwUvBxphmkJQDOUiM7oxGnYhhHABzKbz60v1VJfxfoqcBk6u+GKMhNO+v4QMyeln2oUKOnvy+U3ag4ycM/O@lists.linux.dev
X-Gm-Message-State: AFuF++mIPgesuC2RwxEwu0iGESeISbHIj78cibzu94vPV5HHLqNd6qE6
	fcqO8Vr7OyrRBQjQ3XxyjbkvhTsm1LYVTgjj81b4+pIYRQ96g2OpfTl0BPZh0dnpS7lOIZECzWw
	XL6lBdGE0JAHCghTuzYa4fkbDXclV4L40iV9t81jB
X-Gm-Gg: AYBFou2pcyJF0O/iY6NMg6arCBuiY4Z6WOskqqP3OpB/1RoiksVhPY7n11tXWwoBpAs
	g0mw22oUlY+nuEooqOyPJtSp388CFGNgAkf1elx8TCmcuR/Xwb9NOEhMIqaf1PkpD/pftczNzpI
	PLEVAsM4D9KaLHislcroxjqFvg7rDEl24yglySqOIFqypkNeNsvcLKCxouAdnfspVwqMbiQHoi7
	/6AkBHLrkNdKb6o0VFXOVmAJD+cqPV5naIaCUMVd4Fpwq/mUuvJT66uU69HzYJsYZQz7YgLjWUq
	Vat9hQUt69zh/LC/di8OWHusE0dZJt0/wNkL73hz0vmbwE1891bF8PJqy3/equRK8WxrtPAAi0F
	uXYCaTLEsmdw=
X-Received: by 2002:a05:690e:80b:10b0:66f:c1bc:c097 with SMTP id
 956f58d0204a3-6712476c288mr382065d50.95.1789068023584; Thu, 10 Sep 2026
 12:20:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260910162343.4092060-1-elver@google.com> <aqLhHOrXsa30PBVU@google.com>
In-Reply-To: <aqLhHOrXsa30PBVU@google.com>
From: Marco Elver <elver@google.com>
Date: Thu, 10 Sep 2026 21:19:46 +0200
X-Gm-Features: AcwNN1XEJG4HFWxM40HlnJmqF0_xrl9dxVW2S0hyaOIau8OztfJYTNDdG5jUhc0
Message-ID: <CANpmjNNF44Y_k-Jbx6TikXgTnhE3G_aRDFXAABosZexOkn0jeg@mail.gmail.com>
Subject: Re: [PATCH RFC 00/10] KVM: Enable Clang Context Analysis
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, Kiryl Shutsemau <kas@kernel.org>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, David Hildenbrand <david@kernel.org>, kvm@vger.kernel.org, 
	linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 10 Sept 2026 at 18:55, Sean Christopherson <seanjc@google.com> wrote:
> On Thu, Sep 10, 2026, Marco Elver wrote:
> > Enable compiler-based static context analysis [1] for x86 KVM, along with
> > prerequisite lock annotations in virt/kvm.
> >
> > During the initial annotation pass, context analysis uncovered a missing
> > SRCU read-side critical section in x86 PMU filter lookups; patch 1 fixes
> > this bug.
> >
> > The remainder of the series is strictly non-functional: it establishes
> > basic function annotations, guarded_by annotations on core structs, and
> > straightforward refactorings in hva/gfn range walks and guest_memfd to
> > eliminate conditional locking patterns that cannot be tracked statically.
> >
> > Annotating the MMU (mmu/mmu.c, mmu/tdp_mmu.c), i8259, and Xen requires
> > more invasive changes and is deferred to follow-ups.
> >
> > [1] https://docs.kernel.org/next/dev-tools/context-analysis.html
>
> ...
>
> >  43 files changed, 745 insertions(+), 236 deletions(-)
>
> For me, there needs to be a _lot_ more explanation of what this buys us to justify
> the extra annotations and ongoing maintenance burden.  And to a lesser extent, why
> we should rework code to play nice with context analysis

Patch 1 is an example of what this buys: static checking shifts left
and prevents bugs from actually being committed. Context analysis can
be seen as an extension of kernel C, improving its safety, and the
nice thing is it can be enabled incrementally (no rewrites in other
languages needed, though yielding modest safety gains at a fraction of
the cost). A side-effect is compiler-checked documentation
(annotations), which helps humans and robots reading & writing kernel
code.

The question is simple: is the cost of ongoing maintenance with
context analysis greater than the cost of the bugs it prevents?

> (I assume we can simply
> opt-out on a per-function basis if we don't want to play nice?).

Yes with __context_unsafe(/* explanation */) attribute, or
context_unsafe(...) expressions.

> I'd also like to see what the MMU changes look like before committing to supporting
> this.

If you're not entirely opposed, a v2 can include that.
