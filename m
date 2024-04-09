Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A91812A171
	for <linux-coco@lists.linux.dev>; Tue,  9 Apr 2024 11:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712662231; cv=none; b=UDSoRXEr/aMDixUEUnhAzLNc69LoaE5EzRjabK18P6/3dXchPSN7ekuVGBteZRuGZrlRLgdOzdc48N3G2YkNmmaaJmdq2HwIREIGrvZEQapYH7dnUTAwkgz/SAvCOo67LPddj6noajeE53JTBDu29cx5Clp5iUMxLomSwGTCR5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712662231; c=relaxed/simple;
	bh=DBcJsWV4nfgk/8fw3M6vcKnfFbP1zoB1PzLmLNRfgyE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=phjP8LJoyAVj4Lg5AvDv/uA9i+ivBzUX6jXFHq0CjLk4i61AJ/b/Tkp0IWmw1I7Mb2pPim4Mb57XWO9JRfZRId6V7hEsbTxwBhZ8B/uwBLaHvuiZrfMFTfkKxGBBs2NR7N3f0mksecM1VPqYdCClQl1E828NgfYn4y/QRkrdd3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.helo=mgamail.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BEvmVoZR; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.helo=mgamail.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BEvmVoZR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712662230; x=1744198230;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=DBcJsWV4nfgk/8fw3M6vcKnfFbP1zoB1PzLmLNRfgyE=;
  b=BEvmVoZRyX0eqROBwgsLb2MM/H4onmhbS4EdYXhuB2eNmPS/EkNUNwyM
   9JxtDliNnsV+4S1Cm2e6Sonbnl7JzZHMsuJ5WK6V77iy2EGtBZYW4enPO
   qMFC+4CJBCJz57yZCjoWhKCE8NcmiAeldqOvoUaf/lDGhUdvhsc69M+HM
   mG9UN0iVlvlMsFIYnxaaDMf4O93ekb5bqEkQ9eS+tAU8jvrdGwJdTM4Ml
   8EggphP/6l99aeqjAbGtpANlORNy97TE1KWCNUHHG7sYfpMM8yfyNR39W
   sL7qWkyW1BovFVVL14n1XxaIkj3tzD+OS91YBxH9dwEwVzKQww5sP3hTQ
   w==;
X-CSE-ConnectionGUID: Lk9/MYGdQ1S+DooK8G3fkQ==
X-CSE-MsgGUID: Ou4jUMnwSF+WXtOMTpu5tw==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="30460377"
X-IronPort-AV: E=Sophos;i="6.07,189,1708416000"; 
   d="scan'208";a="30460377"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2024 04:30:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="937093331"
X-IronPort-AV: E=Sophos;i="6.07,189,1708416000"; 
   d="scan'208";a="937093331"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 09 Apr 2024 04:30:24 -0700
Received: by black.fi.intel.com (Postfix, from userid 1000)
	id 11CC1C09; Tue,  9 Apr 2024 14:30:18 +0300 (EEST)
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
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Subject: [PATCHv10 12/18] x86/mm: Do not zap page table entries mapping unaccepted memory table during kdump.
Date: Tue,  9 Apr 2024 14:30:04 +0300
Message-ID: <20240409113010.465412-13-kirill.shutemov@linux.intel.com>
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

From: Ashish Kalra <ashish.kalra@amd.com>

During crashkernel boot only pre-allocated crash memory is presented as
E820_TYPE_RAM. This can cause page table entries mapping unaccepted memory
table to be zapped during phys_pte_init(), phys_pmd_init(), phys_pud_init()
and phys_p4d_init() as SNP/TDX guest use E820_TYPE_ACPI to store the
unaccepted memory table and pass it between the kernels on
kexec/kdump.

E820_TYPE_ACPI covers not only ACPI data, but also EFI tables and might
be required by kernel to function properly.

The problem was discovered during debugging kdump for SNP guest. The
unaccepted memory table stored with E820_TYPE_ACPI and passed between
the kernels on kdump was getting zapped as the PMD entry mapping this
is above the E820_TYPE_RAM range for the reserved crashkernel memory.

Signed-off-by: Ashish Kalra <ashish.kalra@amd.com>
Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
---
 arch/x86/mm/init_64.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/arch/x86/mm/init_64.c b/arch/x86/mm/init_64.c
index 7e177856ee4f..28002cc7a37d 100644
--- a/arch/x86/mm/init_64.c
+++ b/arch/x86/mm/init_64.c
@@ -469,7 +469,9 @@ phys_pte_init(pte_t *pte_page, unsigned long paddr, unsigned long paddr_end,
 			    !e820__mapped_any(paddr & PAGE_MASK, paddr_next,
 					     E820_TYPE_RAM) &&
 			    !e820__mapped_any(paddr & PAGE_MASK, paddr_next,
-					     E820_TYPE_RESERVED_KERN))
+					     E820_TYPE_RESERVED_KERN) &&
+			    !e820__mapped_any(paddr & PAGE_MASK, paddr_next,
+					     E820_TYPE_ACPI))
 				set_pte_init(pte, __pte(0), init);
 			continue;
 		}
@@ -524,7 +526,9 @@ phys_pmd_init(pmd_t *pmd_page, unsigned long paddr, unsigned long paddr_end,
 			    !e820__mapped_any(paddr & PMD_MASK, paddr_next,
 					     E820_TYPE_RAM) &&
 			    !e820__mapped_any(paddr & PMD_MASK, paddr_next,
-					     E820_TYPE_RESERVED_KERN))
+					     E820_TYPE_RESERVED_KERN) &&
+			    !e820__mapped_any(paddr & PMD_MASK, paddr_next,
+					     E820_TYPE_ACPI))
 				set_pmd_init(pmd, __pmd(0), init);
 			continue;
 		}
@@ -611,7 +615,9 @@ phys_pud_init(pud_t *pud_page, unsigned long paddr, unsigned long paddr_end,
 			    !e820__mapped_any(paddr & PUD_MASK, paddr_next,
 					     E820_TYPE_RAM) &&
 			    !e820__mapped_any(paddr & PUD_MASK, paddr_next,
-					     E820_TYPE_RESERVED_KERN))
+					     E820_TYPE_RESERVED_KERN) &&
+			    !e820__mapped_any(paddr & PUD_MASK, paddr_next,
+					     E820_TYPE_ACPI))
 				set_pud_init(pud, __pud(0), init);
 			continue;
 		}
@@ -698,7 +704,9 @@ phys_p4d_init(p4d_t *p4d_page, unsigned long paddr, unsigned long paddr_end,
 			    !e820__mapped_any(paddr & P4D_MASK, paddr_next,
 					     E820_TYPE_RAM) &&
 			    !e820__mapped_any(paddr & P4D_MASK, paddr_next,
-					     E820_TYPE_RESERVED_KERN))
+					     E820_TYPE_RESERVED_KERN) &&
+			    !e820__mapped_any(paddr & P4D_MASK, paddr_next,
+					     E820_TYPE_ACPI))
 				set_p4d_init(p4d, __p4d(0), init);
 			continue;
 		}
-- 
2.43.0

