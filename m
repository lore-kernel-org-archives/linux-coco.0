Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E6FF63D1
	for <linux-coco@lists.linux.dev>; Wed, 28 Jun 2023 22:43:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687992226; x=1719528226;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=R6aeeOVtCVl/aF4rr9VOp5md60UJagkTMuBGcdbekMM=;
  b=TQVT/Ys1AWTYkoTi9bHTf4tLog2s9AxhXfilFvCBCsBaQxlj9z4mjYOO
   Xq0jDVrRhgX02CXGpnxTm5j7XJ3Rb07opQSnyoYVerKsMZD97pM9A6Rjp
   kVU+uEhfjImHWD1+xBgWNIG4k85q1vUG4csC1JFkiiglwxlCu/jaiSumE
   GUmNCAzTPjxWV3mmgH0WQrbthXGblW0PUq0ZcYHI6T0IXDApPYhIlJn0k
   9iqP9wpCqLT8AiwOPvY+lfOV30N3ay9ymLbHFc71q/atOPHksM4t9HtXN
   nL3+cfZuJx2Aeu46hrE3w8nE27BSYwaJUi9ng9AkFsM3ADC5YJ04J2SSm
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="392699191"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200"; 
   d="scan'208";a="392699191"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2023 15:43:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="830300029"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200"; 
   d="scan'208";a="830300029"
Received: from ls.sc.intel.com (HELO localhost) ([172.25.112.31])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2023 15:43:25 -0700
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
	Michael Roth <michael.roth@amd.com>,
	Yuan Yao <yuan.yao@linux.intel.com>
Subject: [RFC PATCH v3 11/11] KVM: x86: Add gmem hook for invalidating private memory
Date: Wed, 28 Jun 2023 15:43:10 -0700
Message-Id: <e57fc6834a49e9773f0dc54eac650b21bb7e5476.1687991811.git.isaku.yamahata@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1687991811.git.isaku.yamahata@intel.com>
References: <cover.1687991811.git.isaku.yamahata@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Michael Roth <michael.roth@amd.com>

TODO: add a CONFIG option that can be to completely skip arch
invalidation loop and avoid __weak references for arch/platforms that
don't need an additional invalidation hook.

In some cases, like with SEV-SNP, guest memory needs to be updated in a
platform-specific manner before it can be safely freed back to the host.
Add hooks to wire up handling of this sort when freeing memory in
response to FALLOC_FL_PUNCH_HOLE operations.

Also issue invalidations of all allocated pages when releasing the gmem
file so that the pages are not left in an unusable state when they get
freed back to the host.

Signed-off-by: Michael Roth <michael.roth@amd.com>
Link: https://lore.kernel.org/r/20230612042559.375660-3-michael.roth@amd.com

---
Changes v2 -> v3:
- Newly added
---
 arch/x86/include/asm/kvm-x86-ops.h |  1 +
 arch/x86/include/asm/kvm_host.h    |  1 +
 arch/x86/kvm/x86.c                 |  6 ++++
 include/linux/kvm_host.h           |  3 ++
 virt/kvm/guest_mem.c               | 48 ++++++++++++++++++++++++++++--
 5 files changed, 57 insertions(+), 2 deletions(-)

diff --git a/arch/x86/include/asm/kvm-x86-ops.h b/arch/x86/include/asm/kvm-x86-ops.h
index cce8621e3216..a864a2093002 100644
--- a/arch/x86/include/asm/kvm-x86-ops.h
+++ b/arch/x86/include/asm/kvm-x86-ops.h
@@ -136,6 +136,7 @@ KVM_X86_OP(complete_emulated_msr)
 KVM_X86_OP(vcpu_deliver_sipi_vector)
 KVM_X86_OP_OPTIONAL_RET0(vcpu_get_apicv_inhibit_reasons);
 KVM_X86_OP_OPTIONAL_RET0(gmem_prepare)
+KVM_X86_OP_OPTIONAL(gmem_invalidate)
 
 #undef KVM_X86_OP
 #undef KVM_X86_OP_OPTIONAL
diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index 653f208979cf..a91d17fa2fe8 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -1741,6 +1741,7 @@ struct kvm_x86_ops {
 
 	int (*gmem_prepare)(struct kvm *kvm, struct kvm_memory_slot *slot,
 			    kvm_pfn_t pfn, gfn_t gfn, u8 *max_level);
+	void (*gmem_invalidate)(struct kvm *kvm, kvm_pfn_t start, kvm_pfn_t end);
 };
 
 struct kvm_x86_nested_ops {
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index b5f865f39a00..e722ace8150d 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -13260,6 +13260,12 @@ bool kvm_arch_no_poll(struct kvm_vcpu *vcpu)
 }
 EXPORT_SYMBOL_GPL(kvm_arch_no_poll);
 
