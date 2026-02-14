Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6599B289374
	for <linux-coco@lists.linux.dev>; Sat, 14 Feb 2026 01:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771032439; cv=none; b=EeGu/3hRHXqUSwaCkzrDAk2NiZ3xoHiLi8kroOlueSJ2sF/v61ZLHyJ/L+kQyuEveSVSMb6OESYN4zjAH8vcF9rKhj8Rfz7daIsQEXvRXNjiyLqyiR2JUy60RGJBJbgzDbSVJqE/Wpw7YLAU54TV0ReZ5SYF86a0hAx/vxyR8Zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771032439; c=relaxed/simple;
	bh=/EVryE9KEraeRZcfAjdAXyVVep9IRYm2MBvmK48Hx8s=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=mlm3LkFoZfFxBAzpnoFKYs9AKctHsyQmFHbHYFXkM0Pq9rB3e9Cgepx8tgTWIbcRPixX3BMwvDcMUsHt397pW0UQf2ALbb6L49NW43MN9Y8Mx+EEYvh1XFB9xwn8RITvEATdRUstOHhp46uhwGpVvNlR7X+HzKKLxW08NoJWIis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=oI1XCKYf; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="oI1XCKYf"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2a75ed2f89dso19804145ad.1
        for <linux-coco@lists.linux.dev>; Fri, 13 Feb 2026 17:27:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771032437; x=1771637237; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=+DBpVUd3qPIKBqituI0MpYpKiFQclysQZsAv6lUaJSc=;
        b=oI1XCKYf6zV/Y1EUnE9r+stATS3kQ9dMoNNjgXnjYuIuYsv7vKamsm54c1uVBKN9Gh
         MzRz2whHinTBSWa+P2Nu0OXqTi0ID4vLvRnzy7TUcC6BhHsm20qTmFJr9bb6BfZAa2fs
         zDJ38lG0RE0RqTBxLHGO9NE3+HNSfsKWSn5XSdASkWkUbt9Y7wEOXgmAsEj0EOMAimny
         wQRGAwML8cOxUIQ9oPogaYpeJt0EqkBJDMQkODXaaSa7LgbSSB+EFk2B9C6MgKH7HWz6
         ar2W1TA+QKS7Bs5Cveyrc5lAj+TVNEfbtyYfZSBPYm33JHxcpctTgDazPoogmKT3v4XS
         jFSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771032437; x=1771637237;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+DBpVUd3qPIKBqituI0MpYpKiFQclysQZsAv6lUaJSc=;
        b=v8mg8FKwat/rRn5iJI+P4OE3hv0prYage4SRoukg/xkK9dBG4eepdNwBjDYM5cchsh
         ojWOgcKrvv0Z3s5ISp01Lk2Nd5lqqXUaJIM4Qk8cD+DUWLW5h6KiEaNT5r5V+f7+1n66
         EV9VBI7c3hcuoWAv/4aWqx/80YDxq3+ewo5GNIglFiT1xEEyAMOHW9Tvat2Zj73eA58r
         /c9KC0HIDtBFPW9HpePpDIWS+xSxGd8x1LKgUl7WeTJzNPLuK1QEiWG6zOiGvtqQ3RC+
         bJ6EhHqi4fSMpYcRV5rqbjgnEaDn9N19mb7ZRoB3LZ/cfqfyfzyTbvxokcC6wy7uj++i
         g9bQ==
X-Forwarded-Encrypted: i=1; AJvYcCWFxE5qrJHDNyeG1jV6W6ZZ1mGoMufhXiv7VRmvviJwCINW0K+oqXCG0jPaFrr8y6dS1Z8/2nvL3vaS@lists.linux.dev
X-Gm-Message-State: AOJu0YymuLpNZO/R0hUHv/m263FdnzsHPtXAGFXzWjtDyW7qCPpUqfJ5
	0n2BC73fSurnztKzKGxxdFrfL1NCf3cMF55C0OuCC/4pIHVEsjJMhMvVimbruzxENb64c6zqdPL
	3ctO8gQ==
