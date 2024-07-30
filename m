Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 131301A2C0F
	for <linux-coco@lists.linux.dev>; Tue, 30 Jul 2024 15:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722352287; cv=none; b=ugd8xxZaXxrDOw9ct6oGHDLkixgB8QYtghSBGExr7geCRWMKUF1YdfAGFR3ompI8jTIzTyIZExFj7dBjXAe/f0WdAv2Z3pBCWLW7f0r6AggEiDh7qzQMmCmJEQSWZak6D5mMGjB/6PrN5E6OkGlxjWY5S4AIwy8YtzkREg73XZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722352287; c=relaxed/simple;
	bh=kYgp54vkhb2LEddT1RM3+qWIUksURGYjy5qeK1eT/0g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SWeiZZh3eofRZefFPu5wggnFTqYx28pux00alH7KI9qB4CsCTB/cGKPi1kLB7sZ0B5RkqIF54KrY5Eq2S7QpMDUjKYRMp9oyn28P+iiVbJDIQSDgyLY06/LJ6J8NiQRDnCUAhw0MLcV6hJwrM4y6X7S7z7IKsIymBFpLdoRxmOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=duS5n7uq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="duS5n7uq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF452C32782;
	Tue, 30 Jul 2024 15:11:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722352286;
	bh=kYgp54vkhb2LEddT1RM3+qWIUksURGYjy5qeK1eT/0g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=duS5n7uqXceQnTtryQXCrdcBqUO1ArzXQsainm77CqtbN47KrEwq99z/mJ9YQSmzU
	 MEvXGOk+9W9xzxEjcaJE7P8b4oQO8XPz23RxeFO3fy2MJt4/aF/kuTn1H/75JkeiE2
	 Kc/Eq65PSVNQUjMcJdnB9BNk4Cy4neHJ+4WKSkbGeWLupu81bUN2bXXa623lsgsJZp
	 5hrFMTLvZzKOVfg04H5nlCiwRwdAApmV2yYpEDOP65nusoI7SLhUg9UrhzxDvxsJ+Z
	 v/2i37GiJpaKy6NWXTvoHr0p8C9zn5CUU5iL/4kWngL08iEA8botZRXgNWbT337eaU
	 T3QpXLBZknXrA==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org
Cc: Will Deacon <will@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Suzuki Poulose <suzuki.poulose@arm.com>,
	Steven Price <steven.price@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Marc Zyngier <maz@kernel.org>,
	linux-coco@lists.linux.dev
Subject: [PATCH 3/6] arm64: mm: Add top-level dispatcher for internal mem_encrypt API
Date: Tue, 30 Jul 2024 16:11:09 +0100
Message-Id: <20240730151113.1497-4-will@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20240730151113.1497-1-will@kernel.org>
References: <20240730151113.1497-1-will@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Implementing the internal mem_encrypt API for arm64 depends entirely on
the Confidential Computing environment in which the kernel is running.

Introduce a simple dispatcher so that backend hooks can be registered
depending upon the environment in which the kernel finds itself.

Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/Kconfig                   |  1 +
 arch/arm64/include/asm/mem_encrypt.h | 15 +++++++++
 arch/arm64/include/asm/set_memory.h  |  1 +
 arch/arm64/mm/Makefile               |  2 +-
 arch/arm64/mm/mem_encrypt.c          | 50 ++++++++++++++++++++++++++++
 5 files changed, 68 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/include/asm/mem_encrypt.h
 create mode 100644 arch/arm64/mm/mem_encrypt.c

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index b3fc891f1544..68d77a2f4d1a 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -34,6 +34,7 @@ config ARM64
 	select ARCH_HAS_KERNEL_FPU_SUPPORT if KERNEL_MODE_NEON
 	select ARCH_HAS_KEEPINITRD
 	select ARCH_HAS_MEMBARRIER_SYNC_CORE
+	select ARCH_HAS_MEM_ENCRYPT
 	select ARCH_HAS_NMI_SAFE_THIS_CPU_OPS
 	select ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE
 	select ARCH_HAS_PTE_DEVMAP
