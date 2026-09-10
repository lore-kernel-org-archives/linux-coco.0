Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF93A568552
	for <linux-coco@lists.linux.dev>; Thu, 10 Sep 2026 19:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789067194; cv=pass; b=raqHhzKWnOx+j2v9tjiEC+JI/pNXwd/X06NUMLZdSqcXRsZtHQu2L/Vshtt1+93Uc5IzICfUv+tWYU5fq1AeCxZY0tjSriBPkohxL5zV1eL+kLNsjT1RctXU1bmucZgOl0M9zoM3PFQEM+Sw3Zixy2vvWmY3/57FY9RqvLWRBlc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789067194; c=relaxed/simple;
	bh=p7RzuJYGdHnY3mqs80U7yu9Qn6ww9UEb3p+WQH1n6P0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XDrPBpHQWtZa84LsYFhjsTcuivPKjRQe4daAOsvHyQKZNQxdxQJIvbi+ZORAXsYm7U4wNMBLv03YRbOId8NaqJvqooNsB3SbMerDqZppq1Z0gp8YvauVnciVLvt0Q20Vq6pLhYBWYY3IJxb+3IhWWq4Vws2EaFVWFFX61nMLgD4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rZw2tdKy; arc=pass smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rZw2tdKy"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-87ffa98d4a9so203557b3.3
        for <linux-coco@lists.linux.dev>; Thu, 10 Sep 2026 12:06:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789067192; cv=none;
        d=google.com; s=arc-20260327;
        b=OrOaI1Qrd8LXz8tPWuF3lgH5ZRcHrPZtjE7eUHtp0GRsa9OP3clDlWEdUyd7YpZfCZ
         QhG3WGcm/vq8N1AiDP0NpK19xAtru8JehIKsILKTB+r7174tLJTIV6Co0fucXWnRmzGV
         nhqNT6EAI/nUYPZIj3t3eOtcYv5sey1qq/gq6n+ckETIJZ87b7Gi/sNFNSJi9s7o0pa8
         9G+y0bXQv9j4oadfhEq5T3Dmbv9NW4h1D5xsq2fDkcFtjZ8Z3/JJj8rZMf2/YTYvjj8r
         GTjjawrelCPvwej1aYuMedIMZutl3wjGCYhGOlcI/Sxhssowy4XLzLzqsGHMmhMs12x7
         GGxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=hhbPkWTyvpq7C4VmKx5074Xp8YIC7XsOu3FWGtgnxq8=;
        fh=E9HyKHKcmdFBpF/r7EYS2bRmGrqiMQF0aFpIJhz/aGA=;
        b=dW3QZ90FFhP+vacmTyZDDfVfvV1uKIas/2IFlQpEdA3Bpo9bdCZm3aYfyYZMMYjYnB
         Gu0RbV9fi0bwMeIblCYRSu/2eTO7KBbGiJEcyIuTItY+Ua75U6uMa+7P+mfQvbpHEXPk
         TjdGqazYikh8cnRu924K7NAXVhWIOq8bPNCL/xPqLZQ6FvicDgnrRO/ypXJObKBjhLr+
         IZ6zEw2VMk/4p5hhHoYNJgI2a/yYYv49cbyKjs5bpIh+9OD6wh1vtKSzop8jE0BVlhD7
         bTvxQJmQ4bfpWCyjhXRRxBx6N+F0iMFXm+cz/dF0FDoOBUcxjdph4qF38I5dT80q9OEd
         S9mw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789067192; x=1789671992; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hhbPkWTyvpq7C4VmKx5074Xp8YIC7XsOu3FWGtgnxq8=;
        b=rZw2tdKyMqYbns9mFayDBUvcqPvLnvNJT1OsYOJ1DPqWkpevLHz4GgPALiyPoVfyun
         uSsWSx2NlAmqbpHPl2r/bzEzr6eAbM+p4BLFeAwhRjxNum+1Ud/PwZ/qpfReoXN7wjHP
         irf+nQwL9hAo987KjbZyzV+glQ7nnLbedkfXu3WYD+UbDi61ABcqPg/xJXHbKSdZjY7w
         SWeXDIUmVME//3x/hG6Y4P8RtHPgzRRP8XH12nom4bjf55XSo8MDJPVCNWQMHZ/z4xoU
         eJ0x/9idIcdEBA9YqwX7UcYMhBZ5c7I5FxMqa0VZQc2n9unf1fucce+yApVh8VL9IdZr
         EakQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789067192; x=1789671992;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hhbPkWTyvpq7C4VmKx5074Xp8YIC7XsOu3FWGtgnxq8=;
        b=QW75uY/EE67ofkflMQ6V7DPt4e2/d0WHlWvLVA9KCq3vl6nsYVya7ub6pj8DBvrsNl
         jBl/S9gpHNih+i1b1Z/kAOZDpWErgJlLcCcTf8lBMsL7zbeFfViy+6fPtrGJTcoO91RU
         b24XuK1cGsCUK2AYwz3NFBN7vJJ9sIepc5B4bVUrIj6TLKRld/yOdRNrKUs5EplGKkcs
         yhRoBRrMqOhQs/smrZs0204+KaO3TAoxT3/CU9UL+/Sii/zbLse8OwsxxnHQNGoj1jjB
         eTtPbFRrmLqDNa+GhqD7bfiwx9a0sl1axP3f0IHZ/vnf7Wc91cm/wOtGL3Q8VD8mSV5L
         riaA==
