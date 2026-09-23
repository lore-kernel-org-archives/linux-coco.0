Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C422E52E064;
	Wed, 23 Sep 2026 14:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790172289; cv=none; b=hK+FNFx19w6dea2IKrsw4P8dXC0Uec4mz5q4O0ysPt/A/ucYIcEDNvA3rFiuke0U0TPL/qrsTL2icTqXqL+RnFpaOy4ZviH7r2nn7EYTKVqpwwhkEUGhp2Bdiq4b+LkNDRcaQUZ36FuapKgZYQTPeKZIW2GQhzCNqrDaYRo9MVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790172289; c=relaxed/simple;
	bh=nZy1sVgK/IVkCn0RnWe7BhjFmS46aije1m+WQXzUVng=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kPiLmT62wl6v03632ZH0y7QLtx05i8ItDsYXUI0DyfhMAogRjh4eKDKTQ3GrFz48m7V0J3HTwHqgH1u5s7zPH7zZIiCyOdUR/62nCYoDjXdx5OXOOB4n7i4Vd8TZUIWULii6yQbJn1UgOxYoP3VFSiK2MUs43qGMSolDEboOJ3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WRApLDCu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WRApLDCu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF8CD1F00898;
	Wed, 23 Sep 2026 14:04:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790172287;
	bh=zJequ213NtN8xk6v4dEOB9nEbroMoI3gjM6hfLH9OKc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=WRApLDCuGy4TCXYL6j9GZ7D6tsCrd2vdWKIZsgqmVfycYNCk3D11+ILR7aUn7a852
	 Xwb48glndB+de2OmAuRkwEDz5jj1yEBwK021ChVUbMLr7a8zbim+GDA9pgTVuFmAY+
	 q0Jj5Z+PgeOjo7Z9/wOJ1KCC7OT4ml4KdHvJ8Awlr9YtYDakQ+h3MVpphQwzJ16Qpk
	 XYadSRdTOECnoL1oN47oyrEILZmASZRej/bPvbg8dPyIlBVuxaXt8EkSx4B3if9jME
	 9zEmsmVe9nSS28aQ0UbSjKBXawLVz00S7KKK2zB56nxc4tctZAiU1AyeTCF3kFD+eH
	 I5zAXRvYdX0jQ==
From: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
To: linux-coco@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Greg KH <gregkh@linuxfoundation.org>,
	Jeremy Linton <jeremy.linton@arm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Will Deacon <will@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Olivia Mackall <olivia@selenic.com>,
	Russell King <linux@armlinux.org.uk>,
	Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>
Subject: [PATCH v13 3/8] firmware: arm_rmm: Move RSI support out of arch/arm64
Date: Wed, 23 Sep 2026 19:34:00 +0530
Message-ID: <20260923140405.1111554-4-aneesh.kumar@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260923140405.1111554-1-aneesh.kumar@kernel.org>
References: <20260923140405.1111554-1-aneesh.kumar@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The RSI SMCCC function IDs describe a firmware ABI and are not arm64
architecture specific definitions. Follow-up changes need to use them from
non-arch code, including drivers/firmware/smccc and the Arm CCA guest
driver.

Move the complete Realm Service Interface (RSI) implementation from
arch/arm64 to drivers/firmware/arm_rmm. The RSI SMCCC definitions and
command helpers are also moved to include/linux so they can be shared by
architecture code and firmware or driver code. This also keeps the
firmware interface outside architecture code, as requested [1].

