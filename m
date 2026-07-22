Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1CBE459AFE
	for <linux-coco@lists.linux.dev>; Wed, 22 Jul 2026 23:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784762069; cv=none; b=EiwlgOs9Kf5dIJwx0Ds7pCfUYMCGJHrIH1LKZQwkblSthu8WG8hbPrk9W8koyg4HPvAe4JLwoP3I5AS0zRaHpaHV4QprUGoDfc3z5fU6evrNl6EzBCZ3lH3sRP0laQibrdt3yfJ0zGt5112voCREWZ5Ik1WdhmfX/d7YOwMVZYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784762069; c=relaxed/simple;
	bh=2nZtselLGRQA+iGH9lWqBntxKtAC+MyMjj+0gP5igAE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=NUkBc1EODfoJOllAS/IOOzgsQqplvT4KpHITCucTqz35s2jBfGXsHGcXweQ5SdTda6VFVA3wEMO7xcQWAXn2fzaKTjPIWufKTSqp1nHD9LK5uK5Rov78f1PFfsqaDczLGC0MzWRFZv4HTWM/9xWZcJadNyFpOiyO/0lzjVU3Wvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--wyihan.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nRAIoflM; arc=none smtp.client-ip=209.85.214.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wyihan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nRAIoflM"
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ccb687f82eso568265ad.3
        for <linux-coco@lists.linux.dev>; Wed, 22 Jul 2026 16:14:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784762064; x=1785366864; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BHjIow7FRD/o8g9hVMX5NwnfmgyNmUnSSABYjO98n7Y=;
        b=nRAIoflMdy0LOEdse94qotgbvV5dZ+mc3Bsu6UYz5WKgz+i7TxQ8Uk2u9lFHcoBjgz
         H1DFt20w/7f5zyavlglde47J1VFq/FzO5C+C2U5QWSWMAqmO1zroyBVyBpHFBne2nI3S
         fWkqsi+C9PYmDQ/7ZipGA9BQ1taRbjFZ23IfQ6Xv3ugpZ/L1L/9+FUJMaWmrEvH7E1Es
         44+DJVdA2v9c5UVTHa2idtQAymsXCAQBZmtYwt2Cr7mZfHSHXCRQUyDRmRaNKSDv0x2T
         jivZ6lW8fWkPIFd19y3Sy9rBjrr3HttyjMqHzbFODpRUusCuZay0F+KJRysBQOu16JjJ
         XB+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784762064; x=1785366864;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BHjIow7FRD/o8g9hVMX5NwnfmgyNmUnSSABYjO98n7Y=;
        b=P0mjxgLxC2kmf36N/4vSiVOlfYy9ARhW+AHWRz38HlZg7UReDRjBCtZHd6kkeSiw2Q
         gUuQvJt3zVIDjtTWOyKVD+CYgdlIY/ubD6MT8+sZdlYndsP+sce69nekA4vubdZEqcmE
         UfeGRhoZnPldsdUSb3gJDzVkOhcNkAUrTuS7lxVk0MVbelqE5Us/BGHwHAYJpAN6pxoh
         puQn5MQlKMko0auE7hrMwkVuy5KQQH7Hhoop6vZvfSwsSFPVn6C9DtyQyNG9Lntr13NI
         +tsPphBHO0ZK3MZ0doF1DGly4zaFXDGYASAYxeyZW9gC/wnOlMnaDN5/ftb/cd7dHXQd
         e/pA==
X-Forwarded-Encrypted: i=1; AHgh+RrnLgv0p1ovsFMVWqeWn8/bX7JN7Pt6u0IdiXbFcI+CUP+qzi/MmUPE55fEuUhLjPLEidw9YgnR9C59@lists.linux.dev
X-Gm-Message-State: AOJu0YxgsPCmKqVddLsFSY3vxbs6oKABhakzb4tcIqoC72kuOFJFmmCX
	8fMbbtdon8fRs4XcgNGYqviulKbABLz05nTR2K78fKiaubJeO9yT1jAy3U+ceySHUcJdSMkieLW
	ka9vEtA==
