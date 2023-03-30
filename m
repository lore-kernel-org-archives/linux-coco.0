Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 307EC1FB6
	for <linux-coco@lists.linux.dev>; Thu, 30 Mar 2023 11:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680177021; x=1711713021;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=bJTThgoaEyMmVXYNTmAj3X3A0F/zyVZqqh7eNmMOpAY=;
  b=W4UdAro0rd+jWtMcF9Rin6t8c74Lt0YpNsHdhVLW4x/J83aT5slFIfeC
   A3tu0XqQ9BcV39hCIiSQUbGFbVrvPa6KyYL//D889mywD6vbYJMXSEzDr
   xUt4N4RsKUipoHywLF3trkKH5RYfh+Ylp8V69a74qcUpgyFGgpw3FDXVC
   EHO5Pi0M1UQp3qVAXHXG3MLFV49Y1VdPMIIfw2BQ5rt+uVuJzoIKetHPc
   SQo4zjvak92XePNdXZqjBcXRmHzB76EXJ0gmCdU1rRY15Mq02mY64Mp+3
   0g+MEb7sVEhGHyD9AnT6CjUP0GljfST8L0ZEZiG37fmBQ05GqJ945FViB
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="339868389"
X-IronPort-AV: E=Sophos;i="5.98,303,1673942400"; 
   d="scan'208";a="339868389"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2023 04:50:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="1014401427"
X-IronPort-AV: E=Sophos;i="5.98,303,1673942400"; 
   d="scan'208";a="1014401427"
Received: from ngreburx-mobl.ger.corp.intel.com (HELO box.shutemov.name) ([10.251.209.91])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2023 04:50:02 -0700
Received: by box.shutemov.name (Postfix, from userid 1000)
	id E46BE10438C; Thu, 30 Mar 2023 14:49:59 +0300 (+03)
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
	Mike Rapoport <rppt@linux.ibm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>
Subject: [PATCHv9 01/14] x86/boot: Centralize __pa()/__va() definitions
Date: Thu, 30 Mar 2023 14:49:43 +0300
Message-Id: <20230330114956.20342-2-kirill.shutemov@linux.intel.com>
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

Replace multiple __pa()/__va() definitions with a single one in misc.h.

Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
Reviewed-by: David Hildenbrand <david@redhat.com>
Reviewed-by: Mike Rapoport <rppt@linux.ibm.com>
Reviewed-by: Dave Hansen <dave.hansen@linux.intel.com>
---
 arch/x86/boot/compressed/ident_map_64.c | 8 --------
 arch/x86/boot/compressed/misc.h         | 9 +++++++++
 arch/x86/boot/compressed/sev.c          | 2 --
 3 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/arch/x86/boot/compressed/ident_map_64.c b/arch/x86/boot/compressed/ident_map_64.c
index 321a5011042d..bcc956c17872 100644
--- a/arch/x86/boot/compressed/ident_map_64.c
+++ b/arch/x86/boot/compressed/ident_map_64.c
@@ -8,14 +8,6 @@
  * Copyright (C)      2016  Kees Cook
  */
 
-/*
- * Since we're dealing with identity mappings, physical and virtual
- * addresses are the same, so override these defines which are ultimately
- * used by the headers in misc.h.
- */
-#define __pa(x)  ((unsigned long)(x))
-#define __va(x)  ((void *)((unsigned long)(x)))
-
 /* No PAGE_TABLE_ISOLATION support needed either: */
 #undef CONFIG_PAGE_TABLE_ISOLATION
 
diff --git a/arch/x86/boot/compressed/misc.h b/arch/x86/boot/compressed/misc.h
index 20118fb7c53b..2f155a0e3041 100644
--- a/arch/x86/boot/compressed/misc.h
+++ b/arch/x86/boot/compressed/misc.h
@@ -19,6 +19,15 @@
 /* cpu_feature_enabled() cannot be used this early */
 #define USE_EARLY_PGTABLE_L5
 
+/*
+ * Boot stub deals with identity mappings, physical and virtual addresses are
+ * the same, so override these defines.
+ *
+ * <asm/page.h> will not define them if they are already defined.
+ */
+#define __pa(x)  ((unsigned long)(x))
+#define __va(x)  ((void *)((unsigned long)(x)))
+
 #include <linux/linkage.h>
 #include <linux/screen_info.h>
 #include <linux/elf.h>
diff --git a/arch/x86/boot/compressed/sev.c b/arch/x86/boot/compressed/sev.c
index d63ad8f99f83..014b89c89088 100644
--- a/arch/x86/boot/compressed/sev.c
+++ b/arch/x86/boot/compressed/sev.c
@@ -104,9 +104,7 @@ static enum es_result vc_read_mem(struct es_em_ctxt *ctxt,
 }
 
 #undef __init
-#undef __pa
 #define __init
-#define __pa(x)	((unsigned long)(x))
 
 #define __BOOT_COMPRESSED
 
-- 
2.39.2

