Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 644E7399A62
	for <linux-coco@lists.linux.dev>; Tue, 20 Jan 2026 19:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768938889; cv=none; b=SsauWHtbg8PDCjsn8Bk8izpruBZBuYdDa3ybL2lrJYSM7YOcnll780yyEPaQcHAGTYTzhz6bI0otvxB8o5yqVlkoZ5CsuhOQqbjQ1TpmERGZc0nEGwO/VDZjn1NI8NBRADQMP9utSGAimxYBOP7wrklYUDBrBwjrMHJtdkXBYm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768938889; c=relaxed/simple;
	bh=Bj2ziLTpsCe5BZ24TEUz3Ts+WdMM2I5uygLOAv1e9t0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YdaPeOtzCPb5NH6nRhn3VTUvr1IBv0DwyO5DCFcne2X3Nfb8dD9c1gBkKTZ1+5UvrRaaSzuNDzqKM/sa2bwFSKRWBfsPP+FYs6Ld5pBVdL3M612roDYQYmTx2WqGrD4qC560Pp7YRe3Lb5iT4xTEkfk98WLOFIQUFHswWO7+GI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=KZ6eEuJj; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="KZ6eEuJj"
Received: from mail.zytor.com ([IPv6:2601:646:8081:9483:12c5:bc8e:d949:3497])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 60KJsD3D3899199
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Tue, 20 Jan 2026 11:54:24 -0800
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 60KJsD3D3899199
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025122301; t=1768938865;
	bh=NFUby8qM7aSboPB+19i5VTqV1XhLfa94fpQvQMZdh8w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KZ6eEuJjaJWvwk32R5nWuywpM+YX0vVnQ4Kf4tDuaRmmeF9nS6kCU2BWo9dKNHwfu
	 4poXUrgs9K5DIBQ6Iehnx4arYi70TdGLBuBsh1axVDEAr7iTICSH5cEYgNClH0qacO
	 tLPOysoVPqDn4amUC1ismo9N5hdTO24EwVi9nElhE7H58KhJHQk5sjWyxv+eWNh3jr
	 r1nxNbl6s5DmQ5qg0X1eO1R6+UTQ2pzA3jqsPcJvBs5Kl/h2NDhN00eK28RggFTUHU
	 x7OJWbTafxyDHm2cHN4qAODlBAUNzU0z5zuMHsOkUo/bZ+h/iq+SprbHK9bp5Ifofh
	 uEWykPdUp+ufA==
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
Subject: [PATCH v1 06/14] x86/boot: add comment barriers for the different headers
Date: Tue, 20 Jan 2026 11:53:58 -0800
Message-ID: <20260120195407.1163051-7-hpa@zytor.com>
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

Add better comment barriers at the top of the PECOFF header and the
bzImage header to make it easier to find the source for the respective
chunks of data.

Signed-off-by: H. Peter Anvin (Intel) <hpa@zytor.com>
---
 arch/x86/boot/header.S | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/x86/boot/header.S b/arch/x86/boot/header.S
index 5a54d33e51c2..d74db02928e6 100644
--- a/arch/x86/boot/header.S
+++ b/arch/x86/boot/header.S
@@ -40,6 +40,9 @@ SYSSEG		= 0x1000		/* historical load address >> 4 */
 	.set	falign, 0x200
 
 	.code16
+
+# EFI PECOFF header ##########################################################
+
 	.section ".header", "a"
 #ifdef CONFIG_EFI_STUB
 	# "MZ", MS-DOS header
@@ -224,6 +227,8 @@ pecompat_fstart:
 
 #endif /* CONFIG_EFI_STUB */
 
+# bzImage header #############################################################
+
 	# hdr should be at address 0x1f1; -2 for the sentinel
 	.org	0x1f1-2, 0xff			# Fill with 0xff
 
@@ -545,7 +550,7 @@ kernel_info_offset:	.long ZO_kernel_info
 	.globl end_of_bzheader
 end_of_bzheader:
 
-# End of setup header #####################################################
+# End of bzImage header ######################################################
 
 	.section ".entrytext", "ax"
 	.globl start_of_setup
-- 
2.52.0