+#ifdef CONFIG_KVM_PRIVATE_MEM
+void kvm_arch_gmem_invalidate(struct kvm *kvm, kvm_pfn_t start, kvm_pfn_t end)
+{
+	static_call_cond(kvm_x86_gmem_invalidate)(kvm, start, end);
+}
+#endif
 
 int kvm_spec_ctrl_test_value(u64 value)
 {
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 5ca0c8ee4292..cfd98572d8be 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -2346,6 +2346,7 @@ static inline bool kvm_mem_is_private(struct kvm *kvm, gfn_t gfn)
 #ifdef CONFIG_KVM_PRIVATE_MEM
 int kvm_gmem_get_pfn(struct kvm *kvm, struct kvm_memory_slot *slot,
 			      gfn_t gfn, kvm_pfn_t *pfn, int *order);
+void kvm_arch_gmem_invalidate(struct kvm *kvm, kvm_pfn_t start, kvm_pfn_t end);
 #else
 static inline int kvm_gmem_get_pfn(struct kvm *kvm,
 				   struct kvm_memory_slot *slot, gfn_t gfn,
@@ -2354,6 +2355,8 @@ static inline int kvm_gmem_get_pfn(struct kvm *kvm,
 	KVM_BUG_ON(1, kvm);
 	return -EIO;
 }
+
+void kvm_arch_gmem_invalidate(struct kvm *kvm, kvm_pfn_t start, kvm_pfn_t end) { }
 #endif /* CONFIG_KVM_PRIVATE_MEM */
 
 #endif
diff --git a/virt/kvm/guest_mem.c b/virt/kvm/guest_mem.c
index 63ac006db7ee..5b8e11760d28 100644
--- a/virt/kvm/guest_mem.c
+++ b/virt/kvm/guest_mem.c
@@ -142,16 +142,58 @@ static void kvm_gmem_invalidate_end(struct kvm *kvm, struct kvm_gmem *gmem,
 	KVM_MMU_UNLOCK(kvm);
 }
 
+void __weak kvm_arch_gmem_invalidate(struct kvm *kvm, kvm_pfn_t start, kvm_pfn_t end)
+{
+}
+
+/* Handle arch-specific hooks needed before releasing guarded pages. */
+static void kvm_gmem_issue_arch_invalidate(struct kvm *kvm, struct file *file,
+					   pgoff_t start, pgoff_t end)
+{
+	pgoff_t file_end = i_size_read(file_inode(file)) >> PAGE_SHIFT;
+	pgoff_t index = start;
+
+	end = min(end, file_end);
+
+	while (index < end) {
+		struct folio *folio;
+		unsigned int order;
+		struct page *page;
+		kvm_pfn_t pfn;
+
+		folio = __filemap_get_folio(file->f_mapping, index,
+					    FGP_LOCK, 0);
+		if (!folio) {
+			index++;
+			continue;
+		}
+
+		page = folio_file_page(folio, index);
+		pfn = page_to_pfn(page);
+		order = folio_order(folio);
+
+		kvm_arch_gmem_invalidate(kvm, pfn, pfn + min((1ul << order), end - index));
+
+		index = folio_next_index(folio);
+		folio_unlock(folio);
+		folio_put(folio);
+
+		cond_resched();
+	}
+}
+
 static long kvm_gmem_punch_hole(struct file *file, loff_t offset, loff_t len)
 {
 	struct kvm_gmem *gmem = file->private_data;
-	pgoff_t start = offset >> PAGE_SHIFT;
-	pgoff_t end = (offset + len) >> PAGE_SHIFT;
 	struct kvm *kvm = gmem->kvm;
+	pgoff_t start, end;
 
 	if (!PAGE_ALIGNED(offset) || !PAGE_ALIGNED(len))
 		return 0;
 
+	start = offset >> PAGE_SHIFT;
+	end = (offset + len) >> PAGE_SHIFT;
+
 	/*
 	 * Bindings must stable across invalidation to ensure the start+end
 	 * are balanced.
@@ -160,6 +202,7 @@ static long kvm_gmem_punch_hole(struct file *file, loff_t offset, loff_t len)
 
 	kvm_gmem_invalidate_begin(kvm, gmem, start, end);
 
+	kvm_gmem_issue_arch_invalidate(kvm, file, start, end);
 	truncate_inode_pages_range(file->f_mapping, offset, offset + len - 1);
 
 	kvm_gmem_invalidate_end(kvm, gmem, start, end);
@@ -266,6 +309,7 @@ static int kvm_gmem_release(struct inode *inode, struct file *file)
 	 * pointed at this file.
 	 */
 	kvm_gmem_invalidate_begin(kvm, gmem, 0, -1ul);
+	kvm_gmem_issue_arch_invalidate(gmem->kvm, file, 0, -1ul);
 	truncate_inode_pages_final(file->f_mapping);
 	kvm_gmem_invalidate_end(kvm, gmem, 0, -1ul);
 
-- 
2.25.1

