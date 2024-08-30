Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7FDD165F05
	for <linux-coco@lists.linux.dev>; Fri, 30 Aug 2024 13:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725022924; cv=none; b=XfV3UcLLFU/SjK6T5LMFAIY4mjAQkmLlrix7Jmlt0XDRkZwaqhvUTdZe3OBpK2Tsd2M5IAhvq7zxmzfn4nO+Xuex2DIoqNW0TKfTkc/OyRo79WxtVpfcx9m8m8nRBVnOsJy/He6AXGiJWTJ5Tdi7y+9K/YxvH6TAZtMPc/0Qxu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725022924; c=relaxed/simple;
	bh=fOFx+vCt8zSA57KmyUhuAyFmh0/KvJ1/VKXwh9l++u8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=q9y5ujScLg0OUIvaGeIxkmwuRihVmgUkEJWGHjbbWh05XXQPTgBAaWPxIqoddRO9QhxMarhs+KsYsoE45Eu8Mnxt20EdoNPr8gc2jl7DjOA+V5EBrxdcSaVx+dkCrOSPmBdqlnLigMJ4hxELTOQEcQ/ZhqycFVlf+xZiKlgKibw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GAHkh1qT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GAHkh1qT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAD05C4CEC7;
	Fri, 30 Aug 2024 13:02:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725022924;
	bh=fOFx+vCt8zSA57KmyUhuAyFmh0/KvJ1/VKXwh9l++u8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GAHkh1qTi7oYPE2zN8n3dhr38w5cisPWLPHf8zTV6iDTr+wsL/iBsDZ6ls1cgLSz5
	 IF1MXB85RhM1j7YqSwWQXzfQav9PWxOrGxbJYMgzeQwHgmCG/lvM0gezWsbpsRB3JW
	 /OY9Z3P0QqWXjOgrcVsQ5itABnI5/d271z9CacTz+vsGUJHm5lFkqsPj0tF6TiIDu+
	 Q9FRhm7i0tJe9bdUnfdKuEjb3Z7awrFJHHBF/OaohVyBvW3dN8SFX618xBbje3ycq/
	 rChwaWsqw/jfyo2qs3LT0B3ds8FEwwoQJ5Me9r8a5NUMX8PDPuC6ubQ9qbdzMTpxkZ
	 tQwX/Dj7SNoOw==
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
Subject: [PATCH v2 4/7] drivers/virt: pkvm: Hook up mem_encrypt API using pKVM hypercalls
Date: Fri, 30 Aug 2024 14:01:47 +0100
Message-Id: <20240830130150.8568-5-will@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20240830130150.8568-1-will@kernel.org>
References: <20240830130150.8568-1-will@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If we detect the presence of pKVM's SHARE and UNSHARE hypercalls, then
register a backend implementation of the mem_encrypt API so that things
like DMA buffers can be shared appropriately with the host.

Signed-off-by: Will Deacon <will@kernel.org>
---
 Documentation/virt/kvm/arm/hypercalls.rst     | 50 +++++++++++++++++
 drivers/virt/coco/pkvm-guest/arm-pkvm-guest.c | 55 +++++++++++++++++++
 include/linux/arm-smccc.h                     | 14 +++++
 3 files changed, 119 insertions(+)

diff --git a/Documentation/virt/kvm/arm/hypercalls.rst b/Documentation/virt/kvm/arm/hypercalls.rst
index 16515eb42149..c42580e71bf8 100644
--- a/Documentation/virt/kvm/arm/hypercalls.rst
+++ b/Documentation/virt/kvm/arm/hypercalls.rst
@@ -66,3 +66,53 @@ Query the memory protection parameters for a pKVM protected virtual machine.
 | Return Values:      | (int64)  | R0 | ``INVALID_PARAMETER (-3)`` on error, else   |
 |                     |          |    | memory protection granule in bytes          |
 +---------------------+----------+----+---------------------------------------------+