[1] https://lore.kernel.org/all/agsNO9cc7H-b0H8L@willie-the-truck

Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Acked-by: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
---
 MAINTAINERS                                   |  3 +
 arch/arm64/Kconfig                            |  1 +
 arch/arm64/include/asm/io.h                   |  2 +-
 arch/arm64/include/asm/mem_encrypt.h          |  2 +-
 arch/arm64/include/asm/pgtable-prot.h         |  2 +-
 arch/arm64/include/asm/rsi.h                  | 70 -----------------
 arch/arm64/kernel/Makefile                    |  2 +-
 arch/arm64/kernel/setup.c                     |  2 +-
 arch/arm64/mm/init.c                          |  3 +-
 drivers/firmware/Kconfig                      |  1 +
 drivers/firmware/Makefile                     |  1 +
 drivers/firmware/arm_rmm/Kconfig              | 17 ++++
 drivers/firmware/arm_rmm/Makefile             |  2 +
 .../kernel => drivers/firmware/arm_rmm}/rsi.c |  2 +-
 drivers/virt/coco/arm-cca-guest/Kconfig       |  2 +-
 .../virt/coco/arm-cca-guest/arm-cca-guest.c   |  5 +-
 .../linux/arm-rsi-cmds.h                      | 77 +++++++++++++++++--
 .../linux/arm-smccc-rsi.h                     |  6 +-
 18 files changed, 111 insertions(+), 89 deletions(-)
 delete mode 100644 arch/arm64/include/asm/rsi.h
 create mode 100644 drivers/firmware/arm_rmm/Kconfig
 create mode 100644 drivers/firmware/arm_rmm/Makefile
 rename {arch/arm64/kernel => drivers/firmware/arm_rmm}/rsi.c (99%)
 rename arch/arm64/include/asm/rsi_cmds.h => include/linux/arm-rsi-cmds.h (69%)
 rename arch/arm64/include/asm/rsi_smc.h => include/linux/arm-smccc-rsi.h (98%)

diff --git a/MAINTAINERS b/MAINTAINERS
index 38fc0058a6af..caf2e0235d99 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3951,8 +3951,11 @@ S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git
 F:	Documentation/arch/arm64/
 F:	arch/arm64/
+F:	drivers/firmware/arm_rmm/
 F:	drivers/virt/coco/arm-cca-guest/
 F:	drivers/virt/coco/pkvm-guest/
+F:	include/linux/arm-rsi-cmds.h
+F:	include/linux/arm-smccc-rsi.h
 F:	tools/testing/selftests/arm64/
 X:	arch/arm64/boot/dts/
 X:	arch/arm64/configs/defconfig
diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index b5a51b0ef944..ff9565d3ffa5 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -38,6 +38,7 @@ config ARM64
 	select ARCH_HAS_MEMBARRIER_SYNC_CORE
 	select ARCH_HAS_MEM_ENCRYPT
 	select ARCH_SUPPORTS_MSEAL_SYSTEM_MAPPINGS
+	select ARCH_SUPPORTS_RMM
 	select ARCH_HAS_NMI_SAFE_THIS_CPU_OPS
 	select ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE
 	select ARCH_HAS_NONLEAF_PMD_YOUNG if ARM64_HAFT
diff --git a/arch/arm64/include/asm/io.h b/arch/arm64/include/asm/io.h
index 49a7002661a9..1620537f0332 100644
--- a/arch/arm64/include/asm/io.h
+++ b/arch/arm64/include/asm/io.h
@@ -8,6 +8,7 @@
 #ifndef __ASM_IO_H
 #define __ASM_IO_H
 
+#include <linux/arm-rsi-cmds.h>
 #include <linux/types.h>
 #include <linux/pgtable.h>
 
@@ -17,7 +18,6 @@
 #include <asm/early_ioremap.h>
 #include <asm/alternative.h>
 #include <asm/cpufeature.h>
