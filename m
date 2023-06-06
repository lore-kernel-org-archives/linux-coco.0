Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 418372DBBA
	for <linux-coco@lists.linux.dev>; Tue,  6 Jun 2023 14:27:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686061653; x=1717597653;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=JjnS0Brxqu2i7phm89Mj2mgUrvnNs0XsgqzO3HIBqfU=;
  b=SicAnju53uxtVeIDOuLvbegkyt7F7gUX2q3ZES1flhU/6znsTXQ/fT85
   g5+UMeJaX4Lg8Ds/VT987i4ZPKIAdNuG6XQyZj3onkOHxdOR6BYc7DHby
   z5JINnmIHQ5zzpZL9cwLriq6/x3q/hfJnkiOPGYSxoVtusE5HpiemDZC6
   XUcuqDUg8sMmgz6qVjGu3B9W6TuXuT9io/hrh95BeKU2W+1sUgVouAddl
   5WR6sFv389yXOzFqsZULk2GCv7A8ISNtPKvYZzxyGYN9LtEbV4PJmxaux
   mMQRo4aFRq6wz3Lq3zOAXEEv124XvzZwXxtPzrVwB8XbOFQBB/3zDCNAH
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="359147252"
X-IronPort-AV: E=Sophos;i="6.00,221,1681196400"; 
   d="scan'208";a="359147252"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2023 07:27:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="659543354"
X-IronPort-AV: E=Sophos;i="6.00,221,1681196400"; 
   d="scan'208";a="659543354"
Received: from rgraefe-mobl1.ger.corp.intel.com (HELO box.shutemov.name) ([10.252.58.173])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2023 07:26:54 -0700
Received: by box.shutemov.name (Postfix, from userid 1000)
	id 5F41F10DA12; Tue,  6 Jun 2023 17:26:42 +0300 (+03)
From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
To: Borislav Petkov <bp@alien8.de>,
	Andy Lutomirski <luto@kernel.org>,
	Dave Hansen <dave.hansen@intel.com>,
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
Subject: [PATCHv14 6/9] efi/unaccepted: Avoid load_unaligned_zeropad() stepping into unaccepted memory
Date: Tue,  6 Jun 2023 17:26:34 +0300
Message-Id: <20230606142637.5171-7-kirill.shutemov@linux.intel.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20230606142637.5171-1-kirill.shutemov@linux.intel.com>
References: <20230606142637.5171-1-kirill.shutemov@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

load_unaligned_zeropad() can lead to unwanted loads across page boundaries.
The unwanted loads are typically harmless. But, they might be made to
totally unrelated or even unmapped memory. load_unaligned_zeropad()
relies on exception fixup (#PF, #GP and now #VE) to recover from these
unwanted loads.

But, this approach does not work for unaccepted memory. For TDX, a load
from unaccepted memory will not lead to a recoverable exception within
the guest. The guest will exit to the VMM where the only recourse is to
terminate the guest.

There are two parts to fix this issue and comprehensively avoid access
to unaccepted memory. Together these ensure that an extra "guard" page
is accepted in addition to the memory that needs to be used.

1. Implicitly extend the range_contains_unaccepted_memory(start, end)
   checks up to end+unit_size if 'end' is aligned on a unit_size
   boundary.
2. Implicitly extend accept_memory(start, end) to end+unit_size if 'end'
   is aligned on a unit_size boundary.

Side note: This leads to something strange. Pages which were accepted
	   at boot, marked by the firmware as accepted and will never
	   _need_ to be accepted might be on unaccepted_pages list
	   This is a cue to ensure that the next page is accepted
	   before 'page' can be used.

This is an actual, real-world problem which was discovered during TDX
testing.

Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
Reviewed-by: Dave Hansen <dave.hansen@linux.intel.com>
Reviewed-by: Ard Biesheuvel <ardb@kernel.org>
Reviewed-by: Tom Lendacky <thomas.lendacky@amd.com>
---
 drivers/firmware/efi/unaccepted_memory.c | 35 ++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/drivers/firmware/efi/unaccepted_memory.c b/drivers/firmware/efi/unaccepted_memory.c
index 08a9a843550a..853f7dc3c21d 100644
--- a/drivers/firmware/efi/unaccepted_memory.c
+++ b/drivers/firmware/efi/unaccepted_memory.c
@@ -46,6 +46,34 @@ void accept_memory(phys_addr_t start, phys_addr_t end)
 	start -= unaccepted->phys_base;
 	end -= unaccepted->phys_base;
 
+	/*
+	 * load_unaligned_zeropad() can lead to unwanted loads across page
+	 * boundaries. The unwanted loads are typically harmless. But, they
+	 * might be made to totally unrelated or even unmapped memory.
+	 * load_unaligned_zeropad() relies on exception fixup (#PF, #GP and now
+	 * #VE) to recover from these unwanted loads.
+	 *
+	 * But, this approach does not work for unaccepted memory. For TDX, a
+	 * load from unaccepted memory will not lead to a recoverable exception
+	 * within the guest. The guest will exit to the VMM where the only
+	 * recourse is to terminate the guest.
+	 *
+	 * There are two parts to fix this issue and comprehensively avoid
+	 * access to unaccepted memory. Together these ensure that an extra
+	 * "guard" page is accepted in addition to the memory that needs to be
+	 * used:
+	 *
+	 * 1. Implicitly extend the range_contains_unaccepted_memory(start, end)
+	 *    checks up to end+unit_size if 'end' is aligned on a unit_size
+	 *    boundary.
+	 *
+	 * 2. Implicitly extend accept_memory(start, end) to end+unit_size if
+	 *    'end' is aligned on a unit_size boundary. (immediately following
+	 *    this comment)
+	 */
+	if (!(end % unit_size))
+		end += unit_size;
+
 	/* Make sure not to overrun the bitmap */
 	if (end > unaccepted->size * unit_size * BITS_PER_BYTE)
 		end = unaccepted->size * unit_size * BITS_PER_BYTE;
@@ -93,6 +121,13 @@ bool range_contains_unaccepted_memory(phys_addr_t start, phys_addr_t end)
 	start -= unaccepted->phys_base;
 	end -= unaccepted->phys_base;
 
+	/*
+	 * Also consider the unaccepted state of the *next* page. See fix #1 in
+	 * the comment on load_unaligned_zeropad() in accept_memory().
+	 */
+	if (!(end % unit_size))
+		end += unit_size;
+
 	/* Make sure not to overrun the bitmap */
 	if (end > unaccepted->size * unit_size * BITS_PER_BYTE)
 		end = unaccepted->size * unit_size * BITS_PER_BYTE;
-- 
2.39.3

