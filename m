Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B7A7229B0B
	for <linux-coco@lists.linux.dev>; Thu,  6 Feb 2025 22:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738880888; cv=none; b=POrFJ/cOYJrJ50fe4w21Z1kerJ371bKm+vm21W24NVnAfhW7Dswfl0ZcBHzJprjlmvhqdSejyZEv3KnSkzp6cgP0Mn6nxR46BUfG4KxLhl81u2WaJdGRjP6x9JwcGW6/lcalaVHWEgIIk7zHeiEQbhiGzGyL+x+8MhNQyVy5R7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738880888; c=relaxed/simple;
	bh=68S+7ZlsuMe2fEeqhZuUrws52Dw8cqaMxh/N9g6qQgg=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=f3x5gb3VZ9/wndrcX/TCpz4RuTMK/4k8aqa73y/SPb0P+T/aLEN0IaoAWvRYu17MQI93nLYTmhjkOlkY4YSOBWOCpc7xKdA/4ROWPFGZWI/MscNrjPBcAz8FAyIHwlhM2oV/rKPv1j2ReBv6mgee9LVz23zkDOKJG2ecWEupqTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--vannapurve.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=j5Ctzsph; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vannapurve.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="j5Ctzsph"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-216311faa51so27354565ad.0
        for <linux-coco@lists.linux.dev>; Thu, 06 Feb 2025 14:28:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738880886; x=1739485686; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8P4AhcS+GNaWZWjxWYlbkE1kh/676R53jJusOmDR5nw=;
        b=j5Ctzsphm/AxRjKAYk9nfSzZeIWGMFh5xTEOAL9QlxAZqY0nraGae546pzEqTWhZe7
         wJznHilyDG/iazSNiuw7kaYLvSmXA7uUC85PzRL8MyBrnyET4Nx5AJJn/heO+24AbFgN
         auvCFoLDcC0QkzzfttkRxJaevCa8RPe1dj213VmJUmsCUYUfEYM1+b2S9g1fNMjVHM20
         yx2bFWFBXXEN4E7y/DndFFSdKKwJtnN3AlKenw7dlGRMrEDAsrayIcso94zwIGtzXqrO
         5Le08KRxUZwRvITDZmpoK8JasxiJg6iL3/tgns+DJFEmXPGtcAyaP5ZBZ2ufSa9j9ikT
         9fGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738880886; x=1739485686;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8P4AhcS+GNaWZWjxWYlbkE1kh/676R53jJusOmDR5nw=;
        b=tqIehB7Ry1Pt48a44avnQcLtB1VyTP0RdUo4A5Xzf9LH1lnv/G89+KagTzuirCCsVF
         H7Uai2xMrANBo/0dqn0ufBx6/Rukz9o7Of3xJcxL6q6cYHOpGWUXUmC1bED7I5QPZmNH
         H3FLGUgFYaCSn3KWkvOdKgoHcvFkrvIQp+DLP1mwJR4NHhUN+ziVebQacu/PkzzkHV9u
         jnZ/bxmL3hCQK9rRhHZEdY4QJL3vGg3F5uCSNk2lXTdl27y1sm/a1F0BaganJvB5FBA5
         dcQ7iLafbRjFmQK/gWzaLohTL6QLud5L2Y1wYn0erMzTwPazxaWMY8WXHASiSB5RBP+z
         vZSQ==
X-Forwarded-Encrypted: i=1; AJvYcCUoL3oUhtlhE65JjifYfpDSSCyqmWrM/l5NHXAsfSqJ2v4453Ob2ZaZzOCMb2Vxb6avg25gBJxN64Zn@lists.linux.dev
X-Gm-Message-State: AOJu0YzdLjJpuBN0d1m5TNt70VffE6cpOusyqTRIpDUunCfYsMRGM2WG
	XlhZdzYpRNVoG+3TgTWplnAND173CZBrRK5tpW35Erw4uRzgFNGXwxvcbWGpD5I/m20dvQIpcJi
	gMmZ46QgOZLQFwLRLbg==
