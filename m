Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B242A356767
	for <linux-coco@lists.linux.dev>; Wed, 22 Jul 2026 15:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784733143; cv=none; b=u8RdQ2y/wfuaaw7uHRJD19LXMyi9IPUHKt84ECI1gfeNTLQes9z5vM2578IksGt5vEeKNpM0JxDrK0u8WbP/mP/XEdknjeik2+G3S/PtULcH9OvNfRiU1B6bBGXIPMFzJXf547x0dDHpqX21fqncAnOJ4Er7YemGM4TK9nc5Ujk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784733143; c=relaxed/simple;
	bh=gwL+7pw1dy+OP01p49q/MyWPmKcKJMcpY7Nwq/eqxik=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=l4DB9Bs4vGNaJgHPtyV3DWv3RxS0ZZZLtuLltmaK3OGNXuXfJ0rzk1NR5miGPuJ1BnYFg/XghLUBYCJgcbBQscShkO/6iv0fKKsAlH4WHizgHS956nO8lWQ43vE/AqhZULOZNREoCNzOmr/suA7SMCmHu7L6Ga4gPrqsVZjlMcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=X21agpX3; arc=none smtp.client-ip=209.85.210.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="X21agpX3"
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-84e04598adeso2028340b3a.2
        for <linux-coco@lists.linux.dev>; Wed, 22 Jul 2026 08:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784733141; x=1785337941; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I7f9lZbSdhEgbSxr67hS2Jrj3sXRGAdvMtjr5VpXokM=;
        b=X21agpX3wBRHZ5IU+Dz0dD029u2eI7VTyw0An6Bd2tFQqhIrer0+Tq/PqCOfzWM/rp
         hq97xHzhRXbDaK5RW5/YVS9pKpgwKxOnyIumnZq5C426nxrpgiiBFwRxlQe+egkR0TOr
         rTn9aAqq+xtP9ak/oqXFEI2l/Ju7MPVFZf4KfBi8nlXRzU10lOdNcBzUVgcgGSazUW1N
         /aC3qBrb9W83bZYsTbh9qg/3bf51cNQ5bs+Z77BEn/cYp+AZGpWI9npVkgVFS6PQbhT9
         XwTnKJ5R3MDIzcjYrRgMZXe5hAhCduRwWKVZRCbWblop3b2h0HY2k+uLFqWJZjywhXXu
         Swxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784733141; x=1785337941;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I7f9lZbSdhEgbSxr67hS2Jrj3sXRGAdvMtjr5VpXokM=;
        b=TarY/tim/arp2MWlpmmjdhe5xO2Twrmk8zU52Fmkl/uHLfYq2obzhuy83Xp1Vh6SYC
         rmocIqb34+8u0d5sywvhxPzy48teM8Rfvta16VMWmNDLqgEZBP91hn6tS9YYNYqOof7D
         g7WfFZ+oaGtBB+vKA/N/w9/9KWG0S/t8HYXNWLcSHqnf86yP8jUETGkPu8TNmVukWh+D
         OlI+USXqZXpgo2tKcA3IVUdiEW+VlVfgTmHe5iXWg9OchySZuaCANC5RSbwYMQx6kfZl
         gMJFf5DZlYdbiizwgVN/U7jqRugcW+UrOfkJR8Sby0cUnEjXsxbtesJ6/odNcMwWKYOt
         Pwow==
X-Forwarded-Encrypted: i=1; AHgh+RqNDbu0xF0gxAx2IOagCcT7qn4wf6X/1Kssfncipx/qDrztaveOXjwA/7H/oTS+mbFrvKU3KvussiJX@lists.linux.dev
X-Gm-Message-State: AOJu0YyKtTCeSREZDUlQ5dN/N1Obrh6EJcNo8pojVCY33o+ziSR7SMlx
	rx7FcM0SfjhYmWWJOVdiG+PlfOkTiXutMOdVXdKF/+vSK6WWYDBAPh292oHAxM5WFY1G+Quycrs
	S0+jmXw==
