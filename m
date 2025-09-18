Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE6DB306486
	for <linux-coco@lists.linux.dev>; Thu, 18 Sep 2025 12:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758200195; cv=none; b=PbB/8PYwJPWllZotAMZ+BM/zmaS12bxYncu/HbwVACI8xUFfGvDYaFkqvtJ4MUevxC8Gq3FI5UjacyECOLQEKamI74f43T76kj0n/JvC6fPN4KkomcIavpLjdJ/v0PVE345K1+OanZgzEutBgTS+0kGUTGrTUOBTbVKIciXc/fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758200195; c=relaxed/simple;
	bh=2u1rVz+L33xuk2tuSWHg8OaS3eVnMWm7T+p+EPdK3Ug=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ek2a2YEu/4qRhyKIxlsSP24M9oM5N3askuH1j3UxdAVpd+CnaU4Gi5cevIJjmmguQ2M03ZtQXN1pfsjtVmL1gQkId0CMLUNPZZB4MARS+UpptzydYnf7+ZL24bZk0MSu8yUpge13ikx5dpo7pif0Qz1zbhM5IRP7y4U4vYxuFR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 167E61AED;
	Thu, 18 Sep 2025 05:56:25 -0700 (PDT)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E20AB3F66E;
	Thu, 18 Sep 2025 05:56:31 -0700 (PDT)
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	linux-coco@lists.linux.dev,
	catalin.marinas@arm.com,
	will@kernel.org,
	gshan@redhat.com,
	aneesh.kumar@kernel.org,
	sami.mujawar@arm.com,
	sudeep.holla@arm.com,
	steven.price@arm.com,
	Suzuki K Poulose <suzuki.poulose@arm.com>
Subject: [PATCH v3 3/3] arm64: acpi: Enable ACPI CCEL support
Date: Thu, 18 Sep 2025 13:56:18 +0100
Message-ID: <20250918125618.2125733-4-suzuki.poulose@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250918125618.2125733-1-suzuki.poulose@arm.com>
References: <20250918125618.2125733-1-suzuki.poulose@arm.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for ACPI CCEL by handling the EfiACPIMemoryNVS type memory.
As per UEFI specifications NVS memory is reserved for Firmware use even
after exiting boot services. Thus map the region as read-only.

Cc: Sami Mujawar <sami.mujawar@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
Cc: Steven Price <steven.price@arm.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>
Cc: Gavin Shan <gshan@redhat.com>
Reviewed-by: Gavin Shan <gshan@redhat.com>
Tested-by: Sami Mujawar <sami.mujawar@arm.com>
Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
---
 arch/arm64/kernel/acpi.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/kernel/acpi.c b/arch/arm64/kernel/acpi.c
index 4d529ff7ba51..b3195b3b895f 100644
--- a/arch/arm64/kernel/acpi.c
+++ b/arch/arm64/kernel/acpi.c
@@ -357,6 +357,16 @@ void __iomem *acpi_os_ioremap(acpi_physical_address phys, acpi_size size)
 			 * as long as we take care not to create a writable
 			 * mapping for executable code.
 			 */
+			fallthrough;
+
+		case EFI_ACPI_MEMORY_NVS:
+			/*
+			 * ACPI NVS marks an area reserved for use by the
+			 * firmware, even after exiting the boot service.
+			 * This may be used by the firmware for sharing dynamic
+			 * tables/data (e.g., ACPI CCEL) with the OS. Map it
+			 * as read-only.
+			 */
 			prot = PAGE_KERNEL_RO;
 			break;
 
-- 
2.43.0

