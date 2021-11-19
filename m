Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4938C72
	for <linux-coco@lists.linux.dev>; Fri, 19 Nov 2021 23:28:25 +0000 (UTC)
Received: by mail-pj1-f73.google.com with SMTP id x18-20020a17090a789200b001a7317f995cso7434034pjk.4
        for <linux-coco@lists.linux.dev>; Fri, 19 Nov 2021 15:28:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=/zHQQd91JFNoHasSQi/nfyj1Wxibp++TCtqdqtIjtTs=;
        b=XnbbwklDAmroFFywNTBERvypKaBDSA+P/QscNT1ynZB0dP3t7WUnVbrPoB/xpPeCLC
         4t00FLvvGh2D1Gnn1CX/oj3KF4+LQrRXHcPMZz2td/r4gjNgGzxLUTDWxHSqjOOaKroR
         EgIQPyZU/SJRF/NS/Dr/E8WiYC7LR1KISRBi6thLsNfZk6potNndmCXngm01hn7Swc9r
         bn23yczNJuMFrCjzpcbH38/2KFc1eJnEJwgGH/r2IPYW1gAEwevY1ob/S4kq5F3pnwrK
         454eGUfK9Tc4leUTPvLGm80UYm+Kgl9/vwBQTk1YWBZJ5NxDtGmVlhXDR0oQGBiYjqgh
         S1cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=/zHQQd91JFNoHasSQi/nfyj1Wxibp++TCtqdqtIjtTs=;
        b=hSyAZIlxitDPL9Rk2wSn+bVseu4c/DQUrk3hu8pAFrsngX6zmjhyhks/pExQ6t/hR0
         5hZACcn84so/NZUSr6/CPjCT5LbYFdV9vLiklvhRMMs9HtzEZSbOk6E1iUJMbm04mlUW
         eQuUBzol0diHUQOKapbp63VLTfc8ErT4ZmsfE/0GMu/JlNHf/oOnuhT37KFyCGdyq71/
         qCuZUtwcsNMCzFWEokgobVM2cWDJTOLeCwyjLHvwbd1ttBX6EgEJL2SHt6YnMSdyYvWq
         g1OJaG7O+J8gHrI6dqTdU8cMnJJbtl2GLzk0nl0WK3l7TQQmTG2z+zgVEajyxundvzuQ
         94HQ==
X-Gm-Message-State: AOAM531cnQGaUS9J0fS+oNNmozMY8i/Hi7WIFUrOSYqtsSZM1aHHuZWK
	DMdoZ8ik+M3EPQ1j9KvowFsnFde9atfgmw==
X-Google-Smtp-Source: ABdhPJwrXfErxaUWOQl4L7vsAq0l7N/+r2OuivgwyzCLXk4aA+5R/JXfEdf6HZj1yvppm0lrmpV7nHeGceYxTA==
X-Received: from tlingit.sea.corp.google.com ([2620:15c:17:3:48eb:bce1:8332:525e])
 (user=sterritt job=sendgmr) by 2002:aa7:9628:0:b0:494:6dc8:66de with SMTP id
 r8-20020aa79628000000b004946dc866demr26253370pfg.73.1637364504429; Fri, 19
 Nov 2021 15:28:24 -0800 (PST)
Date: Fri, 19 Nov 2021 15:27:57 -0800
Message-Id: <20211119232757.176201-1-sterritt@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.34.0.rc2.393.gf8c9666880-goog
Subject: [PATCH v2] x86/sev-es: Fix SEV-ES INS/OUTS instructions for word,
 dword, and qword
From: Michael Sterritt <sterritt@google.com>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Joerg Roedel <jroedel@suse.de>, Peter Zijlstra <peterz@infradead.org>, 
	Tom Lendacky <thomas.lendacky@amd.com>, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	virtualization@lists.linux-foundation.org, linux-coco@lists.linux.dev, 
	Paolo Bonzini <pbonzini@redhat.com>
Cc: marcorr@google.com, pgonda@google.com, 
	Michael Sterritt <sterritt@google.com>
Content-Type: text/plain; charset="UTF-8"

Properly type the operands being passed to __put_user()/__get_user().
Otherwise, these routines truncate data for dependent instructions
(e.g., INSW) and only read/write one byte.

Tested: Tested by sending a string with `REP OUTSW` to a port and then
reading it back in with `REP INSW` on the same port. Previous behavior
was to only send and receive the first char of the size. For example,
word operations for "abcd" would only read/write "ac". With change, the
full string is now written and read back.

