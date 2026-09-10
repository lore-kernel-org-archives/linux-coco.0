Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D234B5678FE
	for <linux-coco@lists.linux.dev>; Thu, 10 Sep 2026 17:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789062775; cv=none; b=Z+ITXQ6BwYuu/Z/jfQRfZrAP61+BnCCdoRhlDYu9GH+hDXhlYz8fi2BP+IIK/p3vH410eonPshFyMQylyooXeJMJ95/A46jSdb+0SFrusyy8u5BZ6nZetjBC95TITy1S4uzcFKzwYz5RYR+FkDzavzqGkKFnHD47naO9hgOm2H0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789062775; c=relaxed/simple;
	bh=F1AhUpdyLeWHtrKpd/UDZADKHVtrhEyMQ0u/xpc106U=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=MrdmxSv1j/PFuDnD/quYE0trbTG7ybwTmWw8g2XIluxny6ew/sMWw8etEWYvqZnCQOwfcel6nkqyOR2uKYD+9uo861QH/RUk786S/Iet0iCZLRWgbBm76hoe/T9CX3r+0LTJSNPp+qsuaz1li7ITi4nO6TF7BgLJbp+T1B7zu5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Cd+yC864; arc=none smtp.client-ip=209.85.215.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Cd+yC864"
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc1cade6b71so56954a12.0
        for <linux-coco@lists.linux.dev>; Thu, 10 Sep 2026 10:52:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789062760; x=1789667560; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KNwJScdUp/8QFucQGIGI1lh8CTxCfWXPp+xk+LwMhHk=;
        b=Cd+yC864ZrGIadp/QnDbaFDVMtM3P0+YVXWEpGqvEdydwOAdNvG+1BomZkJD7bhMax
         hjDgq/tCohuP/7OAwUdlBosXuUz6/rbeTBjOMfk0npDKPGH7QJJR7Gs01rwe+ExSTmDB
         ETzvMLdjCHQv/fyntuNa8sdkajwd+j4GfdX8Sa7N+F74/cOMFTsLBGkEkbel3hd32Okx
         Mz/BzXS/zhgzgNXU3w08syIIaYbRGNo1vxvW/DLy6IdIhFnt5TwCx24qP2/Nx3z4Izh6
         liWBi+5OuqrPTh8Co2kS0rrlQtM5uoXKxShBU7JjGsBgwyZIOceRxI9pQjnDpdRviV3Q
         Hhfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789062760; x=1789667560;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KNwJScdUp/8QFucQGIGI1lh8CTxCfWXPp+xk+LwMhHk=;
        b=TIpeVgI6598UIMc4uR156SrazHlmg/YNV6SIcuNVgENJ9dBgi3uIViDxcJTodC6R1W
         c6lFflwX8y7K218eaCBwmF8i6Hq7EV8z7pQDXfAwftddGzm+B320sfV8iIp0f9fU8Ul3
         1qbjf5C/uSmQusYPl/kftpi+Answ9bVlF9AItQyHDh6VUNfOtpFEB1O8+GOB4G5Qcan3
         PSMfsVkKQvx3h5iLJqLUCC5GLyMVCyqQAufMA8bnEu56B75QpbNn9rswPzhVTQgH60bq
         JqCXvUQjFb/5+7+45c/foeE5xUMaEDYtAjL0L3l/5T9Sj85L2m33LteATOLVPIg8TOag
         Tk7w==
X-Forwarded-Encrypted: i=1; AKwUvBygFcugS3MWCunWFKSIdqL/S0XCpwV9M1wt/ScnVgKOLgBXjNsgJuv0K9h2P6zjJJ77CIpaFa4K6FpX@lists.linux.dev
X-Gm-Message-State: AFuF++mttsFmS5agYI4WHeNvdL4D4u6Ism1hdIT5KYXU9h0f7TUTn5qK
	2UfN0jgdqGhN+pd426hryfseJCOq7FRzO2YP9J/WGPBjrf0RZcRGNzM+AA6xUX0emECxk1d6ZTZ
	ho7pREw==
