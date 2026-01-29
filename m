Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D88D364EA9
	for <linux-coco@lists.linux.dev>; Thu, 29 Jan 2026 01:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769649393; cv=none; b=IzMzHHEAfGw7yGnRePsw8563/VwBg1tQZX1m1M6ah6ZCJO6GWKFJ3I5AvDjhkC9inUvC7tiRM/yrWuxqfuKStPiZwAbX9n141qm/abcRpHx/fDT4SEhQNynPu7hdOfryGYPmiIxznigvHLgCfzOg/enRXErH8B4yXlhlg9adPBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769649393; c=relaxed/simple;
	bh=KvOn9sdpHKW3QH4/pQ+ztFzBdmExEpDhGv9YuGKPiRo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=JN9OCokPa00KyLxFAiAmlF0FL6yzmu6dRcuwqSPPOD6iqVtbWr8ZPii+ffQdv/uL6cnl4iVwYErqtQZ8Q2whlItV0SdXB569vbEuc75jF8bcYr49hkOfhOXz+TQXx3iPmMoMSwROxmkzM0XHeMHz7a2noybrGV5zi4emsj8//0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tT1MlTfF; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tT1MlTfF"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-8234ea73bdeso532122b3a.0
        for <linux-coco@lists.linux.dev>; Wed, 28 Jan 2026 17:16:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769649391; x=1770254191; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=czjQrUOc/hIkSrdYFZVTFF/3UmFL9ujoJHiw3Kb4R7I=;
        b=tT1MlTfFLbW4L4387AC5/fVhW3Oic92tG3hWh709H7Mv4rZU8aeazIvDKqOsRubEn5
         9H7X4DSnOg8zJUi4S3R7jgj1oMYAaGu6FzAHBvyZl0min7V4+4TRaQmPtk/yRJMWswtQ
         +tLeIckB789uo/dPP8xrhWBzslii3mGDvnXFfaPLUuewKpeGVI/D+CIrjfxXRPAYqgN6
         Yw52E9TgqFRWwm5Kc+JnUOJRS/4fyTJBxiAWHrXE8jm+Ar2obpCcdUGEUtW0bPrLIbQx
         MdHc9YmObkSscoFBJKO2sY3nP6ft5A31kiS0eAXwOlFjvg3cOS6//eOJqT7chO/TQvJL
         cypw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769649391; x=1770254191;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=czjQrUOc/hIkSrdYFZVTFF/3UmFL9ujoJHiw3Kb4R7I=;
        b=Zz/WwuUmXsUpqfIh7y6RHX3BtXjjWb2PDXZqWuU9B1QV3h0WBcOhMfRXlrm+xrEArn
         tyrMpfUYoSs4r6BsRZuQijNxjw9PpwCSNVTKj/SHbVBp6Pc1hVrKGYU2x4I3QblWkAz8
         R/Gl6qFoVMcei6Fj0djfx8iE9xFvzpGwkbDRBXuGBA4ZH8kMMNaE+bwaQOljsw1L+4y/
         OlaSwlVWOkGpq4pDcIqZYC/nj2QkNhhMV6q0iIRs9hNV3Wn4ElGC6NlMaAwYWGLssY5n
         wcWGl0nn4hFHpOKQsWHMxLrtammWpgsGipyOWxXFH7Qm0Hel+nFpROGKOpoj/WyrUbkh
         xedg==
X-Forwarded-Encrypted: i=1; AJvYcCVDox5MNjjaZl6IcifKiNsFYD8Cj7qfFO9h13Iw/+c9GYuxowQnsEMO+4+RmSGg7kHKwCg2DzlfhM3o@lists.linux.dev
X-Gm-Message-State: AOJu0YxGSwDSoyQ6TvLxA7RFwE+/EVMOSCSns8gUIA2sToydJ1FPzGwq
	RVW6ASosvNac1kinWkafKzn5X9WDyabDlzFaRLcH66wqmT5vqJqrP71oWaFbLrr1cvAdZ/eCsxU
	uiYSOvw==
