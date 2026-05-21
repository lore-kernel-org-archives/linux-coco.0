Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B42D364055
	for <linux-coco@lists.linux.dev>; Thu, 21 May 2026 23:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779405452; cv=none; b=cIyZrYaxFEO79Gn3H64pe7WhNkDRNOPTegzDjpthKVkvoKSvA5WFhawWRjfIyDq2gWpbr9jRbsStFWu/W7Ec3TpmGjLsKSFNYlSY1VFCCIIUm5prEzEBABFvRvZ0eRwZmn0o/B1376tinvqm6OKQeJKvsO/IbclyBcOfM/f9m8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779405452; c=relaxed/simple;
	bh=MkLem+PAEgibPPUwaSQc8AKoTt/5GBSYztKiGsziHKs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=mWhh2a53UEl97lKZfTC3IdDT7eU9iSy6dWWFhB8wGOpJZbFLeJb3+I4P3ASimpCMPkLfEzv2QTG/3YIybhbvnnlAiJT40yGv4Fo17y0U7MXPT26WiyDffT26frOEAdNCbO25aKoRUHxesBT9ckpNwPwMHQCmOntGHnEKT+QnyRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--wyihan.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RZEieZva; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wyihan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RZEieZva"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-36641fe4aedso12661955a91.1
        for <linux-coco@lists.linux.dev>; Thu, 21 May 2026 16:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779405449; x=1780010249; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=yHGgQDGiS26Hfz1fPfs2Cuoyh6JW9ctfbTsvpAP5sNI=;
        b=RZEieZva+ygUINr1qHwQgYR4VoSmFgsJYkeYj8K8O2yY0j11VUnfFuOr8bQQqPLkby
         1l5B6MO9XMWpdAl0aUxMCfIrin085/LCbVX6ZGz6TSi+rzVQ8j/N6b0ALS9GUbnDjdbA
         qx1kF736S4gkqEQPfTLY+zfpx0/qndfz95kX3yhF7RKRTHydlsTFRahDHW5rSO5kirwM
         XorLYZQxZjJLKL+Z7ayygOkQa0VTvQC2fSifHaVv10dmWbVtNF3ry9alQjESJV0lqpx3
         suKtEmXoleZgow296SxQu9ULRqHEfp4mtNm3hEVXd56GBzVafEXw+q2co0yFBLnHYjzk
         MQLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779405449; x=1780010249;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yHGgQDGiS26Hfz1fPfs2Cuoyh6JW9ctfbTsvpAP5sNI=;
        b=oPhq/tcyvAOqyrP2pikxfqmG1DtZF8izWbrlgAT+Ni3iIbqFgH0UufA5udRauw5vWN
         WlOkabDxQQknD6XsRMKXKOU89N7Z8hu9Qzm1hLO1eCcOivgtZ7OF4j6XhtqvrLz3TT/j
         +Mr3fJLk3rz1stxFZ7Ch60kpLpEXzZ+fKvSor+Hzeq+jWS0RqfC5pi7hOm4ZewJkluyf
         GDcuHUvVW1uuF4UxwWeqSKBkotcep32T69gmh0UW6liHD8ffkeaXlAlN+oD+C10Jw0E2
         5/Avw0vTljxntCPn5DL8sesbA2TW20qVuecuj+W1o5LXBH1c43lURKJ9OQS5WkdQCDXD
         NwrA==
X-Forwarded-Encrypted: i=1; AFNElJ/XxO9359zEbdQQqVGM0UPLHx+MpBuLoydsTQ15kAZf+Rilug4rpSyrYYIueQ4SXHQWznZfZtTUp5tU@lists.linux.dev
X-Gm-Message-State: AOJu0YxMHE5c0yJJooyIPBqpun4LvGXQJZmVmrX8jZicy82Q7CdOImGk
	imo5tXzP8l/1LBej8Yogb+KhqnUCTkKorA15EFHBuv6GXbFjPAAJ4U3mr5PdPVzwDSfeqb1WhZZ
	hVrITVQ==
