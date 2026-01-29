Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C416036CDF4
	for <linux-coco@lists.linux.dev>; Thu, 29 Jan 2026 01:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769649399; cv=none; b=WF7y6g0u72vPD2bRV3HNtH/2d8d8HlGUGWB0RPAKzInglLcwj29dfq2MYTR81IGv43HZF3GbLSCMxKZnh5qb6BIX0DTfijydOUFZZA9ygn9Djw2DnEL6OQvSrHF6h6zqDi5yAtnfu6ty3eg5SH9ivrR4wLzfDsw5WTd5rUP4jBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769649399; c=relaxed/simple;
	bh=ZA7lO6Iqcxv2nIH6jvLo0wih4TGT7nAoCV3mCXKZU8Q=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Aa9TFSaOYR1M4dDXyWnrMHTlY4lf65jISUZljtdTmaPT2M6AQlukeBs3HHJ2eO4CsX2PMnO8pjw9nsfscDL56W94qJ+7aSzgmkdZh63PfgqL/NjpxriHv+rGyS16Wdfokbq5KHdcoeYCTF2glu1cMlplUwFP8rRoQSqDAFnTHJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=S9D48/jh; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="S9D48/jh"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-bce224720d8so250169a12.1
        for <linux-coco@lists.linux.dev>; Wed, 28 Jan 2026 17:16:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769649396; x=1770254196; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=yjclvkjmE1zw/GHq/jW5Y/EQUpO3A2fBpqR5d3bbX+8=;
        b=S9D48/jhpB867CDklE2C5p9ltOzVA7DbGCOo7WRifReAYHyZFIeh3F13enD2E6KO8+
         N8K/OqAQemsadtXr2B9Vhk09EL8JK76F4RKqvPOUvW4pv1ZeieihDRU6RSFZTHZC00C6
         JG4mmCLcv/SsPBJQE3pNVk8nWarRG6ZcA423vBfj/vSQaqfCFKw57Bne9sAgXAMD4b3F
         R2gIBSqVwRa4xEjUWdQ4jx0g6C8c+BR9ABwBkh4Wp4w8cqog4zpwexwGiEp0DLzDERsd
         4AO+epsZxNx3fqQYAJRNOdTbRurlRn6P+aABZs1+t7wKcghc1toeKfVlHkdSyzCHi6M0
         K16Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769649396; x=1770254196;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yjclvkjmE1zw/GHq/jW5Y/EQUpO3A2fBpqR5d3bbX+8=;
        b=dngKdZ0hQI7/xUzY7n2bk+eD1d2CXAEsqm37dvaTXtJRy3SkWJdYoUdIrCXW56UWo9
         QOA8CoIW/lkiV0RpFpzqPYXleO163eNAhkc9zzu416Kf4Q7zWmxc5jNXSVmCrDDYrjEZ
         WOvyfTLANwLvRzyibAPsGaWTcRQii/PFX2NUs8yl7Fl9vF0VrhVep0QjEM1Pdqtluu9s
         yfavbrAj0vGqXqKwZIFaqnEXShhv8fm9rZWUR4GHQvbWvPDu2v1AEzxhJS2n3f6TI/5t
         Q6SdwqfIextV2pVvq0lsv3cgIjK3zoyffxLYYGtzgObgHilSnLAZCyFqyetZ5f0Yr/zu
         A6lw==
X-Forwarded-Encrypted: i=1; AJvYcCX61vAn7A7WGx28tdB5tXbD9AxtmoasVr4Ro4/3mtGCASEuH0BHLgfNRGHQg/juGTZ9ijoi+GBPrdnW@lists.linux.dev
X-Gm-Message-State: AOJu0Yy3CKB0UMjnjRawuvloucUkkS5pst0ILiF2IFbxNvUhCDWZPIgE
	fZtWI3RpNOvcyreHU3tgWkrBlI/AbxVLeSw7OfJQcW0EacT03ThTVAgPPto15YzVAg0OT/VxfMZ
	oduTN7A==
