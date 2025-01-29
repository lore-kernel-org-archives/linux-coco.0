Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAEA914BFA2
	for <linux-coco@lists.linux.dev>; Wed, 29 Jan 2025 14:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738159465; cv=none; b=OuOeoHzC2IBdaGQBwXA6rhsTvQ2XyIFJBCUTXspv/SXK4TK6Auhvbgkpe0eMgYdxGuWyKySC2TH/tMcWZFtFB2iWHOYgCjWIuF8BXiqfrOC8nRiVJxzZAqlXRWePTqb0yVYwByhFq2I7KQTn2Ve8M9I8opIjTdCqDoTC22YzeWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738159465; c=relaxed/simple;
	bh=YU7bfd+7Mm+ltOZR1NT3GVRcIx25zlwJnkjvC81qnK4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=aYtSuO9qGG4WpbdBKnIN7TwV60HrpZsZQJl7XWS+WyXoOaOYzohaxpXhF5UP00ba4wl2l0sJEYmnQVkUs23ZZuEJ8CpPeBGb7UooD3CNTD3bQyR011NzbQSWLSlp4yOE1oHLgQaY/Ov1GA6BpqATrszCybdW2yWcWC513BwgMd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lGeNZQDh; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lGeNZQDh"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-2efa74481fdso13851603a91.1
        for <linux-coco@lists.linux.dev>; Wed, 29 Jan 2025 06:04:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738159463; x=1738764263; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=HmizThZ7ZntTFDTnboC13YKTEAIgKuRy2dZoopEXIPY=;
        b=lGeNZQDhg9raCDY/Db29eHraW8pTeDTVKwnNxjyNBbOjA7OD7LmCZ5qHurSIvC59Vw
         KvPZuTPSjjigbUuykhGeLzeDKb3V/l9yrSieOo1smlIOhY/e+cHQOeYQ/aCwlLH2NRKF
         S8lMIFDY7L7he+wnSPx5kUoAiSZBDdSsDosw71h8HPbL/zWRBBNEOYb3K+PwRzutcbyn
         3je7DHWKHhmjNSZpj68Nr4tEGkqgODuVOo61XilQLwkTjhYO4nNpnxE9ybp+u1Tcnstw
         cEHZdgg6oS/xOSZl0tNSddutDO29SCv/lVSKqfzz1dYRQVPJTlN9Z1tAAMu/7EvuVpgE
         /sPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738159463; x=1738764263;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HmizThZ7ZntTFDTnboC13YKTEAIgKuRy2dZoopEXIPY=;
        b=v6TOzfV80I+U7njL2N7RmZxXwjTvVuQ/1zHX/xeyakHdGtUt3yKYr+f7z/q2oUouh1
         QzBNr5LwtIT4fsuk2l91LC1+DG6nHoSeYfjcoc+u3RZCrqFzCw3JynXCdOnm32r2JDwT
         62/1VOExh2EvBVw9cr+8XHncLbVs3JAAXfXegxbtEA6v29PSqWDPr3lkKdHsTxhfw7+w
         b/KNjF0SgewmkvQxiK1+NhpbW3n279GhbzR2luTAYOlMX3Cha8s7bwFwlmk2l1Odk7O/
         oMjia+yPAibFNivUuJQog0HdSFMPvi20SRJK9QEaP2pQ3PNbCKuUNGvETdVgzlJBXY43
         WQVg==
X-Forwarded-Encrypted: i=1; AJvYcCUuhn45pPg/c1kX3n3ISIN1bbRoD90gAA6hjvsiWLOlMzSzIY+NY1a+zpkSA+L5kkG6LEHdWHbzGDaJ@lists.linux.dev
X-Gm-Message-State: AOJu0Yw0vMa7RMr282YC8Xls1fzB98hE44ee5bIpxN14IespnR+SJ1Gx
	BtlNFTRjvFAfmZAA2rn4duocE0P4Q8t5jtzxaERNewbya5H5qgCaC8jbR+DZ+vS8G+YEC8F4iDV
	+JQ==
X-Google-Smtp-Source: AGHT+IFBLtvWujcRNtsEg/KB9XQieusBZcMY6dUIFyroY9OK7OVW2V1YrUbgozgKRiutxtgiJrOR3ShUrbQ=
X-Received: from pfbbe14.prod.google.com ([2002:a05:6a00:1f0e:b0:725:c7de:e052])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:b4b:b0:729:1b8f:9645
 with SMTP id d2e1a72fcca58-72fd0c7f7camr5108384b3a.24.1738159463117; Wed, 29
 Jan 2025 06:04:23 -0800 (PST)
