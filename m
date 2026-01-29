Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C407036166F
	for <linux-coco@lists.linux.dev>; Thu, 29 Jan 2026 01:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769649389; cv=none; b=RSw/ogi81LuHiqFwC4UhYGGHDok9MPyBuiwpoVWPQQGl01G/hiY7hcqJ6jjsMTSeSAWFxxfciFE1ecSmIDiHuNXn+TLs6OQI+BhKuOwv3MOwblYXdfSYZVSyy5e9yI2s22XAtpsERUx1UBzsdIiv3TKl6fG36QZUTNy7tOdBYNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769649389; c=relaxed/simple;
	bh=MXrNqxIppqNsimK8K/2l7kp6YfDuyBgadcQDGD92Gkc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ZgrIouDDCa00+VTXFGEIJ9E0FbAMTeDd1aupVRL1fFMFoqXA3IcBRzULaWSwjxLE8yx9tRPFNjnUx/mnSoQjdS1NcXzFw3/hqxUo3Mj7r9mu5TXiRD7mTucKK84JdtVVczQPkk+/V89ykn87VuqOw8vCTGLcfsnEUGW4aLNuUFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=1HfGhzi7; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1HfGhzi7"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-34c66cb671fso315148a91.3
        for <linux-coco@lists.linux.dev>; Wed, 28 Jan 2026 17:16:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769649386; x=1770254186; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=XitJqErgB2rpX72/d+fDj8zwONic1fb7Um6zwnCWul0=;
        b=1HfGhzi7jMIyQAyoROUESj1AUs8W8C7lhfZ06olefqBK9iO+25K6Cix0AmfAVxzOsn
         bHnnaOdXiF2hTxAEeYmg3ADYSoMMIuBLUJvlyjfCsXGK8IdSIvn/SaFceqaygjghL5CH
         H8H36lzePIYmvp8pjUFNPYKHMpmQDGa645lCTmexy8OwZWs64S036fnWdVoRhUqSAkMU
         gbijYP3ZPRkKKMi/ZElHBBFiB9vRjSgHtDX9iLxKtmuq8Qo3N8zqwR2TAeT9EGAQ8o/M
         gVTWagJjx8KRofi8+jLJ253t6fu+Fcw1g58Xak7fb544DOOUnUu52m2ATAncgTzjfNqN
         Burg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769649386; x=1770254186;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XitJqErgB2rpX72/d+fDj8zwONic1fb7Um6zwnCWul0=;
        b=fVKIhbelSqvENavHCyvEb8hHPvtO2DDJYwRtm4fMBREa+O46kSNCZdmORzqoAaLT9u
         v6sh7gzLPlIXHH946JIJfRVdW8l/FxNc34aAEWuATB8Q8+yx69bqk4EKIUwR01v0cd4u
         m0bi6mIQZx4kDOiATDnK3IwBpyXcMjlS+ni4VR24/eXwjLAK5SyUpI4fIZi55nXIV6V/
         Gzj5K1f6xmsghbIMJm43Jcggb7sFySN4u8qQ5DFYuGIl+2x0ZQTod8zVouQAKfm/t57z
         w/vd7WcCOB6e/KCnY0fXJGZ1KTMHbfxCjd9NiPCrUFpjcwTl8FBV1+4NyLPEpQKc4p/Q
         5OKg==
X-Forwarded-Encrypted: i=1; AJvYcCXsT3LIQ6fIikJC3SW9hZzXDoNckCma8eTJqkMuatDaIHNmpN1kog+09qi1QOFxbdgDY/Dug+0K4qB7@lists.linux.dev
X-Gm-Message-State: AOJu0Yze9YazFKPGiKJXEQakwiAAbj93cchxWATGhouyeCWvIfKDBWgB
	jImc3IwGqsc+dV17qLYtIpPGf6A+EbYa/KdTsz9ci9y9DhofqW7wP8Iqk+Qq9T+KiI/BjuQg+qn
	Jz0S0qw==
X-Received: from pjbbf7.prod.google.com ([2002:a17:90b:b07:b0:34a:b3a0:78b9])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:538f:b0:34c:6108:bf32
 with SMTP id 98e67ed59e1d1-353fedb94b1mr6266892a91.34.1769649386237; Wed, 28
 Jan 2026 17:16:26 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 28 Jan 2026 17:15:03 -0800