X-Received: from pfkm8.prod.google.com ([2002:a05:6a00:808:b0:848:48a0:41e6])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:14d5:b0:848:6ef9:f5ca
 with SMTP id d2e1a72fcca58-84c2954e130mr23069474b3a.63.1784733140595; Wed, 22
 Jul 2026 08:12:20 -0700 (PDT)
Date: Wed, 22 Jul 2026 08:12:20 -0700
In-Reply-To: <1417841720b8435f8fb95ac0bd95be6e0e9390d4.camel@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260718014500.2231262-1-rick.p.edgecombe@intel.com>
 <20260718014500.2231262-9-rick.p.edgecombe@intel.com> <20260718061050.E17B01F000E9@smtp.kernel.org>
 <1417841720b8435f8fb95ac0bd95be6e0e9390d4.camel@intel.com>
Message-ID: <amDd1Ip3XTvKSTcb@google.com>
Subject: Re: [PATCH v7 08/11] KVM: TDX: Get/put PAMT pages when (un)mapping
 private memory
From: Sean Christopherson <seanjc@google.com>
To: Rick P Edgecombe <rick.p.edgecombe@intel.com>
Cc: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>, 
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, Kai Huang <kai.huang@intel.com>, 
	Dave Hansen <dave.hansen@intel.com>, Yan Y Zhao <yan.y.zhao@intel.com>, 
	"tony.lindgren@linux.intel.com" <tony.lindgren@linux.intel.com>, Binbin Wu <binbin.wu@intel.com>, 
	"kas@kernel.org" <kas@kernel.org>, "mingo@redhat.com" <mingo@redhat.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "pbonzini@redhat.com" <pbonzini@redhat.com>, 
	"nik.borisov@suse.com" <nik.borisov@suse.com>, 
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "hpa@zytor.com" <hpa@zytor.com>, 
	"tglx@kernel.org" <tglx@kernel.org>, Vishal Annapurve <vannapurve@google.com>, "bp@alien8.de" <bp@alien8.de>, 
	Chao Gao <chao.gao@intel.com>, "x86@kernel.org" <x86@kernel.org>
Content-Type: text/plain; charset="us-ascii"

On Mon, Jul 20, 2026, Rick P Edgecombe wrote:
> On Sat, 2026-07-18 at 06:10 +0000, sashiko-bot@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> > - [High] Infinite kernel loop in `kvm_tdp_mmu_map_private_pfn` due to permanent PAMT cache depletion on transient TDX module contention.
> > --
> 
> Our internal Sashiko found this too. It's a false positive as a real bug.
> 
> Today kvm_tdp_mmu_map_private_pfn() is only called tdx_gmem_post_populate()
> during TD setup. It holds the heavyweight tdx_vm_state_guard which grabs vm-
> >lock, kvm->slots_lock, and all vcpu->mutex. So there should be no contention
> possible.
> 
> Any potential confusion is not new either, because a similar thing could happen
> with the external page tables.
> 
> But Yan and I were discussing that it would be a good cleanup to fix this anyway
> because the reason it is not a functional issue is not clear from the code. For
> improved readability (and quieter sashiko reports) the topup can happen inside
> the retry loop. Either by moving the retry loop or moving the topup.

Hmm, yeah, I think I agree.  Super duper technically, that's a fix for an existing
flaw.  Because very, very, VERY theoretically, the cache of page table pages could
be exhausted.  E.g. if some other task managed to free non-leaf page tables while
mmu_lock was dropped, thus forcing kvm_tdp_mmu_map_private_pfn() to allocate from
its cache over and over.  In practice, that's likely impossible thanks to holding
slots_lock, but given that (a) retry should be rare and (b) kvm_mmu_topup_memory_cache()
is basically free if no work needs to be done, I don't see any reason to do topup
outside of the retry loop.

