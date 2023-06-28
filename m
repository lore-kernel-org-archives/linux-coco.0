Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 852D563D1
	for <linux-coco@lists.linux.dev>; Wed, 28 Jun 2023 22:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687992224; x=1719528224;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6umfemwMrYz7WsXi1NlQUufCvU391Sg+THAWamuc+xA=;
  b=cuuQ9g0E/a6k6J9ogB9V3JEwcL7UWvLqA/wD/EZTDBcQSddEiZU5kC7g
   RhJ3Otw4XgKPnPibhGDuBZYE9AitUnSklDKuVY+4EcOb1TSBR95jaSk/m
   swhOMwQ1RouS7sJ+95dL/hnGVtbvxFCJldwXja4ptuqk7UYk6PnFo9otU
   07m9uAcc/7lbouK80m8UyHpsbibR6qZ49xXBPTtwRWSb+FNu/3bzn/cvi
   vTzTAgJZxRJC+a1LquioT6pSxVl9ROjaI6Ke0IRXzfmI91km3RhaHbW0m
   jLPM5w5ijrrZqd5jcJS8inPbwrXa3u6iNTk8zWrHK+VGOh5BPArkvW+hq
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="392699166"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200"; 
   d="scan'208";a="392699166"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2023 15:43:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="830300010"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200"; 
   d="scan'208";a="830300010"
Received: from ls.sc.intel.com (HELO localhost) ([172.25.112.31])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2023 15:43:24 -0700
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
Subject: [RFC PATCH v3 08/11] KVM: Fix set_mem_attr ioctl when error case
Date: Wed, 28 Jun 2023 15:43:07 -0700
Message-Id: <358fb191b3690a5cbc2c985d3ffc67224df11cf3.1687991811.git.isaku.yamahata@intel.com>
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

From: Isaku Yamahata <isaku.yamahata@intel.com>

kvm_vm_ioctl_set_mem_attributes() discarded an error code of xa_err()
unconditionally.  If an error occurred at the beginning, return error.

Fixes: 3779c214835b ("KVM: Introduce per-page memory attributes")
Signed-off-by: Isaku Yamahata <isaku.yamahata@intel.com>

---
Changes v2 -> v3:
- Newly added
---
 virt/kvm/kvm_main.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 422d49634c56..fdef56f85174 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -2423,6 +2423,7 @@ static int kvm_vm_ioctl_set_mem_attributes(struct kvm *kvm,
 	gfn_t start, end;
 	unsigned long i;
 	void *entry;
+	int err = 0;
 
 	/* flags is currently not used. */
 	if (attrs->flags)
@@ -2447,14 +2448,17 @@ static int kvm_vm_ioctl_set_mem_attributes(struct kvm *kvm,
 	KVM_MMU_UNLOCK(kvm);
 
 	for (i = start; i < end; i++) {
-		if (xa_err(xa_store(&kvm->mem_attr_array, i, entry,
-				    GFP_KERNEL_ACCOUNT)))
+		err = xa_err(xa_store(&kvm->mem_attr_array, i, entry,
+				      GFP_KERNEL_ACCOUNT));
+		if (err)
 			break;
 	}
 
 	KVM_MMU_LOCK(kvm);
-	if (i > start)
+	if (i > start) {
+		err = 0;
 		kvm_mem_attrs_changed(kvm, attrs->attributes, start, i);
+	}
 	kvm_mmu_invalidate_end(kvm);
 	KVM_MMU_UNLOCK(kvm);
 
@@ -2463,7 +2467,7 @@ static int kvm_vm_ioctl_set_mem_attributes(struct kvm *kvm,
 	attrs->address = i << PAGE_SHIFT;
 	attrs->size = (end - i) << PAGE_SHIFT;
 
-	return 0;
+	return err;
 }
 #endif /* CONFIG_KVM_GENERIC_MEMORY_ATTRIBUTES */
 
-- 
2.25.1

