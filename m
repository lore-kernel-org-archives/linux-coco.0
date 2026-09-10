Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 028C557ED85
	for <linux-coco@lists.linux.dev>; Thu, 10 Sep 2026 18:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789064946; cv=none; b=PxOLM0f80/5pmxxIEBHmaVXGuBabMfmolwHavCabyejAqTw1j+tSWZrtvR7dFXc20pLKJF+J+Hnb7At9+9ZgHtZPn8rCk3W2qkgzx6/obWbJKoLZtAyCT2fgyr+hciMaYC1idOrLiR4OHFXfbCDWGkenZqYrKV34AD1DPBegQMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789064946; c=relaxed/simple;
	bh=cmYjXvdsYciBd0lCZ2ltm/dpXQelBMN3JS54FvQBC4s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=QQyUvojlK2ryYtSufyxhoRMqg0sxwlzyYPkQ4vMAnd83NdSq0C0SfYoT7E+ZWpP1SZCC9txa/LXNtuM/srvfVmtDEI975+QVyvTzi9u1eF/C79IUPb0f2n/u4w5Y6hGLcqGBg4QiLAlETXe3bNT4m0aroZFr0sDIAl39I5jb6Mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IxJTJg9B; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IxJTJg9B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789064940; x=1820600940;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:to:cc;
  bh=cmYjXvdsYciBd0lCZ2ltm/dpXQelBMN3JS54FvQBC4s=;
  b=IxJTJg9BEzp4vXf/FzWOWFCMcxOXWhgWVxUGlykNw1Fd6/d4b3sjQvHL
   AHje8hsublcDVy8Th/nuze2N5YLDkOVDehz/mDHfYLukpioBkNTPiSxZB
   TgAmIOwuqwyFT6UTcTlMD6pMPfWfxsbtW5jpuDKorwH5Amg5cz1Xl8jDD
   WP6zW29p6AYz0Q4n7eUe+7GU7HFXUOCv6fruvGa255/cRDhZdIonH6nEf
   BbARr5luoWX4hfVd8pET85YvXfPEyj628ZVc6rUMOrG11cBmrHxs7RuEH
   98/34sy3ki5PYpdvXbpls+VmIwhAp7JlqEKTNV3S4IrARjlD+aooE3nig
   A==;
X-CSE-ConnectionGUID: 4ZqyZuy9RqmCkHigRwhKOA==
X-CSE-MsgGUID: 4xcrrkVzTXevt6BUOlNelg==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="100118694"
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="100118694"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 11:28:57 -0700
X-CSE-ConnectionGUID: 4y2rpa5DRmaalaZAHZWkcA==
X-CSE-MsgGUID: 2lUi3idNRgOaMgZ/izzXoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="265511323"
Received: from vverma7-desk1.amr.corp.intel.com (HELO [192.168.1.200]) ([10.125.111.227])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 11:28:57 -0700
From: Vishal Verma <vishal.l.verma@intel.com>
Date: Thu, 10 Sep 2026 12:28:40 -0600
Subject: [PATCH] x86/tdx: Remove the early #VE handler
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-b4-tdx_remove_early_ve_handler-v1-1-bf47a4d360c5@intel.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWNUQqDMBAFryL73UCMkkqvUkrQ5KVNsVo2Vizi3
 V3bvzfwmFkpgxMyXYqVGHPKaRwEylNB/tEOd6gUhMloY3VjGtXVagqLY7zGGQ4t918nQ76hB6u
 zL2tb+aijrUgkb0ZMyy9wvf05f7on/HRYadt2bNswd4IAAAA=
X-Change-ID: 20260828-b4-tdx_remove_early_ve_handler-7c1463cf0f63
To: x86@kernel.org, Dave Hansen <dave.hansen@linux.intel.com>, 
 Rick Edgecombe <rick.p.edgecombe@intel.com>, 
 Kiryl Shutsemau <kas@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev, 
 kvm@vger.kernel.org, Vishal Verma <vishal.l.verma@intel.com>, 
 Andi Kleen <ak@linux.intel.com>
X-Mailer: b4 0.16-dev-62088
X-Developer-Signature: v=1; a=openpgp-sha256; l=3634;
 i=vishal.l.verma@intel.com; h=from:subject:message-id;
 bh=cmYjXvdsYciBd0lCZ2ltm/dpXQelBMN3JS54FvQBC4s=;
 b=owGbwMvMwCXGf25diOft7jLG02pJDFmLvr1omWodErDFZtrfyZPX8Be+Z6q7lCtZwmGZ6J51/
 JnmV5f6jlIWBjEuBlkxRZa/ez4yHpPbns8TmOAIM4eVCWQIAxenAEykKZWRYU6JE3OoT0Dd0w15
 QQFR0ktzVwtv/PbJame8YsvbOS+jexj+WSzwenkpoe/pFJvL1+IW/1+zze73Hce9KnxnrnnfMns
 cyAEA