X-Received: from pgbj13-n1.prod.google.com ([2002:a05:6a02:61cd:10b0:cbe:95c8:8245])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:748b:b0:3d3:ad6e:9cdf
 with SMTP id adf61e73a8af0-3daeafd8941mr565329637.13.1789062760098; Thu, 10
 Sep 2026 10:52:40 -0700 (PDT)
Date: Thu, 10 Sep 2026 10:52:39 -0700
In-Reply-To: <CANpmjNOZPFQ9FcaA6+GH9PZ8DRyEMYW3+FKBO9B3d2CY+2C-5w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260910162343.4092060-1-elver@google.com> <20260910162343.4092060-3-elver@google.com>
 <aqLbHvD5lqQP8PRd@google.com> <CANpmjNOZPFQ9FcaA6+GH9PZ8DRyEMYW3+FKBO9B3d2CY+2C-5w@mail.gmail.com>
Message-ID: <aqLuZ9gGzK07R_Ei@google.com>
Subject: Re: [PATCH RFC 02/10] KVM: Allow reading memslots while holding slots_arch_lock
From: Sean Christopherson <seanjc@google.com>
To: Marco Elver <elver@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, Kiryl Shutsemau <kas@kernel.org>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, David Hildenbrand <david@kernel.org>, kvm@vger.kernel.org, 
	linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Thu, Sep 10, 2026, Marco Elver wrote:
> On Thu, 10 Sept 2026 at 18:30, Sean Christopherson <seanjc@google.com> wrote:
> >
> > On Thu, Sep 10, 2026, Marco Elver wrote:
> > > kvm_swap_active_memslots() updates kvm->memslots[as_id] while holding both
> > > kvm->slots_lock and kvm->slots_arch_lock. Holding either lock guarantees
> > > that memslots cannot be concurrently modified.
> >
> > Sure, but that's irrelevant.  The goal of the srcu_dereference_check() is to
> > ensure that readers see a stable view of the VM's overall memory, not simply that
> > kvm->memslots can't be written.
> 
> Functionally, this is irrelevant for readers. But under lockdep it
> isn't for writers: srcu_dereference_check() (with lockdep) asserts
> that the srcu reader-lock is held, or the condition 'c' holds, which
> here is holding any of the writer locks.

No, the rules for writing kvm->memslots is that *both* are held.

> > > Allow reading memslots in __kvm_memslots() when kvm->slots_arch_lock is
> > > held.
> >
> > Why?
> 
> Holding any of the writer locks guarantees no concurrent modification;
> therefore, if any writer lock is held, it's not required that the srcu
> reader-lock is held. There are few places where only either slots_lock
> or slots_arch_lock is held, which is sufficient for reading.

Yes, but with caveats.  And more importantly, pure readers really shouldn't be
taking slots_arch_lock, because either it's overkill and will generate unnecessary
lock content, or the alleged reader is doing more than just reading.

Holding just slots_arch_lock *could* be fine, depending on the usage, but those
details matter, which is why I asked "why".  I want to know exactly why we should
relax the locking rules.

Ah, poking around the code, I suspect that the motivation is
kvm_enable_external_write_tracking()?  Which grabs __kvm_memslots() but only
holds slots_arch_lock, i.e. would get a lockdep splat if someone with KVMGT ran
with lockdep enabled.

That thing isn't a pure reader.  It only reads the actual kvm->memslots pointer,
but it writes to each of the slots metadata.

So, allowing __kvm_memslots() to be called with just slot_arch_lock is ok in
this situation, and if my guess is right, necessary to fix a false positive.  But
I'm on the fence as to whether or not we generally want to allow that, versus
taking kvm->srcu in kvm_enable_external_write_tracking() even though strictly
speaking it's unnecessary.