Date: Wed, 29 Jan 2025 05:55:48 -0800
In-Reply-To: <slfw63tenzxur6fvfjf6ni3lp2exqcpzodgetx6p5eqchw66y3@oqjvn6ezgmod>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250128213652.1880545-1-vannapurve@google.com>
 <4e07bbe6-9f74-45e5-b8d4-f992d2be78fc@intel.com> <CAGtprH_1hc35um_47n=TMJzXAvpa7LY6kyXUafjJt3sPCosC_w@mail.gmail.com>
 <Z5l6L3Hen9_Y3SGC@google.com> <slfw63tenzxur6fvfjf6ni3lp2exqcpzodgetx6p5eqchw66y3@oqjvn6ezgmod>
Message-ID: <Z5ozZOplEQZLHb1g@google.com>
Subject: Re: [PATCH 1/1] x86/tdx: Route safe halt execution via tdx_safe_halt
From: Sean Christopherson <seanjc@google.com>
To: "Kirill A. Shutemov" <kirill@shutemov.name>
Cc: Vishal Annapurve <vannapurve@google.com>, Dave Hansen <dave.hansen@intel.com>, x86@kernel.org, 
	linux-kernel@vger.kernel.org, pbonzini@redhat.com, erdemaktas@google.com, 
	ackerleytng@google.com, jxgao@google.com, sagis@google.com, oupton@google.com, 
	pgonda@google.com, dave.hansen@linux.intel.com, linux-coco@lists.linux.dev, 
	chao.p.peng@linux.intel.com, isaku.yamahata@gmail.com
Content-Type: text/plain; charset="us-ascii"

On Wed, Jan 29, 2025, Kirill A. Shutemov wrote:
> On Tue, Jan 28, 2025 at 04:45:35PM -0800, Sean Christopherson wrote:
> > This incorrectly assumes the hypervisor is intercepting HLT.  If the VM is given
> > a slice of hardware, HLT-exiting may be disabled, in which case it's desirable
> > for the guest to natively execute HLT, as the latencies to get in and out of "HLT"
> > are lower, especially for TDX guests.  Such a VM would hopefully have MONITOR/MWAIT
> > available as well, but even if that were the case, the admin could select HLT for
> > idling.
> > 
> > Ugh, and I see that bfe6ed0c6727 ("x86/tdx: Add HLT support for TDX guests")
> > overrides default_idle().  The kernel really shouldn't do that, because odds are
> > decent that any TDX guest will have direct access to HLT.  The best approach I
> > can think of would be to patch x86_idle() to tdx_safe_halt() if and only if a HLT
> > #VE is taken.  The tricky part would be delaying the update until it's safe to do
> > so.
> 
> I am confused. HLT triggers #VE unconditionally in TDX guests. How would
> TDX guest have direct access to HLT?

Gah, you're not confused, I am.  I was thinking of the SEV-ES model where intercepts
are morphed to #VC.  

> Even if it would in the future, it is going to explicit opt-in from the
> guest and we can avoid setting x86_idle() for such cases.

Or explicitly enumeration from the TDX module.

> > As for taking a #VE, the exception itself is fine (assuming the kernel isn't off
> > the rails and using a trap gate :-D).  The issue is likely that RFLAGS.IF=1 on
> > the stack, and so the call to cond_local_irq_enable() enables IRQs before making
> > the hypercall.  E.g. no one has complained about #VC, because exc_vmm_communication()
> > doesn't enable IRQs.
> > 
> > Off the top of my head, I can't think of any flows that would do HLT with IRQs
> > fully enabled.  Even PV spinlocks use safe_halt(), e.g. in kvm_wait(), so I don't
> > think there's any value in trying to precisely identify that it's a safe HLT?
> 
> I can only think of "CPU is dead" use-case of HLT where interrupts are
> enabled. But I hate special-casing HLT in exc_virtualization_exception() :/

Ignore me, overriding at boot time is the way to go. 

> > E.g. this should fix the immediate problem, and then ideally someone would make
> > TDX guests play nice with native HLT.
> 
> I've asked (some time ago) TDX module folks to provide interruptibility
> state as part of the guest so we can handle STI shadow properly, not as a
> hack around HLT.
> 
> The immediate problem can be addressed by fixing the BIOS to not advertise
> C-states (if I read the situation right).

No, something like Vishal proposed is a better fix.  It's still desirable for the
vCPU to call out to the hypervisor when going idle, otherwise a vCPU that is idle
for an extended duration will never let the pCPU go idle.
