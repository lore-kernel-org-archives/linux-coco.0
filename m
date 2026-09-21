Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1F80357D09;
	Mon, 21 Sep 2026 05:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789969129; cv=none; b=qunAclcNWU0DRA8bVD8oUMqkJVZRw5r0euaCEearYq83+ssSP7jitTNQJCSA4sfkQ5nf7grGhQh2Gf+GGwjqelyPsGyVcehCw1WY8aLdUYmfGxtiYro9DPZ2XdcrKgY09lLIaveO2zVVWd2QBSAp7QLENGV0hBrESz9hgURLj8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789969129; c=relaxed/simple;
	bh=7rVAQhoTDuDKcN2jSKLIq/CIYXI2oJnlG/on20WL4Ys=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O0fxT73Fh3nXzVKkpOh0arDj6z5ogEJ27HOqJguRXqFJRv5NYcKYPbV0526TTeu+SUAfzmKG79RWSxRtnH92sfmH4Yns9565lunQCcNqZDcpxQXW7Z7NmEaPSJ5XnAgcO9idooDVivY9/sTtNoomY2IizPLhyS5sAITgWoh8hVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d76YHmGr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d76YHmGr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4AED1F00893;
	Mon, 21 Sep 2026 05:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789969127;
	bh=qK/5PbD/stey1Ftb7SyyJK4Jfw9qAIxD3DOwlo1cvlM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=d76YHmGrVKUbbAzMuLuI0bAjQtxNKgccvsInjn8S4eYpk9T8WLh/lTzDeEf2RplzM
	 JZ2qeXRPdc6cqOBCQPIO8NEzsFL4GFwkyP7C+6nbpi33tUcmKXhIICnRNHvImIJ0Qr
	 uotxaK4Cn/qYB/rWtjRzV/GuHpmntGz/hZ+mAgbuzKWjygKbD01igkFcEz7jadv27C
	 jiYvMABhH1GzgA34XE816PjIXWQHsJffWvsuuL8V5w9zJXheK/sdGgRqc2ZI9d2KTr
	 zT/y+zfxTS1Ey8Hkl+TMjsoMOLEMnqrCFSCDYsxVoLiRic7MtXNIqoseo7orB6qeft
	 adl9ZIvlXDn4g==
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
	Will Deacon <will@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Suzuki K Poulose <suzuki.poulose@ram.com>
Subject: [PATCH v12 4/7] arm64: realm: Move Realm memory encryption ops to RSI code
Date: Mon, 21 Sep 2026 11:08:04 +0530
Message-ID: <20260921053807.354802-5-aneesh.kumar@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260921053807.354802-1-aneesh.kumar@kernel.org>
References: <20260921053807.354802-1-aneesh.kumar@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Realm memory encryption callbacks are CCA-specific. Keep the Realm callback
registration with the RSI initialization code instead of pageattr.c, which
only needs to provide the low-level page-attribute transition helper.

Export __set_memory_enc_dec() within arm64 so the RSI code can wrap it with
the Realm-specific encrypt/decrypt callbacks and warning policy.

No functional changes in this patch.

Reviewed-by: Suzuki K Poulose <suzuki.poulose@ram.com>
Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
---
 arch/arm64/include/asm/mem_encrypt.h |  3 +--
 arch/arm64/mm/pageattr.c             | 38 +---------------------------
 drivers/firmware/arm_rmm/rsi.c       | 34 +++++++++++++++++++++++++
 3 files changed, 36 insertions(+), 39 deletions(-)

diff --git a/arch/arm64/include/asm/mem_encrypt.h b/arch/arm64/include/asm/mem_encrypt.h
index f03b9d7b83b4..ef8b8463e52b 100644
--- a/arch/arm64/include/asm/mem_encrypt.h
+++ b/arch/arm64/include/asm/mem_encrypt.h
@@ -16,8 +16,7 @@ int arm64_mem_crypt_ops_register(const struct arm64_mem_crypt_ops *ops);
 
 int set_memory_encrypted(unsigned long addr, int numpages);
 int set_memory_decrypted(unsigned long addr, int numpages);
