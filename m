Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57D6B2C83
	for <linux-coco@lists.linux.dev>; Thu, 18 Nov 2021 02:13:51 +0000 (UTC)
Received: by mail-pj1-f73.google.com with SMTP id bf17-20020a17090b0b1100b001a634dbd737so4107502pjb.9
        for <linux-coco@lists.linux.dev>; Wed, 17 Nov 2021 18:13:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=2Js2iHBO2bZVfNMqUVey3hZaIS7yAI9P1HePKZNMPjA=;
        b=StB2FGyNfxc2zpcYOPcBGNktxSHAjN23Ec7WAeY4so4yqYSmScPquLDjh/m9LV6HoD
         fdeYbBmfy+fBMvCLrQIkwr8RtHFOeN66RsiUBCKDCuLcXaIUOctrG8WTCjEwgJngXVGn
         Mml8YfwIFTYHOJbx6McEHlVqRUwkcpoNbjf0G1FcfxeKoMU43aHKxgx3IYNasIznozau
         eWsfRSHcaPAtEeVhpJTfs7WqRiu7tzIzY2bhel28rQG0KKQ039eutWnGlNI5Ir8fg+64
         zRuzue/dg6kjgVDJZJBAhtL6vltRf02h4jcympZOGzVIrxcAiGrW0IHStrnbaltYIxJY
         h0hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=2Js2iHBO2bZVfNMqUVey3hZaIS7yAI9P1HePKZNMPjA=;
        b=XQ9OFoctvRWrMVLS9oIqf0++LAlDbg9tsX497zSr4m6WxXOQiY9M89Kght9/NhyzIe
         B7GicP+vkxH6QlGdsPSXWh3mqGLUhzbD1UKx+O+1LOLaWP3SWFmNO7gr8DlwYcRu3Xn8
         yGvrwpedy3MaIvExIUBQwY6rvupmt71+W0f9ybk9mzPN6UeUsLRRY6Dz9Qh0kbu46Vcg
         5iuYnEt8tG9u3TKqeZRFyEnSJ99y57Sm5+aKSgbn/YOuvI79vqVDTIRe1DwFFp65bpz0
         enZvJzixi8X3HbW+E3e5XZnf/JYXbCD6xFlMtTSBGrjg9t2sjtL96OOiDhkaKHlHxsjy
         hTsQ==
X-Gm-Message-State: AOAM531BWMk48vMPLGE3jYzmO/zyhEyMDlPLaB7HsZy+z2uE0gqz+5yV
	FQXaAcwsjhSnJiELCbvKKcDReUTkiQYQVQ==
X-Google-Smtp-Source: ABdhPJzVZ+TP2/CXOW9X27brrp2kSoZ7P1RxWqUT/XC+pIhpI+apST8WXWlgTXn/BrCtbSo7L3BMTH6FBf2RYg==
X-Received: from tlingit.sea.corp.google.com ([2620:15c:17:3:48cc:d46b:ea6d:e005])
 (user=sterritt job=sendgmr) by 2002:a17:90b:4b04:: with SMTP id
 lx4mr5844564pjb.11.1637201630693; Wed, 17 Nov 2021 18:13:50 -0800 (PST)
Date: Wed, 17 Nov 2021 18:13:26 -0800
Message-Id: <20211118021326.4134850-1-sterritt@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.34.0.rc2.393.gf8c9666880-goog
Subject: [PATCH] Fix SEV-ES INS/OUTS instructions for word, dword, and qword.
From: Michael Sterritt <sterritt@google.com>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Joerg Roedel <jroedel@suse.de>, Peter Zijlstra <peterz@infradead.org>, 
	Tom Lendacky <thomas.lendacky@amd.com>, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	virtualization@lists.linux-foundation.org, linux-coco@lists.linux.dev
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

Signed-off-by: Michael Sterritt <sterritt@google.com>
Reviewed-by: Marc Orr <marcorr@google.com>
Reviewed-by: Peter Gonda <pgonda@google.com>
---
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