In-Reply-To: <20260129011517.3545883-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260129011517.3545883-1-seanjc@google.com>
X-Mailer: git-send-email 2.53.0.rc1.217.geba53bf80e-goog
Message-ID: <20260129011517.3545883-32-seanjc@google.com>
Subject: [RFC PATCH v5 31/45] KVM: x86/mmu: Prevent hugepage promotion for
 mirror roots in fault path
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

From: Rick Edgecombe <rick.p.edgecombe@intel.com>

Disallow hugepage promotion in the TDP MMU for mirror roots as KVM doesn't
currently support promoting S-EPT entries due to the complexity incurred
by the TDX-Module's rules for hugepage promotion.

 - The current TDX-Module requires all 4KB leafs to be either all PENDING
   or all ACCEPTED before a successful promotion to 2MB. This requirement
   prevents successful page merging after partially converting a 2MB
   range from private to shared and then back to private, which is the
   primary scenario necessitating page promotion.

 - The TDX-Module effectively requires a break-before-make sequence (to
   satisfy its TLB flushing rules), i.e. creates a window of time where a
   different vCPU can encounter faults on a SPTE that KVM is trying to
   promote to a hugepage.  To avoid unexpected BUSY errors, KVM would need
   to FREEZE the non-leaf SPTE before replacing it with a huge SPTE.

Disable hugepage promotion for all map() operations, as supporting page
promotion when building the initial image is still non-trivial, and the
vast majority of images are ~4MB or less, i.e. the benefit of creating
hugepages during TD build time is minimal.

Signed-off-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
Co-developed-by: Yan Zhao <yan.y.zhao@intel.com>
Signed-off-by: Yan Zhao <yan.y.zhao@intel.com>
[sean: check root, add comment, rewrite changelog]
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/mmu/mmu.c     |  3 ++-
 arch/x86/kvm/mmu/tdp_mmu.c | 12 +++++++++++-
 2 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 4ecbf216d96f..45650f70eeab 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -3419,7 +3419,8 @@ void disallowed_hugepage_adjust(struct kvm_page_fault *fault, u64 spte, int cur_
 	    cur_level == fault->goal_level &&
 	    is_shadow_present_pte(spte) &&
 	    !is_large_pte(spte) &&
-	    spte_to_child_sp(spte)->nx_huge_page_disallowed) {
+	    ((spte_to_child_sp(spte)->nx_huge_page_disallowed) ||
+	     is_mirror_sp(spte_to_child_sp(spte)))) {
 		/*
 		 * A small SPTE exists for this pfn, but FNAME(fetch),
 		 * direct_map(), or kvm_tdp_mmu_map() would like to create a
diff --git a/arch/x86/kvm/mmu/tdp_mmu.c b/arch/x86/kvm/mmu/tdp_mmu.c
index 01e3e4f4baa5..f8ebdd0c6114 100644
--- a/arch/x86/kvm/mmu/tdp_mmu.c
+++ b/arch/x86/kvm/mmu/tdp_mmu.c
@@ -1222,7 +1222,17 @@ int kvm_tdp_mmu_map(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault)
 	for_each_tdp_pte(iter, kvm, root, fault->gfn, fault->gfn + 1) {
 		int r;
 
-		if (fault->nx_huge_page_workaround_enabled)
+		/*
+		 * Don't replace a page table (non-leaf) SPTE with a huge SPTE
+		 * (a.k.a. hugepage promotion) if the NX hugepage workaround is
+		 * enabled, as doing so will cause significant thrashing if one
+		 * or more leaf SPTEs needs to be executable.
+		 *
+		 * Disallow hugepage promotion for mirror roots as KVM doesn't
+		 * (yet) support promoting S-EPT entries while holding mmu_lock
+		 * for read (due to complexity induced by the TDX-Module APIs).
+		 */
+		if (fault->nx_huge_page_workaround_enabled || is_mirror_sp(root))
 			disallowed_hugepage_adjust(fault, iter.old_spte, iter.level);
 
 		/*
-- 
2.53.0.rc1.217.geba53bf80e-goog

