Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EAAA1847
	for <linux-coco@lists.linux.dev>; Tue, 17 May 2022 15:35:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652801719; x=1684337719;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xF84dLhyksFpMyCb7NPvfM3NGwTlY5bjd8sAol6pl90=;
  b=BcDjdB5lxZ32SyGkAlwY7g971/5l/ZvovIoW3Xu2ryuHdw3+Cx9zwSIc
   vkl0TKZF3QD5DfGIqBW90oTVZcGJHdBJphZhycfntL41W2e8231cmdeTu
   0K3EiIvPTkC4hs01pkcs1ifBtTRaQHzobqKvrSHv3J8O5w3VJoR/woQQJ
   Cz6iIAJPMhNxV068WqvzrQ5twQQTuSnf5k+7huVM4zlIBaiht7yfuVnMg
   Ao+RYeHAMcSXD58H/EKv5Z1u5YOi42flAV6v9bx/pV0JtP2MBjwj9mzuo
   7V+qAg0AEcli6FwyhdwvhhjPRAwggByfH4IDf8Rj0ddmcImrCVHHbcJS7
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10350"; a="253270622"
X-IronPort-AV: E=Sophos;i="5.91,233,1647327600"; 
   d="scan'208";a="253270622"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2022 08:35:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,233,1647327600"; 
   d="scan'208";a="555823109"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga002.jf.intel.com with ESMTP; 17 May 2022 08:34:58 -0700
Received: by black.fi.intel.com (Postfix, from userid 1000)
	id CBC23D38; Tue, 17 May 2022 18:34:50 +0300 (EEST)
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
Subject: [PATCHv6 11/15] x86: Disable kexec if system has unaccepted memory
Date: Tue, 17 May 2022 18:34:40 +0300
Message-Id: <20220517153444.11195-12-kirill.shutemov@linux.intel.com>
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

On kexec, the target kernel has to know what memory has been accepted.
Information in EFI map is out of date and cannot be used.

boot_params.unaccepted_memory can be used to pass the bitmap between two
kernels on kexec, but the use-case is not yet implemented.

Disable kexec on machines with unaccepted memory for now.

Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
---
 arch/x86/mm/unaccepted_memory.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/x86/mm/unaccepted_memory.c b/arch/x86/mm/unaccepted_memory.c
index 1ca71eb98c24..b4c43e6089b0 100644
--- a/arch/x86/mm/unaccepted_memory.c
+++ b/arch/x86/mm/unaccepted_memory.c
@@ -1,4 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0-only
+#include <linux/kexec.h>
 #include <linux/memblock.h>
 #include <linux/mm.h>
 #include <linux/pfn.h>
@@ -114,6 +115,15 @@ static int __init unaccepted_init(void)
 	if (!boot_params.unaccepted_memory)
 		return 0;
 
+#ifdef CONFIG_KEXEC_CORE
+	/*
+	 * TODO: Information on memory acceptance status has to be communicated
+	 * between kernel.
+	 */
+	pr_warn("Disable kexec: not yet supported on systems with unaccepted memory\n");
+	kexec_load_disabled = 1;
+#endif
+
 	bitmap_size = e820__end_of_ram_pfn() * PAGE_SIZE / PMD_SIZE;
 	unaccepted_memory = __va(boot_params.unaccepted_memory);
 
-- 
2.35.1

