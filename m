Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35D5818B17
	for <linux-coco@lists.linux.dev>; Thu, 21 Sep 2023 20:14:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695327290; x=1726863290;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xgBlKNZhDNJa7QFdNnudGsohvQxeiXqUZBEeWY2YObQ=;
  b=bUDyBXXa6bQjMuJrONXV7FSAUNSDBeYS9znQ+MKDQJwiv7TWExVmcs9r
   KX9a7d/P61WECcu3bujfB66BCOxWjDrDExch1GlsO83W1f7VTmv9UQnQ9
   akd3UOq5R5dwXD7LNpc43fjSlQqHF81uBXL92BiBO9JkrBzzcOracJE83
   VHKYi2058GXMAnSBrgfh51rQ+CI9X5oZzWXwDTT5RpzjGzOm9bLVs0XTa
   k0hGdxJeTM/rwiXTiWWaQR+Z3quw6Ia+FWUbwwYO39Nmv9Crnd8KuywrU
   ngKsDtTnY60POJdzDaI1FalnzYsI6Bid5Ya5O4VJDyzoVIBsIT9YCMGK4
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="383401652"
X-IronPort-AV: E=Sophos;i="6.03,166,1694761200"; 
   d="scan'208";a="383401652"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2023 13:14:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="696897810"
X-IronPort-AV: E=Sophos;i="6.03,166,1694761200"; 
   d="scan'208";a="696897810"
Received: from ls.sc.intel.com (HELO localhost) ([172.25.112.31])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2023 13:14:49 -0700
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
Subject: [RFC PATCH v2 5/6] KVM: selftests: Add test cases for KVM_GUEST_MEMORY_FAILURE
Date: Thu, 21 Sep 2023 13:14:38 -0700
Message-Id: <71be0cea7cd1ed2d7d20403a803213a9e2b28c11.1695327124.git.isaku.yamahata@intel.com>
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

Add text cases for guest_memfd KVM_GUEST_MEMORY_FAILURE ioctl.
+ ioctl(KVM_GUEST_MEMORY_FAILURE) success with backing pages
+ ioctl(KVM_GUEST_MEMORY_FAILURE) fails with ENOENT without backing page
+ interaction with fallocate(PUNCH_HOLE)

Signed-off-by: Isaku Yamahata <isaku.yamahata@intel.com>
---
 .../testing/selftests/kvm/guest_memfd_test.c  | 48 +++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/tools/testing/selftests/kvm/guest_memfd_test.c b/tools/testing/selftests/kvm/guest_memfd_test.c
index d5b4bfcdc3fe..f8b242c9319d 100644
--- a/tools/testing/selftests/kvm/guest_memfd_test.c
+++ b/tools/testing/selftests/kvm/guest_memfd_test.c
@@ -122,6 +122,53 @@ static void test_fallocate_fail(int fd, size_t page_size, size_t total_size)
 	}
 }
 
+static void test_memory_failure(int fd, size_t page_size, size_t total_size)
+{
+	struct kvm_guest_memory_failure mf;
+	int ret;
+	int i;
+
+	/* Make whole file unallocated as known initial state */
+	ret = fallocate(fd, FALLOC_FL_KEEP_SIZE | FALLOC_FL_PUNCH_HOLE,
+			0, total_size);
+	TEST_ASSERT(!ret, "fallocate(PUNCH_HOLE) at while file should succeed");
+
+	/* Because there is no backing page, fail to inject memory failure. */
+	for (i = 0; i < total_size / page_size; i++) {
+		mf = (struct kvm_guest_memory_failure) {
+			.offset = i * page_size,
+		};
+
+		ret = ioctl(fd, KVM_GUEST_MEMORY_FAILURE, &mf);
+		if (ret == -1 && errno == EPERM) {
+			pr_info("KVM_GUEST_MEMORY_FAILURE requires CAP_SYS_ADMIN. Skipping.\n")
+			return;
+		}
+		TEST_ASSERT(ret == -1 && errno == ENOENT,
+			    "ioctl(KVM_GUEST_MEMORY_FAILURE) should fail i %d", i);
+	}
+
+	/* Allocate pages with index one and two. */
+	ret = fallocate(fd, FALLOC_FL_KEEP_SIZE, page_size, page_size * 2);
+	TEST_ASSERT(!ret, "fallocate beginning at page_size should succeed");
+
+	for (i = 0; i < total_size / page_size; i++) {
+		mf = (struct kvm_guest_memory_failure) {
+			.offset = i * page_size,
+		};
+
+		ret = ioctl(fd, KVM_GUEST_MEMORY_FAILURE, &mf);
+
+		if (i == 1 || i == 2) {
+			TEST_ASSERT(!ret || (ret == -1 && errno == EBUSY),
+				    "ioctl(KVM_GUEST_MEMORY_FAILURE) should succeed i %d", i);
+		} else {
+			TEST_ASSERT(ret == -1 && errno == ENOENT,
+				    "ioctl(KVM_GUEST_MEMORY_FAILURE) should fail i %d", i);
+		}
+	}
+}
+
 static void test_create_guest_memfd_invalid(struct kvm_vm *vm)
 {
 	uint64_t valid_flags = 0;
@@ -192,6 +239,7 @@ int main(int argc, char *argv[])
 	test_file_size(fd, page_size, total_size);
 	test_fallocate(fd, page_size, total_size);
 	test_fallocate_fail(fd, page_size, total_size);
+	test_memory_failure(fd, page_size, total_size);
 
 	close(fd);
 }
-- 
2.25.1

