Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B20A11A2C0F
	for <linux-coco@lists.linux.dev>; Tue, 30 Jul 2024 15:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722352292; cv=none; b=nI2jZ/xspm9aT+baHpT2HV/nTbP5mHmT2ZOslXPZ4V4vJKmXIh0wGra4t0qjHLCI/H9RJ9cj+wL9eA771YijumdMX8vkA1Bm9KF57ZoT6COOGdyelh/TJNVpN0gKfH0kP03TkxxfJ0i7kOPE9UkozM0WJvsISnxhEOeu5JYoz9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722352292; c=relaxed/simple;
	bh=wWyS+9FFbvxA5j90iQv++WgQYG0skQr8WSfhg9MLzqM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=MYBiqaUH1ZoXZf6zlzWq2Z1Dy8lxA+Glrv2A5KpyOv/nENMTzrF7aBhvf04xMKXWe17TL963sQvH6NvdHY8IziqWJwe+FoqSJRSm+yXs2osYnj6fhd56ajq/45CQzCXdguTw00skQ15MvSCkQzVQPhOrXLa9m29oc35IRpPsyXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=apd+U1Iq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="apd+U1Iq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C852C4AF0A;
	Tue, 30 Jul 2024 15:11:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722352291;
	bh=wWyS+9FFbvxA5j90iQv++WgQYG0skQr8WSfhg9MLzqM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=apd+U1IqmYcWk0Q+9WorkBrtYp18Zz+eNlb1D/ePurMKsXFz6EbGx8wA1/28ta6NY
	 WMjdo0gQbDmEL+gjgxNzEVNTvkpj+hjyeZQbU4i6obSrXGPBfor3wIGwmdFIzTBtqX
	 tH03MRWTRBi16HPr20TOqMH7kC2vWkT1gHlVVzbgQFLvFtBd3Lgo8BfiTXAlTbC0Fh
	 CCBn1ERcp/2od575W2IVddduMPb5e9DKY95Gts2gj3K1GsTuO3TgTXAi2jWUHHwWLS
	 VIJekE7yrT3XxzRDCQh5apbUen65OKgtc8fQRMFM4Iv+KQnstdBNspIVLnkT5tObkP
	 JbiO5iGQ29DpA==
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
Subject: [PATCH 5/6] arm64: mm: Add confidential computing hook to ioremap_prot()
Date: Tue, 30 Jul 2024 16:11:11 +0100
Message-Id: <20240730151113.1497-6-will@kernel.org>
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

Confidential Computing environments such as pKVM and Arm's CCA
distinguish between shared (i.e. emulated) and private (i.e. assigned)
MMIO regions.

Introduce a hook into our implementation of ioremap_prot() so that MMIO
regions can be shared if necessary.

Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/include/asm/io.h |  4 ++++
 arch/arm64/mm/ioremap.c     | 23 ++++++++++++++++++++++-
 2 files changed, 26 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/io.h b/arch/arm64/include/asm/io.h
index 41fd90895dfc..1ada23a6ec19 100644
--- a/arch/arm64/include/asm/io.h
+++ b/arch/arm64/include/asm/io.h
@@ -271,6 +271,10 @@ __iowrite64_copy(void __iomem *to, const void *from, size_t count)
  * I/O memory mapping functions.
  */
 
+typedef int (*ioremap_prot_hook_t)(phys_addr_t phys_addr, size_t size,
+				   pgprot_t *prot);
+int arm64_ioremap_prot_hook_register(const ioremap_prot_hook_t hook);
+
 #define ioremap_prot ioremap_prot
 
 #define _PAGE_IOREMAP PROT_DEVICE_nGnRE
diff --git a/arch/arm64/mm/ioremap.c b/arch/arm64/mm/ioremap.c
index 269f2f63ab7d..6cc0b7e7eb03 100644
--- a/arch/arm64/mm/ioremap.c
+++ b/arch/arm64/mm/ioremap.c
@@ -3,10 +3,22 @@
 #include <linux/mm.h>
 #include <linux/io.h>
 
+static ioremap_prot_hook_t ioremap_prot_hook;
+
+int arm64_ioremap_prot_hook_register(ioremap_prot_hook_t hook)
+{
+	if (WARN_ON(ioremap_prot_hook))
+		return -EBUSY;
+
+	ioremap_prot_hook = hook;
+	return 0;
+}
+
 void __iomem *ioremap_prot(phys_addr_t phys_addr, size_t size,
 			   unsigned long prot)
 {
 	unsigned long last_addr = phys_addr + size - 1;
+	pgprot_t pgprot = __pgprot(prot);
 
 	/* Don't allow outside PHYS_MASK */
 	if (last_addr & ~PHYS_MASK)
@@ -16,7 +28,16 @@ void __iomem *ioremap_prot(phys_addr_t phys_addr, size_t size,
 	if (WARN_ON(pfn_is_map_memory(__phys_to_pfn(phys_addr))))
 		return NULL;
 
-	return generic_ioremap_prot(phys_addr, size, __pgprot(prot));
+	/*
+	 * If a hook is registered (e.g. for confidential computing
+	 * purposes), call that now and barf if it fails.
+	 */
+	if (unlikely(ioremap_prot_hook) &&
+	    WARN_ON(ioremap_prot_hook(phys_addr, size, &pgprot))) {
+		return NULL;
+	}
+
+	return generic_ioremap_prot(phys_addr, size, pgprot);
 }
 EXPORT_SYMBOL(ioremap_prot);
 
-- 
2.46.0.rc1.232.g9752f9e123-goog

