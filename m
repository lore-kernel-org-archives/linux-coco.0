Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 646E03A35C7
	for <linux-coco@lists.linux.dev>; Tue, 20 Jan 2026 19:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768938889; cv=none; b=PnkZNfGz1s9WHir8/CA/2zKzhYeUKY+6BxLn1Q6HJdBNgNRA8iB7f5+8+POxoSDtrrcY5G5mCAqqTLo7F3KGeBQxgtDWOU0uB6bKuzwEZom6nJAgZz7uPf8ihsveH2I9lKZYWwZxq9H3d1XRxeQ3DWicjRQbgKQOxhJa5TgTkQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768938889; c=relaxed/simple;
	bh=g6sHea/KAFwpEd7flzRem9YK8r3ZWWcLAjUOIAh6xRA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S9uFWWQ0l3x5gDwQW3JzEr8VbMr9MBnQtdyTXo0gj+YcCoPOo6neTcZ+ZlGtUXCeZYyQaki8tyv3YbgojZ9mDbEtP85fYOxX+FaXVlC/NmH7nXOpGbbGOGVInfq/sx1czyZ2QJp5t616TBodr2iyBGdqbfmh1uo4YHAFSqi4WFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=gIy4FMKF; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="gIy4FMKF"
Received: from mail.zytor.com ([IPv6:2601:646:8081:9483:12c5:bc8e:d949:3497])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 60KJsD3A3899199
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Tue, 20 Jan 2026 11:54:20 -0800
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 60KJsD3A3899199
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025122301; t=1768938861;
	bh=zt7T/6XDlNvfV1mQ2N69K6rQQbZfmJFfaBmLXqu7Q1o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gIy4FMKF/fza2Kuytw7bD109DrS5ePisT5hH+Oqoai6K/s8i1FMHUiw6mPNkTajQq
	 9W6OW7gAo3GINqtipQ6sH2JdnHps8l2+p5yyAWgbPO7Sye2tSn2I1utkZBIzYbKBib
	 RqiOTuh680ioPRfWyI5zdurBiQqzDZHQ1A25WotzwbyEWVoBaUY6zcQjjqV13rFHRE
	 +pTofkb/cAvFz1T9HtYKoaUd7UTMSVqbM/M+Vf09fBs4+MUCmB8gl+6G/tU6SPeaEZ
	 kt6oUHSJfWFWiowHGv9ZgTXCP7ezrF2Bby9e+M2X434K4TUfPVL9xP6AT4GRBwC4A5
	 FVH/pFPJKhH/w==
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
Subject: [PATCH v1 03/14] x86/boot: use <linux/compiler.h>
Date: Tue, 20 Jan 2026 11:53:55 -0800
Message-ID: <20260120195407.1163051-4-hpa@zytor.com>
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

Include <linux/compiler.h> in arch/x86/boot/boot.h and replace
__attribute__((noreturn)) with __noreturn.

Signed-off-by: H. Peter Anvin (Intel) <hpa@zytor.com>
---
 arch/x86/boot/boot.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/x86/boot/boot.h b/arch/x86/boot/boot.h
index f185931283cb..1f2b7252e387 100644
--- a/arch/x86/boot/boot.h
+++ b/arch/x86/boot/boot.h
@@ -18,6 +18,7 @@
 
 #ifndef __ASSEMBLER__
 
+#include <linux/compiler.h>
 #include <asm/shared/io.h>
 #include <linux/stdarg.h>
 #include <linux/types.h>
@@ -279,17 +280,16 @@ void console_init(void);
 void query_edd(void);
 
 /* header.S */
-void __attribute__((noreturn)) die(void);
+void __noreturn die(void);
 
 /* memory.c */
 void detect_memory(void);
 
 /* pm.c */
-void __attribute__((noreturn)) go_to_protected_mode(void);
+void __noreturn go_to_protected_mode(void);
 
 /* pmjump.S */
-void __attribute__((noreturn))
-	protected_mode_jump(u32 entrypoint, u32 bootparams);
+void __noreturn protected_mode_jump(u32 entrypoint, u32 bootparams);
 
 /* printf.c */
 int sprintf(char *buf, const char *fmt, ...);
-- 
2.52.0

