Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D4B420F0
	for <linux-coco@lists.linux.dev>; Mon, 25 Apr 2022 03:39:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650857991; x=1682393991;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=B6xQElVKXMmk7bVMoMJbz0U88Nts50RHxDgA813tPNs=;
  b=QTUZ9IyGJhzNpV/c7qA0QsZG9tmf17Yp52w6x7a3qGto6/dzvWl4r73Z
   qnB0j6ATzf6C5RXmSbDYTGzFCU8J7zZNHM1BDxpxuw1OshfFITt1ssndv
   4FNv05vC5WBg5cVkDIXPjzQ+yBRhUM3NAw5X1x/QSUcOPO3ls5egTDSL1
   duPtgoklJpFDnMt/H8+5DzYSMktzktuyEPZYFKnyXv23ChJa3vMVrnaF0
   kdL0IqraMSmUNOyYhBBGN0vxgfGNhAgACIhD0Hn23X4NM/JwWZTsYYJvQ
   o8nAMJ0m4JUzue4SgM06eiPF5dR1wTIVxBZwnXxWpRZWebpvQeCu9oXPy
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10327"; a="351576541"
X-IronPort-AV: E=Sophos;i="5.90,287,1643702400"; 
   d="scan'208";a="351576541"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2022 20:39:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,287,1643702400"; 
   d="scan'208";a="871799384"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga005.fm.intel.com with ESMTP; 24 Apr 2022 20:39:43 -0700
Received: by black.fi.intel.com (Postfix, from userid 1000)
	id DC3785F2; Mon, 25 Apr 2022 06:39:35 +0300 (EEST)
From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
To: Borislav Petkov <bp@alien8.de>,
	Andy Lutomirski <luto@kernel.org>,
	Sean Christopherson <seanjc@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Joerg Roedel <jroedel@suse.de>,
	Ard Biesheuvel <ardb@kernel.org>
Cc: Andi Kleen <ak@linux.intel.com>,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
	David Rientjes <rientjes@google.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Ingo Molnar <mingo@redhat.com>,
	Varad Gautam <varad.gautam@suse.com>,
	Dario Faggioli <dfaggioli@suse.com>,
	Dave Hansen <dave.hansen@intel.com>,
	Brijesh Singh <brijesh.singh@amd.com>,
	Mike Rapoport <rppt@kernel.org>,
	David Hildenbrand <david@redhat.com>,
	x86@kernel.org,
	linux-mm@kvack.org,
	linux-coco@lists.linux.dev,
	linux-efi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
	Mike Rapoport <rppt@linux.ibm.com>
Subject: [PATCHv5 07/12] x86/mm: Reserve unaccepted memory bitmap
Date: Mon, 25 Apr 2022 06:39:29 +0300
Message-Id: <20220425033934.68551-8-kirill.shutemov@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220425033934.68551-1-kirill.shutemov@linux.intel.com>
References: <20220425033934.68551-1-kirill.shutemov@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A given page of memory can only be accepted once. The kernel has a need
to accept memory both in the early decompression stage and during normal
runtime.

A bitmap used to communicate the acceptance state of each page between the
decompression stage and normal runtime.

boot_params is used to communicate location of the bitmap through out
the boot. The bitmap is allocated and initially populated in EFI stub.
Decompression stage accepts pages required for kernel/initrd and mark
these pages accordingly in the bitmap. The main kernel picks up the
bitmap from the same boot_params and uses it to determinate what has to
be accepted on allocation.

In the runtime kernel, reserve the bitmap's memory to ensure nothing
overwrites it.

The size of bitmap is determinated with e820__end_of_ram_pfn() which
relies on setup_e820() marking unaccepted memory as E820_TYPE_RAM.

Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
Acked-by: Mike Rapoport <rppt@linux.ibm.com>
---
 arch/x86/kernel/e820.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/x86/kernel/e820.c b/arch/x86/kernel/e820.c
index f267205f2d5a..22d1fe48dcba 100644
--- a/arch/x86/kernel/e820.c
+++ b/arch/x86/kernel/e820.c
@@ -1316,6 +1316,16 @@ void __init e820__memblock_setup(void)
 	int i;
 	u64 end;
 
+	/* Mark unaccepted memory bitmap reserved */
+	if (boot_params.unaccepted_memory) {
+		unsigned long size;
+
+		/* One bit per 2MB */
+		size = DIV_ROUND_UP(e820__end_of_ram_pfn() * PAGE_SIZE,
+				    PMD_SIZE * BITS_PER_BYTE);
+		memblock_reserve(boot_params.unaccepted_memory, size);
+	}
+
 	/*
 	 * The bootstrap memblock region count maximum is 128 entries
 	 * (INIT_MEMBLOCK_REGIONS), but EFI might pass us more E820 entries
-- 
2.35.1

