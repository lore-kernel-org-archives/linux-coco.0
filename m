Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A135E156FB
	for <linux-coco@lists.linux.dev>; Tue, 15 Aug 2023 17:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692119950; x=1723655950;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=o3k6+pbIB4VT1tldgWw//qkeFxus1DFuhHSn8Vxfw6U=;
  b=bHdrJ9YAVFy5eTIdHwbAl/sd30S3VHNTEh6rn3qKyxrhRVSI5vU4jpCu
   zYk1vtqf6nsriT97o3Ux56b4tOvfJaI70f2gR5LJNUVPvXCBvxLlEuaqx
   1o/reYHEali+7hcQYuQ2q9eHN3Jcuazh+ijXh/MaH97zAXYCEUFIALX7j
   6J2xFmtAQIuEuUw5NY4s4j19Tp+mnoJR42TrSvRcKg75UeHA5iQjpgwEU
   UZXd1T2QCDvfjLtd4JC/B+c4J/1W+nQl94y2AL8usmv3/Te5glgJcAg6o
   GMnid7WYGlEprmZ93rXrCZ2WyVQxvcyRkqM09iEGfNQhlRka/tRSiRKfg
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="436229835"
X-IronPort-AV: E=Sophos;i="6.01,175,1684825200"; 
   d="scan'208";a="436229835"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2023 10:19:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="907693389"
X-IronPort-AV: E=Sophos;i="6.01,175,1684825200"; 
   d="scan'208";a="907693389"
Received: from ls.sc.intel.com (HELO localhost) ([172.25.112.31])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2023 10:19:05 -0700
From: isaku.yamahata@intel.com
To: kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: isaku.yamahata@intel.com,
	isaku.yamahata@gmail.com,
	Michael Roth <michael.roth@amd.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	erdemaktas@google.com,
	Sagi Shahar <sagis@google.com>,
	David Matlack <dmatlack@google.com>,
	Kai Huang <kai.huang@intel.com>,
	Zhi Wang <zhi.wang.linux@gmail.com>,
	chen.bo@intel.com,
	linux-coco@lists.linux.dev,
	Chao Peng <chao.p.peng@linux.intel.com>,
	Ackerley Tng <ackerleytng@google.com>,
	Vishal Annapurve <vannapurve@google.com>,
	Yuan Yao <yuan.yao@linux.intel.com>,
	Jarkko Sakkinen <jarkko@kernel.org>,
	Xu Yilun <yilun.xu@intel.com>,
	Quentin Perret <qperret@google.com>,
	wei.w.wang@intel.com,
	Fuad Tabba <tabba@google.com>
Subject: [PATCH 5/8] KVM: gmem, x86: Add gmem hook for initializing private memory
Date: Tue, 15 Aug 2023 10:18:52 -0700
Message-Id: <3d5079d0a58616726e7471a93e3295676148865a.1692119201.git.isaku.yamahata@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1692119201.git.isaku.yamahata@intel.com>
References: <cover.1692119201.git.isaku.yamahata@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Michael Roth <michael.roth@amd.com>

All gmem pages are expected to be 'private' as defined by a particular
arch/platform. Platforms like SEV-SNP require additional operations to
move these pages into a private state, so implement a hook that can be
used to prepare this memory prior to mapping it into a guest.

In the case of SEV-SNP, whether or not a 2MB page can be mapped via a
2MB mapping in the guest's nested page table depends on whether or not
any subpages within the range have already been initialized as private
in the RMP table, so this hook will also be used by the KVM MMU to clamp
the maximum mapping size accordingly.

Signed-off-by: Michael Roth <michael.roth@amd.com>
Link: https://lore.kernel.org/r/20230612042559.375660-2-michael.roth@amd.com

---
Changes v2 -> v3:
- Newly added
---
 arch/x86/include/asm/kvm-x86-ops.h |  1 +
 arch/x86/include/asm/kvm_host.h    |  3 +++
 arch/x86/kvm/mmu/mmu.c             | 12 ++++++++++--
 3 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/arch/x86/include/asm/kvm-x86-ops.h b/arch/x86/include/asm/kvm-x86-ops.h
index 13bc212cd4bc..439ba4beb5af 100644
--- a/arch/x86/include/asm/kvm-x86-ops.h
+++ b/arch/x86/include/asm/kvm-x86-ops.h
@@ -133,6 +133,7 @@ KVM_X86_OP(msr_filter_changed)
 KVM_X86_OP(complete_emulated_msr)
 KVM_X86_OP(vcpu_deliver_sipi_vector)
 KVM_X86_OP_OPTIONAL_RET0(vcpu_get_apicv_inhibit_reasons);
+KVM_X86_OP_OPTIONAL_RET0(gmem_prepare)
 
 #undef KVM_X86_OP
 #undef KVM_X86_OP_OPTIONAL
diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index bbefd79b7950..2bc42f2887fa 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -1732,6 +1732,9 @@ struct kvm_x86_ops {
 	 * Returns vCPU specific APICv inhibit reasons
 	 */
 	unsigned long (*vcpu_get_apicv_inhibit_reasons)(struct kvm_vcpu *vcpu);
+
+	int (*gmem_prepare)(struct kvm *kvm, struct kvm_memory_slot *slot,
+			    kvm_pfn_t pfn, gfn_t gfn, u8 *max_level);
 };
 
 struct kvm_x86_nested_ops {
diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 05943ccb55a4..06900b01b8f0 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -4352,6 +4352,7 @@ static int kvm_faultin_pfn_private(struct kvm_vcpu *vcpu,
 				   struct kvm_page_fault *fault)
 {
 	int max_order, r;
+	u8 max_level;
 
 	if (!kvm_slot_can_be_private(fault->slot))
 		return kvm_do_memory_fault_exit(vcpu, fault);
@@ -4361,8 +4362,15 @@ static int kvm_faultin_pfn_private(struct kvm_vcpu *vcpu,
 	if (r)
 		return r;
 
-	fault->max_level = min(kvm_max_level_for_order(max_order),
-			       fault->max_level);
+	max_level = kvm_max_level_for_order(max_order);
+	r = static_call(kvm_x86_gmem_prepare)(vcpu->kvm, fault->slot, fault->pfn,
+					      fault->gfn, &max_level);
+	if (r) {
+		kvm_release_pfn_clean(fault->pfn);
+		return r;
+	}
+
+	fault->max_level = min(max_level, fault->max_level);
 	fault->map_writable = !(fault->slot->flags & KVM_MEM_READONLY);
 	return RET_PF_CONTINUE;
 }
-- 
2.25.1

