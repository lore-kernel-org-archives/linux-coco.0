Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 924F91E32D3
	for <linux-coco@lists.linux.dev>; Wed, 29 Jan 2025 23:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738193150; cv=none; b=Qhc7zqozM4Wo5CNXJag4JBxo+KKQuZa6fz7eIAcy3dB3RHZsJcLXPeOdAk/pYUsK1al2Rtt2vwJ4ycuMvRFT/G8vNJIDx8TNIGaiYKBtxZ2c/HxLNWqFCtVsG+lUfOJY4oPLq3yOeqHOSoKanGFJwzGmxOUCn4XlTclbKm5RLhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738193150; c=relaxed/simple;
	bh=JjbcMePIC+hlZCNawCe1+J+sCso+kA3lGDjHaZMDKS8=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=pzOtjMmILoDWcY95o2731XkOnoa6ElpYOWIoXKjRzHhHYP7+mZXr+UURpoZXuL49zeM+Vc/fMEIUhmL/JlAt8PXZxhcYHZFdbpm0o7FCewaXHZPphpt7zdnAS21hKKLYFSuVr+/y+0X9g3V9+7Fs/wpPXoEfZvuPiv9sL9kqwlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--vannapurve.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=1a8Aa0H5; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vannapurve.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1a8Aa0H5"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2165433e229so3587445ad.1
        for <linux-coco@lists.linux.dev>; Wed, 29 Jan 2025 15:25:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738193147; x=1738797947; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+/fthEx4KMs/q0D1UGwguZKMvJf4w33wNyq8hJ7/c7s=;
        b=1a8Aa0H52+aXD3MUc/5M/7Pjt+KlNceP01Gr54ANnVn5MBBqSW+bzmcFrNJ+fvI4FK
         qX5HKdM6rkKK+RGZNv7eFkwJERBjhEnnHTUQsHKT0tRgURi/t7j0x61RBN6Yok83VUHR
         L1sM6ctmbabDBHa5TKGk/9IYtDjXEFTbgyDQcS2JJU2e6XDRg0Pe9A5P2g5zUx9b+VYf
         N0uviIFnJ8OqvbFQs3kBIjnQ0RDviyBJ5H5P6j/LmBICPiQxoLopLZt2mTjCBjzHEOpt
         P4q9MqIKp82TV2z/6L3PPfJiQBYExIUOH+16kOhahKxOSA7lej1zsmw82L17afI/kxzN
         0OxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738193147; x=1738797947;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+/fthEx4KMs/q0D1UGwguZKMvJf4w33wNyq8hJ7/c7s=;
        b=YlgEDyaO+R7PF/CmH17gwl+hI6Uwe3LEwSVAdHJShgaerQ5CW7YpSdIQVtJOUOWS0C
         133PcCvzRXpM2TxVRXN1Zk6eksvHrPAZ/XhHsXGxNs1je565z4+kz/U1TIAssc8qghR6
         8pQTt2AlaLNxwrJbPYJg4OWlcaIi82IBvfBJXsOJYZgu/E7hP6jqhoishbZFzy5L5Jss
         ktWxG+KHM+vhVj4Hq3kW2PJDUak6xdYIYlaf+VtMwT6GpLcjwBcEn0JKxG+1RmHQ+wb4
         sopU6KOBkxQ+Ka0KlIPIaxtGntopHJjGaUcUQ6SAmyQss7EO8XHC6TFhCnLgzo0zlVwz
         pO/Q==
X-Forwarded-Encrypted: i=1; AJvYcCWuwSgGSjAs1xxTxy7Byp30yWxrdgTn7qEZezBgnVhYuC4HKjmnc/OQsm9/V2zFmjEZdr4fBS+VbDS2@lists.linux.dev
X-Gm-Message-State: AOJu0YyR/U1EiMXA+MrrlhuGGvguJRJqE8I+PkXO6R3mPL2CeGcxZD0D
	hnyVEaKq0rSTu5/hMJOAleZzQnk3uU62WVhKOHtrnVekG5Sb4Gikmuaa+C7UBUuO7+pJgLxGLqn
	gVSyUXwmZwSGKXHk6kQ==
