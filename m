Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14C0423C6A
	for <linux-coco@lists.linux.dev>; Thu, 22 Jun 2023 23:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687475833; x=1719011833;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ermiXTEXQyF8E2ENU1Af3tf1v3KAorTSmp9Pi7fGpOs=;
  b=nzcA8TojzlLLMBcRfBcfvei7dDuk9JBEF0S2G4eSCy0xYgNUgUQNywCq
   SpyG4t3FLFWVkzlXEzKP9MOiFfvOtSjP1s/5WTEAO4tfpOS9hGKXsjdWs
   96rvpsnKu7UA3e9gRgVs73NoXW6LZ8h7d2/4dPc2Hoh4N+Gm8gmhFZ1JY
   3kQhj5bDR9kqQw/lI0W1iLwnqCHUIQ45SQ2qYDAYBjOjKy3qJJDPL7OS0
   V7SshuNUeEeIzrmtzMpOEYO5RF3lQOdlklWT4XZeva2LSFrkuqKAMJqs0
   lqnUZYTplAS98IQ3OhkILV+s5wvyJI7JlM8IQOdaaec+QgtwTrXND49+c
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="358129717"
X-IronPort-AV: E=Sophos;i="6.01,150,1684825200"; 
   d="scan'208";a="358129717"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2023 16:17:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="718285973"
X-IronPort-AV: E=Sophos;i="6.01,150,1684825200"; 
   d="scan'208";a="718285973"
Received: from ls.sc.intel.com (HELO localhost) ([172.25.112.31])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2023 16:17:10 -0700
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
	Michael Roth <michael.roth@amd.com>
Subject: [RFC PATCH v2 1/6] KVM: selftests: Fix test_add_overlapping_private_memory_regions()
Date: Thu, 22 Jun 2023 16:16:25 -0700
Message-Id: <ac38d8f7248ad5b9fe0bb473d00e8e4430e04028.1687474039.git.isaku.yamahata@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1687474039.git.isaku.yamahata@intel.com>
References: <cover.1687474039.git.isaku.yamahata@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Isaku Yamahata <isaku.yamahata@intel.com>

The last test in test_add_overlapping_private_memory_regions() doesn't use
overlapping regions resulting in the failure.  When the region is overlaps
with the existing ones, the error code is EEXIST instead of EINVAL.  Pass
the overlapping region, and check if the errno is EEXIST.

Fixes: bdb645960cb5 ("KVM: selftests: Expand set_memory_region_test to validate guest_memfd()")
Signed-off-by: Isaku Yamahata <isaku.yamahata@intel.com>
---
Changes v1 -> v2:
- no change
---
 .../selftests/kvm/set_memory_region_test.c       | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/kvm/set_memory_region_test.c b/tools/testing/selftests/kvm/set_memory_region_test.c
index f46841843300..ea7da324c4d6 100644
--- a/tools/testing/selftests/kvm/set_memory_region_test.c
+++ b/tools/testing/selftests/kvm/set_memory_region_test.c
@@ -432,6 +432,7 @@ static void test_add_overlapping_private_memory_regions(void)
 {
 	struct kvm_vm *vm;
 	int memfd;
+	int r;
 
 	pr_info("Testing ADD of overlapping KVM_MEM_PRIVATE memory regions\n");
 
@@ -453,8 +454,19 @@ static void test_add_overlapping_private_memory_regions(void)
 	vm_set_user_memory_region2(vm, MEM_REGION_SLOT, KVM_MEM_PRIVATE,
 				   MEM_REGION_GPA, 0, NULL, -1, 0);
 
-	test_invalid_guest_memfd(vm, memfd, MEM_REGION_SIZE,
-				 "Overlapping guest_memfd() bindings should fail");
+	r = __vm_set_user_memory_region2(vm, MEM_REGION_SLOT, KVM_MEM_PRIVATE,
+					 MEM_REGION_GPA * 2 - MEM_REGION_SIZE,
+					 MEM_REGION_SIZE * 2,
+					 0, memfd, 0);
+	TEST_ASSERT(r == -1 && errno == EEXIST, "%s",
+		    "Overlapping guest_memfd() bindings should fail");
+
+	r = __vm_set_user_memory_region2(vm, MEM_REGION_SLOT, KVM_MEM_PRIVATE,
+					 MEM_REGION_GPA * 2 + MEM_REGION_SIZE,
+					 MEM_REGION_SIZE * 2,
+					 0, memfd, 0);
+	TEST_ASSERT(r == -1 && errno == EEXIST, "%s",
+		    "Overlapping guest_memfd() bindings should fail");
 
 	close(memfd);
 	kvm_vm_free(vm);
-- 
2.25.1

