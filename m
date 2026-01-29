Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C189A22A1E1
	for <linux-coco@lists.linux.dev>; Thu, 29 Jan 2026 01:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769649345; cv=none; b=UNf4w7VPNWmb2eumV2VFkGRDDfIj1CaxrmQQfRy7K1qnJEK9hakMjO3pd5p02znYV5g4EcTz/o3A0GVoEkZuTSYtVSRK5Fvtc26T0EfApz3JAPMSjW86dGi8jhq9BEmiF0OuS/2jxUwJzszSieir+KHqz9ujAUbz9xeb3CPvRC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769649345; c=relaxed/simple;
	bh=u2c/NHbwd0lYBbUDVthgSs2By7odK2wgvzMf1mYm8nw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=oKvTVBZu1VtI0UDLuBLxcSGJUIAW1NrAOerFw2dK/U7I43jcM8aEScOcCYmsVGBvHPC98uD5uBm6QJhJpY/a5TLS/PTHa3PG7prrJ/R5XRi/Ew6pHTEr1mLfvU6zyfIz5tkrWuXlNNybJvjU7oPWN7WHLi+DXjatLHW2s2G2ENQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=iHl22MXZ; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="iHl22MXZ"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-c6187bdadcdso216023a12.0
        for <linux-coco@lists.linux.dev>; Wed, 28 Jan 2026 17:15:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769649341; x=1770254141; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=yG0aJZj9vYemOuZH1z1kqzk7rC62lJqsq0W3///tL/M=;
        b=iHl22MXZN/mrkvbHEzbyqzjIGhBHLlnr5N6bjaonWLaDCPhvCqou4lkqUw1JhBYTTm
         uekKsPmW44sAfKeDyv4/+ij6qUZ9wIAwKSkdze1Ix+CTokWOJZVghcZNQDTRC4m366EM
         L622WpKGJx6EhJJWU6w95maEZtlgJNPwOweZ2HBbIZAe4PfoA/JYm8YClDDsSLobKJAr
         hr4J5EkIyIVjPtBZhiluZ8hTBIL27ryOiocMc+E+r5rF2dBjb2FuVHLJqHK9YvSqNCTj
         ol/AXMDMQBAp8Kzeh2KjT7iNrwnR7piE8p2+VTwC6Vy1Knji30xizpm7wnVYFxlYoiha
         olsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769649341; x=1770254141;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yG0aJZj9vYemOuZH1z1kqzk7rC62lJqsq0W3///tL/M=;
        b=EQsi9LAJafZBFZkDpZm0p3faLvCosEGI1P7t8Z4RwxJwS8cOPeduSzgtrPfQXyCZ3v
         QWiQqXjMSJ0Y5wkoDUgBWFfp+IYZnZyKZQ4Z1UnoX0zlaXAks+ScobyMMbEnkCRWY6fT
         +Dp8xJnomfr4koOpc2QISGS0fRrjcGxSoL8ygftUMSIOAaDiN878++fS+j27/bBey4z3
         WIG1TIukDrI9r3C+dhHokqlQgGRx0pu0DgR5FiAsasVzdmwV7scwzFtTINM1Z6IUGt/8
         LZm1qKqD60SjgryJfJj4Np7bb06OjsHI5ICZBoqG0R6ZzAayzHvAkoL7fO+dDeDFgBQ8
         14OQ==
X-Forwarded-Encrypted: i=1; AJvYcCX7aO7x/RUtbppE6WmyR3Y4qIWawe82CjIQtEoJcdlGeI4fghdLVZCwHQ2Aw4pynYdSC/g+aFpAL8Te@lists.linux.dev
X-Gm-Message-State: AOJu0YzRHIJNg4mD030EU6xgjKB+MaDsA/2+Tb8okmzeiWAanK4Iu7EC
	UtJNCsi6hqEWyNZ6emIloRagTOzsttjtpsbZ3kM7+eKiikD3mcryQRgVW+jGjPmEc57Xu6EZRR4
	XSSp7tg==
X-Received: from pgbcq1.prod.google.com ([2002:a05:6a02:4081:b0:bc3:ac3:8769])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:a41:b0:389:94e1:25c1
 with SMTP id adf61e73a8af0-38ec658ba91mr6736564637.70.1769649340957; Wed, 28
 Jan 2026 17:15:40 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 28 Jan 2026 17:14:39 -0800
In-Reply-To: <20260129011517.3545883-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260129011517.3545883-1-seanjc@google.com>
X-Mailer: git-send-email 2.53.0.rc1.217.geba53bf80e-goog
Message-ID: <20260129011517.3545883-8-seanjc@google.com>
Subject: [RFC PATCH v5 07/45] KVM: x86/mmu: Plumb the SPTE _pointer_ into the
 TDP MMU's handle_changed_spte()
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

