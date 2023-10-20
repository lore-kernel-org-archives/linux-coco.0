Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 975821DA49
	for <linux-coco@lists.linux.dev>; Fri, 20 Oct 2023 15:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IkzpBCO6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697814784; x=1729350784;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FQt/ElawTffVXHEXsjLO8M8ZAD2Dp5CO9gICUmaNuMQ=;
  b=IkzpBCO6NxmkR/HkTa11reCMXHU88hcoT5J8nzgk77Ll400lSinmvBi5
   SqcPqSr/LOwu4zCEmQTUjeexoDWoBpx9HrQnjME8KT40DII8T/7GqmxMn
   fUawq7fw1gwWruuPj5p4igflqYu7GpnqZIMH9qX8LDpyjKGG64oLSYYD0
   wSbpL9/znSDcZz1BttLCzpcmnMZ+jn98Ra4Cy51irr8WiPLKDdE00qler
   X8E2BrKIRKVamzNh3oDu/lgP57lBCRYxwKBB1+qJ4J9rDHO6kOLKDLhjj
   jQYI/AlutR5yn2M3GK3fwAC6bK5xNpnWwNJY/WCD8W1+cdc4c2zMat9UE
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="376893697"
X-IronPort-AV: E=Sophos;i="6.03,239,1694761200"; 
   d="scan'208";a="376893697"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2023 08:13:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="761080289"
X-IronPort-AV: E=Sophos;i="6.03,239,1694761200"; 
   d="scan'208";a="761080289"
Received: from dgutows1-mobl.ger.corp.intel.com (HELO box.shutemov.name) ([10.249.39.237])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2023 08:12:56 -0700
Received: by box.shutemov.name (Postfix, from userid 1000)
	id 3BB5B10A29A; Fri, 20 Oct 2023 18:12:45 +0300 (+03)
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
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Subject: [PATCHv2 08/13] x86/tdx: Account shared memory
Date: Fri, 20 Oct 2023 18:12:37 +0300
Message-ID: <20231020151242.1814-9-kirill.shutemov@linux.intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231020151242.1814-1-kirill.shutemov@linux.intel.com>
References: <20231020151242.1814-1-kirill.shutemov@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The kernel will convert all shared memory back to private during kexec.
The direct mapping page tables will provide information on which memory
is shared.

It is extremely important to convert all shared memory. If a page is
missed, it will cause the second kernel to crash when it accesses it.

Keep track of the number of shared pages. This will allow for
cross-checking against the shared information in the direct mapping and
reporting if the shared bit is lost.

Include a debugfs interface that allows for the check to be performed at
any point.

Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
---
 arch/x86/coco/tdx/tdx.c | 69 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/arch/x86/coco/tdx/tdx.c b/arch/x86/coco/tdx/tdx.c
index 8897d3cc8a15..587bdeb88afa 100644
--- a/arch/x86/coco/tdx/tdx.c
+++ b/arch/x86/coco/tdx/tdx.c
@@ -5,6 +5,7 @@
 #define pr_fmt(fmt)     "tdx: " fmt
 
 #include <linux/cpufeature.h>
+#include <linux/debugfs.h>
 #include <linux/export.h>
 #include <linux/io.h>
 #include <asm/coco.h>
@@ -37,6 +38,13 @@
 
 #define TDREPORT_SUBTYPE_0	0
 
+static atomic_long_t nr_shared;
+
+static inline bool pte_decrypted(pte_t pte)
+{
+	return cc_mkdec(pte_val(pte)) == pte_val(pte);
+}
+
 /* Called from __tdx_hypercall() for unrecoverable failure */
 noinstr void __noreturn __tdx_hypercall_failed(void)
 {
@@ -799,6 +807,11 @@ static int tdx_enc_status_change_finish(unsigned long vaddr, int numpages,
 	if (!enc && !tdx_enc_status_changed(vaddr, numpages, enc))
 		return -EIO;
 
+	if (enc)
+		atomic_long_sub(numpages, &nr_shared);
+	else
+		atomic_long_add(numpages, &nr_shared);
+
 	return 0;
 }
 
@@ -874,3 +887,59 @@ void __init tdx_early_init(void)
 
 	pr_info("Guest detected\n");
 }
+
+#ifdef CONFIG_DEBUG_FS
+static int tdx_shared_memory_show(struct seq_file *m, void *p)
+{
+	unsigned long addr, end;
+	unsigned long found = 0;
+
+	addr = PAGE_OFFSET;
+	end  = PAGE_OFFSET + get_max_mapped();
+
+	while (addr < end) {
+		unsigned long size;
+		unsigned int level;
+		pte_t *pte;
+
+		pte = lookup_address(addr, &level);
+		size = page_level_size(level);
+
+		if (pte && pte_decrypted(*pte))
+			found += size / PAGE_SIZE;
+
+		addr += size;
+
+		cond_resched();
+	}
+
+	seq_printf(m, "Number of unshared pages in kernel page tables:  %16lu\n",
+		   found);
+	seq_printf(m, "Number of pages accounted as unshared:           %16ld\n",
+		   atomic_long_read(&nr_shared));
+	return 0;
+}
+
+static int tdx_shared_memory_open(struct inode *inode, struct file *file)
+{
+	return single_open(file, tdx_shared_memory_show, NULL);
+}
+
+static const struct file_operations tdx_shared_memory_fops = {
+	.open           = tdx_shared_memory_open,
+	.read           = seq_read,
+	.llseek         = seq_lseek,
+	.release        = single_release,
+};
+
+static __init int debug_tdx_shared_memory(void)
+{
+	if (!cpu_feature_enabled(X86_FEATURE_TDX_GUEST))
+		return 0;
+
+	debugfs_create_file("tdx_shared_memory", S_IRUSR, arch_debugfs_dir,
+			    NULL, &tdx_shared_memory_fops);
+	return 0;
+}
+fs_initcall(debug_tdx_shared_memory);
+#endif
-- 
2.41.0

