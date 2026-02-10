Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EBC717BB21
	for <linux-coco@lists.linux.dev>; Tue, 10 Feb 2026 19:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770753134; cv=none; b=EzAS/Q36X/JfhTZG48ernDuN/kpRbqUkL7WAKFEqHaisrcs7HdiXkl6ipcgRg36MZCKWpczaqSWOnEyjG2itHdN3nqoc4+/AaaC4TGSgf2fzQgCLBVcy2XwJM0hqj5dVTKptLRGMCzA0qhaMwDaEKxGBXKzv7Vgx0EKzeN37PD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770753134; c=relaxed/simple;
	bh=FPz3aTALDGXoAJyRaVcPtp+DUvxzedskxbFzllDm7TE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=QIvKzwzywcW8AkrW8X6UEqHFaWHA16kOG1VL5x4hToQVz5O3oSQ4brPp1w+4FlcCijoIWPgfALd6O/rupL7gvrvwdnOA+CUBNYlKlXpYSLTDrU/+sc2MbqUfjDTv37dCApp/4qeU7l4iOeT6hkONVQKGTkaBUmOHuRLYLV7Z2Zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=orw5tuHo; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="orw5tuHo"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-c6dded42ec4so2496310a12.2
        for <linux-coco@lists.linux.dev>; Tue, 10 Feb 2026 11:52:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770753131; x=1771357931; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=FStoHjs1wWIxzpnOrpHPM0LO80v2etJ2i+SwwLplyV4=;
        b=orw5tuHoLmSoJigwezaHsr/ZsGbjw0oOgL/kqHl0JSscZ/i81rISBJwSMR2eJp3Ygt
         sRvOD+VWrQio03dOsZdcjh08g5jz3/sJVYDKew+EvCzZyTo8XqO0+KP8lxe3pxGwgeA+
         d+1fMqbQJKK+ip5zS9kkt9r2HRbJPic2weAzFn+tFUrVutr1Ew0pRdMtNtd6ycE5vWSF
         o1bIl2MDK/vN9Y3l+67xx6job2dVMIkF+uRmSxB27TrXicKxSfWpr3hI6oidbZkv8k8J
         oJYYYGOVmlQ20U0naNq8RLjySk/c986U5uprDRDQJdvQaJGlsyEbojCdmbzYRQH1PYzb
         8JqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770753131; x=1771357931;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FStoHjs1wWIxzpnOrpHPM0LO80v2etJ2i+SwwLplyV4=;
        b=dkmA/Qf00LxT2lHNGGJJWdRDrkw0xv9hlAeKSaSFaGhojgNbSrk7h3d0lgISyzjyYc
         8D2nWPoJIr0xeRThKYMJDeW/8ZRP6wUQqgfADpMbR4TGnWc0Vh0WUegmpKbyuvTNHmrD
         kxj/rOdCulZ2fCQFCe5PEJBYW+QldsZ4RwnnHaktxAjCPALhdL7OvxSIdTzNYZ7BLOKF
         dSJYc1YiGiusRJbojNPYREyx/Gtd1TQNIb9Tu/5Uxkl2rDt9JhGs3V+SojV+6bjhK+Vi
         zU4AOnuRovops98hJzxKXKwhSE7EYU7ryjjBk2NouewoQjsploAwDNFsLvXZd0jMOOPJ
         byJA==
X-Forwarded-Encrypted: i=1; AJvYcCWTOedcLGaksPoyybJCs8i4F2+0TMTXuO1pLJNlHwrctUHfEyt0Sf/Y2v6zchYIt9L2CBVjx6suoTMa@lists.linux.dev
X-Gm-Message-State: AOJu0YzeJTdF6u8BnR3ZMaMD16HwenWRIs1JCSkM9X5lcWjcUVNvDOiH
	y1q4qUzJuASquJVIqhHoBzsK5cp4pR8AFPGcqK3qzGZaAnJY3otuteGX1fpv0iJ1Y2xf0XVN2jz
	mXvDd9A==
