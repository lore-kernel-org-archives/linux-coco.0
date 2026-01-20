Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7217C428472
	for <linux-coco@lists.linux.dev>; Tue, 20 Jan 2026 19:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768938902; cv=none; b=K5lnHWkhcOocWG5FT3Qc7yKSDJApqHi2rBGGmhUEZRg+fQE1dIqId/6TojBxSa7Rl5WL+Hd2CNDGLNClD0vjEAlaiAb/FSemNZOayXhqogqV54sybIYdm/jUdVLjabM3KTYhGn+aDsQSHCEDlwswJfqBgk24E+PTWAW8PowxPcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768938902; c=relaxed/simple;
	bh=y0qBWJ2JzcE5Wdd6HcJhZkb5zCY7uBDmMo7XTlbmdWI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mvuTRIE/BA32uCb7Y0avb5Cd+FDfr8afP722GPBdJCdN5tnHp28znMz2w1aUh5AXvx1+fGnO7QoxZrffjm3qv4heqzysxhzPEMda6B+Ej7vJwbb64crjMbln84nrfrzLhtkXVj37ZFJt4UvAiGwYiLk6qiq+E3dhTEyRRtTzpcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=hmM+wTzY; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="hmM+wTzY"
Received: from mail.zytor.com ([IPv6:2601:646:8081:9483:12c5:bc8e:d949:3497])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 60KJsD3J3899199
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Tue, 20 Jan 2026 11:54:33 -0800
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 60KJsD3J3899199
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025122301; t=1768938873;
	bh=7CsscAQMogMbkdY3DhSP7qlBg7m319oAvuqW2F5PRns=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hmM+wTzY3VFoB8ydJxnWfOVY48DqRD+WkOiY/yyqC/uK9TGdGlZcx8ZYfMWW1a1wm
	 +h/sy8GTZ/HN+J1H6GZ5wZmtfxdF2ZwXOLJRRCbZA5+tWU3tjxZAG0uy7uW/7uiRbi
	 JwbQbm9SuOnwykzbwtNS7w7zUT/EcX1YR+7fdu8Nrizt3laq4hHHA80wnV8fFpBBFT
	 xr7qMLKSrd7G2hwlUGzxkzlEFhpobSw+KK9S27qVv9pOZjCtH5fZGNxxYqZsuFieC/
	 HhYSZmQrEPbMVY/32Tnxil1u3DzlX/vXmOq7S29u2AY1d2Z10zfcLjZGzQsdIrGcD0
	 1CSfbEr7KAqww==
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
Subject: [PATCH v1 12/14] x86/boot: tweak a20.c for better code generation
Date: Tue, 20 Jan 2026 11:54:04 -0800
Message-ID: <20260120195407.1163051-13-hpa@zytor.com>
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

Do some minor tweaks to arch/x86/boot/a20.c for better code
generation, made possible by the __seg_fs/__seg_gs changes.

Move the die() call to a20.c itself; there is no reason to push an
error code upwards just to die() there.

Signed-off-by: H. Peter Anvin (Intel) <hpa@zytor.com>
---
 arch/x86/boot/a20.c  | 24 +++++++++++-------------
 arch/x86/boot/boot.h |  2 +-
 arch/x86/boot/pm.c   |  3 +--
 3 files changed, 13 insertions(+), 16 deletions(-)

diff --git a/arch/x86/boot/a20.c b/arch/x86/boot/a20.c
index 52c3fccdcb70..38a1cad8a553 100644
--- a/arch/x86/boot/a20.c
+++ b/arch/x86/boot/a20.c
@@ -53,24 +53,22 @@ static int empty_8042(void)
 
 static int a20_test(int loops)
 {
-	int ok = 0;
 	int saved, ctr;
 
 	set_fs(0xffff);
 
 	saved = ctr = rdgs32(A20_TEST_ADDR);
 
-	while (loops--) {
+	do {
 		wrgs32(++ctr, A20_TEST_ADDR);
 		io_delay();	/* Serialize and make delay constant */
 		barrier();	/* Compiler won't know about fs/gs overlap */
-		ok = rdfs32(A20_TEST_ADDR+0x10) ^ ctr;
-		if (ok)
+		if (rdfs32(A20_TEST_ADDR+0x10) != ctr)
 			break;
-	}
+	} while (--loops);
 
 	wrgs32(saved, A20_TEST_ADDR);
-	return ok;
+	return loops;
 }
 
 /* Quick test to see if A20 is already enabled */
@@ -125,7 +123,7 @@ static void enable_a20_fast(void)
 
 #define A20_ENABLE_LOOPS 255	/* Number of times to try */
 
-int enable_a20(void)
+void enable_a20(void)
 {
        int loops = A20_ENABLE_LOOPS;
        int kbc_err;
@@ -134,30 +132,30 @@ int enable_a20(void)
 	       /* First, check to see if A20 is already enabled
 		  (legacy free, etc.) */
 	       if (a20_test_short())
-		       return 0;
+		       return;
 
 	       /* Next, try the BIOS (INT 0x15, AX=0x2401) */
 	       enable_a20_bios();
 	       if (a20_test_short())
-		       return 0;
+		       return;
 
 	       /* Try enabling A20 through the keyboard controller */
 	       kbc_err = empty_8042();
 
 	       if (a20_test_short())
-		       return 0; /* BIOS worked, but with delayed reaction */
+		       return; /* BIOS worked, but with delayed reaction */
 
 	       if (!kbc_err) {
 		       enable_a20_kbc();
 		       if (a20_test_long())
-			       return 0;
+			      return;
 	       }
 
 	       /* Finally, try enabling the "fast A20 gate" */
 	       enable_a20_fast();
 	       if (a20_test_long())
-		       return 0;
+		       return;
        }
 
-       return -1;
+       die("A20 gate not responding, unable to boot...\n");
 }
diff --git a/arch/x86/boot/boot.h b/arch/x86/boot/boot.h
index 4d3549ed7987..584c89d0738b 100644
--- a/arch/x86/boot/boot.h
+++ b/arch/x86/boot/boot.h
@@ -167,7 +167,7 @@ void copy_to_fs(addr_t dst, void *src, size_t len);
 void *copy_from_fs(void *dst, addr_t src, size_t len);
 
 /* a20.c */
-int enable_a20(void);
+void enable_a20(void);
 
 /* apm.c */
 int query_apm_bios(void);
diff --git a/arch/x86/boot/pm.c b/arch/x86/boot/pm.c
index 3be89ba4b1b3..e39689ed65ea 100644
--- a/arch/x86/boot/pm.c
+++ b/arch/x86/boot/pm.c
@@ -106,8 +106,7 @@ void go_to_protected_mode(void)
 	realmode_switch_hook();
 
 	/* Enable the A20 gate */
-	if (enable_a20())
-		die("A20 gate not responding, unable to boot...\n");
+	enable_a20();
 
 	/* Reset coprocessor (IGNNE#) */
 	reset_coprocessor();
-- 
2.52.0

