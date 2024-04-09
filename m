Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1015C12FB1B
	for <linux-coco@lists.linux.dev>; Tue,  9 Apr 2024 11:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712662237; cv=none; b=CfxphoFt5y3ZxJgz+a0UkTNVBl8yAJwhsayJVO2R/Wlu066FLwuomOWDx3x1pNfLJrUILpK74yoEAoLlZqjNBwxCpGjnJpcPkke5xZ6y8NSHogL/hFXCGHZILgRMSadgwAi4QM5pCEtAVYiQB0Z1YyMASFPOW/zJnfaEl9uSClY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712662237; c=relaxed/simple;
	bh=GSg67xlVUPvLYDL37C9OUEs7HbwzTLSXgJBxYPbO+3w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JKmMXlTHQt5Mjznv1E50yB7oyeHm3Bs+buDYdFKInDmNoYTSFa7Nj5bfr4JOn+qryEhtKo5XMAwvaQX8pY/JgXGaOA8GCb/0BLGkQUxwmcpj2Now3B2RdYWHR62L82lWEun72HrLkf7ccqy6L8Jxib/FvTyVQfIWBZYR+zDI04w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.helo=mgamail.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YlLQd3Dx; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.helo=mgamail.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YlLQd3Dx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712662237; x=1744198237;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=GSg67xlVUPvLYDL37C9OUEs7HbwzTLSXgJBxYPbO+3w=;
  b=YlLQd3DxGol1PPmcv8ykTK4MEr2VaM820goari4VxNbdlHpVRCaWJUE+
   E8ZdlUlOPYn6uZtnGX7jsFfjyUda4yoR8UJ44WsgbTXHzhJTU0fgteZXp
   MsN1MZLCwGroKCSZWYwXLgywTr5SXCvVRo/YBSdxyDPrYHTNXCQ5+mAhF
   NKg9P3unLtiXz1czzkbtXFmaWSDx1OAUOO3vvjMi6Xz8axGms//XHkfM+
   5V4uFugLP+w900H/bRCOKnCMW9Qrzcqu9zkEAr8Uj+kZfhb2VowRbt1oj
   eRH8NaVieWOzFBx8KCIBR25Q28qzbFudZJp08EcMTTmgFiT99b3+p4li0
   Q==;
X-CSE-ConnectionGUID: poMjapbTRJCheMg/TpNYvQ==
X-CSE-MsgGUID: 1LiW/tgHRuCPqMNntQdxVA==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="30460480"
X-IronPort-AV: E=Sophos;i="6.07,189,1708416000"; 
   d="scan'208";a="30460480"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2024 04:30:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="937093353"
X-IronPort-AV: E=Sophos;i="6.07,189,1708416000"; 
   d="scan'208";a="937093353"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 09 Apr 2024 04:30:28 -0700
Received: by black.fi.intel.com (Postfix, from userid 1000)
	id 43614F46; Tue,  9 Apr 2024 14:30:18 +0300 (EEST)
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
	Tao Liu <ltao@redhat.com>
Subject: [PATCHv10 16/18] x86/mm: Introduce kernel_ident_mapping_free()
Date: Tue,  9 Apr 2024 14:30:08 +0300
Message-ID: <20240409113010.465412-17-kirill.shutemov@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240409113010.465412-1-kirill.shutemov@linux.intel.com>
References: <20240409113010.465412-1-kirill.shutemov@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The helper complements kernel_ident_mapping_init(): it frees the
identity mapping that was previously allocated. It will be used in the
error path to free a partially allocated mapping or if the mapping is no
longer needed.

The caller provides a struct x86_mapping_info with the free_pgd_page()
callback hooked up and the pgd_t to free.

Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
Acked-by: Kai Huang <kai.huang@intel.com>
Tested-by: Tao Liu <ltao@redhat.com>
---
 arch/x86/include/asm/init.h |  3 ++
 arch/x86/mm/ident_map.c     | 73 +++++++++++++++++++++++++++++++++++++
 2 files changed, 76 insertions(+)

diff --git a/arch/x86/include/asm/init.h b/arch/x86/include/asm/init.h
index cc9ccf61b6bd..14d72727d7ee 100644
--- a/arch/x86/include/asm/init.h
+++ b/arch/x86/include/asm/init.h
@@ -6,6 +6,7 @@
 
 struct x86_mapping_info {
 	void *(*alloc_pgt_page)(void *); /* allocate buf for page table */
+	void (*free_pgt_page)(void *, void *); /* free buf for page table */
 	void *context;			 /* context for alloc_pgt_page */
 	unsigned long page_flag;	 /* page flag for PMD or PUD entry */
 	unsigned long offset;		 /* ident mapping offset */
@@ -16,4 +17,6 @@ struct x86_mapping_info {
 int kernel_ident_mapping_init(struct x86_mapping_info *info, pgd_t *pgd_page,
 				unsigned long pstart, unsigned long pend);
 
+void kernel_ident_mapping_free(struct x86_mapping_info *info, pgd_t *pgd);
+
 #endif /* _ASM_X86_INIT_H */
diff --git a/arch/x86/mm/ident_map.c b/arch/x86/mm/ident_map.c
index 968d7005f4a7..3996af7b4abf 100644
--- a/arch/x86/mm/ident_map.c
+++ b/arch/x86/mm/ident_map.c
@@ -4,6 +4,79 @@
  * included by both the compressed kernel and the regular kernel.
  */
 
+static void free_pte(struct x86_mapping_info *info, pmd_t *pmd)
+{
+	pte_t *pte = pte_offset_kernel(pmd, 0);
+
+	info->free_pgt_page(pte, info->context);
+}
+
+static void free_pmd(struct x86_mapping_info *info, pud_t *pud)
+{
+	pmd_t *pmd = pmd_offset(pud, 0);
+	int i;
+
+	for (i = 0; i < PTRS_PER_PMD; i++) {
+		if (!pmd_present(pmd[i]))
+			continue;
+
+		if (pmd_leaf(pmd[i]))
+			continue;
+
+		free_pte(info, &pmd[i]);
+	}
+
+	info->free_pgt_page(pmd, info->context);
+}
+
+static void free_pud(struct x86_mapping_info *info, p4d_t *p4d)
+{
+	pud_t *pud = pud_offset(p4d, 0);
+	int i;
+
+	for (i = 0; i < PTRS_PER_PUD; i++) {
+		if (!pud_present(pud[i]))
+			continue;
+
+		if (pud_leaf(pud[i]))
+			continue;
+
+		free_pmd(info, &pud[i]);
+	}
+
+	info->free_pgt_page(pud, info->context);
+}
+
+static void free_p4d(struct x86_mapping_info *info, pgd_t *pgd)
+{
+	p4d_t *p4d = p4d_offset(pgd, 0);
+	int i;
+
+	for (i = 0; i < PTRS_PER_P4D; i++) {
+		if (!p4d_present(p4d[i]))
+			continue;
+
+		free_pud(info, &p4d[i]);
+	}
+
+	if (pgtable_l5_enabled())
+		info->free_pgt_page(pgd, info->context);
+}
+
+void kernel_ident_mapping_free(struct x86_mapping_info *info, pgd_t *pgd)
+{
+	int i;
+
+	for (i = 0; i < PTRS_PER_PGD; i++) {
+		if (!pgd_present(pgd[i]))
+			continue;
+
+		free_p4d(info, &pgd[i]);
+	}
+
+	info->free_pgt_page(pgd, info->context);
+}
+
 static void ident_pmd_init(struct x86_mapping_info *info, pmd_t *pmd_page,
 			   unsigned long addr, unsigned long end)
 {
-- 
2.43.0

