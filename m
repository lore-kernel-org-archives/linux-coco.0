Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3FD9309F1D
	for <linux-coco@lists.linux.dev>; Sat, 11 Apr 2026 22:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775947463; cv=none; b=E6xIBmboFlgktXuAoid8/KJ6YFhWCqFLtfGUSBDMznyZ3YPHl04Kfks60rtWFtHpP8zUHOMrc9DWHRf5MviURs8HWV8dzeHPCIhVyr1SoGAYFoayTe45NCBR4we+d3EphM1g2OhZzpHOOPyfWG+p8Ra8glNFlS/eGSE/f1y8SNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775947463; c=relaxed/simple;
	bh=UtlUU8Fi5Is3Qu3V3vltYkE9KJwA3e3KogM751fdf1Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fqzvN6soWGxA/eoo3SarkbANltrsGVMSjz/c8MPjabp34tpWvOIzOZOrElpfTYHxqZxQwa6ihvdhP8JWQ3cE9LKUBWpJM/k66RtybwYUYcUrJBwrxfdBQa9aGxE6O2bslfaajRMXsnoWvNfrgVVYxHfahqksYRM5oOPHXFnFmYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nCZyDeZT; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nCZyDeZT"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-48374014a77so44902835e9.3
        for <linux-coco@lists.linux.dev>; Sat, 11 Apr 2026 15:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775947460; x=1776552260; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3Jmm5Ymsda8i8WZ0iSLh/8W4gMwGSV0Qd7yCqvS/JSA=;
        b=nCZyDeZTqMYEkpvpXPN149qX7Pv50ZXg45l9eTaPGVd2rf5rHtfZzB1k2sPRIDsr2i
         Jyw660IBaRnPOz+1C9Cdsu1BKg9Sy8jfdr8SHM7xkf+CQcK0sOqULC/RyR/W2YCE6A6Q
         SRG+rdI0LaZuQoOE2bWHknb2tlkc+O35bo9gr7AaM6NKxnLObMdIUcukLpTJykhg+nMk
         of2Sthleax08X96aL6jSVITLwNNSo5xCCZ1DFl7j/rBDVWYbHN7cSiWvpsEYS4TH4UX2
         VnF+csUg6xDRbE3j34vnkAp+P38pkfECOuJlCK4ivV4JLfCSitwXQsEnoCbjcJ+ZamP+
         y68w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775947460; x=1776552260;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3Jmm5Ymsda8i8WZ0iSLh/8W4gMwGSV0Qd7yCqvS/JSA=;
        b=mQadhRva3cSeGj7cTDWIJ0pfSbR4Gy8hEe77Xxa0KdLZhPowG0q0osAzX+/scPLb9U
         8aEusyp6yI09kllA6NCYNrOif3QuZ9hc/pj6dzRJHhZt285KD/sHzVV9mA+lGz00Qwar
         N6T7SiWwoHcUnlRHLFzyckNJtRdtEVEbt62LxIzAJQygvpgICQqYaYuhgBZX7oxti5u7
         THc98WDbyt+fFfF5idV1ZMmzG00c8qDzqpfpAzbPYgvW8e9phNgg8jY93uTIe+E0+UrX
         gsgqYDyK/uS60dTJ7/zihprGulAV5WbyX4gFV1L5M0bvz3imtJyz4OdAfzDgU122lW4S
         4BMQ==
X-Forwarded-Encrypted: i=1; AJvYcCWzKwi+GPqqPt9ZJNU75EXZSIF85r7z/pttJHBFAj4DORSubH6j5wiD6wUbyJWJuMwdUNhb0Rep4IYy@lists.linux.dev
X-Gm-Message-State: AOJu0YwqplXJVFdOwwhbinaEwzFUOSx6K5rR7trEuxnPAfJ3glVtm4d3
	0xiWFaqpVFrb6+PhGBNmeKNlD7qHNWqeOM2mdOHXCpV67OWPDU4m81PK
X-Gm-Gg: AeBDieujteNrfzNlrKsRgvvU5yAoN+PXnju8gFuTgRSBGIxYtaYnszO0HtkGHS4Rijj
	jEbCmBqZ0LiMYwG/jWntMqY+eg0MiMMmqDZPr9kDLzs4k62A2b98PZcl6TuUkf8oxXuEPGMi5Aw
	D3RRzd0QiHRv7iGVtQaWNTmkR/t5Yr1JwypUl8aIpSbXMboqk/ePXUBN8+TcSX8JusIdmxwsVjy
	PCUs+ieKOXVJhAzWKLhBNB6UD1xcBIvuSNwwOdvriMFk1JAWDtUvBnQBf39CfQ/4MsVBFcOWLCz
	ymJtdSeqSkKI403X7a5VOG8TZWfdjGq2bjO219aalvq5loTvTsP7HSFecHrLG2oEBlhib1sgkVl
	+/U671Uv3saSTjXj8oR+ofRL51UJ7ac7PD1KnioZmqQkTc4Lgb/4UcGvWyywD6ZIWoQjiQeIEGu
	tVre2xn4MALwpKiJNT7VOXv7+NEIU22jCCPx9a6IQ3JR+1S7GT+AAy9kRStmVzcoqVYZTSpx7Hg
	IvlI3ydoLHVAVLqaWDh7J0G+DLb8XS7j1bAHmf5KrTSOWw0+OXt1djOEqKduqd2/Rxz4f8aLool
	8FNGXBEo+Ztf5/r2DuV3EsZsZO/SaBBsamI8C0R4mM6aNtnb8W3kJZtOGYf26igIzDFRz6I=
