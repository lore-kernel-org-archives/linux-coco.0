Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 644CB15ACF
	for <linux-coco@lists.linux.dev>; Tue, 15 Aug 2023 17:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692119953; x=1723655953;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=OkwU5NRmSECTN4n1WrNtc+Oy7aJ1i53jsdIQEUuY6OA=;
  b=e15qWMsiZB68/UYr6Xae/NmBJvBfkIt/yCROapfdPCiOe3RB3caHYbcs
   fMQz1rvPsBU5Id3hCANEmq29jY5ZA/LpEeJQcR8bG2AZAFcWmrPrBFnA7
   bk3c3m5/FqGtfd7JhEJ84V4ggp43M8Wjs/p4JWOJG6/NqT7sN/ILLJSTU
   dBf3RbqEGiRGOzlstDsG4OUa9/D9JtTAjdFp9Dnb7RLIzCCcme/iLbYZg
   G51mUHnZT6Vk7C0y4MN86Q0oHUU3e6N/WkfiTkxROdPoVtZofWx4sqpDL
   s3CRJb5aQmMVsiBpePmdKI4zQTvoSSvLSvmU3L/sxeoQS1qIHsw6nyMTE
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="362488603"
X-IronPort-AV: E=Sophos;i="6.01,175,1684825200"; 
   d="scan'208";a="362488603"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2023 10:19:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="848148975"
X-IronPort-AV: E=Sophos;i="6.01,175,1684825200"; 
   d="scan'208";a="848148975"
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
Subject: [PATCH 3/8] KVM: gmem: Fix kvm_gmem_issue_arch_invalidate()
Date: Tue, 15 Aug 2023 10:18:50 -0700
Message-Id: <ed4ab1239f0e048c25154884a1811214fb38587f.1692119201.git.isaku.yamahata@intel.com>
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

__filemap_get_folio() can return error.  Use IS_ERR_OR_NULL.

Signed-off-by: Isaku Yamahata <isaku.yamahata@intel.com>
---
 virt/kvm/guest_mem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/virt/kvm/guest_mem.c b/virt/kvm/guest_mem.c
index c81d2bb9ae93..ed03f1d12172 100644
--- a/virt/kvm/guest_mem.c
+++ b/virt/kvm/guest_mem.c
@@ -53,7 +53,7 @@ static struct folio *kvm_gmem_get_folio(struct inode *inode, pgoff_t index)
 	struct folio *folio;
 
 	folio = kvm_gmem_get_huge_folio(inode, index);
-	if (!folio) {
+	if (IS_ERR_OR_NULL(folio)) {
 		folio = filemap_grab_folio(inode->i_mapping, index);
 		if (!folio)
 			return NULL;
-- 
2.25.1

