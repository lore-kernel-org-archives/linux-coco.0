Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABF283A35D9
	for <linux-coco@lists.linux.dev>; Tue, 20 Jan 2026 19:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768938887; cv=none; b=WSA1V4W+MVAz8dZMxWAyC4P9pbW6+b8k8ofFYhCH+bxsfF74CY3OrLV4lbcUvc1PmYG6WWEk9MlS+Nh6e4MtW2JbC+vyrNPdUrHk0mbqEVjzq1ufTXsHdW+e2p0yxIOahFfdLJIT3GNoQnPJWruDuGGTOp1w1zipIvaaEmVRpfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768938887; c=relaxed/simple;
	bh=HCkzLw9lyDqURmFWnyWl+RoTbzltAIc9nLa5AlC6bF0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Mr6zbpzzoVEZOar/g3UW+uK0Ayui6g5ihfCUXEAXUDb0CX71PDsIdAfnqsqmiBVRXbhHddDJNmnBMHRzKeEXC1SajGwpDn+kOp/5zXE7yVh7YCG3YjlNz09kSisYZBd53bq/lB3gpz4kBCqWEFFiI9sZZQwDUqteK/aKO8oXDao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=GbbE01ej; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="GbbE01ej"
Received: from mail.zytor.com ([IPv6:2601:646:8081:9483:12c5:bc8e:d949:3497])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 60KJsD3C3899199
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Tue, 20 Jan 2026 11:54:23 -0800
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 60KJsD3C3899199
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025122301; t=1768938864;
	bh=x5o5p1WTVjSwGQYBVSOvLdb90rpRZLyFia98wPTCF2A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GbbE01ejnG7xfmZe2imk4WXiCQz/WoejAef5XGbF3qcjlUxPvKRjn7gGelcq+Lx6G
	 koRkWwn4Pi3uDQZdnU0TCvI+0gMioA/kKflkAJF5k1lK4E+K+yCONHVO2OJ7k57uZH
	 1X4rPAFB8J31wDk/rhGJHkEruVDqfVQzIoBGIOKLBdydHkdVNR+Rkc7z39eVrnv071
	 A8CAJv/4Crvrx7g+1MzQbz9upZm6fX2W3e7FQlU+R6M9RREnBkgqixm3S8YMKyuqmb
	 F9nRh7NVgMMeXo8IUShnkX1wpAdMT/RZmRcdHIPUUclH0amvpU2FyiUF6PmpDgeMJO
	 qcefEpWodZoUQ==
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
Subject: [PATCH v1 05/14] x86/boot: call puts() from within die()
Date: Tue, 20 Jan 2026 11:53:57 -0800
Message-ID: <20260120195407.1163051-6-hpa@zytor.com>
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

Every call to die() has a call to puts() in front of it, which adds
unnecessary code bloat. Move the puts() into die() which, being a
noreturn function, is terminal and allows the compiler to not generate
unnecessary code around it.

Signed-off-by: H. Peter Anvin (Intel) <hpa@zytor.com>
---
 arch/x86/boot/boot.h   | 2 +-
 arch/x86/boot/header.S | 5 +++--
 arch/x86/boot/main.c   | 6 ++----
 arch/x86/boot/pm.c     | 6 ++----
 4 files changed, 8 insertions(+), 11 deletions(-)

diff --git a/arch/x86/boot/boot.h b/arch/x86/boot/boot.h
index 1f2b7252e387..b4eb8405ba55 100644
--- a/arch/x86/boot/boot.h
+++ b/arch/x86/boot/boot.h
@@ -280,7 +280,7 @@ void console_init(void);
 void query_edd(void);
 
 /* header.S */
-void __noreturn die(void);
+void __noreturn die(const char *msg);
 
 /* memory.c */
 void detect_memory(void);
diff --git a/arch/x86/boot/header.S b/arch/x86/boot/header.S
index 85a21d576f5b..5a54d33e51c2 100644
--- a/arch/x86/boot/header.S
+++ b/arch/x86/boot/header.S
@@ -611,14 +611,15 @@ SETUP_SIGNATURE = 0x5a5aaa55
 # Setup corrupt somehow...
 setup_bad:
 	movl	$setup_corrupt, %eax
-	calll	puts
 	# Fall through...
 
 	.globl	die
 	.type	die, @function
 die:
+	calll	puts
+1:
 	hlt
-	jmp	die
+	jmp	1b
 
 	.size	die, .-die
 
diff --git a/arch/x86/boot/main.c b/arch/x86/boot/main.c
index da01ade4959e..ad8869aad6db 100644
--- a/arch/x86/boot/main.c
+++ b/arch/x86/boot/main.c
@@ -143,10 +143,8 @@ void main(void)
 	init_heap();
 
 	/* Make sure we have all the proper CPU support */
-	if (validate_cpu()) {
-		puts("Unable to boot - please use a kernel appropriate for your CPU.\n");
-		die();
-	}
+	if (validate_cpu())
+		die("Unable to boot - please use a kernel appropriate for your CPU.\n");
 
 	/* Tell the BIOS what CPU mode we intend to run in */
 	set_bios_mode();
diff --git a/arch/x86/boot/pm.c b/arch/x86/boot/pm.c
index 5941f930f6c5..3be89ba4b1b3 100644
--- a/arch/x86/boot/pm.c
+++ b/arch/x86/boot/pm.c
@@ -106,10 +106,8 @@ void go_to_protected_mode(void)
 	realmode_switch_hook();
 
 	/* Enable the A20 gate */
-	if (enable_a20()) {
-		puts("A20 gate not responding, unable to boot...\n");
-		die();
-	}
+	if (enable_a20())
+		die("A20 gate not responding, unable to boot...\n");
 
 	/* Reset coprocessor (IGNNE#) */
 	reset_coprocessor();
-- 
2.52.0

