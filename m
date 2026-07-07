Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65F732D7DDB;
	Tue,  7 Jul 2026 08:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783412060; cv=none; b=VhdhwryYYbBzY70hp/O1cPJ4xmZPEsJBBtiokxQ7yGyzjR2UVce2q/vkfsJNANAn8Gp9mROHKdyFdWFFb7HtZPlgb8kCcoayDi3MKhNpi82dlipH/UJAs7Iylyj+LI5yiCCjS9R6+HfAoEaDV1AhUNFiTpV4u3Q/knjzPN6FuTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783412060; c=relaxed/simple;
	bh=87u+9It+L4dZYJ7UBl7mZwOH9a15OaItz8vAY28YS5Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NnUUp9gVbTWomVZ+DKEMaXmUGF2LwhDaUvux3T0BW6UE2G1/6VXPLPdj5k1FndYFTlLWb8jLz2RP1p9yKdohqDRcE+qTjEuNZFi1dth29hb86L+2gOrTp23vr9/bIBcS/WUMIfAAs7MTB5YFc1zyEmAVI8lZXCJmMmIVQQ04Lcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XHs+rbS+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XHs+rbS+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FB0B1F00A3A;
	Tue,  7 Jul 2026 08:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783412059;
	bh=h4vfx2SL3NwxVq1Rg75CKtaHkST87eRoJJKYPXdxq6w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=XHs+rbS+DxZD6jVr3dVHRKXy95U6JoPbxKgUThWXdzpzKS2WMhVh7RceGfDj5F9TB
	 vHF8NL5uL7ttPijOX7N1vNtyZQYRdf4HANKvpzykJauLXqYMQdJaS6V/itdG3AzFxz
	 s5vkZBbuFbGtt8oK1eIJxCemiwkESOOFKlpEpwKoVU/qkmC+L8rmJMFW8tARISalrB
	 XbJ+A2X4DxA9YAJ7wHP5K3tLiY+BqtdllE0ndDx6/e5H1XwLGDuKoji8/gF0N317G3
	 UqrUAkYHqQ/u7BfwDLu9RUsTXxwZe2qmKa9E9h95jqGYdsNyLukiQvXTqONqp6QnVU
	 FDGmz3kskj2Dw==
From: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
To: linux-coco@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Greg KH <gregkh@linuxfoundation.org>,
	Jeremy Linton <jeremy.linton@arm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Will Deacon <will@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>
Subject: [PATCH v8 3/6] firmware: smccc: Move RSI definitions to include/linux
Date: Tue,  7 Jul 2026 13:43:47 +0530
Message-ID: <20260707081351.1680209-4-aneesh.kumar@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260707081351.1680209-1-aneesh.kumar@kernel.org>
References: <20260707081351.1680209-1-aneesh.kumar@kernel.org>
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

Move the RSI SMCCC definitions from arch/arm64/include/asm/ to
include/linux/ so they can be shared with the driver code. This also
keeps the firmware interface outside architecture code, as requested [1].

Not all helpers in rsi_cmds.h are used by architecture code. The
attestation token helper wrappers are only used by the Arm CCA guest
driver, so move them to a driver-private header under
drivers/virt/coco/arm-cca-guest/. Keep the remaining RSI command helpers,
which are shared by architecture code and drivers, in the arm64 header.

[1] https://lore.kernel.org/all/agsNO9cc7H-b0H8L@willie-the-truck

Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
---
 arch/arm64/include/asm/rsi_cmds.h             | 75 +----------------
 .../virt/coco/arm-cca-guest/arm-cca-guest.c   |  2 +
 drivers/virt/coco/arm-cca-guest/rsi.h         | 84 +++++++++++++++++++
 .../linux/arm-smccc-rsi.h                     |  6 +-
 4 files changed, 90 insertions(+), 77 deletions(-)
 create mode 100644 drivers/virt/coco/arm-cca-guest/rsi.h
 rename arch/arm64/include/asm/rsi_smc.h => include/linux/arm-smccc-rsi.h (98%)

diff --git a/arch/arm64/include/asm/rsi_cmds.h b/arch/arm64/include/asm/rsi_cmds.h
index 2c8763876dfb..8537d0fd3da6 100644
--- a/arch/arm64/include/asm/rsi_cmds.h
+++ b/arch/arm64/include/asm/rsi_cmds.h
@@ -6,12 +6,10 @@
 #ifndef __ASM_RSI_CMDS_H
 #define __ASM_RSI_CMDS_H
 
-#include <linux/arm-smccc.h>
+#include <linux/arm-smccc-rsi.h>
 #include <linux/string.h>
 #include <asm/memory.h>
 
-#include <asm/rsi_smc.h>
-
 #define RSI_GRANULE_SHIFT		12
 #define RSI_GRANULE_SIZE		(_AC(1, UL) << RSI_GRANULE_SHIFT)
 
@@ -88,75 +86,4 @@ static inline long rsi_set_addr_range_state(phys_addr_t start,
 	return res.a0;
 }
 
