Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D3AC18B1D
	for <linux-coco@lists.linux.dev>; Thu, 21 Sep 2023 20:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695327291; x=1726863291;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dm/BsRbcZi8npHyGQ8jehfHjGfIx8Vcs8CXWsZn7TdU=;
  b=Xy+hyeXoKND8kCUYnUDmGP4XoeDpQmpwfvdsN5rc08FRMVNJsVQJgpt5
   wtuDg0EUO+hnTIE3bRc9gNZ2A8zSZ1KPQgjG1T0aGIshPnapOLH5n9HUw
   XXoyqN4VTm7s5r7QWVOxQr3XC0HPRySGZ4XjLmUw1VMul3h3vXexdNnRK
   dj+JwwmjnaMpbH7ns+mIqGH5q/9L5TG/9LaDZDr7FgowmhnmdeEvl1Q9K
   QGPjDg/L5XREp8NMovHJB0xvPSitpru7AsazZA8LwSyY262k8fHHdRbMp
   SyqomGx/eUUzk0soCWUiLEq41dbhNEXYCcYzu6pTLCQc0zIukofEnIKc0
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="383401661"
X-IronPort-AV: E=Sophos;i="6.03,166,1694761200"; 
   d="scan'208";a="383401661"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2023 13:14:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="696897814"
X-IronPort-AV: E=Sophos;i="6.03,166,1694761200"; 
   d="scan'208";a="696897814"
Received: from ls.sc.intel.com (HELO localhost) ([172.25.112.31])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2023 13:14:50 -0700
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
Subject: [RFC PATCH v2 6/6] KVM: guest_memfd: selftest: Add test case for error_remove_page method
Date: Thu, 21 Sep 2023 13:14:39 -0700
Message-Id: <7fddbf10494490251f2156fd600306991826165f.1695327124.git.isaku.yamahata@intel.com>
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

This test case implements fault injection into guest memory by
madvise(MADV_HWPOISON) for shared(conventional) memory region and
KVM_GUEST_MEMORY_FAILURE for private gmem region.  Once page is poisoned,
free the poisoned page and try to run vcpu again to see a new zero page is
assigned.

Signed-off-by: Isaku Yamahata <isaku.yamahata@intel.com>
---
 tools/testing/selftests/kvm/Makefile          |   1 +
 .../kvm/x86_64/private_mem_hwpoison_test.c    | 367 ++++++++++++++++++
 2 files changed, 368 insertions(+)
 create mode 100644 tools/testing/selftests/kvm/x86_64/private_mem_hwpoison_test.c

diff --git a/tools/testing/selftests/kvm/Makefile b/tools/testing/selftests/kvm/Makefile
index f7fdd8244547..a72d0946c233 100644
--- a/tools/testing/selftests/kvm/Makefile
+++ b/tools/testing/selftests/kvm/Makefile
@@ -82,6 +82,7 @@ TEST_GEN_PROGS_x86_64 += x86_64/nested_exceptions_test
 TEST_GEN_PROGS_x86_64 += x86_64/platform_info_test
 TEST_GEN_PROGS_x86_64 += x86_64/pmu_event_filter_test
 TEST_GEN_PROGS_x86_64 += x86_64/private_mem_conversions_test
+TEST_GEN_PROGS_x86_64 += x86_64/private_mem_hwpoison_test
 TEST_GEN_PROGS_x86_64 += x86_64/private_mem_kvm_exits_test
 TEST_GEN_PROGS_x86_64 += x86_64/set_boot_cpu_id
 TEST_GEN_PROGS_x86_64 += x86_64/set_sregs_test
