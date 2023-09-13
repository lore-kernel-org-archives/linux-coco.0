Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1884179BF
	for <linux-coco@lists.linux.dev>; Wed, 13 Sep 2023 10:49:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694602154; x=1726138154;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xwzNgHMxNVvtmveSbOCZiym0KA+uWinftiYSWsEC+Yk=;
  b=LDmn4zQzHQS2kn+IAthxFehDqKBuO3Jf7tGD0p13Q+2CzCsssGFL0pKI
   nsCYMT+QuW6eq52sED7h0qJTZUASl/TqYuJRKjb2CpeEdIpq3/hp2VjOb
   TnM0QrrVH5GHDSOSbODqhFZE5PDCSXgNfVINQa3TbWcoLfSvcl4iShdo/
   Kdeh43BBVlL6AH7AqLR4LxETl37BLOVPJLvLpKVjfE5+B6ZThz8CT1HI8
   L+dsDNFQnTL+AWymJQNu7O6ScFh4UwUroOJAoKV6cBzJEUarFJGX1YVxR
   NFL5Ja0FQWa66u2I/PdedJHPHSHWRFQaRxOZZaOSmNvPYZ5Por9xT15SW
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="377537901"
X-IronPort-AV: E=Sophos;i="6.02,143,1688454000"; 
   d="scan'208";a="377537901"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2023 03:49:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="809635597"
X-IronPort-AV: E=Sophos;i="6.02,143,1688454000"; 
   d="scan'208";a="809635597"
Received: from ls.sc.intel.com (HELO localhost) ([172.25.112.31])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2023 03:49:12 -0700
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
Subject: [RFC PATCH 5/6] KVM: selftests: Add selftest for guest_memfd() fibmap
Date: Wed, 13 Sep 2023 03:48:54 -0700
Message-Id: <dc081ebc9b35f52a95cfa67a1c71781198e3dad5.1694599703.git.isaku.yamahata@intel.com>
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

Signed-off-by: Isaku Yamahata <isaku.yamahata@intel.com>
---
 .../testing/selftests/kvm/guest_memfd_test.c  | 45 +++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/tools/testing/selftests/kvm/guest_memfd_test.c b/tools/testing/selftests/kvm/guest_memfd_test.c
index 4d2b110ab0d6..c20b4a14e9c7 100644
--- a/tools/testing/selftests/kvm/guest_memfd_test.c
+++ b/tools/testing/selftests/kvm/guest_memfd_test.c
@@ -10,6 +10,7 @@
 #include "kvm_util_base.h"
 #include <linux/bitmap.h>
 #include <linux/falloc.h>
+#include <linux/fs.h>
 #include <sys/mman.h>
 #include <sys/types.h>
 #include <sys/stat.h>
@@ -91,6 +92,49 @@ static void test_fallocate(int fd, size_t page_size, size_t total_size)
 	TEST_ASSERT(!ret, "fallocate to restore punched hole should succeed");
 }
 
+static void test_fibmap(int fd, size_t page_size, size_t total_size)
+{
+	int ret;
+	int b;
+	int i;
+
+	/* Make while file unallocated as known initial state */
+	ret = fallocate(fd, FALLOC_FL_KEEP_SIZE | FALLOC_FL_PUNCH_HOLE,
+			0, total_size);
+	TEST_ASSERT(!ret, "fallocate(PUNCH_HOLE) at while file should succeed");
+
+	for (i = 0; i < total_size / page_size; i++) {
+		b = i;
+		ret = ioctl(fd, FIBMAP, &b);
+		if (ret == -EINVAL) {
+			print_skip("Set CONFIG_KVM_GENERIC_PRIVATE_MEM_BMAP=y. bmap test. ");
+			return;
+		}
+		TEST_ASSERT(!ret, "ioctl(FIBMAP) should succeed");
+		TEST_ASSERT(!b, "ioctl(FIBMAP) should return zero 0x%x", b);
+	}
+
+	ret = fallocate(fd, FALLOC_FL_KEEP_SIZE, page_size, page_size * 2);
+	TEST_ASSERT(!ret, "fallocate beginning at page_size should succeed");
+
+	for (i = 0; i < total_size / page_size; i++) {
+		b = i;
+		ret = ioctl(fd, FIBMAP, &b);
+		if (ret == -EINVAL) {
+			print_skip("Set CONFIG_KVM_GENERIC_PRIVATE_MEM_BMAP=y. bmap test. ");
+			return;
+		}
+		TEST_ASSERT(!ret, "ioctl(FIBMAP) should succeed");
+
+		if (i == 1 || i == 2) {
+			TEST_ASSERT(b, "ioctl(FIBMAP) should return non-zero 0x%x", b);
+		} else {
+			TEST_ASSERT(!b, "ioctl(FIBMAP) should return non-zero, 0x%x", b);
+		}
+	}
+
+}
+
 static void test_create_guest_memfd_invalid(struct kvm_vm *vm)
 {
 	uint64_t valid_flags = 0;
@@ -158,6 +202,7 @@ int main(int argc, char *argv[])
 	test_mmap(fd, page_size);
 	test_file_size(fd, page_size, total_size);
 	test_fallocate(fd, page_size, total_size);
+	test_fibmap(fd, page_size, total_size);
 
 	close(fd);
 }
-- 
2.25.1

