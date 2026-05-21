Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7753536683B
	for <linux-coco@lists.linux.dev>; Thu, 21 May 2026 23:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779405453; cv=none; b=EnjbwgsAreI9tnSxRjKS39URW7rN1U48tQ36LtEuCh52t7Qym/y06CU37ld5+qc+IAImXz7TrtJF+iYzd37f5jHhkqPGURa+w9Zue91fgFEbtMWzYSmd8YD8OcbCPsChIg7PNQLCXJlv7cFlA67VaryhHMo4ED1T/BRrHBosmfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779405453; c=relaxed/simple;
	bh=Twi6LbeJb/qWz0kw5rs4LmRND6hdRFCsRXfOjFCgReU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=PVvd2nOp5u4qtky/hI1QMQ1SMkChw3ShRjo7omSLJTu09thuzdl79COg/mTTQWRI/PbWZ+GswoXklI2GY2SzSM+l82D66w371FC8toJqKg64RIhE7pRORlCL29Mf4mamzCN+KnpAWvGbpHPOUniKcFpn58i2fq87wro2sYp/juw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--wyihan.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Aj8fMp7G; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wyihan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Aj8fMp7G"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-368b15eeb3bso13573555a91.2
        for <linux-coco@lists.linux.dev>; Thu, 21 May 2026 16:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779405451; x=1780010251; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=inUMdvUCNu2M2y+Grbjs2dQB2rkNDqtn35hXxq+mv+8=;
        b=Aj8fMp7GrjUjPMCUJ28Zi3R1TDZXGUtziGzX3KPXVdoZYVmeqIRbTMdZof9x4G/S1r
         F/rJP9XIL+PkOjKw9n2QLQ2e5A5GFZtnODqN2WiCX2CExN3ADN6OMHO6bss/ix7oMr+x
         Lg2yxWGpNhSNH/22NDQA1eqvHSsaKgfr4WbA7h1WoMHqhUXXL4x2Irjv5gTnEATow5ZL
         RvRxPOYpjtrlZWmBOrVK2sdZm1alXYiap1b9XUR5dpCLkApW1+JocY0V9G989knra1dN
         NivuBiAage1pOIJrDJZVt7DPZ2e2Pwc8he0B3NJRyWE1CDSSt2X9P/rQGVsRqKW0gSEG
         IO7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779405451; x=1780010251;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=inUMdvUCNu2M2y+Grbjs2dQB2rkNDqtn35hXxq+mv+8=;
        b=fZPksnTRVBzLYv1t6QAizHpvga0cvc4IjRqhNv811KyHs59hjF945lOYKqW4iXFXBo
         DBaFSlBLz3k8hZRdqtGpTVYBsioF3JV5Ni6mOYe9vt2hHcnl9VnT8zzQR3efWoy9rbl/
         M5/YDV3568ct7LynC9WnSLs14mfdqa7TWACtu6lPnE4nArj9RMqSucGwLOs/NBdHeD7t
         YUm8WR1IdCL1tEHuvX9a0Ri1k8J8gykcFvUnj3mIkJTHEBQuvXTeozvuRZuNjVnO39tk
         Fxs3qE37813v+cqRS4/hIWr9xIsxO/qVtNBbaa4w3YRsstAvY42LY+7U1nFW/EQeJoX1
         bcdQ==
X-Forwarded-Encrypted: i=1; AFNElJ9zuLxNC7vkRvqFSsZZRCUblaHxWssNvjOteb4MNLEFxoklcklBtovPeuR+W4wvsrF+DaSW7oIQGkAe@lists.linux.dev
X-Gm-Message-State: AOJu0YxT17T+IjRKIC1597nh5wB5bYCRlksa7z1CPlz/xRIO/aJpph9X
	wpO/W3v71qHPMEG5AJp4YVoi4Pth2BDVI2IJe3NNGedE7P9O0//42uFlk8drR1CNt++ilZMqPq/
	5MZmRSg==
