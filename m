Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793659961;
	b=DPgui8wEdLszWylFdk57VIb+AdiLgujvIpOu78oZfsECfleWuWnWrO/HbJSE85Z8L2Rh
	 pj2WnxTqkU7R55AUjTtV+SuhT12A/Srjbgw42yBWra9wvgGHWUpMuUx/ev5mYJCaQhyn+
	 HrBgjjzKw53wAY/0MvQ9dvXhbDE6A0O3BphdDZQHZQFoASM3MQSt883soItRGUpAQ5ttu
	 xgYNOWIhgU48YURRub1vnF6S8Gq+nHbrUd5YwJGKbBrV8gwFIDAtJPvzH98rBPS59lWHV
	 6UGpcD3keHcUCvhmYHNUWqgfO7LpmSmntt0paF5dSLIb3xySwDGj6RCQo0rZ6+4ECQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793659961;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=nKse35nd1WP6PHAiGDT6fv0Q5aPFDQ02t1Mzv5nA8B8=;
	b=UFoZ8lQFrR0iajzw912AoIUH8Mx2k/bap9HUXseOG3LP7ejLDsr4rOS5dagYap3j7lBV
	 mBCmgRdcJYlQZK0y7mfoNqGoly/g4B9Koy5XbUtdMTlRd1cWMH2e8JPB3NtwVl883WXZa
	 6szCqDDlURQQXPF84Ld1WlLbITd8Yh+RpGfsNtvB+0XF6zkxz4vmmTKY/gp+bNLgUplm2
	 kHoqS8aIPlR+7IVjIuQqLRmQGtsHXENnsxGgaisTGkbS3Cd8wVQq9exrsiFn6t2oVXvMU
	 +TOAdN/D4TAHz+NwaxK0Kh/XcjVs7L1dMdZasZ2V3yZByduu2PMTrJb2LZCGPhk+y7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iSuivJoA;
	arc=none smtp.remote-ip=192.198.163.8
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2474C606D802
	for <linux-coco@lists.linux.dev>; Mon,  2 Nov 2026 22:52:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2474C606D802
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iSuivJoA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793659961; x=1825195961;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=wcflalAqgbhBYxWyh48Kq+AQPOEFlkHdE6EvbeKdyPU=;
  b=iSuivJoAYACbGkMTkcy2M5rNVu3G5w5eHSFQ45xwFRcd6H7F0oxosiBX
   vb1LQP/VZdihlF3W+z0Zq4ANpzpGBe65iqyOzY1aSz4rhIQzLCXFZz6pg
   0G3hAiKGZplZTlzpCj0n8SIeSiOrFlrIIBMws33U4VVG42ZJiD7m39SCK
   xkCqA1/6KIht9hGq/1Ox0dKvMftjJ6OXrROtI6gt29yJFv17VivTFSeIC
   BnBGvA3wMeamaRih0DzpMi1bFOlILS2yQPMqlOzRMGmYhVm7iJWJO75sm
   oy1ALx8Lgl+IyRQGQCTvPCAR0/pSn+Yj8pFTtU+Xm262CO+Jj4Ma8onF6
   A==;
X-CSE-ConnectionGUID: a0J9xr+2QUa5tUNKtqBNTQ==
X-CSE-MsgGUID: fqm9NY4ZRXSX+d5ef27o9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2258132"
X-IronPort-AV: E=Sophos;i="6.27,192,1787036400"; 
   d="scan'208";a="2258132"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2026 14:52:39 -0800
X-CSE-ConnectionGUID: 83BaAKjJQfy3CPHIdp20cw==
X-CSE-MsgGUID: MpWxz/k+SWC/PYrIpynw+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,192,1787036400"; 
   d="scan'208";a="6360466"
Received: from vverma7-desk1.amr.corp.intel.com (HELO [192.168.1.200]) ([10.125.109.177])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2026 14:52:38 -0800
From: Vishal Verma <vishal.l.verma@intel.com>
Date: Mon, 02 Nov 2026 15:51:59 -0700
Subject: [PATCH v5 2/2] x86/early_printk: Add earlyprintk=tdx to drive the
 UART with TDVMCALLs
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Post: <mailto:linux-coco@lists.linux.dev>
List-Help: <mailto:linux-coco+help@lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-coco+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-b4-tdx_earlyprintk_tdcalls-v5-2-b01bc95d44ff@intel.com>
References: <20261102-b4-tdx_earlyprintk_tdcalls-v5-0-b01bc95d44ff@intel.com>
In-Reply-To: <20261102-b4-tdx_earlyprintk_tdcalls-v5-0-b01bc95d44ff@intel.com>
To: x86@kernel.org, Dave Hansen <dave.hansen@linux.intel.com>, 
 Kiryl Shutsemau <kas@kernel.org>, 
 Rick Edgecombe <rick.p.edgecombe@intel.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev, 
 kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
 Vishal Verma <vishal.l.verma@intel.com>, 
 Nikolay Borisov <nik.borisov@suse.com>
