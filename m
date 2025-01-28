Received: from mail-oa1-f73.google.com (mail-oa1-f73.google.com [209.85.160.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 187511F152E
	for <linux-coco@lists.linux.dev>; Tue, 28 Jan 2025 21:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738100235; cv=none; b=tK32gZY+N5IIsViHLIT3mF80vIb6UH68aUSqMlORGgKI81KlbChs3GfnnaryBjlA/0d8RxhV8X7z9XO2WSlkL1gy8zcIq5KA+P2UYt1V77EhRfvDRyz6rvEMP0zJiJU+GujdLtbu1L1mhvgQt+NM2u36eytCv4Scc+8JQSpMIGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738100235; c=relaxed/simple;
	bh=H3dJtC0a6qCKsLWlXHs1mbe3B6UOtbImo5pKDP5H/7o=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=tP6Gkax4V23r2KqbHdmaETJ4JFsP40XsZ7TcWyEpDGkpb4cxCOqrLdMgGNUDU4UdCxaFzN+qPWbZxFOxJTWOVWlKskFhgwZ3kkcu2tgxqqyOzFn9JG/P7gZfybZOrt3BSjdE3ymY+wjVwmIxoUtuNiZUu7nS1pt5hOLcO7EeUN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--vannapurve.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tMmnDusT; arc=none smtp.client-ip=209.85.160.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vannapurve.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tMmnDusT"
Received: by mail-oa1-f73.google.com with SMTP id 586e51a60fabf-2acd587d640so4418882fac.0
        for <linux-coco@lists.linux.dev>; Tue, 28 Jan 2025 13:37:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738100233; x=1738705033; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8u2LNcB7II7HUojdsZOdJRA/x9pXhTfw5CSocrzmz7E=;
        b=tMmnDusTshymGI307YcyvfCnF8vXOWSsrEDQtfHtARW8MJFuj4B8oV4vpU/xKH3Uwj
         dOqjToIg3azBTS70csGdo/T2H0mEbRj8Y0NPcV2fsA5EsGbz2vEwpzUBoWGzeQViG3RV
         S2lzfxMxhMwSjXv1Oh3J5VZ3uHAOEzvNyV1h5rlYAYt1h+gT/wZv/SfCmxqzGcpp11we
         0F/89b1CMkAbDJtaAps29jIqL7QGyX78icGDh8ONyirfrTEqF70uY2Y/q/OohuDQbxMw
         0GvNB4LWm5+5vf9KetvpxXrfjfX4nBPVR7QFT0Zn3KPk0N9Lqif0Bl4iAtrX4UxpT89E
         9/Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738100233; x=1738705033;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8u2LNcB7II7HUojdsZOdJRA/x9pXhTfw5CSocrzmz7E=;
        b=IgQmtzqY7A4/ovY90l3LMwUg9BeltpXuL978mNiAExNuacujTRV3vgNpMIJAD8M+e5
         eJpwkV7EWGpV6/qlNrNsQu/4q0NSznVhoSl4A0Te6vAGDMq4dSUgx7f5APdpHnlfEa8V
         h++JFvTfOHcxt0GRqkxYk2wpjR81ZuPEo1l6/0r0urV5prgp4hs1IfN9AaWJisDauLBg
         udByfylOsSPGIRnH+uiTnEdOKHSUIpP+cd+FuNSCjiQERO2h76dQLqljHgHibuKJ+OE5
         NKkH5m6pydqiguFOG7KENheyQXqQOQ1MmVahpiLPCXwbCmruHMGZi73XFJafx7MqFIyx
         tPrQ==
X-Forwarded-Encrypted: i=1; AJvYcCW/16jDx7T4uwF16GjRghQS6d5D2Y0LdG2YedzGuA6UcdgNzziacsKHZE1nZ96VgRLKPy5lM3TcRQt2@lists.linux.dev
X-Gm-Message-State: AOJu0YyEUXKrgb6el2B7wPfyB1nZiqBUPs7zA9IOK7WA0ZQXaMEgzUjY
	PmJw2rHindyfL82HPGaa1AajEaVxcSWBOUxMRXN5dwZlk6yIFZrfUSYlFkg+yXqbv762TSwJado
	V/gKFB4s68ElA17cJoQ==
X-Google-Smtp-Source: AGHT+IF80OmSEfqMWjcfumktyVkrWkO4QSQ7QLBvCiZJjhd5IKxO3deNkyj1SPTIbsvzCCXM4Hc0cASCnuPAU6R1
X-Received: from oabwh38.prod.google.com ([2002:a05:6871:a6a6:b0:29e:8f:7694])
 (user=vannapurve job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6870:d88b:b0:29f:b7f1:d844 with SMTP id 586e51a60fabf-2b32ef658bamr469745fac.2.1738100232892;
 Tue, 28 Jan 2025 13:37:12 -0800 (PST)
Date: Tue, 28 Jan 2025 21:36:52 +0000
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.48.1.262.g85cc9f2d1e-goog
Message-ID: <20250128213652.1880545-1-vannapurve@google.com>
Subject: [PATCH 1/1] x86/tdx: Route safe halt execution via tdx_safe_halt
From: Vishal Annapurve <vannapurve@google.com>
To: x86@kernel.org, linux-kernel@vger.kernel.org
Cc: pbonzini@redhat.com, seanjc@google.com, erdemaktas@google.com, 
	ackerleytng@google.com, jxgao@google.com, sagis@google.com, oupton@google.com, 
	pgonda@google.com, kirill@shutemov.name, dave.hansen@linux.intel.com, 
	linux-coco@lists.linux.dev, chao.p.peng@linux.intel.com, 
	isaku.yamahata@gmail.com, Vishal Annapurve <vannapurve@google.com>
Content-Type: text/plain; charset="UTF-8"

Direct HLT instruction execution causes #VEs for TDX VMs which is routed
to hypervisor via tdvmcall. This process renders HLT instruction
execution inatomic, so any preceeding instructions like STI/MOV SS will
end up enabling interrupts before the HLT instruction is routed to the
hypervisor. This creates scenarios where interrupts could land during
HLT instruction emulation without aborting halt operation leading to
idefinite halt wait times.

x86_idle is already upgraded to invoke tdx_safe_halt to avoid such
scenarios, but it didn't cover pvnative_safe_halt which can be invoked
using raw_safe_halt from call sites like acpi_safe_halt (acpi_pm
subsystem). This patch upgrades the safe_halt executions to use
tdx_safe_halt.

To avoid future call sites which cause HLT instruction emulation with
irqs enabled, add a warn and fail the HLT instruction emulation.

Signed-off-by: Vishal Annapurve <vannapurve@google.com>
---
 arch/x86/coco/tdx/tdx.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/x86/coco/tdx/tdx.c b/arch/x86/coco/tdx/tdx.c
index 0d9b090b4880..98b5f317596d 100644
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
@@ -380,6 +381,11 @@ static int handle_halt(struct ve_info *ve)
 {
 	const bool irq_disabled = irqs_disabled();
 
+	if (!irq_disabled) {
+		WARN(1, "HLT instruction emulation unsafe with irqs enabled\n");
+		return -EIO;
+	}
+
 	if (__halt(irq_disabled))
 		return -EIO;
 
@@ -1083,6 +1089,15 @@ void __init tdx_early_init(void)
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
-- 
2.48.1.262.g85cc9f2d1e-goog

