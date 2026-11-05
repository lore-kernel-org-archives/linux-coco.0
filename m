Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793922463;
	b=hkJGbBvHGcSv3619afGxuueAEYLcMaOZyBQ5r3oRCTp3/Ce569o4iZT2GLo0QDk94n8n
	 OQCQQ/L9SzaTfzQDrqdl2xj61crVw/3DBGBtU3eaHQszb23cxTqbhP3VOGLVF2GoJ14xh
	 /76Vul2sKSgo2lyvTGUbOw57YPj/M2enYvCa3XO95QF23jxB2APVYU9dKjEqntEbXLO+L
	 B8cjaZ4LqpqN4cwLtfT8Yt5CgZY5OlSMHKaLczGwylIDqvjeK6bpySzI/OJxVlcqEPnWw
	 IGYJFf0qnuwx35T2bAVXvviFDUOM0Q7nUNvcBAo3TDQvFp1MhTpAWU3sT04gwFFgsCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793922463;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Developer-Key:X-Developer-Signature:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=x/RKRDin2OptMojaeCsUiaSs9Kk46RnHWwkRmbHSsgw=;
	b=s/cnJGkWptMDOkxkSIrHS/uq4XFAV/c+AvBLNTpPbo9GPxg0quR3VntfR+L6zVYZ1hIq
	 0wvL+IpFf9jG6tugh9zsWCYl/cv5xmAZ6f2KLyOwAyezxVqI5zflGhX+UifYUTlmI1XAj
	 bOoN2o3B6reaG6gtmMPSWv5l3D3af6RidKZYrdgm5qvLT1KV2l4sO9k+J4j8kTdCVi1Ml
	 hLL3X9XHqiHFE8RjwWJZ7u5FB3Tt+o0AdXi4MOUbrK9JcWAVWjNzK7+JiXqIr2xolPFoP
	 knjIdHA3xAAdzLVusfkUulWwQkaJCtt33iWDLHP3C48C7hM8O1QZgtmGZUJN/bRB83g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--wyihan.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=pn1CPcAx;
	arc=none smtp.remote-ip=209.85.210.200
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88A48606EEA4
	for <linux-coco@lists.linux.dev>; Thu,  5 Nov 2026 23:47:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88A48606EEA4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wyihan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=pn1CPcAx
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8a06bc723b1so32240b3a.2
        for <linux-coco@lists.linux.dev>; Thu, 05 Nov 2026 15:47:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793922462; x=1794527262; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x/RKRDin2OptMojaeCsUiaSs9Kk46RnHWwkRmbHSsgw=;
        b=pn1CPcAx+iSBjNhOIPPMJnywUyTcFkAysf0ZFioWSNLL7hHiHjJ/IaMTK1cK1ACVHl
         AV1yx5kCAgud7Z69+1ZQD0yCJJ9nRU/lidvb0Xo7oEOpJWXTj9rSls62HAAHw5mUZYMy
         ZLgrSAlvOQVnXjJd/Kb/io4syAt7Rp1Bvsn3klnR/p0KK3K/Nk3AhAXL5GssO786VrDN
         yKL5BzM8G1GlXhPrgsBeDuDxopOU5zyM6hsAIBRvKH59EoKXs/tjsVyEy/qp4OhKLN+g
         +HU1X7hY2KCq7QMcRaVpDPF5QhIb6F/7ExPRFZnLMQg4yyk+GL52BZ9a9wr09bDVgJ+U
         qpFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793922462; x=1794527262;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x/RKRDin2OptMojaeCsUiaSs9Kk46RnHWwkRmbHSsgw=;
        b=ai8tNR1kTJ5BXqeVb3JocQhh1SMykhKL1H1WpHVtjD6vzfzCt0wHxbeerBhnZvlNK2
         WkXr9mA5x0PJE+a4Fh5PDDkF45Mo3+WFu3Gmib4Hq1aAz/6gV2OepZj/MdOtG8RxpG+k
         Yo18tpvO13KRcxc6TPiEKqsiaeqLQlz2d5ErSc62gx/S73W+3W8POWEj1OnV2RvROVBO
         hMGRe4CIjjYMcOX2XUY39vZBeVCaeRs+mNrnUvV2VOFf/cXGiVCQ0Cp1lQcJzHNIhP9u
         J6lXkn0haaeWYCwRLRmDI5IDtFHcog8fLg7wku3xDZt0Vu5L/7nH+z5F8aUxL604OCFI
         P0fQ==
