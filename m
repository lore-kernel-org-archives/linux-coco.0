Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 938681847
	for <linux-coco@lists.linux.dev>; Tue, 17 May 2022 15:35:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652801708; x=1684337708;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ZlxeDiZ2Ogy8lAspacIgsZZ/Yy5DPmqPGpLnxSiDxx8=;
  b=kopZf7OJlAUFjCbI7XO8+/ktdbT/HAdg4UzUTL2lvAyE7YYrNt1vcaDH
   eGF9RZI1xWcuEg087GqthEttrF6kb2wlV/2Z5UWYImsI/X3QHr0sWhvct
   8pmrmYcRqDVyPmRYbvXXWPpUISWj2oO+whejuxes+dgsXgPmoxpX1bd4m
   X6ZyV5K1XoCf1YAR0J/tyac6ewkBsG8oP2jUCkeSyTL0Q2ShyPdWjzV0k
   l4UtH5L2yMv9vT1bnc1UFrboIJLo3TRbs9nOVw6Zkeg4pmQkUV4RDHNC1
   vuCaeri7lKqpXKQUWyElw3IFEJGQNTEbhRLx+k86KMePkm9Gl2qLTzc+1
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10350"; a="271167714"
X-IronPort-AV: E=Sophos;i="5.91,233,1647327600"; 
   d="scan'208";a="271167714"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2022 08:35:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,233,1647327600"; 
   d="scan'208";a="672905589"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga002.fm.intel.com with ESMTP; 17 May 2022 08:34:58 -0700
Received: by black.fi.intel.com (Postfix, from userid 1000)
	id E3A8BD7B; Tue, 17 May 2022 18:34:50 +0300 (EEST)
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
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Subject: [PATCHv6 13/15] x86/tdx: Refactor try_accept_one()
Date: Tue, 17 May 2022 18:34:42 +0300
Message-Id: <20220517153444.11195-14-kirill.shutemov@linux.intel.com>
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

Rework try_accept_one() to return accepted size instead of modifying
'start' inside the helper. It makes 'start' in-only argumaent and
streamlines code on the caller side.

Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
Suggested-by: Borislav Petkov <bp@alien8.de>
---
 arch/x86/coco/tdx/tdx.c | 38 +++++++++++++++++++-------------------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/arch/x86/coco/tdx/tdx.c b/arch/x86/coco/tdx/tdx.c
index 6a62d3950619..90237700a942 100644
--- a/arch/x86/coco/tdx/tdx.c
+++ b/arch/x86/coco/tdx/tdx.c
@@ -561,18 +561,18 @@ static bool tdx_cache_flush_required(void)
 	return true;
 }
 
-static bool try_accept_one(phys_addr_t *start, unsigned long len,
-			  enum pg_level pg_level)
+static unsigned long try_accept_one(phys_addr_t start, unsigned long len,
+				    enum pg_level pg_level)
 {
 	unsigned long accept_size = page_level_size(pg_level);
 	u64 tdcall_rcx;
 	u8 page_size;
 
-	if (!IS_ALIGNED(*start, accept_size))
-		return false;
+	if (!IS_ALIGNED(start, accept_size))
+		return 0;
 
 	if (len < accept_size)
-		return false;
+		return 0;
 
 	/*
 	 * Pass the page physical address to the TDX module to accept the
@@ -591,15 +591,14 @@ static bool try_accept_one(phys_addr_t *start, unsigned long len,
 		page_size = 2;
 		break;
 	default:
-		return false;
+		return 0;
 	}
 
-	tdcall_rcx = *start | page_size;
+	tdcall_rcx = start | page_size;
 	if (__tdx_module_call(TDX_ACCEPT_PAGE, tdcall_rcx, 0, 0, 0, NULL))
-		return false;
+		return 0;
 
-	*start += accept_size;
-	return true;
+	return accept_size;
 }
 
 /*
@@ -636,21 +635,22 @@ static bool tdx_enc_status_changed(unsigned long vaddr, int numpages, bool enc)
 	 */
 	while (start < end) {
 		unsigned long len = end - start;
+		unsigned long accept_size;
 
 		/*
 		 * Try larger accepts first. It gives chance to VMM to keep
-		 * 1G/2M SEPT entries where possible and speeds up process by
-		 * cutting number of hypercalls (if successful).
+		 * 1G/2M Secure EPT entries where possible and speeds up
+		 * process by cutting number of hypercalls (if successful).
 		 */
 
-		if (try_accept_one(&start, len, PG_LEVEL_1G))
-			continue;
-
-		if (try_accept_one(&start, len, PG_LEVEL_2M))
-			continue;
-
-		if (!try_accept_one(&start, len, PG_LEVEL_4K))
+		accept_size = try_accept_one(start, len, PG_LEVEL_1G);
+		if (!accept_size)
+			accept_size = try_accept_one(start, len, PG_LEVEL_2M);
+		if (!accept_size)
+			accept_size = try_accept_one(start, len, PG_LEVEL_4K);
+		if (!accept_size)
 			return false;
+		start += accept_size;
 	}
 
 	return true;
-- 
2.35.1