-#include <asm/rsi.h>
 
 /*
  * Generic IO read/write.  These perform native-endian accesses.
diff --git a/arch/arm64/include/asm/mem_encrypt.h b/arch/arm64/include/asm/mem_encrypt.h
index 636f45b4d8af..f03b9d7b83b4 100644
--- a/arch/arm64/include/asm/mem_encrypt.h
+++ b/arch/arm64/include/asm/mem_encrypt.h
@@ -2,8 +2,8 @@
 #ifndef __ASM_MEM_ENCRYPT_H
 #define __ASM_MEM_ENCRYPT_H
 
+#include <linux/arm-rsi-cmds.h>
 #include <asm/hypervisor.h>
-#include <asm/rsi.h>
 
 struct device;
 
diff --git a/arch/arm64/include/asm/pgtable-prot.h b/arch/arm64/include/asm/pgtable-prot.h
index 09d7c00cf405..58e71e592175 100644
--- a/arch/arm64/include/asm/pgtable-prot.h
+++ b/arch/arm64/include/asm/pgtable-prot.h
@@ -66,9 +66,9 @@
 
 #ifndef __ASSEMBLER__
 
+#include <linux/arm-rsi-cmds.h>
 #include <asm/cpufeature.h>
 #include <asm/pgtable-types.h>
-#include <asm/rsi.h>
 
 extern bool arm64_use_ng_mappings;
 extern unsigned long prot_ns_shared;
diff --git a/arch/arm64/include/asm/rsi.h b/arch/arm64/include/asm/rsi.h
deleted file mode 100644
index 88b50d660e85..000000000000
--- a/arch/arm64/include/asm/rsi.h
+++ /dev/null
@@ -1,70 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * Copyright (C) 2024 ARM Ltd.
- */
-
-#ifndef __ASM_RSI_H_
-#define __ASM_RSI_H_
-
-#include <linux/errno.h>
-#include <linux/jump_label.h>
-#include <asm/rsi_cmds.h>
-
-#define RSI_PDEV_NAME "arm-cca-dev"
-
-DECLARE_STATIC_KEY_FALSE(rsi_present);
-
-void __init arm64_rsi_init(void);
-
-bool arm64_rsi_is_protected(phys_addr_t base, size_t size);
-
-static inline bool is_realm_world(void)
-{
-	return static_branch_unlikely(&rsi_present);
-}
-
-static inline int rsi_set_memory_range(phys_addr_t start, phys_addr_t end,
-				       enum ripas state, unsigned long flags)
-{
-	unsigned long ret;
-	phys_addr_t top;
-
-	while (start != end) {
-		ret = rsi_set_addr_range_state(start, end, state, flags, &top);
-		if (ret || top < start || top > end)
-			return -EINVAL;
-		start = top;
-	}
-
-	return 0;
-}
-
-/*
- * Convert the specified range to RAM. Do not use this if you rely on the
- * contents of a page that may already be in RAM state.
- */
-static inline int rsi_set_memory_range_protected(phys_addr_t start,
-						 phys_addr_t end)
-{
-	return rsi_set_memory_range(start, end, RSI_RIPAS_RAM,
-				    RSI_CHANGE_DESTROYED);
-}
-
-/*
- * Convert the specified range to RAM. Do not convert any pages that may have
- * been DESTROYED, without our permission.
- */
-static inline int rsi_set_memory_range_protected_safe(phys_addr_t start,
-						      phys_addr_t end)
-{
-	return rsi_set_memory_range(start, end, RSI_RIPAS_RAM,
-				    RSI_NO_CHANGE_DESTROYED);
-}
-
-static inline int rsi_set_memory_range_shared(phys_addr_t start,
-					      phys_addr_t end)
-{
-	return rsi_set_memory_range(start, end, RSI_RIPAS_EMPTY,
-				    RSI_CHANGE_DESTROYED);
-}
-#endif /* __ASM_RSI_H_ */
diff --git a/arch/arm64/kernel/Makefile b/arch/arm64/kernel/Makefile
index d2690c3ec528..21fc3a3d25c9 100644
--- a/arch/arm64/kernel/Makefile
+++ b/arch/arm64/kernel/Makefile
@@ -34,7 +34,7 @@ obj-y			:= debug-monitors.o entry.o irq.o fpsimd.o		\
 			   cpufeature.o alternative.o cacheinfo.o		\
 			   smp.o smp_spin_table.o topology.o smccc-call.o	\
 			   syscall.o proton-pack.o idle.o patching.o pi/	\
