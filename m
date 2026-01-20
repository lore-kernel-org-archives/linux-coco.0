Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAAD83A4AB2
	for <linux-coco@lists.linux.dev>; Tue, 20 Jan 2026 19:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768938887; cv=none; b=QDcmBzmEIEe+YQr2GfhbRemXSVzC8094dvqpLLfkN6owAPRAcmXFrZ/XSaBwepRqtRKVPv3T+rPCTzHQ0ulgVGpcs4O1oPHtSjTdxYuQj34kicHxOJu1c7LD4JTqRaWxDQkCoCzqnh1rw7o6SxMJvTHazThCaqxn5/8ITJkzvh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768938887; c=relaxed/simple;
	bh=HwQYLMn2Ico8P5pJ61HSy0FD/bC0b8+32vCu6lReUek=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tlsmh/N6TuYh2W4Bc85htKmvQs+UOSVKjKqNIiQR8B6PY+1wsfGl2FF22FCqVMwcTEw5Vu5TXEp6BXJUrryOEwnRmNxipag7ON67oSgsBAVQVAq/q4sCL/urXpTeLF6L8SlDo8j6j5A58prXD2qlZfyfmxvlSwMVooXdZBhvM3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=NnhFHy8R; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="NnhFHy8R"
Received: from mail.zytor.com ([IPv6:2601:646:8081:9483:12c5:bc8e:d949:3497])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 60KJsD393899199
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Tue, 20 Jan 2026 11:54:18 -0800
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 60KJsD393899199
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025122301; t=1768938860;
	bh=RBVs9h7s1HCtT9Q0JVrBxBgYYiiLINYNUH55FQnvhLo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NnhFHy8RbpjYddmRAzj1xo4w9AWD0mY3KYMsN/anT1qgB7G/0JxOaGP3saNHt81vv
	 MQnex1NEp1PwY2+EBYSCH93TVKV3ORaEubcJdLLgHRJ88hpqPghMQ4L+W313x/FSl2
	 KE7QIXkeX0Lh3ZFQlnSvS+w29lrDqMppHBpEkJiQfj0xR2+CX55u46pck/VmBKMbSc
	 lgaoCRb+0nSdDYhQXu30UjV/CZfe6PJqb/EhaDC9nQrqLAfb0jhuBsY2HJMbW8fwJc
	 hZ0rlRPVNGtGFaYIxqdHGgBzI+HTu46MTPvgfeSgpDfLx8NaYrXmpwFdNEsNI92s4e
	 MEkbeFCJ5h90g==
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
Subject: [PATCH v1 02/14] x86/realmode: make %gs == 0 an invariant
Date: Tue, 20 Jan 2026 11:53:54 -0800
Message-ID: <20260120195407.1163051-3-hpa@zytor.com>
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

When accessing data that is not "near", either only one segment is
used or one segment is always zero. Leave %gs == 0 at all times
throughout the C code; this reduces the number of segment loads
needed.

Signed-off-by: H. Peter Anvin (Intel) <hpa@zytor.com>
---
 arch/x86/boot/a20.c               | 11 +++++------
 arch/x86/boot/header.S            |  3 +++
 arch/x86/boot/regs.c              |  3 ++-
 arch/x86/boot/video-bios.c        |  5 ++---
 arch/x86/boot/video-mode.c        |  5 ++---
 arch/x86/boot/video.c             |  7 +++----
 arch/x86/realmode/rm/wakeup_asm.S | 10 ++++++----
 7 files changed, 23 insertions(+), 21 deletions(-)

diff --git a/arch/x86/boot/a20.c b/arch/x86/boot/a20.c
index bda042933a05..3ab6cd8eaa31 100644
--- a/arch/x86/boot/a20.c
+++ b/arch/x86/boot/a20.c
@@ -56,20 +56,19 @@ static int a20_test(int loops)
 	int ok = 0;
 	int saved, ctr;
 
-	set_fs(0x0000);
-	set_gs(0xffff);
+	set_fs(0xffff);
 
-	saved = ctr = rdfs32(A20_TEST_ADDR);
+	saved = ctr = rdgs32(A20_TEST_ADDR);
 
 	while (loops--) {
-		wrfs32(++ctr, A20_TEST_ADDR);
+		wrgs32(++ctr, A20_TEST_ADDR);
 		io_delay();	/* Serialize and make delay constant */
-		ok = rdgs32(A20_TEST_ADDR+0x10) ^ ctr;
+		ok = rdfs32(A20_TEST_ADDR+0x10) ^ ctr;
 		if (ok)
 			break;
 	}
 
-	wrfs32(saved, A20_TEST_ADDR);
+	wrgs32(saved, A20_TEST_ADDR);
 	return ok;
 }
 
