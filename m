Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FF81320CB1
	for <linux-coco@lists.linux.dev>; Thu, 29 Jan 2026 01:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769649342; cv=none; b=ZTy9wZf80FsZtV+UZyo/6LDLbUStE6fNjgX3bjzqIQYucP7y6bhKbANcvrQ+3ADOvypFrMtxs4YDAFAfAdGpYYS1eihjfKPVMUMZjh0+VmifvaPRLszfyjIsB9kxfdxql9MdH5VG0NygxfnYw63cygvsFKtmKoykzZkUu1pMWEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769649342; c=relaxed/simple;
	bh=52WHRYcBaF84cq4d9eTCRiZcdWMBb91+paCcx/t1GiQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=SP/oWnGAy8sOQDVUoAH9WcvgNVB81K2+VMRqQlMfjg4mcCpN+Nb4yLszpaab5xaTKAmLp6s31MuK+wQc9F1pyQWp3ttCSMfQPvgt+RbOaIsWR5YfDPNsX5c2mJspTE0MdnNDM4U2zZ1w+iG42KUpuDwMMAl3y5RR2Ta3BwhIngc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=327GmDe4; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="327GmDe4"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-29f1f69eec6so5189935ad.1
        for <linux-coco@lists.linux.dev>; Wed, 28 Jan 2026 17:15:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769649339; x=1770254139; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=34WkAZh0eO1zmQ97gxROYaaRFi2k1TsiQe3th+qNzkY=;
        b=327GmDe4PNCaNwAbDzRWXJgqIFZ2Kv81KnR4TazSS+ZKy5KGkH0yzo92EQlqq5Dpgq
         ADJRIx6M2RFCd+dMy6OGHl9lCIcmcZeruU8EXeC8Ch2CVQslEz01sJvfQFyAJmx0YxPE
         PD2CspFSnFzyJ4D/6sY//BOcNpzTy6lbrYIr9CYcOUpLVB9/Uxn7TfcGOty8eQhhZyIo
         B1e3NfjR9VWGEJSXi+H/CkyuG2zOd2JLP+pSbC06TPqGixH3i4rawczgZY/MkHt3/hSD
         i2rPgnmBWbdHYexmhJa18oyzvZRz08Z3/5hqXhgQk7BqDYkPkFPcJ3mMW/kLgkrRfBu/
         sw4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769649339; x=1770254139;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=34WkAZh0eO1zmQ97gxROYaaRFi2k1TsiQe3th+qNzkY=;
        b=KHFjMt6PP9+mWf/+IhkaqlUg6l6Zf6f139KOxvASFFreAvP2KBKBNe0hVgwkHuiuUx
         gYoQ8b/kOl4g/inivjD9mMToUEd7j8hv3yP0omfwiNQL/Eo+l0pLCd4YaVd8Ao8rPOtx
         ZPTY7p312XUHav3APTqQX1eJYQiIrWbyOREn4rqMnqDoJggKEFYXOKYz0Ml2zuq8ke/4
         1U1SHE2Re/LxYXdEVcQ89gUJoMj1oNo74e2R4KyHjQI/OEjo1IUvD8Ba/fuqjz6i5PMr
         yp3//5WIJqA04g7WsB9q0lmF+aHB66d8WiGkJ869kA/NAXH/dcJ3acPLUdtCm1jQRaSF
         SSkA==
X-Forwarded-Encrypted: i=1; AJvYcCUE0IOu8GcSZWwEBUQkj7JKMuYqkUgv6NJpGZfTdba/ua5GE+IJMC+i9Km0S4/SaCVqSP9BqdfNC03z@lists.linux.dev
X-Gm-Message-State: AOJu0YxD4uPhixLgEvxrnEviR47D5+EQh7HAX5kg2Yqkg6PluRV7UBBn
	LPLZi3THwrbzyp2Jxi4J+PNiHNisryvKRXPmIWK2bmsm7x/gSmZMMg0qj78qQCnktJ2050UbXXA
	BK/IW8w==
X-Received: from plnx1.prod.google.com ([2002:a17:902:8201:b0:2a0:f5f5:419d])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:dac4:b0:2a0:c5b8:24b0
 with SMTP id d9443c01a7336-2a870dd56edmr73393065ad.46.1769649338679; Wed, 28
 Jan 2026 17:15:38 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 28 Jan 2026 17:14:38 -0800
In-Reply-To: <20260129011517.3545883-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260129011517.3545883-1-seanjc@google.com>
X-Mailer: git-send-email 2.53.0.rc1.217.geba53bf80e-goog
Message-ID: <20260129011517.3545883-7-seanjc@google.com>
Subject: [RFC PATCH v5 06/45] KVM: x86/mmu: Fold set_external_spte_present()
 into its sole caller
From: Sean Christopherson <seanjc@google.com>
To: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Kiryl Shutsemau <kas@kernel.org>, Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev, 
	kvm@vger.kernel.org, Kai Huang <kai.huang@intel.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Yan Zhao <yan.y.zhao@intel.com>, 
	Vishal Annapurve <vannapurve@google.com>, Ackerley Tng <ackerleytng@google.com>, 
	Sagi Shahar <sagis@google.com>, Binbin Wu <binbin.wu@linux.intel.com>, 
	Xiaoyao Li <xiaoyao.li@intel.com>, Isaku Yamahata <isaku.yamahata@intel.com>
Content-Type: text/plain; charset="UTF-8"