X-Received: from pjbnd8.prod.google.com ([2002:a17:90b:4cc8:b0:356:2c99:c20a])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:db0f:b0:2aa:de68:98c8
 with SMTP id d9443c01a7336-2ad1740c141mr11643275ad.4.1771032436499; Fri, 13
 Feb 2026 17:27:16 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 13 Feb 2026 17:26:52 -0800
In-Reply-To: <20260214012702.2368778-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260214012702.2368778-1-seanjc@google.com>
X-Mailer: git-send-email 2.53.0.310.g728cabbaf7-goog
Message-ID: <20260214012702.2368778-7-seanjc@google.com>
Subject: [PATCH v3 06/16] KVM: VMX: Move core VMXON enablement to kernel
From: Sean Christopherson <seanjc@google.com>
To: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Kiryl Shutsemau <kas@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev, 
	kvm@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	Chao Gao <chao.gao@intel.com>, Xu Yilun <yilun.xu@linux.intel.com>, 
	Dan Williams <dan.j.williams@intel.com>
Content-Type: text/plain; charset="UTF-8"

Move the innermost VMXON+VMXOFF logic out of KVM and into to core x86 so
that TDX can (eventually) force VMXON without having to rely on KVM being
loaded, e.g. to do SEAMCALLs during initialization.

Opportunistically update the comment regarding emergency disabling via NMI
to clarify that virt_rebooting will be set by _another_ emergency callback,
i.e. that virt_rebooting doesn't need to be set before VMCLEAR, only
before _this_ invocation does VMXOFF.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/events/intel/pt.c  |  1 -
 arch/x86/include/asm/virt.h |  6 +--
 arch/x86/kvm/vmx/vmx.c      | 73 +++----------------------------
 arch/x86/virt/hw.c          | 85 ++++++++++++++++++++++++++++++++++++-
 4 files changed, 92 insertions(+), 73 deletions(-)

diff --git a/arch/x86/events/intel/pt.c b/arch/x86/events/intel/pt.c
index 44524a387c58..b5726b50e77d 100644
--- a/arch/x86/events/intel/pt.c
+++ b/arch/x86/events/intel/pt.c
@@ -1591,7 +1591,6 @@ void intel_pt_handle_vmx(int on)
 
 	local_irq_restore(flags);
 }
-EXPORT_SYMBOL_FOR_KVM(intel_pt_handle_vmx);
 
 /*
  * PMU callbacks
diff --git a/arch/x86/include/asm/virt.h b/arch/x86/include/asm/virt.h
index 0da6db4f5b0c..cca0210a5c16 100644
--- a/arch/x86/include/asm/virt.h
+++ b/arch/x86/include/asm/virt.h
@@ -2,8 +2,6 @@
 #ifndef _ASM_X86_VIRT_H
 #define _ASM_X86_VIRT_H
 
-#include <linux/percpu-defs.h>
-
 #include <asm/reboot.h>
 
 #if IS_ENABLED(CONFIG_KVM_X86)
@@ -12,7 +10,9 @@ extern bool virt_rebooting;
 void __init x86_virt_init(void);
 
 #if IS_ENABLED(CONFIG_KVM_INTEL)
-DECLARE_PER_CPU(struct vmcs *, root_vmcs);
+int x86_vmx_enable_virtualization_cpu(void);
+int x86_vmx_disable_virtualization_cpu(void);
+void x86_vmx_emergency_disable_virtualization_cpu(void);
 #endif
 
 #else
diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index e767835a4f3a..36238cc694fd 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -786,41 +786,16 @@ static int vmx_set_guest_uret_msr(struct vcpu_vmx *vmx,
 	return ret;
 }
 
-/*
- * Disable VMX and clear CR4.VMXE (even if VMXOFF faults)
- *
- * Note, VMXOFF causes a #UD if the CPU is !post-VMXON, but it's impossible to
- * atomically track post-VMXON state, e.g. this may be called in NMI context.
- * Eat all faults as all other faults on VMXOFF faults are mode related, i.e.
- * faults are guaranteed to be due to the !post-VMXON check unless the CPU is
- * magically in RM, VM86, compat mode, or at CPL>0.
- */
-static int kvm_cpu_vmxoff(void)
-{
-	asm goto("1: vmxoff\n\t"
-			  _ASM_EXTABLE(1b, %l[fault])
-			  ::: "cc", "memory" : fault);
-
-	cr4_clear_bits(X86_CR4_VMXE);
-	return 0;
-
-fault:
-	cr4_clear_bits(X86_CR4_VMXE);
-	return -EIO;
-}
-
 void vmx_emergency_disable_virtualization_cpu(void)
 {
 	int cpu = raw_smp_processor_id();
 	struct loaded_vmcs *v;
 
-	virt_rebooting = true;
-
 	/*
 	 * Note, CR4.VMXE can be _cleared_ in NMI context, but it can only be
-	 * set in task context.  If this races with VMX is disabled by an NMI,
-	 * VMCLEAR and VMXOFF may #UD, but KVM will eat those faults due to
-	 * virt_rebooting set.
+	 * set in task context.  If this races with _another_ emergency call
+	 * from NMI context, VMCLEAR may #UD, but KVM will eat those faults due
+	 * to virt_rebooting being set by the interrupting NMI callback.
 	 */
 	if (!(__read_cr4() & X86_CR4_VMXE))
 		return;
@@ -832,7 +807,7 @@ void vmx_emergency_disable_virtualization_cpu(void)
 			vmcs_clear(v->shadow_vmcs);
 	}
 
