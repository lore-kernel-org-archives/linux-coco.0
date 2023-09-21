Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94DD618B00
	for <linux-coco@lists.linux.dev>; Thu, 21 Sep 2023 20:14:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695327287; x=1726863287;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=LZO5yjdBhkI2eq5MmnoYAkLMHFYrLWe3TrIyqhKkZPU=;
  b=VIaZlZxCI1JQuQnDmTFFVbkdoT8u44sVkbHmvQJ8KgQBTIfAcrRsWts+
   sv0b8WMqv/QmWZWSeID/QEL1b3TdATpnP6ccQERE5oUeV5xNyRuykX2VQ
   NHbEYCbr3nnyy4Xo/yYkDoNx/wHUHgEE8NQyIJ6uXRS4ch4ptscYql9te
   ADPmcTXxHJYtsXr7/OwLheGVdLFezRhxdiznRgpqFH+mKhuRaLtKNaFjF
   IRiYz2mV7oxrZywnz3O4MGqlWFXzRf2GPb0Df0nUiJV5up98zVbsfq1uQ
   nfNYDgIshJJ3/9GQgjG6KC6UioQB6efvScUXlt2ke8TTiySpPrW5jVMjj
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="383401591"
X-IronPort-AV: E=Sophos;i="6.03,166,1694761200"; 
   d="scan'208";a="383401591"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2023 13:14:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="696897783"
X-IronPort-AV: E=Sophos;i="6.03,166,1694761200"; 
   d="scan'208";a="696897783"
Received: from ls.sc.intel.com (HELO localhost) ([172.25.112.31])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2023 13:14:45 -0700
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
Subject: [RFC PATCH v2 1/6] KVM: gmem: Truncate pages on punch hole
Date: Thu, 21 Sep 2023 13:14:34 -0700
Message-Id: <f987dcde3b051371b496847282022c679e9402e4.1695327124.git.isaku.yamahata@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1695327124.git.isaku.yamahata@intel.com>
References: <cover.1695327124.git.isaku.yamahata@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Isaku Yamahata <isaku.yamahata@intel.com>

Although kvm_gmem_punch_hole() keeps all pages in mapping on punching hole,
it's common expectation that pages are truncated.  Truncate pages on
punching hole.  As page contents can be encrypted, avoid zeroing partial
folio by refusing partial punch hole.

Signed-off-by: Isaku Yamahata <isaku.yamahata@intel.com>
---
 virt/kvm/guest_mem.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/virt/kvm/guest_mem.c b/virt/kvm/guest_mem.c
index a819367434e9..01fb4ca861d0 100644
--- a/virt/kvm/guest_mem.c
+++ b/virt/kvm/guest_mem.c
@@ -130,22 +130,32 @@ static void kvm_gmem_invalidate_end(struct kvm_gmem *gmem, pgoff_t start,
 static long kvm_gmem_punch_hole(struct inode *inode, loff_t offset, loff_t len)
 {
 	struct list_head *gmem_list = &inode->i_mapping->private_list;
+	struct address_space *mapping  = inode->i_mapping;
 	pgoff_t start = offset >> PAGE_SHIFT;
 	pgoff_t end = (offset + len) >> PAGE_SHIFT;
 	struct kvm_gmem *gmem;
 
+	/*
+	 * punch hole may result in zeroing partial area.  As pages can be
+	 * encrypted, prohibit zeroing partial area.
+	 */
+	if (offset & ~PAGE_MASK || len & ~PAGE_MASK)
+		return -EINVAL;
+
 	/*
 	 * Bindings must stable across invalidation to ensure the start+end
 	 * are balanced.
 	 */
-	filemap_invalidate_lock(inode->i_mapping);
+	filemap_invalidate_lock(mapping);
 
 	list_for_each_entry(gmem, gmem_list, entry) {
 		kvm_gmem_invalidate_begin(gmem, start, end);
 		kvm_gmem_invalidate_end(gmem, start, end);
 	}
 
-	filemap_invalidate_unlock(inode->i_mapping);
+	truncate_inode_pages_range(mapping, offset, offset + len - 1);
+
+	filemap_invalidate_unlock(mapping);
 
 	return 0;
 }
-- 
2.25.1

