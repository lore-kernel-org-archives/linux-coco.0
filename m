Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F30183A35C7
	for <linux-coco@lists.linux.dev>; Tue, 20 Jan 2026 19:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768938899; cv=none; b=tR5lbkDJJ7Kx3Ev8jodNQAZwYSteuteqsjmIlCQqR+yIuhJolsHI8SHAJBN2lT9Q3Jg+7h9vwCGuh0bl2u+D0y4LxGw1bDZDZeQelEWHhGyrUCiZHao3qEM74TQblCtFRdmsbPuUzp7Ln0rh1ChSm58OILL10swmh0rlnEIeGgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768938899; c=relaxed/simple;
	bh=PO0hGbN2ynfz/Y+hYIP3Oh8rREwwpXUxS8eYSpOTHVQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h1xa/9ociwDoXY3bjDNUHdswigFEsnIdsI1FK1kPUiqsBTZRXr1LJpsoDCpydHajnLGIxWFPekd02zjXMJ+0zkU4N/4+L+yuvs38h7bb+ZjT9iQngFxIJaI94jm8BTqsE7/E60i15xtj117dSC8+TGOkI0+L9AapMW+TJv/sCT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=M3w8slqo; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="M3w8slqo"
Received: from mail.zytor.com ([IPv6:2601:646:8081:9483:12c5:bc8e:d949:3497])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 60KJsD3K3899199
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Tue, 20 Jan 2026 11:54:34 -0800
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 60KJsD3K3899199
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025122301; t=1768938875;
	bh=Dihytth6aKxCRMsnZBclFnIJrpl/fWy7Q1FJHQ/RCb0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=M3w8slqoNIStG4BFVaWRapoq0fQ4BxKe0sVMCuGxtQwVxr4sy9lin/6VUHFdb2X9D
	 3AZzmAhF2xpRFhRoQMc7E2IX4WZVy1OvnEKs5PYP/k10NubmO5SdC/c4N+tFvBZGaa
	 ub7OYhfxUbZsDGZysLdgwSjGtMU4R+Ia8m0xwsDhRuDABItbg/cWfXzXgQXtjTJjGS
	 Da35nZxqsV+xQctqvt0ajCErJc/vdc8RUsZwnhTCV5jPwPGmAF3NqzuQh4onNeKvW1
	 +BWxajcQ3VLPlkewYTWYOxGXEPOqVlBXAu2I3pHN0VGxXcTeoU2rKaBnj1at774d9W
	 Uma5ZvabL1UOg==
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
Subject: [PATCH v1 13/14] x86/boot: simplify x86/boot/cmdline.c by using __seg_fs
Date: Tue, 20 Jan 2026 11:54:05 -0800
Message-ID: <20260120195407.1163051-14-hpa@zytor.com>
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

arch/x86/boot/cmdline.c is compiled in 16, 32, or 64-bit mode. In the
16-bit case it needs to access an out-of-data-segment pointer.

This has been handled in the past by using a *really* ugly wrapper in
the 32/64-bit code combined with an inline function in the 16-bit code.

Using __seg_fs for the real-mode case allows for a much cleaner way of
handling this difference. Futhermore, moving the code for typing and
obtaining the pointer into cmdline.c itself avoids having to create
and push an extra argument, which is particularly inefficient in the
real-mode code as it requires a range check and pushes the argument
count past 3. Furthermore, co-locating this code with the user makes it
a lot clearer what the constraints are on this code, even though it
means using #ifdef _SETUP.

Instead of limit-checking the command line to the real-mode segment
limit, limit-check it to COMMAND_LINE_SIZE (which is always less than
64K, and thus automatically incorporates the real-mode segment limit
check.)

If compiling for 32 bits, trying to add ext_cmd_line_ptr in
get_cmd_line_ptr() is futile as unsigned long, and pointers, are only
32 bits wide. Instead, limit-check the command line pointer and fail
if it is >= 4 GiB, just as the real-mode code fails if the pointer is
>= 1 MiB.

Since the kaslr code depends on get_cmd_line_ptr(), retain it as a
global function.

