Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CB5454489B
	for <linux-coco@lists.linux.dev>; Thu, 10 Sep 2026 17:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789060820; cv=pass; b=YszLN+kTAkv3Nmt9vOkSyXme+u+TTDElfA+zrANTXw/NitsTtZwzrs/F9qoF9M714ASIAybMnmwxJgKBPnej06aE7LfRJCHhQ3bfKvlRRFenL3g/bDuHPEUNfB43xOi191qLoe1QoHI136GvfNN+Kz75MhCH7QDW3y9VPyZIUA0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789060820; c=relaxed/simple;
	bh=/v015ZI2cSC/eglT0djeEARyRLz+9lux+yuLnGVDWVI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UdUbC97XlAH6OcNAoHvF1wMRja9vpHaPs0GSdpiNC9pBOLxvXFu13+Yqx4s5EQZb9xzt8gg3TXu2tV3VuiuUlgnFUCReRMVERpB/4sbrZIR7OIbRSNGXHrOmK0BaTClqmqWhl05IQxtRleEaE05u3rdoPJyidb2QDsWhCc0r93o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VkA1ufoH; arc=pass smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VkA1ufoH"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-52ff0b7c98aso506491cf.0
        for <linux-coco@lists.linux.dev>; Thu, 10 Sep 2026 10:20:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789060799; cv=none;
        d=google.com; s=arc-20260327;
        b=QN41FNAM25T6wdciM5A6CFvL6H4q8Vpd11f2BQj1TwWmGCGFRa4XAhokHfJ1c7q8kI
         OPVlKbv+lEwU1cpB23Qphnnal5i7iyH3AN4uIfJI0yoF9IBtXJX96Z59uAO0Tg0fVCQD
         arFnYQQna1d/rtT/DKo1Vg7X8xsnvukN6jz686jxX4jzwvWDU+9ffFbU4YdT/8M2Cd4a
         422a9fcUudtiAq9F/O+8udLyVC4gSRuhhZuca04C1f6pWykMFYulzB5S3OuTsGppRHRK
         WwDXn4wKIlVNdMBHbmlaR21IwCOCDmVPqLqNZggwULVcdaFBS01m1jpdmZnrGZSf5vXv
         v7MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=waC8vF2dtDUS7XnDxfIfPJDfjo2BuEf9qI8Li791zgk=;
        fh=/bAD7IHoxENRVLA+w2R48dmuk7SLlMSaOH+0jxozyg8=;
        b=nGnGMn6uuQIeRJPP14/0hSBBEbd/cKE8hAmrBpSsxMiMmXm+1F7qjqLj26AiJBUu/c
         DkuHTbiGPjIpkt5HyxOHaLjZP3/i53qHDccha+N94PoXrKgdArPp9WKqWP0YtDJqKxiG
         MQ11GXgukP4lTEXqqlAR0VWnzSQAfoEG1Y6Hd5jm2OkU9+a+4+5eZbYkRiaPuUIddpYu
         qtjeq7Aby/iV+xuspbzvYI5/4gGI7adCSFYPuPYV+z5yTrHm46VBy33xx9G+kI+mWKzp
         uLUfbfdTCLYgA8RN2uckHTEQlJlUUpXH20ngMHii9SSYRDxxkAH49MsSGxybMo2Ew6Kx
         0w8A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789060799; x=1789665599; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=waC8vF2dtDUS7XnDxfIfPJDfjo2BuEf9qI8Li791zgk=;
        b=VkA1ufoH/+yI7XSfq3fLW35QZL/J4XdH4DK1WmhOrLXK1MYP34x+jxbZSWODZDzgEK
         Ztu27dAe/17HYKdbWrs05xq63V5gEpb3zjQfgMnjf0KZuRomvszt7ZS5X5m864qwfIt+
         4+4/+N8Px/B/bV+mODEwYYRK72GLW1jxbBCWYNEDb9mBDbVesUwZu9C74n6pLrXp9Ypc
         6TtCnD9dLZU4ESNotHmvraM2AWi6IBTmBG19w/nFBHrMIGdZXNIedjm6//8wfrvXQcZG
         qHGWzpi8ZTggBkmwOoNeDFaTfUBVyMkVY5IMk70vWJHnMMmZ3hBO1T/E+XzUGFzUxvLu
         /WpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789060799; x=1789665599;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=waC8vF2dtDUS7XnDxfIfPJDfjo2BuEf9qI8Li791zgk=;
        b=Qvy++pArMyaTN2rIPMGqfO8BvMwQTrcBrcal/nri0snoaalf6W1O35f3hJReFVTJvM
         61Vtqn2+KGfQVJJ0Ao7vj1rnWfnxeQrYZ7SDBGUfrvbpY+UwNZFN4UNS6sYMdiyuf+ss
         DqYRTRJkowhg8sFp5QPpgzjdPyNnUN/BJ3SRbn1rwUHFXm1Ln5Yj0PblVXXzkYE5/R0n
         mHpKYi+7sFT4Vpv23XUT+6j+ZBsGVBpXV2k7g8sjeHSULQY0QYauP9xy0jKUTdsBhqkj
         6ZSG8KcL1Ei5ECuVtrOfYN3zzW8VhAsLmF/3YHAOGZ9kVHHlZ3C401MMGpXwwg04Dd/q
         2O6g==