Fold set_external_spte_present() into __tdp_mmu_set_spte_atomic() in
anticipation of supporting hugepage splitting, at which point other paths
will also set shadow-present external SPTEs.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/mmu/tdp_mmu.c | 82 +++++++++++++++++---------------------
 1 file changed, 36 insertions(+), 46 deletions(-)

diff --git a/arch/x86/kvm/mmu/tdp_mmu.c b/arch/x86/kvm/mmu/tdp_mmu.c
index 56ad056e6042..6fb48b217f5b 100644
--- a/arch/x86/kvm/mmu/tdp_mmu.c
+++ b/arch/x86/kvm/mmu/tdp_mmu.c
@@ -495,33 +495,6 @@ static void handle_removed_pt(struct kvm *kvm, tdp_ptep_t pt, bool shared)
 	call_rcu(&sp->rcu_head, tdp_mmu_free_sp_rcu_callback);
 }
 
-static int __must_check set_external_spte_present(struct kvm *kvm, tdp_ptep_t sptep,
-						 gfn_t gfn, u64 *old_spte,
-						 u64 new_spte, int level)
-{
-	int ret;
-
-	lockdep_assert_held(&kvm->mmu_lock);
-
-	if (KVM_BUG_ON(is_shadow_present_pte(*old_spte), kvm))
-		return -EIO;
-
-	/*
-	 * We need to lock out other updates to the SPTE until the external
-	 * page table has been modified. Use FROZEN_SPTE similar to
-	 * the zapping case.
-	 */
-	if (!try_cmpxchg64(rcu_dereference(sptep), old_spte, FROZEN_SPTE))
-		return -EBUSY;
-
-	ret = kvm_x86_call(set_external_spte)(kvm, gfn, level, new_spte);
-	if (ret)
-		__kvm_tdp_mmu_write_spte(sptep, *old_spte);
-	else
-		__kvm_tdp_mmu_write_spte(sptep, new_spte);
-	return ret;
-}
-
 /**
  * handle_changed_spte - handle bookkeeping associated with an SPTE change
  * @kvm: kvm instance
@@ -626,6 +599,8 @@ static inline int __must_check __tdp_mmu_set_spte_atomic(struct kvm *kvm,
 							 struct tdp_iter *iter,
 							 u64 new_spte)
 {
+	u64 *raw_sptep = rcu_dereference(iter->sptep);
+
 	/*
 	 * The caller is responsible for ensuring the old SPTE is not a FROZEN
 	 * SPTE.  KVM should never attempt to zap or manipulate a FROZEN SPTE,
@@ -638,31 +613,46 @@ static inline int __must_check __tdp_mmu_set_spte_atomic(struct kvm *kvm,
 		int ret;
 
 		/*
-		 * Users of atomic zapping don't operate on mirror roots,
-		 * so don't handle it and bug the VM if it's seen.
+		 * KVM doesn't currently support zapping or splitting mirror
+		 * SPTEs while holding mmu_lock for read.
 		 */
-		if (KVM_BUG_ON(!is_shadow_present_pte(new_spte), kvm))
+		if (KVM_BUG_ON(is_shadow_present_pte(iter->old_spte), kvm) ||
+		    KVM_BUG_ON(!is_shadow_present_pte(new_spte), kvm))
 			return -EBUSY;
 
-		ret = set_external_spte_present(kvm, iter->sptep, iter->gfn,
-						&iter->old_spte, new_spte, iter->level);
+		/*
+		 * Temporarily freeze the SPTE until the external PTE operation
+		 * has completed, e.g. so that concurrent faults don't attempt
+		 * to install a child PTE in the external page table before the
+		 * parent PTE has been written.
+		 */
+		if (!try_cmpxchg64(raw_sptep, &iter->old_spte, FROZEN_SPTE))
+			return -EBUSY;
+
+		/*
+		 * Update the external PTE.  On success, set the mirror SPTE to
+		 * the desired value.  On failure, restore the old SPTE so that
+		 * the SPTE isn't frozen in perpetuity.
+		 */
+		ret = kvm_x86_call(set_external_spte)(kvm, iter->gfn,
+						      iter->level, new_spte);
 		if (ret)
-			return ret;
-	} else {
-		u64 *sptep = rcu_dereference(iter->sptep);
-
-		/*
-		 * Note, fast_pf_fix_direct_spte() can also modify TDP MMU SPTEs
-		 * and does not hold the mmu_lock.  On failure, i.e. if a
-		 * different logical CPU modified the SPTE, try_cmpxchg64()
-		 * updates iter->old_spte with the current value, so the caller
-		 * operates on fresh data, e.g. if it retries
-		 * tdp_mmu_set_spte_atomic()
-		 */
-		if (!try_cmpxchg64(sptep, &iter->old_spte, new_spte))
-			return -EBUSY;
+			__kvm_tdp_mmu_write_spte(iter->sptep, iter->old_spte);
+		else
+			__kvm_tdp_mmu_write_spte(iter->sptep, new_spte);
+		return ret;
 	}
 
+	/*
+	 * Note, fast_pf_fix_direct_spte() can also modify TDP MMU SPTEs and
+	 * does not hold the mmu_lock.  On failure, i.e. if a different logical
+	 * CPU modified the SPTE, try_cmpxchg64() updates iter->old_spte with
+	 * the current value, so the caller operates on fresh data, e.g. if it
+	 * retries tdp_mmu_set_spte_atomic()
+	 */
+	if (!try_cmpxchg64(raw_sptep, &iter->old_spte, new_spte))
+		return -EBUSY;
+
 	return 0;
 }
 
-- 
2.53.0.rc1.217.geba53bf80e-goog

