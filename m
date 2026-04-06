Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAF6531985C
	for <linux-coco@lists.linux.dev>; Mon,  6 Apr 2026 15:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775490057; cv=none; b=nnadJMQqJfzlQAcFVeErKwXAjbejUzSxZdO6rVRHRX+mB3tUQ/ZsooA/uYFCsdTtvNz9gUHdS+bOoAEWFyMDUIcNkWmlnihaiZIJZ6m8HDlcFsigv98tEvP5hlKEYzaVTfCf/JW2Rw6OVLjRogabx13RKh1QHvV31w8VELpN0DE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775490057; c=relaxed/simple;
	bh=GeL5TklS9/MJdTTnMy6rhg+Erv9B1Kj4QIkaGUhKAHQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=owls7ApGS9cOnj/xeHLGVifUaij3NfxS3VYRezJY171kZE0vI9VDzNWfmoT3GjmScApB9YkslOB841rrs49w809waxQTU6ufhj/rpcV1Wa+NgcdSVt17EOuqHRpyPaL1H7D18Oe/+IawYtsejnj7OIDQBR1jOuFI0akuLl8dM4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GzOIM9sc; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GzOIM9sc"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-82cd9fa609aso2501178b3a.3
        for <linux-coco@lists.linux.dev>; Mon, 06 Apr 2026 08:40:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775490056; x=1776094856; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=U3Kk35EVNlkIAvGN2qGdLIz8gWMcjgIydFJ5LWEu5vc=;
        b=GzOIM9sc27zS939wfERfqqAa0aXRpJB9mf0jrR0kxLzJddb3Pj+ewwcaKXWSxid4Gk
         WuN3xy8jiKHqZqWemrMe9HXKHODkViyQrFRH+mVVipnSiDS2Z8MsiV4ujnXnlf+j2miH
         mp4uixCwGmlu28/ve1z8gVuHm4cfSJcogrO+HjbP8A19yCFen8ECyCpo+1q/CG1e/QZA
         6FoAAYIiQXFMqQ8yf9qlEAJ5+jFaAxi//QxXVaGzSFMsC5d6ILyK1u/OOq1uE254PyHI
         lOm14PG9iCKstVVOGe6VBSVVjIPc0ewpUZh1aTRCWYoaUSBj7pUPNQPaIdqUYjRSlEtA
         paOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775490056; x=1776094856;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U3Kk35EVNlkIAvGN2qGdLIz8gWMcjgIydFJ5LWEu5vc=;
        b=eqg4r7Qb8sUG0K6+dev3DB4jYxar6AJxQd0eA1BRgAn1WV+ms0ByAHKcP1Dwdok1YC
         +FLunSQmwIZSj986RTMuxyQm0UEzYnnmxtR+gJk9xBho0zqCvW1/lxa15XgZJzgoJfjY
         ftPJveZ9squpBWsQ6HvDBH8pobC88pqwuTr/IICvNGXlMIHb6zzovmqYFLIdAb1ssnUz
         FQwrns0SPljErdvKSvm9dAcebkM+X0fZjHmulh5wPrCD7P3ZCLwQuP5R5UkSzU/98nM9
         4GaqfWTbwYnaBhHBfjfsrr7h8OuhZP+a+0/P4KbvAiJfFmHdxTSBp0+TJW/b47QR+R2E
         JZGQ==
X-Forwarded-Encrypted: i=1; AJvYcCVuA0pfJO/dy/Tk9k1fPQLMlKyGAfq72ynEg7L8B+gqnX4otgiXeA8zx5asUDAvUqIg4yvnMveCNepc@lists.linux.dev
X-Gm-Message-State: AOJu0YzHwaOCA+aMTOJw3fUsc5bqPgfHzvX6YTSVkvLHIkZ5wLQmOKiP
	HNJ1quXAH8NMKAzwOU+B1rvWFrAuzzgOyEPlEGZtWjxMm+QHtA6TuXnK9Ve2LEWUQE4H7gwqnDV
	kje+LHQ==
X-Received: from pfblr14.prod.google.com ([2002:a05:6a00:738e:b0:82a:69ed:da7f])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:f89:b0:82c:9c5a:4c32
 with SMTP id d2e1a72fcca58-82d0da45875mr11660901b3a.6.1775490055769; Mon, 06
 Apr 2026 08:40:55 -0700 (PDT)
Date: Mon, 6 Apr 2026 08:40:54 -0700
In-Reply-To: <fb9e61cc-20df-47cd-b324-1dd8d5985372@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260311003346.2626238-1-seanjc@google.com> <7ec084f8-812e-42f2-8470-e416fa7ee848@redhat.com>
 <ac75iuf9gHIhvm9u@google.com> <fb9e61cc-20df-47cd-b324-1dd8d5985372@intel.com>
Message-ID: <adPUBrHO9gdGG4k3@google.com>
Subject: Re: [PATCH 0/7] KVM: x86: APX reg prep work
From: Sean Christopherson <seanjc@google.com>
To: Dave Hansen <dave.hansen@intel.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Kiryl Shutsemau <kas@kernel.org>, kvm@vger.kernel.org, 
	x86@kernel.org, linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, 
	"Chang S . Bae" <chang.seok.bae@intel.com>
Content-Type: text/plain; charset="us-ascii"

On Fri, Apr 03, 2026, Dave Hansen wrote:
> On 4/2/26 16:19, Sean Christopherson wrote:
> > Do we know what the compiler and/or kernel rules for using R16-R31 will be?
> > E.g. if C code is allowed to use R16-R31 at will, then KVM will either need to
> > swap R16-R31 in assembly, or annotate a pile of functions as "no_egpr" or
> > whatever.
> 
> My _assumption_ is that the speedup from using the new GPRs as GPRs in
> the kernel is going to be enough for us to support it. This is even
> though those kernel binaries won't run on old hardware.
> 
> If I'm right, then we're going to have to handle the new GPRs just like
> the existing ones and save them on kernel entry before we hit C code.

Ooof, one nasty wrinkle to prepare for is an NMI that arrives after VM-Exit on
Intel CPUs.  Unless Intel extends VMX to context switch XCR0 at VM-Entry/VM-Exit,
and/or provides GIF-like functionality (which would be awesome!), it will be
possible for an NMI to be taken with the guest's XCR0 loaded, i.e. with XCR0.APX=0
even when APX is fully enabled in the host.

> I'm not sure I want to be messing with XSAVE there. XSAVE requires
> munging a header which means even if we used XSAVE we'd need to XSAVE
> and then copy things over to pt_regs (assuming we continue using pt_regs).
> 
> That doesn't seem like loads of fun because we'll also need to copy out
> to the XSAVE UABI spots, like PKRU times 32.
