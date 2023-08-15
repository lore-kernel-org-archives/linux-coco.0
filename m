Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B74A515AC5
	for <linux-coco@lists.linux.dev>; Tue, 15 Aug 2023 17:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692119954; x=1723655954;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0Nfl6CiEe9l9TCE09frQgEkEYx1zNWnP5lOrklwZ2vo=;
  b=Wwy07BWM0xQvz8mCjYX0yGLsVnkS+i7YwPTh57O9PzVtIlh3bMOS0vi8
   7pwefrqpFLoYtzw063+JxyN9vjSg7vnP2083LPGd2y1qDBdXI88y8UJsg
   J46jv5P0DLewXxhrdDt46KV5ymvCehQ5dmkeHMAsN6ob2S3f9K1gmYojn
   EUgFFd0ChoncVhKuQk971qPvRc92BlE5XRsT5nTY81jskQeclQc9raANR
   XATx6EJ7JJWp3p04gQ+b0kAGhBdLKoU0O6vZJj6bIafIGJKU5uMoPeRXC
   yDBJNhH4yXB5Fi/cTJ31LV6Y6BET3V3zNtq76oQnMjtxtLOYWJqZWePBC
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="362488608"
X-IronPort-AV: E=Sophos;i="6.01,175,1684825200"; 
   d="scan'208";a="362488608"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2023 10:19:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="848148978"
X-IronPort-AV: E=Sophos;i="6.01,175,1684825200"; 
   d="scan'208";a="848148978"
Received: from ls.sc.intel.com (HELO localhost) ([172.25.112.31])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2023 10:19:05 -0700
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
Subject: [PATCH 4/8] KVM: gmem: protect kvm_mmu_invalidate_end()
Date: Tue, 15 Aug 2023 10:18:51 -0700
Message-Id: <b37fb13a9aeb8683d5fdd5351cdc5034639eb2bb.1692119201.git.isaku.yamahata@intel.com>
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

From: Isaku Yamahata <isaku.yamahata@intel.com>

kvm_mmu_invalidate_end() updates struct kvm::mmu_invalidate_in_progress
and it's protected by kvm::mmu_lock.  call kvm_mmu_invalidate_end() before
unlocking it. Not after the unlock.

Fixes: 8e9009ca6d14 ("KVM: Introduce per-page memory attributes")
Signed-off-by: Isaku Yamahata <isaku.yamahata@intel.com>
---
 virt/kvm/kvm_main.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 8bfeb615fc4d..49380cd62367 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -535,6 +535,7 @@ struct kvm_mmu_notifier_range {
 	} arg;
 	gfn_handler_t handler;
 	on_lock_fn_t on_lock;
+	on_unlock_fn_t before_unlock;
 	on_unlock_fn_t on_unlock;
 	bool flush_on_ret;
 	bool may_block;
@@ -629,6 +630,8 @@ static __always_inline int __kvm_handle_hva_range(struct kvm *kvm,
 		kvm_flush_remote_tlbs(kvm);
 
 	if (locked) {
+		if (!IS_KVM_NULL_FN(range->before_unlock))
+			range->before_unlock(kvm);
 		KVM_MMU_UNLOCK(kvm);
 		if (!IS_KVM_NULL_FN(range->on_unlock))
 			range->on_unlock(kvm);
@@ -653,6 +656,7 @@ static __always_inline int kvm_handle_hva_range(struct mmu_notifier *mn,
 		.arg.pte	= pte,
 		.handler	= handler,
 		.on_lock	= (void *)kvm_null_fn,
+		.before_unlock	= (void *)kvm_null_fn,
 		.on_unlock	= (void *)kvm_null_fn,
 		.flush_on_ret	= true,
 		.may_block	= false,
@@ -672,6 +676,7 @@ static __always_inline int kvm_handle_hva_range_no_flush(struct mmu_notifier *mn
 		.end		= end,
 		.handler	= handler,
 		.on_lock	= (void *)kvm_null_fn,
+		.before_unlock	= (void *)kvm_null_fn,
 		.on_unlock	= (void *)kvm_null_fn,
 		.flush_on_ret	= false,
 		.may_block	= false,
@@ -776,6 +781,7 @@ static int kvm_mmu_notifier_invalidate_range_start(struct mmu_notifier *mn,
 		.end		= range->end,
 		.handler	= kvm_mmu_unmap_gfn_range,
 		.on_lock	= kvm_mmu_invalidate_begin,
+		.before_unlock	= (void *)kvm_null_fn,
 		.on_unlock	= kvm_arch_guest_memory_reclaimed,
 		.flush_on_ret	= true,
 		.may_block	= mmu_notifier_range_blockable(range),
@@ -815,6 +821,8 @@ static int kvm_mmu_notifier_invalidate_range_start(struct mmu_notifier *mn,
 
 void kvm_mmu_invalidate_end(struct kvm *kvm)
 {
+	lockdep_assert_held_write(&kvm->mmu_lock);
+
 	/*
 	 * This sequence increase will notify the kvm page fault that
 	 * the page that is going to be mapped in the spte could have
@@ -846,6 +854,7 @@ static void kvm_mmu_notifier_invalidate_range_end(struct mmu_notifier *mn,
 		.end		= range->end,
 		.handler	= (void *)kvm_null_fn,
 		.on_lock	= kvm_mmu_invalidate_end,
+		.before_unlock	= (void *)kvm_null_fn,
 		.on_unlock	= (void *)kvm_null_fn,
 		.flush_on_ret	= false,
 		.may_block	= mmu_notifier_range_blockable(range),
@@ -2433,6 +2442,8 @@ static __always_inline void kvm_handle_gfn_range(struct kvm *kvm,
 		kvm_flush_remote_tlbs(kvm);
 
 	if (locked) {
+		if (!IS_KVM_NULL_FN(range->before_unlock))
+			range->before_unlock(kvm);
 		KVM_MMU_UNLOCK(kvm);
 		if (!IS_KVM_NULL_FN(range->on_unlock))
 			range->on_unlock(kvm);
@@ -2447,6 +2458,7 @@ static int kvm_vm_set_mem_attributes(struct kvm *kvm, unsigned long attributes,
 		.end = end,
 		.handler = kvm_mmu_unmap_gfn_range,
 		.on_lock = kvm_mmu_invalidate_begin,
+		.before_unlock	= (void *)kvm_null_fn,
 		.on_unlock = (void *)kvm_null_fn,
 		.flush_on_ret = true,
 		.may_block = true,
@@ -2457,7 +2469,8 @@ static int kvm_vm_set_mem_attributes(struct kvm *kvm, unsigned long attributes,
 		.arg.attributes = attributes,
 		.handler = kvm_arch_post_set_memory_attributes,
 		.on_lock = (void *)kvm_null_fn,
-		.on_unlock = kvm_mmu_invalidate_end,
+		.before_unlock = kvm_mmu_invalidate_end,
+		.on_unlock = (void *)kvm_null_fn,
 		.may_block = true,
 	};
 	unsigned long i;
-- 
2.25.1