X-Received: from pjbsb14.prod.google.com ([2002:a17:90b:50ce:b0:352:de3b:3a0f])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:730a:b0:364:33f7:7338
 with SMTP id adf61e73a8af0-39417853391mr3287700637.8.1770753131366; Tue, 10
 Feb 2026 11:52:11 -0800 (PST)
Date: Tue, 10 Feb 2026 11:52:09 -0800
In-Reply-To: <aYsOV7Q5FTWo+6/x@yzhao56-desk.sh.intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260129011517.3545883-1-seanjc@google.com> <20260129011517.3545883-9-seanjc@google.com>
 <aYMMHVvwDjZ7Lz9l@yzhao56-desk.sh.intel.com> <aYP_Ko3FGRriGXWR@google.com>
 <aYQtIK/Lq5T3ad6V@yzhao56-desk.sh.intel.com> <aYUarHf3KEwHGuJe@google.com>
 <aYVPN5M7QQwu/r/n@yzhao56-desk.sh.intel.com> <aYYn0nf2cayYu8e7@google.com> <aYsOV7Q5FTWo+6/x@yzhao56-desk.sh.intel.com>
Message-ID: <aYuMaRbVQyUfYJTP@google.com>
Subject: Re: [RFC PATCH v5 08/45] KVM: x86/mmu: Propagate mirror SPTE removal
 to S-EPT in handle_changed_spte()
From: Sean Christopherson <seanjc@google.com>
To: Yan Zhao <yan.y.zhao@intel.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Kiryl Shutsemau <kas@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, linux-kernel@vger.kernel.org, 
	linux-coco@lists.linux.dev, kvm@vger.kernel.org, 
	Kai Huang <kai.huang@intel.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	Vishal Annapurve <vannapurve@google.com>, Ackerley Tng <ackerleytng@google.com>, 
	Sagi Shahar <sagis@google.com>, Binbin Wu <binbin.wu@linux.intel.com>, 
	Xiaoyao Li <xiaoyao.li@intel.com>, Isaku Yamahata <isaku.yamahata@intel.com>
Content-Type: text/plain; charset="us-ascii"

