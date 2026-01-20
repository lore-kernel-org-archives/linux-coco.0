Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E22603D3300
	for <linux-coco@lists.linux.dev>; Tue, 20 Jan 2026 19:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768938891; cv=none; b=E7/2We3bK62mybt+a7N8RSEzxeydshixGOE1zKmqbPkX+mOhRkHEBVVUxbzn6IK6HzwO5PzWsjf0E6vvJ3na3EOiLpOFN+05vQYmf9jR6yZ98iCIgQ/kNyYCnaMghrgbWv47Qz9CqS514e+tlLIPm8eLmqUp081NDSUA1LxzgR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768938891; c=relaxed/simple;
	bh=pd088RQOhQt9hIGjmfzn4CJYQCYna96Bqw2lP4UCTWk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=smBStxw16LxCYKmP5gZxeTvFPpWLua8a/nCvdSSzsR2jlUEY4ZSMEywfYjFI0Q5JoBfDiSOqrIukpdhsobT1X2SPLzjd678/FFzol4z4Ewn2aArq/IIvX0udjhqGzWHs9eXNyJi9j1oou/Xx6uYkhHJn0RyZujnU3lsX4RU5yjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=K7G06s8s; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="K7G06s8s"
Received: from mail.zytor.com ([IPv6:2601:646:8081:9483:12c5:bc8e:d949:3497])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 60KJsD3E3899199
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Tue, 20 Jan 2026 11:54:25 -0800
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 60KJsD3E3899199
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025122301; t=1768938866;
	bh=0eZFuAsmIpe2g12/pjAj+iubg2rFoCHRAqhKjy60vdk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=K7G06s8s2eRuBZcImpUM9Z2KaHM88Uk5qTFtu2hghh/cgoZ/xjp2PoShXAeaVkh0i
	 2y+Xm2VLX/l2SvjNCAPnLKpjVbXTw0p9ZFUUsiDVj9noX9hkWhxaXMP3Kn7pbp81rC
	 Wfh2ssaYa1fyQ4ySQGNmG3SElmXH72Pqtt7bsy6aklVXRAypgKNAop0J30RI8v4ooF
	 1+dbDHIsfr4Oa0QeMoC8VAo3dzAoKxbZ7bf2k6AmoY2vK42IaUnJzqCgMfSyVrqWu2
	 hu6XcphwVC1s4MTolkTlW1+Hge96buuI6YaMWlCfnHTR3HeFN97b+sKbyEwxI2Lo95
	 c6UqRuwZk7OGQ==
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
Subject: [PATCH v1 07/14] x86/boot: factor out the 16-bit startup code from header.S
Date: Tue, 20 Jan 2026 11:53:59 -0800
Message-ID: <20260120195407.1163051-8-hpa@zytor.com>
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

Move the 16-bit startup code to its own assembly file, instead of
mixing it into header.S. header.S is now a pure data file.

This also means the .code16 directive is no longer needed for this
file.

Signed-off-by: H. Peter Anvin (Intel) <hpa@zytor.com>
---
 arch/x86/boot/Makefile  |   4 +-
 arch/x86/boot/header.S  |  91 +--------------------------------
 arch/x86/boot/start16.S | 108 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 112 insertions(+), 91 deletions(-)
 create mode 100644 arch/x86/boot/start16.S

diff --git a/arch/x86/boot/Makefile b/arch/x86/boot/Makefile
index 3f9fb3698d66..d7944bf196b9 100644
--- a/arch/x86/boot/Makefile
+++ b/arch/x86/boot/Makefile
@@ -22,8 +22,8 @@ subdir-		:= compressed
 
 setup-y		+= a20.o bioscall.o cmdline.o copy.o cpu.o cpuflags.o cpucheck.o
 setup-y		+= early_serial_console.o edd.o header.o main.o memory.o
-setup-y		+= pm.o pmjump.o printf.o regs.o string.o tty.o video.o
-setup-y		+= video-mode.o version.o
+setup-y		+= pm.o pmjump.o printf.o regs.o start16.o string.o tty.o
+setup-y		+= video.o video-mode.o version.o
 setup-$(CONFIG_X86_APM_BOOT) += apm.o
 
 # The link order of the video-*.o modules can matter.  In particular,
