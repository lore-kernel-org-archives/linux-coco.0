Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB4C4472527
	for <linux-coco@lists.linux.dev>; Wed, 22 Jul 2026 23:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784762080; cv=none; b=JJbYHV44Lsu7yIXj6TpD7t6fHZZANjO0PGQ8zp7+qP5avwx67MpiE1lMcwTSjOuTWqzQcYUox6hNy0ElHeOredpCSHGn4FvI7V5c4CCke1keOTUZF0ZvHm2Wp3A/MOTITG0XTw3Cn9IRWIgVA1YVtRpZy0JpEJ9RObDDFo8P3xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784762080; c=relaxed/simple;
	bh=J2jP33MsvXzcPyd71zMa34BP+SHntkFHO92tJSH/otQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=TzikJ29ZJ10mIa0pH0hxCdK0Ylv0H0lVRYk5Wp5HI/PMs8iUvL3mpYW3ih3lM28u1LiSz9lAeuEQGBNlGnMq3hN5NVfZEYAU/CgvkXVQxu5TsN9vw3HnNbIrDrAk5W/SwdfpGNlp0E+vYS9QiwD8p20fLa/xb9MsZqf7331ytSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--wyihan.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kYuBO3CZ; arc=none smtp.client-ip=209.85.215.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wyihan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kYuBO3CZ"
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cb4cdf95b5aso127289a12.1
        for <linux-coco@lists.linux.dev>; Wed, 22 Jul 2026 16:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784762078; x=1785366878; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OE9BObxgnpVBtB0susWSfoNAQmdWjz8VkVFbMsNsCVk=;
        b=kYuBO3CZWhd6tAUp+jCyBu3CKQ9ErqBFZE3uNFt8xCcPR/e71L5YiNAPsTYLeyLVOL
         YJrHtYCHUlSKS2Fbe9mmKiKD6xgsGrK9yUPfYajgzPu6255ju2OdrdiiIkcioshHmKim
         drsGJJO+NaCqskOQvJXYud1VrdiW9Re0A2XPWmPmjTpCWOF34tx8MwZhyMVwQf5eAria
         QaACmJBnd+1rzUeVW23WoGBhfA6KROPS17M3NN4hwlwMyxE9IHouIIfRB5XW0E3cSkF4
         nV/GqiXtmRcLOJRIOeMCAroUljPmuI5PJiGyAi2K57QJSZwk2GmhTDoWIQQzV8y3EK2b
         sr5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784762078; x=1785366878;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OE9BObxgnpVBtB0susWSfoNAQmdWjz8VkVFbMsNsCVk=;
        b=oghfmDidDL5pD+I7y4IS8GsDL/3VritA66L4LtXwY0skmFyw8GNKDZmU1MFgDMTePN
         /zN8NoVkwlDxf6YfDEKiWDp7qhvx6wtF3iUGBcK4F6D0fjPptP65l3khPRVQkcn0b3z1
         WmRMsuG7pcuwwKkPxyGo03oL+x8DESYLvXRpDMX0X+ZNYiunIToKwdt05Q52ijeb4r+a
         C/tO0UG+igEDH8Pb5FxCk17yyYXv1Wh7ERA0bTs4lOFOI2Gr2wCAZQ89cW/X6/Nxu2AQ
         E6G7yPX0kDeIYOHf4gzTVtK8uAylrTDuPzZRaRPMHj4FPiTRocLqUb6vyc1TV/e84CmD
         oVBQ==
X-Forwarded-Encrypted: i=1; AHgh+RrC2NW5XveryOdAs7NIDBla5DOpEplrX/M5qyb4P1ObjVGxhuwfBuBSCUSbnPZk0Wnh/L36LWl8Vlfc@lists.linux.dev
X-Gm-Message-State: AOJu0YxS66xpB5KFtQPXQRkGCSxdqWOw/+xACSNabtga5ocYFgKKnkLz
	jhDM22lOG2h+HK1pEZ4bZA/GhI7KyXb55sAFmc/hbTI8rY+FFz4g/d9Hpq7PVETd6VE1rpAzTeP
	xphTKsg==
