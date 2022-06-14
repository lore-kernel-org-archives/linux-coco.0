Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3565B185F
	for <linux-coco@lists.linux.dev>; Tue, 14 Jun 2022 12:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655208165; x=1686744165;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Vt7QSmHfxcGQwi2CPob9vBQysbMDXN+N63yj2aSmEdc=;
  b=d0N7IGfdtvGeKFUkxdu/t+7A4wUXRu2gYcR/ye6mScH30Nvqfc3lwpya
   BcwPaMDogctiIVLwUVJBgdxvCR/eL5AK1+AMhhgcZXffrc9dyyMrCjJea
   479xSd9auq2Yu/EDvwAmhtUj4CQJFxhDBzFS5i6ZtNvMxBhb5u6A0jd/v
   4+fpek4CEdcsM8NnqCNPFclCWl/1v4tDFVQap8lDHqa/FNTAihZgBE8y2
   X6OLqPr6w78bc/HNq2+F34pe4QJ6yxO8Fxx0la6ETXaECCumGF7kOQaAf
   vVKK/Kf0NWTH4EdUCGM6VYuxRz63e89vCOY1TLam7fXt0F0aLTCk8lhDL
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10377"; a="258432280"
X-IronPort-AV: E=Sophos;i="5.91,300,1647327600"; 
   d="scan'208";a="258432280"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2022 05:02:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,300,1647327600"; 
   d="scan'208";a="640332827"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga008.fm.intel.com with ESMTP; 14 Jun 2022 05:02:36 -0700
Received: by black.fi.intel.com (Postfix, from userid 1000)
	id C01F088D; Tue, 14 Jun 2022 15:02:32 +0300 (EEST)
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
Subject: [PATCHv7 08/14] x86/mm: Reserve unaccepted memory bitmap
Date: Tue, 14 Jun 2022 15:02:25 +0300
Message-Id: <20220614120231.48165-9-kirill.shutemov@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220614120231.48165-1-kirill.shutemov@linux.intel.com>
References: <20220614120231.48165-1-kirill.shutemov@linux.intel.com>
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

