Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82AFF31AA81
	for <linux-coco@lists.linux.dev>; Thu, 29 Jan 2026 01:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769649334; cv=none; b=o6NH+uZmO2Mo24jHoNCF3aLiOXzcixbcX/oKNTAsU/ufBenzJWHuW0VEDvIb8CtivvhZfWs3dkIjdyTW/R+IWNXk9UTp0O9lg+Kk0d9VtqUDtdSoFEujkQ/nQObkJK0EDL8IModfunbb2ADwOA9TdrrHD7SzoG35+gnUaognZE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769649334; c=relaxed/simple;
	bh=512/K9zz3Etgfo/Gtt/+uJuzjMDLWxSOVrO3dn//dXQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=fhlogGomcbGBAc8Y4Ya0YK4d+EW6w0eLN6SRtvDGaxaEf6Lov7T7CqwCyl+6xvz/aBi4vcGpXH0bDUe8I7xUeAB4eknxj6p4xXsMxl5Ihe1+Br6BraDDKsmCIcySWhnf7LlVE8x5GFrATkVHAeTjsh/vvgRtLrdqc54GXDcgc5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=3ZDA8yKf; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3ZDA8yKf"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-b62da7602a0so305039a12.2
        for <linux-coco@lists.linux.dev>; Wed, 28 Jan 2026 17:15:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769649332; x=1770254132; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=oJpdJVSHcQzV+/GX2rfzmObrBzUwVa1amlSsrvCn9LM=;
        b=3ZDA8yKfmDYnwPlDc3Fs13pewLePydoWK8zvZ4RjPuER4SOcEaiej2ceMLrn7X4foG
         dlnSkHSwyRS5ASbvswpKKyJltT9gZzR2w6ryjMOn2d3pOsz4UkHPoOafzy2xMgqfJ2T5
         fDIs2n7fx7ZfncDab7GaIc9be9g5+QvSbXpUDTFvAIIAkaFvYi8KbJi/qEqeLspDPDAr
         XPUNZxfILeDP5salBXg7Vn+Z7HeG/N1dDUpDUQEZlemjHMICEmXi/JYoJwq25wt5DVEy
         d4NhHYCQXCwTYfrMlJbxR8MkD41WxIytVy4gUBPtBvce1dfWX1ONRPP4LimKwNFU1bOm
         oa4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769649332; x=1770254132;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oJpdJVSHcQzV+/GX2rfzmObrBzUwVa1amlSsrvCn9LM=;
        b=eQeptK3O8X00Y45/JuaLDMsA8dKdu7KVLb+n+HK6a6ueTVYQiZ5FZgi2KZciQHzhE6
         H8NfEvR3cZOus9Lr9hoDeDWlVvZFEKEYb9JuZM/TRmXFrT7WXmLefbXASK9M8mHWt+5H
         H4QYyOpt9gowHaR+JavGunVijbQ+clzy9T12fd4+8fB1iDkhbLpus72E4hjWrX6LDLNq
         xGg0m4fGbN5lrDZy/5KwY0sejASdgB/xA1v/ZHWf//TwTIexcdrAUN9GMPF9v31NJwFJ
         vA9cPKQecUTEDYYG51ih6HrN/huqkIu5ntpZXCjRhheN3oKp+bdDcaicJfUVCINAZVJO
         Hlbg==
X-Forwarded-Encrypted: i=1; AJvYcCVU4JKrhFO7Mheo3KsWcJFzYwqdz+rlcDAO0kOWemad5iC5jsKQPdeVsvVFWmkLv1lL/BV/wl2DR7iN@lists.linux.dev
X-Gm-Message-State: AOJu0Yx5r0QmyKkXdYy3lfbe8kn4F40z/s/5lyA0fEBL4AWG3CAbe4y9
	FcjDGoNq6cGukjVmEdHbv9hUkpKQwqvJOAirRl4Vzs/WYm1/8pkiJj0kf6n4Ebwl3wWfPDKNflc
	x1GiW5A==
