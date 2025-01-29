Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F58E33FD
	for <linux-coco@lists.linux.dev>; Wed, 29 Jan 2025 14:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738159233; cv=none; b=l1CYO5l994mzYNp1F3fwn5jTl5cw5gmRnuUZQpaiIL1PVE2GXIRe33h7bnsHKaXPt1R8MdYxZ8pdCD8RWDSZ+5jWkQZ398m5HEatON4HG0iwL3erFG3gzUCjZ3z0ZY4AF677Vzf7Sw86DNHaMerM+1or9UFdgpvtHmTcZkjgB24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738159233; c=relaxed/simple;
	bh=SKjklppdrfM1nwM08QcRKNMYRZIF70k2hqxZXCQwwMc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=gJpBwktH1D59geAOQWKzDkyH2NVcCf/j6erJv4o+YQwp86FlGre1w2FlnX4eWBw65+wSFDkNQAZN+YBFNwfa6zxLd1Tdr+FpeLVSzonlI5xHttCsQkxVsqMOoiRh2fOx7aS5vQZ2OrNeicbo0l06zK/MDUWpm1IWgNfY7xQ+dk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=3PxN71Yo; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3PxN71Yo"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-2178115051dso126141675ad.1
        for <linux-coco@lists.linux.dev>; Wed, 29 Jan 2025 06:00:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738159231; x=1738764031; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=krsz5uamJHPlkL96BkWXF4wcHUyP/7a62Ubu2Um2mJA=;
        b=3PxN71Yo7IAFJsYdg/C1VGs86wiqdwZgVE3a2HWJS01krhCu8Kxe/pTrISILxzSKXs
         k9uKuAa+pj4YUXUFbqiyiE3TLzizPKQsNHg0ESxYO341bZxpi48QVweEUCbqR/sHj9IF
         uKgG0hLopyBAQuiuezpc8C1GwegRZsE5SzAn2zBhHd+mEQ9HgsviKNVl3PenuKYhvoN9
         EGaSzU/fYQMyOA6KaeWx23ZqbqQ//bPRyL20VMK2myDKJmEUkGmAE1LrvC6qJEPRu6Hj
         ntDEvI4sI72F+jtjJif2gT2Yi3ikYOTNBRtzk31jCsBdb4SHVdmOjSuhLEWkAD+meZiH
         25YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738159231; x=1738764031;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=krsz5uamJHPlkL96BkWXF4wcHUyP/7a62Ubu2Um2mJA=;
        b=tiPU/uSQCJGrdetbWPOt+svnDaZ0N+edBK69TE4hwg5h2tK2EIAv0wtJY2UvUoULCf
         a8xqa+d8ad6ainxzLu+TIOW5A+1LrNgz8YqFi6CucSBn7B9/aV10NBSxXAfQ4IXgdeDf
         5ecco0n8dqFfKqL77OxvzPH6D+sQ1QWcYmirt/Y0cfnTz7S1Ux+zAjw3dy+D7SbTCADk
         rW0IN+oJAzq/xOyWADSBaKF5OjXI1W3oghJIOcUA5g4j5eo2mr8UA1pzWlPZEiZaOFlf
         42PuZiIGkOQYFP30+MDAS1GrlSNzg5jtBRQDNfAmDQRWBv7KwhQbnUbuzAA4J8kCXnn5
         uhag==
X-Forwarded-Encrypted: i=1; AJvYcCW9FNFvLZl89xnqIjM6IzMaXEniU/D7jloqNrh3J+Uza0zB7jWLlJDDMYCXD7izSboq1Csf2WxBb8I7@lists.linux.dev
X-Gm-Message-State: AOJu0Yxd270+0dDVE6e/zUVqwfSullDDqDRseQ+SgKBMD18ch9xA53Hl
	DOieCju9gVU0QJoSqhg05x+u4/dOkAO2cYqQXR2peXFIHdP+ZPtC55I3ng9CkND6YZiNB3no9HB
	Ktw==
X-Google-Smtp-Source: AGHT+IGJGbnxYDrvq7lU6gxDpzVWUWkipP+X7KTUT39zO7f37Suuo9Q1GLH/gWE8bVUVLjPZahAd0oZNON0=
X-Received: from pfbcv5.prod.google.com ([2002:a05:6a00:44c5:b0:729:427:8d73])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:2c88:b0:725:ea30:ab15
 with SMTP id d2e1a72fcca58-72fd0bc25a9mr4342646b3a.1.1738159230959; Wed, 29
 Jan 2025 06:00:30 -0800 (PST)
Date: Wed, 29 Jan 2025 06:00:29 -0800
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
Message-ID: <Z5o0fZouJV2Fqe7b@google.com>
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

Or explicit enumeration from the TDX module.

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
