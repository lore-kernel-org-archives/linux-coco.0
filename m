Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C912046EC73
	for <linux-coco@lists.linux.dev>; Thu, 24 Sep 2026 16:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790265798; cv=none; b=opg7fsR73VJguoxkaTuCQxhiQjKJgG36K9wtN+CBTnM2sQ3waAhhCNHh8/H1/CpgXBnEOUnKzsyU6qft/0BpzbnbFUYqIIs2TwQh4rlLvrovpa3pB02fmtejExB39Yd9K5tgaHNL6/mFPYSUye7ux9dD0fMInM3b17zeP1KKTl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790265798; c=relaxed/simple;
	bh=sIu7q9A3nLQNOvwfYwyjAY4pGIVlyo889PjENpnEg40=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=WTdm0c7h6ZtUeNXTs7pwLROll9Ztthleo7Wpk7qWFIgkaU471qqpYdQDRiyDMWxSltmSVU+D6Mgm+B3uW589/6kPLdtjozpdgFiN8CGNUkGM33aehO0AWZBqvKNzcc79oObcUV9p8qcVamrGFBSSuSpif5x5yKvQgbqSRLCQyms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=I9XiSXTT; arc=none smtp.client-ip=209.85.210.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="I9XiSXTT"
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8696b921ac0so18527b3a.3
        for <linux-coco@lists.linux.dev>; Thu, 24 Sep 2026 09:03:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790265796; x=1790870596; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+JeZX99gxXiB6y1Oy8n/FpHxL7PYkdZSHmEmkbXoc/s=;
        b=I9XiSXTTFJ+vFhDx4J9TQh4N9Nm26qmi66vhNVh0VVpLQnVE1Si8iO/CDj1alLqRK0
         7dyJjJED0g8NaJZwnJ2mxYG7Cdod2gAIkDEAMOqbeaNc8muYquSSyfvfGuiHiXer7G+N
         1O/naXNqru911lFo4qCbTmYpVdVVluPa+1oDW1WeLC1Z8nvUOQFkIIRrvzKfGH5h9hgg
         0oUBwH5yxQNOIQP7JOGuF1P5WMNNFr0/Et7Tjbi6WV4O5OQHCUcgC1YNe1udZnpmD7a1
         jVxYpiRJp0eJvE1cDX5Dh79KBd2BXl/v/mT6hWEKbyYFXC3uvhomcHgX0xhcpq+eebv7
         zDZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790265796; x=1790870596;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+JeZX99gxXiB6y1Oy8n/FpHxL7PYkdZSHmEmkbXoc/s=;
        b=rd+npptF7W6T1grzNilox0Gvgbm5Sa8acWJD1M/24FEdpp03682SOOT2JoJLQyV6WQ
         YjdYDIjXaLcaaqc5foGBCgCTyuzhePGFs9y1P6o6FuGVFLSJQJrUn6GNd4zTxwNGlcMx
         +QoRYXd6ucAVn0SXUaznv09W98UZn5Ag7bo8jFvfruw8WenApVirucWtkrCRIEVPySrv
         bZ6kNIlzLcbUPVJ8pZTM+G8mxZS+NjdJGwCvDQ9ZEezKwyOnR+J2K35LRqDKSsZZmSOy
         WIUNeqJ4IinP4iE3Di8DObySII+h+dU6w3Y2pSkoXozYV4WdTLslzUktClE5wafEKyuK
         oFBw==
X-Forwarded-Encrypted: i=1; AKwUvBzonYLnHzQkvg/WnJuZLLBOS4J46LDdqbETjx52qt4ja+Ht+s1dABDhqSloNopnT7TY/+iiGVdgU++e@lists.linux.dev
X-Gm-Message-State: AFuF++kgxfXmNZ4fEGrCs8BAl58WpLfzDYnnZCiQ5Q+VDUIyGAIC1I/u
	qySlmo77Jv6YbVgSW6ejRZy8jfIfPFoGEJ2PWouDykKx6CENZhdLd5FiSR/saLqaY0oU6VlLBbs
	wqX5XPA==
X-Received: from pgdi2.prod.google.com ([2002:a05:6a02:51e2:b0:cc4:b427:4edc])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:4d07:b0:3da:e7dd:45d5
 with SMTP id adf61e73a8af0-3de0e74f454mr2975826637.20.1790265795874; Thu, 24
 Sep 2026 09:03:15 -0700 (PDT)