X-Google-Smtp-Source: AGHT+IHexmbpUDvlMg4R8Trr0bmnsZ4sOx1FLPifoDvY2PfbnQVguwP/mPYXCV1cqP06I4Mnpa9vzmRMXprPn/49
X-Received: from pgbgb1.prod.google.com ([2002:a05:6a02:4b41:b0:a87:a3b9:db3d])
 (user=vannapurve job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:78c:b0:1ea:df1a:f8db with SMTP id adf61e73a8af0-1ed7a6236bdmr8181402637.37.1738193146832;
 Wed, 29 Jan 2025 15:25:46 -0800 (PST)
Date: Wed, 29 Jan 2025 23:25:25 +0000
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.48.1.262.g85cc9f2d1e-goog
Message-ID: <20250129232525.3519586-1-vannapurve@google.com>
Subject: [PATCH V2 1/1] x86/tdx: Route safe halt execution via tdx_safe_halt()
From: Vishal Annapurve <vannapurve@google.com>
To: x86@kernel.org, linux-kernel@vger.kernel.org
Cc: pbonzini@redhat.com, seanjc@google.com, erdemaktas@google.com, 
	ackerleytng@google.com, jxgao@google.com, sagis@google.com, oupton@google.com, 
	pgonda@google.com, kirill@shutemov.name, dave.hansen@linux.intel.com, 
	linux-coco@lists.linux.dev, chao.p.peng@linux.intel.com, 
	isaku.yamahata@gmail.com, Vishal Annapurve <vannapurve@google.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Direct HLT instruction execution causes #VEs for TDX VMs which is routed
to hypervisor via tdvmcall. This process renders HLT instruction
execution inatomic, so any preceding instructions like STI/MOV SS will
end up enabling interrupts before the HLT instruction is routed to the
hypervisor. This creates scenarios where interrupts could land during
HLT instruction emulation without aborting halt operation leading to
idefinite halt wait times.

Commit bfe6ed0c6727 ("x86/tdx: Add HLT support for TDX guests") already
upgraded x86_idle() to invoke tdvmcall to avoid such scenarios, but
it didn't cover pv_native_safe_halt() which can be invoked using
raw_safe_halt() from call sites like acpi_safe_halt().

raw_safe_halt() also returns with interrupts enabled so upgrade
tdx_safe_halt() to enable interrupts by default and ensure that paravirt
safe_halt() executions invoke tdx_safe_halt(). Earlier x86_idle() is now
handled via tdx_idle() which simply invokes tdvmcall while preserving
irq state.

To avoid future call sites which cause HLT instruction emulation with
irqs enabled, add a warn and fail the HLT instruction emulation.

Cc: stable@vger.kernel.org
Fixes: bfe6ed0c6727 ("x86/tdx: Add HLT support for TDX guests")
Signed-off-by: Vishal Annapurve <vannapurve@google.com>
---
Changes since V1:
1) Addressed comments from Dave H
   - Comment regarding adding a check for TDX VMs in halt path is not
     resolved in v2, would like feedback around better place to do so,
     maybe in pv_native_safe_halt (?).
2) Added a new version of tdx_safe_halt() that will enable interrupts.
3) Previous tdx_safe_halt() implementation is moved to newly introduced
tdx_idle().

V1: https://lore.kernel.org/lkml/Z5l6L3Hen9_Y3SGC@google.com/T/

 arch/x86/coco/tdx/tdx.c    | 23 ++++++++++++++++++++++-
 arch/x86/include/asm/tdx.h |  2 +-
 arch/x86/kernel/process.c  |  2 +-
 3 files changed, 24 insertions(+), 3 deletions(-)

diff --git a/arch/x86/coco/tdx/tdx.c b/arch/x86/coco/tdx/tdx.c
index 0d9b090b4880..cc2a637dca15 100644
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
@@ -380,13 +381,18 @@ static int handle_halt(struct ve_info *ve)
 {
 	const bool irq_disabled = irqs_disabled();
 
+	if (!irq_disabled) {
+		WARN_ONCE(1, "HLT instruction emulation unsafe with irqs enabled\n");
+		return -EIO;
+	}
+
 	if (__halt(irq_disabled))
 		return -EIO;
 
 	return ve_instr_len(ve);
 }
 
-void __cpuidle tdx_safe_halt(void)
+void __cpuidle tdx_idle(void)
 {
 	const bool irq_disabled = false;
 
@@ -397,6 +403,12 @@ void __cpuidle tdx_safe_halt(void)
 		WARN_ONCE(1, "HLT instruction emulation failed\n");
 }
 
+static void __cpuidle tdx_safe_halt(void)
+{
+	tdx_idle();
+	raw_local_irq_enable();
+}
+
 static int read_msr(struct pt_regs *regs, struct ve_info *ve)
 {
 	struct tdx_module_args args = {
@@ -1083,6 +1095,15 @@ void __init tdx_early_init(void)
 	x86_platform.guest.enc_kexec_begin	     = tdx_kexec_begin;
 	x86_platform.guest.enc_kexec_finish	     = tdx_kexec_finish;
 
+#ifdef CONFIG_PARAVIRT_XXL
+	/*
+	 * halt instruction execution is not atomic for TDX VMs as it generates
+	 * #VEs, so otherwise "safe" halt invocations which cause interrupts to
+	 * get enabled right after halt instruction don't work for TDX VMs.
+	 */
+	pv_ops.irq.safe_halt = tdx_safe_halt;
+#endif
+
 	/*
 	 * TDX intercepts the RDMSR to read the X2APIC ID in the parallel
 	 * bringup low level code. That raises #VE which cannot be handled
diff --git a/arch/x86/include/asm/tdx.h b/arch/x86/include/asm/tdx.h
index eba178996d84..dd386500ab1c 100644
--- a/arch/x86/include/asm/tdx.h
+++ b/arch/x86/include/asm/tdx.h
@@ -58,7 +58,7 @@ void tdx_get_ve_info(struct ve_info *ve);
 
 bool tdx_handle_virt_exception(struct pt_regs *regs, struct ve_info *ve);
 
-void tdx_safe_halt(void);
+void tdx_idle(void);
 
 bool tdx_early_handle_ve(struct pt_regs *regs);
 
diff --git a/arch/x86/kernel/process.c b/arch/x86/kernel/process.c
index f63f8fd00a91..4083838fe4a0 100644
--- a/arch/x86/kernel/process.c
+++ b/arch/x86/kernel/process.c
@@ -933,7 +933,7 @@ void __init select_idle_routine(void)
 		static_call_update(x86_idle, mwait_idle);
 	} else if (cpu_feature_enabled(X86_FEATURE_TDX_GUEST)) {
 		pr_info("using TDX aware idle routine\n");
-		static_call_update(x86_idle, tdx_safe_halt);
+		static_call_update(x86_idle, tdx_idle);
 	} else {
 		static_call_update(x86_idle, default_idle);
 	}
-- 
2.48.1.262.g85cc9f2d1e-goog

