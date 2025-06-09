Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4245021FF5B
	for <linux-coco@lists.linux.dev>; Mon,  9 Jun 2025 19:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749496443; cv=none; b=lYyOeWFjXddX1aK4wXaEr9VZwbFlCn/d2mvb11gDvFE+6DKEE2I1zHradBs7NI2+g8JkdcjbbyO/tXOAVTy9GXr654MhlA2ypthGCJ8IilUpZIyxi1h2pQW+mYWL/UBN1IKPWABOm/h5D1AnVfm0ibCMrbZhiZEEBtNvchxSpnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749496443; c=relaxed/simple;
	bh=taDyQQ0hVqoylp1FoASKqcRdTS2NYvm6e9mKOK0s/aw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YK4wozwflBiI3/GndMSjtWY60ndWi+WaEEtqPMuJ/RCq2KydA38FjX901JYLsCemwYOQSiwsRzivX8ipzcyJ7AJh4UlNODmxBZtb8Oqy881hniMfwGeQa5UqePYqCxNd6XZFuBuPPuTXEYsMPQlQQtVx60ZO3WW4CrpL3knpI3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.helo=mgamail.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YAs552Yt; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.helo=mgamail.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YAs552Yt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749496440; x=1781032440;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=taDyQQ0hVqoylp1FoASKqcRdTS2NYvm6e9mKOK0s/aw=;
  b=YAs552YtY6E6LRwixGiuaAmSUjKhR9RbJDrPGI9CVUIvj+n/2x/7+JrC
   X9sGFh3HHi6Q3P0QzLiu+BH2skd7UDQK1g4syeEhXPxNC4k4eepaVZdJy
   JdikDVTwx8qpdBQQrt8aK42R1+oh2A4mLtdWt6KFby5fWshd+q81qioF8
   D5ll2O+tt3/ecueYV/jWeyJeJsvHh0MFfeWGxaD7yhiwdScD+i27ajlkC
   vmTNWlHEFAZqOA4xqvXsyHz0X1hRWF7ZSYa+/qOaf6+PjbFisDvB6nbgJ
   LmgErz5xZdTcc9KjcquMU3s0OYJsbvKLeasO4lp32D91KKxcdPzgE3Srm
   Q==;
X-CSE-ConnectionGUID: pZfPLT9LRbm9YN8bU+zPMg==
X-CSE-MsgGUID: DVt2MKSKTV+gUgybkefyHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="51681784"
X-IronPort-AV: E=Sophos;i="6.16,223,1744095600"; 
   d="scan'208";a="51681784"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2025 12:14:00 -0700
X-CSE-ConnectionGUID: Z+V09sNBSQqiAKkg0FkqZg==
X-CSE-MsgGUID: jHwAvZdhQ9O5TYXQKBTDJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,223,1744095600"; 
   d="scan'208";a="147174191"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa007.jf.intel.com with ESMTP; 09 Jun 2025 12:13:56 -0700
Received: by black.fi.intel.com (Postfix, from userid 1000)
	id 6CD7BA63; Mon, 09 Jun 2025 22:13:49 +0300 (EEST)
From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
To: pbonzini@redhat.com,
	seanjc@google.com,
	dave.hansen@linux.intel.com
Cc: rick.p.edgecombe@intel.com,
	isaku.yamahata@intel.com,
	kai.huang@intel.com,
	yan.y.zhao@intel.com,
	chao.gao@intel.com,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	kvm@vger.kernel.org,
	x86@kernel.org,
	linux-coco@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Subject: [PATCHv2 10/12] [NOT-FOR-UPSTREAM] x86/virt/tdx: Account PAMT memory and print it in /proc/meminfo
Date: Mon,  9 Jun 2025 22:13:38 +0300
Message-ID: <20250609191340.2051741-11-kirill.shutemov@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250609191340.2051741-1-kirill.shutemov@linux.intel.com>
References: <20250609191340.2051741-1-kirill.shutemov@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

