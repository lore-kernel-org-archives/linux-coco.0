Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793922461;
	b=rgAyDtIcgksiBTwGd4CHCTaCKealbN+44myvAwBOpHQXh9SN9wbYohan2zI0BiBh11E9
	 EkeH/5YucLZUZrbEO1rlcPsNTt5dyzCRLveR2GKzWDoJjjT1xRvahKQd293+zjUZ4A3AS
	 kpbm6+dj3c9JKy/Bp1EErAL+G840rDhMLNr4BlbZKgQ3HE4GUEmwwR3XTLDzOUvUcdOn1
	 0rutTrxAzaHRJfiG4APAEpD1cE+U7LeAXasgX6yz7QVIaUJosoNldhKQV5m6IPqFGAytK
	 dqNcqgDA0f5jrGaouK/RPTTmTbAwTe5OP/nJNJy+EliMNfR1PymakEdT9Ih9vJjJ86Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793922461;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Developer-Key:X-Developer-Signature:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=BIvq2twJN7ywQe2MXD0v3BY55Do1zzPrR1ch4dMWy9w=;
	b=i6vmjSLdMqDQRBYOZxHSg1U9UhnsG2Vzh8C9QujQVrsft9okK95GqjLrkVHOwqq4YFbP
	 PwbuZTrhEtUozUwMyd3zHTxo6LNpXb+80vE9Mo52R63c21duVrwQ05WbNiGxM3onTownc
	 uHyZq6frWm6z9tergdWHcKE2nTFM88DtuRKEiJSiwX6tGRAcB/NnC2iCh0R/wuP72aBl2
	 4u/rbLDRADUovB1KzKws6QmKooN3dRT9FFhbSWrTmkoZYVsrwJzOeHEY+4oCgENca4P4R
	 Y5YZGbecapSVJ0aqjrik5/rhawTX0Tb5qQ5mjmTCUGDle4qvkYIyHFfAY52sSfRpGmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--wyihan.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=TU4zoyyo;
	arc=none smtp.remote-ip=209.85.215.197
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4D65606D833
	for <linux-coco@lists.linux.dev>; Thu,  5 Nov 2026 23:47:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4D65606D833
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wyihan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=TU4zoyyo
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cd60e4e8bc3so45406a12.1
        for <linux-coco@lists.linux.dev>; Thu, 05 Nov 2026 15:47:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793922460; x=1794527260; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BIvq2twJN7ywQe2MXD0v3BY55Do1zzPrR1ch4dMWy9w=;
        b=TU4zoyyoAuNtqrtDVOuMFgvZdrHDVR6z3onyV1hUDXO5civeJqyRphlqWEslq4fISe
         8Qbiiuq8JwhzuRkIX3eW62n6ygtaWY3b8zHP3hJI6eVCCMwSm1LEttZE4t9wN3mV8vOE
         GT0p5d3dDDSjSsReXsUM2V4Lf/AdInk7inL+/hZFVfzoe5uOKUvr4ho0nW5Z8qth8S+I
         a82savB7Eyk6LYpU1fjSjMer9k91JTKHE0U6ED62XI7bccYlstr7Y/qZcc5WBQLT2JAq
         jAOCtS3bw8e8RTRMvLLdAd84kY1NebQeygmge9nrMPnrB5IJAskAUZWmBQ2OZPE0WNgp
         2PvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793922460; x=1794527260;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BIvq2twJN7ywQe2MXD0v3BY55Do1zzPrR1ch4dMWy9w=;
        b=Xx6G87nDe+8D2OymHrt5v5m/cGW4ehWHzeeRreKJ5zI70818m4s4qrQQqY2vNUDxin
         0J3ZaGveb3ct7XJfUv8KVrguhf5dvwBTHpB+NdU0Fy/JB1xpwB0QZl1nwcb+b3d2jw00
         wSp32LkCOpkAhnkjn+y2lxutSMmo0iCwadrWZZGq6VeLUyh4Q+9JandQO9KzfJ0xE53n
         C52sehAIM/oghjKUSGbvRjXcYu8Wf+PTl37Z4chbNZH93GvxQ+kaLAe0Rj7b+kB+5geq
         H9JUeuGwlN5XUaaZTZIhQqkOp0dFh1K6C8h8dThS7ZUSuNcNxV5fBHY1T8TwfNqH2QU1
         dIoQ==
