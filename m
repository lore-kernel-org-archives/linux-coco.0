Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65E813A0EA8
	for <linux-coco@lists.linux.dev>; Tue, 20 Jan 2026 19:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768938894; cv=none; b=pvFn2FIJTqrL3C5NUy/TFjxRYO5YBeLeahA4mnGfv0i242Kz0yE2x4sbeIsRmajwgWDyRQ309FKVnMpPVMnrAEKOxKj3sDmExtLCLByrYRhjNWmAfHSNFCM1ISmMeX9S+BTb+o9CudE3SlsDjv9KER+f3OXFvNgK6C+Tj6TIHXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768938894; c=relaxed/simple;
	bh=MveQi5l0YQ7OLkSuW8oRirePVaw/kJlAsYs/pcnpNm0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uWWo9sVU9/a68vGbGFgDkua2UIiTQyjo7DiLAus0D7b/kB5Lmfj9z+4JKpnsCKdUN2IhlEUKswZV7H+QssJdO6JfmHe2tX9I7YGk+fl+Fd36IU6kCvV/Sd1Hv2hfzq0qtvFuPo0YsSt+dB0bqoxnY+E4Q5JOw2UR3F4+ke/XvyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=DcVcbmQ+; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="DcVcbmQ+"
Received: from mail.zytor.com ([IPv6:2601:646:8081:9483:12c5:bc8e:d949:3497])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 60KJsD3B3899199
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Tue, 20 Jan 2026 11:54:22 -0800
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 60KJsD3B3899199
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025122301; t=1768938863;
	bh=JqbF6ot1ZgQZZaR0bZSta5QNoXS+I8M4O8vH2t5f5pE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DcVcbmQ+A9Ddrx2QIL0KnMREyFL66kVXtTojdTPj1XFieFitAjAsjTbHq2NNlVJ63
	 9cCjmbEfeuH3ndeVu5kZNxKdIvoM+sBs+avloJSM2CBjcgrAXYlOiQIOrNxoSzjE5x
	 hsXkyRtK4NLZjD1oknYtg8DwWYktmcGUXc2+MVK6NuUCdUY3H+0bW7R/SirPkDhK4x
	 6YemCXS3e5JyCzhmEc0fplzRM3/GFA6TGv3/OPZk308I/FcmESMyQfUSLi9PBOoLbk
	 En5q+KtnIE7qPyJhs29Fnd4dEWCJSB7Ht3EElLJ7H9wb4AGtx9PF1o9HTY4JCwFn3X
	 erwRQCaJ1UfOQ==
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
Subject: [PATCH v1 04/14] x86/boot: modernize the segment structure for the header and setup
Date: Tue, 20 Jan 2026 11:53:56 -0800
Message-ID: <20260120195407.1163051-5-hpa@zytor.com>
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

Modernize the segment structure for the EFI and bzImage headers and
the 16-bit setup.

1. The ".bstext" section (EFI header) has not had code in it for a
   while now. Merge it into the .header section.
2. Move the contents of the .signature section to assembly rather than
   the linker script. As a side benefit, the magic number is now
   private to header.S.
3. Add additional asserts to the linker script.
4. Fill gaps in code sections with int3 instead of nop.

Signed-off-by: H. Peter Anvin (Intel) <hpa@zytor.com>
---
 arch/x86/boot/header.S | 27 +++++++++++++++++++--------
 arch/x86/boot/setup.ld | 26 ++++++++++++--------------
 2 files changed, 31 insertions(+), 22 deletions(-)

diff --git a/arch/x86/boot/header.S b/arch/x86/boot/header.S
index bda20395658f..85a21d576f5b 100644
--- a/arch/x86/boot/header.S
+++ b/arch/x86/boot/header.S
@@ -40,7 +40,7 @@ SYSSEG		= 0x1000		/* historical load address >> 4 */
 	.set	falign, 0x200
 
 	.code16
-	.section ".bstext", "ax"
+	.section ".header", "a"
 #ifdef CONFIG_EFI_STUB
 	# "MZ", MS-DOS header
 	.word	IMAGE_DOS_SIGNATURE
@@ -221,15 +221,16 @@ pecompat_fstart:
 		IMAGE_SCN_MEM_WRITE		# Characteristics
 
 	.set	section_count, (. - section_table) / 40
+
 #endif /* CONFIG_EFI_STUB */
 
-	# Kernel attributes; used by setup.  This is part 1 of the
-	# header, from the old boot sector.
+	# hdr should be at address 0x1f1; -2 for the sentinel
+	.org	0x1f1-2, 0xff			# Fill with 0xff
 
