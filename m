Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BF8D3A4AB6
	for <linux-coco@lists.linux.dev>; Tue, 20 Jan 2026 19:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768938898; cv=none; b=mmKxHWZRx1N5BtSdIa0DaO9tPHWVsypuWY+4oFGMFnSByIUPKXUNFVD3TvLYpl1bCChAlBeZbfmhydBiqdYWlpLo8zClCRFLRXfBN4VZQpnXm9fSggIRVlZ7Jz5HDEHqOViAvfu3ohuQeq9rWIsoBDf//mXU3yYSzIf95pAevls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768938898; c=relaxed/simple;
	bh=cniQ/5CQ1A9KzfQ+8m9H5BcqzuqyLa9ZqPDMY5Vpxf4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JpD0F+QaNLp+lgO1TC9HZTJfzTZN94HJkgvAN3qK2SNplCzseR3ixKEjqiZjeg2W2I+eh7+si4qEEuKyXYcN2lnVK3q258xyeZS1xqMhfX31D9+Stzehe0KWr3umY+2Ck4RwZpCtzsUa/sikBgCPkubL0FWW04ilRQluuqY4emw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=fy0xvkhX; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="fy0xvkhX"
Received: from mail.zytor.com ([IPv6:2601:646:8081:9483:12c5:bc8e:d949:3497])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 60KJsD3G3899199
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Tue, 20 Jan 2026 11:54:29 -0800
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 60KJsD3G3899199
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025122301; t=1768938870;
	bh=bRvYfqCNbuYiTVy5Sv3lOWnGQXtHJszTUQDuhogATsY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fy0xvkhXzHdZfSeyaTgVNau8danIWXZRvc49fPNW3/7r2tbkZD27Lwc1ii/5ebcQg
	 E152ANWTvIG7i7395TePkU2INmyj1enbRYKhLss77sWzqB6/pF9HYXwo0D8HN4F989
	 T5OTrTNrGk8Vb0whENGH9Vo/Tz0BJqZWkvmDQEcd/wR19mmG26YasXVOopcfC2Vuja
	 ErXiJz7VfkqsdsCCjx8IZ3alQRILkn2o+zQo3o/TIheeYtTnG5/Dv2/lM33MxV0oQd
	 Jxfec6+h6cTvPlbbZ4OglK8zBlaERZXy3pMP5yiIirqrl9Ri64fnHHG1q620ih+/2t
	 +HlfWNNp095fA==
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
Subject: [PATCH v1 09/14] x86/boot: make the relocatable kernel unconditional
Date: Tue, 20 Jan 2026 11:54:01 -0800
Message-ID: <20260120195407.1163051-10-hpa@zytor.com>
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

There is absolutely no valid reason to build a non-relocatable kernel
anymore. It has no effect on the runtime memory footprint since it is
handled entirely in preboot code. Futhermore, the relocatable kernel
is required for EFI stub support.

Remove CONFIG_RELOCATABLE and make the non-relocatable kernel
unconditional.

Signed-off-by: H. Peter Anvin (Intel) <hpa@zytor.com>
---
 arch/x86/Kconfig                   | 71 ++++--------------------------
 arch/x86/boot/compressed/head_32.S |  2 -
 arch/x86/boot/compressed/head_64.S |  4 --
 arch/x86/boot/compressed/misc.c    |  8 ----
 arch/x86/boot/header.S             | 12 +----
 5 files changed, 11 insertions(+), 86 deletions(-)

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 14e2b00a3815..a0fe0349fb77 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -2018,61 +2018,16 @@ config PHYSICAL_START
 	help
 	  This gives the physical address where the kernel is loaded.
 
