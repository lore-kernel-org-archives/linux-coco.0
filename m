Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A18C167266
	for <linux-coco@lists.linux.dev>; Tue, 28 May 2024 09:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716890143; cv=none; b=L2SaWKSdMwvIR1VrSCG9P/pP+o7Sf9zuBFqJiA4J71I29OemADpu8DyDlrGQvq2QQqXci/DTsarv2BYGoX2EPOwqvvYZBFdTtCsjp/xQe68Em6kSJgLvW6OihIfhBqtYA7BoEMw8HFdOqZItUrjzQxp7kA1yMGcTIcd6Ql4pXdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716890143; c=relaxed/simple;
	bh=iLfKKiSk3QwOSaKGHDKAXV6IdTXtC5sh1KcXVbMH51s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iYphXf2p8Cj0UPO1GJdlH2u7BwkpiBxyGar1dD+1bcreTUys9li5jh/HhQ0gaCJXSWJawq8wD+w3bPtwhfYb4EBuzUh0jGJiFCKVWrfudxT+sMDf2Uv01vavVJxQEUslNQDBRniWtysM7tpaUZNVecgot2Cc/NMZDMYiVbiTzhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.helo=mgamail.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VeqHeHm/; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.helo=mgamail.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VeqHeHm/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716890142; x=1748426142;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=iLfKKiSk3QwOSaKGHDKAXV6IdTXtC5sh1KcXVbMH51s=;
  b=VeqHeHm/0Ou70GvCy/4lGu104sPgPBE6PiQq8SCl5GbCmq6WvsQxXCBi
   ghYXL1n8Y2PtAgFtiiANTIGdDGm1s6XgoykZ7O4+4ObU7mmyPQIkI8Gc0
   DW0/CXuaj/neQbVm/UZZZFSp6/gg6g0CPUAKAN7SK9XfAkT0QffGwLWyh
   kSwJDu2gLL3SNqK7ZKbtvtu4RPt8Vtjsmkn2a6k2zAMl8DcNDRn/1IY62
   noYe7JAVbf7MRReJs+NnFV8FSoHIFLgvt+rZ9Zkc3/PmtA5qZ/xXDex7U
   BRXS4D9pLFKBHp5HmH5svujVdr780Ci/xkZKvBPzajAR6vqiq8qEYxM8B
   g==;
X-CSE-ConnectionGUID: GrlZkBY1TOueeCFj6Qavww==
X-CSE-MsgGUID: kv/G8o4tRlSUKvx/CoSSyA==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="13097727"
X-IronPort-AV: E=Sophos;i="6.08,194,1712646000"; 
   d="scan'208";a="13097727"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2024 02:55:40 -0700
X-CSE-ConnectionGUID: Arl+5l2YQWS0kYGKnT0lzQ==
X-CSE-MsgGUID: WV2V9toCS3iSacsINRJXEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,194,1712646000"; 
   d="scan'208";a="34951740"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa007.fm.intel.com with ESMTP; 28 May 2024 02:55:34 -0700
Received: by black.fi.intel.com (Postfix, from userid 1000)
	id 9F3006E4; Tue, 28 May 2024 12:55:26 +0300 (EEST)
From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
	Elena Reshetova <elena.reshetova@intel.com>,
	Jun Nakajima <jun.nakajima@intel.com>,
	Rick Edgecombe  <rick.p.edgecombe@intel.com>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	"Kalra, Ashish" <ashish.kalra@amd.com>,
	Sean Christopherson <seanjc@google.com>,
	"Huang, Kai" <kai.huang@intel.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Baoquan He <bhe@redhat.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
	"K. Y. Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	kexec@lists.infradead.org,
	linux-hyperv@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-coco@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Dave Hansen <dave.hansen@intel.com>,
	Tao Liu <ltao@redhat.com>
Subject: [PATCHv11 08/19] x86/mm: Return correct level from lookup_address() if pte is none
Date: Tue, 28 May 2024 12:55:11 +0300
Message-ID: <20240528095522.509667-9-kirill.shutemov@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240528095522.509667-1-kirill.shutemov@linux.intel.com>
References: <20240528095522.509667-1-kirill.shutemov@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, lookup_address() returns two things:
  1. A "pte_t" (which might be a p[g4um]d_t)
  2. The 'level' of the page tables where the "pte_t" was found
     (returned via a pointer)

If no pte_t is found, 'level' is essentially garbage.

Always fill out the level.  For NULL "pte_t"s, fill in the level where
the p*d_none() entry was found mirroring the "found" behavior.

Always filling out the level allows using lookup_address() to precisely
skip over holes when walking kernel page tables.

Add one more entry into enum pg_level to indicate the size of the VA
covered by one PGD entry in 5-level paging mode.