X-Received: by 2002:a05:600c:c0da:b0:488:b187:d898 with SMTP id 5b1f17b1804b1-488d685b6e8mr96824865e9.14.1775947459934;
        Sat, 11 Apr 2026 15:44:19 -0700 (PDT)
Received: from dev-container.europe-west9-a.c.privasys-development.internal (65.170.155.34.bc.googleusercontent.com. [34.155.170.65])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d532ef00sm198117115e9.5.2026.04.11.15.44.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 15:44:19 -0700 (PDT)
From: bfoing <bertrand.foing@gmail.com>
X-Google-Original-From: bfoing <40759640+bfoing@users.noreply.github.com>
To: linux-acpi@vger.kernel.org
Cc: rafael@kernel.org,
	lenb@kernel.org,
	robert.moore@intel.com,
	kirill.shutemov@linux.intel.com,
	thomas.lendacky@amd.com,
	linux-coco@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Bertrand Foing <40759640+bfoing@users.noreply.github.com>
Subject: [PATCH] ACPI: block AML access to confidential VM private memory
Date: Sat, 11 Apr 2026 22:44:12 +0000
Message-ID: <20260411224412.2236817-1-40759640+bfoing@users.noreply.github.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bertrand Foing <40759640+bfoing@users.noreply.github.com>

Add a guard in the ACPICA SystemMemory space handler that prevents AML
bytecode from reading or writing pages belonging to the confidential VM
private address range.

On TDX and SEV-SNP guests the ACPI tables are under host/VMM control.
Malicious AML ("BadAML") can issue SystemMemory region reads and writes
to arbitrary guest physical addresses, extracting secrets or corrupting
guest state without triggering any existing kernel protection.

The guard walks the kernel page tables for the target virtual address
and checks whether the page-table entry carries the platform-specific
is private the access is denied with AE_AML_ILLEGAL_ADDRESS.

Signed-off-by: Bertrand Foing <40759640+bfoing@users.noreply.github.com>
---
 drivers/acpi/Makefile          |   1 +
 drivers/acpi/acpica/exregion.c |  12 ++++
 drivers/acpi/cvm_guard.c       | 121 +++++++++++++++++++++++++++++++++
 3 files changed, 134 insertions(+)
 create mode 100644 drivers/acpi/cvm_guard.c

diff --git a/drivers/acpi/Makefile b/drivers/acpi/Makefile
index d1b0affb8..6743ece85 100644
--- a/drivers/acpi/Makefile
+++ b/drivers/acpi/Makefile
@@ -45,6 +45,7 @@ acpi-y				+= resource.o
 acpi-y				+= acpi_processor.o
 acpi-y				+= processor_core.o
 acpi-$(CONFIG_ARCH_MIGHT_HAVE_ACPI_PDC) += processor_pdc.o
+acpi-$(CONFIG_ARCH_HAS_CC_PLATFORM)	+= cvm_guard.o
 acpi-$(CONFIG_ACPI_EC)		+= ec.o
 acpi-$(CONFIG_ACPI_DOCK)	+= dock.o
 acpi-$(CONFIG_PCI)		+= pci_root.o pci_link.o pci_irq.o
diff --git a/drivers/acpi/acpica/exregion.c b/drivers/acpi/acpica/exregion.c
index a390a1c2b..f12cacff3 100644
--- a/drivers/acpi/acpica/exregion.c
+++ b/drivers/acpi/acpica/exregion.c
@@ -14,6 +14,12 @@
 #define _COMPONENT          ACPI_EXECUTER
 ACPI_MODULE_NAME("exregion")
 
