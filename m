Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C750410D1D
	for <linux-coco@lists.linux.dev>; Tue, 20 Jan 2026 19:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768938900; cv=none; b=s7WcslDtej0eCIx6M6wIg9SL60r7QjWTF5OFp03v9hcNP+6ffCyOEVGfs8pNnY/93fiWou0HI/wJv8kSRu+dr54luEKWjdircd4QmH7YQrGUwglrzWhRXDzawJxP1IuGZV0cbfVRHtYjf3RhZ699RD2lM00T5M56LzJ42JzZRTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768938900; c=relaxed/simple;
	bh=LBxdsT6zNKsJO/Sx1ifhb2dPpGgksxxDynxFV0ztctw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SlGoSJ6Okg2vVkP9tTa6m94AX6OTgs7YfwHnwf57AVAJqcCgSxGpIY8bUeYfFvDvLarl1RgGMfRCnxtzNdlz3FYYpW2Thg6LnXAjJ/VwLLKjLEuciysVIGRN+K4rl/RRXhzPbtKsCf21NldxaijGuzKVYz0zk79UBwSupOXRtpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=iHkvsy3h; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="iHkvsy3h"
Received: from mail.zytor.com ([IPv6:2601:646:8081:9483:12c5:bc8e:d949:3497])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 60KJsD3I3899199
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Tue, 20 Jan 2026 11:54:31 -0800
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 60KJsD3I3899199
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025122301; t=1768938872;
	bh=lC6mgLfuk0/kOJZaYu1MaK8TsF5kxYLUg+2v1N2MSns=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iHkvsy3hUyCcKR5DbfHKEZEJsI40nZc8CbU2s0SJYP3lAdLnuKCv9UARPfjAsjCO8
	 St6zhOGnKasJwArhDU6Q/LmMBsX1sSLx/TMXRKh9Zf583qhiHaGlUsHv5U2QAQoFoa
	 oRbKnmZ6SHtcpoDRLa5QzYboV8wwRCb5iOUcBJg8clMeBU7XwmNYzn2ZWdK9SP5/Ut
	 b46ywkV3gFeJLhMna8tpfOMicxCBGFTZb0qU1+B1kWeDhuDAgnTmlkt1fKFwVAjojY
	 yrnr34R8rBHJ5HtAplTZcS/oX+KbAdTEKIR4EsjOLJbkYBBp4PR4p6JQLspyBbzaI/
	 Rx/PRj3cJTZLQ==
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
Subject: [PATCH v1 11/14] x86/boot: use __seg_fs and __seg_gs in the real-mode boot code
Date: Tue, 20 Jan 2026 11:54:03 -0800
Message-ID: <20260120195407.1163051-12-hpa@zytor.com>
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

All supported versions of gcc support __seg_fs and __seg_gs now.
All supported versions of clang support __seg_fs and __seg_gs too,
except for two bugs (as of clang 21, at least):

1. The %fs: and %gs: prefix does not get emitted in inline assembly.
2. An internal compiler error when addressing symbols directly.

However, none of these are required in the boot code. Furthermore,
this makes it possible to remove the absolute_pointer() hack in the
fs/gs access functions.

This requires adding a barrier() to a20.c, to prevent the compiler
from eliding the load from the aliased memory address.

Remove the unused memcmp_[fg]s() functions.

Finally, ds() is by necessity constant, so mark the function as such.

Signed-off-by: H. Peter Anvin (Intel) <hpa@zytor.com>
---
 arch/x86/boot/a20.c  |  1 +
 arch/x86/boot/boot.h | 81 ++++++++++++++------------------------------
 2 files changed, 27 insertions(+), 55 deletions(-)

