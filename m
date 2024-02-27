Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A04D158D8C
	for <linux-coco@lists.linux.dev>; Tue, 27 Feb 2024 21:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709069117; cv=none; b=dDvsA5D1CHviG8C7aounLw8YQ8ZaCmOZvE/vffMPq/bgXlxOV/nqjen6qioRDN3mJgCRFJV9NSPs+wHlkE5fyFovC/f4zs9af5WaqHVfrG4aZYaDHdhnKNarsGlEJckM/iPAjzuFgPb4GQc+vnzao75CDEaqnFFyDtFjf72UF5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709069117; c=relaxed/simple;
	bh=dUEuhxA1AlDC3wetWnBXvKm2CT6y7iSHZ1ZynKz3iIA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XhbcXtaWV1hgPUABnuqFO/LqzCB/Y8KWAGckxq84bqL3x+ZyTVLMgWU5096N5DuLYFrT9g9KsFxJcguzvCIaoc//tEt4JEFVqBHUqDCdA58u0JlMSqzLq+5LcD/ILl9ZQNSUDlqS+8ycsjVYAQlc8sNCfL2pu4OysWE3ArLeDpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.helo=mgamail.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NUqFBl6Q; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.helo=mgamail.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NUqFBl6Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709069116; x=1740605116;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dUEuhxA1AlDC3wetWnBXvKm2CT6y7iSHZ1ZynKz3iIA=;
  b=NUqFBl6QGMhDiP1QiirFWBWWDQOpz5xdsSPz3/4SAlNy+YSjML9l6G74
   Bd2FAq1hPs9DQLn+VT/ikHY3HFakX5e9y0vJyvCpVzcOCCbJSohWJVXmT
   D4gDrOPEihU3ssVtjl9meKMUmtujDbPKl8LO8h/d7VQ9xkPE9GohgCtOy
   ZlGiqm3/hrxdxZaG2SL9YNwMfhg6cSSzsL4CuAbVLDI6QzguLKN91Ynk+
   YtRQqmbfhLrOYhYMB1ewaSZljxJfMjfjhJ1vrcAfcT0COuGOV/8OGFjCS
   p5tQZOvQ3HS5AmhAm5Ft3/qKQlPfSsGyvdDzj/V2FmLvfMKeBBNHmrEq9
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="3567054"
X-IronPort-AV: E=Sophos;i="6.06,188,1705392000"; 
   d="scan'208";a="3567054"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2024 13:25:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="937032924"
X-IronPort-AV: E=Sophos;i="6.06,188,1705392000"; 
   d="scan'208";a="937032924"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 27 Feb 2024 13:25:02 -0800
Received: by black.fi.intel.com (Postfix, from userid 1000)
	id 3CC85781; Tue, 27 Feb 2024 23:24:56 +0200 (EET)
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
	Baoquan He <bhe@redhat.com>,
	kexec@lists.infradead.org,
	linux-coco@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
	Dave Hansen <dave.hansen@intel.com>
Subject: [PATCHv8 07/17] x86/mm: Return correct level from lookup_address() if pte is none
Date: Tue, 27 Feb 2024 23:24:42 +0200
Message-ID: <20240227212452.3228893-8-kirill.shutemov@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240227212452.3228893-1-kirill.shutemov@linux.intel.com>
References: <20240227212452.3228893-1-kirill.shutemov@linux.intel.com>
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
---
 arch/x86/include/asm/pgtable_types.h |  1 +
 arch/x86/mm/pat/set_memory.c         | 16 ++++++++--------
 2 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/arch/x86/include/asm/pgtable_types.h b/arch/x86/include/asm/pgtable_types.h
index 0b748ee16b3d..3f648ffdfbe5 100644
--- a/arch/x86/include/asm/pgtable_types.h
+++ b/arch/x86/include/asm/pgtable_types.h
@@ -548,6 +548,7 @@ enum pg_level {
 	PG_LEVEL_2M,
 	PG_LEVEL_1G,
 	PG_LEVEL_512G,
+	PG_LEVEL_256T,
 	PG_LEVEL_NUM
 };
 
diff --git a/arch/x86/mm/pat/set_memory.c b/arch/x86/mm/pat/set_memory.c
index f92da8c9a86d..0d2267ad4e0e 100644
--- a/arch/x86/mm/pat/set_memory.c
+++ b/arch/x86/mm/pat/set_memory.c
@@ -657,7 +657,8 @@ static inline pgprot_t verify_rwx(pgprot_t old, pgprot_t new, unsigned long star
 
 /*
  * Lookup the page table entry for a virtual address in a specific pgd.
- * Return a pointer to the entry and the level of the mapping.
+ * Return a pointer to the entry (or NULL if the entry does not exist) and
+ * the level of the entry.
  */
 pte_t *lookup_address_in_pgd(pgd_t *pgd, unsigned long address,
 			     unsigned int *level)
@@ -666,32 +667,32 @@ pte_t *lookup_address_in_pgd(pgd_t *pgd, unsigned long address,
 	pud_t *pud;
 	pmd_t *pmd;
 
-	*level = PG_LEVEL_NONE;
+	*level = PG_LEVEL_256T;
 
 	if (pgd_none(*pgd))
 		return NULL;
 
+	*level = PG_LEVEL_512G;
 	p4d = p4d_offset(pgd, address);
 	if (p4d_none(*p4d))
 		return NULL;
 
-	*level = PG_LEVEL_512G;
 	if (p4d_large(*p4d) || !p4d_present(*p4d))
 		return (pte_t *)p4d;
 
+	*level = PG_LEVEL_1G;
 	pud = pud_offset(p4d, address);
 	if (pud_none(*pud))
 		return NULL;
 
-	*level = PG_LEVEL_1G;
 	if (pud_large(*pud) || !pud_present(*pud))
 		return (pte_t *)pud;
 
+	*level = PG_LEVEL_2M;
 	pmd = pmd_offset(pud, address);
 	if (pmd_none(*pmd))
 		return NULL;
 
-	*level = PG_LEVEL_2M;
 	if (pmd_large(*pmd) || !pmd_present(*pmd))
 		return (pte_t *)pmd;
 
@@ -704,9 +705,8 @@ pte_t *lookup_address_in_pgd(pgd_t *pgd, unsigned long address,
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