diff --git a/tools/testing/selftests/kvm/x86_64/private_mem_hwpoison_test.c b/tools/testing/selftests/kvm/x86_64/private_mem_hwpoison_test.c
new file mode 100644
index 000000000000..78242ee8c8db
--- /dev/null
+++ b/tools/testing/selftests/kvm/x86_64/private_mem_hwpoison_test.c
@@ -0,0 +1,367 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2022, Google LLC.
+ * Copyright (C) 2023, Intel Corp.
+ */
+#define _GNU_SOURCE /* for program_invocation_short_name */
+#include <fcntl.h>
+#include <limits.h>
+#include <pthread.h>
+#include <sched.h>
+#include <signal.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <sys/ioctl.h>
+#include <setjmp.h>
+
+#include <linux/compiler.h>
+#include <linux/kernel.h>
+#include <linux/kvm_para.h>
+#include <linux/memfd.h>
+#include <linux/sizes.h>
+#include <linux/fs.h>
+
+#include <test_util.h>
+#include <kvm_util.h>
+#include <processor.h>
+
+#define BASE_DATA_SLOT		10
+#define BASE_DATA_GPA		((uint64_t)(1ull << 32))
+#define PER_CPU_DATA_SIZE	((uint64_t)(SZ_2M))
+
+enum ucall_syncs {
+	HWPOISON_SHARED,
+	HWPOISON_PRIVATE,
+};
+
+static void guest_sync_shared(uint64_t gpa)
+{
+	GUEST_SYNC2(HWPOISON_SHARED, gpa);
+}
+
+static void guest_sync_private(uint64_t gpa)
+{
+	GUEST_SYNC2(HWPOISON_PRIVATE, gpa);
+}
+
+/* Arbitrary values, KVM doesn't care about the attribute flags. */
+#define MAP_GPA_SHARED		BIT(0)
+#define MAP_GPA_DO_FALLOCATE	BIT(1)
+#define MAP_GPA_HWPOISON	BIT(2)
+
+static void guest_map_mem(uint64_t gpa, uint64_t size, bool map_shared,
+			  bool do_fallocate, bool hwpoison)
+{
+	uint64_t flags = 0;
+
+	if (map_shared)
+		flags |= MAP_GPA_SHARED;
+	if (do_fallocate)
+		flags |= MAP_GPA_DO_FALLOCATE;
+	if (hwpoison)
+		flags |= MAP_GPA_HWPOISON;
+	kvm_hypercall_map_gpa_range(gpa, size, flags);
+}
+
+static void guest_map_shared(uint64_t gpa, uint64_t size, bool do_fallocate,
+			     bool hwpoison)
+{
+	guest_map_mem(gpa, size, true, do_fallocate, hwpoison);
+}
+
+static void guest_map_private(uint64_t gpa, uint64_t size, bool do_fallocate,
+			      bool hwpoison)
+{
+	guest_map_mem(gpa, size, false, do_fallocate, hwpoison);
+}
+
+static void guest_run_test(uint64_t base_gpa, bool huge_page,
+			   bool test_shared)
+{
+	uint64_t gpa = base_gpa + (huge_page ? 0 : PAGE_SIZE);
+	uint64_t size = huge_page ? SZ_2M : PAGE_SIZE;
+	const uint8_t init_p = 0xcc;
+	uint64_t r;
+
+	/* Memory should be shared by default. */
+	guest_map_shared(base_gpa, PER_CPU_DATA_SIZE, true, false);
+	memset((void *)base_gpa, 0, PER_CPU_DATA_SIZE);
+
+	/*
+	 * Set the test region to non-zero to differentiate it from the page
+	 * newly assigned.
+	 */
+	memset((void *)gpa, init_p, size);
+
+	/* Ask VMM to convert to private/shared the page and poison it. */
+	if (test_shared) {
+		guest_map_shared(gpa, size, true, true);
+		guest_sync_shared(gpa);
+	} else {
+		guest_map_private(gpa, size, true, true);
+		guest_sync_private(gpa);
+	}
+
+	/* Consume poisoned data. */
+	r = READ_ONCE(*(uint64_t *)gpa);
+	/* Discard the poisoned page and assign a new page. */
+	GUEST_ASSERT_EQ((uint8_t)r, 0);
+}
+
+static void guest_code(uint64_t base_gpa, bool huge_page, bool test_shared)
+{
+	guest_run_test(base_gpa, huge_page, test_shared);
+	GUEST_DONE();
+}
+
+static void handle_exit_hypercall(struct kvm_vcpu *vcpu)
+{
+	struct kvm_run *run = vcpu->run;
+	uint64_t gpa = run->hypercall.args[0];
+	uint64_t size = run->hypercall.args[1] * PAGE_SIZE;
+	bool map_shared = run->hypercall.args[2] & MAP_GPA_SHARED;
+	bool do_fallocate = run->hypercall.args[2] & MAP_GPA_DO_FALLOCATE;
+	struct kvm_vm *vm = vcpu->vm;
+
+	TEST_ASSERT(run->hypercall.nr == KVM_HC_MAP_GPA_RANGE,
+		    "Wanted MAP_GPA_RANGE (%u), got '%llu'",
+		    KVM_HC_MAP_GPA_RANGE, run->hypercall.nr);
+
+	if (do_fallocate)
+		vm_guest_mem_fallocate(vm, gpa, size, map_shared);
+
+	vm_set_memory_attributes(vm, gpa, size,
+				 map_shared ? 0 : KVM_MEMORY_ATTRIBUTE_PRIVATE);
+	run->hypercall.ret = 0;
+}
+
+static void inject_memory_failure(int gmem_fd, uint64_t gpa)
+{
+	/* See vm_mem_add() in test_mem_failure() */
+	uint64_t offset = gpa - BASE_DATA_GPA;
+	struct kvm_guest_memory_failure mf = {
+		.offset = offset,
+	};
+	int ret;
+
+	ret = ioctl(gmem_fd, KVM_GUEST_MEMORY_FAILURE, &mf);
+	__TEST_REQUIRE(!(ret == -1 && errno == EPERM),
+		       "Injecting memory fault requires CAP_SYS_ADMIN");
+	TEST_ASSERT(!ret || (ret == -1 && errno == EBUSY),
+		    "ioctl(KVM_GUEST_MEMORY_FAILURE) should success");
+}
+
+static sigjmp_buf sigbuf;
+
+static void sigbus_handler(int sig, siginfo_t *info, void *data)
+{
+	TEST_ASSERT(sig == SIGBUS, "Unknown signal received %d\n", sig);
+	siglongjmp(sigbuf, 1);
+}
+
+static bool run_vcpus;
+
+struct test_args {
+	struct kvm_vcpu *vcpu;
+	int gmem_fd;
+	bool huge_page;
+	bool test_shared;
+};
+
+static void *__test_mem_failure(void *__args)
+{
+	struct test_args *args = __args;
+	struct kvm_vcpu *vcpu = args->vcpu;
+	struct kvm_run *run = vcpu->run;
+	struct kvm_vm *vm = vcpu->vm;
+	int gmem_fd = args->gmem_fd;
+	struct ucall uc;
+
+	while (!READ_ONCE(run_vcpus))
+		;
+
+	for ( ;; ) {
+		vcpu_run(vcpu);
+
+		if (run->exit_reason == KVM_EXIT_HYPERCALL) {
+			handle_exit_hypercall(vcpu);
+			continue;
+		}
+
+		TEST_ASSERT(run->exit_reason == KVM_EXIT_IO,
+			    "Wanted KVM_EXIT_IO, got exit reason: %u (%s)",
+			    run->exit_reason, exit_reason_str(run->exit_reason));
+
+		switch (get_ucall(vcpu, &uc)) {
+		case UCALL_ABORT:
+			REPORT_GUEST_ASSERT(uc);
+			break;
+		case UCALL_SYNC: {
+			uint64_t gpa = uc.args[1];
+
+			TEST_ASSERT(uc.args[0] == HWPOISON_SHARED ||
+				    uc.args[0] == HWPOISON_PRIVATE,
+				    "Unknown sync command '%ld'", uc.args[0]);
+
+			if (uc.args[0] == HWPOISON_PRIVATE) {
+				int ret;
+
+				inject_memory_failure(gmem_fd, gpa);
+				ret = _vcpu_run(vcpu);
+				TEST_ASSERT(ret == -1 && errno == EHWPOISON &&
+					    run->exit_reason == KVM_EXIT_MEMORY_FAULT,
+					    "exit_reason 0x%x",
+					    run->exit_reason);
+				/* Discard the poisoned page and assign new page. */
+				vm_guest_mem_fallocate(vm, gpa, PAGE_SIZE, true);
+			} else {
+				uint8_t *hva = addr_gpa2hva(vm, gpa);
+				int r;
+
+				r = madvise(hva, 8, MADV_HWPOISON);
+				__TEST_REQUIRE(!(r == -1 && errno == EPERM),
+					       "madvise(MADV_HWPOISON) requires CAP_SYS_ADMIN");
+				TEST_ASSERT(!r, "madvise(MADV_HWPOISON) should succeed");
+				if (sigsetjmp(sigbuf, 1)) {
+					TEST_ASSERT(!sigaction(SIGBUS, NULL, NULL),
+						    "sigaction should success");
+					r = madvise(hva, PAGE_SIZE, MADV_FREE);
+					TEST_ASSERT(!r, "madvise(MADV_FREE) should success");
+				} else {
+					struct sigaction sa = {
+						.sa_sigaction = sigbus_handler,
+						.sa_flags = SA_SIGINFO,
+					};
+					TEST_ASSERT(!sigaction(SIGBUS, &sa, NULL),
+						    "sigaction should success");
+					/* Trigger SIGBUS */
+					vcpu_run(vcpu);
+				}
+			}
+			break;
+		}
+		case UCALL_DONE:
+			return NULL;
+		default:
+			TEST_FAIL("Unknown ucall 0x%lx.", uc.cmd);
+		}
+	}
+}
+
+static void test_mem_failure(enum vm_mem_backing_src_type src_type, uint32_t nr_vcpus,
+			     uint32_t nr_memslots, bool huge_page, bool test_shared)
+{
+	/*
+	 * Allocate enough memory so that each vCPU's chunk of memory can be
+	 * naturally aligned with respect to the size of the backing store.
+	 */
+	const size_t size = align_up(PER_CPU_DATA_SIZE, get_backing_src_pagesz(src_type));
+	const size_t memfd_size = size * nr_vcpus;
+	struct kvm_vcpu *vcpus[KVM_MAX_VCPUS];
+	pthread_t threads[KVM_MAX_VCPUS];
+	uint64_t gmem_flags;
+	struct kvm_vm *vm;
+	int memfd, i;
+
+	const struct vm_shape shape = {
+		.mode = VM_MODE_DEFAULT,
+		.type = KVM_X86_SW_PROTECTED_VM,
+	};
+
+	vm = __vm_create_with_vcpus(shape, nr_vcpus, 0, guest_code, vcpus);
+
+	vm_enable_cap(vm, KVM_CAP_EXIT_HYPERCALL, (1 << KVM_HC_MAP_GPA_RANGE));
+
+	if (huge_page && !backing_src_can_be_huge(src_type))
+		TEST_FAIL("Huge page is requested, but not supported");
+	if (backing_src_can_be_huge(src_type))
+		gmem_flags = KVM_GUEST_MEMFD_ALLOW_HUGEPAGE;
+	else
+		gmem_flags = 0;
+	memfd = vm_create_guest_memfd(vm, memfd_size, gmem_flags);
+
+	for (i = 0; i < nr_memslots; i++)
+		vm_mem_add(vm, src_type, BASE_DATA_GPA + size * i,
+			   BASE_DATA_SLOT + i, size / vm->page_size,
+			   KVM_MEM_PRIVATE, memfd, size * i);
+
+	for (i = 0; i < nr_vcpus; i++) {
+		uint64_t gpa =  BASE_DATA_GPA + i * size;
+		struct test_args args;
+
+		vcpu_args_set(vcpus[i], 3, gpa, huge_page, test_shared);
+
+		virt_map(vm, gpa, gpa, size / vm->page_size);
+
+		args = (struct test_args) {
+			.vcpu = vcpus[i],
+			.gmem_fd = memfd,
+			.huge_page = huge_page,
+			.test_shared = test_shared,
+		};
+		pthread_create(&threads[i], NULL, __test_mem_failure, &args);
+	}
+
+	WRITE_ONCE(run_vcpus, true);
+
+	for (i = 0; i < nr_vcpus; i++)
+		pthread_join(threads[i], NULL);
+
+	kvm_vm_free(vm);
+
+	close(memfd);
+}
+
+static void help(const char *prog_name)
+{
+	printf("usage: %s [-h] [-m] [-M] [-n nr_vcpus] [-s mem_type] [-?]\n"
+	       " -h: use huge page\n"
+	       " -m: use multiple memslots (default: 1)\n"
+	       " -n: specify the number of vcpus (default: 1)\n"
+	       " -s: specify the memory type\n"
+	       " -?: print this message\n",
+	       prog_name);
+}
+
+int main(int argc, char *argv[])
+{
+	enum vm_mem_backing_src_type src_type = DEFAULT_VM_MEM_SRC;
+	bool use_multiple_memslots = false;
+	bool huge_page = false;
+	uint32_t nr_vcpus = 1;
+	uint32_t nr_memslots;
+	int opt;
+
+	TEST_REQUIRE(kvm_has_cap(KVM_CAP_EXIT_HYPERCALL));
+	TEST_REQUIRE(kvm_check_cap(KVM_CAP_VM_TYPES) &
+		     BIT(KVM_X86_SW_PROTECTED_VM));
+
+	while ((opt = getopt(argc, argv, "hmn:s:S?")) != -1) {
+		switch (opt) {
+		case 'h':
+			huge_page = true;
+			break;
+		case 'm':
+			use_multiple_memslots = true;
+			break;
+		case 'n':
+			nr_vcpus = atoi_positive("nr_vcpus", optarg);
+			break;
+		case 's':
+			src_type = parse_backing_src_type(optarg);
+			break;
+		case '?':
+		default:
+			help(argv[0]);
+			exit(0);
+		}
+	}
+
+	nr_memslots = use_multiple_memslots ? nr_vcpus : 1;
+
+	test_mem_failure(src_type, nr_vcpus, nr_memslots, huge_page, true);
+	test_mem_failure(src_type, nr_vcpus, nr_memslots, huge_page, false);
+
+	return 0;
+}
-- 
2.25.1