-	  If the kernel is not relocatable (CONFIG_RELOCATABLE=n) then bzImage
-	  will decompress itself to above physical address and run from there.
-	  Otherwise, bzImage will run from the address where it has been loaded
-	  by the boot loader. The only exception is if it is loaded below the
-	  above physical address, in which case it will relocate itself there.
-
-	  In normal kdump cases one does not have to set/change this option
-	  as now bzImage can be compiled as a completely relocatable image
-	  (CONFIG_RELOCATABLE=y) and be used to load and run from a different
-	  address. This option is mainly useful for the folks who don't want
-	  to use a bzImage for capturing the crash dump and want to use a
-	  vmlinux instead. vmlinux is not relocatable hence a kernel needs
-	  to be specifically compiled to run from a specific memory area
-	  (normally a reserved region) and this option comes handy.
-
-	  So if you are using bzImage for capturing the crash dump,
-	  leave the value here unchanged to 0x1000000 and set
-	  CONFIG_RELOCATABLE=y.  Otherwise if you plan to use vmlinux
-	  for capturing the crash dump change this value to start of
-	  the reserved region.  In other words, it can be set based on
-	  the "X" value as specified in the "crashkernel=YM@XM"
-	  command line boot parameter passed to the panic-ed
-	  kernel. Please take a look at Documentation/admin-guide/kdump/kdump.rst
-	  for more details about crash dumps.
-
-	  Usage of bzImage for capturing the crash dump is recommended as
-	  one does not have to build two kernels. Same kernel can be used
-	  as production kernel and capture kernel. Above option should have
-	  gone away after relocatable bzImage support is introduced. But it
-	  is present because there are users out there who continue to use
-	  vmlinux for dump capture. This option should go away down the
-	  line.
+	  If the kernel is loaded at a physical address below this address
+	  by the boot loader it will relocate itself there.
 
-	  Don't change this unless you know what you are doing.
+	  The addresses in the vmlinux and System.map files are based
+	  at this address.
 
-config RELOCATABLE
-	bool "Build a relocatable kernel"
-	default y
-	help
-	  This builds a kernel image that retains relocation information
-	  so it can be loaded someplace besides the default 1MB.
-	  The relocations tend to make the kernel binary about 10% larger,
-	  but are discarded at runtime.
-
-	  One use is for the kexec on panic case where the recovery kernel
-	  must live at a different physical address than the primary
-	  kernel.
-
-	  Note: If CONFIG_RELOCATABLE=y, then the kernel runs from the address
-	  it has been loaded at and the compile time physical address
-	  (CONFIG_PHYSICAL_START) is used as the minimum location.
+	  Don't change this unless you know what you are doing.
 
 config RANDOMIZE_BASE
 	bool "Randomize the address of the kernel image (KASLR)"
-	depends on RELOCATABLE
 	default y
 	help
 	  In support of Kernel Address Space Layout Randomization (KASLR),
@@ -2108,7 +2063,7 @@ config RANDOMIZE_BASE
 # Relocation on x86 needs some additional build support
 config X86_NEED_RELOCS
 	def_bool y
-	depends on RANDOMIZE_BASE || (X86_32 && RELOCATABLE)
+	depends on RANDOMIZE_BASE || X86_32
 	select ARCH_VMLINUX_NEEDS_RELOCS
 
 config PHYSICAL_ALIGN
@@ -2121,17 +2076,9 @@ config PHYSICAL_ALIGN
 	  where kernel is loaded and run from. Kernel is compiled for an
 	  address which meets above alignment restriction.
 
-	  If bootloader loads the kernel at a non-aligned address and
-	  CONFIG_RELOCATABLE is set, kernel will move itself to nearest
-	  address aligned to above value and run from there.
-
-	  If bootloader loads the kernel at a non-aligned address and
-	  CONFIG_RELOCATABLE is not set, kernel will ignore the run time
-	  load address and decompress itself to the address it has been
-	  compiled for and run from there. The address for which kernel is
-	  compiled already meets above alignment restrictions. Hence the
-	  end result is that kernel runs from a physical address meeting
-	  above alignment restrictions.
+	  If bootloader loads the kernel at a non-aligned address the
+	  kernel will move itself upwards to the nearest address
+	  aligned to above value and run from there.
 
 	  On 32-bit this value must be a multiple of 0x2000. On 64-bit
 	  this value must be a multiple of 0x200000.
diff --git a/arch/x86/boot/compressed/head_32.S b/arch/x86/boot/compressed/head_32.S
index 1cfe9802a42f..79d9e2c330ba 100644
--- a/arch/x86/boot/compressed/head_32.S
+++ b/arch/x86/boot/compressed/head_32.S
@@ -82,7 +82,6 @@ SYM_FUNC_START(startup_32)
  * %ebp is calculated to be the address that the kernel will be decompressed to.
  */
 
-#ifdef CONFIG_RELOCATABLE
 	leal	startup_32@GOTOFF(%edx), %ebx
 	movl	BP_kernel_alignment(%esi), %eax
 	decl	%eax
@@ -91,7 +90,6 @@ SYM_FUNC_START(startup_32)
 	andl    %eax, %ebx
 	cmpl	$LOAD_PHYSICAL_ADDR, %ebx
 	jae	1f
