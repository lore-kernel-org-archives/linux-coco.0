Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD9B7283FE3
	for <linux-coco@lists.linux.dev>; Tue, 20 Jan 2026 19:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768938890; cv=none; b=dhIMBmIr3sXTgv+zcIqTzXjg5m2AHiSxTHur4ApeFQ9UyXIbuapkGBJWWl6FULO0PDeldynXxYWeiBbvJbwmWC5vWkWW+F28wYlGhXFhDMxuE+dKEZqKlE/y7gY5mVOudjpPRXGzcX7BMRgEkoZs0k8FTAlkw4277fJ2pLm7YUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768938890; c=relaxed/simple;
	bh=D4tK6s4qxmXd7ByQgksRFD6iGVZ5J1jtKQniMHVJirw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i45Bz8NsMF9+TWQfThFn+89j/B4a+3TPm93cs8NmdcXcGPdLbfCxWIMAwBCvcd0g4aFHSf7QsqH/k2gFYxyHl/73Ge3DpO9cYPtYQJFn7L1Bwi8BJaWWTsYl0heRZvkbesHGWle3brODfh6FxAR9xR9Ij3EaH7n+0vXdA3iq5Pw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=P5xGA/F/; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="P5xGA/F/"
Received: from mail.zytor.com ([IPv6:2601:646:8081:9483:12c5:bc8e:d949:3497])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 60KJsD3F3899199
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Tue, 20 Jan 2026 11:54:26 -0800
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 60KJsD3F3899199
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025122301; t=1768938869;
	bh=hTzQn7SyH/cYu7s0tyFNKhrOlfC46JaH5MDmT+7FXN0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=P5xGA/F/SdLc+apds1JBd/6XbKRAM6F3DN2PsGe4IAkIOCW76o6QVkcgLnzH9+xaL
	 4NWtQWTos/iIYaZgc6NFHN62AG+53/2bn9iqucShu/QSOY5pNWCOwZtuF6+XEWn6dx
	 cjuhbIkcB8MRDcZbQWn/yEceOQ6lqwDDsAvL/njUFZHC8lLwfXk6YPHBF9Psbc8L+W
	 F9ejRNGDwehXwP/NfPrBtsGDZXBxezl858Z4x1QlF/3qZD1Kbn3szUBz1oozjGZU0q
	 xrb4CQQK7ZX34O9EGcY25l3Ty9AYG/r6hZSWxVu9ptBEDtUx3fynHQLgsz0mv2wAVC
	 awt9y0Jy+ELyg==
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
Subject: [PATCH v1 08/14] x86: make CONFIG_EFI_STUB unconditional
Date: Tue, 20 Jan 2026 11:54:00 -0800
Message-ID: <20260120195407.1163051-9-hpa@zytor.com>
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

The EFI stub code is mature, most current x86 systems require EFI to
boot, and as it is exclusively preboot code, it doesn't affect the
runtime memory footprint at all.

It makes absolutely no sense to omit it anymore, so make it
unconditional.

Signed-off-by: H. Peter Anvin (Intel) <hpa@zytor.com>
---
 arch/x86/Kconfig                  | 14 ++------------
 arch/x86/boot/compressed/Makefile |  2 --
 arch/x86/boot/compressed/error.c  |  2 --
 arch/x86/boot/header.S            |  3 ---
 4 files changed, 2 insertions(+), 19 deletions(-)

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 80527299f859..14e2b00a3815 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -907,7 +907,6 @@ config INTEL_TDX_GUEST
 	bool "Intel TDX (Trust Domain Extensions) - Guest Support"
 	depends on X86_64 && CPU_SUP_INTEL
 	depends on X86_X2APIC
-	depends on EFI_STUB
 	depends on PARAVIRT
 	select ARCH_HAS_CC_PLATFORM
 	select X86_MEM_ENCRYPT
@@ -1495,7 +1494,6 @@ config X86_MEM_ENCRYPT
 config AMD_MEM_ENCRYPT
 	bool "AMD Secure Memory Encryption (SME) support"
 	depends on X86_64 && CPU_SUP_AMD
-	depends on EFI_STUB
 	select DMA_COHERENT_POOL
 	select ARCH_USE_MEMREMAP_PROT
 	select INSTRUCTION_DECODER
@@ -1929,18 +1927,10 @@ config EFI
 	  platforms.
 
 config EFI_STUB
-	bool "EFI stub support"
-	depends on EFI
-	select RELOCATABLE
-	help
-	  This kernel feature allows a bzImage to be loaded directly
-	  by EFI firmware without the use of a bootloader.
-
-	  See Documentation/admin-guide/efi-stub.rst for more information.
+       def_bool y
 
 config EFI_HANDOVER_PROTOCOL
 	bool "EFI handover protocol (DEPRECATED)"
-	depends on EFI_STUB
 	default y
 	help
 	  Select this in order to include support for the deprecated EFI
@@ -1957,7 +1947,7 @@ config EFI_HANDOVER_PROTOCOL
 
 config EFI_MIXED
 	bool "EFI mixed-mode support"
-	depends on EFI_STUB && X86_64
+	depends on X86_64
 	help
 	  Enabling this feature allows a 64-bit kernel to be booted
 	  on a 32-bit firmware, provided that your CPU supports 64-bit
diff --git a/arch/x86/boot/compressed/Makefile b/arch/x86/boot/compressed/Makefile
index 68f9d7a1683b..6cbcf01c8bad 100644
--- a/arch/x86/boot/compressed/Makefile
+++ b/arch/x86/boot/compressed/Makefile
@@ -66,11 +66,9 @@ LDFLAGS_vmlinux += -z noexecstack
 ifeq ($(CONFIG_LD_IS_BFD),y)
 LDFLAGS_vmlinux += $(call ld-option,--no-warn-rwx-segments)
 endif
-ifeq ($(CONFIG_EFI_STUB),y)
 # ensure that the static EFI stub library will be pulled in, even if it is
 # never referenced explicitly from the startup code
 LDFLAGS_vmlinux += -u efi_pe_entry
-endif
 LDFLAGS_vmlinux += -T
 
 hostprogs	:= mkpiggy
diff --git a/arch/x86/boot/compressed/error.c b/arch/x86/boot/compressed/error.c
index 19a8251de506..f2d21e57c109 100644
--- a/arch/x86/boot/compressed/error.c
+++ b/arch/x86/boot/compressed/error.c
@@ -24,7 +24,6 @@ void error(char *m)
 }
 
 /* EFI libstub  provides vsnprintf() */
-#ifdef CONFIG_EFI_STUB
 void panic(const char *fmt, ...)
 {
 	static char buf[1024];
@@ -40,4 +39,3 @@ void panic(const char *fmt, ...)
 
 	error(buf);
 }
-#endif
diff --git a/arch/x86/boot/header.S b/arch/x86/boot/header.S
index 10b2971320f3..776bd0631bce 100644
--- a/arch/x86/boot/header.S
+++ b/arch/x86/boot/header.S
@@ -41,7 +41,6 @@ SYSSEG		= 0x1000		/* historical load address >> 4 */
 # EFI PECOFF header ##########################################################
 
 	.section ".header", "a"
-#ifdef CONFIG_EFI_STUB
 	# "MZ", MS-DOS header
 	.word	IMAGE_DOS_SIGNATURE
 	.org	0x38
@@ -222,8 +221,6 @@ pecompat_fstart:
 
 	.set	section_count, (. - section_table) / 40
 
-#endif /* CONFIG_EFI_STUB */
-
 # bzImage header #############################################################
 
 	# hdr should be at address 0x1f1; -2 for the sentinel
-- 
2.52.0

