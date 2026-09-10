Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F16DC4AA1CC
	for <linux-coco@lists.linux.dev>; Thu, 10 Sep 2026 16:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789058322; cv=none; b=Wpy2Kz1kcDeh0uH6OmuKJ1+W5Snj56mVbP3FQJoGkOFPpTn7SavdNhkh7AJ+JfJLHYR65PnsPcb3xW78zZ+Pc3usDL1/yNks36d81KEF9Y5HPg9U97B0XUF1PBW1lbRVubEr3smUm00z6MFdn8e9IOyPs8xCHptjC8XxXcbkiL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789058322; c=relaxed/simple;
	bh=cRUce6TKrSWMsa9ZsOkBFnWjOLHEVLQY4P6V2RCGZLU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=aF5Jjv4VU+SO8UV1Nl68m4vz8ukqq2OFLJKd8WbtNUcaGm5s5DtSLp8ZFC/E9u7LGDVIFSfrcu/lnOUDcEBEyB7KoYYRzmwzkZpBGce7JjJws97VPbkl5GrnvgWh10r66+ntAh3tFQZ+GU/oNLdD41x8kJHXyJKlE4YrPGUHsgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GQrWrpt6; arc=none smtp.client-ip=209.85.215.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GQrWrpt6"
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc1eb205d31so25336a12.2
        for <linux-coco@lists.linux.dev>; Thu, 10 Sep 2026 09:38:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789058318; x=1789663118; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pLO/yg2gAb4tQ7ZA84YrrqYOhPHyp8iAfdCQyiFWl6A=;
        b=GQrWrpt6fPxKTeO2B2EON91nvs9Z76fEEs4uBwy02onE1sTpfT+8gjXOC03jt37keo
         EC4nW2vz0g2KnGzh5UM66LFVzBcF2pOMFXI1pSC53WE/cCYkaA/ZRE0v6ig7EWcgsYpv
         Hjw2MDc1dWqGnFbrmbIFlf+aTYWxVBSy2rUrYpli7bPjMkRWPG/NA72lRTeH7KNiXOoy
         vVjL2a0AiZVjG5S4pguP/KROSKezZ/EDNguzWUIhbc+KMu4cEJXfPl9wnQYz/1RUK5EC
         VQAZhNmSIghhUMwzfRNb7LDqWKlGXTo6ciQVB0V+V63Fr83d1+UOEZzc2uFgqg8VUgMg
         6qqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789058318; x=1789663118;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pLO/yg2gAb4tQ7ZA84YrrqYOhPHyp8iAfdCQyiFWl6A=;
        b=JxRnDdS+htbyuEWsMnPpgw3g0DS/ffPCAgek/ESxf/amXdxegSnFqZi5OfuYfkeFY+
         yqjuV+CpRmGJwmFAyFbV+ILd88rGKTpZO6rOHRKLTDuziAn/AxmJeLn4krlfj5eTHe0F
         T4yVMf6Wnvq4B4bBZvBVMRsqVeGiRvIvQdAmBDosdAFNLf5SuM3j22TEh/asGxF4ASBE
         PXFRSn4cSh5SJfC40V7/0W6gFVZMInCq6zR8xTrv9F0p3bfFHPIj0V4SDaYyr5IrGfUG
         oCy9z6pw2ckLhpYgZsiVqO9UNBcorf5NVU8ENUu4OZ2saIPiXPnF0OFZVXzj01YBLPs5
         1X0Q==
X-Forwarded-Encrypted: i=1; AKwUvBxj6GSjUz8n/ijbM3EUdlsf6WTFA8VTyseMIBqmCrUjJrmrMAunwZsgeZJGtF/xf43ywHGDtg5Fmt+J@lists.linux.dev
X-Gm-Message-State: AFuF++kYFt1ByZIpROz24tmZe35KgMqdHPzVt7iiCxIHaWvcTx8EE1mm
	i7Snvnye23ZLlz1Sj821pIcF22+IZPDHkYwM3il339YytJmCLfomB2TP2K8FHdlvwhXXfOi5ln4
	5GSrkyw==
X-Received: from pgmo17.prod.google.com ([2002:a63:5d51:0:b0:cc2:7a40:4d51])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:9397:b0:3c3:a3f4:5485
 with SMTP id adf61e73a8af0-3da39cff434mr71061363637.6.1789058317301; Thu, 10
 Sep 2026 09:38:37 -0700 (PDT)
Date: Thu, 10 Sep 2026 09:38:36 -0700
In-Reply-To: <20260910162343.4092060-5-elver@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260910162343.4092060-1-elver@google.com> <20260910162343.4092060-5-elver@google.com>
Message-ID: <aqLdDIGPaclTYpjU@google.com>
Subject: Re: [PATCH RFC 04/10] KVM: Refactor kvm_handle_hva_range() to avoid
 conditional mmu_lock
From: Sean Christopherson <seanjc@google.com>
To: Marco Elver <elver@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, Kiryl Shutsemau <kas@kernel.org>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, David Hildenbrand <david@kernel.org>, kvm@vger.kernel.org, 
	linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Thu, Sep 10, 2026, Marco Elver wrote:
> Refactor kvm_handle_hva_range() to check for overlapping memslots
> upfront via interval_tree_iter_first() instead of tracking found
> memslots inside the range iteration with a 'found_memslot' flag and
> conditionally acquiring and releasing mmu_lock.
> 
> This simplifies the control flow by cleanly decoupling the search for
> overlapping memslots from the subsequent walk. It also separates the
> lockless path from the serialized path into distinct branches,
> eliminating the conditional locking, which subsequently enables Clang
> context analysis to validate locking in this function.