+#ifdef CONFIG_ARCH_HAS_CC_PLATFORM
+bool acpi_cvm_guard_deny_access(unsigned long virt_addr);
+#else
+static inline bool acpi_cvm_guard_deny_access(unsigned long v) { return false; }
+#endif
+
 /*******************************************************************************
  *
  * FUNCTION:    acpi_ex_system_memory_space_handler
@@ -176,6 +182,12 @@ acpi_ex_system_memory_space_handler(u32 function,
 	logical_addr_ptr = mm->logical_address +
 		((u64) address - (u64) mm->physical_address);
 
+#ifdef CONFIG_ARCH_HAS_CC_PLATFORM
+	if (acpi_cvm_guard_deny_access((unsigned long)logical_addr_ptr)) {
+		return_ACPI_STATUS(AE_AML_ILLEGAL_ADDRESS);
+	}
+#endif
+
 	ACPI_DEBUG_PRINT((ACPI_DB_INFO,
 			  "System-Memory (width %u) R/W %u Address=%8.8X%8.8X\n",
 			  bit_width, function, ACPI_FORMAT_UINT64(address)));
diff --git a/drivers/acpi/cvm_guard.c b/drivers/acpi/cvm_guard.c
new file mode 100644
index 000000000..0524bf902
--- /dev/null
+++ b/drivers/acpi/cvm_guard.c
@@ -0,0 +1,121 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * CVM Guard - Block AML access to confidential VM private memory
+ *
+ * Copyright (C) 2026 Privasys
+ *
+ * On TDX and SEV-SNP guests the host VMM controls ACPI tables, so
+ * AML bytecode executing SystemMemory reads and writes can target
+ * arbitrary guest physical addresses.  This file provides a guard
+ * function called from the ACPICA SystemMemory space handler that
+ * checks whether the target virtual address maps to a page marked
+ * as encrypted (private) in the page tables, and denies the access
+ * if so.
+ *
+ * Reference: "BadAML: Exploiting AML in Confidential Virtual Machines"
+ *            Takekoshi et al., ACM CCS 2025
+ */
+
+#include <linux/cc_platform.h>
+#include <linux/mm.h>
+#include <linux/printk.h>
+#include <asm/coco.h>
+
+/* Prototype to satisfy -Wmissing-prototypes; declared here rather than in
+ * internal.h because this file does not need the full ACPI driver headers.
+ */
+bool acpi_cvm_guard_deny_access(unsigned long virt_addr);
+
+/*
+ * Walk the four-level kernel page tables for @addr and return the raw
+ * PTE/PMD/PUD value.  Returns 0 if the walk fails at any level.
+ * Handles 1 GB (PUD) and 2 MB (PMD) large pages.
+ */
+static unsigned long cvm_guard_pte_val(unsigned long addr)
+{
+	pgd_t *pgd;
+	p4d_t *p4d;
+	pud_t *pud;
+	pmd_t *pmd;
+	pte_t *pte;
+
+	pgd = pgd_offset_k(addr);
+	if (pgd_none(*pgd))
+		return 0;
+
+	p4d = p4d_offset(pgd, addr);
+	if (p4d_none(*p4d))
+		return 0;
+
+	pud = pud_offset(p4d, addr);
+	if (pud_none(*pud))
+		return 0;
+	if (pud_leaf(*pud))
+		return pud_val(*pud);
+
+	pmd = pmd_offset(pud, addr);
+	if (pmd_none(*pmd))
+		return 0;
+	if (pmd_leaf(*pmd))
+		return pmd_val(*pmd);
+
+	pte = pte_offset_kernel(pmd, addr);
+	if (pte_none(*pte))
+		return 0;
+
+	return pte_val(*pte);
+}
+
+/*
+ * Check whether @addr maps to a private (encrypted) page.
+ *
+ * cc_mkenc() applies the platform-specific encryption mask:
+ *   AMD SEV/SEV-SNP: sets the C-bit
+ *   Intel TDX:       clears the shared bit
+ *
+ * If the PTE already matches its encrypted form, the page is private
+ * and must not be accessible to AML.  If the walk fails (returns 0)
+ * we deny access - fail-closed is the safe default.
+ */
+static bool cvm_guard_page_is_private(unsigned long addr)
+{
+	unsigned long val;
+
+	val = cvm_guard_pte_val(addr);
+	if (!val) {
+		pr_warn_ratelimited("CVM guard: page table walk failed for %lx\n",
+				    addr);
+		return true;
+	}
+
+	return val == cc_mkenc(val);
+}
+
+/**
+ * acpi_cvm_guard_deny_access - block AML access to CVM private pages
+ * @virt_addr: kernel virtual address resolved by the SystemMemory handler
+ *
+ * Called from acpi_ex_system_memory_space_handler() after the virtual
+ * address has been computed but before any read or write.
+ *
+ * On non-CVM systems (CC_ATTR_MEM_ENCRYPT not set) this returns false.
+ *
+ * Return: true if the access must be denied, false if allowed.
+ */
+bool acpi_cvm_guard_deny_access(unsigned long virt_addr)
+{
+	if (!cc_platform_has(CC_ATTR_MEM_ENCRYPT))
+		return false;
+
+	pr_info_once("CVM guard: active, AML access to private pages will be denied\n");
+
+	virt_addr &= PAGE_MASK;
+
+	if (cvm_guard_page_is_private(virt_addr)) {
+		pr_warn_ratelimited("CVM guard: denied AML access to private page at %lx\n",
+				    virt_addr);
+		return true;
+	}
+
+	return false;
+}
-- 
2.43.0