X-Received: from pgbdk12.prod.google.com ([2002:a05:6a02:c8c:b0:c63:3c6b:9ab6])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:32a6:b0:366:1de8:62dc
 with SMTP id adf61e73a8af0-38ec627bccbmr6327229637.8.1769649331636; Wed, 28
 Jan 2026 17:15:31 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 28 Jan 2026 17:14:34 -0800
In-Reply-To: <20260129011517.3545883-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260129011517.3545883-1-seanjc@google.com>
X-Mailer: git-send-email 2.53.0.rc1.217.geba53bf80e-goog
Message-ID: <20260129011517.3545883-3-seanjc@google.com>
Subject: [RFC PATCH v5 02/45] KVM: x86/mmu: Update iter->old_spte if cmpxchg64
 on mirror SPTE "fails"
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

Pass a pointer to iter->old_spte, not simply its value, when setting an
external SPTE in __tdp_mmu_set_spte_atomic(), so that the iterator's value
will be updated if the cmpxchg64 to freeze the mirror SPTE fails.  The bug
is currently benign as TDX is mutualy exclusive with all paths that do
"local" retry", e.g. clear_dirty_gfn_range() and wrprot_gfn_range().

Fixes: 77ac7079e66d ("KVM: x86/tdp_mmu: Propagate building mirror page tables")
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/mmu/tdp_mmu.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/x86/kvm/mmu/tdp_mmu.c b/arch/x86/kvm/mmu/tdp_mmu.c
index 9c26038f6b77..0feda295859a 100644
--- a/arch/x86/kvm/mmu/tdp_mmu.c
+++ b/arch/x86/kvm/mmu/tdp_mmu.c
@@ -509,10 +509,10 @@ static void *get_external_spt(gfn_t gfn, u64 new_spte, int level)
 }
 
 static int __must_check set_external_spte_present(struct kvm *kvm, tdp_ptep_t sptep,
-						 gfn_t gfn, u64 old_spte,
+						 gfn_t gfn, u64 *old_spte,
 						 u64 new_spte, int level)
 {
-	bool was_present = is_shadow_present_pte(old_spte);
+	bool was_present = is_shadow_present_pte(*old_spte);
 	bool is_present = is_shadow_present_pte(new_spte);
 	bool is_leaf = is_present && is_last_spte(new_spte, level);
 	int ret = 0;
@@ -525,7 +525,7 @@ static int __must_check set_external_spte_present(struct kvm *kvm, tdp_ptep_t sp
 	 * page table has been modified. Use FROZEN_SPTE similar to
 	 * the zapping case.
 	 */
-	if (!try_cmpxchg64(rcu_dereference(sptep), &old_spte, FROZEN_SPTE))
+	if (!try_cmpxchg64(rcu_dereference(sptep), old_spte, FROZEN_SPTE))
 		return -EBUSY;
 
 	/*
@@ -541,7 +541,7 @@ static int __must_check set_external_spte_present(struct kvm *kvm, tdp_ptep_t sp
 		ret = kvm_x86_call(link_external_spt)(kvm, gfn, level, external_spt);
 	}
 	if (ret)
-		__kvm_tdp_mmu_write_spte(sptep, old_spte);
+		__kvm_tdp_mmu_write_spte(sptep, *old_spte);
 	else
 		__kvm_tdp_mmu_write_spte(sptep, new_spte);
 	return ret;
@@ -670,7 +670,7 @@ static inline int __must_check __tdp_mmu_set_spte_atomic(struct kvm *kvm,
 			return -EBUSY;
 
 		ret = set_external_spte_present(kvm, iter->sptep, iter->gfn,
-						iter->old_spte, new_spte, iter->level);
+						&iter->old_spte, new_spte, iter->level);
 		if (ret)
 			return ret;
 	} else {
-- 
2.53.0.rc1.217.geba53bf80e-goog