diff --git a/arch/x86/boot/a20.c b/arch/x86/boot/a20.c
index 3ab6cd8eaa31..52c3fccdcb70 100644
--- a/arch/x86/boot/a20.c
+++ b/arch/x86/boot/a20.c
@@ -63,6 +63,7 @@ static int a20_test(int loops)
 	while (loops--) {
 		wrgs32(++ctr, A20_TEST_ADDR);
 		io_delay();	/* Serialize and make delay constant */
+		barrier();	/* Compiler won't know about fs/gs overlap */
 		ok = rdfs32(A20_TEST_ADDR+0x10) ^ ctr;
 		if (ok)
 			break;
diff --git a/arch/x86/boot/boot.h b/arch/x86/boot/boot.h
index b4eb8405ba55..4d3549ed7987 100644
--- a/arch/x86/boot/boot.h
+++ b/arch/x86/boot/boot.h
@@ -45,7 +45,7 @@ static inline void io_delay(void)
 
 /* These functions are used to reference data in other segments. */
 
-static inline u16 ds(void)
+static inline __attribute_const__ u16 ds(void)
 {
 	u16 seg;
 	asm("movw %%ds,%0" : "=rm" (seg));
@@ -54,7 +54,7 @@ static inline u16 ds(void)
 
 static inline void set_fs(u16 seg)
 {
-	asm volatile("movw %0,%%fs" : : "rm" (seg));
+	asm volatile("movw %0,%%fs" : : "rm" (seg) : "memory");
 }
 static inline u16 fs(void)
 {
@@ -65,7 +65,7 @@ static inline u16 fs(void)
 
 static inline void set_gs(u16 seg)
 {
-	asm volatile("movw %0,%%gs" : : "rm" (seg));
+	asm volatile("movw %0,%%gs" : : "rm" (seg) : "memory");
 }
 static inline u16 gs(void)
 {
@@ -76,96 +76,67 @@ static inline u16 gs(void)
 
 typedef unsigned int addr_t;
 
+/*
+ * WARNING: as of clang 21, clang has the following two bugs related
+ * to __seg_fs and __seg_gs:
+ *
+ * 1. The %fs: and %gs: prefix does not get emitted in inline assembly.
+ * 2. An internal compiler error when addressing symbols directly.
+ *
+ * Neither of those constructs are currently used in the boot code.
+ * If they ever are, and those bugs still remain, then those bugs will
+ * need to be worked around.
+ */
 static inline u8 rdfs8(addr_t addr)
 {
-	u8 *ptr = (u8 *)absolute_pointer(addr);
-	u8 v;
-	asm volatile("movb %%fs:%1,%0" : "=q" (v) : "m" (*ptr));
-	return v;
+	return *(__seg_fs const u8 *)addr;
 }
 static inline u16 rdfs16(addr_t addr)
 {
-	u16 *ptr = (u16 *)absolute_pointer(addr);
-	u16 v;
-	asm volatile("movw %%fs:%1,%0" : "=r" (v) : "m" (*ptr));
-	return v;
+	return *(__seg_fs const u16 *)addr;
 }
 static inline u32 rdfs32(addr_t addr)
 {
-	u32 *ptr = (u32 *)absolute_pointer(addr);
-	u32 v;
-	asm volatile("movl %%fs:%1,%0" : "=r" (v) : "m" (*ptr));
-	return v;
+	return *(__seg_fs const u32 *)addr;
 }
 
 static inline void wrfs8(u8 v, addr_t addr)
 {
-	u8 *ptr = (u8 *)absolute_pointer(addr);
-	asm volatile("movb %1,%%fs:%0" : "+m" (*ptr) : "qi" (v));
+	*(__seg_fs u8 *)addr = v;
 }
 static inline void wrfs16(u16 v, addr_t addr)
 {
-	u16 *ptr = (u16 *)absolute_pointer(addr);
-	asm volatile("movw %1,%%fs:%0" : "+m" (*ptr) : "ri" (v));
+	*(__seg_fs u16 *)addr = v;
 }
 static inline void wrfs32(u32 v, addr_t addr)
 {
-	u32 *ptr = (u32 *)absolute_pointer(addr);
-	asm volatile("movl %1,%%fs:%0" : "+m" (*ptr) : "ri" (v));
+	*(__seg_fs u32 *)addr = v;
 }
 
 static inline u8 rdgs8(addr_t addr)
 {
-	u8 *ptr = (u8 *)absolute_pointer(addr);
-	u8 v;
-	asm volatile("movb %%gs:%1,%0" : "=q" (v) : "m" (*ptr));
-	return v;
+	return *(__seg_gs const u8 *)addr;
 }
 static inline u16 rdgs16(addr_t addr)
 {
-	u16 *ptr = (u16 *)absolute_pointer(addr);
-	u16 v;
-	asm volatile("movw %%gs:%1,%0" : "=r" (v) : "m" (*ptr));
-	return v;
+	return *(__seg_gs const u16 *)addr;
 }
 static inline u32 rdgs32(addr_t addr)
 {
-	u32 *ptr = (u32 *)absolute_pointer(addr);
-	u32 v;
-	asm volatile("movl %%gs:%1,%0" : "=r" (v) : "m" (*ptr));
-	return v;
+	return *(__seg_gs const u32 *)addr;
 }
 
 static inline void wrgs8(u8 v, addr_t addr)
 {
-	u8 *ptr = (u8 *)absolute_pointer(addr);
-	asm volatile("movb %1,%%gs:%0" : "+m" (*ptr) : "qi" (v));
+	*(__seg_gs u8 *)addr = v;
 }
 static inline void wrgs16(u16 v, addr_t addr)
 {
-	u16 *ptr = (u16 *)absolute_pointer(addr);
-	asm volatile("movw %1,%%gs:%0" : "+m" (*ptr) : "ri" (v));
+	*(__seg_gs u16 *)addr = v;
 }
 static inline void wrgs32(u32 v, addr_t addr)
 {
-	u32 *ptr = (u32 *)absolute_pointer(addr);
-	asm volatile("movl %1,%%gs:%0" : "+m" (*ptr) : "ri" (v));
-}
-
-/* Note: these only return true/false, not a signed return value! */
-static inline bool memcmp_fs(const void *s1, addr_t s2, size_t len)
-{
-	bool diff;
-	asm volatile("fs repe cmpsb"
-		     : "=@ccnz" (diff), "+D" (s1), "+S" (s2), "+c" (len));
-	return diff;
-}
-static inline bool memcmp_gs(const void *s1, addr_t s2, size_t len)
-{
-	bool diff;
-	asm volatile("gs repe cmpsb"
-		     : "=@ccnz" (diff), "+D" (s1), "+S" (s2), "+c" (len));
-	return diff;
+	*(__seg_gs u32 *)addr = v;
 }
 
 /* Heap -- available for dynamic lists. */
-- 
2.52.0

