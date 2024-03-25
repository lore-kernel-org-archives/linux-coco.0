Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 410D617C6B4
	for <linux-coco@lists.linux.dev>; Mon, 25 Mar 2024 10:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711363223; cv=none; b=NOAjT4QvCp0WHK2qa/vRnDsoLPiS8iNWPmoEX51gSpWRNDpy4XwACfC/MUBHisteq59AJpEPlnJo5P4jKTJWp4sgVMZTYcOgmprgi7msWfS6atSEWMH17xnYeleCWFAdx10JYoAHgtmr+5wIceqAfrrUhtul7s7QVfx5nfWS3M0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711363223; c=relaxed/simple;
	bh=VFGBq1PSfgIQMFKRrc4wCIEiYZ92NiwhzOj7lLNvdxg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RHBZuJXMki0QEbO3NXEDK4k27HvkQwm7c4J8tTOOZSo4pPZIBDoHOLN5kM8eofJcfXet3iMxdiUkgqUmTIeAw5aLhI2QA5gzH7oxAnpjM83ZafHII6WUxI3PvEUqXdN2IFqfdXUWhhCL2sO9g11KBR726o03qMHrzm9IzkCiGOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.helo=mgamail.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=meTvYnD8; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.helo=mgamail.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="meTvYnD8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711363221; x=1742899221;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=VFGBq1PSfgIQMFKRrc4wCIEiYZ92NiwhzOj7lLNvdxg=;
  b=meTvYnD8LBLuPVkjxZFLMiVleuTNdaiQJlS80nvDlITb5ZOM5i4T2JwQ
   JzOUkn3k5EUKjJE/n3679rqG1BDgdu85FjDtFyXd9XxwRYH/lKU3bDF/5
   O09N9s3kMnUiJnh7UcG5iiJ29WuMmPPdJEyM20Y864T+54iuUdfoz1gaY
   pD7ihKXnS3YH2pztCsGrL2w5xb0/CU1kApNetbsJA1e1zmIEes6xu7rhq
   elN7E2xAth6BdTqPuPv8BGzFxPm3vBoIZcG401uk7eyXfj5VTnTKrEmm7
   NnD3mKklg/oALONnhUojuTLhT7kvyKdSXzKmKB0bp1FwYPRSbvAdGOLhy
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11023"; a="6561431"
X-IronPort-AV: E=Sophos;i="6.07,152,1708416000"; 
   d="scan'208";a="6561431"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2024 03:40:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11023"; a="937070163"
X-IronPort-AV: E=Sophos;i="6.07,152,1708416000"; 
   d="scan'208";a="937070163"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 25 Mar 2024 03:40:11 -0700
Received: by black.fi.intel.com (Postfix, from userid 1000)
	id 78733F06; Mon, 25 Mar 2024 12:40:05 +0200 (EET)
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
Subject: [PATCHv9 11/17] x86/mm: Make e820_end_ram_pfn() cover E820_TYPE_ACPI ranges
Date: Mon, 25 Mar 2024 12:39:05 +0200
Message-ID: <20240325103911.2651793-12-kirill.shutemov@linux.intel.com>
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

e820__end_of_ram_pfn() is used to calculate max_pfn which, among other
things, guides where direct mapping ends. Any memory above max_pfn is
not going to be present in the direct mapping.

e820__end_of_ram_pfn() finds the end of the ram based on the highest
E820_TYPE_RAM range. But it doesn't includes E820_TYPE_ACPI ranges into
calculation.

Despite the name, E820_TYPE_ACPI covers not only ACPI data, but also EFI
tables and might be required by kernel to function properly.

Usually the problem is hidden because there is some E820_TYPE_RAM memory
above E820_TYPE_ACPI. But crashkernel only presents pre-allocated crash
memory as E820_TYPE_RAM on boot. If the preallocated range is small, it
can fit under the last E820_TYPE_ACPI range.

Modify e820__end_of_ram_pfn() and e820__end_of_low_ram_pfn() to cover
E820_TYPE_ACPI memory.

The problem was discovered during debugging kexec for TDX guest. TDX
guest uses E820_TYPE_ACPI to store the unaccepted memory bitmap and pass
it between the kernels on kexec.

Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
Reviewed-by: Dave Hansen <dave.hansen@intel.com>
---
 arch/x86/kernel/e820.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/arch/x86/kernel/e820.c b/arch/x86/kernel/e820.c
index 6f1b379e3b38..f29969428443 100644
--- a/arch/x86/kernel/e820.c
+++ b/arch/x86/kernel/e820.c
@@ -827,7 +827,7 @@ u64 __init e820__memblock_alloc_reserved(u64 size, u64 align)
 /*
  * Find the highest page frame number we have available
  */
-static unsigned long __init e820_end_pfn(unsigned long limit_pfn, enum e820_type type)
+static unsigned long __init e820_end_ram_pfn(unsigned long limit_pfn)
 {
 	int i;
 	unsigned long last_pfn = 0;
@@ -838,7 +838,8 @@ static unsigned long __init e820_end_pfn(unsigned long limit_pfn, enum e820_type
 		unsigned long start_pfn;
 		unsigned long end_pfn;
 
-		if (entry->type != type)
+		if (entry->type != E820_TYPE_RAM &&
+		    entry->type != E820_TYPE_ACPI)
 			continue;
 
 		start_pfn = entry->addr >> PAGE_SHIFT;
@@ -864,12 +865,12 @@ static unsigned long __init e820_end_pfn(unsigned long limit_pfn, enum e820_type
 
 unsigned long __init e820__end_of_ram_pfn(void)
 {
-	return e820_end_pfn(MAX_ARCH_PFN, E820_TYPE_RAM);
+	return e820_end_ram_pfn(MAX_ARCH_PFN);
 }
 
 unsigned long __init e820__end_of_low_ram_pfn(void)
 {
-	return e820_end_pfn(1UL << (32 - PAGE_SHIFT), E820_TYPE_RAM);
+	return e820_end_ram_pfn(1UL << (32 - PAGE_SHIFT));
 }
 
 static void __init early_panic(char *msg)
-- 
2.43.0

