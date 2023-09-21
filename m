Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E7E818B0D
	for <linux-coco@lists.linux.dev>; Thu, 21 Sep 2023 20:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695327289; x=1726863289;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=RtfNaKFCK9P/yxwP8BTsIwYqXtE9p2zlPuJXOdTAut0=;
  b=PwInJ2KXLCgq+XukgA8TrRHkjFMbzg0QKgaakfD6vRpCpapwgFs373Ys
   q7x/fy/LRrv8G11T+cKVWLQdYtAl+RK6mlgqA/cJ4geFJayV0zO+ycFof
   nIcmSecCw0/L2t4ykIW16crTpy6HIJW8C82VE0Bv2x4UOmlkMwb1XtHtu
   zpGB4RHagT2GL/YzoVGyMvwFtv8OgHV3JfH3hlvDzLo6OshqpBnmMMtTt
   FwNiWsP5ospFkakQudyZEBdebk1W/xKhcXi8UcnlafyekwBW1gqHRSy5D
   QK/wQy86UHWoeM9uWGE2WyyTiYPufEbWkk+fv9ENpCcwub+vgn4HBx4gn
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="383401617"
X-IronPort-AV: E=Sophos;i="6.03,166,1694761200"; 
   d="scan'208";a="383401617"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2023 13:14:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="696897795"
X-IronPort-AV: E=Sophos;i="6.03,166,1694761200"; 
   d="scan'208";a="696897795"
Received: from ls.sc.intel.com (HELO localhost) ([172.25.112.31])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2023 13:14:47 -0700
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
Subject: [RFC PATCH v2 3/6] KVM: selftests: Add tests for punch hole on guest_memfd
Date: Thu, 21 Sep 2023 13:14:36 -0700
Message-Id: <26822c313754e03b2c393e6fdefe495f117bbfff.1695327124.git.isaku.yamahata@intel.com>
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

Punch hole implies the region is zeroed out. Add tests if the punched
region has zero.
Oppertunistically Remove unused member, pattern, in guest_run_test().

Signed-off-by: Isaku Yamahata <isaku.yamahata@intel.com>
---
 .../kvm/x86_64/private_mem_conversions_test.c | 26 ++++++++++++++-----
 1 file changed, 20 insertions(+), 6 deletions(-)

diff --git a/tools/testing/selftests/kvm/x86_64/private_mem_conversions_test.c b/tools/testing/selftests/kvm/x86_64/private_mem_conversions_test.c
index 50541246d6fd..c05c725645af 100644
--- a/tools/testing/selftests/kvm/x86_64/private_mem_conversions_test.c
+++ b/tools/testing/selftests/kvm/x86_64/private_mem_conversions_test.c
@@ -85,9 +85,10 @@ static void guest_sync_private(uint64_t gpa, uint64_t size, uint8_t pattern)
 /* Arbitrary values, KVM doesn't care about the attribute flags. */
 #define MAP_GPA_SHARED		BIT(0)
 #define MAP_GPA_DO_FALLOCATE	BIT(1)
+#define MAP_GPA_FALLOCATE_ONLY	BIT(2)
 
 static void guest_map_mem(uint64_t gpa, uint64_t size, bool map_shared,
-			  bool do_fallocate)
+			  bool do_fallocate, bool fallocate_only)
 {
 	uint64_t flags = 0;
 
@@ -95,17 +96,24 @@ static void guest_map_mem(uint64_t gpa, uint64_t size, bool map_shared,
 		flags |= MAP_GPA_SHARED;
 	if (do_fallocate)
 		flags |= MAP_GPA_DO_FALLOCATE;
+	if (fallocate_only)
+		flags |= MAP_GPA_FALLOCATE_ONLY;
 	kvm_hypercall_map_gpa_range(gpa, size, flags);
 }
 
 static void guest_map_shared(uint64_t gpa, uint64_t size, bool do_fallocate)
 {
-	guest_map_mem(gpa, size, true, do_fallocate);
+	guest_map_mem(gpa, size, true, do_fallocate, false);
 }
 
 static void guest_map_private(uint64_t gpa, uint64_t size, bool do_fallocate)
 {
-	guest_map_mem(gpa, size, false, do_fallocate);
+	guest_map_mem(gpa, size, false, do_fallocate, false);
+}
+
+static void guest_punch_hole_private(uint64_t gpa, uint64_t size)
+{
+	guest_map_mem(gpa, size, true, true, true);
 }
 
 static void guest_run_test(uint64_t base_gpa, bool do_fallocate)
@@ -113,7 +121,6 @@ static void guest_run_test(uint64_t base_gpa, bool do_fallocate)
 	struct {
 		uint64_t offset;
 		uint64_t size;
-		uint8_t pattern;
 	} stages[] = {
 		GUEST_STAGE(0, PAGE_SIZE),
 		GUEST_STAGE(0, SZ_2M),
@@ -156,6 +163,10 @@ static void guest_run_test(uint64_t base_gpa, bool do_fallocate)
 
 		if (size > PAGE_SIZE) {
 			memset((void *)gpa, p2, PAGE_SIZE);
+
+			/* Test if punch hole results in zeroing page. */
+			guest_punch_hole_private(gpa, PAGE_SIZE);
+			memcmp_g(gpa, 0, PAGE_SIZE);
 			goto skip;
 		}
 
@@ -229,6 +240,7 @@ static void handle_exit_hypercall(struct kvm_vcpu *vcpu)
 	uint64_t size = run->hypercall.args[1] * PAGE_SIZE;
 	bool map_shared = run->hypercall.args[2] & MAP_GPA_SHARED;
 	bool do_fallocate = run->hypercall.args[2] & MAP_GPA_DO_FALLOCATE;
+	bool fallocate_only = run->hypercall.args[2] & MAP_GPA_FALLOCATE_ONLY;
 	struct kvm_vm *vm = vcpu->vm;
 
 	TEST_ASSERT(run->hypercall.nr == KVM_HC_MAP_GPA_RANGE,
@@ -238,8 +250,10 @@ static void handle_exit_hypercall(struct kvm_vcpu *vcpu)
 	if (do_fallocate)
 		vm_guest_mem_fallocate(vm, gpa, size, map_shared);
 
-	vm_set_memory_attributes(vm, gpa, size,
-				 map_shared ? 0 : KVM_MEMORY_ATTRIBUTE_PRIVATE);
+	if (!fallocate_only)
+		vm_set_memory_attributes(vm, gpa, size,
+					 map_shared ?
+					 0 : KVM_MEMORY_ATTRIBUTE_PRIVATE);
 	run->hypercall.ret = 0;
 }
 
-- 
2.25.1