X-Forwarded-Encrypted: i=1; AKwUvBz53Xm9oTRJWmrfZX6Ct79fittNMWUcvJu9nU6a1GocgDaLUIX7OSF5u/umNi9eDWpzp1i3etwK3ihi@lists.linux.dev
X-Gm-Message-State: APuU4Z8UMFSKa6HEWH0d1oJsWviCzPHYgJXDlXH/vx0yMkkmUG5Sp5gr
	wBFGzFRzeJ3UjpGxb+G9yOkxpmWGjI4loJlsV32aPFaq1rl90GTkyFK5ne4Eud0QCc/bUAld7l6
	7dbAGrg==
X-Received: from pgdo3-n1.prod.google.com ([2002:a05:6a02:6203:10b0:cca:c02e:bfd6])
 (user=wyihan job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:9e95:b0:3e4:b458:5239
 with SMTP id adf61e73a8af0-3ebb2a24b3dmr1114411637.45.1793922461520; Thu, 05
 Nov 2026 15:47:41 -0800 (PST)
Date: Thu, 05 Nov 2026 23:46:53 +0000
In-Reply-To: <20261105-tdx-selftests-v16-0-2024e8fa517a@google.com>
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Post: <mailto:linux-coco@lists.linux.dev>
List-Help: <mailto:linux-coco+help@lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-coco+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261105-tdx-selftests-v16-0-2024e8fa517a@google.com>
X-Developer-Key: i=wyihan@google.com; a=ed25519; pk=cRi0fKzS5BMxlHyHY2pJv3w/1zcgfYKr6EYGYppdMYc=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793922452; l=5511;
 i=wyihan@google.com; s=20260319; h=from:subject:message-id;
 bh=fyaOP4udR9+MT2Tk1b6aFON/Dhf2LGDor7nYKiUbRYs=; b=sCJHaKCV+jtAxAEHWQg4Va9n6Zt7Kf9a3pdCEp2bZPJyYse5oeR8d9GsFM6j1ZQHO7iLG20k1
 xXviMGo4M3PDZM5M7oVekKE118j994Hb8ukewnlO8WWY6HvLirV/sCk
X-Mailer: b4 0.14.3
Message-ID: <20261105-tdx-selftests-v16-9-2024e8fa517a@google.com>
Subject: [PATCH v16 09/20] KVM: selftests: Set up TDX boot code region
From: Lisa Wang <wyihan@google.com>
To: Andrew Jones <ajones@ventanamicro.com>, Ackerley Tng <ackerleytng@google.com>, 
	Binbin Wu <binbin.wu@linux.intel.com>, Chao Gao <chao.gao@intel.com>, 
	Chenyi Qiang <chenyi.qiang@intel.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Erdem Aktas <erdemaktas@google.com>, Ira Weiny <iweiny@kernel.org>, 
	Isaku Yamahata <isaku.yamahata@intel.com>, Kiryl Shutsemau <kas@kernel.org>, 
	linux-kselftest@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, 
	"Pratik R. Sampat" <pratikrajesh.sampat@amd.com>, Reinette Chatre <reinette.chatre@intel.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Roger Wang <runanwang@google.com>, 
	Ryan Afranji <afranji@google.com>, Sagi Shahar <sagis@google.com>, 
	Sean Christopherson <seanjc@google.com>, Shuah Khan <shuah@kernel.org>, Xiaoyao Li <xiaoyao.li@intel.com>, 
	Oliver Upton <oupton@kernel.org>
Cc: Jeremiah McReynolds <jmcrey@google.com>, kvm@vger.kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, x86@kernel.org, Lisa Wang <wyihan@google.com>
Content-Type: text/plain; charset="utf-8"

From: Sagi Shahar <sagis@google.com>

Because the reset vector is located just 16 bytes below the 4GB
boundary, there is not enough space to fit the entire TDX boot code. To
solve this, insert a small trampoline at the reset vector that jumps to
the actual boot code.

Place the boot code immediately in front of the trampoline. Because they
are contiguous, they can be copied and mapped with a single operation.

Use virt_map() to create an identity map in this memory region to allow
for seamless transition from paging-disabled to paging-enabled code.

Suggested-by: Sean Christopherson <seanjc@google.com>
Co-developed-by: Erdem Aktas <erdemaktas@google.com>
Signed-off-by: Erdem Aktas <erdemaktas@google.com>
Signed-off-by: Sagi Shahar <sagis@google.com>
Signed-off-by: Lisa Wang <wyihan@google.com>
Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
Reviewed-by: Xiaoyao Li <xiaoyao.li@intel.com>
---
 .../selftests/kvm/include/x86/tdx/td_boot.h        |  2 +-
 .../selftests/kvm/include/x86/tdx/tdx_util.h       |  1 +
 tools/testing/selftests/kvm/lib/x86/processor.c    |  4 ++-
 tools/testing/selftests/kvm/lib/x86/tdx/td_boot.S  |  6 ++++
 tools/testing/selftests/kvm/lib/x86/tdx/tdx_util.c | 38 ++++++++++++++++++++++
 5 files changed, 49 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/kvm/include/x86/tdx/td_boot.h b/tools/testing/selftests/kvm/include/x86/tdx/td_boot.h
index 577e7b23c51c..8f47a3893f59 100644
--- a/tools/testing/selftests/kvm/include/x86/tdx/td_boot.h
+++ b/tools/testing/selftests/kvm/include/x86/tdx/td_boot.h
@@ -72,7 +72,7 @@ struct td_boot_parameters {
 	struct td_per_vcpu_parameters per_vcpu[];
 };
 
-extern u8 td_boot[], td_boot_code_end[];
+extern u8 td_boot[], td_boot_code_end[], td_boot_reset_vector_trampoline[];
 
 #define TD_BOOT_CODE_SIZE (td_boot_code_end - td_boot)
 
diff --git a/tools/testing/selftests/kvm/include/x86/tdx/tdx_util.h b/tools/testing/selftests/kvm/include/x86/tdx/tdx_util.h
index f76489ffb48d..43b4157e4a13 100644
--- a/tools/testing/selftests/kvm/include/x86/tdx/tdx_util.h
+++ b/tools/testing/selftests/kvm/include/x86/tdx/tdx_util.h
@@ -47,5 +47,6 @@ static inline bool is_tdx_vm(struct kvm_vm *vm)
 })
 
 void tdx_init_vm(struct kvm_vm *vm);
