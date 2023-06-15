Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DC5DFBE6
	for <linux-coco@lists.linux.dev>; Thu, 15 Jun 2023 20:12:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686859960; x=1718395960;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=pWaX7pZXuIDTaETtNDJUBd6sIkUSbiwO7+qg1weP6GA=;
  b=IAlF0QN4K3jGWAMbhCyChA+BONKX0FhKTib6LiRJQebOxNTQ11ieoMQV
   FNYwE+PkJrYZTgiLHdxEMo7+xMr0wetrHb0cha+IfXZ8sJ7bHcHcOevcB
   VvA7QzWqMkJ+LelMjCIhgXk5SwHV/ZMnWJzw4hWe+kL1ohxT/1jFiMrRR
   sPsYS0zaYpAG6e7G9l3EB4C11V8j4Flmf1KIUL354ce23D4ggEpMgC84T
   T6oLnFEjEFaR8DR7dZGP1+Xt9TR2M0LHThjbOk4YicDSq+JUYg8Yvrjz2
   qTfC1YAYQnaStYtR6KzWYXhikiSfq5JRVf8HYximX2J1qVETZkNZ5RCxO
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="387611463"
X-IronPort-AV: E=Sophos;i="6.00,245,1681196400"; 
   d="scan'208";a="387611463"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2023 13:12:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="712576657"
X-IronPort-AV: E=Sophos;i="6.00,245,1681196400"; 
   d="scan'208";a="712576657"
Received: from ls.sc.intel.com (HELO localhost) ([172.25.112.31])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2023 13:12:38 -0700
From: isaku.yamahata@intel.com
To: kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: isaku.yamahata@intel.com,
	isaku.yamahata@gmail.com,
	Paolo Bonzini <pbonzini@redhat.com>,
	erdemaktas@google.com,
	Sean Christopherson <seanjc@google.com>,
	Sagi Shahar <sagis@google.com>,
	David Matlack <dmatlack@google.com>,
	Kai Huang <kai.huang@intel.com>,
	Zhi Wang <zhi.wang.linux@gmail.com>,
	chen.bo@intel.com,
	linux-coco@lists.linux.dev,
	Chao Peng <chao.p.peng@linux.intel.com>,
	Ackerley Tng <ackerleytng@google.com>,
	Vishal Annapurve <vannapurve@google.com>,
	Michael Roth <michael.roth@amd.com>
Subject: [RFC PATCH 4/6] KVM: x86: Introduce PFERR_GUEST_ENC_MASK to indicate fault is private
Date: Thu, 15 Jun 2023 13:12:17 -0700
Message-Id: <02471a0e41717e40f415a96a2acbd80ba9d42e2e.1686858861.git.isaku.yamahata@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1686858861.git.isaku.yamahata@intel.com>
References: <cover.1686858861.git.isaku.yamahata@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Isaku Yamahata <isaku.yamahata@intel.com>

It is unfortunate and inflexible for kvm_mmu_do_page_fault() to call
kvm_mem_is_private(), eventually looking up memory attributes.  Later
__kvm_faultin_pfn() looks up memory attributes again.  There is a race
condition that other threads can change memory attributes due to not
gaining the mmu lock.  SNP-SEV and TDX define theri way to indicate that
the page fault is private.

Add two PFERR codes to designate that the page fault is private and that
it requires looking up memory attributes.

Signed-off-by: Isaku Yamahata <isaku.yamahata@intel.com>
---
 arch/x86/include/asm/kvm_host.h | 4 ++++
 arch/x86/kvm/mmu/mmu.c          | 9 +++++++--
 arch/x86/kvm/mmu/mmu_internal.h | 4 ++--
 3 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index 8ae131dc645d..2763f9837a0b 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -255,7 +255,9 @@ enum x86_intercept_stage;
 #define PFERR_SGX_BIT 15
 #define PFERR_GUEST_FINAL_BIT 32
 #define PFERR_GUEST_PAGE_BIT 33
+#define PFERR_GUEST_ENC_BIT 34
 #define PFERR_IMPLICIT_ACCESS_BIT 48
+#define PFERR_HASATTR_BIT 63
 
 #define PFERR_PRESENT_MASK	BIT(PFERR_PRESENT_BIT)
 #define PFERR_WRITE_MASK	BIT(PFERR_WRITE_BIT)
@@ -266,7 +268,9 @@ enum x86_intercept_stage;
 #define PFERR_SGX_MASK		BIT(PFERR_SGX_BIT)
 #define PFERR_GUEST_FINAL_MASK	BIT_ULL(PFERR_GUEST_FINAL_BIT)
 #define PFERR_GUEST_PAGE_MASK	BIT_ULL(PFERR_GUEST_PAGE_BIT)
+#define PFERR_GUEST_ENC_MASK	BIT_ULL(PFERR_GUEST_ENC_BIT)
 #define PFERR_IMPLICIT_ACCESS	BIT_ULL(PFERR_IMPLICIT_ACCESS_BIT)
+#define PFERR_HASATTR_MASK	BIT_ULL(PFERR_HASATTR_BIT)
 
 #define PFERR_NESTED_GUEST_PAGE (PFERR_GUEST_PAGE_MASK |	\
 				 PFERR_WRITE_MASK |		\
diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index b8ba7f11c3cb..e9c9780bab89 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -4358,6 +4358,7 @@ static int __kvm_faultin_pfn(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault
 {
 	struct kvm_memory_slot *slot = fault->slot;
 	bool async;
+	bool is_private;
 
 	/*
 	 * Retry the page fault if the gfn hit a memslot that is being deleted
@@ -4386,8 +4387,12 @@ static int __kvm_faultin_pfn(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault
 			return RET_PF_EMULATE;
 	}
 
-	if (fault->is_private != kvm_mem_is_private(vcpu->kvm, fault->gfn))
-		return kvm_do_memory_fault_exit(vcpu, fault);
+	is_private = kvm_mem_is_private(vcpu->kvm, fault->gfn);
+	if (fault->error_code & PFERR_HASATTR_MASK) {
+		if (fault->is_private != is_private)
+			return kvm_do_memory_fault_exit(vcpu, fault);
+	} else
+		fault->is_private = is_private;
 
 	if (fault->is_private)
 		return kvm_faultin_pfn_private(vcpu, fault);
diff --git a/arch/x86/kvm/mmu/mmu_internal.h b/arch/x86/kvm/mmu/mmu_internal.h
index 7f9ec1e5b136..22f2cd60cabf 100644
--- a/arch/x86/kvm/mmu/mmu_internal.h
+++ b/arch/x86/kvm/mmu/mmu_internal.h
@@ -203,7 +203,7 @@ struct kvm_page_fault {
 
 	/* Derived from mmu and global state.  */
 	const bool is_tdp;
-	const bool is_private;
+	bool is_private;
 	const bool nx_huge_page_workaround_enabled;
 
 	/*
@@ -301,7 +301,7 @@ static inline int kvm_mmu_do_page_fault(struct kvm_vcpu *vcpu, gpa_t cr2_or_gpa,
 		.max_level = KVM_MAX_HUGEPAGE_LEVEL,
 		.req_level = PG_LEVEL_4K,
 		.goal_level = PG_LEVEL_4K,
-		.is_private = kvm_mem_is_private(vcpu->kvm, cr2_or_gpa >> PAGE_SHIFT),
+		.is_private = err & PFERR_GUEST_ENC_MASK,
 	};
 	int r;
 
-- 
2.25.1