diff --git a/arch/x86/boot/header.S b/arch/x86/boot/header.S
index d74db02928e6..10b2971320f3 100644
--- a/arch/x86/boot/header.S
+++ b/arch/x86/boot/header.S
@@ -25,7 +25,6 @@
 #include "voffset.h"
 #include "zoffset.h"
 
-BOOTSEG		= 0x07C0		/* original address of boot-sector */
 SYSSEG		= 0x1000		/* historical load address >> 4 */
 
 #ifndef SVGA_MODE
@@ -39,8 +38,6 @@ SYSSEG		= 0x1000		/* historical load address >> 4 */
 	.set	salign, 0x1000
 	.set	falign, 0x200
 
-	.code16
-
 # EFI PECOFF header ##########################################################
 
 	.section ".header", "a"
@@ -277,6 +274,7 @@ type_of_loader:	.byte	0		# 0 means ancient bootloader, newer
 					# assigned ids
 
 # flags, unused bits must be zero (RFU) bit within loadflags
+		.globl	loadflags
 loadflags:
 		.byte	LOADED_HIGH	# The kernel is to be loaded high
 
@@ -301,6 +299,7 @@ ramdisk_size:	.long	0		# its size in bytes
 bootsect_kludge:
 		.long	0		# obsolete
 
+		.globl	heap_end_ptr
 heap_end_ptr:	.word	_end+STACK_SIZE-512
 					# (Header version 0x0201 or later)
 					# space from here (exclusive) down to
@@ -551,89 +550,3 @@ kernel_info_offset:	.long ZO_kernel_info
 end_of_bzheader:
 
 # End of bzImage header ######################################################