PAMT memory can add up to substantial portion of system memory.

Account these pages and print them into /proc/meminfo as TDX.

When no TD running PAMT memory consumption suppose to be zero.

Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>

---

The patch proved to be extremely useful to catch PAMT memory leaks,
but putting this counter in /proc/meminfo is probably overkill.

Any suggestion for better way to expose this counter is welcome.
---
 arch/x86/include/asm/set_memory.h |  3 +++
 arch/x86/include/asm/tdx.h        |  3 +++
 arch/x86/mm/Makefile              |  2 ++
 arch/x86/mm/meminfo.c             | 11 +++++++++++
 arch/x86/mm/pat/set_memory.c      |  2 +-
 arch/x86/virt/vmx/tdx/tdx.c       | 26 ++++++++++++++++++++++++--
 6 files changed, 44 insertions(+), 3 deletions(-)
 create mode 100644 arch/x86/mm/meminfo.c

diff --git a/arch/x86/include/asm/set_memory.h b/arch/x86/include/asm/set_memory.h
index 8d9f1c9aaa4c..66b37bff61e5 100644
--- a/arch/x86/include/asm/set_memory.h
+++ b/arch/x86/include/asm/set_memory.h
@@ -90,6 +90,9 @@ int set_direct_map_default_noflush(struct page *page);
 int set_direct_map_valid_noflush(struct page *page, unsigned nr, bool valid);
 bool kernel_page_present(struct page *page);
 
+struct seq_file;
+void direct_pages_meminfo(struct seq_file *m);
+
 extern int kernel_set_to_readonly;
 
 #endif /* _ASM_X86_SET_MEMORY_H */
diff --git a/arch/x86/include/asm/tdx.h b/arch/x86/include/asm/tdx.h
index 39f8dd7e0f06..853471e1eda1 100644
--- a/arch/x86/include/asm/tdx.h
+++ b/arch/x86/include/asm/tdx.h
@@ -186,6 +186,8 @@ u64 tdh_mem_page_remove(struct tdx_td *td, u64 gpa, u64 level, u64 *ext_err1, u6
 u64 tdh_phymem_cache_wb(bool resume);
 u64 tdh_phymem_page_wbinvd_tdr(struct tdx_td *td);
 u64 tdh_phymem_page_wbinvd_hkid(u64 hkid, struct page *page);
+
+void tdx_meminfo(struct seq_file *m);
 #else
 static inline void tdx_init(void) { }
 static inline int tdx_cpu_enable(void) { return -ENODEV; }
@@ -194,6 +196,7 @@ static inline u32 tdx_get_nr_guest_keyids(void) { return 0; }
 static inline const char *tdx_dump_mce_info(struct mce *m) { return NULL; }
 static inline const struct tdx_sys_info *tdx_get_sysinfo(void) { return NULL; }
 static inline int tdx_nr_pamt_pages(void) { return 0; }
+static inline void tdx_meminfo(struct seq_file *m) {}
 #endif	/* CONFIG_INTEL_TDX_HOST */
 
 #endif /* !__ASSEMBLER__ */
diff --git a/arch/x86/mm/Makefile b/arch/x86/mm/Makefile
index 32035d5be5a0..311d60801871 100644
--- a/arch/x86/mm/Makefile
+++ b/arch/x86/mm/Makefile
@@ -38,6 +38,8 @@ CFLAGS_fault.o := -I $(src)/../include/asm/trace
 
 obj-$(CONFIG_X86_32)		+= pgtable_32.o iomap_32.o
 
+obj-$(CONFIG_PROC_FS)		+= meminfo.o
+
 obj-$(CONFIG_HUGETLB_PAGE)	+= hugetlbpage.o
 obj-$(CONFIG_PTDUMP)		+= dump_pagetables.o
 obj-$(CONFIG_PTDUMP_DEBUGFS)	+= debug_pagetables.o
diff --git a/arch/x86/mm/meminfo.c b/arch/x86/mm/meminfo.c
new file mode 100644
index 000000000000..7bdb5df014de
--- /dev/null
+++ b/arch/x86/mm/meminfo.c
@@ -0,0 +1,11 @@
+#include <linux/proc_fs.h>
+#include <linux/seq_file.h>
+
+#include <asm/set_memory.h>
+#include <asm/tdx.h>
+
+void arch_report_meminfo(struct seq_file *m)
+{
+	direct_pages_meminfo(m);
+	tdx_meminfo(m);
+}
diff --git a/arch/x86/mm/pat/set_memory.c b/arch/x86/mm/pat/set_memory.c
index def3d9284254..59432b92e80e 100644
--- a/arch/x86/mm/pat/set_memory.c
+++ b/arch/x86/mm/pat/set_memory.c
@@ -118,7 +118,7 @@ static void collapse_page_count(int level)
 	direct_pages_count[level - 1] -= PTRS_PER_PTE;
 }
 
