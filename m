Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C0931FB8
	for <linux-coco@lists.linux.dev>; Thu, 30 Mar 2023 11:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680177028; x=1711713028;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=f7/hrgLyEe7uCgqzPwQBAiXJTS6cTMMnuaKLYQlQP9E=;
  b=dDdrUwNy2Kio2n5xNdWUNBTWMOvs0XhZIML7FZmc1Ol3MrFUTqEcW2nD
   g2jrJ6HJU4CxxK1zOBuW0kyFvoZRfJc50Cq+tgHa4n93tKnV2rsQjwKfi
   ueiC/9Jx+Fx+bVy177Q8fi8b1GoXIKtUdFXTfY3gvWa7fzXuj/P0oq1QF
   V4GlVGLLtTFEg3S9r1JiA485BxxKSaQr/pL18evv+J/UneIBv198grTn6
   CW8Ew6g++sk4o7WB3yetFBOcFw3sYxduxCq908ZrfHPFR2zApoPSvB/5d
   tnMeQ7Gs/If3sYf6n16NhzG+aKVB4Np6PSeb2d9TeDfJDXkvcW5D8B7Yu
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="339868484"
X-IronPort-AV: E=Sophos;i="5.98,303,1673942400"; 
   d="scan'208";a="339868484"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2023 04:50:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="1014401448"
X-IronPort-AV: E=Sophos;i="5.98,303,1673942400"; 
   d="scan'208";a="1014401448"
Received: from ngreburx-mobl.ger.corp.intel.com (HELO box.shutemov.name) ([10.251.209.91])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2023 04:50:17 -0700
Received: by box.shutemov.name (Postfix, from userid 1000)
	id 49CA4104545; Thu, 30 Mar 2023 14:50:00 +0300 (+03)
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
	Dario Faggioli <dfaggioli@suse.com>,
	Dave Hansen <dave.hansen@intel.com>,
	Mike Rapoport <rppt@kernel.org>,
	David Hildenbrand <david@redhat.com>,
	Mel Gorman <mgorman@techsingularity.net>,
	marcelo.cerri@canonical.com,
	tim.gardner@canonical.com,
	khalid.elmously@canonical.com,
	philip.cox@canonical.com,
	aarcange@redhat.com,
	peterx@redhat.com,
	x86@kernel.org,
	linux-mm@kvack.org,
	linux-coco@lists.linux.dev,
	linux-efi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
	Mike Rapoport <rppt@linux.ibm.com>
Subject: [PATCHv9 09/14] x86/mm: Reserve unaccepted memory bitmap
Date: Thu, 30 Mar 2023 14:49:51 +0300
Message-Id: <20230330114956.20342-10-kirill.shutemov@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230330114956.20342-1-kirill.shutemov@linux.intel.com>
References: <20230330114956.20342-1-kirill.shutemov@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A given page of memory can only be accepted once. The kernel has to
accept memory both in the early decompression stage and during normal
runtime.

A bitmap is used to communicate the acceptance state of each page
between the decompression stage and normal runtime.

boot_params is used to communicate location of the bitmap throughout
the boot. The bitmap is allocated and initially populated in EFI stub.
Decompression stage accepts pages required for kernel/initrd and marks
these pages accordingly in the bitmap. The main kernel picks up the
bitmap from the same boot_params and uses it to determine what has to
be accepted on allocation.

In the runtime kernel, reserve the bitmap's memory to ensure nothing
overwrites it.

The size of bitmap is determined with e820__end_of_ram_pfn() which
relies on setup_e820() marking unaccepted memory as E820_TYPE_RAM.

Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
Acked-by: Mike Rapoport <rppt@linux.ibm.com>
---
 arch/x86/kernel/e820.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/x86/kernel/e820.c b/arch/x86/kernel/e820.c
index fb8cf953380d..483c36a28d2e 100644
--- a/arch/x86/kernel/e820.c
+++ b/arch/x86/kernel/e820.c
@@ -1316,6 +1316,23 @@ void __init e820__memblock_setup(void)
 	int i;
 	u64 end;
 
+	/*
+	 * Mark unaccepted memory bitmap reserved.
+	 *
+	 * This kind of reservation usually done from early_reserve_memory(),
+	 * but early_reserve_memory() called before e820__memory_setup(), so
+	 * e820_table is not finalized and e820__end_of_ram_pfn() cannot be
+	 * used to get correct RAM size.
+	 */
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
2.39.2

