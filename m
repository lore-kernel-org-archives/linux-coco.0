Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6464E3A0EA8
	for <linux-coco@lists.linux.dev>; Tue, 20 Jan 2026 19:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768938889; cv=none; b=E0J1RhP70QG4yIPCn/cvy2XhivP4GgXOy49zeuPRnDXphJP752L83N2igLS92TwlPLQZpGyMyK/MIe2A594dNxU6raH0nqHaIo6EO+qW/uGNLKHGeRxTUBJ4xrqzyXxfSmAvJsUHjQpdk8NtdVErtsNimt1LLAy7twngrpLmjZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768938889; c=relaxed/simple;
	bh=7uKuifd5hg9zyYE+Th7mxjry6UYrnyLf5x6U9gCahbs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WLm22gdkmoL2s6LZP0cYuimtUONLMO879RA3InoGOcN5XmimvCeL6kmJEO357NN8H27DJKkMuZ3Tpyp6clPt/e7EwfE111YZE8PbL59MEn2j2SYYaS5nR+7XMumk+MkHvdoskkinwChzDGxycBlJW/JIIS5JslMxIZOH0DkIAOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=MyBJauUR; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="MyBJauUR"
Received: from mail.zytor.com ([IPv6:2601:646:8081:9483:12c5:bc8e:d949:3497])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 60KJsD383899199
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Tue, 20 Jan 2026 11:54:15 -0800
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 60KJsD383899199
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025122301; t=1768938858;
	bh=2Jsmp6SNJo0r+L2zMO/RO98Z1QirHh+gFi5n8Bhoc0o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MyBJauURVSbGI9VA/glfPxaFZmpMmE/H+GadkKxlRAg36BsvZndBKJgTCs3rn5cod
	 YGhbvTH4Y63zWL2j19MMQMulwwiGRvkx4AqKzkuu3lSuMa9RecaHhV89+EXzz0AQMW
	 91/QgYutgVO/FRFh8mNzFpAJPvHhSdxbx8sTd0FIJy0Y9txcMKiIWKFXg14dSFQ7kz
	 voPLLH/HYD7tr7LsUtnfGQUoVk2eXqXJpX8I98AOHKwQGBxgFvOUEh1EazRXZoMpKT
	 p2AeJX5KmwnpYYJVa0N73MFIP+59sZ4suGFCKWUfhHlJslxah28seI5rVIX1b270j3
	 m2ZmBD36fkLqg==
From: "H. Peter Anvin" <hpa@zytor.com>
To: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
        Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Uros Bizjak <ubizjak@gmail.com>, Petr Mladek <pmladek@suse.com>,
        Andrew Morton <akpm@linux-foundation.org>, Kees Cook <kees@kernel.org>,
        "Peter Zijlstra (Intel)" <peterz@infradead.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Kiryl Shutsemau <kas@kernel.org>,
        Rick Edgecombe <rick.p.edgecombe@intel.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org,
        linux-coco@lists.linux.dev, x86@kernel.org
Subject: [PATCH v1 01/14] x86/realmode: remove I/O port paravirtualization
Date: Tue, 20 Jan 2026 11:53:53 -0800
Message-ID: <20260120195407.1163051-2-hpa@zytor.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260120195407.1163051-1-hpa@zytor.com>
References: <20260119192923.651588-1-hpa@zytor.com>
 <20260120195407.1163051-1-hpa@zytor.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In commit:

eb4ea1ae8f45 x86/boot: Port I/O: Allow to hook up alternative helpers

... paravirtualization hooks were added to (some!) of the port I/O
functions. However, they were only ever used in the 32/64-bit
"compressed" directory, and never made any sense in the real-mode
code, which is notoriously size sensitive.

Without these hooks, <asm/shared/io.h> is usable directly, so mode
io.h into the compressed/ directory and replace "io.h" with
<asm/shared/io.h> for the actual real-mode code.

