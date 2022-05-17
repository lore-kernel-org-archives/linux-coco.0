Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C64A01850
	for <linux-coco@lists.linux.dev>; Tue, 17 May 2022 15:35:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652801708; x=1684337708;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Vt7QSmHfxcGQwi2CPob9vBQysbMDXN+N63yj2aSmEdc=;
  b=HHI/8Oi+nithSqWJopXYJxsGTZrLIrCx1+IDOoeNxFwf5HcWZdIssXOM
   +o0g/iP87AaokrZ2yCkRxDpuH2+gFt4pjgdsVdC856BkfTmHxIpbq62tO
   2VDpNkXsyxeN+dVLjmb7yC+Jr2+3HX7dBXda+TY75GnP4N1rGZWfKhXSR
   cvW4dWxTsXpPk2lIoYRXweLUnLmSFP4+ItE66uJcdpl/YN8LzQRVWr72b
   sNDjCrTJ7kP4a1OPhr6XlnNMkbV88EdxwDKHOCMvgS37yxDh7nIM6YibS
   FkskEOSUD492OQIbxHza0GVDgE1upTrgsp/voFgFP2X2UFY90YfCYRrBk
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10350"; a="271167726"
X-IronPort-AV: E=Sophos;i="5.91,233,1647327600"; 
   d="scan'208";a="271167726"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2022 08:35:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,233,1647327600"; 
   d="scan'208";a="741831016"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga005.jf.intel.com with ESMTP; 17 May 2022 08:34:58 -0700
Received: by black.fi.intel.com (Postfix, from userid 1000)
	id 979578F9; Tue, 17 May 2022 18:34:50 +0300 (EEST)
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
	Mike Rapoport <rppt@kernel.org>,
	David Hildenbrand <david@redhat.com>,
	marcelo.cerri@canonical.com,
	tim.gardner@canonical.com,
	khalid.elmously@canonical.com,
	philip.cox@canonical.com,
	x86@kernel.org,
	linux-mm@kvack.org,
	linux-coco@lists.linux.dev,
	linux-efi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
	Mike Rapoport <rppt@linux.ibm.com>
Subject: [PATCHv6 07/15] x86/mm: Reserve unaccepted memory bitmap
Date: Tue, 17 May 2022 18:34:36 +0300
Message-Id: <20220517153444.11195-8-kirill.shutemov@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220517153444.11195-1-kirill.shutemov@linux.intel.com>
References: <20220517153444.11195-1-kirill.shutemov@linux.intel.com>
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

