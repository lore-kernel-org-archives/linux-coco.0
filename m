Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16AD644D6B1
	for <linux-coco@lists.linux.dev>; Tue, 20 Jan 2026 19:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768938906; cv=none; b=k0XBbLmmaYNyTRlo/GBgcfSiRcSwXKIBjGLIXTBfRTLoWG9FpIzzOkr4qvou6iztOh0gGh+/Sbcfj0w+zzzAvK96T90yF9tgL5OrrQjn8dyAGNt9y4CPWecklvkMBbZcckO2Mv7UAz9teZPexXSxnkb9hoNRFlRNejky86JxLZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768938906; c=relaxed/simple;
	bh=LVjb51BubXtjCXFlaIflrd6zYn+Fs3tYXyrpiykRI2g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bbSQsUbcg3aOcv+uRD2LF40CEMqihho//B0pGAh9gIcRtSumboyFFh2GrLa393STX6gnumFnmmwS/0RrMJunYOZiHw0atHX11k904TNiijTfYytz3eFbGaCvLP8Oac2ei4nzpJ2SISXAbaYiTs1G79QhoBMcLzmNQMdJnmON6j8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=GoCgxtX6; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="GoCgxtX6"
Received: from mail.zytor.com ([IPv6:2601:646:8081:9483:12c5:bc8e:d949:3497])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 60KJsD3L3899199
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Tue, 20 Jan 2026 11:54:35 -0800
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 60KJsD3L3899199
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025122301; t=1768938877;
	bh=Y67Y9z1Bfloc55qymo/CX4LxL/c7ZFllEVhyJRIxejU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GoCgxtX6+1Yyzn6zMwaCrDps0qUr+H98ddGIRlV05URMYuXhGrjq8lKpv5fFWQukg
	 ruIvydbBYtfyM1TipOHNtf+MKUjwugJ5VJECsmhkA8VbS1x/B3siefFt6gMqhAwopW
	 nNFhnD19NoB4uJVg0bYgST5zYOCjHkms/Eyuf896wPej2fIU5hT0X4nM33VN/Z4TEY
	 xormATv11e4hYhT5H2ZHGdssl/4URmgdjGpjDXAic1VYOapE6+9WnlQUF7sORaDaUl
	 thIID8VKl0hqX8jq6MkYjzDsbtoOj8BGOhzXdjvDJUhGs5kghGW5wWhT4bhYR6i9CJ
	 9WcTAB4vF0SMw==
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
        linux-coco@lists.linux.dev, x86@kernel.org,
        Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>
Subject: [PATCH v1 14/14] compiler-gcc: Remove obsolete RELOC_HIDE() macro
Date: Tue, 20 Jan 2026 11:54:06 -0800
Message-ID: <20260120195407.1163051-15-hpa@zytor.com>
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

From: Uros Bizjak <ubizjak@gmail.com>

Remove the RELOC_HIDE() macro from include/linux/compiler-gcc.h.

The GCC specific macro was historically used to workaround very old
compiler bugs (including pre-4.1 ppc64 GCC). These compilers are long
obsolete.

The generic RELOC_HIDE() macro should be used instead.

The removal of the GCC specific macro results in the
following code size reduction:

     text    data     bss     dec     hex filename
  28526453        4823511  737108 34087072        20820a0 vmlinux-old.o
  28520945        4823463  737108 34081516        2080aec vmlinux-new.o

  ./bloat-o-meter vmlinux-old.o vmlinux-new.o
  add/remove: 4/14 grow/shrink: 189/674 up/down: 4433/-7865 (-3432)
  ...
  Total: Before=24103512, After=24100080, chg -0.01%

Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@kernel.org>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
---
 include/linux/compiler-gcc.h | 25 -------------------------
 include/linux/compiler.h     |  8 ++++++++
 2 files changed, 8 insertions(+), 25 deletions(-)

diff --git a/include/linux/compiler-gcc.h b/include/linux/compiler-gcc.h
index 5de824a0b3d7..081e658754b9 100644
--- a/include/linux/compiler-gcc.h
+++ b/include/linux/compiler-gcc.h
@@ -10,31 +10,6 @@
 		     + __GNUC_MINOR__ * 100	\
 		     + __GNUC_PATCHLEVEL__)
 
-/*
- * This macro obfuscates arithmetic on a variable address so that gcc
- * shouldn't recognize the original var, and make assumptions about it.
- *
- * This is needed because the C standard makes it undefined to do
- * pointer arithmetic on "objects" outside their boundaries and the
- * gcc optimizers assume this is the case. In particular they
- * assume such arithmetic does not wrap.
- *
- * A miscompilation has been observed because of this on PPC.
- * To work around it we hide the relationship of the pointer and the object
- * using this macro.
- *
- * Versions of the ppc64 compiler before 4.1 had a bug where use of
- * RELOC_HIDE could trash r30. The bug can be worked around by changing
- * the inline assembly constraint from =g to =r, in this particular
- * case either is valid.
- */
-#define RELOC_HIDE(ptr, off)						\
-({									\
-	unsigned long __ptr;						\
-	__asm__ ("" : "=r"(__ptr) : "0"(ptr));				\
-	(typeof(ptr)) (__ptr + (off));					\
-})
-
 #if defined(LATENT_ENTROPY_PLUGIN) && !defined(__CHECKER__)
 #define __latent_entropy __attribute__((latent_entropy))
 #endif
diff --git a/include/linux/compiler.h b/include/linux/compiler.h
index 04487c9bd751..6affb7b44be7 100644
--- a/include/linux/compiler.h
+++ b/include/linux/compiler.h
@@ -148,6 +148,14 @@ void ftrace_likely_update(struct ftrace_likely_data *f, int val,
 	= (unsigned long)&sym;
 #endif
 
+/*
+ * This macro obfuscates arithmetic on a variable address so that the compiler
+ * shouldn't recognize the original var, and make assumptions about it.
+ *
+ * This is needed because the C standard makes it undefined to do pointer
+ * arithmetic on "objects" outside their boundaries and compilers assume
+ * this is the case. In particular they assume such arithmetic does not wrap.
+ */
 #ifndef RELOC_HIDE
 # define RELOC_HIDE(ptr, off)					\
   ({ unsigned long __ptr;					\
-- 
2.52.0