-
-	.section ".entrytext", "ax"
-	.globl start_of_setup
-start_of_setup:
-# Force %es = %ds
-	movw	%ds, %ax
-	movw	%ax, %es
-	cld
-
-# Apparently some ancient versions of LILO invoked the kernel with %ss != %ds,
-# which happened to work by accident for the old code.  Recalculate the stack
-# pointer if %ss is invalid.  Otherwise leave it alone, LOADLIN sets up the
-# stack behind its own code, so we can't blindly put it directly past the heap.
-
-	movw	%ss, %dx
-	cmpw	%ax, %dx	# %ds == %ss?
-	movw	%sp, %dx
-	je	2f		# -> assume %sp is reasonably set
-
-	# Invalid %ss, make up a new stack
-	movw	$_end, %dx
-	testb	$CAN_USE_HEAP, loadflags
-	jz	1f
-	movw	heap_end_ptr, %dx
-1:	addw	$STACK_SIZE, %dx
-	jnc	2f
-	xorw	%dx, %dx	# Prevent wraparound
-
-2:	# Now %dx should point to the end of our stack space
-	andw	$~3, %dx	# dword align (might as well...)
-	jnz	3f
-	movw	$0xfffc, %dx	# Make sure we're not zero
-3:	movw	%ax, %ss
-	movzwl	%dx, %esp	# Clear upper half of %esp
-	sti			# Now we should have a working stack
-
-# We will have entered with %cs = %ds+0x20, normalize %cs so
-# it is on par with the other segments.
-	pushw	%ds
-	pushw	$6f
-	lretw
-6:
-
-# Check signature at end of setup
-SETUP_SIGNATURE = 0x5a5aaa55
-	cmpl	$SETUP_SIGNATURE, setup_sig
-	jne	setup_bad
-
-# Zero the bss
-	movw	$__bss_start, %di
-	movw	$_end+3, %cx
-	xorl	%eax, %eax
-	subw	%di, %cx
-	shrw	$2, %cx
-	rep stosl
-
-# The C code uses %gs == 0 as invariant
-	movw	%ax, %gs
-
-# Jump to C code (should not return)
-	calll	main
-
-# Setup corrupt somehow...
-setup_bad:
-	movl	$setup_corrupt, %eax
-	# Fall through...
-
-	.globl	die
-	.type	die, @function
-die:
-	calll	puts
-1:
-	hlt
-	jmp	1b
-
-	.size	die, .-die
-
-	.section ".initdata", "a"
-setup_corrupt:
-	.byte	7
-	.string	"No setup signature found...\n"
-
-	.section ".signature", "a"
-	.balign 4
-setup_sig:
-	.long SETUP_SIGNATURE
diff --git a/arch/x86/boot/start16.S b/arch/x86/boot/start16.S
new file mode 100644
index 000000000000..3381dc0f4065
--- /dev/null
+++ b/arch/x86/boot/start16.S
@@ -0,0 +1,108 @@
+/*
+ * start16.S
+ *
+ *	Copyright (C) 1991, 1992 Linus Torvalds
+ *
+ *	Based on bootsect.S and setup.S
+ *	modified by more people than can be counted
+ *
+ *	Rewritten as a common file by H. Peter Anvin (Apr 2007)
+ *
+ * BIG FAT NOTE: We're in real mode using 64k segments.  Therefore segment
+ * addresses must be multiplied by 16 to obtain their respective linear
+ * addresses. To avoid confusion, linear addresses are written using leading
+ * hex while segment addresses are written as segment:offset.
+ *
+ * This code must *immediately* follow the bzImage header, so DO NOT
+ * add alignment directives anywhere in the .entrytext section!
+ */
+
+#include <asm/bootparam.h>
+#include "boot.h"
+
+	.code16
+	.section ".entrytext", "ax"
+	.globl start_of_setup
+start_of_setup:
+# Force %es = %ds
+	movw	%ds, %ax
+	movw	%ax, %es
+	cld
+
+# Apparently some ancient versions of LILO invoked the kernel with %ss != %ds,
+# which happened to work by accident for the old code.  Recalculate the stack
+# pointer if %ss is invalid.  Otherwise leave it alone, LOADLIN sets up the
+# stack behind its own code, so we can't blindly put it directly past the heap.
+
+	movw	%ss, %dx
+	cmpw	%ax, %dx	# %ds == %ss?
+	movw	%sp, %dx
+	je	2f		# -> assume %sp is reasonably set
+
+	# Invalid %ss, make up a new stack
+	movw	$_end, %dx
+	testb	$CAN_USE_HEAP, loadflags
+	jz	1f
+	movw	heap_end_ptr, %dx
+1:	addw	$STACK_SIZE, %dx
+	jnc	2f
+	xorw	%dx, %dx	# Prevent wraparound
+
+2:	# Now %dx should point to the end of our stack space
+	andw	$~3, %dx	# dword align (might as well...)
+	jnz	3f
+	movw	$0xfffc, %dx	# Make sure we're not zero
+3:	movw	%ax, %ss
+	movzwl	%dx, %esp	# Clear upper half of %esp
+	sti			# Now we should have a working stack
+
+# We will have entered with %cs = %ds+0x20, normalize %cs so
+# it is on par with the other segments.
+	pushw	%ds
+	pushw	$6f
+	lretw
+6:
+
+# Check signature at end of setup
+SETUP_SIGNATURE = 0x5a5aaa55
+	cmpl	$SETUP_SIGNATURE, setup_sig
+	jne	setup_bad
+
+# Zero the bss
+	movw	$__bss_start, %di
+	movw	$_end+3, %cx
+	xorl	%eax, %eax
+	subw	%di, %cx
+	shrw	$2, %cx
+	rep stosl
+
+# The C code uses %gs == 0 as invariant
+	movw	%ax, %gs
+
+# Jump to C code (should not return)
+	calll	main
+
+# Setup corrupt somehow...
+setup_bad:
+	movl	$setup_corrupt, %eax
+	# Fall through...
+
+	.globl	die
+	.type	die, @function
+die:
+	calll	puts
+1:
+	hlt
+	jmp	1b
+
+	.size	die, .-die
+
+	.section ".initdata", "a"
+setup_corrupt:
+	.byte	7
+	.string	"No setup signature found...\n"
+
+	.section ".signature", "a"
+	.balign 4
+setup_sig:
+	.long SETUP_SIGNATURE
-- 
2.52.0