diff --git a/arch/x86/boot/header.S b/arch/x86/boot/header.S
index 9bea5a1e2c52..bda20395658f 100644
--- a/arch/x86/boot/header.S
+++ b/arch/x86/boot/header.S
@@ -596,6 +596,9 @@ start_of_setup:
 	shrw	$2, %cx
 	rep stosl
 
+# The C code uses %gs == 0 as invariant
+	movw	%ax, %gs
+
 # Jump to C code (should not return)
 	calll	main
 
diff --git a/arch/x86/boot/regs.c b/arch/x86/boot/regs.c
index 55de6b3092b8..54d6dfd129c5 100644
--- a/arch/x86/boot/regs.c
+++ b/arch/x86/boot/regs.c
@@ -22,6 +22,7 @@ void initregs(struct biosregs *reg)
 	reg->eflags |= X86_EFLAGS_CF;
 	reg->ds = ds();
 	reg->es = ds();
+	/* The input values of %cs and %ss are ignored by intcall() */
 	reg->fs = fs();
-	reg->gs = gs();
+	/* %gs == 0 */
 }
diff --git a/arch/x86/boot/video-bios.c b/arch/x86/boot/video-bios.c
index 6eb8c06bc287..e8be64424a40 100644
--- a/arch/x86/boot/video-bios.c
+++ b/arch/x86/boot/video-bios.c
@@ -73,7 +73,6 @@ static int bios_probe(void)
 	if (adapter != ADAPTER_EGA && adapter != ADAPTER_VGA)
 		return 0;
 
-	set_fs(0);
 	crtc = vga_crtc();
 
 	video_bios.modes = GET_HEAP(struct mode_info, 0);
@@ -105,8 +104,8 @@ static int bios_probe(void)
 		mi = GET_HEAP(struct mode_info, 1);
 		mi->mode = VIDEO_FIRST_BIOS+mode;
 		mi->depth = 0;	/* text */
-		mi->x = rdfs16(0x44a);
-		mi->y = rdfs8(0x484)+1;
+		mi->x = rdgs16(0x44a);
+		mi->y = rdgs8(0x484)+1;
 		nmodes++;
 	}
 
diff --git a/arch/x86/boot/video-mode.c b/arch/x86/boot/video-mode.c
index 9ada55dc1ab7..e5b9bc96bd42 100644
--- a/arch/x86/boot/video-mode.c
+++ b/arch/x86/boot/video-mode.c
@@ -119,9 +119,8 @@ static void vga_recalc_vertical(void)
 	u16 crtc;
 	u8 pt, ov;
 
-	set_fs(0);
-	font_size = rdfs8(0x485); /* BIOS: font size (pixels) */
-	rows = force_y ? force_y : rdfs8(0x484)+1; /* Text rows */
+	font_size = rdgs8(0x485); /* BIOS: font size (pixels) */
+	rows = force_y ? force_y : rdgs8(0x484)+1; /* Text rows */
 
 	rows *= font_size;	/* Visible scan lines */
 	rows--;			/* ... minus one */
diff --git a/arch/x86/boot/video.c b/arch/x86/boot/video.c
index 0641c8c46aee..09b810faa5c0 100644
--- a/arch/x86/boot/video.c
+++ b/arch/x86/boot/video.c
@@ -79,12 +79,11 @@ static void store_mode_params(void)
 		video_segment = 0xb800;
 	}
 
-	set_fs(0);
-	font_size = rdfs16(0x485); /* Font size, BIOS area */
+	font_size = rdgs16(0x485); /* Font size, BIOS area */
 	boot_params.screen_info.orig_video_points = font_size;
 
-	x = rdfs16(0x44a);
-	y = (adapter == ADAPTER_CGA) ? 25 : rdfs8(0x484)+1;
+	x = rdgs16(0x44a);
+	y = (adapter == ADAPTER_CGA) ? 25 : rdgs8(0x484)+1;
 
 	if (force_x)
 		x = force_x;
diff --git a/arch/x86/realmode/rm/wakeup_asm.S b/arch/x86/realmode/rm/wakeup_asm.S
index 02d0ba16ae33..a8a8580158d7 100644
--- a/arch/x86/realmode/rm/wakeup_asm.S
+++ b/arch/x86/realmode/rm/wakeup_asm.S
@@ -70,15 +70,17 @@ SYM_CODE_START(wakeup_start)
 	movl	$rm_stack_end, %esp
 	movw	%ax, %ds
 	movw	%ax, %es
-	movw	%ax, %fs
-	movw	%ax, %gs
 
-	lidtl	.Lwakeup_idt
+	xorl	%eax, %eax
+	movw	%ax, %fs
+	movw	%ax, %gs	/* The real mode code requires %gs == 0 */
 
 	/* Clear the EFLAGS */
-	pushl $0
+	pushl	%eax
 	popfl
 
+	lidtl	.Lwakeup_idt
+
 	/* Check header signature... */
 	movl	signature, %eax
 	cmpl	$WAKEUP_HEADER_SIGNATURE, %eax
-- 
2.52.0

