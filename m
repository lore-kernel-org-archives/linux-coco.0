Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00C3C10EE
	for <linux-coco@lists.linux.dev>; Wed, 28 Jun 2023 22:43:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687992221; x=1719528221;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CfrGuoqJ0Z2MzAHPaiTO3KDD2FUDhhBeXfYraoPJAuA=;
  b=komIPeQP6NSZmZknCX8NVMgi+8POrqy/VRebvbHwD30qc/nxNgoGE6Cy
   oX9S2vLgaY/Csz0MVwQvfgmt32rwsB0byD2aOx1UTNPWBX9L/imJjkHe+
   sWAx/m42lSLlgaS4sCUo8Qf17p6HycsS+eDFeWJ3qSv1lAfyuE3L1Umel
   FhXwRtFB7oZsOnzalPXvk6IFBm5f4BnP7sEs5F9PVN9oDCYmfnqQJpUcN
   HqbmBpJ/+6gyzRUdKvlRAxSkY2d8W/tltNwhIrJRBnQApP3++9gwcyexv
   XHuH43x/PhaLJlWcIdp/nFVizoqC+Rswg6WvK1F/GGJZQk6P3XJMdDvVg
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="392699130"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200"; 
   d="scan'208";a="392699130"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2023 15:43:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="830299989"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200"; 
   d="scan'208";a="830299989"
Received: from ls.sc.intel.com (HELO localhost) ([172.25.112.31])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2023 15:43:21 -0700
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
Subject: [RFC PATCH v3 03/11] KVM: selftests: x86: typo in private_mem_conversions_test.c
Date: Wed, 28 Jun 2023 15:43:02 -0700
Message-Id: <643ea41e42fe03e2233100069f76a023fb2e0685.1687991811.git.isaku.yamahata@intel.com>
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

Fix typo in the comment in private_mem_conversions_test.c.

Fixes: a0f5f8c91180 ("KVM: selftests: x86: Add selftest for private memory conversions")
Signed-off-by: Isaku Yamahata <isaku.yamahata@intel.com>

---
Changes v2 -> v3:
- Newly added
---
 .../testing/selftests/kvm/x86_64/private_mem_conversions_test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/x86_64/private_mem_conversions_test.c b/tools/testing/selftests/kvm/x86_64/private_mem_conversions_test.c
index 9b9dd197a260..de6fdb129c68 100644
--- a/tools/testing/selftests/kvm/x86_64/private_mem_conversions_test.c
+++ b/tools/testing/selftests/kvm/x86_64/private_mem_conversions_test.c
@@ -227,7 +227,7 @@ static void *__test_mem_conversions(void *__vcpu)
 			/* In all cases, the host should observe the shared data. */
 			memcmp_h(hva, uc.args[3], size);
 
-			/* For shared, write the new patter to guest memory. */
+			/* For shared, write the new pattern to guest memory. */
 			if (uc.args[0] == SYNC_SHARED)
 				memset(hva, uc.args[4], size);
 			break;
-- 
2.25.1