X-Received: from pfiu8.prod.google.com ([2002:a05:6a00:1248:b0:7cf:2dad:ff87])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:6088:b0:81f:997e:59a0
 with SMTP id d2e1a72fcca58-823692fd850mr7473991b3a.64.1769649390925; Wed, 28
 Jan 2026 17:16:30 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 28 Jan 2026 17:15:05 -0800
In-Reply-To: <20260129011517.3545883-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260129011517.3545883-1-seanjc@google.com>
X-Mailer: git-send-email 2.53.0.rc1.217.geba53bf80e-goog
Message-ID: <20260129011517.3545883-34-seanjc@google.com>
Subject: [RFC PATCH v5 33/45] KVM: TDX: Hoist tdx_sept_remove_private_spte()
 above set_private_spte()
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

Move tdx_sept_remove_private_spte() (and its tdx_track() helper) above
tdx_sept_set_private_spte() in anticipation of routing all non-atomic
S-EPT writes (with the exception of reclaiming non-leaf pages) through
the "set" API.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/tdx.c | 194 ++++++++++++++++++++---------------------
 1 file changed, 97 insertions(+), 97 deletions(-)

diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
index e451acdb0978..0f3d27699a3d 100644
--- a/arch/x86/kvm/vmx/tdx.c
+++ b/arch/x86/kvm/vmx/tdx.c
@@ -1670,6 +1670,52 @@ static int tdx_mem_page_aug(struct kvm *kvm, gfn_t gfn,
 	return 0;
 }
 
