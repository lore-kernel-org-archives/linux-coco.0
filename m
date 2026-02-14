Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2FD029DB99
	for <linux-coco@lists.linux.dev>; Sat, 14 Feb 2026 01:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771032436; cv=none; b=rFDDM1FTy3xMx4EGRplAm69umPS7VBztuM+ZD1u7aUph27EM32X8BzlKWFslrpN7JatP3I/xi0oyAe6rW2pb+FPaBCyP3uXXCMcIAuNC7QZGgCuNWtE5gmzni4O1s/OdP28aOFREaPS6bEHVMx62iOKtPJgWDbcmqNLbsKAYXFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771032436; c=relaxed/simple;
	bh=f74NX1koICdcmf3x7Z0AXOlx6psRB/2lx2ODBYt41oE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ZGt71K8PpEbUWsjhS6/3+F0Hd5mb4L5YX9s6vU1ti1jfdH+IC13RFe30U99RE6DcDLMiuAoHzHQXZEZpcQ1QKnCgS2vjCm6H1TtEdXZvvhTjcGV6XWJExLgQnXWEYf5+/0uM20cMSFzQXvZw26foXxMbfUqn64uOv47Om3qrkr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=E4V2ncAZ; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="E4V2ncAZ"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-354bc535546so1515656a91.3
        for <linux-coco@lists.linux.dev>; Fri, 13 Feb 2026 17:27:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771032433; x=1771637233; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=qVKdMdext7pNokZXu6Az08qOVw2l9S4d2dq/07UMlK8=;
        b=E4V2ncAZTqLxeDLgAO6htuarwlN2RxqXiN6pr8P9lOsWaiRD2FrZR8566Yzt7mIBIG
         w8WEMXuB501CnCa6hrSc1U63LeVBDqAGiIEj/1JAXOANS8SESj43tFSXH/FB21/VgbWM
         DfGORmImNYVNHw7mZIyGaesoJAQFDLyzabSUO2nvaQ5ehQ95+F1BpRpNENV6ZM5q5gOZ
         oumRTT/NINqnv1qLLZu5uyJJPHP6fg06tKa2HWK0fDpaJPem//1eLQs+DkYU+VqqFWPv
         oTCT84xwkitmzMoOMmVD5XG1CHJO8ZsFFhK03SUoT4ozqxuX+poDlJxKP/Qh7mZ8hbNm
         BUGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771032433; x=1771637233;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qVKdMdext7pNokZXu6Az08qOVw2l9S4d2dq/07UMlK8=;
        b=gdKsoqjwwSD/EgMn4PneUyYJXQwTZJ+tD/K8pgZA/djZFaRsaxXuThahb0IOoweNW3
         6qX19WhCiL4KidNyTnZ2Cahp5w63xUWRWtpPqOq+bxt9BpKQVelKz7vYM/19RVx7kjYK
         6FMyGdxKFFx7sKM0nz0X8MtJeGUNH+P+4avfvDuOh1mas0mkMMIQeR+1+UBb38RdMvxu
         c5in7hbs0iRfH9PZFQkjiAjZKnd+7Xchf5/1xte1oF0KaH5RsmJYiHQ6QJAkWp/TnF9o
         OQ2nBAZdgAOfG7D/eLqB7AaJ6ppN3ZkZB8JgJ+y0rvSrpjATHVKdRpqJU3sXMiIkqzNn
         RKzw==
X-Forwarded-Encrypted: i=1; AJvYcCVeuB5TpNleLwghvrlM8SKJtbcOdnYQM5gwSr9WE1ZEmhr9fUGnXaw/aCta5mMPCH9/ZHszNYmLhR3+@lists.linux.dev
X-Gm-Message-State: AOJu0YwsHPkaBZCQXi8i2uisE2264ugDGrQCMPFyNBeXkeAymgWO/leL
	s4w5KP1Ui0LHvbjE63fBn5eFCk6BpiliQOhfrTf/hR6v4WO6Unsggu9rB3PItHVK+2d/bZAT8Tm
	21OCECA==
X-Received: from pjbgi4.prod.google.com ([2002:a17:90b:1104:b0:356:216c:ed75])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:5282:b0:34c:635f:f855
 with SMTP id 98e67ed59e1d1-3584481e367mr1194611a91.7.1771032433065; Fri, 13
 Feb 2026 17:27:13 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 13 Feb 2026 17:26:50 -0800
In-Reply-To: <20260214012702.2368778-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260214012702.2368778-1-seanjc@google.com>
X-Mailer: git-send-email 2.53.0.310.g728cabbaf7-goog
Message-ID: <20260214012702.2368778-5-seanjc@google.com>
Subject: [PATCH v3 04/16] KVM: VMX: Unconditionally allocate root VMCSes
 during boot CPU bringup
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