-#endif
 	movl	$LOAD_PHYSICAL_ADDR, %ebx
 1:
 
diff --git a/arch/x86/boot/compressed/head_64.S b/arch/x86/boot/compressed/head_64.S
index d9dab940ff62..8a964a4d45c2 100644
--- a/arch/x86/boot/compressed/head_64.S
+++ b/arch/x86/boot/compressed/head_64.S
@@ -143,7 +143,6 @@ SYM_FUNC_START(startup_32)
  * for safe in-place decompression.
  */
 
-#ifdef CONFIG_RELOCATABLE
 	movl	%ebp, %ebx
 	movl	BP_kernel_alignment(%esi), %eax
 	decl	%eax
@@ -152,7 +151,6 @@ SYM_FUNC_START(startup_32)
 	andl	%eax, %ebx
 	cmpl	$LOAD_PHYSICAL_ADDR, %ebx
 	jae	1f
-#endif
 	movl	$LOAD_PHYSICAL_ADDR, %ebx
 1:
 
@@ -312,7 +310,6 @@ SYM_CODE_START(startup_64)
 	 */
 
 	/* Start with the delta to where the kernel will run at. */
-#ifdef CONFIG_RELOCATABLE
 	leaq	startup_32(%rip) /* - $startup_32 */, %rbp
 	movl	BP_kernel_alignment(%rsi), %eax
 	decl	%eax
@@ -321,7 +318,6 @@ SYM_CODE_START(startup_64)
 	andq	%rax, %rbp
 	cmpq	$LOAD_PHYSICAL_ADDR, %rbp
 	jae	1f
-#endif
 	movq	$LOAD_PHYSICAL_ADDR, %rbp
 1:
 
diff --git a/arch/x86/boot/compressed/misc.c b/arch/x86/boot/compressed/misc.c
index 0f41ca0e52c0..0cdc164286fc 100644
--- a/arch/x86/boot/compressed/misc.c
+++ b/arch/x86/boot/compressed/misc.c
@@ -314,12 +314,8 @@ static size_t parse_elf(void *output)
 			if ((phdr->p_align % 0x200000) != 0)
 				error("Alignment of LOAD segment isn't multiple of 2MB");
 #endif
-#ifdef CONFIG_RELOCATABLE
 			dest = output;
 			dest += (phdr->p_paddr - LOAD_PHYSICAL_ADDR);
-#else
-			dest = (void *)(phdr->p_paddr);
-#endif
 			memmove(dest, output + phdr->p_offset, phdr->p_filesz);
 			break;
 		default: /* Ignore other PT_* */ break;
@@ -506,10 +502,6 @@ asmlinkage __visible void *extract_kernel(void *rmode, unsigned char *output)
 	if (heap > ((-__PAGE_OFFSET-(128<<20)-1) & 0x7fffffff))
 		error("Destination address too large");
 #endif
-#ifndef CONFIG_RELOCATABLE
-	if (virt_addr != LOAD_PHYSICAL_ADDR)
-		error("Destination virtual address changed when not relocatable");
-#endif
 
 	debug_putstr("\nDecompressing Linux... ");
 
diff --git a/arch/x86/boot/header.S b/arch/x86/boot/header.S
index 776bd0631bce..2828b25707bb 100644
--- a/arch/x86/boot/header.S
+++ b/arch/x86/boot/header.S
@@ -334,24 +334,16 @@ initrd_addr_max: .long 0x7fffffff
 kernel_alignment:  .long CONFIG_PHYSICAL_ALIGN	#physical addr alignment
 						#required for protected mode
 						#kernel
-#ifdef CONFIG_RELOCATABLE
-relocatable_kernel:    .byte 1
-#else
-relocatable_kernel:    .byte 0
-#endif
+relocatable_kernel:	.byte 1			# Always relocatable
 min_alignment:		.byte MIN_KERNEL_ALIGN_LG2	# minimum alignment
 
 xloadflags:
 #ifdef CONFIG_X86_64
 # define XLF0 XLF_KERNEL_64			/* 64-bit kernel */
-#else
-# define XLF0 0
-#endif
-
-#if defined(CONFIG_RELOCATABLE) && defined(CONFIG_X86_64)
    /* kernel/boot_param/ramdisk could be loaded above 4g */
 # define XLF1 XLF_CAN_BE_LOADED_ABOVE_4G
 #else
+# define XLF0 0
 # define XLF1 0
 #endif
 
-- 
2.52.0

