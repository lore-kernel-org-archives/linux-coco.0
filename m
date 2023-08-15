Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DCFE156FB
	for <linux-coco@lists.linux.dev>; Tue, 15 Aug 2023 17:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692119952; x=1723655952;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=IOB6egI1P24F5biT3CsDzSkUO+xJDoBD1NOa36eza/w=;
  b=U84rY4FjvhW1FeuCbdWkXgganzi6+wPEQ68dNU0dFSRiaAgU65FBRdHM
   mtALiyZcwQTn/snYRu/FyWFiXAJwIgTlF2lL6M35AUKbRvnFQoaJ5QUt3
   3sz2QIZdEnB/aqLLGaFzACEnsjhyLTqDA6umVOMxb2xT6mmAle6mGlIhT
   XNSfHDee8l7xKljL89OSF0f5qqpMk7OJ8vqd4zy03AjdqJ6ZTcVqwJsfi
   by+QgsEYXrmA6Fps+uUdRgqK8tIv3QVWYoONpbMw2sljmB5mGvWMuk+Ud
   WkaSFRr39mlAvGe8H9iwHyg5EeEFTfimInS4xpRqGvtY2cq3UafM566B6
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="436229848"
X-IronPort-AV: E=Sophos;i="6.01,175,1684825200"; 
   d="scan'208";a="436229848"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2023 10:19:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="907693407"
X-IronPort-AV: E=Sophos;i="6.01,175,1684825200"; 
   d="scan'208";a="907693407"
Received: from ls.sc.intel.com (HELO localhost) ([172.25.112.31])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2023 10:19:07 -0700
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
Subject: [PATCH 7/8] KVM: gmem: Avoid race with kvm_gmem_release and mmu notifier
Date: Tue, 15 Aug 2023 10:18:54 -0700
Message-Id: <c3128665745b58500f71f46db6969d02cabcc8db.1692119201.git.isaku.yamahata@intel.com>
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

Add slots_lock around kvm_flush_shadow_all().  kvm_gmem_release() via
fput() and kvm_mmu_notifier_release() via mmput() can be called
simultaneously on process exit because vhost, /dev/vhost_{net, vsock}, can
delay the call to release mmu_notifier, kvm_mmu_notifier_release() by its
kernel thread.  Vhost uses get_task_mm() and mmput() for the kernel thread
to access process memory.  mmput() can defer after closing the file.

kvm_flush_shadow_all() and kvm_gmem_release() can be called simultaneously.
With TDX KVM, HKID releasing by kvm_flush_shadow_all() and private memory
releasing by kvm_gmem_release() can race.  Add slots_lock to
kvm_mmu_notifier_release().

Signed-off-by: Isaku Yamahata <isaku.yamahata@intel.com>
---
 virt/kvm/kvm_main.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 49380cd62367..4855d0b7a859 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -927,9 +927,16 @@ static void kvm_mmu_notifier_release(struct mmu_notifier *mn,
 	struct kvm *kvm = mmu_notifier_to_kvm(mn);
 	int idx;
 
+	/*
+	 * Avoide race with kvm_gmem_release().
+	 * This function is called via mmu notifier, mmu_release().
+	 * kvm_gmem_release() is called via fput() on process exit.
+	 */
+	mutex_lock(&kvm->slots_lock);
 	idx = srcu_read_lock(&kvm->srcu);
 	kvm_flush_shadow_all(kvm);
 	srcu_read_unlock(&kvm->srcu, idx);
+	mutex_unlock(&kvm->slots_lock);
 }
 
 static const struct mmu_notifier_ops kvm_mmu_notifier_ops = {
-- 
2.25.1