X-Received: from pjof4.prod.google.com ([2002:a17:90a:8e84:b0:34c:cb46:dad7])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:7484:b0:366:14af:9bbb
 with SMTP id adf61e73a8af0-38ec65898bfmr7510420637.69.1769649396157; Wed, 28
 Jan 2026 17:16:36 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 28 Jan 2026 17:15:08 -0800
In-Reply-To: <20260129011517.3545883-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260129011517.3545883-1-seanjc@google.com>
X-Mailer: git-send-email 2.53.0.rc1.217.geba53bf80e-goog
Message-ID: <20260129011517.3545883-37-seanjc@google.com>
Subject: [RFC PATCH v5 36/45] KVM: TDX: Move S-EPT page demotion TODO to tdx_sept_set_private_spte()
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

Now that handle_changed_spte() can handles all mirror SPTE updates, move
the TDP MMU's assertion that it doesn't replace a shadow-present mirror
SPTE with another shadow-present SPTE into TDX, in the form of a TODO
that calls out that KVM needs to add support for splitting/demoting
hugepage.

Drop the "!is_leaf" condition so that an unexpected/unsupported update to
a shadow-present S-EPT triggers a KVM_BUG_ON(), versus being silently
ignored (well, silent until it causes explosions in the future).

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/mmu/tdp_mmu.c | 9 +--------
 arch/x86/kvm/vmx/tdx.c     | 5 ++++-
 2 files changed, 5 insertions(+), 9 deletions(-)

diff --git a/arch/x86/kvm/mmu/tdp_mmu.c b/arch/x86/kvm/mmu/tdp_mmu.c
index d49aecba18d8..3b0da898824a 100644
--- a/arch/x86/kvm/mmu/tdp_mmu.c
+++ b/arch/x86/kvm/mmu/tdp_mmu.c
@@ -572,7 +572,7 @@ static void handle_changed_spte(struct kvm *kvm, int as_id, tdp_ptep_t sptep,
 	if (was_present && !was_leaf &&
 	    (is_leaf || !is_present || WARN_ON_ONCE(pfn_changed)))
 		handle_removed_pt(kvm, spte_to_child_pt(old_spte, level), shared);
-	else if (was_leaf && is_mirror_sptep(sptep) && !is_leaf)
+	else if (was_leaf && is_mirror_sptep(sptep))
 		KVM_BUG_ON(kvm_x86_call(set_external_spte)(kvm, gfn, old_spte,
 							   new_spte, level), kvm);
 }
@@ -704,13 +704,6 @@ static u64 tdp_mmu_set_spte(struct kvm *kvm, int as_id, tdp_ptep_t sptep,
 
 	handle_changed_spte(kvm, as_id, sptep, gfn, old_spte, new_spte, level, false);
 
-	/*
-	 * Users that do non-atomic setting of PTEs don't operate on mirror
-	 * roots.  Bug the VM as this path doesn't propagate such writes to the
-	 * external page tables.
-	 */
-	KVM_BUG_ON(is_mirror_sptep(sptep) && is_shadow_present_pte(new_spte), kvm);
-
 	return old_spte;
 }
 
diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
index e6ac4aca8114..59b7ba36d3d9 100644
--- a/arch/x86/kvm/vmx/tdx.c
+++ b/arch/x86/kvm/vmx/tdx.c
@@ -1850,7 +1850,10 @@ static int tdx_sept_remove_private_spte(struct kvm *kvm, gfn_t gfn,
 static int tdx_sept_set_private_spte(struct kvm *kvm, gfn_t gfn, u64 old_spte,
 				     u64 new_spte, enum pg_level level)
 {
-	if (is_shadow_present_pte(old_spte))
+	/* TODO: Support replacing huge SPTE with non-leaf SPTE. (a.k.a. demotion). */
+	if (KVM_BUG_ON(is_shadow_present_pte(old_spte) && is_shadow_present_pte(new_spte), kvm))
+		return -EIO;
+	else if (is_shadow_present_pte(old_spte))
 		return tdx_sept_remove_private_spte(kvm, gfn, old_spte, level);
 
 	if (KVM_BUG_ON(!is_shadow_present_pte(new_spte), kvm))
-- 
2.53.0.rc1.217.geba53bf80e-goog

