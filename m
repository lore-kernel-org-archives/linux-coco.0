Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2867A1A5B84
	for <linux-coco@lists.linux.dev>; Thu,  2 Apr 2026 23:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775171981; cv=none; b=i6ZSYz2k1/qUdBuZVv/2NqIOGQePUVhnwYySof2L69AiiowAagdVb0kFpgpZAM3nTnp2S+algRG+a2Xgi2ILVAJrLkM/BXCt8ymzG+gk+19mrasztzL+tU6lftcMh/TxpiN1W4Y2hZMAtgDscl/ZAK0kK5JwctrlG/Ex+l5BGwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775171981; c=relaxed/simple;
	bh=64WF9D/zEKwq1YYpyTovrgO/rjWkytAHL1xAfHFCask=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=UwlhWoV+eGPkaxC5+MFiGSZBTUiPmGDuEqA11pYzNUJL7WCYRCEGBkIYdFf7yLO4gJz1NL8baQH3pkVsK1wMdH4SIUpzadEx83IR6uHHz8EbX4I8sxZFmvv5SGrQQi28eiEtOcjCwnC1BPmAhnjW9/+JWwuVejmy6bP6A3naAcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Xm2jQhW/; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Xm2jQhW/"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-82ce0a9e558so950015b3a.1
        for <linux-coco@lists.linux.dev>; Thu, 02 Apr 2026 16:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775171979; x=1775776779; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=/t66izQLCHQ6s6AfRMkWgUrhQjqz/ggbzYq1LBRn2XE=;
        b=Xm2jQhW/WwFme0y1GdvXHVx/g5gpmQ9MI/X7JUYgV3Nk84utqSV1Cn76+fNSIP958v
         pzIJVh/csOPKudHSjg3TV0Pb94T4V4S4tXfYE2ZAY6G+5HuTqHwCiY0fyVgqAmrb0C88
         rtjn2pt/jEeuu8bJGgOrMLrRTcXcmz8yZLh93/2/CYosImCfGcfwdbqtKaS5AO/zmnkY
         Nd6aN6QDyScY71hKlQUaCGMBAXkUXsDAtqueAee6D8aMZ7vhklHKKYJYSytZHV3RGQfm
         vtCduN+edcVqxRi9OwGxhnrn3tShXw5gCVM17kxEv6fJfij8RAkptTb6smGZ5zVPssVY
         7+KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775171979; x=1775776779;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/t66izQLCHQ6s6AfRMkWgUrhQjqz/ggbzYq1LBRn2XE=;
        b=bFQGVd7QMys5k0z0cch1GRYrYCI+sjEnmaR9/1MRz0yKmrQIzgIrT20E7iBGMZwr3h
         HG5fviu6FZ+VYnzGYSdc7catUbqvdOedN7Mn4mBV0tyOZSSfxig5PM4szwHImsZ+Wk7T
         otE09uHx4cSDwOKOdd2hL4YxclOIeCj0tuG9JAuekiw3iFoJIjAUVyyOB0rHs32HuDnF
         bXB36Z8MXooS4Dwz5pdkGstwp6nw/Bia/d8x89GRkLBiTYyLENesI4MXRC6K3nk+0lUh
         8dGyZoKUrRaEwNjwJt/y8E021MrLMfmJYj4XJVDnDk8KbtThA7P0Jm90fFdxlrhbhVGB
         vWUw==
X-Forwarded-Encrypted: i=1; AJvYcCVx82e87QcdRCkvZkMRMSNkNARrvzI6GDLFCvS+bqvZU6kjM0CMPn9mTBgli07i6ufLoTUolLldaZno@lists.linux.dev
X-Gm-Message-State: AOJu0YwrqbLcw6lvMsAoqUvbLKJDnXN9+1hotXTfDWjBZpyZjRQgfcbw
	nxNjppY0knBO6V1kVBaKXJdJV5wMnBrY8CqJV3rvuZ+8ASfKeEBWxCPhyOYOufDAfsdJiHPXnzY
	suluEiw==
X-Received: from pfbih23.prod.google.com ([2002:a05:6a00:8c17:b0:82c:e9cd:a73f])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:3318:b0:829:9fa3:5c8b
 with SMTP id d2e1a72fcca58-82d0dbd53f8mr822637b3a.55.1775171979306; Thu, 02
 Apr 2026 16:19:39 -0700 (PDT)
Date: Thu, 2 Apr 2026 16:19:38 -0700
In-Reply-To: <7ec084f8-812e-42f2-8470-e416fa7ee848@redhat.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260311003346.2626238-1-seanjc@google.com> <7ec084f8-812e-42f2-8470-e416fa7ee848@redhat.com>
Message-ID: <ac75iuf9gHIhvm9u@google.com>
Subject: Re: [PATCH 0/7] KVM: x86: APX reg prep work
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Kiryl Shutsemau <kas@kernel.org>, kvm@vger.kernel.org, x86@kernel.org, 
	linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, 
	"Chang S . Bae" <chang.seok.bae@intel.com>
Content-Type: text/plain; charset="us-ascii"

On Wed, Mar 11, 2026, Paolo Bonzini wrote:
> On 3/11/26 01:33, Sean Christopherson wrote:
> > Clean up KVM's register tracking and storage in preparation for landing APX,
> > which expands the maximum number of GPRs from 16 to 32.
> > 
> > This is kinda sorta an RFC, as there are some very opinionated changes.  I.e.
> > if you dislike something, please speak up.
> > 
> > My thought is to treat R16-R31 as much like other GPRs as possible (though
> > maybe we don't need to expand regs[] as sketched out in the last patch?).
> 
> The cleanups in patches 1-4 are nice.
> 
> For APX specifically, in abstract it's nice to treat R16-R31 as much as
> possible as regular GPRs.  On the other hand, the extra 16 regs[] entries
> would be more or less unused, the ugly switch statements wouldn't go away.

Hmm, yeah, but only if XSAVE is the source of truth for guest R16-R31.

Do we know what the compiler and/or kernel rules for using R16-R31 will be?
E.g. if C code is allowed to use R16-R31 at will, then KVM will either need to
swap R16-R31 in assembly, or annotate a pile of functions as "no_egpr" or
whatever.
 
At that point, my vote would be to use regs[] to track R16-R31 for KVM's purposes.
IIUC, we could largely ignore XSAVE state at runtime and just ensure R16-R31 are
copied to/from userspace as needed, same as we do for PKRU.

If R16-R31 aren't generally available for C code, then how exactly is APX going
to be used?

Understanding the usage rules for R16-R31 seems fundamental to figuring what to
do in KVM...
