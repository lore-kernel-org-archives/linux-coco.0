Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 220641864
	for <linux-coco@lists.linux.dev>; Tue, 14 Jun 2022 12:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655208164; x=1686744164;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5iNOOTJdL5ijo85SJxVFVHCZr4Xdf/z52sXS4dv1fJU=;
  b=aUCtxHpLJqQ2E0CX1IKajNeOWtXHPE9gv+v8Lr54XxvVn0Ni4I+xub6G
   524BmzENUCbU6eOfHjytohWYS4d8QDaTRU0Tu4zn/9VSMJMXDVw95eWL8
   pTQ8c1AaFrRZwr8m5DsnshbdODfRc1cMC0TCdt3m0flCGMeXFMhwQuNvN
   aeHfGMQ3iQd3MviOaBtnfwtmDgID8Dk/VHtqa5PTS2u6kLsWDPlWEnnW7
   9xqVk8oL3uga7i9bAv9YJkRYASaHycSXD4eUmYqif/rHZotaFPty3hRqM
   rNI1iVi1DLbumbDZ+FjxZOBPi/qJiqf4OC2qC1F5y+kLxFO9D7hbRpVpd
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10377"; a="342559954"
X-IronPort-AV: E=Sophos;i="5.91,300,1647327600"; 
   d="scan'208";a="342559954"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2022 05:02:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,300,1647327600"; 
   d="scan'208";a="558311426"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga006.jf.intel.com with ESMTP; 14 Jun 2022 05:02:36 -0700
Received: by black.fi.intel.com (Postfix, from userid 1000)
	id DA1A7911; Tue, 14 Jun 2022 15:02:32 +0300 (EEST)
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
Subject: [PATCHv7 11/14] x86: Disable kexec if system has unaccepted memory
Date: Tue, 14 Jun 2022 15:02:28 +0300
Message-Id: <20220614120231.48165-12-kirill.shutemov@linux.intel.com>
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

On kexec, the target kernel has to know what memory has been accepted.
Information in EFI map is out of date and cannot be used.

boot_params.unaccepted_memory can be used to pass the bitmap between two
kernels on kexec, but the use-case is not yet implemented.

Disable kexec on machines with unaccepted memory for now.

Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
---
 arch/x86/mm/unaccepted_memory.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/x86/mm/unaccepted_memory.c b/arch/x86/mm/unaccepted_memory.c
index bcd56fe82b9e..05e216716690 100644
--- a/arch/x86/mm/unaccepted_memory.c
+++ b/arch/x86/mm/unaccepted_memory.c
@@ -1,4 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0-only
+#include <linux/kexec.h>
 #include <linux/memblock.h>
 #include <linux/mm.h>
 #include <linux/pfn.h>
@@ -95,3 +96,21 @@ bool range_contains_unaccepted_memory(phys_addr_t start, phys_addr_t end)
 
 	return ret;
 }
+
+static int __init unaccepted_init(void)
+{
+	if (!boot_params.unaccepted_memory)
+		return 0;
+
+#ifdef CONFIG_KEXEC_CORE
+	/*
+	 * TODO: Information on memory acceptance status has to be communicated
+	 * between kernel.
+	 */
+	pr_warn("Disable kexec: not yet supported on systems with unaccepted memory\n");
+	kexec_load_disabled = 1;
+#endif
+
+	return 0;
+}
+fs_initcall(unaccepted_init);
-- 
2.35.1

