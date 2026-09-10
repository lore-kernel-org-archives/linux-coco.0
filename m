Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57F1736194B
	for <linux-coco@lists.linux.dev>; Thu, 10 Sep 2026 16:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789059359; cv=none; b=CpUlY/ZWAhmsteUIVFNcJFM+IB6nidKAugWCjbgo2nDjRvZKX3Lg7cupKtL5VRH9TpgEnyAA5+pCy+LqiH7sJVmw5TPJ8h/lUL0leXPejlw6ZcC92vygK9wtptk0mQfb+Azsjj6PNw50b+cKax3xMEDLd1dum2I+KlmQKY0T5dM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789059359; c=relaxed/simple;
	bh=3q7AREPOaZq8eHFLknAyC8rvdthg1/rx0t4Di3tOzXU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=bpC9w3aCcKB3wjt55y2NMsIQX0BblE9sPrche2jvlYOEQRApIADoQtyNlUGi/0EhG0Ff8kLCG+IKJ8xfANFPxPOcyIEoU5ZjPrKlhq7lNIMEP+zQf8fcam09cNxBexFTyEq4nvtgHRMj3W6D24aVzjsJDAbORnOSPqXYtYYkCjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YxCMtL3S; arc=none smtp.client-ip=209.85.210.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YxCMtL3S"
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-86a880e91f0so884797b3a.2
        for <linux-coco@lists.linux.dev>; Thu, 10 Sep 2026 09:55:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789059357; x=1789664157; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/J3Sv6JQvipgYTteUBVvbZbSYCIK0V8XgdKXZh7npQU=;
        b=YxCMtL3SsjTWWzPYG1EnB3Ir16VePcmAImp/Cz9tu/mkVQJZYgUxSjxuppl1pPogEB
         /lIKEoPmlZBpmz0DdRgTNZdqnd7ee7TL72l6jyMw6lOoTVWg2QS7Mlu0ypPWTb8SAGPd
         jA+OFsDGA93NA586Y167cJoN+va4hZMY6ft3mG0FHXgvk5ZoqEw6D8t4/wWup6J2bz5H
         RSnddwTPzCfCZnX6fVHEHok559tPB8EQrn6M9pGoANoTZgqs82xnKzTavHnrM1+90WII
         3QvVEKLLt02HBioqYiZ8rW+KqkNnoBjLJZg0yVG+8K/OSJcsDSxd40gSG3P1vp7NNYIe
         huqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789059357; x=1789664157;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/J3Sv6JQvipgYTteUBVvbZbSYCIK0V8XgdKXZh7npQU=;
        b=A2EScuATFb7P8M/o0DRw0eP/YMT6RQKiS2tqtgH42Ys38SXwRte077j+LXQLXYPgKb
         xQ7LfTVu0M/yh3ITfhRt44XE5G0UA2lg1jCdKDtLNy7BjgWLHxdx+jugh0HgWshrxL+3
         kts9cAcTVFkqShmnMDGiXO4e53e8pzUTYN1UJ62xFyYzc7sIudHj6EY/MdH+li9sGOC0
         QWrP6autA0IT4yB+ciLFz3kOe/brH6tHyoj4JGT2ObCqC6ckLp1eFwz94OPsBBDqQa8Z
         ledg50CKNP44Te5ExIwfWmoQA0y8QA3ryAkoy4Ix0tO+EexkmYXxgan7VOsNYxDGnVPY
         sx9Q==
X-Forwarded-Encrypted: i=1; AKwUvBxwjFHeKSnULAeK5m2Ux4WAO/Pa8IalwJ1Wots+lHF5tbNxyc2Jqlz98nxwVZErxNJG8Yuj+71ukokZ@lists.linux.dev
X-Gm-Message-State: AFuF++kQSz4VNP/nQr1qE9UpkNUzhvabW1GyPLwPhpMo/zHrUPAIPcud
	YRemW1cTGf2gh+8HFOS4ln+IWF582SkqtBRYP5+jJZ3WNkwOKJF/6kGLJXM3dpEH6r9D5KlfnPl
	0p3UVbQ==
X-Received: from pfbmu28.prod.google.com ([2002:a05:6a00:6e9c:b0:86a:873e:7d2])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:813:b0:857:726d:2e9c
 with SMTP id d2e1a72fcca58-86948a2d790mr8939284b3a.25.1789059356930; Thu, 10
 Sep 2026 09:55:56 -0700 (PDT)
Date: Thu, 10 Sep 2026 09:55:56 -0700
In-Reply-To: <20260910162343.4092060-1-elver@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260910162343.4092060-1-elver@google.com>
Message-ID: <aqLhHOrXsa30PBVU@google.com>
Subject: Re: [PATCH RFC 00/10] KVM: Enable Clang Context Analysis
From: Sean Christopherson <seanjc@google.com>
To: Marco Elver <elver@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, Kiryl Shutsemau <kas@kernel.org>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, David Hildenbrand <david@kernel.org>, kvm@vger.kernel.org, 
	linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Thu, Sep 10, 2026, Marco Elver wrote:
> Enable compiler-based static context analysis [1] for x86 KVM, along with
> prerequisite lock annotations in virt/kvm.
> 
> During the initial annotation pass, context analysis uncovered a missing
> SRCU read-side critical section in x86 PMU filter lookups; patch 1 fixes
> this bug.
> 
> The remainder of the series is strictly non-functional: it establishes
> basic function annotations, guarded_by annotations on core structs, and
> straightforward refactorings in hva/gfn range walks and guest_memfd to
> eliminate conditional locking patterns that cannot be tracked statically.
> 
> Annotating the MMU (mmu/mmu.c, mmu/tdp_mmu.c), i8259, and Xen requires
> more invasive changes and is deferred to follow-ups.
> 
> [1] https://docs.kernel.org/next/dev-tools/context-analysis.html

...

>  43 files changed, 745 insertions(+), 236 deletions(-)

For me, there needs to be a _lot_ more explanation of what this buys us to justify
the extra annotations and ongoing maintenance burden.  And to a lesser extent, why
we should rework code to play nice with context analysis (I assume we can simply
opt-out on a per-function basis if we don't want to play nice?).

I'd also like to see what the MMU changes look like before committing to supporting
this.
