Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C54D11A2C0F
	for <linux-coco@lists.linux.dev>; Tue, 30 Jul 2024 15:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722352284; cv=none; b=eaHg95Hv8jB3lKo6kMwnNHzBF2+8+McBTvVIin+gvhVZ1H5KUSlBiMANbnyqmM/xvdPtM2WQpJ3dDwY7DlkZ3DO2FOmHW0A67y8ggkQMF0TOM8zxQFerGEvjB8ieWUaiDMlQjeWQv4/rNrsICCWOING4UU6DRSMc6nAsoPljVqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722352284; c=relaxed/simple;
	bh=NjDPwznXe+kTUwuZU48dRxF6Kzcz/i7BvyMvUsOltAQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dBZ2ELw7WC+PxbHGe9rT3KWEnYsKZuUEfbSEjQ7oD/0u+bsYRwmVDvFe0a+aTx6n8aBNAzG6Ah/g4KkmeNcS2rPDB14YpDoe3as2+JzsBoohu/ClgEU+sE7t/vsBuD3Edxk3OcT3CjCKfKuA9sPDeSpTaiE/AKutUUcNRKEcv/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qzrm6cRz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qzrm6cRz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76E14C4AF0E;
	Tue, 30 Jul 2024 15:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722352284;
	bh=NjDPwznXe+kTUwuZU48dRxF6Kzcz/i7BvyMvUsOltAQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Qzrm6cRz77klHKSzdv1E/BVvxv9EkX7uOddTKSnRrldbJGHHaGA3poSFdeNmcz7FB
	 +SFK4Ph9jXUXuc5UMTmHiB4VUMzJX1p4MfsUqFvU4uE2+mriB6/Tx9f9AhvhQnZ9DZ
	 eE1uQEFESVBrmuz9wym3fZii0t9RTFA+7pAQqrC8vO/A2DqON1HfynzIumEhQF9SSK
	 +mkkZilAJ9PFSosOsNZpn3j+ttbSwFpUHu2qOO+PBrYUQuCY/NuY3mXY+cqoecErV7
	 UBRlD0x8fBlYEJ8Vw6fscJSR0I+ZjjQolOzRYb1w+rwnKcu4490/o/nnPGp2ZIysjy
	 FmCH/sciITp4w==
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
Subject: [PATCH 2/6] drivers/virt: pkvm: Add initial support for running as a protected guest
Date: Tue, 30 Jul 2024 16:11:08 +0100
Message-Id: <20240730151113.1497-3-will@kernel.org>
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

Implement a pKVM protected guest driver to probe the presence of pKVM
and determine the memory protection granule using the HYP_MEMINFO
hypercall.

Signed-off-by: Will Deacon <will@kernel.org>
---
 Documentation/virt/kvm/arm/hypercalls.rst     | 22 +++++++++++
 arch/arm64/include/asm/hypervisor.h           |  7 ++++
 drivers/virt/coco/Kconfig                     |  2 +
 drivers/virt/coco/Makefile                    |  1 +
 drivers/virt/coco/pkvm-guest/Kconfig          | 10 +++++
 drivers/virt/coco/pkvm-guest/Makefile         |  2 +
 drivers/virt/coco/pkvm-guest/arm-pkvm-guest.c | 37 +++++++++++++++++++
 include/linux/arm-smccc.h                     |  7 ++++
 8 files changed, 88 insertions(+)
 create mode 100644 drivers/virt/coco/pkvm-guest/Kconfig
 create mode 100644 drivers/virt/coco/pkvm-guest/Makefile
 create mode 100644 drivers/virt/coco/pkvm-guest/arm-pkvm-guest.c

diff --git a/Documentation/virt/kvm/arm/hypercalls.rst b/Documentation/virt/kvm/arm/hypercalls.rst
index 17be111f493f..16515eb42149 100644
--- a/Documentation/virt/kvm/arm/hypercalls.rst
+++ b/Documentation/virt/kvm/arm/hypercalls.rst
@@ -44,3 +44,25 @@ Provides a discovery mechanism for other KVM/arm64 hypercalls.
 ----------------------------------------
 
 See ptp_kvm.rst
+
+``ARM_SMCCC_KVM_FUNC_HYP_MEMINFO``
+----------------------------------
+
+Query the memory protection parameters for a pKVM protected virtual machine.
+
++---------------------+-------------------------------------------------------------+
+| Presence:           | Optional; pKVM protected guests only.                       |
++---------------------+-------------------------------------------------------------+
+| Calling convention: | HVC64                                                       |
++---------------------+----------+--------------------------------------------------+
+| Function ID:        | (uint32) | 0xC6000002                                       |
++---------------------+----------+----+---------------------------------------------+
+| Arguments:          | (uint64) | R1 | Reserved / Must be zero                     |
+|                     +----------+----+---------------------------------------------+
+|                     | (uint64) | R2 | Reserved / Must be zero                     |
+|                     +----------+----+---------------------------------------------+
+|                     | (uint64) | R3 | Reserved / Must be zero                     |
++---------------------+----------+----+---------------------------------------------+
+| Return Values:      | (int64)  | R0 | ``INVALID_PARAMETER (-3)`` on error, else   |
+|                     |          |    | memory protection granule in bytes          |
++---------------------+----------+----+---------------------------------------------+
diff --git a/arch/arm64/include/asm/hypervisor.h b/arch/arm64/include/asm/hypervisor.h
index 8cab2ab535b7..409e239834d1 100644
--- a/arch/arm64/include/asm/hypervisor.h
+++ b/arch/arm64/include/asm/hypervisor.h
@@ -7,8 +7,15 @@
 void kvm_init_hyp_services(void);
 bool kvm_arm_hyp_service_available(u32 func_id);
 
