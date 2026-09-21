Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B29D43B6367
	for <linux-coco@lists.linux.dev>; Mon, 21 Sep 2026 19:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790020384; cv=none; b=eNff5biMJFjSQmBChcgB1CVoLscjoApmDs15rqHm0e+dxwGM8eWHdOx55eEkVCY9Nr1RkZdb5NDZmIcD/4Z76MWUY2YV94ecJSaXvH3c9OD/45sJnD3kw+IZ8+KgK7DsypZduyNV2G2xublptnPnBdacy6XhjpmdBXZEpLGDzjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790020384; c=relaxed/simple;
	bh=yYFOxPWxF+ebjxNifaNu6ojjenfBN450qHPMmQOo3ao=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=q5R3pg+QkVH95hOHQccdAx0Io4I5SGXOzMYfF7AMnN8dzhrdw0ruGc7kJsrRduYtgxKlylcPQZJLySJD08XRczmYGBzEP9S2l7kG/SqemgWL/gbsx+fNv8AjSW6fD12jqh3I9uMFKqqd39Vy4hKIfUAN8nK6PVgFIQBFC5JkSDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JjG6pd/s; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JjG6pd/s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790020382; x=1821556382;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=yYFOxPWxF+ebjxNifaNu6ojjenfBN450qHPMmQOo3ao=;
  b=JjG6pd/s5BH93Bd5QZp3DznFgXCHLyce54jCAp73+5vLKLzdBxkmaukR
   mBuHEObgXXleTppv+EqOcIQL6xlApivglUW1f88+fK4YtIPB0MomkWAF9
   2aAN6tko8qthegtY8jp68kriR8//1er3npUV2fXCi3yNgrkpENt3E7C51
   018Yi9d2/eXhGZdG0My8il2odnXJmAD0oRUUuSpvthz5c7ELz5tDNNkP3
   UpJSZLXdiU3pM23TdnnWsc2MD+bJpbCkkRsXe3bEpALXg5aC27ScPdwxn
   +WWUcwY3LWqdjdUEFFmJryM9bQliDPaoB2x0rM1VTQzt8z0VTp00lBLG+
   w==;
X-CSE-ConnectionGUID: 44vTbhNPT/yGdttqvlBk1g==
X-CSE-MsgGUID: Q69cdtG5TWqGwAkYn39m4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11912"; a="90435108"
X-IronPort-AV: E=Sophos;i="6.27,115,1787036400"; 
   d="scan'208";a="90435108"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2026 12:53:01 -0700
X-CSE-ConnectionGUID: SNK0lIiUTJC40e0k5wZXSg==
X-CSE-MsgGUID: +Ss2GkCrT+6FKUIuHE16TA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,115,1787036400"; 
   d="scan'208";a="299041228"
Received: from vverma7-desk1.amr.corp.intel.com (HELO [192.168.1.200]) ([10.125.109.250])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2026 12:53:00 -0700
From: Vishal Verma <vishal.l.verma@intel.com>
Date: Mon, 21 Sep 2026 13:52:37 -0600
Subject: [PATCH v2 1/2] x86/tdx: Move port I/O definitions to a shared
 header
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-b4-tdx_earlyprintk_tdcalls-v2-1-ad1fde3f25fd@intel.com>
References: <20260921-b4-tdx_earlyprintk_tdcalls-v2-0-ad1fde3f25fd@intel.com>
In-Reply-To: <20260921-b4-tdx_earlyprintk_tdcalls-v2-0-ad1fde3f25fd@intel.com>
To: x86@kernel.org, Dave Hansen <dave.hansen@linux.intel.com>, 
 Kiryl Shutsemau <kas@kernel.org>, 
 Rick Edgecombe <rick.p.edgecombe@intel.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev, 
 kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
 Vishal Verma <vishal.l.verma@intel.com>
X-Mailer: b4 0.16-dev-62088
X-Developer-Signature: v=1; a=openpgp-sha256; l=3102;
 i=vishal.l.verma@intel.com; h=from:subject:message-id;
 bh=yYFOxPWxF+ebjxNifaNu6ojjenfBN450qHPMmQOo3ao=;
 b=owGbwMvMwCXGf25diOft7jLG02pJDFkbu6X7sp6GHLFns5x3/6TAl/vH75yrOftWXOOcy3mBn
 adeM6sIdZSyMIhxMciKKbL83fOR8Zjc9nyewARHmDmsTCBDGLg4BWAiVzYx/NOO1tl70uOudsCL
 3pXT/OSsBKz6nK7f+t3S1lFk2Hyi8S3DP/39Oxa+UFieFHF+T81d7rXnWkLyGV/rT//YxX//9av
 QDEYA