-			   rsi.o jump_label.o
+			   jump_label.o
 
 obj-$(CONFIG_COMPAT)			+= sys32.o signal32.o			\
 					   sys_compat.o
diff --git a/arch/arm64/kernel/setup.c b/arch/arm64/kernel/setup.c
index 29c6100f0c50..a707deba6ae7 100644
--- a/arch/arm64/kernel/setup.c
+++ b/arch/arm64/kernel/setup.c
@@ -7,6 +7,7 @@
  */
 
 #include <linux/acpi.h>
+#include <linux/arm-rsi-cmds.h>
 #include <linux/export.h>
 #include <linux/kernel.h>
 #include <linux/stddef.h>
@@ -43,7 +44,6 @@
 #include <asm/cpu_ops.h>
 #include <asm/kasan.h>
 #include <asm/numa.h>
-#include <asm/rsi.h>
 #include <asm/scs.h>
 #include <asm/sections.h>
 #include <asm/setup.h>
diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
index fbf215ecc7d0..2a8de20d2b44 100644
--- a/arch/arm64/mm/init.c
+++ b/arch/arm64/mm/init.c
@@ -34,6 +34,8 @@
 #include <linux/acpi_iort.h>
 #include <linux/kmemleak.h>
 #include <linux/execmem.h>
+#include <linux/arm-rsi-cmds.h>
+
 
 #include <asm/boot.h>
 #include <asm/fixmap.h>
@@ -43,7 +45,6 @@
 #include <asm/kvm_host.h>
 #include <asm/memory.h>
 #include <asm/numa.h>
-#include <asm/rsi.h>
 #include <asm/sections.h>
 #include <asm/setup.h>
 #include <linux/sizes.h>
diff --git a/drivers/firmware/Kconfig b/drivers/firmware/Kconfig
index b7cc11e4fbfa..62660bf520a8 100644
--- a/drivers/firmware/Kconfig
+++ b/drivers/firmware/Kconfig
@@ -310,5 +310,6 @@ source "drivers/firmware/samsung/Kconfig"
 source "drivers/firmware/smccc/Kconfig"
 source "drivers/firmware/tegra/Kconfig"
 source "drivers/firmware/xilinx/Kconfig"
+source "drivers/firmware/arm_rmm/Kconfig"
 
 endmenu
diff --git a/drivers/firmware/Makefile b/drivers/firmware/Makefile
index be46f1e1dc77..196a650ccf02 100644
--- a/drivers/firmware/Makefile
+++ b/drivers/firmware/Makefile
@@ -39,3 +39,4 @@ obj-y				+= samsung/
 obj-y				+= smccc/
 obj-y				+= tegra/
 obj-y				+= xilinx/
+obj-y				+= arm_rmm/
diff --git a/drivers/firmware/arm_rmm/Kconfig b/drivers/firmware/arm_rmm/Kconfig
new file mode 100644
index 000000000000..e981e12fdbe6
--- /dev/null
+++ b/drivers/firmware/arm_rmm/Kconfig
@@ -0,0 +1,17 @@
+
+config ARCH_SUPPORTS_RMM
+	bool
+
+config ARM_RMM_RSI
+	bool "Realm Service Interface (RSI) Support"
+	depends on ARCH_SUPPORTS_RMM
+	default y
+	help
+	  Enable support for running Linux as a Realm guest under a Realm
+	  Management Monitor (RMM), as defined by the Arm Confidential
+	  Compute Architecture.
+
+	  The RMM exposes the Realm Service Interface (RSI) to Realm guests.
+	  Linux uses RSI to negotiate the interface version, obtain the Realm
+	  configuration, and manage the protected or shared state of guest
+	  memory.
diff --git a/drivers/firmware/arm_rmm/Makefile b/drivers/firmware/arm_rmm/Makefile
new file mode 100644
index 000000000000..3708b37a9aaf
--- /dev/null
+++ b/drivers/firmware/arm_rmm/Makefile
@@ -0,0 +1,2 @@
+
+obj-$(CONFIG_ARM_RMM_RSI)	= rsi.o
diff --git a/arch/arm64/kernel/rsi.c b/drivers/firmware/arm_rmm/rsi.c
similarity index 99%
rename from arch/arm64/kernel/rsi.c
rename to drivers/firmware/arm_rmm/rsi.c
index 25ca75ce1a4d..8e716f1c1e31 100644
--- a/arch/arm64/kernel/rsi.c
+++ b/drivers/firmware/arm_rmm/rsi.c
@@ -8,11 +8,11 @@
 #include <linux/psci.h>
 #include <linux/swiotlb.h>
 #include <linux/platform_device.h>
