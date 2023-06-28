Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8FCF6FBE
	for <linux-coco@lists.linux.dev>; Wed, 28 Jun 2023 22:43:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687992219; x=1719528219;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=QjzjGI4HpC0gb3kGtq3uL/qndabYhUtInoPjaSCgPgg=;
  b=VeWv7Kwkhr3psIFQWSyC0jXKnaVMp5OpY5aYY5OeC07jWDx3CYPJseLG
   k/0Fhoj/CmEzKnEFY5siyKVYbmFi0HiKRBgGc8VjCTe4+c10XdI2zKPIk
   QiOyWC2nzbPNfNidkNkD83+MR2fJLX5+UnKR1vYck9lkQaXTZTGZ1cSP8
   SNf3pSy+VP4bhnN3UE8jhdT5Aoe/OjvdLX47NB8nk6OC44c2mT9KurKDX
   p8ljA9OYgtcSgpdcG57acpU9d58dEmOJYzMuW3KqmZoFywjXUBD/qdTQ2
   19hsP+mWh5z/EgaILE7hOeQAj/ue4yODdYtACyWJOTBVk1nPmbZOQDDqL
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="392699123"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200"; 
   d="scan'208";a="392699123"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2023 15:43:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="830299984"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200"; 
   d="scan'208";a="830299984"
Received: from ls.sc.intel.com (HELO localhost) ([172.25.112.31])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2023 15:43:20 -0700
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
Subject: [RFC PATCH v3 02/11] KVM: selftests: Fix guest_memfd()
Date: Wed, 28 Jun 2023 15:43:01 -0700
Message-Id: <4095debe0b61fd7de1884ef82d671d30277a9251.1687991811.git.isaku.yamahata@intel.com>
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

Some test cases should succeed.  Check !ret instead of ret.

Fixes: 36eedd5b91e3 ("KVM: selftests: Add basic selftest for guest_memfd()")
Signed-off-by: Isaku Yamahata <isaku.yamahata@intel.com>

---
Changes v2 -> v3:
- no change

Changes v1 -> v2:
- no change
---
 tools/testing/selftests/kvm/guest_memfd_test.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/kvm/guest_memfd_test.c b/tools/testing/selftests/kvm/guest_memfd_test.c
index 3b6532b833b2..f3b99c1e5464 100644
--- a/tools/testing/selftests/kvm/guest_memfd_test.c
+++ b/tools/testing/selftests/kvm/guest_memfd_test.c
@@ -72,11 +72,11 @@ static void test_fallocate(int fd, size_t page_size, size_t total_size)
 
 	ret = fallocate(fd, FALLOC_FL_KEEP_SIZE | FALLOC_FL_PUNCH_HOLE,
 			total_size, page_size);
-	TEST_ASSERT(ret, "fallocate(PUNCH_HOLE) at total_size should be fine (no-op)");
+	TEST_ASSERT(!ret, "fallocate(PUNCH_HOLE) at total_size should be fine (no-op)");
 
 	ret = fallocate(fd, FALLOC_FL_KEEP_SIZE | FALLOC_FL_PUNCH_HOLE,
 			total_size + page_size, page_size);
-	TEST_ASSERT(ret, "fallocate(PUNCH_HOLE) after total_size should be fine (no-op)");
+	TEST_ASSERT(!ret, "fallocate(PUNCH_HOLE) after total_size should be fine (no-op)");
 
 	ret = fallocate(fd, FALLOC_FL_KEEP_SIZE | FALLOC_FL_PUNCH_HOLE,
 			page_size, page_size - 1);
-- 
2.25.1