-	.section ".header", "a"
 	.globl	sentinel
 sentinel:	.byte 0xff, 0xff        /* Used to detect broken loaders */
 
+	# The bzImage struct setup_header
 	.globl	hdr
 hdr:
 		.byte setup_sects - 1
@@ -240,15 +241,15 @@ vid_mode:	.word SVGA_MODE
 root_dev:	.word 0			/* Default to major/minor 0/0 */
 boot_flag:	.word 0xAA55
 
-	# offset 512, entry point
+	# offset 512, entry point AND struct setup_header length marker
 
 	.globl	_start
 _start:
 		# Explicitly enter this as bytes, or the assembler
-		# tries to generate a 3-byte jump here, which causes
+		# might try to generate a 3-byte jump here, which causes
 		# everything else to push off to the wrong offset.
 		.byte	0xeb		# short (2-byte) jump
-		.byte	start_of_setup-1f
+		.byte	end_of_bzheader-1f
 1:
 
 	# Part 2 of the header, from the old setup.S
@@ -541,9 +542,13 @@ init_size:		.long INIT_SIZE		# kernel initialization size
 handover_offset:	__handover_offset
 kernel_info_offset:	.long ZO_kernel_info
 
+	.globl end_of_bzheader
+end_of_bzheader:
+
 # End of setup header #####################################################
 
 	.section ".entrytext", "ax"
+	.globl start_of_setup
 start_of_setup:
 # Force %es = %ds
 	movw	%ds, %ax
@@ -585,7 +590,8 @@ start_of_setup:
 6:
 
 # Check signature at end of setup
-	cmpl	$0x5a5aaa55, setup_sig
+SETUP_SIGNATURE = 0x5a5aaa55
+	cmpl	$SETUP_SIGNATURE, setup_sig
 	jne	setup_bad
 
 # Zero the bss
@@ -620,3 +626,8 @@ die:
 setup_corrupt:
 	.byte	7
 	.string	"No setup signature found...\n"
+
+	.section ".signature", "a"
+	.balign 4
+setup_sig:
+	.long SETUP_SIGNATURE
diff --git a/arch/x86/boot/setup.ld b/arch/x86/boot/setup.ld
index e1d594a60204..7515ab011783 100644
--- a/arch/x86/boot/setup.ld
+++ b/arch/x86/boot/setup.ld
@@ -10,19 +10,14 @@ ENTRY(_start)
 SECTIONS
 {
 	. = 0;
-	.bstext	: {
-		*(.bstext)
-		. = 495;
-	} =0xffffffff
-
 	.header		: { *(.header) }
-	.entrytext	: { *(.entrytext) }
-	.inittext	: { *(.inittext) }
+	.entrytext	: { *(.entrytext) }	= 0xcccccccc
+	.inittext	: { *(.inittext) }	= 0xcccccccc
 	.initdata	: { *(.initdata) }
 	__end_init = .;
 
-	.text		: { *(.text .text.*) }
-	.text32		: { *(.text32) }
+	.text		: { *(.text .text.*) }	= 0xcccccccc
+	.text32		: { *(.text32) }	= 0xcccccccc
 
 	.pecompat	: { *(.pecompat) }
 	PROVIDE(pecompat_fsize = setup_size - pecompat_fstart);
@@ -40,9 +35,7 @@ SECTIONS
 	.data		: { *(.data*) }
 
 	.signature	: {
-		setup_sig = .;
-		LONG(0x5a5aaa55)
-
+		*(.signature)
 		setup_size = ALIGN(ABSOLUTE(.), 4096);
 		setup_sects = ABSOLUTE(setup_size / 512);
 		ASSERT(setup_sects >= 5, "The setup must be at least 5 sectors in size");
@@ -64,11 +57,16 @@ SECTIONS
 	}
 
 	/*
-	 * The ASSERT() sink to . is intentional, for binutils 2.14 compatibility:
+	 * The ASSERT() sink to . is intentional. A bare ASSERT()
+	 * outside of an output section is believed to have been broken
+	 * in some binutils versions, although it is supposed to have
+	 * been supported since binutils 2.15. Either way, it doesn't hurt,
+	 * so there is no reason to drop it.
 	 */
 	. = ASSERT(_end <= 0x8000, "Setup too big!");
 	. = ASSERT(hdr == 0x1f1, "The setup header has the wrong offset!");
+	. = ASSERT(end_of_bzheader <= 512+2+127, "bzImage header overflow!");
+	. = ASSERT(end_of_bzheader == start_of_setup, "padding bytes between .bzheader and .entrytext!");
 	/* Necessary for the very-old-loader check to work... */
 	. = ASSERT(__end_init <= 5*512, "init sections too big!");
-
 }
-- 
2.52.0