X-Mailer: b4 0.17-dev-e5168
X-Developer-Signature: v=1; a=openpgp-sha256; l=6362;
 i=vishal.l.verma@intel.com; h=from:subject:message-id;
 bh=wcflalAqgbhBYxWyh48Kq+AQPOEFlkHdE6EvbeKdyPU=;
 b=owGbwMvMwCXGf25diOft7jLG02pJDFkvRXQt3i71edFkKZfSkLd+wkHthDlu967vtVn2vsppy
 usmTZ2ZHaUsDGJcDLJiiix/93xkPCa3PZ8nMMERZg4rE8gQBi5OAZjIjw0M/x28XzFMnqkhXbAz
 4GJH19wvbqul8vmEbxyp95s3bxXTAmtGhv+rM3fGrjrCNCnk0LWy1QbWXawal2qdE4TMPyx847K
 nhBsA
X-Developer-Key: i=vishal.l.verma@intel.com; a=openpgp;
 fpr=F8682BE134C67A12332A2ED07AFA61BEA3B84DFF

A TDX guest cannot execute port I/O instructions directly, but
earlyprintk's serial console still issues plain inb()/outb() and lets
each one fault into the #VE handler to be emulated as a TDVMCALL.

While that works, it is a roundabout way to get a character out.
early_serial_putc() polls the LSR, and then writes a byte, but since the
TDX guest can't directly do port I/O, a #VE exception is raised. The #VE
handler must call TDG.VP.VEINFO.GET to find out what faulted, and then
it can issue the TDVMCALL that does the actual work.

This makes #VE a functional mechanism for doing I/O, which is not
desirable, is unnecessarily complicated and fragile, and results in
twice the number of calls into the TDX module.

Instead, add an earlyprintk=tdx option, which can issue the TDVMCALLs
directly. Add a pair of tdx_serial_in() and tdx_serial_out() accessors
and set them up in this case.

Note that the output does not appear any earlier - "earlyprintk=" is an
early_param(), so the console is still registered from
parse_early_param(). This only changes how the bytes leave the guest
once it is up.

Signed-off-by: Vishal Verma <vishal.l.verma@intel.com>
Reviewed-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
Reviewed-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
Reviewed-by: Nikolay Borisov <nik.borisov@suse.com>
---
 Documentation/admin-guide/kernel-parameters.txt |  8 +++++++
 arch/x86/include/asm/tdx.h                      |  4 ++++
 arch/x86/coco/tdx/tdx.c                         | 29 +++++++++++++++++++++++++
 arch/x86/kernel/early_printk.c                  | 20 +++++++++++++++++
 4 files changed, 61 insertions(+)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 0b3c140babd94..da5aa688294cc 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -1547,6 +1547,7 @@ Kernel parameters
 			earlyprintk=serial[,ttySn[,baudrate]]
 			earlyprintk=serial[,0x...[,baudrate]]
 			earlyprintk=ttySn[,baudrate]
