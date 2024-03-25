Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89DD6149DE2
	for <linux-coco@lists.linux.dev>; Mon, 25 Mar 2024 10:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711363225; cv=none; b=bhwJuOaTM3VDHqRavgg1xG6OcTFUc+y+Uy0dD0/1TyrqGe/jM0bd8w3XUdfsewFB/UvRzUhKRawT0861XTKsY7p0ApWcWtTDNHJUimzztKU75mhvU7I9eJ2jXQ7cOHdwaEFN5LPK0FCFboIPljKM+9OfsbWVDotXBeYlvoQ7W+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711363225; c=relaxed/simple;
	bh=ACL3RNhnKJDcGNWbnTjXRL1Ph76rTdi3HzpsJi8OSZs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ptsoMRkvSTYZnIjzHO7JMhYdwFEU/NMMiy6xSK6WmbQnc+riJ7giVJIXa6bLzF0C5/dhugOR15dJhny4GmMiSeOptIXJ6FJKq0FHVhodzMNh28CO6AqxzWPqfJf9VUspz6aBSaYzhL5GbFEu72kU0mgAz25KvP86U0kaJHv8XLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.helo=mgamail.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IGy+WQEG; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.helo=mgamail.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IGy+WQEG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711363223; x=1742899223;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ACL3RNhnKJDcGNWbnTjXRL1Ph76rTdi3HzpsJi8OSZs=;
  b=IGy+WQEGxa9Blutpe/sQXxJSaffa7jQc0Exq/m2P6FKadC52vE8eZv7b
   xllN8epKPoatx6IcBwNSSoAQqUKrEcwZM53nrwA/Mp8+324WXBqNVnB5/
   Bu8BmJjfq9myXhKUYmA1DrDGcke8SwV0pcpKCj5SC2V107PNh++uUpmtg
   FTVrqMjNDzWKUUzoRqgV3/xpA/ALdKx0MqT21ldtU33+Ydbn2MWHjNLs8
   6iLmq7pVkngMwsybxwimvlarPAHr9B8F+dGENogL0jlmY302H4+FUjgbU
   xjXt2ROs7BPFFPOBGxsUDOGnKdtvrqxOQVm7EmGOJ5p3KXTCZv0FDwwYt
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11023"; a="6561449"
X-IronPort-AV: E=Sophos;i="6.07,152,1708416000"; 
   d="scan'208";a="6561449"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2024 03:40:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11023"; a="937070169"
X-IronPort-AV: E=Sophos;i="6.07,152,1708416000"; 
   d="scan'208";a="937070169"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 25 Mar 2024 03:40:11 -0700
Received: by black.fi.intel.com (Postfix, from userid 1000)
	id 32B706AF; Mon, 25 Mar 2024 12:40:05 +0200 (EET)
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
Subject: [PATCHv9 07/17] x86/mm: Return correct level from lookup_address() if pte is none
Date: Mon, 25 Mar 2024 12:39:01 +0200
Message-ID: <20240325103911.2651793-8-kirill.shutemov@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240325103911.2651793-1-kirill.shutemov@linux.intel.com>
References: <20240325103911.2651793-1-kirill.shutemov@linux.intel.com>
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
index e5b454036bf3..6c49f69c0368 100644
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
 	if (p4d_leaf(*p4d) || !p4d_present(*p4d))
 		return (pte_t *)p4d;
 
+	*level = PG_LEVEL_1G;
 	pud = pud_offset(p4d, address);
 	if (pud_none(*pud))
 		return NULL;
 
-	*level = PG_LEVEL_1G;
 	if (pud_leaf(*pud) || !pud_present(*pud))
 		return (pte_t *)pud;
 
+	*level = PG_LEVEL_2M;
 	pmd = pmd_offset(pud, address);
 	if (pmd_none(*pmd))
 		return NULL;
 
-	*level = PG_LEVEL_2M;
 	if (pmd_leaf(*pmd) || !pmd_present(*pmd))
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

