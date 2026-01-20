Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC9CB3D3300
	for <linux-coco@lists.linux.dev>; Tue, 20 Jan 2026 19:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768938896; cv=none; b=Ci3GOl2yzjXm1jbbSZDNmUYiNupptp7uarpJax+aFI8JNrQZLT6f3z4JpXkI4eOVzPISiYGLYWTfy73eIfqmdlb5W55poFpkVr7+jIY4/4XwntuEPYrH+gJBiiJ3+FI4pmVn2zpuIp1s8MZ7B1Q71bmDphxXdTZyLP8rAYtc4co=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768938896; c=relaxed/simple;
	bh=vwbvR4PSA3kE6W9cqx+emJ/NFWHvT7QK3VG05OdBQks=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YXLxbBADJ3tez7J+DO2aaHgnri3Cn4SG/OJ3Wk08OeyiglekfJt52zzRpZW8pxTC9uyOVuhGTk51JLYn3xXb7r7qinNs2cfOScm9rKbBTj3fF+4NN83pMyarM0hGeAPPJ2KtOjBi9rKhJH0KJ/hLrKKhRzHWjNY592NUm8NUjZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=XSnk9ITx; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="XSnk9ITx"
Received: from mail.zytor.com ([IPv6:2601:646:8081:9483:12c5:bc8e:d949:3497])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 60KJsD3H3899199
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Tue, 20 Jan 2026 11:54:30 -0800
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 60KJsD3H3899199
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025122301; t=1768938871;
	bh=Pc8Z7/dwfRkBhL7bxG7h+eyD8Fb6lWN9llBPu5Gj3nM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XSnk9ITxTvgXx7rIAhi1yz9FIwxZc2ceRwCvHuYTHTWBgwYsYQBh3JBXJrTNCY0lW
	 EkpeDz7LmCUXQMvJGoQ9Yft6noHQvm/m+cutWs3pDmE8FJGpSbGc3GoCy7e+jH3Nqi
	 IQC3wEJXq+bLt8MIp1UrmTSwPK7krGrhQb8+MCrATctoZRJ5Cz9edYld37ZksXESAb
	 ues2XYIxdo0gDKp+EAobOW/vubpNR8uh0IY97ixnCeUpRAd+SWyQCynzh8kd25k30l
	 MUvrmbFiPCWxblJUg1HX1uz1ih7OubHFqiLCLOE0FdhhJuAljjHGYwdHmZLMAaCzHI
	 wqr/fNJeN3qww==
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
Subject: [PATCH v1 10/14] x86/boot: explicitly put the old command line pointer in header.S
Date: Tue, 20 Jan 2026 11:54:02 -0800
Message-ID: <20260120195407.1163051-11-hpa@zytor.com>
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

Put the location for the old command line pointer into header.S. This
not only makes the layout of the header data more explicit, but it
also removes the need for the absolute_pointer() hack in
arch/x86/boot/main.c.

Signed-off-by: H. Peter Anvin (Intel) <hpa@zytor.com>
---
 arch/x86/boot/header.S |  7 +++++++
 arch/x86/boot/main.c   | 32 ++++++++++++++++----------------
 2 files changed, 23 insertions(+), 16 deletions(-)

diff --git a/arch/x86/boot/header.S b/arch/x86/boot/header.S
index 2828b25707bb..4eb12443dafa 100644
--- a/arch/x86/boot/header.S
+++ b/arch/x86/boot/header.S
@@ -43,6 +43,13 @@ SYSSEG		= 0x1000		/* historical load address >> 4 */
 	.section ".header", "a"
 	# "MZ", MS-DOS header
 	.word	IMAGE_DOS_SIGNATURE
+
+	.org	0x20
+	# Used for the command line protocol in boot protocols 2.00-2.01
+	.globl	old_cmdline
+old_cmdline:
+	.word	0, 0
+
 	.org	0x38
 	#
 	# Offset to the PE header.
diff --git a/arch/x86/boot/main.c b/arch/x86/boot/main.c
index ad8869aad6db..864da3deab18 100644
--- a/arch/x86/boot/main.c
+++ b/arch/x86/boot/main.c
@@ -22,36 +22,36 @@ char *HEAP = _end;
 char *heap_end = _end;		/* Default end of heap = no heap */
 
 /*
- * Copy the header into the boot parameter block.  Since this
- * screws up the old-style command line protocol, adjust by
- * filling in the new-style command line pointer instead.
+ * Copy the header into the boot parameter block.  Since this screws
+ * up the old-style command line protocol (protocol 2.00-2.01), adjust
+ * by filling in the new-style command line pointer instead.
  */
+struct old_cmdline {
+	u16 cl_magic;
+	u16 cl_offset;
+};
+extern const struct old_cmdline old_cmdline;
+
 static void copy_boot_params(void)
 {
-	struct old_cmdline {
-		u16 cl_magic;
-		u16 cl_offset;
-	};
-	const struct old_cmdline * const oldcmd = absolute_pointer(OLD_CL_ADDRESS);
-
 	BUILD_BUG_ON(sizeof(boot_params) != 4096);
 	memcpy(&boot_params.hdr, &hdr, sizeof(hdr));
 
-	if (!boot_params.hdr.cmd_line_ptr && oldcmd->cl_magic == OLD_CL_MAGIC) {
+	if (!boot_params.hdr.cmd_line_ptr &&
+	    old_cmdline.cl_magic == OLD_CL_MAGIC) {
 		/* Old-style command line protocol */
-		u16 cmdline_seg;
+		u32 cmdline_base = 0x90000;
 
 		/*
 		 * Figure out if the command line falls in the region
 		 * of memory that an old kernel would have copied up
 		 * to 0x90000...
 		 */
-		if (oldcmd->cl_offset < boot_params.hdr.setup_move_size)
-			cmdline_seg = ds();
-		else
-			cmdline_seg = 0x9000;
+		if (old_cmdline.cl_offset < boot_params.hdr.setup_move_size)
+			cmdline_base = ds() << 4;
 
-		boot_params.hdr.cmd_line_ptr = (cmdline_seg << 4) + oldcmd->cl_offset;
+		boot_params.hdr.cmd_line_ptr =
+			cmdline_base + old_cmdline.cl_offset;
 	}
 }
 
-- 
2.52.0