X-Received: from pjbqi11.prod.google.com ([2002:a17:90b:274b:b0:369:4256:dcf6])
 (user=wyihan job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3f8b:b0:35f:b987:4dac
 with SMTP id 98e67ed59e1d1-36a67454586mr1211256a91.12.1779405449045; Thu, 21
 May 2026 16:17:29 -0700 (PDT)
Date: Thu, 21 May 2026 23:16:49 +0000
In-Reply-To: <20260521-tdx-selftests-v13-v13-0-6983ae4c3a4d@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260521-tdx-selftests-v13-v13-0-6983ae4c3a4d@google.com>
X-Developer-Key: i=wyihan@google.com; a=ed25519; pk=cRi0fKzS5BMxlHyHY2pJv3w/1zcgfYKr6EYGYppdMYc=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779405439; l=4572;
 i=wyihan@google.com; s=20260319; h=from:subject:message-id;
 bh=IhoHJ/jX64CspIIqMUpwyXCZfNHBAAb3GTEyszWVzpE=; b=U0RofNUk0xioIjzOFnN1C3j540KhGc5AJIJXakR5J0ns4MXE0HanliuG2Ze+lF7Hj6vtPq6fy
 uVIKr2NCAA9CUdSivCD4ZN+f8RjpehChKadWQAy1TRZQRoAvg7ObhRt
X-Mailer: b4 0.14.3
Message-ID: <20260521-tdx-selftests-v13-v13-8-6983ae4c3a4d@google.com>
Subject: [PATCH  v13 08/22] KVM: selftests: Add TDX boot code
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
	Sean Christopherson <seanjc@google.com>, Shuah Khan <shuah@kernel.org>, Oliver Upton <oupton@kernel.org>
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
 .../selftests/kvm/include/x86/tdx/td_boot.h        |  5 ++
 .../selftests/kvm/include/x86/tdx/td_boot_asm.h    | 16 ++++++
 tools/testing/selftests/kvm/lib/x86/tdx/td_boot.S  | 60 ++++++++++++++++++++++
 4 files changed, 82 insertions(+)

diff --git a/tools/testing/selftests/kvm/Makefile.kvm b/tools/testing/selftests/kvm/Makefile.kvm
index 02fad7b35eac..929965ca4b75 100644
--- a/tools/testing/selftests/kvm/Makefile.kvm
+++ b/tools/testing/selftests/kvm/Makefile.kvm
@@ -31,6 +31,7 @@ LIBKVM_x86 += lib/x86/sev.c
 LIBKVM_x86 += lib/x86/svm.c
 LIBKVM_x86 += lib/x86/ucall.c
 LIBKVM_x86 += lib/x86/vmx.c
+LIBKVM_x86 += lib/x86/tdx/td_boot.S
 
 LIBKVM_arm64 += lib/arm64/gic.c
 LIBKVM_arm64 += lib/arm64/gic_v3.c
diff --git a/tools/testing/selftests/kvm/include/x86/tdx/td_boot.h b/tools/testing/selftests/kvm/include/x86/tdx/td_boot.h
index af4474dee387..e5d54a20ed72 100644
--- a/tools/testing/selftests/kvm/include/x86/tdx/td_boot.h
+++ b/tools/testing/selftests/kvm/include/x86/tdx/td_boot.h
@@ -66,4 +66,9 @@ struct td_boot_parameters {
 	struct td_per_vcpu_parameters per_vcpu[];
 };
 
+void td_boot(void);
+void td_boot_code_end(void);
+
+#define TD_BOOT_CODE_SIZE (td_boot_code_end - td_boot)
+
 #endif /* SELFTEST_TDX_TD_BOOT_H */
diff --git a/tools/testing/selftests/kvm/include/x86/tdx/td_boot_asm.h b/tools/testing/selftests/kvm/include/x86/tdx/td_boot_asm.h
new file mode 100644
index 000000000000..10b4b527595c
--- /dev/null
+++ b/tools/testing/selftests/kvm/include/x86/tdx/td_boot_asm.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef SELFTEST_TDX_TD_BOOT_ASM_H
+#define SELFTEST_TDX_TD_BOOT_ASM_H
+
+/*
+ * GPA where TD boot parameters will be loaded.
+ *
+ * TD_BOOT_PARAMETERS_GPA is arbitrarily chosen to
+ *
+ * + be within the 4GB address space
+ * + provide enough contiguous memory for the struct td_boot_parameters such
+ *   that there is one struct td_per_vcpu_parameters for KVM_MAX_VCPUS
+ */
+#define TD_BOOT_PARAMETERS_GPA 0xffff0000
+
+#endif  // SELFTEST_TDX_TD_BOOT_ASM_H
diff --git a/tools/testing/selftests/kvm/lib/x86/tdx/td_boot.S b/tools/testing/selftests/kvm/lib/x86/tdx/td_boot.S
new file mode 100644
index 000000000000..7aa33caa9a78
--- /dev/null
+++ b/tools/testing/selftests/kvm/lib/x86/tdx/td_boot.S
@@ -0,0 +1,60 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#include "tdx/td_boot_asm.h"
+#include "tdx/td_boot_offsets.h"
+#include "processor_asm.h"
+
+.code32
+
+.globl td_boot
+td_boot:
+	/* In this procedure, edi is used as a temporary register. */
+	cli
+
+	/* Paging is off. */
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
2.54.0.746.g67dd491aae-goog