The other thing we should address is the call to kvm_mmu_reload().  Like cache
exhaustion, it *should* be impossible for the root to be invalidated/obsoleted,
thanks to holding slots lock.  But as evidenced by the rash of recent shadow MMU
bugs, we don't always get things perfect, and lack of defense-in-depth can be
*extremely* painful.

I don't think I want to just move kvm_mmu_reload() into the loop, because KVM
should provide stronger guarantees with respect to the validity of the loop,
versus the population of the caches.  I.e. I want to WARN if the root becomes
obsolete after the initial reload.  And more importantly, KVM really should
check the validity of the root after acquiring mmu_lock.

We can't simply call is_page_fault_stale(), because mmu_invalidate_retry_gfn()
is inherently fuzzy, i.e. could get false positives, even though the pfn provided
by guest_memfd is guaranteed to be valid.  E.g. if shared gfns surrounding the
to-be-mapped gfn are concurrently invalidated.

So, this?

	r = kvm_mmu_reload(vcpu);
	if (r)
		return r;

	do {
		if (signal_pending(current))
			return -EINTR;

		if (kvm_test_request(KVM_REQ_VM_DEAD, vcpu))
			return -EIO;

		r = mmu_topup_memory_caches(vcpu, false);
		if (r)
			return r;

		cond_resched();
	
		guard(read_lock)(&kvm->mmu_lock);

		if (WARN_ON_ONCE(kvm_test_request(KVM_REQ_MMU_FREE_OBSOLETE_ROOTS, vcpu)))
			return -EIO;

		r = kvm_tdp_mmu_map(vcpu, &fault);
	} while (r == RET_PF_RETRY);

The other option would be to gracefully handle an obsolete root instead of WARNing,
but as above, I think I prefer to WARN.

	do {
		if (signal_pending(current))
			return -EINTR;

		if (kvm_test_request(KVM_REQ_VM_DEAD, vcpu))
			return -EIO;

		r = kvm_mmu_reload(vcpu);
		if (r)
			return r;

		r = mmu_topup_memory_caches(vcpu, false);
		if (r)
			return r;

		cond_resched();
	
		guard(read_lock)(&kvm->mmu_lock);

		fault.mmu_seq = vcpu->kvm->mmu_invalidate_seq;
		if (is_page_fault_stale(vcpu, &fault))
			continue;

		r = kvm_tdp_mmu_map(vcpu, &fault);
	} while (r == RET_PF_RETRY);

My only hesitation with manually checking KVM_REQ_MMU_FREE_OBSOLETE_ROOTS is that
if more checks/functionality were added to is_page_fault_stale() in the future,
then we could end up missing kvm_tdp_mmu_map_private_pfn() and introduce a bug.

Maybe we can have it both ways?  WARN if roots are unexpectedly made obsolete,
but fully check is_page_fault_stale() and gracefully handle an obsolete root
instead of effectively terminating the guest.

	do {
		if (signal_pending(current))
			return -EINTR;

		if (kvm_test_request(KVM_REQ_VM_DEAD, vcpu))
			return -EIO;

		r = kvm_mmu_reload(vcpu);
		if (r)
			return r;

		r = mmu_topup_memory_caches(vcpu, false);
		if (r)
			return r;

		cond_resched();
	
		guard(read_lock)(&kvm->mmu_lock);

		WARN_ON_ONCE(kvm_test_request(KVM_REQ_MMU_FREE_OBSOLETE_ROOTS, vcpu));

		/*
		 * Snapshot the invalidation sequence counter after acquiring
		 * mmu_lock, as guest_memfd guarantees the validity of the pfn,
		 * i.e. any concurrent invalidations are guaranteed to be
		 * irrelevant.
		 */
		fault.mmu_seq = vcpu->kvm->mmu_invalidate_seq;
		if (is_page_fault_stale(vcpu, &fault))
			continue;

		r = kvm_tdp_mmu_map(vcpu, &fault);
	} while (r == RET_PF_RETRY);