X-Received: from pjbbk4.prod.google.com ([2002:a17:90b:804:b0:369:1a1a:82d5])
 (user=wyihan job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:5284:b0:35f:b7f5:9b3
 with SMTP id 98e67ed59e1d1-36a67420e95mr1028347a91.3.1779405450507; Thu, 21
 May 2026 16:17:30 -0700 (PDT)
Date: Thu, 21 May 2026 23:16:50 +0000
In-Reply-To: <20260521-tdx-selftests-v13-v13-0-6983ae4c3a4d@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260521-tdx-selftests-v13-v13-0-6983ae4c3a4d@google.com>
X-Developer-Key: i=wyihan@google.com; a=ed25519; pk=cRi0fKzS5BMxlHyHY2pJv3w/1zcgfYKr6EYGYppdMYc=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779405439; l=3213;
 i=wyihan@google.com; s=20260319; h=from:subject:message-id;
 bh=YzcxNqD8InBoCzxGDzSUndemb08iklf9U0GqXNz3VQU=; b=20surOhD4fpUaOe9xSIctRm4Vjy3SYL4qB3WReCuRwhQNngpwUjkFV2A5i/tb/E9LKw8ys4fX
 L0TpMBGzsGeAzf1supT64zNI/9GaDxF6tC0cHq/KV43fM7x0SO3wAi4
X-Mailer: b4 0.14.3
Message-ID: <20260521-tdx-selftests-v13-v13-9-6983ae4c3a4d@google.com>
Subject: [PATCH  v13 09/22] KVM: selftests: Expose functions to get default
 sregs values
From: Lisa Wang <wyihan@google.com>
To: Andrew Jones <ajones@ventanamicro.com>, Ackerley Tng <ackerleytng@google.com>, 
	Binbin Wu <binbin.wu@linux.intel.com>, Chao Gao <chao.gao@intel.com>, 
	Chenyi Qiang <chenyi.qiang@intel.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Erdem Aktas <erdemaktas@google.com>, Ira Weiny <ira.weiny@intel.com>, 
	Isaku Yamahata <isaku.yamahata@intel.com>, Kiryl Shutsemau <kas@kernel.org>, 
	linux-kselftest@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, 
	"Pratik R. Sampat" <pratikrajesh.sampat@amd.com>, Reinette Chatre <reinette.chatre@intel.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Roger Wang <runanwang@google.com>, 
	Ryan Afranji <afranji@google.com>, Sagi Shahar <sagis@google.com>, 
	Sean Christopherson <seanjc@google.com>, Shuah Khan <shuah@kernel.org>, Oliver Upton <oupton@kernel.org>
Cc: Jeremiah McReynolds <jmcrey@google.com>, kvm@vger.kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, x86@kernel.org, Lisa Wang <wyihan@google.com>
Content-Type: text/plain; charset="utf-8"

From: Sagi Shahar <sagis@google.com>

TDX can't set sregs values directly using KVM_SET_SREGS. Expose the
default values of certain sregs used by TDX VMs so they can be set
manually.

Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
Signed-off-by: Sagi Shahar <sagis@google.com>
Reviewed-by: Ira Weiny <ira.weiny@intel.com>
Signed-off-by: Lisa Wang <wyihan@google.com>
---
 .../testing/selftests/kvm/include/x86/processor.h  | 33 ++++++++++++++++++++++
 tools/testing/selftests/kvm/lib/x86/processor.c    | 18 ++++--------
 2 files changed, 38 insertions(+), 13 deletions(-)

diff --git a/tools/testing/selftests/kvm/include/x86/processor.h b/tools/testing/selftests/kvm/include/x86/processor.h
index 0aa6eecfcbde..1ebf161ec5d0 100644
--- a/tools/testing/selftests/kvm/include/x86/processor.h
+++ b/tools/testing/selftests/kvm/include/x86/processor.h
@@ -29,6 +29,10 @@ extern u64 guest_tsc_khz;
 #define MAX_NR_CPUID_ENTRIES 100
 #endif
 
+#ifndef NUM_INTERRUPTS
+#define NUM_INTERRUPTS 256
+#endif
+
 #define NONCANONICAL 0xaaaaaaaaaaaaaaaaull
 
 /* Forced emulation prefix, used to invoke the emulator unconditionally. */
@@ -1562,4 +1566,33 @@ u64 *tdp_get_pte(struct kvm_vm *vm, u64 l2_gpa);
 
 bool sys_clocksource_is_based_on_tsc(void);
 
+static inline u16 kvm_get_default_idt_limit(void)
+{
+	return NUM_INTERRUPTS * sizeof(struct idt_entry) - 1;
+}
+
+static inline u16 kvm_get_default_gdt_limit(void)
+{
+	return getpagesize() - 1;
+}
+
+static inline u64 kvm_get_default_cr0(void)
+{
+	return X86_CR0_PE | X86_CR0_NE | X86_CR0_PG;
+}
+
+static inline u64 kvm_get_default_cr4(void)
+{
+	u64 cr4 = X86_CR4_PAE | X86_CR4_OSFXSR;
+
+	if (kvm_cpu_has(X86_FEATURE_XSAVE))
+		cr4 |= X86_CR4_OSXSAVE;
+	return cr4;
+}
+
+static inline u64 kvm_get_default_efer(void)
+{
+	return EFER_LME | EFER_LMA | EFER_NX;
+}
+
 #endif /* SELFTEST_KVM_PROCESSOR_H */
diff --git a/tools/testing/selftests/kvm/lib/x86/processor.c b/tools/testing/selftests/kvm/lib/x86/processor.c
index 62abfe27fe3a..5027411665bf 100644
--- a/tools/testing/selftests/kvm/lib/x86/processor.c
+++ b/tools/testing/selftests/kvm/lib/x86/processor.c
@@ -15,10 +15,6 @@
 #include "tdx/tdx_util.h"
 #include "vmx.h"
 
-#ifndef NUM_INTERRUPTS
-#define NUM_INTERRUPTS 256
-#endif
-
 gva_t exception_handlers;
 bool host_cpu_is_amd;
 bool host_cpu_is_intel;
@@ -647,16 +643,12 @@ static void vcpu_init_sregs(struct kvm_vm *vm, struct kvm_vcpu *vcpu)
 	vcpu_sregs_get(vcpu, &sregs);
 
 	sregs.idt.base = vm->arch.idt;
-	sregs.idt.limit = NUM_INTERRUPTS * sizeof(struct idt_entry) - 1;
+	sregs.idt.limit = kvm_get_default_idt_limit();
 	sregs.gdt.base = vm->arch.gdt;
-	sregs.gdt.limit = getpagesize() - 1;
-
-	sregs.cr0 = X86_CR0_PE | X86_CR0_NE | X86_CR0_PG;
-	sregs.cr4 |= X86_CR4_PAE | X86_CR4_OSFXSR;
-	if (kvm_cpu_has(X86_FEATURE_XSAVE))
-		sregs.cr4 |= X86_CR4_OSXSAVE;
-	if (vm->mmu.pgtable_levels == 5)
-		sregs.cr4 |= X86_CR4_LA57;
+	sregs.gdt.limit = kvm_get_default_gdt_limit();
+
+	sregs.cr0 = kvm_get_default_cr0();
+	sregs.cr4 |= kvm_get_default_cr4();
 	sregs.efer |= (EFER_LME | EFER_LMA | EFER_NX);
 
 	kvm_seg_set_unusable(&sregs.ldt);

-- 
2.54.0.746.g67dd491aae-goog