Allocate the root VMCS (misleading called "vmxarea" and "kvm_area" in KVM)
for each possible CPU during early boot CPU bringup, before early TDX
initialization, so that TDX can eventually do VMXON on-demand (to make
SEAMCALLs) without needing to load kvm-intel.ko.  Allocate the pages early
on, e.g. instead of trying to do so on-demand, to avoid having to juggle
allocation failures at runtime.

Opportunistically rename the per-CPU pointers to better reflect the role
of the VMCS.  Use Intel's "root VMCS" terminology, e.g. from various VMCS
patents[1][2] and older SDMs, not the more opaque "VMXON region" used in
recent versions of the SDM.  While it's possible the VMCS passed to VMXON
no longer serves as _the_ root VMCS on modern CPUs, it is still in effect
a "root mode VMCS", as described in the patents.

Link: https://patentimages.storage.googleapis.com/c7/e4/32/d7a7def5580667/WO2013101191A1.pdf [1]
Link: https://patentimages.storage.googleapis.com/13/f6/8d/1361fab8c33373/US20080163205A1.pdf [2]
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/include/asm/virt.h  | 13 ++++++-
 arch/x86/kernel/cpu/common.c |  2 +
 arch/x86/kvm/vmx/vmx.c       | 58 ++---------------------------
 arch/x86/virt/hw.c           | 71 ++++++++++++++++++++++++++++++++++++
 4 files changed, 89 insertions(+), 55 deletions(-)

diff --git a/arch/x86/include/asm/virt.h b/arch/x86/include/asm/virt.h
index 131b9bf9ef3c..0da6db4f5b0c 100644
--- a/arch/x86/include/asm/virt.h
+++ b/arch/x86/include/asm/virt.h
@@ -2,10 +2,21 @@
 #ifndef _ASM_X86_VIRT_H
 #define _ASM_X86_VIRT_H
 
-#include <linux/types.h>
+#include <linux/percpu-defs.h>
+
+#include <asm/reboot.h>
 
 #if IS_ENABLED(CONFIG_KVM_X86)
 extern bool virt_rebooting;
+
+void __init x86_virt_init(void);
+
+#if IS_ENABLED(CONFIG_KVM_INTEL)
+DECLARE_PER_CPU(struct vmcs *, root_vmcs);
+#endif
+
+#else
+static __always_inline void x86_virt_init(void) {}
 #endif
 
 #endif /* _ASM_X86_VIRT_H */
diff --git a/arch/x86/kernel/cpu/common.c b/arch/x86/kernel/cpu/common.c
index e7ab22fce3b5..dda9e41292db 100644
--- a/arch/x86/kernel/cpu/common.c
+++ b/arch/x86/kernel/cpu/common.c
@@ -71,6 +71,7 @@
 #include <asm/traps.h>
 #include <asm/sev.h>
 #include <asm/tdx.h>
+#include <asm/virt.h>
 #include <asm/posted_intr.h>
 #include <asm/runtime-const.h>
 
@@ -2143,6 +2144,7 @@ static __init void identify_boot_cpu(void)
 	cpu_detect_tlb(&boot_cpu_data);
 	setup_cr_pinning();
 
+	x86_virt_init();
 	tsx_init();
 	tdx_init();
 	lkgs_init();
diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index fc6e3b620866..abd4830f71d8 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -580,7 +580,6 @@ noinline void invept_error(unsigned long ext, u64 eptp)
 	vmx_insn_failed("invept failed: ext=0x%lx eptp=%llx\n", ext, eptp);
 }
 
-static DEFINE_PER_CPU(struct vmcs *, vmxarea);
 DEFINE_PER_CPU(struct vmcs *, current_vmcs);
 /*
  * We maintain a per-CPU linked-list of VMCS loaded on that CPU. This is needed
@@ -2934,6 +2933,9 @@ static bool __kvm_is_vmx_supported(void)
 		return false;
 	}
 
+	if (!per_cpu(root_vmcs, cpu))
+		return false;
+
 	return true;
 }
 
@@ -3008,7 +3010,7 @@ static int kvm_cpu_vmxon(u64 vmxon_pointer)
 int vmx_enable_virtualization_cpu(void)
 {
 	int cpu = raw_smp_processor_id();
-	u64 phys_addr = __pa(per_cpu(vmxarea, cpu));
+	u64 phys_addr = __pa(per_cpu(root_vmcs, cpu));
 	int r;
 
 	if (cr4_read_shadow() & X86_CR4_VMXE)
@@ -3129,47 +3131,6 @@ int alloc_loaded_vmcs(struct loaded_vmcs *loaded_vmcs)
 	return -ENOMEM;
 }
 
-static void free_kvm_area(void)
-{
-	int cpu;
-
-	for_each_possible_cpu(cpu) {
-		free_vmcs(per_cpu(vmxarea, cpu));
-		per_cpu(vmxarea, cpu) = NULL;
-	}
-}
-
-static __init int alloc_kvm_area(void)
-{
-	int cpu;
-
-	for_each_possible_cpu(cpu) {
-		struct vmcs *vmcs;
-
-		vmcs = alloc_vmcs_cpu(false, cpu, GFP_KERNEL);
-		if (!vmcs) {
-			free_kvm_area();
-			return -ENOMEM;
-		}
-
-		/*
-		 * When eVMCS is enabled, alloc_vmcs_cpu() sets
-		 * vmcs->revision_id to KVM_EVMCS_VERSION instead of
-		 * revision_id reported by MSR_IA32_VMX_BASIC.
-		 *
-		 * However, even though not explicitly documented by
-		 * TLFS, VMXArea passed as VMXON argument should
-		 * still be marked with revision_id reported by
-		 * physical CPU.
-		 */
-		if (kvm_is_using_evmcs())
-			vmcs->hdr.revision_id = vmx_basic_vmcs_revision_id(vmcs_config.basic);
-
-		per_cpu(vmxarea, cpu) = vmcs;
-	}
-	return 0;
-}
-
 static void fix_pmode_seg(struct kvm_vcpu *vcpu, int seg,
 		struct kvm_segment *save)
 {
@@ -8566,8 +8527,6 @@ void vmx_hardware_unsetup(void)
 
 	if (nested)
 		nested_vmx_hardware_unsetup();
-
-	free_kvm_area();
 }
 
 void vmx_vm_destroy(struct kvm *kvm)