+void tdx_vm_setup_boot_code_region(struct kvm_vm *vm);
 
 #endif /* SELFTESTS_TDX_TDX_UTIL_H */
diff --git a/tools/testing/selftests/kvm/lib/x86/processor.c b/tools/testing/selftests/kvm/lib/x86/processor.c
index b8dbb16d5a28..36003cfd8d6a 100644
--- a/tools/testing/selftests/kvm/lib/x86/processor.c
+++ b/tools/testing/selftests/kvm/lib/x86/processor.c
@@ -825,8 +825,10 @@ void kvm_arch_vm_post_create(struct kvm_vm *vm, unsigned int nr_vcpus)
 		vm_sev_ioctl(vm, KVM_SEV_INIT2, &init);
 	}
 
-	if (is_tdx_vm(vm))
+	if (is_tdx_vm(vm)) {
 		tdx_init_vm(vm);
+		tdx_vm_setup_boot_code_region(vm);
+	}
 
 	r = __vm_ioctl(vm, KVM_GET_TSC_KHZ, NULL);
 	TEST_ASSERT(r > 0, "KVM_GET_TSC_KHZ did not provide a valid TSC frequency.");
diff --git a/tools/testing/selftests/kvm/lib/x86/tdx/td_boot.S b/tools/testing/selftests/kvm/lib/x86/tdx/td_boot.S
index 726ec51e040e..a04011b91ae4 100644
--- a/tools/testing/selftests/kvm/lib/x86/tdx/td_boot.S
+++ b/tools/testing/selftests/kvm/lib/x86/tdx/td_boot.S
@@ -56,6 +56,12 @@ td_boot:
 	ljmp $(KERNEL_CS),$1f
 1:
 	jmp *TD_PER_VCPU_PARAMETERS_GUEST_CODE(%eax)