> > --- Patch [8]: [PATCH v7 08/11] KVM: TDX: Get/put PAMT pages when (un)mapping private memory ---
> > commit 3474807f1c1bc4dedc75e2a756b65254c986a41d
> > Author: Kiryl Shutsemau <kas@kernel.org>
> > 
> > KVM: TDX: Get/put PAMT pages when (un)mapping private memory
> >     
> > Add Dynamic PAMT support to KVM's S-EPT MMU by "getting" a PAMT page when
> > adding guest memory (PAGE.ADD or PAGE.AUG), and "putting" the page when
> > removing guest memory (PAGE.REMOVE).
> > 
> > > diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
> > > index 528ebb3cb0389..049da8559882b 100644
> > > --- a/arch/x86/kvm/vmx/tdx.c
> > > +++ b/arch/x86/kvm/vmx/tdx.c
> > > @@ -1679,16 +1693,28 @@ static struct page *tdx_spte_to_sept_pt(struct kvm *kvm, gfn_t gfn,
> > >  static int tdx_sept_map_nonleaf_spte(struct kvm *kvm, gfn_t gfn,
> > >  				     enum pg_level level, u64 new_spte)
> > >  {
> > > +	struct kvm_vcpu *vcpu = kvm_get_running_vcpu();
> > >  	gpa_t gpa = gfn_to_gpa(gfn);
> > >  	u64 err, entry, level_state;
> > >  	struct page *sept_pt;
> > > +	int ret;
> > > +
> > > +	if (KVM_BUG_ON(!vcpu, kvm))
> > > +		return -EIO;
> > >  
> > >  	sept_pt = tdx_spte_to_sept_pt(kvm, gfn, new_spte, level);
> > >  	if (!sept_pt)
> > >  		return -EIO;
> > >  
> > > +	ret = tdx_pamt_get(page_to_pfn(sept_pt), &to_tdx(vcpu)->pamt_cache);
> > > +	if (ret)

Shouldn't this be a KVM_BUG_ON()?  To Sashiko's point about this creating an
infinite fault loop, that simply shouldn't happen.  The whole point of using
caches for the paging assets is to guarantee success.

> > > +		return ret;
> > > +
> > >  	err = tdh_mem_sept_add(&to_kvm_tdx(kvm)->td, gpa, level, sept_pt,
> > >  			       &entry, &level_state);
> > > +	if (err)
> > > +		tdx_pamt_put(page_to_pfn(sept_pt));
> > > +
> > >  	if (unlikely(tdx_operand_busy(err)))
> > >  		return -EBUSY;
> > 
> > [Severity: High]
> > Does this error path risk causing an infinite loop if the TDX module
> > contention leads to TDX_OPERAND_BUSY?
> > 
> > When tdh_mem_sept_add() returns TDX_OPERAND_BUSY, tdx_pamt_put() frees the
> > PAMT pages directly back to the buddy allocator, not back into the vCPU's
> > PAMT cache.
> > 
> > If this happens during VM initialization in a retry loop like
> > kvm_tdp_mmu_map_private_pfn(), the vCPU memory caches are topped up outside
> > of the loop:
> > 
> >     r = mmu_topup_memory_caches(vcpu, false);
> >     if (r)
> >         return r;
> > 
> >     do {
> >         ...
> >         r = kvm_tdp_mmu_map(vcpu, &fault);
> >     } while (r == RET_PF_RETRY);
> > 
> > Since the PAMT pages are discarded rather than returned to the cache, a few
> > busy retries will completely empty the vCPU's PAMT cache.
> > 
> > On the next retry, tdx_pamt_get() will return -ENOMEM because the cache is
> > empty and it does not fall back to alloc_page() when a cache is provided.
> > 
> > The TDP MMU handles -ENOMEM by returning RET_PF_RETRY, but because the cache
> > is never replenished inside the loop, the loop will infinitely fail and retry.
> > 
> > Could the PAMT pages be returned to the vCPU cache instead of the buddy
> > allocator during transient failures, or should the cache top-up be moved
> > inside the retry loop?
> > 
> 