+
+``ARM_SMCCC_KVM_FUNC_MEM_SHARE``
+--------------------------------
+
+Share a region of memory with the KVM host, granting it read, write and execute
+permissions. The size of the region is equal to the memory protection granule
+advertised by ``ARM_SMCCC_KVM_FUNC_HYP_MEMINFO``.
+
++---------------------+-------------------------------------------------------------+
+| Presence:           | Optional; pKVM protected guests only.                       |
++---------------------+-------------------------------------------------------------+
+| Calling convention: | HVC64                                                       |
++---------------------+----------+--------------------------------------------------+
+| Function ID:        | (uint32) | 0xC6000003                                       |
++---------------------+----------+----+---------------------------------------------+
+| Arguments:          | (uint64) | R1 | Base IPA of memory region to share          |
+|                     +----------+----+---------------------------------------------+
+|                     | (uint64) | R2 | Reserved / Must be zero                     |
+|                     +----------+----+---------------------------------------------+
+|                     | (uint64) | R3 | Reserved / Must be zero                     |
++---------------------+----------+----+---------------------------------------------+
+| Return Values:      | (int64)  | R0 | ``SUCCESS (0)``                             |
+|                     |          |    +---------------------------------------------+
+|                     |          |    | ``INVALID_PARAMETER (-3)``                  |
++---------------------+----------+----+---------------------------------------------+
+
+``ARM_SMCCC_KVM_FUNC_MEM_UNSHARE``
+----------------------------------
+
+Revoke access permission from the KVM host to a memory region previously shared
+with ``ARM_SMCCC_KVM_FUNC_MEM_SHARE``. The size of the region is equal to the
+memory protection granule advertised by ``ARM_SMCCC_KVM_FUNC_HYP_MEMINFO``.
+
++---------------------+-------------------------------------------------------------+
+| Presence:           | Optional; pKVM protected guests only.                       |
++---------------------+-------------------------------------------------------------+
+| Calling convention: | HVC64                                                       |
++---------------------+----------+--------------------------------------------------+
+| Function ID:        | (uint32) | 0xC6000004                                       |
++---------------------+----------+----+---------------------------------------------+
+| Arguments:          | (uint64) | R1 | Base IPA of memory region to unshare        |
+|                     +----------+----+---------------------------------------------+
+|                     | (uint64) | R2 | Reserved / Must be zero                     |
+|                     +----------+----+---------------------------------------------+
+|                     | (uint64) | R3 | Reserved / Must be zero                     |
++---------------------+----------+----+---------------------------------------------+
+| Return Values:      | (int64)  | R0 | ``SUCCESS (0)``                             |
+|                     |          |    +---------------------------------------------+
+|                     |          |    | ``INVALID_PARAMETER (-3)``                  |
++---------------------+----------+----+---------------------------------------------+
diff --git a/drivers/virt/coco/pkvm-guest/arm-pkvm-guest.c b/drivers/virt/coco/pkvm-guest/arm-pkvm-guest.c
index a5148701d2f1..8256cf68fd76 100644
--- a/drivers/virt/coco/pkvm-guest/arm-pkvm-guest.c
+++ b/drivers/virt/coco/pkvm-guest/arm-pkvm-guest.c
@@ -9,18 +9,72 @@
 
 #include <linux/arm-smccc.h>
 #include <linux/array_size.h>
+#include <linux/mem_encrypt.h>
 #include <linux/mm.h>
 
 #include <asm/hypervisor.h>
 
 static size_t pkvm_granule;
 