On Tue, Feb 10, 2026, Yan Zhao wrote:
> On Fri, Feb 06, 2026 at 09:41:38AM -0800, Sean Christopherson wrote:
> > On Fri, Feb 06, 2026, Yan Zhao wrote:
> > @@ -559,30 +559,31 @@ static void handle_changed_spte(struct kvm *kvm, int as_id, tdp_ptep_t sptep,
> >  	 * SPTE being converted to a hugepage (leaf) or being zapped.  Shadow
> >  	 * pages are kernel allocations and should never be migrated.
> >  	 *
> > -	 * When modifying leaf entries in mirrored page tables, propagate the
> > -	 * changes to the external SPTE.  Bug the VM on failure, as callers
> > -	 * aren't prepared to handle errors, e.g. due to lock contention in the
> > -	 * TDX-Module.  Note, changes to non-leaf mirror SPTEs are handled by
> > -	 * handle_removed_pt() (the TDX-Module requires that child entries are
> > -	 * removed before the parent SPTE), and changes to non-present mirror
> > -	 * SPTEs are handled by __tdp_mmu_set_spte_atomic() (KVM needs to set
> > -	 * the external SPTE while the mirror SPTE is frozen so that installing
> > -	 * a new SPTE is effectively an atomic operation).
> > +	 * When modifying leaf entries in mirrored page tables, propagate all
> > +	 * changes to the external SPTE.
> >  	 */
> >  	if (was_present && !was_leaf &&
> >  	    (is_leaf || !is_present || WARN_ON_ONCE(pfn_changed)))
> >  		handle_removed_pt(kvm, spte_to_child_pt(old_spte, level), shared);
> > -	else if (was_leaf && is_mirror_sptep(sptep))
> > -		KVM_BUG_ON(kvm_x86_call(set_external_spte)(kvm, gfn, old_spte,
> > -							   new_spte, level), kvm);
> > +	else if (is_mirror_sptep(sptep))
> > +		return kvm_x86_call(set_external_spte)(kvm, gfn, old_spte,
> > +						       new_spte, level);
> For TDX's future implementation of set_external_spte() for split splitting,
> could we add a new param "bool shared" to op set_external_spte() in the
> future? i.e.,
> - when tdx_sept_split_private_spte() is invoked under write mmu_lock, it calls
>   tdh_do_no_vcpus() to retry BUSY error, and TDX_BUG_ON_2() then.
> - when tdx_sept_split_private_spte() is invoked under read mmu_lock
>   (in the future when calling tdh_mem_range_block() in unnecessary), it could
>   directly return BUSY to TDP MMU on contention.

Yeah, I have no objection to using @shared for things like that.

> > +	return 0;
> > +}
> > +
> > +static void handle_changed_spte(struct kvm *kvm, int as_id, tdp_ptep_t sptep,
> > +				gfn_t gfn, u64 old_spte, u64 new_spte,
> > +				int level, bool shared)
> > +{
> Do we need "WARN_ON_ONCE(is_mirror_sptep(sptep) && shared)" here ? 

No, because I want to call this code for all paths, including the fault path.

> > +	KVM_BUG_ON(__handle_changed_spte(kvm, as_id, sptep, gfn, old_spte,
> > +					 new_spte, level, shared), kvm);
> >  }
> 
> 
> 
> >  
> >  static inline int __must_check __tdp_mmu_set_spte_atomic(struct kvm *kvm,
> >  							 struct tdp_iter *iter,
> >  							 u64 new_spte)
> >  {
> > -	u64 *raw_sptep = rcu_dereference(iter->sptep);
> > -
> >  	/*
> >  	 * The caller is responsible for ensuring the old SPTE is not a FROZEN
> >  	 * SPTE.  KVM should never attempt to zap or manipulate a FROZEN SPTE,
> > @@ -591,40 +592,6 @@ static inline int __must_check __tdp_mmu_set_spte_atomic(struct kvm *kvm,
> >  	 */
> >  	WARN_ON_ONCE(iter->yielded || is_frozen_spte(iter->old_spte));
> >  
> > -	if (is_mirror_sptep(iter->sptep) && !is_frozen_spte(new_spte)) {
> > -		int ret;
> > -
> > -		/*
> > -		 * KVM doesn't currently support zapping or splitting mirror
> > -		 * SPTEs while holding mmu_lock for read.
> > -		 */
> > -		if (KVM_BUG_ON(is_shadow_present_pte(iter->old_spte), kvm) ||
> > -		    KVM_BUG_ON(!is_shadow_present_pte(new_spte), kvm))
> > -			return -EBUSY;
> > -
> > -		/*
> > -		 * Temporarily freeze the SPTE until the external PTE operation
> > -		 * has completed, e.g. so that concurrent faults don't attempt
> > -		 * to install a child PTE in the external page table before the
> > -		 * parent PTE has been written.
> > -		 */
> > -		if (!try_cmpxchg64(raw_sptep, &iter->old_spte, FROZEN_SPTE))
> > -			return -EBUSY;
> > -
> > -		/*
> > -		 * Update the external PTE.  On success, set the mirror SPTE to
> > -		 * the desired value.  On failure, restore the old SPTE so that
> > -		 * the SPTE isn't frozen in perpetuity.
> > -		 */
> > -		ret = kvm_x86_call(set_external_spte)(kvm, iter->gfn, iter->old_spte,
> > -						      new_spte, iter->level);
> > -		if (ret)
> > -			__kvm_tdp_mmu_write_spte(iter->sptep, iter->old_spte);
> > -		else
> > -			__kvm_tdp_mmu_write_spte(iter->sptep, new_spte);
> > -		return ret;
> > -	}
> > -
> >  	/*
> >  	 * Note, fast_pf_fix_direct_spte() can also modify TDP MMU SPTEs and
> >  	 * does not hold the mmu_lock.  On failure, i.e. if a different logical
> > @@ -632,7 +599,7 @@ static inline int __must_check __tdp_mmu_set_spte_atomic(struct kvm *kvm,
> >  	 * the current value, so the caller operates on fresh data, e.g. if it
> >  	 * retries tdp_mmu_set_spte_atomic()
> >  	 */
> > -	if (!try_cmpxchg64(raw_sptep, &iter->old_spte, new_spte))
> > +	if (!try_cmpxchg64(rcu_dereference(iter->sptep), &iter->old_spte, new_spte))
> >  		return -EBUSY;
> >  
> >  	return 0;
> > @@ -663,14 +630,44 @@ static inline int __must_check tdp_mmu_set_spte_atomic(struct kvm *kvm,
> >  
> >  	lockdep_assert_held_read(&kvm->mmu_lock);
> >  
> > -	ret = __tdp_mmu_set_spte_atomic(kvm, iter, new_spte);
> >
> > +	/* KVM should never freeze SPTEs using higher level APIs. */
> > +	KVM_MMU_WARN_ON(is_frozen_spte(new_spte));
> What about
> 	KVM_MMU_WARN_ON(is_frozen_spte(new_spte) ||
> 			is_frozen_spte(iter->old_spte) || iter->yielded);
> 
> > +	/*
> > +	  * Temporarily freeze the SPTE until the external PTE operation has
> > +	  * completed (unless the new SPTE itself will be frozen), e.g. so that
> > +	  * concurrent faults don't attempt to install a child PTE in the
> > +	  * external page table before the parent PTE has been written, or try
> > +	  * to re-install a page table before the old one was removed.
> > +	  */
> > +	if (is_mirror_sptep(iter->sptep))
> > +		ret = __tdp_mmu_set_spte_atomic(kvm, iter, FROZEN_SPTE);
> > +	else
> > +		ret = __tdp_mmu_set_spte_atomic(kvm, iter, new_spte);
> and invoking open code try_cmpxchg64() directly?

No, because __tdp_mmu_set_spte_atomic() is still used by kvm_tdp_mmu_age_spte(),
and the yielded/frozen rules apply there as well.

> > +	/*
> > +	 * Unfreeze the mirror SPTE.  If updating the external SPTE failed,
> > +	 * restore the old SPTE so that the SPTE isn't frozen in perpetuity,
> > +	 * otherwise set the mirror SPTE to the new desired value.
> > +	 */
> > +	if (is_mirror_sptep(iter->sptep)) {
> > +		if (ret)
> > +			__kvm_tdp_mmu_write_spte(iter->sptep, iter->old_spte);
> > +		else
> > +			__kvm_tdp_mmu_write_spte(iter->sptep, new_spte);
> > +	} else {
> > +		/*
> > +		 * Bug the VM if handling the change failed, as failure is only
> > +		 * allowed if KVM couldn't update the external SPTE.
> > +		 */
> > +		KVM_BUG_ON(ret, kvm);
> > +	}
> > +	return ret;
> >  }
> One concern for tdp_mmu_set_spte_atomic() to handle mirror SPTEs:
> - Previously
>   1. set *iter->sptep to FROZEN_SPTE.
>   2. kvm_x86_call(set_external_spte)(old_spte, new_spte)
>   3. set *iter->sptep to new_spte
> 
> - Now with this diff
>   1. set *iter->sptep to FROZEN_SPTE.
>   2. __handle_changed_spte()
>      --> kvm_x86_call(set_external_spte)(iter->sptep, old_spte, new_spte)

Note, iter->sptep isn't passed to set_external_spte(), the invocation for that is:

		return kvm_x86_call(set_external_spte)(kvm, gfn, old_spte,
						       new_spte, level);

>   3. set *iter->sptep to new_spte 
> 
>   what if __handle_changed_spte() reads *iter->sptep in step 2?

For the most part, "don't do that".  There are an infinite number of "what ifs".
I agree that re-reading iter->sptep is slightly more likely than other "what ifs",
but then if we convert to a boolean it creates the "what if we swap the order of
@as_id and @is_mirror_sp"?  Given that @old_spte is provided, IMO re-reading the
SPTE from memory will stand out.

That said, I think we can have the best of both worlds.  Rather than pass @as_id
and @sptep, pass the @sp, i.e. the owning kvm_mmu_page.  That would address your
concern about re-reading the sptep, without needing another boolean.

E.g. slotted in as a cleanup somewhere earlier:

---
 arch/x86/kvm/mmu/tdp_mmu.c | 29 +++++++++++++++--------------
 1 file changed, 15 insertions(+), 14 deletions(-)

diff --git a/arch/x86/kvm/mmu/tdp_mmu.c b/arch/x86/kvm/mmu/tdp_mmu.c
index 732548a678d8..d395da35d5e4 100644
--- a/arch/x86/kvm/mmu/tdp_mmu.c
+++ b/arch/x86/kvm/mmu/tdp_mmu.c
@@ -326,7 +326,7 @@ void kvm_tdp_mmu_alloc_root(struct kvm_vcpu *vcpu, bool mirror)
 	}
 }
 