X-Forwarded-Encrypted: i=1; AKwUvBxtECJjZp3upJuXUojVE9HxH0HN0Es4yYhJ0Vf5RRQ0iTq/FXkXVVIN+mdgi/gnRzg1bv2PT8YYzJJa@lists.linux.dev
X-Gm-Message-State: AFuF++nb5EQhegrfmFpNjLkhb0qg6SdJZsOyJdqj1xFUpyfo5MFYSr8S
	CxihjXZt3Y7j36cuyRhHm047BkWxAHnNBsRiFgjmUgPM8crzyU1waxqQ2liaLmNe4Zg4gDnxjOk
	AxTsYqblECnisaH0B7HfLzBkykTSrUxxFhgvGSVYCtbiYadUHgNVccWvY
X-Gm-Gg: AYBFou2j5VKnkL5UJ8LA8ZBcjHq73cvsu30b7XYvhvn/mpmuCD3m9zuYcW36E7/VUms
	hTj0RWx+1MVl9yJjh9SLnkhzkkVhhcGyH2dUKZlzy5RHERvpkMFkkEKB7g/nl5V+/dd6LxbZtYm
	gA4oiwkrTfXKKQS1+cQrCSceGKpb/zvNOvfiy7KgOa3yOzI+neQJWhZxlqQTAZHuAX6tneEhABK
	fPU5owzuRjmGwqB98YFnKAEvrAO2dEN13T+xx1EqxE+zS3iAfmb9qorKHg6XDCvkArRoGD4zwik
	C2iUfRNdq8TqRLfYRw+w2OK4I0vbwq6MtYT0uQC7YTaSKvffP8VcavZnFF8XG72jQlW2/g+Va6W
	TNk5bgoemhcGoKubIUqNP
X-Received: by 2002:a05:6820:3404:10b0:6b1:4a71:775a with SMTP id
 006d021491bc7-6c0bae083dcmr10697eaf.19.1789060331694; Thu, 10 Sep 2026
 10:12:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260910162343.4092060-1-elver@google.com> <20260910162343.4092060-3-elver@google.com>
 <aqLbHvD5lqQP8PRd@google.com>
In-Reply-To: <aqLbHvD5lqQP8PRd@google.com>
From: Marco Elver <elver@google.com>
Date: Thu, 10 Sep 2026 19:11:34 +0200
X-Gm-Features: AcwNN1X74FFLXo3tfvC8iadNXegd-2_Lr_knvP8WkNgyIr-_V-yJ7lG2ubIqDNU
Message-ID: <CANpmjNOZPFQ9FcaA6+GH9PZ8DRyEMYW3+FKBO9B3d2CY+2C-5w@mail.gmail.com>
Subject: Re: [PATCH RFC 02/10] KVM: Allow reading memslots while holding slots_arch_lock
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, Kiryl Shutsemau <kas@kernel.org>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, David Hildenbrand <david@kernel.org>, kvm@vger.kernel.org, 
	linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 10 Sept 2026 at 18:30, Sean Christopherson <seanjc@google.com> wrote:
>
> On Thu, Sep 10, 2026, Marco Elver wrote:
> > kvm_swap_active_memslots() updates kvm->memslots[as_id] while holding both
> > kvm->slots_lock and kvm->slots_arch_lock. Holding either lock guarantees
> > that memslots cannot be concurrently modified.
>
> Sure, but that's irrelevant.  The goal of the srcu_dereference_check() is to
> ensure that readers see a stable view of the VM's overall memory, not simply that
> kvm->memslots can't be written.

Functionally, this is irrelevant for readers. But under lockdep it
isn't for writers: srcu_dereference_check() (with lockdep) asserts
that the srcu reader-lock is held, or the condition 'c' holds, which
here is holding any of the writer locks.

> > Allow reading memslots in __kvm_memslots() when kvm->slots_arch_lock is
> > held.
>
> Why?

Holding any of the writer locks guarantees no concurrent modification;
therefore, if any writer lock is held, it's not required that the srcu
reader-lock is held. There are few places where only either slots_lock
or slots_arch_lock is held, which is sufficient for reading.
