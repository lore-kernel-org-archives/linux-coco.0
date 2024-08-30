Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CD56165F05
	for <linux-coco@lists.linux.dev>; Fri, 30 Aug 2024 13:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725022929; cv=none; b=PZFtPIBi6xy0vQvF5Ym92OLca7M7RFs5JhBO8E3EmxgRGl/Dz/n7gTyIJ0ezpxE9i5aK37k6wGKoZInpEwme1o8yEfTizZF8dNMaBi8S1xrt85FANEgAmkznKSx4tOMuRdNtshBYLjSdm6OB6ji+j4xSqjAheOau6Hj5Ad6hJDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725022929; c=relaxed/simple;
	bh=qTz8+4KZJ9jmNRyCyxzTXMmgL2jFbYBbBH6Rnd7TGIk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=F3dysCt8AbpYVyus4GlbN4YC9A7JEj0afEiCuO6Oj+ll09h5D0XW4pYqKYy7WEyoisIQq1GZ7EUEeWapfwYN7yrMzi+rpKQNS4z7GfHvZgZf9+s5Gozv4kaS038HJxxbuJ6MuDduFDMQxTZjHS25xI2+SwASCySRlrBRAf2HScE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RmMV4qyU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RmMV4qyU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F711C4CEC7;
	Fri, 30 Aug 2024 13:02:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725022929;
	bh=qTz8+4KZJ9jmNRyCyxzTXMmgL2jFbYBbBH6Rnd7TGIk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RmMV4qyU88taVaWQTGIiEZWlrlU0Yq0iorpC8jsymwkMXqEonq74dNXEfPZ9a7O5n
	 tn9bC2sKvKNc6qqHHQ0QvOGLkoododVd5tIWGmBcsom8JEAEA8xMQSOymCGDMSosz2
	 ykbzU2ReGVpzHNwrNj6rW5j27OkErwtBhUnXdrtdmwQqAnHn5TqgZtQdBzifhid85b
	 9sjsHW5DpFP/4Zic68L+DHPdhk0k1+FzlaIewZMPjZmomPRN0LFZ5DETLP4MrCnrUi
	 wISDc9a559K24OQJUbXmiVsAN7UfAtIXwJ2qBqrxTp9QwP8JJQZU032mXxKA+1UCnY
	 LK7sWiqu9ZYEg==
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
Subject: [PATCH v2 6/7] drivers/virt: pkvm: Intercept ioremap using pKVM MMIO_GUARD hypercall
Date: Fri, 30 Aug 2024 14:01:49 +0100
Message-Id: <20240830130150.8568-7-will@kernel.org>
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

Hook up pKVM's MMIO_GUARD hypercall so that ioremap() and friends will
register the target physical address as MMIO with the hypervisor,
allowing guest exits to that page to be emulated by the host with full
syndrome information.

Signed-off-by: Will Deacon <will@kernel.org>
---
 Documentation/virt/kvm/arm/hypercalls.rst     | 26 ++++++++++++++
 drivers/virt/coco/pkvm-guest/arm-pkvm-guest.c | 35 +++++++++++++++++++
 include/linux/arm-smccc.h                     |  7 ++++
 3 files changed, 68 insertions(+)

diff --git a/Documentation/virt/kvm/arm/hypercalls.rst b/Documentation/virt/kvm/arm/hypercalls.rst
index c42580e71bf8..af7bc2c2e0cb 100644
--- a/Documentation/virt/kvm/arm/hypercalls.rst
+++ b/Documentation/virt/kvm/arm/hypercalls.rst
@@ -116,3 +116,29 @@ memory protection granule advertised by ``ARM_SMCCC_KVM_FUNC_HYP_MEMINFO``.
 |                     |          |    +---------------------------------------------+
 |                     |          |    | ``INVALID_PARAMETER (-3)``                  |
 +---------------------+----------+----+---------------------------------------------+