-/**
- * rsi_attestation_token_init - Initialise the operation to retrieve an
- * attestation token.
- *
- * @challenge:	The challenge data to be used in the attestation token
- *		generation.
- * @size:	Size of the challenge data in bytes.
- *
- * Initialises the attestation token generation and returns an upper bound
- * on the attestation token size that can be used to allocate an adequate
- * buffer. The caller is expected to subsequently call
- * rsi_attestation_token_continue() to retrieve the attestation token data on
- * the same CPU.
- *
- * Returns:
- *  On success, returns the upper limit of the attestation report size.
- *  Otherwise, -EINVAL
- */
-static inline long
-rsi_attestation_token_init(const u8 *challenge, unsigned long size)
-{
-	struct arm_smccc_1_2_regs regs = { 0 };
-
-	/* The challenge must be at least 32bytes and at most 64bytes */
-	if (!challenge || size < 32 || size > 64)
-		return -EINVAL;
-
-	regs.a0 = SMC_RSI_ATTESTATION_TOKEN_INIT;
-	memcpy(&regs.a1, challenge, size);
-	arm_smccc_1_2_smc(&regs, &regs);
-
-	if (regs.a0 == RSI_SUCCESS)
-		return regs.a1;
-
-	return -EINVAL;
-}
-
-/**
- * rsi_attestation_token_continue - Continue the operation to retrieve an
- * attestation token.
- *
- * @granule: {I}PA of the Granule to which the token will be written.
- * @offset:  Offset within Granule to start of buffer in bytes.
- * @size:    The size of the buffer.
- * @len:     The number of bytes written to the buffer.
- *
- * Retrieves up to a RSI_GRANULE_SIZE worth of token data per call. The caller
- * is expected to call rsi_attestation_token_init() before calling this
- * function to retrieve the attestation token.
- *
- * Return:
- * * %RSI_SUCCESS     - Attestation token retrieved successfully.
- * * %RSI_INCOMPLETE  - Token generation is not complete.
- * * %RSI_ERROR_INPUT - A parameter was not valid.
- * * %RSI_ERROR_STATE - Attestation not in progress.
- */
-static inline unsigned long rsi_attestation_token_continue(phys_addr_t granule,
-							   unsigned long offset,
-							   unsigned long size,
-							   unsigned long *len)
-{
-	struct arm_smccc_res res;
-
-	arm_smccc_1_1_invoke(SMC_RSI_ATTESTATION_TOKEN_CONTINUE,
-			     granule, offset, size, 0, &res);
-
-	if (len)
-		*len = res.a1;
-	return res.a0;
-}
-
 #endif /* __ASM_RSI_CMDS_H */
diff --git a/drivers/virt/coco/arm-cca-guest/arm-cca-guest.c b/drivers/virt/coco/arm-cca-guest/arm-cca-guest.c
index 32cd038cb79b..d05acddf6c4e 100644
--- a/drivers/virt/coco/arm-cca-guest/arm-cca-guest.c
+++ b/drivers/virt/coco/arm-cca-guest/arm-cca-guest.c
@@ -14,6 +14,8 @@
 
 #include <asm/rsi.h>
 
+#include "rsi.h"
+
 /**
  * struct arm_cca_token_info - a descriptor for the token buffer.
  * @challenge:		Pointer to the challenge data
diff --git a/drivers/virt/coco/arm-cca-guest/rsi.h b/drivers/virt/coco/arm-cca-guest/rsi.h
new file mode 100644
index 000000000000..f7303f4bce17
--- /dev/null
+++ b/drivers/virt/coco/arm-cca-guest/rsi.h
@@ -0,0 +1,84 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2026 ARM Ltd.
+ */
+
+#ifndef _VIRT_COCO_RSI_H_
+#define _VIRT_COCO_RSI_H_
+
+#include <linux/arm-smccc-rsi.h>
+
+/**
+ * rsi_attestation_token_init - Initialise the operation to retrieve an
+ * attestation token.
+ *
+ * @challenge:	The challenge data to be used in the attestation token
+ *		generation.
+ * @size:	Size of the challenge data in bytes.
+ *
+ * Initialises the attestation token generation and returns an upper bound
+ * on the attestation token size that can be used to allocate an adequate
+ * buffer. The caller is expected to subsequently call
+ * rsi_attestation_token_continue() to retrieve the attestation token data on
+ * the same CPU.
+ *
+ * Returns:
+ *  On success, returns the upper limit of the attestation report size.
+ *  Otherwise, -EINVAL
+ */
+static inline long
+rsi_attestation_token_init(const u8 *challenge, unsigned long size)
+{
+	struct arm_smccc_1_2_regs regs = { 0 };
+
+	/* The challenge must be at least 32bytes and at most 64bytes */
+	if (!challenge || size < 32 || size > 64)
+		return -EINVAL;
+
+	regs.a0 = SMC_RSI_ATTESTATION_TOKEN_INIT;
+	memcpy(&regs.a1, challenge, size);
+	arm_smccc_1_2_smc(&regs, &regs);
+
+	if (regs.a0 == RSI_SUCCESS)
+		return regs.a1;
+
+	return -EINVAL;
+}
+
+/**
+ * rsi_attestation_token_continue - Continue the operation to retrieve an
+ * attestation token.
+ *
+ * @granule: {I}PA of the Granule to which the token will be written.
+ * @offset:  Offset within Granule to start of buffer in bytes.
+ * @size:    The size of the buffer.
+ * @len:     The number of bytes written to the buffer.
+ *
+ * Retrieves up to a RSI_GRANULE_SIZE worth of token data per call. The caller
+ * is expected to call rsi_attestation_token_init() before calling this
+ * function to retrieve the attestation token.
+ *
+ * Return:
+ * * %RSI_SUCCESS     - Attestation token retrieved successfully.
+ * * %RSI_INCOMPLETE  - Token generation is not complete.
+ * * %RSI_ERROR_INPUT - A parameter was not valid.
+ * * %RSI_ERROR_STATE - Attestation not in progress.
+ */
+static inline unsigned long rsi_attestation_token_continue(phys_addr_t granule,
+							   unsigned long offset,
+							   unsigned long size,
+							   unsigned long *len)
+{
+	struct arm_smccc_res res;
+
+	arm_smccc_1_1_invoke(SMC_RSI_ATTESTATION_TOKEN_CONTINUE,
+			     granule, offset, size, 0, &res);
+
+	if (len)
+		*len = res.a1;
+	return res.a0;
+}
+
+
+
+#endif
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

