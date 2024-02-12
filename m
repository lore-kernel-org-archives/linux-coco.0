Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 659B03B780
	for <linux-coco@lists.linux.dev>; Mon, 12 Feb 2024 10:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707734711; cv=none; b=EShZGZZxhxi/X+TB4gpRs/KSYsEdoI2B7MqAmCc4inM9ZyqQCiubuHbnlnnehXMEnRc5v6isj6kswoNeVp8VOTMhgd9eDPw3vc9n7NurImxsxYgZ+b2o31uIk9c7TiqPt0tZAlxUO2c6Tc7wWFD6y8lQXriJKmYPrEhe5a6h5so=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707734711; c=relaxed/simple;
	bh=ttorKfrAsCfwHjNDg0dNsgpEDrTBddN8JkJtVUzul2k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HbJKZFNjYqGa4bno89U6OIgKkULtC63cKm1/vaqk6sNSgviLLQUM7BZB7LELc8nEUJIZqu4U82TPJvvf4zsQWsM0QIaUzeK2Fcc6YLm71l7Ej30kykCokWg1E6W4EehAHE0yvDMgGJKMM6mWuTOIoB8QxJstFtD92RZNe48h+is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.helo=mgamail.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ix5Xmm4Z; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.helo=mgamail.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ix5Xmm4Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707734708; x=1739270708;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ttorKfrAsCfwHjNDg0dNsgpEDrTBddN8JkJtVUzul2k=;
  b=Ix5Xmm4Z1RnjsKSSRt+AucoTGXJG5lt0vBGP+n4cJtRkmr5iDXabssr3
   cN0r4KzqVtMPfnzZDRNQWGkw4mOmSBZw1i/dC7vX7P9VFB1I6oeKtVRty
   cXYV/BsRXFbx1H/z0W3xEXACK25srnEDZrhN6QicSYXPpd605N3d3U9eh
   LMM7r4VJGVvcoCMzVzs6GdARmLGGKLO/RHhQQyNM8baZYWUQ9jrE3Fq1X
   oO0WjeUU4uKns6W7i9YxI371lsXtkRMOwJ0wlCEu3Tk2L/f2NNl59l+4/
   vt25TVEEKFbsSdqfF9Cshhkrvy4JcUyhzaRLjb7Cc+Av8o1DCEXdpvjha
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10981"; a="1585064"
X-IronPort-AV: E=Sophos;i="6.05,263,1701158400"; 
   d="scan'208";a="1585064"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2024 02:45:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10981"; a="935035601"
X-IronPort-AV: E=Sophos;i="6.05,262,1701158400"; 
   d="scan'208";a="935035601"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 12 Feb 2024 02:45:00 -0800
Received: by black.fi.intel.com (Postfix, from userid 1000)
	id 54901541; Mon, 12 Feb 2024 12:44:53 +0200 (EET)
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
Subject: [PATCHv7 08/16] x86/tdx: Account shared memory
Date: Mon, 12 Feb 2024 12:44:40 +0200
Message-ID: <20240212104448.2589568-9-kirill.shutemov@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240212104448.2589568-1-kirill.shutemov@linux.intel.com>
References: <20240212104448.2589568-1-kirill.shutemov@linux.intel.com>
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
index 26fa47db5782..fd212c9bad89 100644
--- a/arch/x86/coco/tdx/tdx.c
+++ b/arch/x86/coco/tdx/tdx.c
@@ -5,6 +5,7 @@
 #define pr_fmt(fmt)     "tdx: " fmt
 
 #include <linux/cpufeature.h>
+#include <linux/debugfs.h>
 #include <linux/export.h>
 #include <linux/io.h>
 #include <asm/coco.h>
@@ -38,6 +39,13 @@
 
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
@@ -821,6 +829,11 @@ static int tdx_enc_status_change_finish(unsigned long vaddr, int numpages,
 	if (!enc && !tdx_enc_status_changed(vaddr, numpages, enc))
 		return -EIO;
 
+	if (enc)
+		atomic_long_sub(numpages, &nr_shared);
+	else
+		atomic_long_add(numpages, &nr_shared);
+
 	return 0;
 }
 
@@ -896,3 +909,59 @@ void __init tdx_early_init(void)
 
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
+	seq_printf(m, "Number of shared pages in kernel page tables:  %16lu\n",
+		   found);
+	seq_printf(m, "Number of pages accounted as shared:           %16ld\n",
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
+	debugfs_create_file("tdx_shared_memory", 0400, arch_debugfs_dir,
+			    NULL, &tdx_shared_memory_fops);
+	return 0;
+}
+fs_initcall(debug_tdx_shared_memory);
+#endif
-- 
2.43.0