@@ -8870,10 +8829,6 @@ __init int vmx_hardware_setup(void)
 			return r;
 	}
 
-	r = alloc_kvm_area();
-	if (r)
-		goto err_kvm_area;
-
 	kvm_set_posted_intr_wakeup_handler(pi_wakeup_handler);
 
 	/*
@@ -8900,11 +8855,6 @@ __init int vmx_hardware_setup(void)
 	kvm_caps.inapplicable_quirks &= ~KVM_X86_QUIRK_IGNORE_GUEST_PAT;
 
 	return 0;
-
-err_kvm_area:
-	if (nested)
-		nested_vmx_hardware_unsetup();
-	return r;
 }
 
 void vmx_exit(void)
diff --git a/arch/x86/virt/hw.c b/arch/x86/virt/hw.c
index df3dc18d19b4..56972f594d90 100644
--- a/arch/x86/virt/hw.c
+++ b/arch/x86/virt/hw.c
@@ -1,7 +1,78 @@
 // SPDX-License-Identifier: GPL-2.0-only
+#include <linux/cpu.h>
+#include <linux/cpumask.h>
+#include <linux/errno.h>
 #include <linux/kvm_types.h>
+#include <linux/list.h>
+#include <linux/percpu.h>
 
+#include <asm/perf_event.h>
+#include <asm/processor.h>
 #include <asm/virt.h>
+#include <asm/vmx.h>
 
 __visible bool virt_rebooting;
 EXPORT_SYMBOL_FOR_KVM(virt_rebooting);
+
+#if IS_ENABLED(CONFIG_KVM_INTEL)
+DEFINE_PER_CPU(struct vmcs *, root_vmcs);
+EXPORT_PER_CPU_SYMBOL(root_vmcs);
+
+static __init void x86_vmx_exit(void)
+{
+	int cpu;
+
+	for_each_possible_cpu(cpu) {
+		free_page((unsigned long)per_cpu(root_vmcs, cpu));
+		per_cpu(root_vmcs, cpu) = NULL;
+	}
+}
+
+static __init int x86_vmx_init(void)
+{
+	u64 basic_msr;
+	u32 rev_id;
+	int cpu;
+
+	if (!cpu_feature_enabled(X86_FEATURE_VMX))
+		return -EOPNOTSUPP;
+
+	rdmsrq(MSR_IA32_VMX_BASIC, basic_msr);
+
+	/* IA-32 SDM Vol 3B: VMCS size is never greater than 4kB. */
+	if (WARN_ON_ONCE(vmx_basic_vmcs_size(basic_msr) > PAGE_SIZE))
+		return -EIO;
+
+	/*
+	 * Even if eVMCS is enabled (or will be enabled?), and even though not
+	 * explicitly documented by TLFS, the root VMCS  passed to VMXON should
+	 * still be marked with the revision_id reported by the physical CPU.
+	 */
+	rev_id = vmx_basic_vmcs_revision_id(basic_msr);
+
+	for_each_possible_cpu(cpu) {
+		int node = cpu_to_node(cpu);
+		struct page *page;
+		struct vmcs *vmcs;
+
+		page = __alloc_pages_node(node, GFP_KERNEL | __GFP_ZERO, 0);
+		if (!page) {
+			x86_vmx_exit();
+			return -ENOMEM;
+		}
+
+		vmcs = page_address(page);
+		vmcs->hdr.revision_id = rev_id;
+		per_cpu(root_vmcs, cpu) = vmcs;
+	}
+
+	return 0;
+}
+#else
+static __init int x86_vmx_init(void) { return -EOPNOTSUPP; }
+#endif
+
+void __init x86_virt_init(void)
+{
+	x86_vmx_init();
+}
-- 
2.53.0.310.g728cabbaf7-goog