+#ifdef CONFIG_ARM_PKVM_GUEST
+void pkvm_init_hyp_services(void);
+#else
+static inline void pkvm_init_hyp_services(void) { };
+#endif
+
 static inline void kvm_arch_init_hyp_services(void)
 {
+	pkvm_init_hyp_services();
 };
 
 #endif
diff --git a/drivers/virt/coco/Kconfig b/drivers/virt/coco/Kconfig
index 87d142c1f932..d9ff676bf48d 100644
--- a/drivers/virt/coco/Kconfig
+++ b/drivers/virt/coco/Kconfig
@@ -9,6 +9,8 @@ config TSM_REPORTS
 
 source "drivers/virt/coco/efi_secret/Kconfig"
 
+source "drivers/virt/coco/pkvm-guest/Kconfig"
+
 source "drivers/virt/coco/sev-guest/Kconfig"
 
 source "drivers/virt/coco/tdx-guest/Kconfig"
diff --git a/drivers/virt/coco/Makefile b/drivers/virt/coco/Makefile
index 18c1aba5edb7..b69c30c1c720 100644
--- a/drivers/virt/coco/Makefile
+++ b/drivers/virt/coco/Makefile
@@ -4,5 +4,6 @@
 #
 obj-$(CONFIG_TSM_REPORTS)	+= tsm.o
 obj-$(CONFIG_EFI_SECRET)	+= efi_secret/
+obj-$(CONFIG_ARM_PKVM_GUEST)	+= pkvm-guest/
 obj-$(CONFIG_SEV_GUEST)		+= sev-guest/
 obj-$(CONFIG_INTEL_TDX_GUEST)	+= tdx-guest/
diff --git a/drivers/virt/coco/pkvm-guest/Kconfig b/drivers/virt/coco/pkvm-guest/Kconfig
new file mode 100644
index 000000000000..d2f344f1f98f
--- /dev/null
+++ b/drivers/virt/coco/pkvm-guest/Kconfig
@@ -0,0 +1,10 @@
+config ARM_PKVM_GUEST
+	bool "Arm pKVM protected guest driver"
+	depends on ARM64
+	help
+	  Protected guests running under the pKVM hypervisor on arm64
+	  are isolated from the host and must issue hypercalls to enable
+	  interaction with virtual devices. This driver implements
+	  support for probing and issuing these hypercalls.
+
+	  If unsure, say 'N'.
diff --git a/drivers/virt/coco/pkvm-guest/Makefile b/drivers/virt/coco/pkvm-guest/Makefile
new file mode 100644
index 000000000000..4bee24579423
--- /dev/null
+++ b/drivers/virt/coco/pkvm-guest/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0-only
+obj-$(CONFIG_ARM_PKVM_GUEST) += arm-pkvm-guest.o
diff --git a/drivers/virt/coco/pkvm-guest/arm-pkvm-guest.c b/drivers/virt/coco/pkvm-guest/arm-pkvm-guest.c
new file mode 100644
index 000000000000..a5148701d2f1
--- /dev/null
+++ b/drivers/virt/coco/pkvm-guest/arm-pkvm-guest.c
@@ -0,0 +1,37 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Support for the hypercall interface exposed to protected guests by
+ * pKVM.
+ *
+ * Author: Will Deacon <will@kernel.org>
+ * Copyright (C) 2024 Google LLC
+ */
+
+#include <linux/arm-smccc.h>
+#include <linux/array_size.h>
+#include <linux/mm.h>
+
+#include <asm/hypervisor.h>
+
+static size_t pkvm_granule;
+
+void pkvm_init_hyp_services(void)
+{
+	int i;
+	struct arm_smccc_res res;
+	const u32 funcs[] = {
+		ARM_SMCCC_KVM_FUNC_HYP_MEMINFO,
+	};
+
+	for (i = 0; i < ARRAY_SIZE(funcs); ++i) {
+		if (!kvm_arm_hyp_service_available(funcs[i]))
+			return;
+	}
+
+	arm_smccc_1_1_invoke(ARM_SMCCC_VENDOR_HYP_KVM_HYP_MEMINFO_FUNC_ID,
+			     0, 0, 0, &res);
+	if (res.a0 > PAGE_SIZE) /* Includes error codes */
+		return;
+
+	pkvm_granule = res.a0;
+}
diff --git a/include/linux/arm-smccc.h b/include/linux/arm-smccc.h
index 083f85653716..16b6dcc54e02 100644
--- a/include/linux/arm-smccc.h
+++ b/include/linux/arm-smccc.h
@@ -115,6 +115,7 @@
 /* KVM "vendor specific" services */
 #define ARM_SMCCC_KVM_FUNC_FEATURES		0
 #define ARM_SMCCC_KVM_FUNC_PTP			1
+#define ARM_SMCCC_KVM_FUNC_HYP_MEMINFO		2
 #define ARM_SMCCC_KVM_FUNC_FEATURES_2		127
 #define ARM_SMCCC_KVM_NUM_FUNCS			128
 
@@ -137,6 +138,12 @@
 			   ARM_SMCCC_OWNER_VENDOR_HYP,			\
 			   ARM_SMCCC_KVM_FUNC_PTP)
 
+#define ARM_SMCCC_VENDOR_HYP_KVM_HYP_MEMINFO_FUNC_ID			\
+	ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL,				\
+			   ARM_SMCCC_SMC_64,				\
+			   ARM_SMCCC_OWNER_VENDOR_HYP,			\
+			   ARM_SMCCC_KVM_FUNC_HYP_MEMINFO)
+
 /* ptp_kvm counter type ID */
 #define KVM_PTP_VIRT_COUNTER			0
 #define KVM_PTP_PHYS_COUNTER			1
-- 
2.46.0.rc1.232.g9752f9e123-goog