Signed-off-by: H. Peter Anvin (Intel) <hpa@zytor.com>
---
 arch/x86/boot/boot.h                | 2 +-
 arch/x86/boot/{ => compressed}/io.h | 0
 arch/x86/boot/compressed/misc.h     | 2 +-
 arch/x86/boot/compressed/tdx.c      | 2 +-
 arch/x86/boot/main.c                | 5 +----
 arch/x86/realmode/rm/wakemain.c     | 4 ----
 6 files changed, 4 insertions(+), 11 deletions(-)
 rename arch/x86/boot/{ => compressed}/io.h (100%)

diff --git a/arch/x86/boot/boot.h b/arch/x86/boot/boot.h
index 8e3eab34dff4..f185931283cb 100644
--- a/arch/x86/boot/boot.h
+++ b/arch/x86/boot/boot.h
@@ -18,6 +18,7 @@
 
 #ifndef __ASSEMBLER__
 
+#include <asm/shared/io.h>
 #include <linux/stdarg.h>
 #include <linux/types.h>
 #include <linux/edd.h>
@@ -26,7 +27,6 @@
 #include "bitops.h"
 #include "ctype.h"
 #include "cpuflags.h"
-#include "io.h"
 
 /* Useful macros */
 #define ARRAY_SIZE(x) (sizeof(x) / sizeof(*(x)))
diff --git a/arch/x86/boot/io.h b/arch/x86/boot/compressed/io.h
similarity index 100%
rename from arch/x86/boot/io.h
rename to arch/x86/boot/compressed/io.h
diff --git a/arch/x86/boot/compressed/misc.h b/arch/x86/boot/compressed/misc.h
index fd855e32c9b9..68957e7698ad 100644
--- a/arch/x86/boot/compressed/misc.h
+++ b/arch/x86/boot/compressed/misc.h
@@ -43,8 +43,8 @@
 
 #define BOOT_BOOT_H
 #include "../ctype.h"
-#include "../io.h"
 
+#include "io.h"
 #include "efi.h"
 
 #ifdef CONFIG_X86_64
diff --git a/arch/x86/boot/compressed/tdx.c b/arch/x86/boot/compressed/tdx.c
index 8451d6a1030c..00359dbe1f8c 100644
--- a/arch/x86/boot/compressed/tdx.c
+++ b/arch/x86/boot/compressed/tdx.c
@@ -2,7 +2,7 @@
 
 #include "../cpuflags.h"
 #include "../string.h"
-#include "../io.h"
+#include "io.h"
 #include "error.h"
 
 #include <vdso/limits.h>
diff --git a/arch/x86/boot/main.c b/arch/x86/boot/main.c
index 9d0fea18d3c8..da01ade4959e 100644
--- a/arch/x86/boot/main.c
+++ b/arch/x86/boot/main.c
@@ -15,10 +15,9 @@
 #include "boot.h"
 #include "string.h"
 
+/* Buffer for building the full "zero page" struct boot_params */
 struct boot_params boot_params __attribute__((aligned(16)));
 
-struct port_io_ops pio_ops;
-
 char *HEAP = _end;
 char *heap_end = _end;		/* Default end of heap = no heap */
 
@@ -132,8 +131,6 @@ static void init_heap(void)
 
 void main(void)
 {
-	init_default_io_ops();
-
 	/* First, copy the boot header into the "zeropage" */
 	copy_boot_params();
 
diff --git a/arch/x86/realmode/rm/wakemain.c b/arch/x86/realmode/rm/wakemain.c
index a6f4d8388ad8..1d6437e6d2ba 100644
--- a/arch/x86/realmode/rm/wakemain.c
+++ b/arch/x86/realmode/rm/wakemain.c
@@ -62,12 +62,8 @@ static void send_morse(const char *pattern)
 	}
 }
 
-struct port_io_ops pio_ops;
-
 void main(void)
 {
-	init_default_io_ops();
-
 	/* Kill machine if structures are wrong */
 	if (wakeup_header.real_magic != 0x12345678)
 		while (1)
-- 
2.52.0