-
-int realm_register_memory_enc_ops(void);
+int __set_memory_enc_dec(unsigned long addr, int numpages, bool encrypt);
 
 static inline bool force_dma_unencrypted(struct device *dev)
 {
diff --git a/arch/arm64/mm/pageattr.c b/arch/arm64/mm/pageattr.c
index bbe98ac9ad8c..14b2a3801f40 100644
--- a/arch/arm64/mm/pageattr.c
+++ b/arch/arm64/mm/pageattr.c
@@ -275,9 +275,7 @@ int set_direct_map_default_noflush(struct page *page)
 				 PAGE_SIZE, set_mask, clear_mask);
 }
 
-static int __set_memory_enc_dec(unsigned long addr,
-				int numpages,
-				bool encrypt)
+int __set_memory_enc_dec(unsigned long addr, int numpages, bool encrypt)
 {
 	unsigned long set_prot = 0, clear_prot = 0;
 	phys_addr_t start, end;
@@ -321,40 +319,6 @@ static int __set_memory_enc_dec(unsigned long addr,
 				      __pgprot(PTE_PRESENT_INVALID));
 }
 
-static int realm_set_memory_encrypted(unsigned long addr, int numpages)
-{
-	int ret = __set_memory_enc_dec(addr, numpages, true);
-
-	/*
-	 * If the request to change state fails, then the only sensible cause
-	 * of action for the caller is to leak the memory
-	 */
-	WARN(ret, "Failed to encrypt memory, %d pages will be leaked",
-	     numpages);
-
-	return ret;
-}
-
-static int realm_set_memory_decrypted(unsigned long addr, int numpages)
-{
-	int ret = __set_memory_enc_dec(addr, numpages, false);
-
-	WARN(ret, "Failed to decrypt memory, %d pages will be leaked",
-	     numpages);
-
-	return ret;
-}
-
-static const struct arm64_mem_crypt_ops realm_crypt_ops = {
-	.encrypt = realm_set_memory_encrypted,
-	.decrypt = realm_set_memory_decrypted,
-};
-
-int realm_register_memory_enc_ops(void)
-{
-	return arm64_mem_crypt_ops_register(&realm_crypt_ops);
-}
-
 int set_direct_map_valid_noflush(struct page *page, unsigned nr, bool valid)
 {
 	unsigned long addr = (unsigned long)page_address(page);
diff --git a/drivers/firmware/arm_rmm/rsi.c b/drivers/firmware/arm_rmm/rsi.c
index 8e716f1c1e31..ada139d0e344 100644
--- a/drivers/firmware/arm_rmm/rsi.c
+++ b/drivers/firmware/arm_rmm/rsi.c
@@ -127,6 +127,40 @@ static int realm_ioremap_hook(phys_addr_t phys, size_t size, pgprot_t *prot)
 	return 0;
 }
 
+static int realm_set_memory_encrypted(unsigned long addr, int numpages)
+{
+	int ret = __set_memory_enc_dec(addr, numpages, true);
+
+	/*
+	 * If the request to change state fails, then the only sensible cause
+	 * of action for the caller is to leak the memory
+	 */
+	WARN(ret, "Failed to encrypt memory, %d pages will be leaked",
+	     numpages);
+
+	return ret;
+}
+
+static int realm_set_memory_decrypted(unsigned long addr, int numpages)
+{
+	int ret = __set_memory_enc_dec(addr, numpages, false);
+
+	WARN(ret, "Failed to decrypt memory, %d pages will be leaked",
+	     numpages);
+
+	return ret;
+}
+
+static const struct arm64_mem_crypt_ops realm_crypt_ops = {
+	.encrypt = realm_set_memory_encrypted,
+	.decrypt = realm_set_memory_decrypted,
+};
+
+static int realm_register_memory_enc_ops(void)
+{
+	return arm64_mem_crypt_ops_register(&realm_crypt_ops);
+}
+
 void __init arm64_rsi_init(void)
 {
 	if (arm_smccc_1_1_get_conduit() != SMCCC_CONDUIT_SMC)
-- 
2.43.0

