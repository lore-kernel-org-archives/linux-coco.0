Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 054ED285C98
	for <linux-coco@lists.linux.dev>; Sat, 14 Feb 2026 01:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771032440; cv=none; b=ax2RUPzBmm4DgkMNaw987cb4X/apZ4n9DWBjSD4L3kAF6DY3JIbIp1laYFinhqiJcrsIH+ReeAzaUfEegXTuB35IN1VwIqgAwBss0w9BdDgcPFI5Gl0pmBrztUMQWGjy0od9SmPeMTZZ4bnEmJVgBh8XgsmnrgAe+cvSOhiJh3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771032440; c=relaxed/simple;
	bh=kfZ1Zz3kqt0Lijh2yW8pjFnNAWPf0J1gDLwcJsJYrSU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=jQp2zAdAnWUv3HJsePs7+n264oYZilNmg4faHpLp7sZ5nXEuqOsA78ETRAvRTHNG326MGS6dnnUQROPdeSyJaprj/zJUzeBQmuLIcTarMnr94zOWMfbgwBSulGYU/kT7RfdnGVVgoiVA2EjiSL2cxtgXJXV1GEf8P6kmAl2FHd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NMy5xQEp; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NMy5xQEp"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-3569ceeb335so1540626a91.2
        for <linux-coco@lists.linux.dev>; Fri, 13 Feb 2026 17:27:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771032438; x=1771637238; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=g0hBl26w79lKn400XYX8NYrJRLqwtNFM7RMEsJBIMT0=;
        b=NMy5xQEpoof932tMjs10Ldh/7Vimd7acYoGsoVMr+AJBVBNp0Lgo1lV9H+ff7pqqi+
         IBla9GLTr6wtr8grmuE3Efp6QnKMLUQHjnZjZ/jSGeCo7W9Vp0ZioG8C+QAFgkLrXksY
         sZKl7+PWYchyXfhSXRfRIS6YNEqnPSnePAM1ueT8UFRRNjervQmcLcVqIBCFtcd3FRY+
         2ynhJIQCefAHb8x+uOZ4KpMuCYXxpz2390OTWAXZekJRbiqhqlaPxgUx23fpUG0OVRoL
         IH0I5oL3loOEZ582NIs7/USZgFI6D8QSTu3AbsioZLFwjJSSngvrHmGcWavLUCz8j318
         eyow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771032438; x=1771637238;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g0hBl26w79lKn400XYX8NYrJRLqwtNFM7RMEsJBIMT0=;
        b=rkajBVrmE4i5CbU6DNPEGBDJi36JHLpEldFNInrI9RNc3Xuv9TvvIuZ3h78+VYyBQW
         ECvOU/SG5ZpSA8PizuzNxF2rGZDUFO4nITPDzN7OFYOnXHM3ClIMdG4VpKjQSnhc0X9g
         sQP3kSEaE05BGIerRppTfek+heEDmx7p9N3jCyEoWWebqsnQj+FPYssIN5dpXvUYcpn5
         qtFSIgWsExmxzIoG+W728s8JmmV+Lky4q+8+uV+uOTjb2jTpZb3uQlhSvxVQ0bspOef2
         +VgE1Cvie52tnUFK4m44Dsu7eltggzMZoB3we/Mi3C9jtr4E5Z4CNw3MBnIgPRGjXs/I
         XWfg==
X-Forwarded-Encrypted: i=1; AJvYcCXqnOfeG+CDToJ64WHtqWFWmPgV0WjFDr3P0tQH+rHH/Z4h4xx9WTmVqeDKUkpo1d/l75xIFRMYkCi9@lists.linux.dev
X-Gm-Message-State: AOJu0YxvL1NWePRtkVm5GBD3Ir7ag4Dt2rMvA7If7ZQBA4AZIUFZymfw
	2wuMnrO08ysDDIA5QjKiOUHwXKI4/sjEHBLlV9Xqu3qm1Z6yS1ErR+5e7RuoQYE76S5G2eA1+a1
	pzdtqcw==
X-Received: from pjbpx8.prod.google.com ([2002:a17:90b:2708:b0:356:a274:747f])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2784:b0:343:684c:f8a0
 with SMTP id 98e67ed59e1d1-356aad5f32fmr3636333a91.23.1771032438229; Fri, 13
 Feb 2026 17:27:18 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 13 Feb 2026 17:26:53 -0800
In-Reply-To: <20260214012702.2368778-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260214012702.2368778-1-seanjc@google.com>
X-Mailer: git-send-email 2.53.0.310.g728cabbaf7-goog
Message-ID: <20260214012702.2368778-8-seanjc@google.com>
Subject: [PATCH v3 07/16] KVM: SVM: Move core EFER.SVME enablement to kernel
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

Move the innermost EFER.SVME logic out of KVM and into to core x86 to land
the SVM support alongside VMX support.  This will allow providing a more
unified API from the kernel to KVM, and will allow moving the bulk of the
emergency disabling insanity out of KVM without having a weird split
between kernel and KVM for SVM vs. VMX.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/include/asm/virt.h |  6 +++++
 arch/x86/kvm/svm/svm.c      | 33 +++++------------------
 arch/x86/virt/hw.c          | 53 +++++++++++++++++++++++++++++++++++++
 3 files changed, 65 insertions(+), 27 deletions(-)

diff --git a/arch/x86/include/asm/virt.h b/arch/x86/include/asm/virt.h
index cca0210a5c16..9a0753eaa20c 100644
--- a/arch/x86/include/asm/virt.h
+++ b/arch/x86/include/asm/virt.h
@@ -15,6 +15,12 @@ int x86_vmx_disable_virtualization_cpu(void);
 void x86_vmx_emergency_disable_virtualization_cpu(void);
 #endif
 