X-Developer-Key: i=vishal.l.verma@intel.com; a=openpgp;
 fpr=F8682BE134C67A12332A2ED07AFA61BEA3B84DFF

tdx_early_handle_ve() emulates port I/O for #VEs taken before
idt_setup_early_traps() installs the real #VE gate. Per commit
32e72854fa5f ("x86/tdx: Port I/O: Add early boot support"), it exists to
support earlyprintk's serial driver.

"earlyprintk=" and "earlycon=" are both early_param() handlers, so no
console can be registered before parse_early_param(), which runs from
setup_arch(), after idt_setup_early_traps() has replaced the early IDT.
Nothing in the window between idt_setup_early_handler() and
idt_setup_early_traps() does port I/O, so this emulation doesn't ever
get called.

Remove the handler. Any #VE in the early window now falls through to
early_fixup_exception(), as it previously did for #VEs that were not I/O
instructions.

Found with the help of an LLM observing that the real IDT is installed
before parse_early_param(). LLMs were also used to verify this. On a TDX
guest booted with earlyprintk, a counter added to tdx_early_handle_ve()
for testing remained 0 after boot.

Signed-off-by: Vishal Verma <vishal.l.verma@intel.com>
Cc: Andi Kleen <ak@linux.intel.com>
Cc: Rick Edgecombe <rick.p.edgecombe@intel.com>
---
 arch/x86/include/asm/tdx.h |  4 ----
 arch/x86/coco/tdx/tdx.c    | 22 ----------------------
 arch/x86/kernel/head64.c   |  3 ---
 3 files changed, 29 deletions(-)

diff --git a/arch/x86/include/asm/tdx.h b/arch/x86/include/asm/tdx.h
index 89e97d5761d8..495154a7d77d 100644
--- a/arch/x86/include/asm/tdx.h
+++ b/arch/x86/include/asm/tdx.h
@@ -75,8 +75,6 @@ bool tdx_handle_virt_exception(struct pt_regs *regs, struct ve_info *ve);
 
 void tdx_halt(void);
 
-bool tdx_early_handle_ve(struct pt_regs *regs);
-
 int tdx_mcall_get_report0(u8 *reportdata, u8 *tdreport);
 
 int tdx_mcall_extend_rtmr(u8 index, u8 *data);
@@ -91,8 +89,6 @@ void __init tdx_dump_td_ctls(u64 td_ctls);
 static inline void tdx_early_init(void) { };
 static inline void tdx_halt(void) { };
 
-static inline bool tdx_early_handle_ve(struct pt_regs *regs) { return false; }
-
 #endif /* CONFIG_INTEL_TDX_GUEST */
 
 #if defined(CONFIG_KVM_GUEST) && defined(CONFIG_INTEL_TDX_GUEST)
diff --git a/arch/x86/coco/tdx/tdx.c b/arch/x86/coco/tdx/tdx.c
index f904a636d449..9bc78cb28710 100644
--- a/arch/x86/coco/tdx/tdx.c
+++ b/arch/x86/coco/tdx/tdx.c
@@ -755,28 +755,6 @@ static int handle_io(struct pt_regs *regs, struct ve_info *ve)
 	return ve_instr_len(ve);
 }
 
-/*
- * Early #VE exception handler. Only handles a subset of port I/O.
- * Intended only for earlyprintk. If failed, return false.
- */
-__init bool tdx_early_handle_ve(struct pt_regs *regs)
-{
-	struct ve_info ve;
-	int insn_len;
-
-	tdx_get_ve_info(&ve);
-
-	if (ve.exit_reason != EXIT_REASON_IO_INSTRUCTION)
-		return false;
-
-	insn_len = handle_io(regs, &ve);
-	if (insn_len < 0)
-		return false;
-
-	regs->ip += insn_len;
-	return true;
-}
-
 void tdx_get_ve_info(struct ve_info *ve)
 {
 	struct tdx_module_args args = {};
diff --git a/arch/x86/kernel/head64.c b/arch/x86/kernel/head64.c
index fd28b53dbac5..7b8b13f45454 100644
--- a/arch/x86/kernel/head64.c
+++ b/arch/x86/kernel/head64.c
@@ -166,9 +166,6 @@ void __init do_early_exception(struct pt_regs *regs, int trapnr)
 	    trapnr == X86_TRAP_VC && handle_vc_boot_ghcb(regs))
 		return;
 
-	if (trapnr == X86_TRAP_VE && tdx_early_handle_ve(regs))
-		return;
-
 	early_fixup_exception(regs, trapnr);
 }
 

---
base-commit: df2908090cda368b01ff43709f51890076c56157
change-id: 20260828-b4-tdx_remove_early_ve_handler-7c1463cf0f63

Best regards,
--  
Vishal Verma <vishal.l.verma@intel.com>