At the cost of duplicating code and adding overhead when there is a relevant
memslot.  I'm not wedded to the exact implementation, but IMO this is not at all
an improvement.  Without a clear explanation of what value is added by enabling
Clang to "validate locking", I don't see any justificatoin for the change.

> No functional change intended.
> 
> Signed-off-by: Marco Elver <elver@google.com>
> ---
>  virt/kvm/kvm_main.c | 94 ++++++++++++++++++++++++++++-----------------
>  1 file changed, 58 insertions(+), 36 deletions(-)
> 
> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index 65eb26a0520d..f7bfa2d32507 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -558,31 +558,14 @@ static void kvm_null_fn(void)
>  	     node;							     \
>  	     node = interval_tree_iter_next(node, start, last))	     \
>  
> -static __always_inline kvm_mn_ret_t kvm_handle_hva_range(struct kvm *kvm,
> -							 const struct kvm_mmu_notifier_range *range)
> +static __always_inline bool __kvm_handle_hva_range_walk(struct kvm *kvm,
> +							const struct kvm_mmu_notifier_range *range)
>  {
> -	struct kvm_mmu_notifier_return r = {
> -		.ret = false,
> -		.found_memslot = false,
> -	};
>  	struct kvm_gfn_range gfn_range;
>  	struct kvm_memory_slot *slot;
>  	struct kvm_memslots *slots;
> -	int i, idx;
> -
> -	if (WARN_ON_ONCE(range->end <= range->start))
> -		return r;
> -
> -	/* A null handler is allowed if and only if on_lock() is provided. */
> -	if (WARN_ON_ONCE(IS_KVM_NULL_FN(range->on_lock) &&
> -			 IS_KVM_NULL_FN(range->handler)))
> -		return r;
> -
> -	/* on_lock will never be called for lockless walks */
> -	if (WARN_ON_ONCE(range->lockless && !IS_KVM_NULL_FN(range->on_lock)))
> -		return r;
> -
> -	idx = srcu_read_lock(&kvm->srcu);
> +	bool ret = false;
> +	int i;
>  
>  	for (i = 0; i < kvm_arch_nr_memslot_as_ids(kvm); i++) {
>  		struct interval_tree_node *node;
> @@ -620,28 +603,67 @@ static __always_inline kvm_mn_ret_t kvm_handle_hva_range(struct kvm *kvm,
>  			gfn_range.slot = slot;
>  			gfn_range.lockless = range->lockless;
>  
> -			if (!r.found_memslot) {
> -				r.found_memslot = true;
> -				if (!range->lockless) {
> -					KVM_MMU_LOCK(kvm);
> -					if (!IS_KVM_NULL_FN(range->on_lock))
> -						range->on_lock(kvm);
> +			ret |= range->handler(kvm, &gfn_range);
> +		}
> +	}
> +
> +	return ret;
> +}
>  
> -					if (IS_KVM_NULL_FN(range->handler))
> -						goto mmu_unlock;
> -				}
> -			}
> -			r.ret |= range->handler(kvm, &gfn_range);
> +static __always_inline kvm_mn_ret_t kvm_handle_hva_range(struct kvm *kvm,
> +							 const struct kvm_mmu_notifier_range *range)
> +{
> +	struct kvm_mmu_notifier_return r = {
> +		.ret = false,
> +		.found_memslot = false,
> +	};
> +	struct kvm_memslots *slots;
> +	int i, idx;
> +
> +	if (WARN_ON_ONCE(range->end <= range->start))
> +		return r;
> +
> +	/* A null handler is allowed if and only if on_lock() is provided. */
> +	if (WARN_ON_ONCE(IS_KVM_NULL_FN(range->on_lock) &&
> +			 IS_KVM_NULL_FN(range->handler)))
> +		return r;
> +
> +	/* on_lock will never be called for lockless walks */
> +	if (WARN_ON_ONCE(range->lockless && !IS_KVM_NULL_FN(range->on_lock)))
> +		return r;
> +
> +	idx = srcu_read_lock(&kvm->srcu);
> +
> +	for (i = 0; i < kvm_arch_nr_memslot_as_ids(kvm); i++) {
> +		slots = __kvm_memslots(kvm, i);
> +		if (interval_tree_iter_first(&slots->hva_tree, range->start, range->end - 1)) {
> +			r.found_memslot = true;
> +			break;
>  		}
>  	}
>  
> -	if (range->flush_on_ret && r.ret)
> -		kvm_flush_remote_tlbs(kvm);
> +	if (!r.found_memslot)
> +		goto out;
> +
> +	if (range->lockless) {
> +		r.ret = __kvm_handle_hva_range_walk(kvm, range);
> +		if (range->flush_on_ret && r.ret)
> +			kvm_flush_remote_tlbs(kvm);
> +	} else {
> +		KVM_MMU_LOCK(kvm);
> +		if (!IS_KVM_NULL_FN(range->on_lock))
> +			range->on_lock(kvm);
> +
> +		if (!IS_KVM_NULL_FN(range->handler))
> +			r.ret = __kvm_handle_hva_range_walk(kvm, range);
> +
> +		if (range->flush_on_ret && r.ret)
> +			kvm_flush_remote_tlbs(kvm);
>  
> -mmu_unlock:
> -	if (r.found_memslot && !range->lockless)
>  		KVM_MMU_UNLOCK(kvm);
> +	}
>  
> +out:
>  	srcu_read_unlock(&kvm->srcu, idx);
>  
>  	return r;
> -- 
> 2.55.0.1003.g10538fe699-goog
> 
