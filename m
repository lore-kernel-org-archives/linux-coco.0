Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91F784AB1CB
	for <linux-coco@lists.linux.dev>; Thu, 10 Sep 2026 16:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789057828; cv=none; b=X6ciqyoyXD/IN7onW6tS0jcL+8BJGolPPrvfNgqAB5HMCMFdYZwhUjaCimf2GMrgzLoTOyNuDgUq2vc+uLH/rugylXuNJ+9ta1hA5KzA+Dlc9TKRkbn+rldHTvBTC+m+YcgH5DDE7BdtP1FE4mKeFJ+sENOPvdqST44yPoTyYjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789057828; c=relaxed/simple;
	bh=wZ3LykXDLiXZdcN2B90HGOb4AiKilHNsRIIn78r352U=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Io5ElkiRorsye1cXfuxfA1XW+ow+ePymXL2C3tcJx7f4k4prSppUeWS494y67RN7UnXfLTwn1AkP6Yx1TgmlMTL7Q2dKPoFmaU1aGli8bHCP+eC2VJmZ1HE0d441M3g8xNxKpqvPxt4iWLbuevhRWaVRY3QLCDDhresRrKljMIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pmvEpOfF; arc=none smtp.client-ip=209.85.216.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pmvEpOfF"
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-39aee9b4cf2so11757026a91.0
        for <linux-coco@lists.linux.dev>; Thu, 10 Sep 2026 09:30:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789057824; x=1789662624; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VnJnwdOYGIGCcjx8YGUUXxvfpBjYI69LyTf3vI3u8ek=;
        b=pmvEpOfFrD4S+mcTvjoopak9nS0MdGoztGZRFXVR4WLRd3JBMs0NbEotxJT4SsVxUq
         3PW9/YBBQ7NCZavwtkew83fZYkNi1CyLnr/QnqgrRc2NoB7pzvcWQvHgTUKxQbpkP82L
         L1uI9SEdQltvaQvQdGyifJ3Yb+PyqnT8YNyjzDffLoiaxE2UZZBR27jF8Yswdn9Ctfay
         9ASC6HJQyQk4Qibbif0g8kHdMZ3P9lcZlr9340X9vF99Wemz8nKASUEVfJ7ZLzdSWFCA
         R9JiCJfWwH2ml4tqdZQsFdPDm9bPWRYpY0dPgQSrOtwza1C8EiFchySG1l022RW3zhQ1
         7Ozg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789057824; x=1789662624;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VnJnwdOYGIGCcjx8YGUUXxvfpBjYI69LyTf3vI3u8ek=;
        b=r3ttzNfo0T7jQjlX57rdRgTy29AkXDc9IVJNI0OlvWAvRLeFScCACrpWTLdOcNIU7D
         EMgkldolnAdd8emSK5u//nlMt1aTXjEuyjDTE0j29NujfJU36p5tmf5sb46jw/rz51PS
         elplKKgEYRXhsGmiopa3T30Myew+W3+9jO2GfLaxWfEuhALd7yWNhAGcD3yvgFKAqSsP
         hhDhlLu8JjbDT8Tgr6wDp0mTQOFTLDW8cMveuzJT5oquRPcIpNIsuoxdqeB24xVHFgDD
         Hn9ZhtUm2Js/GBLXT6cbuWM5nKT3DMFaNLw9u/yaTnt+GPuTWxH9J6jMlUvD/6jQeuoj
         A4sw==
X-Forwarded-Encrypted: i=1; AKwUvBz/tnG4DxZ3qxWn7Ft9d/y8Z+4YiPx/yp4EFLhL9lu1LN2b+o1NYgU0M4r1Ur4VH7Iond2mAScZcLI1@lists.linux.dev
X-Gm-Message-State: AFuF++lsKtV1G3PSh9ZjJ62/9qda5NmyTSrm/5B9sxJ8bYxLivp6TwHj
	Xqa4OML2EDeH3WSkZrUTNUjRP+hP7WaHXbT9B1vFIR9jVMxt92iTj9OyDXaAGVMBByyRxjwqo22
	qBZRh/Q==
X-Received: from pjbdw14.prod.google.com ([2002:a17:90b:94e:b0:39d:631c:22bf])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:64f:b0:39d:83d0:41b2
 with SMTP id 98e67ed59e1d1-39d83d046d3mr3518065a91.15.1789057823466; Thu, 10
 Sep 2026 09:30:23 -0700 (PDT)
Date: Thu, 10 Sep 2026 09:30:22 -0700
In-Reply-To: <20260910162343.4092060-3-elver@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260910162343.4092060-1-elver@google.com> <20260910162343.4092060-3-elver@google.com>
Message-ID: <aqLbHvD5lqQP8PRd@google.com>
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
> kvm_swap_active_memslots() updates kvm->memslots[as_id] while holding both
> kvm->slots_lock and kvm->slots_arch_lock. Holding either lock guarantees
> that memslots cannot be concurrently modified.

Sure, but that's irrelevant.  The goal of the srcu_dereference_check() is to
ensure that readers see a stable view of the VM's overall memory, not simply that
kvm->memslots can't be written.

> Allow reading memslots in __kvm_memslots() when kvm->slots_arch_lock is
> held.

Why?

> 
> Signed-off-by: Marco Elver <elver@google.com>
> ---
>  include/linux/kvm_host.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> index 03bfc92864b6..5ed8260ef01f 100644
> --- a/include/linux/kvm_host.h
> +++ b/include/linux/kvm_host.h
> @@ -1089,6 +1089,7 @@ static inline struct kvm_memslots *__kvm_memslots(struct kvm *kvm, int as_id)
>  	as_id = array_index_nospec(as_id, KVM_MAX_NR_ADDRESS_SPACES);
>  	return srcu_dereference_check(kvm->memslots[as_id], &kvm->srcu,
>  			lockdep_is_held(&kvm->slots_lock) ||
> +			lockdep_is_held(&kvm->slots_arch_lock) ||
>  			!refcount_read(&kvm->users_count));
>  }
>  
> -- 
> 2.55.0.1003.g10538fe699-goog
> 