-static void handle_changed_spte(struct kvm *kvm, int as_id, tdp_ptep_t sptep,
+static void handle_changed_spte(struct kvm *kvm, struct kvm_mmu_page *sp,
 				gfn_t gfn, u64 old_spte, u64 new_spte,
 				int level, bool shared);
 
@@ -458,8 +458,7 @@ static void handle_removed_pt(struct kvm *kvm, tdp_ptep_t pt, bool shared)
 			old_spte = kvm_tdp_mmu_write_spte(sptep, old_spte,
 							  FROZEN_SPTE, level);
 		}
-		handle_changed_spte(kvm, kvm_mmu_page_as_id(sp), sptep, gfn,
-				    old_spte, FROZEN_SPTE, level, shared);
+		handle_changed_spte(kvm, sp, gfn, old_spte, FROZEN_SPTE, level, shared);
 	}
 
 	if (is_mirror_sp(sp))
@@ -471,8 +470,7 @@ static void handle_removed_pt(struct kvm *kvm, tdp_ptep_t pt, bool shared)
 /**
  * __handle_changed_spte - handle bookkeeping associated with an SPTE change
  * @kvm: kvm instance
- * @as_id: the address space of the paging structure the SPTE was a part of
- * @sptep: pointer to the SPTE
+ * @sp: the page table in which the SPTE resides
  * @gfn: the base GFN that was mapped by the SPTE
  * @old_spte: The value of the SPTE before the change
  * @new_spte: The value of the SPTE after the change
@@ -485,7 +483,7 @@ static void handle_removed_pt(struct kvm *kvm, tdp_ptep_t pt, bool shared)
  * dirty logging updates are handled in common code, not here (see make_spte()
  * and fast_pf_fix_direct_spte()).
  */