Update comments for lookup_address() and lookup_address_in_pgd() to
reflect changes in the interface.

Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
Reviewed-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
Reviewed-by: Baoquan He <bhe@redhat.com>
Reviewed-by: Dave Hansen <dave.hansen@intel.com>
Tested-by: Tao Liu <ltao@redhat.com>
---
 arch/x86/include/asm/pgtable_types.h |  1 +
 arch/x86/mm/pat/set_memory.c         | 21 ++++++++++-----------
 2 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/arch/x86/include/asm/pgtable_types.h b/arch/x86/include/asm/pgtable_types.h
index b78644962626..2f321137736c 100644
--- a/arch/x86/include/asm/pgtable_types.h
+++ b/arch/x86/include/asm/pgtable_types.h
@@ -549,6 +549,7 @@ enum pg_level {
 	PG_LEVEL_2M,
 	PG_LEVEL_1G,
 	PG_LEVEL_512G,
+	PG_LEVEL_256T,
 	PG_LEVEL_NUM
 };
 
diff --git a/arch/x86/mm/pat/set_memory.c b/arch/x86/mm/pat/set_memory.c
index 498812f067cd..a7a7a6c6a3fb 100644
--- a/arch/x86/mm/pat/set_memory.c
+++ b/arch/x86/mm/pat/set_memory.c
@@ -662,8 +662,9 @@ static inline pgprot_t verify_rwx(pgprot_t old, pgprot_t new, unsigned long star
 
 /*
  * Lookup the page table entry for a virtual address in a specific pgd.
- * Return a pointer to the entry, the level of the mapping, and the effective
- * NX and RW bits of all page table levels.
+ * Return a pointer to the entry (or NULL if the entry does not exist),
+ * the level of the entry, and the effective NX and RW bits of all
+ * page table levels.
  */
 pte_t *lookup_address_in_pgd_attr(pgd_t *pgd, unsigned long address,
 				  unsigned int *level, bool *nx, bool *rw)
@@ -672,13 +673,14 @@ pte_t *lookup_address_in_pgd_attr(pgd_t *pgd, unsigned long address,
 	pud_t *pud;
 	pmd_t *pmd;
 
-	*level = PG_LEVEL_NONE;
+	*level = PG_LEVEL_256T;
 	*nx = false;
 	*rw = true;
 
 	if (pgd_none(*pgd))
 		return NULL;
 
+	*level = PG_LEVEL_512G;
 	*nx |= pgd_flags(*pgd) & _PAGE_NX;
 	*rw &= pgd_flags(*pgd) & _PAGE_RW;
 
@@ -686,10 +688,10 @@ pte_t *lookup_address_in_pgd_attr(pgd_t *pgd, unsigned long address,
 	if (p4d_none(*p4d))
 		return NULL;
 
-	*level = PG_LEVEL_512G;
 	if (p4d_leaf(*p4d) || !p4d_present(*p4d))
 		return (pte_t *)p4d;
 
+	*level = PG_LEVEL_1G;
 	*nx |= p4d_flags(*p4d) & _PAGE_NX;
 	*rw &= p4d_flags(*p4d) & _PAGE_RW;
 
@@ -697,10 +699,10 @@ pte_t *lookup_address_in_pgd_attr(pgd_t *pgd, unsigned long address,
 	if (pud_none(*pud))
 		return NULL;
 
-	*level = PG_LEVEL_1G;
 	if (pud_leaf(*pud) || !pud_present(*pud))
 		return (pte_t *)pud;
 
+	*level = PG_LEVEL_2M;
 	*nx |= pud_flags(*pud) & _PAGE_NX;
 	*rw &= pud_flags(*pud) & _PAGE_RW;
 
@@ -708,15 +710,13 @@ pte_t *lookup_address_in_pgd_attr(pgd_t *pgd, unsigned long address,
 	if (pmd_none(*pmd))
 		return NULL;
 
-	*level = PG_LEVEL_2M;
 	if (pmd_leaf(*pmd) || !pmd_present(*pmd))
 		return (pte_t *)pmd;
 
+	*level = PG_LEVEL_4K;
 	*nx |= pmd_flags(*pmd) & _PAGE_NX;
 	*rw &= pmd_flags(*pmd) & _PAGE_RW;
 
-	*level = PG_LEVEL_4K;
-
 	return pte_offset_kernel(pmd, address);
 }
 
@@ -736,9 +736,8 @@ pte_t *lookup_address_in_pgd(pgd_t *pgd, unsigned long address,
  * Lookup the page table entry for a virtual address. Return a pointer
  * to the entry and the level of the mapping.
  *
- * Note: We return pud and pmd either when the entry is marked large
- * or when the present bit is not set. Otherwise we would return a
- * pointer to a nonexisting mapping.
+ * Note: the function returns p4d, pud or pmd either when the entry is marked
+ * large or when the present bit is not set. Otherwise it returns NULL.
  */
 pte_t *lookup_address(unsigned long address, unsigned int *level)
 {
-- 
2.43.0