+	int3
+
+.globl td_boot_reset_vector_trampoline
+td_boot_reset_vector_trampoline:
+	jmp td_boot
+	int3
 
 /* Leave marker so size of td_boot code can be computed. */
 .globl td_boot_code_end
diff --git a/tools/testing/selftests/kvm/lib/x86/tdx/tdx_util.c b/tools/testing/selftests/kvm/lib/x86/tdx/tdx_util.c
index 564144c40f0a..b4a7089b3636 100644
--- a/tools/testing/selftests/kvm/lib/x86/tdx/tdx_util.c
+++ b/tools/testing/selftests/kvm/lib/x86/tdx/tdx_util.c
@@ -1,8 +1,46 @@
 // SPDX-License-Identifier: GPL-2.0-only
 
+#include <linux/sizes.h>
+
 #include "processor.h"
+#include "tdx/td_boot.h"
 #include "tdx/tdx_util.h"
 
+/* Arbitrarily selected to avoid overlaps with anything else */
+#define TD_BOOT_CODE_SLOT	20
+
+#define X86_RESET_VECTOR	0xfffffff0ul
+
+void tdx_vm_setup_boot_code_region(struct kvm_vm *vm)
+{
+	const size_t total_size = TD_BOOT_CODE_SIZE;
+	const size_t boot_code_size = td_boot_reset_vector_trampoline - td_boot;
+	const gpa_t boot_code_gpa = X86_RESET_VECTOR - boot_code_size;
+	gpa_t alloc_gpa = round_down(boot_code_gpa, PAGE_SIZE);
+	size_t nr_pages = (SZ_4G - alloc_gpa) / PAGE_SIZE;
+	u64 gmem_flags = 0;
+	gpa_t gpa;
+	u8 *hva;
+
+	if (kvm_has_gmem_attributes)
+		gmem_flags |= GUEST_MEMFD_FLAG_INIT_SHARED | GUEST_MEMFD_FLAG_MMAP;
+	vm_mem_add(vm, VM_MEM_SRC_SHMEM, alloc_gpa, TD_BOOT_CODE_SLOT,
+		   nr_pages, KVM_MEM_GUEST_MEMFD, -1, 0, gmem_flags);
+
+	gpa = ____vm_phy_pages_alloc(vm, nr_pages, alloc_gpa,
+				     TD_BOOT_CODE_SLOT, true, false);
+	TEST_ASSERT(gpa == alloc_gpa, "Failed vm_phy_pages_alloc");
+
+	virt_map(vm, alloc_gpa, alloc_gpa, nr_pages);
+	hva = addr_gpa2hva(vm, boot_code_gpa);
+	memcpy(hva, td_boot, total_size);
+
+	hva += boot_code_size;
+	TEST_ASSERT(hva == addr_gpa2hva(vm, X86_RESET_VECTOR),
+		    "Expected RESET vector at hva 0x%lx, got %lx",
+		    (unsigned long)addr_gpa2hva(vm, X86_RESET_VECTOR), (unsigned long)hva);
+}
+
 static const struct kvm_tdx_capabilities *tdx_read_capabilities(struct kvm_vm *vm)
 {
 	static struct kvm_tdx_capabilities *tdx_cap;

-- 
2.56.0.455.g6c5a503b38-goog