+			earlyprintk=tdx
 			earlyprintk=dbgp[debugController#]
 			earlyprintk=mmio32,membase[,{nocfg|baudrate}]
 			earlyprintk=pciserial[,force],bus:device.function[,{nocfg|baudrate}]
@@ -1560,6 +1561,13 @@ Kernel parameters
 			Use "nocfg" to skip UART configuration, assume
 			BIOS/firmware has configured UART correctly.
 
+			On x86, "tdx" is a fixed COM1 console, and takes no
+			options. In a TDX guest the port is driven with
+			TDVMCALLs rather than port I/O instructions, avoiding
+			the #VE exception that would otherwise be taken to
+			emulate every access. Outside a TDX guest it falls back
+			to port I/O, behaving like "earlyprintk=serial".
+
 			Append ",keep" to not disable it when the real console
 			takes over.
 
diff --git a/arch/x86/include/asm/tdx.h b/arch/x86/include/asm/tdx.h
index 1fcfaed515fec..c6f6a60fbbac4 100644
--- a/arch/x86/include/asm/tdx.h
+++ b/arch/x86/include/asm/tdx.h
@@ -98,6 +98,10 @@ static inline bool tdx_early_handle_ve(struct pt_regs *regs) { return false; }
 
 #endif /* CONFIG_INTEL_TDX_GUEST */
 
+/* Only referenced when X86_FEATURE_TDX_GUEST is enabled, no stubs needed */
+__noendbr unsigned int tdx_serial_in(unsigned long addr, int offset);
+__noendbr void tdx_serial_out(unsigned long addr, int offset, int value);
+
 #if defined(CONFIG_KVM_GUEST) && defined(CONFIG_INTEL_TDX_GUEST)
 long tdx_kvm_hypercall(unsigned int nr, unsigned long p1, unsigned long p2,
 		       unsigned long p3, unsigned long p4);
diff --git a/arch/x86/coco/tdx/tdx.c b/arch/x86/coco/tdx/tdx.c
index 9531490c9c246..74d4e479964dd 100644
--- a/arch/x86/coco/tdx/tdx.c
+++ b/arch/x86/coco/tdx/tdx.c
@@ -211,6 +211,35 @@ int tdx_get_max_quote_size(u64 *max_quote_size)
 }
 EXPORT_SYMBOL_FOR_MODULES(tdx_get_max_quote_size, "tdx-guest");
 
+/*
+ * early_printk accessors for a TDX guest. Ask the VMM to do the port I/O with
+ * TDG.VP.VMCALL<Instruction.IO> instead of executing IN/OUT and having the
+ * resulting #VE emulate it.
+ */
+__noendbr unsigned int tdx_serial_in(unsigned long addr, int offset)
+{
+	struct tdx_module_args args = {
+		.r10 = TDX_HYPERCALL_STANDARD,
+		.r11 = hcall_func(EXIT_REASON_IO_INSTRUCTION),
+		.r12 = 1,
+		.r13 = TDVMCALL_PORT_READ,
+		.r14 = addr + offset,
+	};
+
+	if (__tdx_hypercall(&args))
+		return 0xFF;
+
+	return args.r11;
+}
+ANNOTATE_NOENDBR_SYM(tdx_serial_in);
+
+__noendbr void tdx_serial_out(unsigned long addr, int offset, int value)
+{
+	_tdx_hypercall(hcall_func(EXIT_REASON_IO_INSTRUCTION), 1,
+		       TDVMCALL_PORT_WRITE, addr + offset, value);
+}
+ANNOTATE_NOENDBR_SYM(tdx_serial_out);
+
 /*
  * The kernel cannot handle #VEs when accessing normal kernel memory. Ensure
  * that no #VE will be delivered for accesses to TD-private memory.
diff --git a/arch/x86/kernel/early_printk.c b/arch/x86/kernel/early_printk.c
index cba75306e5b62..04dadcd73b857 100644
--- a/arch/x86/kernel/early_printk.c
+++ b/arch/x86/kernel/early_printk.c
@@ -21,6 +21,7 @@
 #include <linux/usb/xhci-dbgp.h>
 #include <asm/pci_x86.h>
 #include <linux/static_call.h>
+#include <asm/tdx.h>
 
 /* Simple VGA output */
 #define VGABASE		(__ISA_IO_base + 0xb8000)
@@ -196,6 +197,20 @@ static __init void early_serial_init(char *s)
 	early_serial_hw_init(divisor);
 }
 
+/*
+ * Use early_serial_base (COM1) and same default baud rate as
+ * "earlyprintk=serial"
+ */
+static __init void early_serial_tdx_init(void)
+{
+	if (cpu_feature_enabled(X86_FEATURE_TDX_GUEST)) {
+		static_call_update(serial_in, tdx_serial_in);
+		static_call_update(serial_out, tdx_serial_out);
+	}
+
+	early_serial_hw_init(115200 / DEFAULT_BAUD);
+}
+
 static __noendbr void mem32_serial_out(unsigned long addr, int offset, int value)
 {
 	u32 __iomem *vaddr = (u32 __iomem *)addr;
@@ -414,6 +429,11 @@ static int __init setup_early_printk(char *buf)
 			early_serial_init(buf + 4);
 			early_console_register(&early_serial_console, keep);
 		}
+		if (!strncmp(buf, "tdx", 3)) {
+			early_serial_tdx_init();
+			early_console_register(&early_serial_console, keep);
+			break;
+		}
 #ifdef CONFIG_PCI
 		if (!strncmp(buf, "pciserial", 9)) {
 			buf += 9; /* Keep from match the above "pciserial" */

-- 
2.56.0