X-Forwarded-Encrypted: i=1; AKwUvBzG3JK9TX23Ybs0hZjsh76NVteKmpMHns8Gcj8V3dL5qR3r0q+aMq2fcR14XWrotAznuZm3i2i3iyWQ@lists.linux.dev
X-Gm-Message-State: AFuF++kS984pG8eBH7UZx/P9Iwslu4CadaQxrZwwuYcZVXujhp3VxfaC
	uPJeCbArteCW9S9kcUU3HFhQNagJVRHyujeswNAG1E4dAaz6YOlFxGluYUD7RMqniICBLGvMH5i
	LnSIgaiL5upxpi/PQjons8pXYLtEdbAUVN7NpvWFo
X-Gm-Gg: AYBFou1LZA5FLvqB2w8yzX++0fjUQAxeJwn7VFo38+3gtZtjheqG1Ga+39vkavB9xFh
	F8Jrir5bV7jWzRjR8Us+0gdO81V1nG6+IqyfsPvZqWDN0+nZbF/3lN+GnVWsXujA70FljFpZhl9
	pq9XxO9XXaotHGeca3wNcC2PnwxxC0xllGdS0uXGbP7Y5MdyG3F1wmTev6mhsEAmHamwWg/3Iiy
	XtxZsroJi+gouj7dCyWIzKewRfSAMNrI6/9wGsI47wXO+J/VZEe4OqHHV8pNKygojkUqhTzak6t
	W1hj2G89wDJLKx1dTRwkwFXzL499WwOFA9LZo98yymFOkoVoTDuz7i4+jiOzfKYXcnJY5NH7Nja
	4WlSRwo23Xg==
X-Received: by 2002:a05:690c:3347:b0:874:894:9a52 with SMTP id
 00721157ae682-884b5d8d588mr3519787b3.40.1789067191005; Thu, 10 Sep 2026
 12:06:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260910162343.4092060-1-elver@google.com> <20260910162343.4092060-3-elver@google.com>
 <aqLbHvD5lqQP8PRd@google.com> <CANpmjNOZPFQ9FcaA6+GH9PZ8DRyEMYW3+FKBO9B3d2CY+2C-5w@mail.gmail.com>
 <aqLuZ9gGzK07R_Ei@google.com>