Date: Thu, 24 Sep 2026 09:03:15 -0700
In-Reply-To: <5949c545-2104-4824-b007-5345fe0e5d7f@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260923163315.1580860-1-seanjc@google.com> <50ccc54c-6cbb-4ae2-a84a-4dcbc958f91c@intel.com>
 <arUv_KydBD2kWkIo@google.com> <5949c545-2104-4824-b007-5345fe0e5d7f@intel.com>
Message-ID: <arVJwzMXGSXeFryO@google.com>
Subject: Re: [PATCH] KVM: TDX: Synthesize SHUTDOWN instead of returning -EIO
 on unhandled EPT violation
From: Sean Christopherson <seanjc@google.com>
To: Xiaoyao Li <xiaoyao.li@intel.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Kiryl Shutsemau <kas@kernel.org>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	kvm@vger.kernel.org, x86@kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, James Houghton <jthoughton@google.com>, 
	Yan Zhao <yan.y.zhao@intel.com>, Binbin Wu <binbin.wu@linux.intel.com>, 
	Ackerley Tng <ackerleytng@google.com>, Vishal Annapurve <vannapurve@google.com>
Content-Type: text/plain; charset="us-ascii"

On Thu, Sep 24, 2026, Xiaoyao Li wrote:
> On 9/24/2026 10:13 PM, Sean Christopherson wrote:
> > On Thu, Sep 24, 2026, Xiaoyao Li wrote:
> >> On 9/24/2026 12:33 AM, Sean Christopherson wrote:
> >>> Synthesize a triple fault, i.e. exit to userspace with KVM_EXIT_SHUTDOWN,
> >>> instead of returning -EIO from KVM_RUN if KVM encounters an EPT Violation
> >>> due to a guest access to a pending page.  Returning -EIO implies KVM is
> >>> buggy, and most VMMs will respond by completely terminating the VM, versus
> >>> rebooting the VM in response to KVM_EXIT_SHUTDOWN.  I.e. give the VMM the
> >>> option of trying to keep the VM (from the end user's perspective) alive.
> >>
> >> But reboot isn't good, neither.
> >>
> >> I still think a new specific exit reason[1] would be better, as I suggested before.
> >>
> >> [1] https://lore.kernel.org/kvm/1b0ea352-c645-461b-9e19-5202791f8e2d@intel.com
> > 
> > Doh, I completely forgot about that patch.  *sigh*
> > 
> > I actually thought KVM_EXIT_MEMORY_FAULT this time around, but I was worried that
> > it would confuse a VMM.  And practically speaking, the VMM can't do anything other
> > than print some diagnostic details and try to reboot the VM, because the guest has
> > very deliberately opted out of #VEs.
> > 
> > An alternative to KVM_EXIT_SHUTDOWN would be
> > 
> >   vcpu->run->exit_reason = KVM_EXIT_SYSTEM_EVENT;
> >   vcpu->run->system_event.type = KVM_SYSTEM_EVENT_TDX_FATAL;
> >   vcpu->run->system_event.ndata = 1;
> >   vcpu->run->system_event.data[0] = gpa;
> > 
> > So that the VMM could log the guilty GPA.  Though I'm not sure I like overloading
> > an explicit guest event.
> > 
> > As for KVM_EXIT_GUEST_ERROR, I don't see the point.  As above, the VMM can't do
> > anything other than reboot the VM.  I doubt Linux-as-a-guest will ever support an
> > interface that allows recovering from this situation, because again, the entire
> > point is treat unaccepted accesses as fatal conditions.
> > 
> > All in all, I think my vote is still for SHUTDOWN.
> 
> My concern is that userspace cannot differentiate between triple fault and
> accessing a pending page if we return KVM_EXIT_SHUTDOWN. It's not friendly for
> debugging.

Hmm, I disagree.  It's not friendly for *triage* given a bug report from a third
party, but for actual debug, I doubt it will matter since the exact exit reason
is available with trace_kvm_exit().

And for triage, IMO this scenario isn't interesting enough to warrant special
treatment.  There are myriad ways to end up in triple fault, i.e. why the guest
ended up in a shutdown scenario is never going to be something that can fully
debugged given only run->exit_reason.  E.g. if the guest did not opt out of #VEs
for this scenario, then it's not at all difficult to imagine scenarios where
accessing unaccepted memory leads to a triple fault.
