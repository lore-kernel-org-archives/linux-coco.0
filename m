Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 796BB165F05
	for <linux-coco@lists.linux.dev>; Fri, 30 Aug 2024 13:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725022927; cv=none; b=Lw9ssPjVI0cCe3sfvIWuy6LHktcOasL9GOb4IV27QMU8cCWoGY62BnJ+uIAfaqzuOxPhDuf1/ulijB0cdEOFgBO8J7N9NGwT84L+OnMefQVB+suDil8fIvNOwcjLGEplpGOGpg5ElbOvnE9L5VsgtKlYk43h1k/8Pbs3W2uV7Ng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725022927; c=relaxed/simple;
	bh=TZrzB5fPLpvYHwo1cKo9hi7uRpJWiBXXGYqxoUGAtU8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=muBVjjhP9VDM/958tEBYjehGKMG532RBTK79v65yVovZwNOKfM0bqLMD8z/9At+xizyRi9lrx6HpkikNuKxC9eAfb6N4MW62zjM7SP+fGdLWV51QKj5wdUBXbLVDR+CMVniMld0sKR6uNir/xikNZPf9TmVkyHrFQvrVV9ioS3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iXLp7mli; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iXLp7mli"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32D6CC4CEC9;
	Fri, 30 Aug 2024 13:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725022927;
	bh=TZrzB5fPLpvYHwo1cKo9hi7uRpJWiBXXGYqxoUGAtU8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iXLp7mliFQhpVDtj60q+mlhp88lZf4ayhJESTovY4dDZSNHaxXwBIpAxk2cDYVIHL
	 N8r3LmWx/eCVYBwMLUYjxwma35obU1xsCFZCGkbrNJCzL49hZUPmzwTUwG7oEL50H+
	 /hYF9teXpLf9IiaCz0tQaKsWqJU/PEx8OxKQXw0zpsEqSiEcFoWcipbOcwnmC9tcLl
	 h0ZcG3PV263unoc1WgNKrpujqQZMI04+wLJ7t9FLWTv2xPYMPy7FbMSvrFhfuR29p5
	 Q949ycBjFndGw8P2I9Sct4Q/hFf3OigeQ3e9/+TlIk6HM5LX5Q7R0RdolHtE0DdG3W
	 eegFd0Uu9eBKQ==
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
Subject: [PATCH v2 5/7] arm64: mm: Add confidential computing hook to ioremap_prot()
Date: Fri, 30 Aug 2024 14:01:48 +0100
Message-Id: <20240830130150.8568-6-will@kernel.org>
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
2.46.0.469.g59c65b2a67-goog