Plumb the SPTE pointer into handle_changed_spte() so that remove leaf
mirror entries can be forwarded to TDX in handle_changed_spte(), instead
of effectively requiring callers to manually do so.  Relying on each
caller to invoke .remove_external_spte() is confusing and brittle, e.g.
subtly relies tdp_mmu_set_spte_atomic() never removing SPTEs.  This will
also allow consolidating all S-EPT updates into a single kvm_x86_ops hook.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/mmu/tdp_mmu.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/arch/x86/kvm/mmu/tdp_mmu.c b/arch/x86/kvm/mmu/tdp_mmu.c
index 6fb48b217f5b..8743cd020d12 100644
--- a/arch/x86/kvm/mmu/tdp_mmu.c
+++ b/arch/x86/kvm/mmu/tdp_mmu.c
@@ -320,9 +320,9 @@ void kvm_tdp_mmu_alloc_root(struct kvm_vcpu *vcpu, bool mirror)
 	}
 }
 
-static void handle_changed_spte(struct kvm *kvm, int as_id, gfn_t gfn,
-				u64 old_spte, u64 new_spte, int level,
-				bool shared);
+static void handle_changed_spte(struct kvm *kvm, int as_id, tdp_ptep_t sptep,
+				gfn_t gfn, u64 old_spte, u64 new_spte,
+				int level, bool shared);
 
 static void tdp_account_mmu_page(struct kvm *kvm, struct kvm_mmu_page *sp)
 {
@@ -471,7 +471,7 @@ static void handle_removed_pt(struct kvm *kvm, tdp_ptep_t pt, bool shared)
 			old_spte = kvm_tdp_mmu_write_spte(sptep, old_spte,
 							  FROZEN_SPTE, level);
 		}
-		handle_changed_spte(kvm, kvm_mmu_page_as_id(sp), gfn,
+		handle_changed_spte(kvm, kvm_mmu_page_as_id(sp), sptep, gfn,
 				    old_spte, FROZEN_SPTE, level, shared);
 
 		if (is_mirror_sp(sp)) {
@@ -499,6 +499,7 @@ static void handle_removed_pt(struct kvm *kvm, tdp_ptep_t pt, bool shared)
  * handle_changed_spte - handle bookkeeping associated with an SPTE change
  * @kvm: kvm instance
  * @as_id: the address space of the paging structure the SPTE was a part of
+ * @sptep: pointer to the SPTE
  * @gfn: the base GFN that was mapped by the SPTE
  * @old_spte: The value of the SPTE before the change
  * @new_spte: The value of the SPTE after the change
@@ -511,9 +512,9 @@ static void handle_removed_pt(struct kvm *kvm, tdp_ptep_t pt, bool shared)
  * dirty logging updates are handled in common code, not here (see make_spte()
  * and fast_pf_fix_direct_spte()).
  */
-static void handle_changed_spte(struct kvm *kvm, int as_id, gfn_t gfn,
-				u64 old_spte, u64 new_spte, int level,
-				bool shared)
+static void handle_changed_spte(struct kvm *kvm, int as_id, tdp_ptep_t sptep,
+				gfn_t gfn, u64 old_spte, u64 new_spte,
+				int level, bool shared)
 {
 	bool was_present = is_shadow_present_pte(old_spte);
 	bool is_present = is_shadow_present_pte(new_spte);
@@ -685,8 +686,8 @@ static inline int __must_check tdp_mmu_set_spte_atomic(struct kvm *kvm,
 	if (ret)
 		return ret;
 
-	handle_changed_spte(kvm, iter->as_id, iter->gfn, iter->old_spte,
-			    new_spte, iter->level, true);
+	handle_changed_spte(kvm, iter->as_id, iter->sptep, iter->gfn,
+			    iter->old_spte, new_spte, iter->level, true);
 
 	return 0;
 }
@@ -720,7 +721,7 @@ static u64 tdp_mmu_set_spte(struct kvm *kvm, int as_id, tdp_ptep_t sptep,
 
 	old_spte = kvm_tdp_mmu_write_spte(sptep, old_spte, new_spte, level);
 
-	handle_changed_spte(kvm, as_id, gfn, old_spte, new_spte, level, false);
+	handle_changed_spte(kvm, as_id, sptep, gfn, old_spte, new_spte, level, false);
 
 	/*
 	 * Users that do non-atomic setting of PTEs don't operate on mirror
-- 
2.53.0.rc1.217.geba53bf80e-goog