+static int arm_smccc_do_one_page(u32 func_id, phys_addr_t phys)
+{
+	phys_addr_t end = phys + PAGE_SIZE;
+
+	while (phys < end) {
+		struct arm_smccc_res res;
+
+		arm_smccc_1_1_invoke(func_id, phys, 0, 0, &res);
+		if (res.a0 != SMCCC_RET_SUCCESS)
+			return -EPERM;
+
+		phys += pkvm_granule;
+	}
+
+	return 0;
+}
+
+static int __set_memory_range(u32 func_id, unsigned long start, int numpages)
+{
+	void *addr = (void *)start, *end = addr + numpages * PAGE_SIZE;
+
+	while (addr < end) {
+		int err;
+
+		err = arm_smccc_do_one_page(func_id, virt_to_phys(addr));
+		if (err)
+			return err;
+
+		addr += PAGE_SIZE;
+	}
+
+	return 0;
+}
+
+static int pkvm_set_memory_encrypted(unsigned long addr, int numpages)
+{
+	return __set_memory_range(ARM_SMCCC_VENDOR_HYP_KVM_MEM_UNSHARE_FUNC_ID,
+				  addr, numpages);
+}
+
+static int pkvm_set_memory_decrypted(unsigned long addr, int numpages)
+{
+	return __set_memory_range(ARM_SMCCC_VENDOR_HYP_KVM_MEM_SHARE_FUNC_ID,
+				  addr, numpages);
+}
+
+static const struct arm64_mem_crypt_ops pkvm_crypt_ops = {
+	.encrypt	= pkvm_set_memory_encrypted,
+	.decrypt	= pkvm_set_memory_decrypted,
+};
+
 void pkvm_init_hyp_services(void)
 {
 	int i;
 	struct arm_smccc_res res;
 	const u32 funcs[] = {
 		ARM_SMCCC_KVM_FUNC_HYP_MEMINFO,
+		ARM_SMCCC_KVM_FUNC_MEM_SHARE,
+		ARM_SMCCC_KVM_FUNC_MEM_UNSHARE,
 	};
 
 	for (i = 0; i < ARRAY_SIZE(funcs); ++i) {
@@ -34,4 +88,5 @@ void pkvm_init_hyp_services(void)
 		return;
 
 	pkvm_granule = res.a0;
+	arm64_mem_crypt_ops_register(&pkvm_crypt_ops);
 }
diff --git a/include/linux/arm-smccc.h b/include/linux/arm-smccc.h
index 16b6dcc54e02..9cb7c95920b0 100644
--- a/include/linux/arm-smccc.h
+++ b/include/linux/arm-smccc.h
@@ -116,6 +116,8 @@
 #define ARM_SMCCC_KVM_FUNC_FEATURES		0
 #define ARM_SMCCC_KVM_FUNC_PTP			1
 #define ARM_SMCCC_KVM_FUNC_HYP_MEMINFO		2
+#define ARM_SMCCC_KVM_FUNC_MEM_SHARE		3
+#define ARM_SMCCC_KVM_FUNC_MEM_UNSHARE		4
 #define ARM_SMCCC_KVM_FUNC_FEATURES_2		127
 #define ARM_SMCCC_KVM_NUM_FUNCS			128
 
@@ -144,6 +146,18 @@
 			   ARM_SMCCC_OWNER_VENDOR_HYP,			\
 			   ARM_SMCCC_KVM_FUNC_HYP_MEMINFO)
 
+#define ARM_SMCCC_VENDOR_HYP_KVM_MEM_SHARE_FUNC_ID			\
+	ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL,				\
+			   ARM_SMCCC_SMC_64,				\
+			   ARM_SMCCC_OWNER_VENDOR_HYP,			\
+			   ARM_SMCCC_KVM_FUNC_MEM_SHARE)
+
+#define ARM_SMCCC_VENDOR_HYP_KVM_MEM_UNSHARE_FUNC_ID			\
+	ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL,				\
+			   ARM_SMCCC_SMC_64,				\
+			   ARM_SMCCC_OWNER_VENDOR_HYP,			\
+			   ARM_SMCCC_KVM_FUNC_MEM_UNSHARE)
+
 /* ptp_kvm counter type ID */
 #define KVM_PTP_VIRT_COUNTER			0
 #define KVM_PTP_PHYS_COUNTER			1
-- 
2.46.0.469.g59c65b2a67-goog

