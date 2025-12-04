Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C054F334682;
	Thu,  4 Dec 2025 12:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764852495; cv=none; b=s2LD/0P4af8CwX0nS0DVb5Meiy1eejhvMkq/CcfopTDJM7dAV1Eeq2D7RrwToCsIqC/ssgEDrNAQ6nZmMc8p5wez+dLGBPqhnjroaC1W/7h1lyOBHGdRVNmK1Z/tgr4gVdESSxO9bVarTjvn9SfKjHQr8ngxSvpWxAj3odjnVRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764852495; c=relaxed/simple;
	bh=aDqKhKCCVuc96gXN+L5vh9bVr7R6UyTmFvJ1fAa4DzU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VNBNcd7NwMJqOys3FSpuN/zJdfihfL02tZ1PizARG1FnvGCe2fSCBWZt7TQdmBP08ESi3PQjx3kFIbA9QU92khgyE8m8kBGki+wS3nCrx1JRMkLE4++k6D9D+YS0NY64P3aNeUSVA/AjtHZEdLWScbYY5/YPLNuEAIEfMpJG2BE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fGrRUbwB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fGrRUbwB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E7CEC116C6;
	Thu,  4 Dec 2025 12:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764852495;
	bh=aDqKhKCCVuc96gXN+L5vh9bVr7R6UyTmFvJ1fAa4DzU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fGrRUbwBHn4GQ0zPLDQMvFDE93L8T3ngXtG3VZXtXJARCqrOxkYixvLmZVF5T8UF/
	 gTSz4j8Kmc7IZ3OI0xTCY2hJ5q0HG8mpY1XjbzbSHqT28FX/oBYjPKNq+CB4IxqMuW
	 XmOZ16uiGKyYT+9186UshpZrMK2TkNQgkE7yx4jy1hLI8ri9nq5eZK7JYNX7gumRA9
	 MIbkqu/44+MDWIw/3yc2m2Z3uJ7SXqSd8yx6TJTTvt5LNLbPjOs/BqDtuoHJt9Mzh4
	 Av4Iil9NrnKN3OXWYqiJ+soumt7RMAgpVja/wqP2aCwi1969PapQ0TlSeqiWrtcDkj
	 pESLOtRDI5uuQ==
From: Borislav Petkov <bp@kernel.org>
To: Tom Lendacky <thomas.lendacky@amd.com>
Cc: <linux-coco@lists.linux.dev>,
	X86 ML <x86@kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	"Borislav Petkov (AMD)" <bp@alien8.de>
Subject: [PATCH 1/3] x86/sev: Move the internal header
Date: Thu,  4 Dec 2025 13:48:06 +0100
Message-ID: <20251204124809.31783-2-bp@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251204124809.31783-1-bp@kernel.org>
References: <20251204124809.31783-1-bp@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Borislav Petkov (AMD)" <bp@alien8.de>

Move the internal header out of the usual include/asm/ include path
because having an "internal" header there doesn't really make it so
- quite the opposite.

So move where it belongs and make it really internal.

No functional changes.

Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>
---
 arch/x86/boot/startup/sev-startup.c                          | 3 ++-
 arch/x86/coco/sev/core.c                                     | 3 ++-
 arch/x86/{include/asm/sev-internal.h => coco/sev/internal.h} | 0
 arch/x86/coco/sev/noinstr.c                                  | 3 ++-
 arch/x86/coco/sev/vc-handle.c                                | 3 ++-
 5 files changed, 8 insertions(+), 4 deletions(-)
 rename arch/x86/{include/asm/sev-internal.h => coco/sev/internal.h} (100%)

diff --git a/arch/x86/boot/startup/sev-startup.c b/arch/x86/boot/startup/sev-startup.c
index 09725428d3e6..1115214429fd 100644
--- a/arch/x86/boot/startup/sev-startup.c
+++ b/arch/x86/boot/startup/sev-startup.c
@@ -27,7 +27,6 @@
 #include <asm/cpu_entry_area.h>
 #include <asm/stacktrace.h>
 #include <asm/sev.h>
-#include <asm/sev-internal.h>
 #include <asm/insn-eval.h>
 #include <asm/fpu/xcr.h>
 #include <asm/processor.h>
@@ -41,6 +40,8 @@
 #include <asm/cpuid/api.h>
 #include <asm/cmdline.h>
 
+#include "../coco/sev/internal.h"
+
 /* Include code shared with pre-decompression boot stage */
 #include "sev-shared.c"
 
diff --git a/arch/x86/coco/sev/core.c b/arch/x86/coco/sev/core.c
index 9ae3b11754e6..4e618e596267 100644
--- a/arch/x86/coco/sev/core.c
+++ b/arch/x86/coco/sev/core.c
@@ -31,7 +31,6 @@
 #include <asm/cpu_entry_area.h>
 #include <asm/stacktrace.h>
 #include <asm/sev.h>
-#include <asm/sev-internal.h>
 #include <asm/insn-eval.h>
 #include <asm/fpu/xcr.h>
 #include <asm/processor.h>
@@ -46,6 +45,8 @@
 #include <asm/cmdline.h>
 #include <asm/msr.h>
 
+#include "internal.h"
+
 /* Bitmap of SEV features supported by the hypervisor */
 u64 sev_hv_features __ro_after_init;
 SYM_PIC_ALIAS(sev_hv_features);
diff --git a/arch/x86/include/asm/sev-internal.h b/arch/x86/coco/sev/internal.h
similarity index 100%
rename from arch/x86/include/asm/sev-internal.h
rename to arch/x86/coco/sev/internal.h
diff --git a/arch/x86/coco/sev/noinstr.c b/arch/x86/coco/sev/noinstr.c
index b527eafb6312..9d94aca4a698 100644
--- a/arch/x86/coco/sev/noinstr.c
+++ b/arch/x86/coco/sev/noinstr.c
@@ -16,7 +16,8 @@
 #include <asm/msr.h>
 #include <asm/ptrace.h>
 #include <asm/sev.h>
-#include <asm/sev-internal.h>
+
+#include "internal.h"
 
 static __always_inline bool on_vc_stack(struct pt_regs *regs)
 {
diff --git a/arch/x86/coco/sev/vc-handle.c b/arch/x86/coco/sev/vc-handle.c
index f08c7505ed82..43f264afd590 100644
--- a/arch/x86/coco/sev/vc-handle.c
+++ b/arch/x86/coco/sev/vc-handle.c
@@ -23,7 +23,6 @@
 #include <asm/init.h>
 #include <asm/stacktrace.h>
 #include <asm/sev.h>
-#include <asm/sev-internal.h>
 #include <asm/insn-eval.h>
 #include <asm/fpu/xcr.h>
 #include <asm/processor.h>
@@ -35,6 +34,8 @@
 #include <asm/apic.h>
 #include <asm/cpuid/api.h>
 
+#include "internal.h"
+
 static enum es_result vc_slow_virt_to_phys(struct ghcb *ghcb, struct es_em_ctxt *ctxt,
 					   unsigned long vaddr, phys_addr_t *paddr)
 {
-- 
2.51.0