diff --git a/arch/arm64/include/asm/mem_encrypt.h b/arch/arm64/include/asm/mem_encrypt.h
new file mode 100644
index 000000000000..b0c9a86b13a4
--- /dev/null
+++ b/arch/arm64/include/asm/mem_encrypt.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef __ASM_MEM_ENCRYPT_H
+#define __ASM_MEM_ENCRYPT_H
+
+struct arm64_mem_crypt_ops {
+	int (*encrypt)(unsigned long addr, int numpages);
+	int (*decrypt)(unsigned long addr, int numpages);
+};
+
+int arm64_mem_crypt_ops_register(const struct arm64_mem_crypt_ops *ops);
+
+int set_memory_encrypted(unsigned long addr, int numpages);
+int set_memory_decrypted(unsigned long addr, int numpages);
+
+#endif	/* __ASM_MEM_ENCRYPT_H */
diff --git a/arch/arm64/include/asm/set_memory.h b/arch/arm64/include/asm/set_memory.h
index 0f740b781187..917761feeffd 100644
--- a/arch/arm64/include/asm/set_memory.h
+++ b/arch/arm64/include/asm/set_memory.h
@@ -3,6 +3,7 @@
 #ifndef _ASM_ARM64_SET_MEMORY_H
 #define _ASM_ARM64_SET_MEMORY_H
 
+#include <asm/mem_encrypt.h>
 #include <asm-generic/set_memory.h>
 
 bool can_set_direct_map(void);
diff --git a/arch/arm64/mm/Makefile b/arch/arm64/mm/Makefile
index 60454256945b..2fc8c6dd0407 100644
--- a/arch/arm64/mm/Makefile
+++ b/arch/arm64/mm/Makefile
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 obj-y				:= dma-mapping.o extable.o fault.o init.o \
 				   cache.o copypage.o flush.o \
-				   ioremap.o mmap.o pgd.o mmu.o \
+				   ioremap.o mmap.o pgd.o mem_encrypt.o mmu.o \
 				   context.o proc.o pageattr.o fixmap.o
 obj-$(CONFIG_ARM64_CONTPTE)	+= contpte.o
 obj-$(CONFIG_HUGETLB_PAGE)	+= hugetlbpage.o
diff --git a/arch/arm64/mm/mem_encrypt.c b/arch/arm64/mm/mem_encrypt.c
new file mode 100644
index 000000000000..ee3c0ab04384
--- /dev/null
+++ b/arch/arm64/mm/mem_encrypt.c
@@ -0,0 +1,50 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Implementation of the memory encryption/decryption API.
+ *
+ * Since the low-level details of the operation depend on the
+ * Confidential Computing environment (e.g. pKVM, CCA, ...), this just
+ * acts as a top-level dispatcher to whatever hooks may have been
+ * registered.
+ *
+ * Author: Will Deacon <will@kernel.org>
+ * Copyright (C) 2024 Google LLC
+ *
+ * "Hello, boils and ghouls!"
+ */
+
+#include <linux/bug.h>
+#include <linux/compiler.h>
+#include <linux/err.h>
+#include <linux/mm.h>
+
+#include <asm/mem_encrypt.h>
+
+static const struct arm64_mem_crypt_ops *crypt_ops;
+
+int arm64_mem_crypt_ops_register(const struct arm64_mem_crypt_ops *ops)
+{
+	if (WARN_ON(crypt_ops))
+		return -EBUSY;
+
+	crypt_ops = ops;
+	return 0;
+}
+
+int set_memory_encrypted(unsigned long addr, int numpages)
+{
+	if (likely(!crypt_ops) || WARN_ON(!PAGE_ALIGNED(addr)))
+		return 0;
+
+	return crypt_ops->encrypt(addr, numpages);
+}
+EXPORT_SYMBOL_GPL(set_memory_encrypted);
+
+int set_memory_decrypted(unsigned long addr, int numpages)
+{
+	if (likely(!crypt_ops) || WARN_ON(!PAGE_ALIGNED(addr)))
+		return 0;
+
+	return crypt_ops->decrypt(addr, numpages);
+}
+EXPORT_SYMBOL_GPL(set_memory_decrypted);
-- 
2.46.0.rc1.232.g9752f9e123-goog