X-Received: from pggh14.prod.google.com ([2002:a63:c00e:0:b0:c9e:142c:425e])
 (user=wyihan job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:748a:b0:3c3:bb13:438
 with SMTP id adf61e73a8af0-3c44b0504bcmr554799637.32.1784762077746; Wed, 22
 Jul 2026 16:14:37 -0700 (PDT)
Date: Wed, 22 Jul 2026 23:13:25 +0000
In-Reply-To: <20260722-tdx-selftests-v14-0-15ad654a50db@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260722-tdx-selftests-v14-0-15ad654a50db@google.com>
X-Developer-Key: i=wyihan@google.com; a=ed25519; pk=cRi0fKzS5BMxlHyHY2pJv3w/1zcgfYKr6EYGYppdMYc=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784762054; l=3161;
 i=wyihan@google.com; s=20260319; h=from:subject:message-id;
 bh=LhPITB0/P3+C8fkpUXhj3CMOp+sdIRyRL+NpJnysUVU=; b=KwG/mq0dqAwUImRbDSEcbPFdl15WaqHL4VOTMgbqjf6a4Ej+o01Emqg1/da9WwWbbYyH6qqAZ
 KDHbmghfo96Bij8EdsXBK7NyAbD5HONradFoDKSUxowWKqebJozW8wK
X-Mailer: b4 0.14.3
Message-ID: <20260722-tdx-selftests-v14-20-15ad654a50db@google.com>
Subject: [PATCH v14 20/22] KVM: selftests: Implement MMIO WRITE for the TDX VM
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

Implement the tdx_mmio_write() to allow TDX VMs to request MMIO
emulation.

Follow the Intel Guest-Hypervisor Communication Interface (GHCI) spec
to the minimum extent that a spec-abiding TDX module will pass the
request to KVM. Skip implementing the #VE handler as described in the
GHCI spec to reduce selftests dependency.

To perform emulated I/O, VMs use the TDG.VP.VMCALL instruction to
request MMIO.

Signed-off-by: Erdem Aktas <erdemaktas@google.com>
Co-developed-by: Sagi Shahar <sagis@google.com>
Signed-off-by: Sagi Shahar <sagis@google.com>
Co-developed-by: Lisa Wang <wyihan@google.com>
Signed-off-by: Lisa Wang <wyihan@google.com>
---
 tools/testing/selftests/kvm/Makefile.kvm          |  1 +
 tools/testing/selftests/kvm/include/x86/tdx/tdx.h | 17 +++++++++++
 tools/testing/selftests/kvm/lib/x86/tdx/tdx.S     | 37 +++++++++++++++++++++++
 3 files changed, 55 insertions(+)

diff --git a/tools/testing/selftests/kvm/Makefile.kvm b/tools/testing/selftests/kvm/Makefile.kvm
index 645d9aac61db..28b33ed8c2e6 100644
--- a/tools/testing/selftests/kvm/Makefile.kvm
+++ b/tools/testing/selftests/kvm/Makefile.kvm
@@ -33,6 +33,7 @@ LIBKVM_x86 += lib/x86/tdx/tdx_util.c
 LIBKVM_x86 += lib/x86/ucall.c
 LIBKVM_x86 += lib/x86/vmx.c
 LIBKVM_x86 += lib/x86/tdx/td_boot.S
+LIBKVM_x86 += lib/x86/tdx/tdx.S
 
 LIBKVM_arm64 += lib/arm64/gic.c
 LIBKVM_arm64 += lib/arm64/gic_v3.c
diff --git a/tools/testing/selftests/kvm/include/x86/tdx/tdx.h b/tools/testing/selftests/kvm/include/x86/tdx/tdx.h
new file mode 100644
index 000000000000..6355a30bb47f
--- /dev/null
+++ b/tools/testing/selftests/kvm/include/x86/tdx/tdx.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef SELFTEST_KVM_TDX_TDX_H
+#define SELFTEST_KVM_TDX_TDX_H
+
+#include <linux/types.h>
+
+#define TDG_VP_VMCALL_VE_REQUEST_MMIO    48
+#define TDVMCALL_MMIO_WRITE		  1
+
+u64 __tdcall(u64 leaf, u64 r12, u64 r13, u64 r14, u64 r15);
+
+static inline u64 tdx_mmio_write(u64 address, u32 size, u64 data_in)
+{
+	return __tdcall(TDG_VP_VMCALL_VE_REQUEST_MMIO, size,
+			TDVMCALL_MMIO_WRITE, address, data_in);
+}
+#endif /* SELFTEST_KVM_TDX_TDX_H */
diff --git a/tools/testing/selftests/kvm/lib/x86/tdx/tdx.S b/tools/testing/selftests/kvm/lib/x86/tdx/tdx.S
new file mode 100644
index 000000000000..dff48a3624a1
--- /dev/null
+++ b/tools/testing/selftests/kvm/lib/x86/tdx/tdx.S
@@ -0,0 +1,37 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+.globl __tdcall
+/*
+ * u64 __tdcall(u64 leaf, u64 r12, u64 r13, u64 r14, u64 r15)
+ */
+__tdcall:
+	push %r12
+	push %r13
+	push %r14
+	push %r15
+
+	/* Map C ABI fast arguments to TDX GHCI payload registers */
+	/* RDI=leaf, RSI=r12, RDX=r13, RCX=r14, R8=r15 */
+
+	mov %rdi, %r11
+	mov %rsi, %r12
+	mov %rdx, %r13
+	mov %rcx, %r14
+	mov %r8,  %r15
+
+	/* TDCALL boilerplate */
+	mov $0, %rax
+	mov $0xFC00, %rcx	/* Expose R10-R15 */
+	mov $0, %r10
+
+	/* tdcall instruction */
+	.byte 0x66, 0x0f, 0x01, 0xcc
+
+	/* Extract status */
+	mov %r10, %rax
+
+	pop %r15
+	pop %r14
+	pop %r13
+	pop %r12
+	ret

-- 
2.55.0.229.g6434b31f56-goog