X-Developer-Key: i=vishal.l.verma@intel.com; a=openpgp;
 fpr=F8682BE134C67A12332A2ED07AFA61BEA3B84DFF

In preparation for adding a 'tdx' option for early_printk which uses
direct TDVMCALLs for I/O, factor out the PORT_READ and PORT_WRITE
definitions from arch/x86/coco/tdx/tdx.c into
arch/x86/include/asm/shared/tdx.h, and namespace them with 'TDVMCALL_'.

The decompressor also used 0/1 literals in its tdx_io_{in,out} helpers -
switch those to use the new definitions.

Signed-off-by: Vishal Verma <vishal.l.verma@intel.com>
Reviewed-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
Cc: Rick Edgecombe <rick.p.edgecombe@intel.com>
---
 arch/x86/include/asm/shared/tdx.h | 6 ++++++
 arch/x86/boot/compressed/tdx.c    | 4 ++--
 arch/x86/coco/tdx/tdx.c           | 8 ++------
 3 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/arch/x86/include/asm/shared/tdx.h b/arch/x86/include/asm/shared/tdx.h
index f20e91d7ac35..ecaf965f059b 100644
--- a/arch/x86/include/asm/shared/tdx.h
+++ b/arch/x86/include/asm/shared/tdx.h
@@ -84,6 +84,12 @@
 #define TDVMCALL_STATUS_ALIGN_ERROR	0x8000000000000002ULL
 #define TDVMCALL_STATUS_SUBFUNC_UNSUPPORTED	0x8000000000000003ULL
 
+/*
+ * TDG.VP.VMCALL<Instruction.IO> direction (passed in R13)
+ */
+#define TDVMCALL_PORT_READ		0
+#define TDVMCALL_PORT_WRITE		1
+
 /*
  * Bitmasks of exposed registers (with VMM).
  */
diff --git a/arch/x86/boot/compressed/tdx.c b/arch/x86/boot/compressed/tdx.c
index 8451d6a1030c..ed278bac3c93 100644
--- a/arch/x86/boot/compressed/tdx.c
+++ b/arch/x86/boot/compressed/tdx.c
@@ -22,7 +22,7 @@ static inline unsigned int tdx_io_in(int size, u16 port)
 		.r10 = TDX_HYPERCALL_STANDARD,
 		.r11 = hcall_func(EXIT_REASON_IO_INSTRUCTION),
 		.r12 = size,
-		.r13 = 0,
+		.r13 = TDVMCALL_PORT_READ,
 		.r14 = port,
 	};
 
@@ -38,7 +38,7 @@ static inline void tdx_io_out(int size, u16 port, u32 value)
 		.r10 = TDX_HYPERCALL_STANDARD,
 		.r11 = hcall_func(EXIT_REASON_IO_INSTRUCTION),
 		.r12 = size,
-		.r13 = 1,
+		.r13 = TDVMCALL_PORT_WRITE,
 		.r14 = port,
 		.r15 = value,
 	};
diff --git a/arch/x86/coco/tdx/tdx.c b/arch/x86/coco/tdx/tdx.c
index f904a636d449..7d1a93ee2534 100644
--- a/arch/x86/coco/tdx/tdx.c
+++ b/arch/x86/coco/tdx/tdx.c
@@ -24,10 +24,6 @@
 #define EPT_READ	0
 #define EPT_WRITE	1
 
-/* Port I/O direction */
-#define PORT_READ	0
-#define PORT_WRITE	1
-
 /* See Exit Qualification for I/O Instructions in VMX documentation */
 #define VE_IS_IO_IN(e)		((e) & BIT(3))
 #define VE_GET_IO_SIZE(e)	(((e) & GENMASK(2, 0)) + 1)
@@ -691,7 +687,7 @@ static bool handle_in(struct pt_regs *regs, int size, int port)
 		.r10 = TDX_HYPERCALL_STANDARD,
 		.r11 = hcall_func(EXIT_REASON_IO_INSTRUCTION),
 		.r12 = size,
-		.r13 = PORT_READ,
+		.r13 = TDVMCALL_PORT_READ,
 		.r14 = port,
 	};
 	bool success;
@@ -720,7 +716,7 @@ static bool handle_out(struct pt_regs *regs, int size, int port)
 	 * "TDG.VP.VMCALL<Instruction.IO>".
 	 */
 	return !_tdx_hypercall(hcall_func(EXIT_REASON_IO_INSTRUCTION), size,
-			       PORT_WRITE, port, regs->ax & mask);
+			       TDVMCALL_PORT_WRITE, port, regs->ax & mask);
 }
 
 /*

-- 
2.55.0

