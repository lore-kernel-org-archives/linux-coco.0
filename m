Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2FE114A4E0
	for <linux-coco@lists.linux.dev>; Tue, 27 Feb 2024 18:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709057823; cv=none; b=F/i2xAXdyn0H/VN3RDdD8Qx15lYkYpde7LPNL1EKf9knMUvddPnr43mTSpOPrTIW4qdglm3whpU9To/LnTme6S1LjOFn5/dLZ7HvQq+Wwu1P4AdFpyNoiegm2H8s6ZoznjIU376QMCVd3gtaBrlqSwKkGObDvidZezAfWXVDMPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709057823; c=relaxed/simple;
	bh=9DcFlB+EMYNkp2N6OZv2c5TmDu3Stsj7JMO1CUBiP2Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eth0nyFj/0yVCLNh8+hne2sjq7QZ4KvlvRGDX/zREGSopchPujLQOf9oE/TYV2diB9SL/ZVmSUu/g2lcJhCFF0jHgY4srBXVoFlsGk3PiHDohL3MuiG7dm9j15CJxwIE1ccvgwLhxCJT9ofrfeQEzfFjnGDVuER083qwQ2ZI74g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.helo=mgamail.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ksNMY4IN; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.helo=mgamail.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ksNMY4IN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709057821; x=1740593821;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9DcFlB+EMYNkp2N6OZv2c5TmDu3Stsj7JMO1CUBiP2Q=;
  b=ksNMY4IN9+ejoxFJT+yaDBIj8A9Qns3oBQkRND8tY2yKZm+R9PiOT7Is
   51MOuqs00RW2LMm74WckphRfJKwz86ZIoUOhLHZwZqC4l92K95cO5iswD
   J9L8OnyELqii/zb6NUJXKjfQVsX3opFTszSCB0O35Zx1AhkZkS7mbGWfv
   bi2i1VLsd+4UuU1pXcJw7vWX4YquVnbKK9kmn1ykhl2VJzuHeUZM7J9WK
   /fFVMUA0cX6Qd+c16szT4nH/WPoSpqDIZuwSF6V7a3OXnHhhSS6D5mVkL
   czis2Ys8uSNW5YViXhCjy+Osd5ihhSeEXeN3pw0SA2t+Fu4RRtAo3z65p
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="20966114"
X-IronPort-AV: E=Sophos;i="6.06,188,1705392000"; 
   d="scan'208";a="20966114"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2024 10:16:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="937032729"
X-IronPort-AV: E=Sophos;i="6.06,188,1705392000"; 
   d="scan'208";a="937032729"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 27 Feb 2024 10:16:26 -0800
Received: by black.fi.intel.com (Postfix, from userid 1000)
	id CBF8D9DB; Tue, 27 Feb 2024 20:16:19 +0200 (EET)
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
Subject: [PATCHv8 11/16] x86/mm: Make e820_end_ram_pfn() cover E820_TYPE_ACPI ranges
Date: Tue, 27 Feb 2024 20:16:11 +0200
Message-ID: <20240227181616.3032032-12-kirill.shutemov@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240227181616.3032032-1-kirill.shutemov@linux.intel.com>
References: <20240227181616.3032032-1-kirill.shutemov@linux.intel.com>
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
---
 arch/x86/kernel/e820.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/arch/x86/kernel/e820.c b/arch/x86/kernel/e820.c
index fb8cf953380d..99c80680dc9e 100644
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

