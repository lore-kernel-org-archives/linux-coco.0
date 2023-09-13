Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5362D1DDFB
	for <linux-coco@lists.linux.dev>; Wed, 13 Sep 2023 10:49:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694602154; x=1726138154;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=w56T0yhNaiatkjqh/uT3sOfSvQs6+aSo/JfJQY17ObY=;
  b=lSA5S317x0X6U7hnGJTYxIzh1SvZH4B6eAmhcI3R1h0PHSORwaqB2Uun
   Zc5roO+5+Ge+7rSu91wudmipmcAzgZrT7hxcD7nyZMCFGjTeS0q8JBaFR
   JoKlboTnk5v9WpbrbPFrY6ucTFvx0e2VGhn5vFRozyVkf1VybOTN5wh/T
   5aDsW3bDvH9+8I9ZnyGoysbGBuN5mjUZ+olKiMdcK+0vpZVUe2FTsCueI
   4AdKfyGjpQeo3SslFjlGm/4MYMwVvbNFDF8W+N+xfR/6cLpSyvFE/8enF
   7YFLBT7UCzjF+7LjKgouUi9R1AEmS+gaYUuQQIs1CWOL8vuzCzb4tTniV
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="377537890"
X-IronPort-AV: E=Sophos;i="6.02,143,1688454000"; 
   d="scan'208";a="377537890"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2023 03:49:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="809635592"
X-IronPort-AV: E=Sophos;i="6.02,143,1688454000"; 
   d="scan'208";a="809635592"
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
Subject: [RFC PATCH 4/6] KVM: guest_memfd: Implemnet bmap inode operation
Date: Wed, 13 Sep 2023 03:48:53 -0700
Message-Id: <852b6fa117bf3767a99353d908bc566a5dd9c61a.1694599703.git.isaku.yamahata@intel.com>
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

To inject memory failure, physical address of the page is needed.
Implement bmap() method to convert the file offset into physical address.

Signed-off-by: Isaku Yamahata <isaku.yamahata@intel.com>
---
 virt/kvm/Kconfig     |  4 ++++
 virt/kvm/guest_mem.c | 28 ++++++++++++++++++++++++++++
 2 files changed, 32 insertions(+)

diff --git a/virt/kvm/Kconfig b/virt/kvm/Kconfig
index 624df45baff0..eb008f0e7cc3 100644
--- a/virt/kvm/Kconfig
+++ b/virt/kvm/Kconfig
@@ -115,3 +115,7 @@ config KVM_GENERIC_PRIVATE_MEM
 
 config HAVE_GENERIC_PRIVATE_MEM_HANDLE_ERROR
 	bool
+
+config KVM_GENERIC_PRIVATE_MEM_BMAP
+	depends on KVM_GENERIC_PRIVATE_MEM
+	bool
diff --git a/virt/kvm/guest_mem.c b/virt/kvm/guest_mem.c
index 3678287d7c9d..90dfdfab1f8c 100644
--- a/virt/kvm/guest_mem.c
+++ b/virt/kvm/guest_mem.c
@@ -355,12 +355,40 @@ static int kvm_gmem_error_page(struct address_space *mapping, struct page *page)
 	return MF_DELAYED;
 }
 
+#ifdef CONFIG_KVM_GENERIC_PRIVATE_MEM_BMAP
+static sector_t kvm_gmem_bmap(struct address_space *mapping, sector_t block)
+{
+	struct folio *folio;
+	sector_t pfn = 0;
+
+	filemap_invalidate_lock_shared(mapping);
+
+	if (block << PAGE_SHIFT > i_size_read(mapping->host))
+		goto out;
+
+	folio = filemap_get_folio(mapping, block);
+	if (IS_ERR_OR_NULL(folio))
+		goto out;
+
+	pfn = folio_pfn(folio) + (block - folio->index);
+	folio_put(folio);
+
+out:
+	filemap_invalidate_unlock_shared(mapping);
+	return pfn;
+
+}
+#endif
+
 static const struct address_space_operations kvm_gmem_aops = {
 	.dirty_folio = noop_dirty_folio,
 #ifdef CONFIG_MIGRATION
 	.migrate_folio	= kvm_gmem_migrate_folio,
 #endif
 	.error_remove_page = kvm_gmem_error_page,
+#ifdef CONFIG_KVM_GENERIC_PRIVATE_MEM_BMAP
+	.bmap = kvm_gmem_bmap,
+#endif
 };
 
 static int  kvm_gmem_getattr(struct mnt_idmap *idmap,
-- 
2.25.1