+
+``ARM_SMCCC_KVM_FUNC_MMIO_GUARD``
+----------------------------------
+
+Request that a given memory region is handled as MMIO by the hypervisor,
+allowing accesses to this region to be emulated by the KVM host. The size of the
+region is equal to the memory protection granule advertised by
+``ARM_SMCCC_KVM_FUNC_HYP_MEMINFO``.
+
++---------------------+-------------------------------------------------------------+
+| Presence:           | Optional; pKVM protected guests only.                       |
++---------------------+-------------------------------------------------------------+
+| Calling convention: | HVC64                                                       |
++---------------------+----------+--------------------------------------------------+
+| Function ID:        | (uint32) | 0xC6000007                                       |
++---------------------+----------+----+---------------------------------------------+
+| Arguments:          | (uint64) | R1 | Base IPA of MMIO memory region              |
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
index 8256cf68fd76..56a3859dda8a 100644
--- a/drivers/virt/coco/pkvm-guest/arm-pkvm-guest.c
+++ b/drivers/virt/coco/pkvm-guest/arm-pkvm-guest.c
@@ -9,8 +9,10 @@
 
 #include <linux/arm-smccc.h>
 #include <linux/array_size.h>
+#include <linux/io.h>
 #include <linux/mem_encrypt.h>
 #include <linux/mm.h>
+#include <linux/pgtable.h>
 
 #include <asm/hypervisor.h>
 
@@ -67,6 +69,36 @@ static const struct arm64_mem_crypt_ops pkvm_crypt_ops = {
 	.decrypt	= pkvm_set_memory_decrypted,
 };
 
+static int mmio_guard_ioremap_hook(phys_addr_t phys, size_t size,
+				   pgprot_t *prot)
+{
+	phys_addr_t end;
+	pteval_t protval = pgprot_val(*prot);
+
+	/*
+	 * We only expect MMIO emulation for regions mapped with device
+	 * attributes.
+	 */
+	if (protval != PROT_DEVICE_nGnRE && protval != PROT_DEVICE_nGnRnE)
+		return 0;
+
+	phys = PAGE_ALIGN_DOWN(phys);
+	end = phys + PAGE_ALIGN(size);
+
+	while (phys < end) {
+		const int func_id = ARM_SMCCC_VENDOR_HYP_KVM_MMIO_GUARD_FUNC_ID;
+		int err;
+
+		err = arm_smccc_do_one_page(func_id, phys);
+		if (err)
+			return err;
+
+		phys += PAGE_SIZE;
+	}
+
+	return 0;
+}
+
 void pkvm_init_hyp_services(void)
 {
 	int i;
@@ -89,4 +121,7 @@ void pkvm_init_hyp_services(void)
 
 	pkvm_granule = res.a0;
 	arm64_mem_crypt_ops_register(&pkvm_crypt_ops);
+
+	if (kvm_arm_hyp_service_available(ARM_SMCCC_KVM_FUNC_MMIO_GUARD))
+		arm64_ioremap_prot_hook_register(&mmio_guard_ioremap_hook);
 }
diff --git a/include/linux/arm-smccc.h b/include/linux/arm-smccc.h
index 9cb7c95920b0..e93c1f7cea70 100644
--- a/include/linux/arm-smccc.h
+++ b/include/linux/arm-smccc.h
@@ -118,6 +118,7 @@
 #define ARM_SMCCC_KVM_FUNC_HYP_MEMINFO		2
 #define ARM_SMCCC_KVM_FUNC_MEM_SHARE		3
 #define ARM_SMCCC_KVM_FUNC_MEM_UNSHARE		4
+#define ARM_SMCCC_KVM_FUNC_MMIO_GUARD		7
 #define ARM_SMCCC_KVM_FUNC_FEATURES_2		127
 #define ARM_SMCCC_KVM_NUM_FUNCS			128
 
@@ -158,6 +159,12 @@
 			   ARM_SMCCC_OWNER_VENDOR_HYP,			\
 			   ARM_SMCCC_KVM_FUNC_MEM_UNSHARE)
 
+#define ARM_SMCCC_VENDOR_HYP_KVM_MMIO_GUARD_FUNC_ID			\
+	ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL,				\
+			   ARM_SMCCC_SMC_64,				\
+			   ARM_SMCCC_OWNER_VENDOR_HYP,			\
+			   ARM_SMCCC_KVM_FUNC_MMIO_GUARD)
+
 /* ptp_kvm counter type ID */
 #define KVM_PTP_VIRT_COUNTER			0
 #define KVM_PTP_PHYS_COUNTER			1
-- 
2.46.0.469.g59c65b2a67-goog