-	kvm_cpu_vmxoff();
+	x86_vmx_emergency_disable_virtualization_cpu();
 }
 
 static void __loaded_vmcs_clear(void *arg)
@@ -2988,34 +2963,9 @@ int vmx_check_processor_compat(void)
 	return 0;
 }
 
-static int kvm_cpu_vmxon(u64 vmxon_pointer)
-{
-	u64 msr;
-
-	cr4_set_bits(X86_CR4_VMXE);
-
-	asm goto("1: vmxon %[vmxon_pointer]\n\t"
-			  _ASM_EXTABLE(1b, %l[fault])
-			  : : [vmxon_pointer] "m"(vmxon_pointer)
-			  : : fault);
-	return 0;
-
-fault:
-	WARN_ONCE(1, "VMXON faulted, MSR_IA32_FEAT_CTL (0x3a) = 0x%llx\n",
-		  rdmsrq_safe(MSR_IA32_FEAT_CTL, &msr) ? 0xdeadbeef : msr);
-	cr4_clear_bits(X86_CR4_VMXE);
-
-	return -EFAULT;
-}
-
 int vmx_enable_virtualization_cpu(void)
 {
 	int cpu = raw_smp_processor_id();
-	u64 phys_addr = __pa(per_cpu(root_vmcs, cpu));
-	int r;
-
-	if (cr4_read_shadow() & X86_CR4_VMXE)
-		return -EBUSY;
 
 	/*
 	 * This can happen if we hot-added a CPU but failed to allocate
@@ -3024,15 +2974,7 @@ int vmx_enable_virtualization_cpu(void)
 	if (kvm_is_using_evmcs() && !hv_get_vp_assist_page(cpu))
 		return -EFAULT;
 
-	intel_pt_handle_vmx(1);
-
-	r = kvm_cpu_vmxon(phys_addr);
-	if (r) {
-		intel_pt_handle_vmx(0);
-		return r;
-	}
-
-	return 0;
+	return x86_vmx_enable_virtualization_cpu();
 }
 
 static void vmclear_local_loaded_vmcss(void)
@@ -3049,12 +2991,9 @@ void vmx_disable_virtualization_cpu(void)
 {
 	vmclear_local_loaded_vmcss();
 
-	if (kvm_cpu_vmxoff())
-		kvm_spurious_fault();
+	x86_vmx_disable_virtualization_cpu();
 
 	hv_reset_evmcs();
-
-	intel_pt_handle_vmx(0);
 }
 
 struct vmcs *alloc_vmcs_cpu(bool shadow, int cpu, gfp_t flags)
diff --git a/arch/x86/virt/hw.c b/arch/x86/virt/hw.c
index 40495872fdfb..dc426c2bc24a 100644
--- a/arch/x86/virt/hw.c
+++ b/arch/x86/virt/hw.c
@@ -15,8 +15,89 @@ __visible bool virt_rebooting;
 EXPORT_SYMBOL_FOR_KVM(virt_rebooting);
 
 #if IS_ENABLED(CONFIG_KVM_INTEL)
-DEFINE_PER_CPU(struct vmcs *, root_vmcs);
-EXPORT_PER_CPU_SYMBOL(root_vmcs);
+static DEFINE_PER_CPU(struct vmcs *, root_vmcs);
+
+static int x86_virt_cpu_vmxon(void)
+{
+	u64 vmxon_pointer = __pa(per_cpu(root_vmcs, raw_smp_processor_id()));
+	u64 msr;
+
+	cr4_set_bits(X86_CR4_VMXE);
+
+	asm goto("1: vmxon %[vmxon_pointer]\n\t"
+			  _ASM_EXTABLE(1b, %l[fault])
+			  : : [vmxon_pointer] "m"(vmxon_pointer)
+			  : : fault);
+	return 0;
+
+fault:
+	WARN_ONCE(1, "VMXON faulted, MSR_IA32_FEAT_CTL (0x3a) = 0x%llx\n",
+		  rdmsrq_safe(MSR_IA32_FEAT_CTL, &msr) ? 0xdeadbeef : msr);
+	cr4_clear_bits(X86_CR4_VMXE);
+
+	return -EFAULT;
+}
+
+int x86_vmx_enable_virtualization_cpu(void)
+{
+	int r;
+
+	if (cr4_read_shadow() & X86_CR4_VMXE)
+		return -EBUSY;
+
+	intel_pt_handle_vmx(1);
+
+	r = x86_virt_cpu_vmxon();
+	if (r) {
+		intel_pt_handle_vmx(0);
+		return r;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_FOR_KVM(x86_vmx_enable_virtualization_cpu);
+
+/*
+ * Disable VMX and clear CR4.VMXE (even if VMXOFF faults)
+ *
+ * Note, VMXOFF causes a #UD if the CPU is !post-VMXON, but it's impossible to
+ * atomically track post-VMXON state, e.g. this may be called in NMI context.
+ * Eat all faults as all other faults on VMXOFF faults are mode related, i.e.
+ * faults are guaranteed to be due to the !post-VMXON check unless the CPU is
+ * magically in RM, VM86, compat mode, or at CPL>0.
+ */
+int x86_vmx_disable_virtualization_cpu(void)
+{
+	int r = -EIO;
+
+	asm goto("1: vmxoff\n\t"
+		 _ASM_EXTABLE(1b, %l[fault])
+		 ::: "cc", "memory" : fault);
+	r = 0;
+
+fault:
+	cr4_clear_bits(X86_CR4_VMXE);
+	intel_pt_handle_vmx(0);
+	return r;
+}
+EXPORT_SYMBOL_FOR_KVM(x86_vmx_disable_virtualization_cpu);
+
+void x86_vmx_emergency_disable_virtualization_cpu(void)
+{
+	virt_rebooting = true;
+
+	/*
+	 * Note, CR4.VMXE can be _cleared_ in NMI context, but it can only be
+	 * set in task context.  If this races with _another_ emergency call
+	 * from NMI context, VMXOFF may #UD, but kernel will eat those faults
+	 * due to virt_rebooting being set by the interrupting NMI callback.
+	 */
+	if (!(__read_cr4() & X86_CR4_VMXE))
+		return;
+
+	x86_vmx_disable_virtualization_cpu();
+}
+EXPORT_SYMBOL_FOR_KVM(x86_vmx_emergency_disable_virtualization_cpu);
 
 static __init void x86_vmx_exit(void)
 {
-- 
2.53.0.310.g728cabbaf7-goog