X-Forwarded-Encrypted: i=1; AKwUvByoBOEUbDB9aPDLeJR56VVcEpfAVlcfvI8kxxnEp7qcN6kIylAeCoab2JPbiVUT92pfeser2PvHa+/s@lists.linux.dev
X-Gm-Message-State: APuU4Z8Tf1LY6D+hdLiVe2357Zo4V+3IDQdGh/G5vfqtVHjY8Y4mA71y
	cfLlTATNYhORWY3KpyvA7GInPXFm9JCnaoe+jQjDxUFhg0j241B6UAY1QaJzb7sSYOSYn0617l1
	iv6GP2A==
X-Received: from pjk15.prod.google.com ([2002:a17:90b:558f:b0:3b0:af53:d7ce])
 (user=wyihan job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4acc:b0:3b0:cc3e:68b5
 with SMTP id 98e67ed59e1d1-3b0db69fde7mr616588a91.21.1793922459423; Thu, 05
 Nov 2026 15:47:39 -0800 (PST)
Date: Thu, 05 Nov 2026 23:46:51 +0000
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793922452; l=4800;
 i=wyihan@google.com; s=20260319; h=from:subject:message-id;
 bh=9w4aCd0NJSPoyyt+QfxGA+enh5/AVF2bSD9/TlOuiaQ=; b=u/9rCWq7ncDRc0kMmnOkJgVvLA07LRTuPZsOwR5b1g7BldqLm7GLjbWOjCIDaWB77MhLJ7Vac
 NveXnQo43UqBB0cpeXiPF/KofVlik6em0VtUS1XoUlAATpXtCTJUv7U
X-Mailer: b4 0.14.3
Message-ID: <20261105-tdx-selftests-v16-7-2024e8fa517a@google.com>
Subject: [PATCH v16 07/20] KVM: selftests: Add TDX boot code
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

From: Erdem Aktas <erdemaktas@google.com>

Add code to boot a TDX test VM. Since TDX registers are inaccessible to
KVM, the boot code loads the relevant values from memory into the
registers before jumping to the guest code.

Co-developed-by: Ackerley Tng <ackerleytng@google.com>
Signed-off-by: Ackerley Tng <ackerleytng@google.com>
Co-developed-by: Sagi Shahar <sagis@google.com>
Signed-off-by: Sagi Shahar <sagis@google.com>
Co-developed-by: Lisa Wang <wyihan@google.com>
Signed-off-by: Lisa Wang <wyihan@google.com>
Signed-off-by: Erdem Aktas <erdemaktas@google.com>
Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
Reviewed-by: Xiaoyao Li <xiaoyao.li@intel.com>
---
 tools/testing/selftests/kvm/Makefile.kvm           |  1 +
 .../selftests/kvm/include/x86/tdx/td_boot.h        | 21 ++++++-
 tools/testing/selftests/kvm/lib/x86/tdx/td_boot.S  | 65 ++++++++++++++++++++++
 3 files changed, 84 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/kvm/Makefile.kvm b/tools/testing/selftests/kvm/Makefile.kvm
index 08031ab1825b..5136f49c502b 100644
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
index bf2282931d49..577e7b23c51c 100644
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
+#ifndef __ASSEMBLER__
+
+#include <linux/compiler.h>
+#include <linux/types.h>
 
 /*
  * The exact memory layout for LGDT or LIDT instructions.
@@ -63,4 +72,10 @@ struct td_boot_parameters {
 	struct td_per_vcpu_parameters per_vcpu[];
 };
 
+extern u8 td_boot[], td_boot_code_end[];
+
+#define TD_BOOT_CODE_SIZE (td_boot_code_end - td_boot)
+
+#endif /* #ifndef __ASSEMBLER__ */
+
 #endif /* SELFTEST_TDX_TD_BOOT_H */
diff --git a/tools/testing/selftests/kvm/lib/x86/tdx/td_boot.S b/tools/testing/selftests/kvm/lib/x86/tdx/td_boot.S
new file mode 100644
index 000000000000..726ec51e040e
--- /dev/null
+++ b/tools/testing/selftests/kvm/lib/x86/tdx/td_boot.S
@@ -0,0 +1,65 @@
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
+	 * Paging is turned off.
+	 *
+	 * Register usage throughout td_boot:
+	 * ebx: Address of global boot parameters (Must be preserved)
+	 * eax: Address of per-vCPU parameters (Must be preserved)
+	 * edi, edx: Temporary scratch registers
+	 */
+	cli
+
+	movl $TD_BOOT_PARAMETERS_GPA, %ebx
+
+	/*
+	 * Find the address of struct td_per_vcpu_parameters for this
+	 * vCPU based on esi (TDX spec: initialized with vCPU id). Put
+	 * struct address into eax for indirect addressing.
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
+	 * Set up control registers (x86 does not support moving memory
+	 * directly to a control register).
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
2.56.0.455.g6c5a503b38-goog