X-Received: from plpo3.prod.google.com ([2002:a17:903:3e03:b0:2ca:b8f5:2d26])
 (user=wyihan job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:f681:b0:2c9:cf5d:d9bc
 with SMTP id d9443c01a7336-2cfa74b13famr9003555ad.35.1784762064085; Wed, 22
 Jul 2026 16:14:24 -0700 (PDT)
Date: Wed, 22 Jul 2026 23:13:13 +0000
In-Reply-To: <20260722-tdx-selftests-v14-0-15ad654a50db@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260722-tdx-selftests-v14-0-15ad654a50db@google.com>
X-Developer-Key: i=wyihan@google.com; a=ed25519; pk=cRi0fKzS5BMxlHyHY2pJv3w/1zcgfYKr6EYGYppdMYc=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784762054; l=4661;
 i=wyihan@google.com; s=20260319; h=from:subject:message-id;
 bh=nkYYec/Kj5J9dGXmWp9KVDsgzg3Lhpo8ptfotZieFvo=; b=9nFbAkjgrBrpCjn1Htarcq44COVIT6r0M3Rh5Jfk4tBIFtZ1wfV4g+2qidhFCsL4BlNEev3HK
 Api70IZ2v1/C4QZZOUqpmTSCmkTjRWxdeF7Q51i0ohVbAV/vVczBAXO
X-Mailer: b4 0.14.3
Message-ID: <20260722-tdx-selftests-v14-8-15ad654a50db@google.com>
Subject: [PATCH v14 08/22] KVM: selftests: Add TDX boot code
From: Lisa Wang <wyihan@google.com>
To: Andrew Jones <ajones@ventanamicro.com>, Ackerley Tng <ackerleytng@google.com>, 
	Binbin Wu <binbin.wu@linux.intel.com>, Chao Gao <chao.gao@intel.com>, 
	Chenyi Qiang <chenyi.qiang@intel.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Erdem Aktas <erdemaktas@google.com>, Ira Weiny <ira.weiny@intel.com>, 
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

From: Erdem Aktas <erdemaktas@google.com>

Add code to boot a TDX test VM. Since TDX registers are inaccessible to
KVM, the boot code loads the relevant values from memory into the
registers before jumping to the guest code.

Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
Signed-off-by: Erdem Aktas <erdemaktas@google.com>
Co-developed-by: Ackerley Tng <ackerleytng@google.com>
Signed-off-by: Ackerley Tng <ackerleytng@google.com>
Co-developed-by: Sagi Shahar <sagis@google.com>
Signed-off-by: Sagi Shahar <sagis@google.com>
Signed-off-by: Lisa Wang <wyihan@google.com>
---
 tools/testing/selftests/kvm/Makefile.kvm           |  1 +
 .../selftests/kvm/include/x86/tdx/td_boot.h        | 22 ++++++--
 tools/testing/selftests/kvm/lib/x86/tdx/td_boot.S  | 61 ++++++++++++++++++++++
 3 files changed, 81 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/kvm/Makefile.kvm b/tools/testing/selftests/kvm/Makefile.kvm
index 397afebbb34b..645d9aac61db 100644
--- a/tools/testing/selftests/kvm/Makefile.kvm
+++ b/tools/testing/selftests/kvm/Makefile.kvm
@@ -32,6 +32,7 @@ LIBKVM_x86 += lib/x86/svm.c
 LIBKVM_x86 += lib/x86/tdx/tdx_util.c
 LIBKVM_x86 += lib/x86/ucall.c
 LIBKVM_x86 += lib/x86/vmx.c
+LIBKVM_x86 += lib/x86/tdx/td_boot.S
 
 LIBKVM_arm64 += lib/arm64/gic.c
 LIBKVM_arm64 += lib/arm64/gic_v3.c
diff --git a/tools/testing/selftests/kvm/include/x86/tdx/td_boot.h b/tools/testing/selftests/kvm/include/x86/tdx/td_boot.h
index bf2282931d49..89cf6c3485be 100644
--- a/tools/testing/selftests/kvm/include/x86/tdx/td_boot.h
+++ b/tools/testing/selftests/kvm/include/x86/tdx/td_boot.h
@@ -2,9 +2,6 @@
 #ifndef SELFTEST_TDX_TD_BOOT_H
 #define SELFTEST_TDX_TD_BOOT_H
 
-#include <linux/compiler.h>
-#include <linux/types.h>
-
 /*
  * Layout for boot section (not to scale)
  *
@@ -24,7 +21,19 @@
  * |                           |
  * |                           |
  * |___________________________|____ 0x0_ffff_0000: TD_BOOT_PARAMETERS_GPA
+ *
+ * TD_BOOT_PARAMETERS_GPA is arbitrarily chosen to
+ *
+ * + be within the 4GB address space
+ * + provide enough contiguous memory for the struct td_boot_parameters such
+ *   that there is one struct td_per_vcpu_parameters for KVM_MAX_VCPUS
  */
+#define TD_BOOT_PARAMETERS_GPA 0xffff0000
+
+#if !defined(__ASSEMBLY__) && !defined(__ASSEMBLER__)
+
+#include <linux/compiler.h>
+#include <linux/types.h>
 
 /*
  * The exact memory layout for LGDT or LIDT instructions.
@@ -63,4 +72,11 @@ struct td_boot_parameters {
 	struct td_per_vcpu_parameters per_vcpu[];
 };
 
+void td_boot(void);
+void td_boot_code_end(void);
+
+#define TD_BOOT_CODE_SIZE (td_boot_code_end - td_boot)
+
+#endif /* !defined(__ASSEMBLY__) && !defined(__ASSEMBLER__) */
+
 #endif /* SELFTEST_TDX_TD_BOOT_H */
diff --git a/tools/testing/selftests/kvm/lib/x86/tdx/td_boot.S b/tools/testing/selftests/kvm/lib/x86/tdx/td_boot.S
new file mode 100644
index 000000000000..bca9a4c3d8f8
--- /dev/null
+++ b/tools/testing/selftests/kvm/lib/x86/tdx/td_boot.S
@@ -0,0 +1,61 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#include "tdx/td_boot.h"
+#include "tdx/td_boot_offsets.h"
+#include "processor_asm.h"
+
+.code32
+
+.globl td_boot
+td_boot:
+	/*
+	 * In this procedure, edi is used as a temporary register.
+	 * Paging is turned off.
+	 */
+	cli
+
+	movl $TD_BOOT_PARAMETERS_GPA, %ebx
+
+	/*
+	 * Find the address of struct td_per_vcpu_parameters for this
+	 * vCPU based on esi (TDX spec: initialized with vCPU id). Put
+	 * struct address into register for indirect addressing.
+	 */
+	movl $SIZEOF_TD_PER_VCPU_PARAMETERS, %eax
+	mul %esi
+	leal TD_BOOT_PARAMETERS_PER_VCPU(%ebx), %edi
+	addl %edi, %eax
+
+	/* Setup stack. */
+	movl TD_PER_VCPU_PARAMETERS_ESP_GVA(%eax), %esp
+
+	/* Setup GDT. */
+	leal TD_BOOT_PARAMETERS_GDT(%ebx), %edi
+	lgdt (%edi)
+
+	/* Setup IDT. */
+	leal TD_BOOT_PARAMETERS_IDT(%ebx), %edi
+	lidt (%edi)
+
+	/*
+	 * Set up control registers (There are no instructions to mov from
+	 * memory to control registers, hence use edi as a scratch register).
+	 */
+	movl TD_BOOT_PARAMETERS_CR4(%ebx), %edi
+	movl %edi, %cr4
+	movl TD_BOOT_PARAMETERS_CR3(%ebx), %edi
+	movl %edi, %cr3
+	movl TD_BOOT_PARAMETERS_CR0(%ebx), %edi
+	movl %edi, %cr0
+
+	/* Switching to 64bit mode after ljmp and then jump to guest code */
+	ljmp $(KERNEL_CS),$1f
+1:
+	jmp *TD_PER_VCPU_PARAMETERS_GUEST_CODE(%eax)
+
+/* Leave marker so size of td_boot code can be computed. */
+.globl td_boot_code_end
+td_boot_code_end:
+
+/* Disable executable stack. */
+.section .note.GNU-stack,"",%progbits

-- 
2.55.0.229.g6434b31f56-goog