+#include <linux/arm-rsi-cmds.h>
 
 #include <asm/io.h>
 #include <asm/mem_encrypt.h>
 #include <asm/pgtable.h>
-#include <asm/rsi.h>
 
 static struct realm_config config;
 
diff --git a/drivers/virt/coco/arm-cca-guest/Kconfig b/drivers/virt/coco/arm-cca-guest/Kconfig
index 3f0f013f03f1..2582ebb36922 100644
--- a/drivers/virt/coco/arm-cca-guest/Kconfig
+++ b/drivers/virt/coco/arm-cca-guest/Kconfig
@@ -1,6 +1,6 @@
 config ARM_CCA_GUEST
 	tristate "Arm CCA Guest driver"
-	depends on ARM64
+	depends on ARM_RMM_RSI
 	select TSM_REPORTS
 	help
 	  The driver provides userspace interface to request and
diff --git a/drivers/virt/coco/arm-cca-guest/arm-cca-guest.c b/drivers/virt/coco/arm-cca-guest/arm-cca-guest.c
index 0eeddd1ff05b..b741643d1364 100644
--- a/drivers/virt/coco/arm-cca-guest/arm-cca-guest.c
+++ b/drivers/virt/coco/arm-cca-guest/arm-cca-guest.c
@@ -3,7 +3,8 @@
  * Copyright (C) 2023 ARM Ltd.
  */
 
-#include <linux/arm-smccc.h>
+#include <linux/arm-rsi-cmds.h>
+#include <linux/arm-smccc-rsi.h>
 #include <linux/cc_platform.h>
 #include <linux/kernel.h>
 #include <linux/device-id/platform.h>
@@ -12,8 +13,6 @@
 #include <linux/tsm.h>
 #include <linux/types.h>
 
-#include <asm/rsi.h>
-
 /**
  * struct arm_cca_token_info - a descriptor for the token buffer.
  * @granule:		PA of the granule to which the token will be written
diff --git a/arch/arm64/include/asm/rsi_cmds.h b/include/linux/arm-rsi-cmds.h
similarity index 69%
rename from arch/arm64/include/asm/rsi_cmds.h
rename to include/linux/arm-rsi-cmds.h
index c1fab41f671e..9e8a8c189ca1 100644
--- a/arch/arm64/include/asm/rsi_cmds.h
+++ b/include/linux/arm-rsi-cmds.h
@@ -3,14 +3,36 @@
  * Copyright (C) 2023 ARM Ltd.
  */
 
-#ifndef __ASM_RSI_CMDS_H
-#define __ASM_RSI_CMDS_H
+#ifndef __LINUX_ARM_RSI_CMDS_H_
+#define __LINUX_ARM_RSI_CMDS_H_
 
-#include <linux/arm-smccc.h>
+#include <linux/arm-smccc-rsi.h>
+#include <linux/jump_label.h>
 #include <linux/string.h>
 #include <asm/memory.h>
 
