Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1879E28EA
	for <linux-coco@lists.linux.dev>; Tue, 10 Oct 2023 08:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bKMe2R3f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696926942; x=1728462942;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=o5MD2FPMw4tHBthOkn4CAG942xWE4Di7Fgiy08pHbDg=;
  b=bKMe2R3f60l/humPONwhxlZaeF2HCpP11LKZINIsZrtkBugkxHHP2z1W
   XbPhIY4QkDUUdw2sZV/JCWaKJsdyniXHTUsU3M6hRMVwWYOGc/5VmdO43
   ocAwLQo2SequNn8Nhn3hYRTFPqFZKxchzU1LBnQzkIb/HK+T8CeR5Sxmp
   vTy0m0qj8GbHv/TMFaQ4N9JQmXnrn/+XssimaETdc3gjKTbcMgAtNaC8F
   RxoUR8ft6Nk7XblfRuxDL9xeuqoZac7/KqIW4TgExUfdCVIW8iTi3uQi6
   7ppsT2n9QvQwcRU1NaRPeGCuBDy/mzAbKvV3qnq4/6jHaxo3ChaBxu9vM
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="363689850"
X-IronPort-AV: E=Sophos;i="6.03,212,1694761200"; 
   d="scan'208";a="363689850"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2023 01:35:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="1084687210"
X-IronPort-AV: E=Sophos;i="6.03,212,1694761200"; 
   d="scan'208";a="1084687210"
Received: from ls.sc.intel.com (HELO localhost) ([172.25.112.31])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2023 01:35:36 -0700
From: isaku.yamahata@intel.com
To: kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: isaku.yamahata@intel.com,
	isaku.yamahata@gmail.com,
	Michael Roth <michael.roth@amd.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	linux-coco@lists.linux.dev,
	Chao Peng <chao.p.peng@linux.intel.com>
Subject: [PATCH 11/12] KVM: selftests: lib: Add src memory type for hwpoison test
Date: Tue, 10 Oct 2023 01:35:19 -0700
Message-Id: <f3fe54089dd91357a29590444cf1a41abee39a9a.1696926843.git.isaku.yamahata@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1696926843.git.isaku.yamahata@intel.com>
References: <cover.1696926843.git.isaku.yamahata@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Isaku Yamahata <isaku.yamahata@intel.com>

For hwpoison test to recover hwpoisoned memory, use madvise(MADV_FREE) that
requires private mapping.  Add a new src memory type for it.

Signed-off-by: Isaku Yamahata <isaku.yamahata@intel.com>
---
 tools/testing/selftests/kvm/include/test_util.h | 2 ++
 tools/testing/selftests/kvm/lib/kvm_util.c      | 7 +++++--
 tools/testing/selftests/kvm/lib/test_util.c     | 8 ++++++++
 3 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/kvm/include/test_util.h b/tools/testing/selftests/kvm/include/test_util.h
index 7e614adc6cf4..c97af4ff0699 100644
--- a/tools/testing/selftests/kvm/include/test_util.h
+++ b/tools/testing/selftests/kvm/include/test_util.h
@@ -111,6 +111,8 @@ enum vm_mem_backing_src_type {
 	VM_MEM_SRC_ANONYMOUS_HUGETLB_16GB,
 	VM_MEM_SRC_SHMEM,
 	VM_MEM_SRC_SHARED_HUGETLB,
+	VM_MEM_SRC_ANONYMOUS_MEMFD,
+	VM_MEM_SRC_ANONYMOUS_MEMFD_HUGETLB,
 	NUM_SRC_TYPES,
 };
 
diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
index 310c3a760cb8..95ffb3b97dcf 100644
--- a/tools/testing/selftests/kvm/lib/kvm_util.c
+++ b/tools/testing/selftests/kvm/lib/kvm_util.c
@@ -1007,9 +1007,12 @@ void __vm_userspace_mem_region_add(struct kvm_vm *vm,
 		region->mmap_size += alignment;
 
 	region->fd = -1;
-	if (backing_src_is_shared(src_type))
+	if (backing_src_is_shared(src_type) ||
+		src_type == VM_MEM_SRC_ANONYMOUS_MEMFD ||
+		src_type == VM_MEM_SRC_ANONYMOUS_MEMFD_HUGETLB)
 		region->fd = kvm_memfd_alloc(region->mmap_size,
-					     src_type == VM_MEM_SRC_SHARED_HUGETLB);
+					     src_type == VM_MEM_SRC_SHARED_HUGETLB ||
+					     src_type == VM_MEM_SRC_ANONYMOUS_MEMFD_HUGETLB);
 
 	region->mmap_start = mmap(NULL, region->mmap_size,
 				  PROT_READ | PROT_WRITE,
diff --git a/tools/testing/selftests/kvm/lib/test_util.c b/tools/testing/selftests/kvm/lib/test_util.c
index 5d7f28b02d73..a09bba5c074e 100644
--- a/tools/testing/selftests/kvm/lib/test_util.c
+++ b/tools/testing/selftests/kvm/lib/test_util.c
@@ -281,6 +281,14 @@ const struct vm_mem_backing_src_alias *vm_mem_backing_src_alias(uint32_t i)
 			 */
 			.flag = MAP_SHARED,
 		},
+		[VM_MEM_SRC_ANONYMOUS_MEMFD] = {
+			.name = "anonymous_memfd",
+			.flag = ANON_FLAGS,
+		},
+		[VM_MEM_SRC_ANONYMOUS_MEMFD_HUGETLB] = {
+			.name = "anonymous_memfd_hugetlb",
+			.flag = ANON_HUGE_FLAGS,
+		},
 	};
 	_Static_assert(ARRAY_SIZE(aliases) == NUM_SRC_TYPES,
 		       "Missing new backing src types?");
-- 
2.25.1