+#if IS_ENABLED(CONFIG_KVM_AMD)
+int x86_svm_enable_virtualization_cpu(void);
+int x86_svm_disable_virtualization_cpu(void);
+void x86_svm_emergency_disable_virtualization_cpu(void);
+#endif
+
 #else
 static __always_inline void x86_virt_init(void) {}
 #endif
diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
index 0ae66c770ebc..5f033bf3ba83 100644
--- a/arch/x86/kvm/svm/svm.c
+++ b/arch/x86/kvm/svm/svm.c
@@ -478,27 +478,9 @@ static __always_inline struct sev_es_save_area *sev_es_host_save_area(struct svm
 	return &sd->save_area->host_sev_es_save;
 }
 
-static inline void kvm_cpu_svm_disable(void)
-{
-	uint64_t efer;
-
-	wrmsrq(MSR_VM_HSAVE_PA, 0);
-	rdmsrq(MSR_EFER, efer);
-	if (efer & EFER_SVME) {
-		/*
-		 * Force GIF=1 prior to disabling SVM, e.g. to ensure INIT and
-		 * NMI aren't blocked.
-		 */
-		stgi();
-		wrmsrq(MSR_EFER, efer & ~EFER_SVME);
-	}
-}
-
 static void svm_emergency_disable_virtualization_cpu(void)
 {
-	virt_rebooting = true;
-
-	kvm_cpu_svm_disable();
+	wrmsrq(MSR_VM_HSAVE_PA, 0);
 }
 
 static void svm_disable_virtualization_cpu(void)
@@ -507,7 +489,7 @@ static void svm_disable_virtualization_cpu(void)
 	if (tsc_scaling)
 		__svm_write_tsc_multiplier(SVM_TSC_RATIO_DEFAULT);
 
-	kvm_cpu_svm_disable();
+	x86_svm_disable_virtualization_cpu();
 
 	amd_pmu_disable_virt();
 }
@@ -516,12 +498,12 @@ static int svm_enable_virtualization_cpu(void)
 {
 
 	struct svm_cpu_data *sd;
-	uint64_t efer;
 	int me = raw_smp_processor_id();
+	int r;
 
-	rdmsrq(MSR_EFER, efer);
-	if (efer & EFER_SVME)
-		return -EBUSY;
+	r = x86_svm_enable_virtualization_cpu();
+	if (r)
+		return r;
 
 	sd = per_cpu_ptr(&svm_data, me);
 	sd->asid_generation = 1;
@@ -529,8 +511,6 @@ static int svm_enable_virtualization_cpu(void)
 	sd->next_asid = sd->max_asid + 1;
 	sd->min_asid = max_sev_asid + 1;
 
-	wrmsrq(MSR_EFER, efer | EFER_SVME);
-
 	wrmsrq(MSR_VM_HSAVE_PA, sd->save_area_pa);
 
 	if (static_cpu_has(X86_FEATURE_TSCRATEMSR)) {
@@ -541,7 +521,6 @@ static int svm_enable_virtualization_cpu(void)
 		__svm_write_tsc_multiplier(SVM_TSC_RATIO_DEFAULT);
 	}
 
-
 	/*
 	 * Get OSVW bits.
 	 *
diff --git a/arch/x86/virt/hw.c b/arch/x86/virt/hw.c
index dc426c2bc24a..014e9dfab805 100644
--- a/arch/x86/virt/hw.c
+++ b/arch/x86/virt/hw.c
@@ -163,6 +163,59 @@ static __init int x86_vmx_init(void)
 static __init int x86_vmx_init(void) { return -EOPNOTSUPP; }
 #endif
 
+#if IS_ENABLED(CONFIG_KVM_AMD)
+int x86_svm_enable_virtualization_cpu(void)
+{
+	u64 efer;
+
+	if (!cpu_feature_enabled(X86_FEATURE_SVM))
+		return -EOPNOTSUPP;
+
+	rdmsrq(MSR_EFER, efer);
+	if (efer & EFER_SVME)
+		return -EBUSY;
+
+	wrmsrq(MSR_EFER, efer | EFER_SVME);
+	return 0;
+}
+EXPORT_SYMBOL_FOR_KVM(x86_svm_enable_virtualization_cpu);
+
+int x86_svm_disable_virtualization_cpu(void)
+{
+	int r = -EIO;
+	u64 efer;
+
+	/*
+	 * Force GIF=1 prior to disabling SVM, e.g. to ensure INIT and
+	 * NMI aren't blocked.
+	 */
+	asm goto("1: stgi\n\t"
+		 _ASM_EXTABLE(1b, %l[fault])
+		 ::: "memory" : fault);
+	r = 0;
+
+fault:
+	rdmsrq(MSR_EFER, efer);
+	wrmsrq(MSR_EFER, efer & ~EFER_SVME);
+	return r;
+}
+EXPORT_SYMBOL_FOR_KVM(x86_svm_disable_virtualization_cpu);
+
+void x86_svm_emergency_disable_virtualization_cpu(void)
+{
+	u64 efer;
+
+	virt_rebooting = true;
+
+	rdmsrq(MSR_EFER, efer);
+	if (!(efer & EFER_SVME))
+		return;
+
+	x86_svm_disable_virtualization_cpu();
+}
+EXPORT_SYMBOL_FOR_KVM(x86_svm_emergency_disable_virtualization_cpu);
+#endif
+
 void __init x86_virt_init(void)
 {
 	x86_vmx_init();
-- 
2.53.0.310.g728cabbaf7-goog

