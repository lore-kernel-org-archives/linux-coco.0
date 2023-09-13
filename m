Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFD98210D
	for <linux-coco@lists.linux.dev>; Wed, 13 Sep 2023 10:49:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694602153; x=1726138153;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vjzCCiYbRI2Udp8b7ZaBhaYrlSTbrUefC/7glJvCx6s=;
  b=IVv2cuM9YWRhsskPGm4Euar0+Ku1rBDRu+teaAEFGuHMST/5Om0cNWjD
   JL4VY2aRk2uqSVvN8HsPyvyFcafqWnctmlRfvDY4bK8SnrzmEW2jCXs9f
   JjmZJ6qjmLrTNwlYk5om1fNw39wJYCz7zhvR9MBB++18BVkjcJl4qFu8D
   1wu8n14QF4KbrMEv/4y5jRWsSr9iWVRWINexj/4YOtk7zPvZlXqt70VJs
   H5X9F756u9DVzrHqCBYJ7LX2sYhfzByPWx1GNMw2WIr2aQxJepk7mq2+7
   tMG4mNZIaE8PHFwEVYiyk85y7FEkX70+wGnxR80d7v3fTcDTr9nOiyB/O
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="377537875"
X-IronPort-AV: E=Sophos;i="6.02,143,1688454000"; 
   d="scan'208";a="377537875"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2023 03:49:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="809635584"
X-IronPort-AV: E=Sophos;i="6.02,143,1688454000"; 
   d="scan'208";a="809635584"
Received: from ls.sc.intel.com (HELO localhost) ([172.25.112.31])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2023 03:49:11 -0700
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
Subject: [RFC PATCH 2/6] KVM: guestmem_fd: Make error_remove_page callback to unmap guest memory
Date: Wed, 13 Sep 2023 03:48:51 -0700
Message-Id: <d6601227769ec82eed95270053ef58e13c2c0a09.1694599703.git.isaku.yamahata@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1694599703.git.isaku.yamahata@intel.com>
References: <cover.1694599703.git.isaku.yamahata@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Isaku Yamahata <isaku.yamahata@intel.com>

Implement error_remove_page inode method for KVM gmem.  Update struct
kvm_gfn_range to indicate unmapping gufs because page is poisoned.

Signed-off-by: Isaku Yamahata <isaku.yamahata@intel.com>
---
 include/linux/kvm_host.h |  2 ++
 virt/kvm/guest_mem.c     | 47 +++++++++++++++++++++++++++-------------
 2 files changed, 34 insertions(+), 15 deletions(-)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 091bc89ae805..e81a7123c84f 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -266,8 +266,10 @@ struct kvm_gfn_range {
 		pte_t pte;
 		unsigned long attributes;
 		u64 raw;
+		struct page *page;
 	} arg;
 	bool may_block;
+	bool memory_error;
 };
 bool kvm_unmap_gfn_range(struct kvm *kvm, struct kvm_gfn_range *range);
 bool kvm_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range);
diff --git a/virt/kvm/guest_mem.c b/virt/kvm/guest_mem.c
index 35d8f03e7937..746e683df589 100644
--- a/virt/kvm/guest_mem.c
+++ b/virt/kvm/guest_mem.c
@@ -305,7 +305,7 @@ static int kvm_gmem_error_page(struct address_space *mapping, struct page *page)
 	struct kvm_gmem *gmem;
 	unsigned long index;
 	pgoff_t start, end;
-	gfn_t gfn;
+	bool flush;
 
 	if (!IS_ENABLED(CONFIG_HAVE_GENERIC_PRIVATE_MEM_HANDLE_ERROR))
 		return MF_IGNORED;
@@ -316,26 +316,43 @@ static int kvm_gmem_error_page(struct address_space *mapping, struct page *page)
 	end = start + thp_nr_pages(page);
 
 	list_for_each_entry(gmem, gmem_list, entry) {
+		struct kvm *kvm = gmem->kvm;
+
+		KVM_MMU_LOCK(kvm);
+		kvm_mmu_invalidate_begin(kvm);
+		KVM_MMU_UNLOCK(kvm);
+
+		flush = false;
 		xa_for_each_range(&gmem->bindings, index, slot, start, end - 1) {
-			for (gfn = start; gfn < end; gfn++) {
-				if (WARN_ON_ONCE(gfn < slot->base_gfn ||
-						gfn >= slot->base_gfn + slot->npages))
-					continue;
-
-				/*
-				 * FIXME: Tell userspace that the *private*
-				 * memory encountered an error.
-				 */
-				send_sig_mceerr(BUS_MCEERR_AR,
-						(void __user *)gfn_to_hva_memslot(slot, gfn),
-						PAGE_SHIFT, current);
-			}
+			pgoff_t pgoff;
+
+			if (WARN_ON_ONCE(end < slot->base_gfn ||
+					 start >= slot->base_gfn + slot->npages))
+				continue;
+
+			pgoff = slot->gmem.pgoff;
+			struct kvm_gfn_range gfn_range = {
+				.slot = slot,
+				.start = slot->base_gfn + max(pgoff, start) - pgoff,
+				.end = slot->base_gfn + min(pgoff + slot->npages, end) - pgoff,
+				.arg.page = page,
+				.may_block = true,
+				.memory_error = true,
+			};
+
+			flush |= kvm_mmu_unmap_gfn_range(kvm, &gfn_range);
 		}
+		if (flush)
+			kvm_flush_remote_tlbs(kvm);
+
+		KVM_MMU_LOCK(kvm);
+		kvm_mmu_invalidate_end(kvm);
+		KVM_MMU_UNLOCK(kvm);
 	}
 
 	filemap_invalidate_unlock_shared(mapping);
 
-	return 0;
+	return MF_DELAYED;
 }
 
 static const struct address_space_operations kvm_gmem_aops = {
-- 
2.25.1