X-Google-Smtp-Source: AGHT+IGV2oh05tX4Vjgo2rH9ZwUrNxYtXWIw0ieeSiG3VAWoKfP6hvB9RpQpAjOsrL8oZOFBbq18FpN8lc54sQDS
X-Received: from plbx9.prod.google.com ([2002:a17:902:ea89:b0:21f:40e5:a651])
 (user=vannapurve job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:ec89:b0:215:758c:52e8 with SMTP id d9443c01a7336-21f4f16fe8dmr10682555ad.12.1738880885742;
 Thu, 06 Feb 2025 14:28:05 -0800 (PST)
Date: Thu,  6 Feb 2025 22:27:12 +0000
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.48.1.502.g6dc24dfdaf-goog
Message-ID: <20250206222714.1079059-1-vannapurve@google.com>
Subject: [PATCH V3 1/2] x86/tdx: Route safe halt execution via tdx_safe_halt()
From: Vishal Annapurve <vannapurve@google.com>
To: x86@kernel.org, linux-kernel@vger.kernel.org
Cc: pbonzini@redhat.com, seanjc@google.com, erdemaktas@google.com, 
	ackerleytng@google.com, jxgao@google.com, sagis@google.com, oupton@google.com, 
	pgonda@google.com, kirill@shutemov.name, dave.hansen@linux.intel.com, 
	linux-coco@lists.linux.dev, chao.p.peng@linux.intel.com, 
	isaku.yamahata@gmail.com, Vishal Annapurve <vannapurve@google.com>, stable@vger.kernel.org, 
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"

Direct HLT instruction execution causes #VEs for TDX VMs which is routed
to hypervisor via TDCALL. safe_halt() routines execute HLT in STI-shadow
so IRQs need to remain disabled until the TDCALL to ensure that pending
IRQs are correctly treated as wake events. So "sti;hlt" sequence needs to
be replaced with "TDCALL; raw_local_irq_enable()" for TDX VMs.

Commit bfe6ed0c6727 ("x86/tdx: Add HLT support for TDX guests")
prevented the idle routines from using "sti;hlt". But it missed the
paravirt routine which can be reached like this as an example:
        acpi_safe_halt() =>
        raw_safe_halt()  =>
        arch_safe_halt() =>
        irq.safe_halt()  =>
        pv_native_safe_halt()

Modify tdx_safe_halt() to implement the sequence "TDCALL;
raw_local_irq_enable()" and invoke tdx_halt() from idle routine which just
executes TDCALL without changing state of interrupts.

If CONFIG_PARAVIRT_XXL is disabled, "sti;hlt" sequences can still get
executed from TDX VMs via paths like:
        acpi_safe_halt() =>
        raw_safe_halt()  =>
        arch_safe_halt() =>
	native_safe_halt()
There is a long term plan to fix these paths by carving out
irq.safe_halt() outside paravirt framework.

Cc: stable@vger.kernel.org
Fixes: bfe6ed0c6727 ("x86/tdx: Add HLT support for TDX guests")
Reviewed-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>@linux.intel.com>
Signed-off-by: Vishal Annapurve <vannapurve@google.com>
---
Changes since V2:
1) Addressed comments from Dave H and Kirill S.

V2: https://lore.kernel.org/lkml/20250129232525.3519586-1-vannapurve@google.com/

 arch/x86/coco/tdx/tdx.c    | 18 +++++++++++++++++-
 arch/x86/include/asm/tdx.h |  2 +-
 arch/x86/kernel/process.c  |  2 +-
 3 files changed, 19 insertions(+), 3 deletions(-)

diff --git a/arch/x86/coco/tdx/tdx.c b/arch/x86/coco/tdx/tdx.c
index 32809a06dab4..5e68758666a4 100644
--- a/arch/x86/coco/tdx/tdx.c
+++ b/arch/x86/coco/tdx/tdx.c
@@ -14,6 +14,7 @@
 #include <asm/ia32.h>
 #include <asm/insn.h>
 #include <asm/insn-eval.h>
+#include <asm/paravirt_types.h>
 #include <asm/pgtable.h>
 #include <asm/set_memory.h>
 #include <asm/traps.h>
@@ -398,7 +399,7 @@ static int handle_halt(struct ve_info *ve)
 	return ve_instr_len(ve);
 }
 
-void __cpuidle tdx_safe_halt(void)
+void __cpuidle tdx_halt(void)
 {
 	const bool irq_disabled = false;
 
@@ -409,6 +410,12 @@ void __cpuidle tdx_safe_halt(void)
 		WARN_ONCE(1, "HLT instruction emulation failed\n");
 }
 
+static void __cpuidle tdx_safe_halt(void)
+{
+	tdx_halt();
+	raw_local_irq_enable();
+}
+
 static int read_msr(struct pt_regs *regs, struct ve_info *ve)
 {
 	struct tdx_module_args args = {
@@ -1109,6 +1116,15 @@ void __init tdx_early_init(void)
 	x86_platform.guest.enc_kexec_begin	     = tdx_kexec_begin;
 	x86_platform.guest.enc_kexec_finish	     = tdx_kexec_finish;
 
+#ifdef CONFIG_PARAVIRT_XXL
+	/*
+	 * Avoid the literal hlt instruction in TDX guests. hlt will
+	 * induce a #VE in the STI-shadow which will enable interrupts
+	 * in a place where they are not wanted.
+	 */
+	pv_ops.irq.safe_halt = tdx_safe_halt;
+#endif
+
 	/*
 	 * TDX intercepts the RDMSR to read the X2APIC ID in the parallel
 	 * bringup low level code. That raises #VE which cannot be handled
diff --git a/arch/x86/include/asm/tdx.h b/arch/x86/include/asm/tdx.h
index b4b16dafd55e..393ee2dfaab1 100644
--- a/arch/x86/include/asm/tdx.h
+++ b/arch/x86/include/asm/tdx.h
@@ -58,7 +58,7 @@ void tdx_get_ve_info(struct ve_info *ve);
 
 bool tdx_handle_virt_exception(struct pt_regs *regs, struct ve_info *ve);
 
-void tdx_safe_halt(void);
+void tdx_halt(void);
 
 bool tdx_early_handle_ve(struct pt_regs *regs);
 
diff --git a/arch/x86/kernel/process.c b/arch/x86/kernel/process.c
index 6da6769d7254..d11956a178df 100644
--- a/arch/x86/kernel/process.c
+++ b/arch/x86/kernel/process.c
@@ -934,7 +934,7 @@ void __init select_idle_routine(void)
 		static_call_update(x86_idle, mwait_idle);
 	} else if (cpu_feature_enabled(X86_FEATURE_TDX_GUEST)) {
 		pr_info("using TDX aware idle routine\n");
-		static_call_update(x86_idle, tdx_safe_halt);
+		static_call_update(x86_idle, tdx_halt);
 	} else {
 		static_call_update(x86_idle, default_idle);
 	}
-- 
2.48.1.502.g6dc24dfdaf-goog

