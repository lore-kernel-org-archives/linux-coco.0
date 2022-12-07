Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EE52376
	for <linux-coco@lists.linux.dev>; Wed,  7 Dec 2022 01:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1670377806; x=1701913806;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=SfxCo98L571pSepCQHUd/DhlAMN+hwpTgH7KtlWdFyw=;
  b=B1vWx+YyPfw/I5RDtXIoSAxJEOVHQr3pDts72k7YrxANNspg4VGwNxLl
   h3tm3bduDbuvEnC/1wA5fmKeEfZ5QxQjLQ3a8PiBulpLUCXyjtfqrlec+
   SjbCYPpTPOKl1UHDxhZL4GJoAddRNcYA11PUaw88FvazBHCnBpyiQylA+
   CejWawDyYS8OiHZlDpvSs9nNi8V2t60oMJXCBIdI9O3SakXBjpmnaCH0N
   IdUSZIXdR1J09E5m/TCOl5BtgY9c9nEdALvNABj5YR5D9BHonNoHjZHaD
   tre9wTw4/YZMc0EhbtEvmAhpM8HcsKnx6upxGASmPD1rR92loE+aNe1Yd
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10553"; a="315494582"
X-IronPort-AV: E=Sophos;i="5.96,223,1665471600"; 
   d="scan'208";a="315494582"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2022 17:50:02 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10553"; a="646427711"
X-IronPort-AV: E=Sophos;i="5.96,223,1665471600"; 
   d="scan'208";a="646427711"
Received: from puneets1-mobl.ger.corp.intel.com (HELO box.shutemov.name) ([10.252.38.123])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2022 17:49:53 -0800
Received: by box.shutemov.name (Postfix, from userid 1000)
	id B99B6109C91; Wed,  7 Dec 2022 04:49:39 +0300 (+03)
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
	Dave Hansen <dave.hansen@linux.intel.com>
Subject: [PATCHv8 13/14] x86/tdx: Refactor try_accept_one()
Date: Wed,  7 Dec 2022 04:49:32 +0300
Message-Id: <20221207014933.8435-14-kirill.shutemov@linux.intel.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20221207014933.8435-1-kirill.shutemov@linux.intel.com>
References: <20221207014933.8435-1-kirill.shutemov@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rework try_accept_one() to return accepted size instead of modifying
'start' inside the helper. It makes 'start' in-only argument and
streamlines code on the caller side.

Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
Suggested-by: Borislav Petkov <bp@alien8.de>
Reviewed-by: Dave Hansen <dave.hansen@linux.intel.com>
---
 arch/x86/coco/tdx/tdx.c | 38 +++++++++++++++++++-------------------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/arch/x86/coco/tdx/tdx.c b/arch/x86/coco/tdx/tdx.c
index 12c14affa5f2..cf6d9a0968d8 100644
--- a/arch/x86/coco/tdx/tdx.c
+++ b/arch/x86/coco/tdx/tdx.c
@@ -674,18 +674,18 @@ static bool tdx_cache_flush_required(void)
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
@@ -704,15 +704,14 @@ static bool try_accept_one(phys_addr_t *start, unsigned long len,
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
@@ -749,21 +748,22 @@ static bool tdx_enc_status_changed(unsigned long vaddr, int numpages, bool enc)
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
2.38.0