-void arch_report_meminfo(struct seq_file *m)
+void direct_pages_meminfo(struct seq_file *m)
 {
 	seq_printf(m, "DirectMap4k:    %8lu kB\n",
 			direct_pages_count[PG_LEVEL_4K] << 2);
diff --git a/arch/x86/virt/vmx/tdx/tdx.c b/arch/x86/virt/vmx/tdx/tdx.c
index d4b50b6428fa..4dcba7bf4ab9 100644
--- a/arch/x86/virt/vmx/tdx/tdx.c
+++ b/arch/x86/virt/vmx/tdx/tdx.c
@@ -51,6 +51,8 @@ static DEFINE_PER_CPU(bool, tdx_lp_initialized);
 
 static struct tdmr_info_list tdx_tdmr_list;
 
+static atomic_long_t tdx_pamt_count = ATOMIC_LONG_INIT(0);
+
 static atomic_t *pamt_refcounts;
 
 static enum tdx_module_status_t tdx_module_status;
@@ -2010,6 +2012,19 @@ int tdx_nr_pamt_pages(void)
 }
 EXPORT_SYMBOL_GPL(tdx_nr_pamt_pages);
 
+void tdx_meminfo(struct seq_file *m)
+{
+	unsigned long usage;
+
+	if (!cpu_feature_enabled(X86_FEATURE_TDX_HOST_PLATFORM))
+		return;
+
+	usage = atomic_long_read(&tdx_pamt_count) *
+		tdx_nr_pamt_pages() * PAGE_SIZE / SZ_1K;
+
+	seq_printf(m, "TDX:		%8lu kB\n", usage);
+}
+
 static u64 tdh_phymem_pamt_add(unsigned long hpa,
 			       struct list_head *pamt_pages)
 {
@@ -2017,7 +2032,7 @@ static u64 tdh_phymem_pamt_add(unsigned long hpa,
 		.rcx = hpa,
 	};
 	struct page *page;
-	u64 *p;
+	u64 *p, ret;
 
 	WARN_ON_ONCE(!IS_ALIGNED(hpa & PAGE_MASK, PMD_SIZE));
 
@@ -2027,7 +2042,12 @@ static u64 tdh_phymem_pamt_add(unsigned long hpa,
 		p++;
 	}
 
-	return seamcall(TDH_PHYMEM_PAMT_ADD, &args);
+	ret = seamcall(TDH_PHYMEM_PAMT_ADD, &args);
+
+	if (!ret)
+		atomic_long_inc(&tdx_pamt_count);
+
+	return ret;
 }
 
 static u64 tdh_phymem_pamt_remove(unsigned long hpa,
@@ -2045,6 +2065,8 @@ static u64 tdh_phymem_pamt_remove(unsigned long hpa,
 	if (ret)
 		return ret;
 
+	atomic_long_dec(&tdx_pamt_count);
+
 	p = &args.rdx;
 	for (int i = 0; i < tdx_nr_pamt_pages(); i++) {
 		page = phys_to_page(*p);
-- 
2.47.2