-#include <asm/rsi_smc.h>
+#define RSI_PDEV_NAME "arm-cca-dev"
+#ifdef CONFIG_ARM_RMM_RSI
+DECLARE_STATIC_KEY_FALSE(rsi_present);
+
+void __init arm64_rsi_init(void);
+
+bool arm64_rsi_is_protected(phys_addr_t base, size_t size);
+
+static inline bool is_realm_world(void)
+{
+	return static_branch_unlikely(&rsi_present);
+}
+#else
+static inline void arm64_rsi_init(void) { }
+
+static inline bool arm64_rsi_is_protected(phys_addr_t base, size_t size)
+{
+	return false;
+}
+
+static inline bool is_realm_world(void) { return false; }
+#endif
 
 #define RSI_GRANULE_SHIFT		12
 #define RSI_GRANULE_SIZE		(_AC(1, UL) << RSI_GRANULE_SHIFT)
@@ -88,6 +110,51 @@ static inline long rsi_set_addr_range_state(phys_addr_t start,
 	return res.a0;
 }
 
+static inline int rsi_set_memory_range(phys_addr_t start, phys_addr_t end,
+				       enum ripas state, unsigned long flags)
+{
+	unsigned long ret;
+	phys_addr_t top;
+
+	while (start != end) {
+		ret = rsi_set_addr_range_state(start, end, state, flags, &top);
+		if (ret || top < start || top > end)
+			return -EINVAL;
+		start = top;
+	}
+
+	return 0;
+}
+
+/*
+ * Convert the specified range to RAM. Do not use this if you rely on the
+ * contents of a page that may already be in RAM state.
+ */
+static inline int rsi_set_memory_range_protected(phys_addr_t start,
+						 phys_addr_t end)
+{
+	return rsi_set_memory_range(start, end, RSI_RIPAS_RAM,
+				    RSI_CHANGE_DESTROYED);
+}
+
+/*
+ * Convert the specified range to RAM. Do not convert any pages that may have
+ * been DESTROYED, without our permission.
+ */
+static inline int rsi_set_memory_range_protected_safe(phys_addr_t start,
+						      phys_addr_t end)
+{
+	return rsi_set_memory_range(start, end, RSI_RIPAS_RAM,
+				    RSI_NO_CHANGE_DESTROYED);
+}
+
+static inline int rsi_set_memory_range_shared(phys_addr_t start,
+					      phys_addr_t end)
+{
+	return rsi_set_memory_range(start, end, RSI_RIPAS_EMPTY,
+				    RSI_CHANGE_DESTROYED);
+}
+
 #define RSI_ATTEST_CHALLENGE_MIN_SIZE	32
 #define RSI_ATTEST_CHALLENGE_MAX_SIZE	64
 
@@ -170,4 +237,4 @@ static inline unsigned long rsi_attestation_token_continue(phys_addr_t granule,
 	return res.a0;
 }
 
-#endif /* __ASM_RSI_CMDS_H */
+#endif /* __LINUX_ARM_RSI_CMDS_H_ */
diff --git a/arch/arm64/include/asm/rsi_smc.h b/include/linux/arm-smccc-rsi.h
similarity index 98%
rename from arch/arm64/include/asm/rsi_smc.h
rename to include/linux/arm-smccc-rsi.h
index e19253f96c94..fddb77986f70 100644
--- a/arch/arm64/include/asm/rsi_smc.h
+++ b/include/linux/arm-smccc-rsi.h
@@ -3,8 +3,8 @@
  * Copyright (C) 2023 ARM Ltd.
  */
 
-#ifndef __ASM_RSI_SMC_H_
-#define __ASM_RSI_SMC_H_
+#ifndef __LINUX_ARM_SMCCC_RSI_H_
+#define __LINUX_ARM_SMCCC_RSI_H_
 
 #include <linux/arm-smccc.h>
 
@@ -190,4 +190,4 @@ struct realm_config {
  */
 #define SMC_RSI_HOST_CALL			SMC_RSI_FID(0x199)
 
-#endif /* __ASM_RSI_SMC_H_ */
+#endif /* __LINUX_ARM_SMCCC_RSI_H_ */
-- 
2.43.0