Fixes: f980f9c31a923 (x86/sev-es: Compile early handler code into kernel image)
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Marc Orr <marcorr@google.com>
Reviewed-by: Peter Gonda <pgonda@google.com>
Signed-off-by: Michael Sterritt <sterritt@google.com>
---
v1 -> v2
* Changes subject
* Added fixes tag
* Added Paolo's reviewed-by
 arch/x86/kernel/sev.c | 57 +++++++++++++++++++++++++++++--------------
 1 file changed, 39 insertions(+), 18 deletions(-)

diff --git a/arch/x86/kernel/sev.c b/arch/x86/kernel/sev.c
index 74f0ec955384..a9fc2ac7a8bd 100644
--- a/arch/x86/kernel/sev.c
+++ b/arch/x86/kernel/sev.c
@@ -294,11 +294,6 @@ static enum es_result vc_write_mem(struct es_em_ctxt *ctxt,
 				   char *dst, char *buf, size_t size)
 {
 	unsigned long error_code = X86_PF_PROT | X86_PF_WRITE;
-	char __user *target = (char __user *)dst;
-	u64 d8;
-	u32 d4;
-	u16 d2;
-	u8  d1;
 
 	/*
 	 * This function uses __put_user() independent of whether kernel or user
@@ -320,26 +315,42 @@ static enum es_result vc_write_mem(struct es_em_ctxt *ctxt,
 	 * instructions here would cause infinite nesting.
 	 */
 	switch (size) {
-	case 1:
+	case 1: {
+		u8 d1;
+		u8 __user *target = (u8 __user *)dst;
+
 		memcpy(&d1, buf, 1);
 		if (__put_user(d1, target))
 			goto fault;
 		break;
-	case 2:
+	}
+	case 2: {
+		u16 d2;
+		u16 __user *target = (u16 __user *)dst;
+
 		memcpy(&d2, buf, 2);
 		if (__put_user(d2, target))
 			goto fault;
 		break;
-	case 4:
+	}
+	case 4: {
+		u32 d4;
+		u32 __user *target = (u32 __user *)dst;
+
 		memcpy(&d4, buf, 4);
 		if (__put_user(d4, target))
 			goto fault;
 		break;
-	case 8:
+	}
+	case 8: {
+		u64 d8;
+		u64 __user *target = (u64 __user *)dst;
+
 		memcpy(&d8, buf, 8);
 		if (__put_user(d8, target))
 			goto fault;
 		break;
+	}
 	default:
 		WARN_ONCE(1, "%s: Invalid size: %zu\n", __func__, size);
 		return ES_UNSUPPORTED;
@@ -362,11 +373,6 @@ static enum es_result vc_read_mem(struct es_em_ctxt *ctxt,
 				  char *src, char *buf, size_t size)
 {
 	unsigned long error_code = X86_PF_PROT;
-	char __user *s = (char __user *)src;
-	u64 d8;
-	u32 d4;
-	u16 d2;
-	u8  d1;
 
 	/*
 	 * This function uses __get_user() independent of whether kernel or user
@@ -388,26 +394,41 @@ static enum es_result vc_read_mem(struct es_em_ctxt *ctxt,
 	 * instructions here would cause infinite nesting.
 	 */
 	switch (size) {
-	case 1:
+	case 1: {
+		u8 d1;
+		u8 __user *s = (u8 __user *)src;
+
 		if (__get_user(d1, s))
 			goto fault;
 		memcpy(buf, &d1, 1);
 		break;
-	case 2:
+	}
+	case 2: {
+		u16 d2;
+		u16 __user *s = (u16 __user *)src;
+
 		if (__get_user(d2, s))
 			goto fault;
 		memcpy(buf, &d2, 2);
 		break;
-	case 4:
+	}
+	case 4: {
+		u32 d4;
+		u32 __user *s = (u32 __user *)src;
+
 		if (__get_user(d4, s))
 			goto fault;
 		memcpy(buf, &d4, 4);
 		break;
-	case 8:
+	}
+	case 8: {
+		u64 d8;
+		u64 __user *s = (u64 __user *)src;
 		if (__get_user(d8, s))
 			goto fault;
 		memcpy(buf, &d8, 8);
 		break;
+	}
 	default:
 		WARN_ONCE(1, "%s: Invalid size: %zu\n", __func__, size);
 		return ES_UNSUPPORTED;
-- 
2.34.0.rc2.393.gf8c9666880-goog