In-Reply-To: <aqLuZ9gGzK07R_Ei@google.com>
From: Marco Elver <elver@google.com>
Date: Thu, 10 Sep 2026 21:05:52 +0200
X-Gm-Features: AcwNN1V0oYbeLDh86sT0uPw3XpZ9Y8gnfB3S8ZdXuCAMO68mt6oSE3z_9GgR0M4
Message-ID: <CANpmjNMn-i3ZgQgRC8JhhDt5-RFTXCsBrf47MzfXjKG8H1c2sA@mail.gmail.com>
Subject: Re: [PATCH RFC 02/10] KVM: Allow reading memslots while holding slots_arch_lock
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, Kiryl Shutsemau <kas@kernel.org>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, David Hildenbrand <david@kernel.org>, kvm@vger.kernel.org, 
	linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 10 Sept 2026 at 19:52, Sean Christopherson <seanjc@google.com> wrote:
> On Thu, Sep 10, 2026, Marco Elver wrote:
> > On Thu, 10 Sept 2026 at 18:30, Sean Christopherson <seanjc@google.com> wrote:
> > >
> > > On Thu, Sep 10, 2026, Marco Elver wrote:
> > > > kvm_swap_active_memslots() updates kvm->memslots[as_id] while holding both
> > > > kvm->slots_lock and kvm->slots_arch_lock. Holding either lock guarantees
> > > > that memslots cannot be concurrently modified.
> > >
> > > Sure, but that's irrelevant.  The goal of the srcu_dereference_check() is to
> > > ensure that readers see a stable view of the VM's overall memory, not simply that
> > > kvm->memslots can't be written.
> >
> > Functionally, this is irrelevant for readers. But under lockdep it
> > isn't for writers: srcu_dereference_check() (with lockdep) asserts
> > that the srcu reader-lock is held, or the condition 'c' holds, which
> > here is holding any of the writer locks.
>
> No, the rules for writing kvm->memslots is that *both* are held.

Right. But the condition 'c' is only the srcu-less fallback for reads,
which is "any".

> > > > Allow reading memslots in __kvm_memslots() when kvm->slots_arch_lock is
> > > > held.
> > >
> > > Why?
> >
> > Holding any of the writer locks guarantees no concurrent modification;
> > therefore, if any writer lock is held, it's not required that the srcu
> > reader-lock is held. There are few places where only either slots_lock
> > or slots_arch_lock is held, which is sufficient for reading.
>
> Yes, but with caveats.  And more importantly, pure readers really shouldn't be
> taking slots_arch_lock, because either it's overkill and will generate unnecessary
> lock content, or the alleged reader is doing more than just reading.

Pure readers never should, and not what this patch suggested. But
writers (or those about to become writers if they only hold one lock)
can read w/o the srcu reader-lock held.

> Holding just slots_arch_lock *could* be fine, depending on the usage, but those
> details matter, which is why I asked "why".  I want to know exactly why we should
> relax the locking rules.
>
> Ah, poking around the code, I suspect that the motivation is
> kvm_enable_external_write_tracking()?  Which grabs __kvm_memslots() but only
> holds slots_arch_lock, i.e. would get a lockdep splat if someone with KVMGT ran
> with lockdep enabled.

Right.

> That thing isn't a pure reader.  It only reads the actual kvm->memslots pointer,
> but it writes to each of the slots metadata.
>
> So, allowing __kvm_memslots() to be called with just slot_arch_lock is ok in
> this situation, and if my guess is right, necessary to fix a false positive.  But
> I'm on the fence as to whether or not we generally want to allow that, versus
> taking kvm->srcu in kvm_enable_external_write_tracking() even though strictly
> speaking it's unnecessary.

Clarification here would be good. In building up the locking
annotations, this was one inconsistency I found vs. what
srcu_dereference_check() said, so the conclusion was that the fallback
condition 'c' was outdated (or there was a bug).