Signed-off-by: H. Peter Anvin (Intel) <hpa@zytor.com>
---
 arch/x86/boot/boot.h               | 23 +--------
 arch/x86/boot/cmdline.c            | 79 +++++++++++++++++++++++-------
 arch/x86/boot/compressed/cmdline.c | 29 -----------
 3 files changed, 64 insertions(+), 67 deletions(-)

diff --git a/arch/x86/boot/boot.h b/arch/x86/boot/boot.h
index 584c89d0738b..8512db8b3f8e 100644
--- a/arch/x86/boot/boot.h
+++ b/arch/x86/boot/boot.h
@@ -216,27 +216,8 @@ struct biosregs {
 void intcall(u8 int_no, const struct biosregs *ireg, struct biosregs *oreg);
 
 /* cmdline.c */
-int __cmdline_find_option(unsigned long cmdline_ptr, const char *option, char *buffer, int bufsize);
-int __cmdline_find_option_bool(unsigned long cmdline_ptr, const char *option);
-static inline int cmdline_find_option(const char *option, char *buffer, int bufsize)
-{
-	unsigned long cmd_line_ptr = boot_params.hdr.cmd_line_ptr;
-
-	if (cmd_line_ptr >= 0x100000)
-		return -1;      /* inaccessible */
-
-	return __cmdline_find_option(cmd_line_ptr, option, buffer, bufsize);
-}
-
-static inline int cmdline_find_option_bool(const char *option)
-{
-	unsigned long cmd_line_ptr = boot_params.hdr.cmd_line_ptr;
-
-	if (cmd_line_ptr >= 0x100000)
-		return -1;      /* inaccessible */
-
-	return __cmdline_find_option_bool(cmd_line_ptr, option);
-}
+int cmdline_find_option(const char *option, char *buffer, int bufsize);
+int cmdline_find_option_bool(const char *option);
 
 /* cpu.c, cpucheck.c */
 int check_cpu(int *cpu_level_ptr, int *req_level_ptr, u32 **err_flags_ptr);
diff --git a/arch/x86/boot/cmdline.c b/arch/x86/boot/cmdline.c
index 21d56ae83cdf..3f31fcbed673 100644
--- a/arch/x86/boot/cmdline.c
+++ b/arch/x86/boot/cmdline.c
@@ -11,12 +11,59 @@
  */
 
 #include "boot.h"
+#include <asm/setup.h>
+#include <asm/bootparam.h>
 
 static inline int myisspace(u8 c)
 {
 	return c <= ' ';	/* Close enough approximation */
 }
 
+#ifdef _SETUP
+typedef const char __seg_fs *cptr_t;
+static inline cptr_t get_cptr(void)
+{
+	/*
+	 * Note: there is no reason to check ext_cmd_line_ptr here,
+	 * because it falls outside of boot_params.hdr and therefore
+	 * will always be zero when entering through the real-mode
+	 * entry point.
+	 */
+	unsigned long ptr = boot_params.hdr.cmd_line_ptr;
+
+	/*
+	 * The -16 here serves two purposes:
+	 * 1. It means the segbase >= 0x100000 check also doubles as
+	 *    a check for the command line pointer being zero.
+	 * 2. It means this routine won't return a NULL pointer for
+	 *    a valid address; it will always return a pointer in the
+	 *    range 0x10-0x1f inclusive.
+	 */
+	unsigned long segbase = (ptr - 16) & ~15;
+	if (segbase >= 0x100000)
+		return NULL;
+
+	set_fs(segbase >> 4);
+	return (cptr_t)(ptr - segbase);
+}
+#else
+unsigned long get_cmd_line_ptr(void)
+{
+	unsigned long ptr = boot_params_ptr->hdr.cmd_line_ptr;
+	if (sizeof(unsigned long) > 4)
+		ptr += (u64)boot_params_ptr->ext_cmd_line_ptr << 32;
+	else if (boot_params_ptr->ext_cmd_line_ptr)
+		return 0;	/* Inaccessible due to pointer overflow */
+
+	return ptr;
+}
+typedef const char *cptr_t;
+static inline cptr_t get_cptr(void)
+{
+	return (cptr_t)get_cmd_line_ptr();
+}
+#endif
+
 /*
  * Find a non-boolean option, that is, "option=argument".  In accordance
  * with standard Linux practice, if this option is repeated, this returns
@@ -25,9 +72,9 @@ static inline int myisspace(u8 c)
  * Returns the length of the argument (regardless of if it was
  * truncated to fit in the buffer), or -1 on not found.
  */
-int __cmdline_find_option(unsigned long cmdline_ptr, const char *option, char *buffer, int bufsize)
+int cmdline_find_option(const char *option, char *buffer, int bufsize)
 {
-	addr_t cptr;
+	cptr_t cptr, eptr;
 	char c;
 	int len = -1;
 	const char *opptr = NULL;
@@ -39,13 +86,12 @@ int __cmdline_find_option(unsigned long cmdline_ptr, const char *option, char *b
 		st_bufcpy	/* Copying this to buffer */
 	} state = st_wordstart;
 
-	if (!cmdline_ptr)
-		return -1;      /* No command line */
+	cptr = get_cptr();
+	if (!cptr)
+		return -1;	/* No command line or invalid pointer */
+	eptr = cptr + COMMAND_LINE_SIZE - 1;
 
-	cptr = cmdline_ptr & 0xf;
-	set_fs(cmdline_ptr >> 4);
-
-	while (cptr < 0x10000 && (c = rdfs8(cptr++))) {
+	while (cptr < eptr && (c = *cptr++)) {
 		switch (state) {
 		case st_wordstart:
 			if (myisspace(c))
@@ -97,9 +143,9 @@ int __cmdline_find_option(unsigned long cmdline_ptr, const char *option, char *b
  * Returns the position of that option (starts counting with 1)
  * or 0 on not found
  */
-int __cmdline_find_option_bool(unsigned long cmdline_ptr, const char *option)
+int cmdline_find_option_bool(const char *option)
 {
-	addr_t cptr;
+	cptr_t cptr, eptr;
 	char c;
 	int pos = 0, wstart = 0;
 	const char *opptr = NULL;
@@ -109,14 +155,13 @@ int __cmdline_find_option_bool(unsigned long cmdline_ptr, const char *option)
 		st_wordskip,	/* Miscompare, skip */
 	} state = st_wordstart;
 
-	if (!cmdline_ptr)
-		return -1;      /* No command line */
-
-	cptr = cmdline_ptr & 0xf;
-	set_fs(cmdline_ptr >> 4);
+	cptr = get_cptr();
+	if (!cptr)
+		return -1;	/* No command line or invalid pointer */
+	eptr = cptr + COMMAND_LINE_SIZE - 1;
 
-	while (cptr < 0x10000) {
-		c = rdfs8(cptr++);
+	while (cptr <= eptr) {
+		c = *cptr++;
 		pos++;
 
 		switch (state) {
diff --git a/arch/x86/boot/compressed/cmdline.c b/arch/x86/boot/compressed/cmdline.c
index e162d7f59cc5..0d9267a21012 100644
--- a/arch/x86/boot/compressed/cmdline.c
+++ b/arch/x86/boot/compressed/cmdline.c
@@ -1,32 +1,3 @@
 // SPDX-License-Identifier: GPL-2.0
 #include "misc.h"
-
-#include <asm/bootparam.h>
-
-static unsigned long fs;
-static inline void set_fs(unsigned long seg)
-{
-	fs = seg << 4;  /* shift it back */
-}
-typedef unsigned long addr_t;
-static inline char rdfs8(addr_t addr)
-{
-	return *((char *)(fs + addr));
-}
 #include "../cmdline.c"
-unsigned long get_cmd_line_ptr(void)
-{
-	unsigned long cmd_line_ptr = boot_params_ptr->hdr.cmd_line_ptr;
-
-	cmd_line_ptr |= (u64)boot_params_ptr->ext_cmd_line_ptr << 32;
-
-	return cmd_line_ptr;
-}
-int cmdline_find_option(const char *option, char *buffer, int bufsize)
-{
-	return __cmdline_find_option(get_cmd_line_ptr(), option, buffer, bufsize);
-}
-int cmdline_find_option_bool(const char *option)
-{
-	return __cmdline_find_option_bool(get_cmd_line_ptr(), option);
-}
-- 
2.52.0