-static int __handle_changed_spte(struct kvm *kvm, int as_id, tdp_ptep_t sptep,
+static int __handle_changed_spte(struct kvm *kvm, struct kvm_mmu_page *sp,
 				 gfn_t gfn, u64 old_spte, u64 new_spte,
 				 int level, bool shared)
 {
@@ -494,6 +492,7 @@ static int __handle_changed_spte(struct kvm *kvm, int as_id, tdp_ptep_t sptep,
 	bool was_leaf = was_present && is_last_spte(old_spte, level);
 	bool is_leaf = is_present && is_last_spte(new_spte, level);
 	bool pfn_changed = spte_to_pfn(old_spte) != spte_to_pfn(new_spte);
+	int as_id = kvm_mmu_page_as_id(sp);
 
 	WARN_ON_ONCE(level > PT64_ROOT_MAX_LEVEL);
 	WARN_ON_ONCE(level < PG_LEVEL_4K);
@@ -570,19 +569,19 @@ static int __handle_changed_spte(struct kvm *kvm, int as_id, tdp_ptep_t sptep,
 	if (was_present && !was_leaf &&
 	    (is_leaf || !is_present || WARN_ON_ONCE(pfn_changed)))
 		handle_removed_pt(kvm, spte_to_child_pt(old_spte, level), shared);
-	else if (is_mirror_sptep(sptep))
+	else if (is_mirror_sp(sp))
 		return kvm_x86_call(set_external_spte)(kvm, gfn, old_spte,
 						       new_spte, level);
 
 	return 0;
 }
 
-static void handle_changed_spte(struct kvm *kvm, int as_id, tdp_ptep_t sptep,
+static void handle_changed_spte(struct kvm *kvm, struct kvm_mmu_page *sp,
 				gfn_t gfn, u64 old_spte, u64 new_spte,
 				int level, bool shared)
 {
-	KVM_BUG_ON(__handle_changed_spte(kvm, as_id, sptep, gfn, old_spte,
-					 new_spte, level, shared), kvm);
+	KVM_BUG_ON(__handle_changed_spte(kvm, sp, gfn, old_spte, new_spte,
+					 level, shared), kvm);
 }
 
 static inline int __must_check __tdp_mmu_set_spte_atomic(struct kvm *kvm,
@@ -631,6 +630,7 @@ static inline int __must_check tdp_mmu_set_spte_atomic(struct kvm *kvm,
 						       struct tdp_iter *iter,
 						       u64 new_spte)
 {
+	struct kvm_mmu_page *sp = sptep_to_sp(rcu_dereference(iter->sptep));
 	int ret;
 
 	lockdep_assert_held_read(&kvm->mmu_lock);
@@ -652,8 +652,8 @@ static inline int __must_check tdp_mmu_set_spte_atomic(struct kvm *kvm,
 	if (ret)
 		return ret;
 
-	ret = __handle_changed_spte(kvm, iter->as_id, iter->sptep, iter->gfn,
-				    iter->old_spte, new_spte, iter->level, true);
+	ret = __handle_changed_spte(kvm, sp, iter->gfn, iter->old_spte,
+				    new_spte, iter->level, true);
 
 	/*
 	 * Unfreeze the mirror SPTE.  If updating the external SPTE failed,
@@ -678,7 +678,6 @@ static inline int __must_check tdp_mmu_set_spte_atomic(struct kvm *kvm,
 /*
  * tdp_mmu_set_spte - Set a TDP MMU SPTE and handle the associated bookkeeping
  * @kvm:	      KVM instance
- * @as_id:	      Address space ID, i.e. regular vs. SMM
  * @sptep:	      Pointer to the SPTE
  * @old_spte:	      The current value of the SPTE
  * @new_spte:	      The new value that will be set for the SPTE
@@ -691,6 +690,8 @@ static inline int __must_check tdp_mmu_set_spte_atomic(struct kvm *kvm,
 static u64 tdp_mmu_set_spte(struct kvm *kvm, int as_id, tdp_ptep_t sptep,
 			    u64 old_spte, u64 new_spte, gfn_t gfn, int level)
 {
+	struct kvm_mmu_page *sp = sptep_to_sp(rcu_dereference(sptep));
+
 	lockdep_assert_held_write(&kvm->mmu_lock);
 
 	/*
@@ -704,7 +705,7 @@ static u64 tdp_mmu_set_spte(struct kvm *kvm, int as_id, tdp_ptep_t sptep,
 
 	old_spte = kvm_tdp_mmu_write_spte(sptep, old_spte, new_spte, level);
 
-	handle_changed_spte(kvm, as_id, sptep, gfn, old_spte, new_spte, level, false);
+	handle_changed_spte(kvm, sp, gfn, old_spte, new_spte, level, false);
 
 	return old_spte;
 }

base-commit: f9d48449fbf9aff6cdced4703cdfdfc1d2e49efe
--

>   Passing in "bool is_mirror_sp" to __handle_changed_spte() instead?