+/*
+ * Ensure shared and private EPTs to be flushed on all vCPUs.
+ * tdh_mem_track() is the only caller that increases TD epoch. An increase in
+ * the TD epoch (e.g., to value "N + 1") is successful only if no vCPUs are
+ * running in guest mode with the value "N - 1".
+ *
+ * A successful execution of tdh_mem_track() ensures that vCPUs can only run in
+ * guest mode with TD epoch value "N" if no TD exit occurs after the TD epoch
+ * being increased to "N + 1".
+ *
+ * Kicking off all vCPUs after that further results in no vCPUs can run in guest
+ * mode with TD epoch value "N", which unblocks the next tdh_mem_track() (e.g.
+ * to increase TD epoch to "N + 2").
+ *
+ * TDX module will flush EPT on the next TD enter and make vCPUs to run in
+ * guest mode with TD epoch value "N + 1".
+ *
+ * kvm_make_all_cpus_request() guarantees all vCPUs are out of guest mode by
+ * waiting empty IPI handler ack_kick().
+ *
+ * No action is required to the vCPUs being kicked off since the kicking off
+ * occurs certainly after TD epoch increment and before the next
+ * tdh_mem_track().
+ */
+static void tdx_track(struct kvm *kvm)
+{
+	struct kvm_tdx *kvm_tdx = to_kvm_tdx(kvm);
+	u64 err;
+
+	/* If TD isn't finalized, it's before any vcpu running. */
+	if (unlikely(kvm_tdx->state != TD_STATE_RUNNABLE))
+		return;
+
+	/*
+	 * The full sequence of TDH.MEM.TRACK and forcing vCPUs out of guest
+	 * mode must be serialized, as TDH.MEM.TRACK will fail if the previous
+	 * tracking epoch hasn't completed.
+	 */
+	lockdep_assert_held_write(&kvm->mmu_lock);
+
+	err = tdh_do_no_vcpus(tdh_mem_track, kvm, &kvm_tdx->td);
+	TDX_BUG_ON(err, TDH_MEM_TRACK, kvm);
+
+	kvm_make_all_cpus_request(kvm, KVM_REQ_OUTSIDE_GUEST_MODE);
+}
+
 static struct page *tdx_spte_to_external_spt(struct kvm *kvm, gfn_t gfn,
 					     u64 new_spte, enum pg_level level)
 {
@@ -1705,6 +1751,57 @@ static int tdx_sept_link_private_spt(struct kvm *kvm, gfn_t gfn,
 	return 0;
 }
 
+static void tdx_sept_remove_private_spte(struct kvm *kvm, gfn_t gfn,
+					 enum pg_level level, u64 mirror_spte)
+{
+	struct kvm_tdx *kvm_tdx = to_kvm_tdx(kvm);
+	kvm_pfn_t pfn = spte_to_pfn(mirror_spte);
+	gpa_t gpa = gfn_to_gpa(gfn);
+	u64 err, entry, level_state;
+
+	lockdep_assert_held_write(&kvm->mmu_lock);
+
+	/*
+	 * HKID is released after all private pages have been removed, and set
+	 * before any might be populated. Warn if zapping is attempted when
+	 * there can't be anything populated in the private EPT.
+	 */
+	if (KVM_BUG_ON(!is_hkid_assigned(to_kvm_tdx(kvm)), kvm))
+		return;
+
+	/* TODO: handle large pages. */
+	if (KVM_BUG_ON(level != PG_LEVEL_4K, kvm))
+		return;
+
+	err = tdh_do_no_vcpus(tdh_mem_range_block, kvm, &kvm_tdx->td, gpa,
+			      level, &entry, &level_state);
+	if (TDX_BUG_ON_2(err, TDH_MEM_RANGE_BLOCK, entry, level_state, kvm))
+		return;
+
+	/*
+	 * TDX requires TLB tracking before dropping private page.  Do
+	 * it here, although it is also done later.
+	 */
+	tdx_track(kvm);
+
+	/*
+	 * When zapping private page, write lock is held. So no race condition
+	 * with other vcpu sept operation.
+	 * Race with TDH.VP.ENTER due to (0-step mitigation) and Guest TDCALLs.
+	 */
+	err = tdh_do_no_vcpus(tdh_mem_page_remove, kvm, &kvm_tdx->td, gpa,
+			      level, &entry, &level_state);
+	if (TDX_BUG_ON_2(err, TDH_MEM_PAGE_REMOVE, entry, level_state, kvm))
+		return;
+
+	err = tdh_phymem_page_wbinvd_hkid((u16)kvm_tdx->hkid, pfn, level);
+	if (TDX_BUG_ON(err, TDH_PHYMEM_PAGE_WBINVD, kvm))
+		return;
+
+	__tdx_quirk_reset_page(pfn, level);
+	tdx_pamt_put(pfn, level);
+}
+
 static int tdx_sept_set_private_spte(struct kvm *kvm, gfn_t gfn, u64 old_spte,
 				     u64 new_spte, enum pg_level level)
 {
@@ -1756,52 +1853,6 @@ static int tdx_sept_set_private_spte(struct kvm *kvm, gfn_t gfn, u64 old_spte,
 	return ret;
 }
 
-/*
- * Ensure shared and private EPTs to be flushed on all vCPUs.
- * tdh_mem_track() is the only caller that increases TD epoch. An increase in
- * the TD epoch (e.g., to value "N + 1") is successful only if no vCPUs are
- * running in guest mode with the value "N - 1".
- *
- * A successful execution of tdh_mem_track() ensures that vCPUs can only run in
- * guest mode with TD epoch value "N" if no TD exit occurs after the TD epoch
- * being increased to "N + 1".
- *
- * Kicking off all vCPUs after that further results in no vCPUs can run in guest
- * mode with TD epoch value "N", which unblocks the next tdh_mem_track() (e.g.
- * to increase TD epoch to "N + 2").
- *
- * TDX module will flush EPT on the next TD enter and make vCPUs to run in
- * guest mode with TD epoch value "N + 1".
- *
- * kvm_make_all_cpus_request() guarantees all vCPUs are out of guest mode by
- * waiting empty IPI handler ack_kick().
- *
- * No action is required to the vCPUs being kicked off since the kicking off
- * occurs certainly after TD epoch increment and before the next
- * tdh_mem_track().
- */
-static void tdx_track(struct kvm *kvm)
-{
-	struct kvm_tdx *kvm_tdx = to_kvm_tdx(kvm);
-	u64 err;
-
-	/* If TD isn't finalized, it's before any vcpu running. */
-	if (unlikely(kvm_tdx->state != TD_STATE_RUNNABLE))
-		return;
-
-	/*
-	 * The full sequence of TDH.MEM.TRACK and forcing vCPUs out of guest
-	 * mode must be serialized, as TDH.MEM.TRACK will fail if the previous
-	 * tracking epoch hasn't completed.
-	 */
-	lockdep_assert_held_write(&kvm->mmu_lock);
-
-	err = tdh_do_no_vcpus(tdh_mem_track, kvm, &kvm_tdx->td);
-	TDX_BUG_ON(err, TDH_MEM_TRACK, kvm);
-
-	kvm_make_all_cpus_request(kvm, KVM_REQ_OUTSIDE_GUEST_MODE);
-}
-
 static void tdx_sept_reclaim_private_sp(struct kvm *kvm, gfn_t gfn,
 					struct kvm_mmu_page *sp)
 {
@@ -1824,57 +1875,6 @@ static void tdx_sept_reclaim_private_sp(struct kvm *kvm, gfn_t gfn,
 		sp->external_spt = NULL;
 }
 
-static void tdx_sept_remove_private_spte(struct kvm *kvm, gfn_t gfn,
-					 enum pg_level level, u64 mirror_spte)
-{
-	struct kvm_tdx *kvm_tdx = to_kvm_tdx(kvm);
-	kvm_pfn_t pfn = spte_to_pfn(mirror_spte);
-	gpa_t gpa = gfn_to_gpa(gfn);
-	u64 err, entry, level_state;
-
-	lockdep_assert_held_write(&kvm->mmu_lock);
-
-	/*
-	 * HKID is released after all private pages have been removed, and set
-	 * before any might be populated. Warn if zapping is attempted when
-	 * there can't be anything populated in the private EPT.
-	 */
-	if (KVM_BUG_ON(!is_hkid_assigned(to_kvm_tdx(kvm)), kvm))
-		return;
-
-	/* TODO: handle large pages. */
-	if (KVM_BUG_ON(level != PG_LEVEL_4K, kvm))
-		return;
-
-	err = tdh_do_no_vcpus(tdh_mem_range_block, kvm, &kvm_tdx->td, gpa,
-			      level, &entry, &level_state);
-	if (TDX_BUG_ON_2(err, TDH_MEM_RANGE_BLOCK, entry, level_state, kvm))
-		return;
-
-	/*
-	 * TDX requires TLB tracking before dropping private page.  Do
-	 * it here, although it is also done later.
-	 */
-	tdx_track(kvm);
-
-	/*
-	 * When zapping private page, write lock is held. So no race condition
-	 * with other vcpu sept operation.
-	 * Race with TDH.VP.ENTER due to (0-step mitigation) and Guest TDCALLs.
-	 */
-	err = tdh_do_no_vcpus(tdh_mem_page_remove, kvm, &kvm_tdx->td, gpa,
-			      level, &entry, &level_state);
-	if (TDX_BUG_ON_2(err, TDH_MEM_PAGE_REMOVE, entry, level_state, kvm))
-		return;
-
-	err = tdh_phymem_page_wbinvd_hkid((u16)kvm_tdx->hkid, pfn, level);
-	if (TDX_BUG_ON(err, TDH_PHYMEM_PAGE_WBINVD, kvm))
-		return;
-
-	__tdx_quirk_reset_page(pfn, level);
-	tdx_pamt_put(pfn, level);
-}
-
 void tdx_deliver_interrupt(struct kvm_lapic *apic, int delivery_mode,
 			   int trig_mode, int vector)
 {
-- 
2.53.0.rc1.217.geba53bf80e-goog

