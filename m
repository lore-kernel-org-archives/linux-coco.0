Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793922461;
	b=eZakz5u/C/kygSa5rJUfbOm5zwBnAQ6CvAHMIgc/oKxFTSyKifMMxAV68JHRxYBYYXP8
	 aXAIiwMDlJZOca8vXNJiGXbm6LBpWk8C7GBTz45QnGN1Ol2Qa60bRBR653oMS+WquhEkf
	 4p9wBl5/U2c9brcanwG3UK3/bX0gGTph754fvYqNAwvOH98zDiOjj2hC98W0DJT8t4eLJ
	 M/fvKovtFsdpP8enX/+xsRG0ZoyDWX7I2HGoqtMxjJS1wnP7SKok45u1tV+O7jUveqBz6
	 QzweZ0Pftnf4e8EMoWIYPLLc8YXOLxerJ18vmkvcdiO/1zeBXNQRyNfokyc3GhIwAZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793922461;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Developer-Key:X-Developer-Signature:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=fA7YOiI+4VTK/ln8Jo7W7IKbpceDBsmk5RUVcqkWWVw=;
	b=LXNjF9Q+SM7mhYe91f+Yrw8NxipesLkYDvreRlD2DIlp4EJXqH8u1BX3hjPyamwJnv1k
	 cjGVhkGelU+gi4PSRQXEuIrTPeMy+ODzIARJLNepjy375kUPwFJNUzJ+ZVJel7BwoXqOc
	 nRctu1jI6KDx3uWTFZtqq3O3gqhH82ErUeQCALw0xxnq1SpFQtcGVcUPjjVl/VoVUxBJ+
	 kQgRHSTyZclke/87+eUe4LBLK07gyws0nHaotm5A1Ctc7h2TdHPs1PgRg7NhP/BTOLNIf
	 VadNO4iWCoN/Uj5px3kb+lyDucEsJ3wWTau6zXgxOmZYlhQWP2m9W4gZacCURbvgkJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--wyihan.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=SHcfXYMm;
	arc=none smtp.remote-ip=209.85.216.71
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93D21606EE8D
	for <linux-coco@lists.linux.dev>; Thu,  5 Nov 2026 23:47:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93D21606EE8D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wyihan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=SHcfXYMm
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b0a9de9c2aso56876a91.2
        for <linux-coco@lists.linux.dev>; Thu, 05 Nov 2026 15:47:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793922461; x=1794527261; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fA7YOiI+4VTK/ln8Jo7W7IKbpceDBsmk5RUVcqkWWVw=;
        b=SHcfXYMmgJsxP6L0fXwLI6GUl4z+ye1rzCUCIhrIHwDCvQs7y4UoF2bnRpQciX3a7F
         7jbte6rf8tzTHMlGg93VnTtLJ7PYGNVGvbpBB0AdEodyfjJd6uDd7YTfywcpv9jVJ7mK
         hqjDk+/pvJ+bwgI4Ikvg0uYgHxn9LFN/4LdapU75JQufbZWCB0IJHSpZhlfWpQuV3sKB
         FO4SEkCLcLa6PEtJ5qLiKE99095xpTV3shWSgPf2kWXsrO1B3+HCrY06rmcHTrqSF6sF
         AjjepXupaJwEzG88PJfM0R2gldebk1hm+LIAIvB//0+wRXE0Z9voCvx1TZVjJTFtyuV7
         avbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793922461; x=1794527261;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fA7YOiI+4VTK/ln8Jo7W7IKbpceDBsmk5RUVcqkWWVw=;
        b=qYrx3U+S7hJyzrjXuiKJvUxDnb9D0nu4i1USBsLkIeETGicsOnut59KMdjnPbOqB/M
         q03yeSa8G8IWdRINHfv6iX2Ozmy/QC9Dt+W8+8165Ieu+IWfZMPhaZZJFxtYKmRFQwsZ
         xvGCU6ZibshRUSqmdogJG8wtYOUvUMWbckebAoVY/1sXhnADDBR2Jvy6rwQR83qWnM6Y
         80PbErloZ3O+5rt91h5wxGLIOxhk9URGBqSgiSWqrhAYX3ZUqS8PLvS4xZZ/+VRoHAEV
         50Xt91tshekg1+fw9OX/BUQSoeAtz2OclcMvO845KYmWpwE98vgkBMmr7PxgAObHFB6l
         Irww==
X-Forwarded-Encrypted: i=1; AKwUvBzB4CmCFwofdXf3PkSHkP1BpvFx7D/0yg2y6IMdOGKpFSR4Yq5U5GfdI2SvHgKvQiATPoPQqHM2tjHp@lists.linux.dev
X-Gm-Message-State: APuU4Z8EGW7QLMnJTt0FdnoI9gd63jg3uUc8zRtPWH6XcPR+WRfysl1i
	zL6Ox1HlAOeOmjijRnfBkKYkkQ3Up5FwwILQ7h2J4wPPHTMEiXzbpnbe39jPp4CCYdoQaULyO6j
	HE/WukQ==
X-Received: from pjwx3.prod.google.com ([2002:a17:90a:c2c3:b0:3ab:d09d:a37a])
 (user=wyihan job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1e48:b0:3aa:548f:eb77
 with SMTP id 98e67ed59e1d1-3b0db71207fmr631441a91.56.1793922460672; Thu, 05
 Nov 2026 15:47:40 -0800 (PST)
Date: Thu, 05 Nov 2026 23:46:52 +0000
In-Reply-To: <20261105-tdx-selftests-v16-0-2024e8fa517a@google.com>
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Post: <mailto:linux-coco@lists.linux.dev>
List-Help: <mailto:linux-coco+help@lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-coco+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261105-tdx-selftests-v16-0-2024e8fa517a@google.com>
X-Developer-Key: i=wyihan@google.com; a=ed25519; pk=cRi0fKzS5BMxlHyHY2pJv3w/1zcgfYKr6EYGYppdMYc=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793922452; l=3444;
 i=wyihan@google.com; s=20260319; h=from:subject:message-id;
 bh=mELo8AzMSh1rybV6Mt3cH30O8DVQu/DZjo7vhHkr0U8=; b=4kvvCDxfGONBikL1MthdGJfAiBfxAkmmY2JRnbb5k65T+aYbMZiKb4ZTLNkVN72rv9gLq4oyt
 nUUXa2MfG0zDBNaXBIyC/vJ0zEEjf+APKZa6zJ4Bv2cFsHu3WXQZdZ7
X-Mailer: b4 0.14.3
Message-ID: <20261105-tdx-selftests-v16-8-2024e8fa517a@google.com>
Subject: [PATCH v16 08/20] KVM: selftests: Expose functions to get default
 sregs values
From: Lisa Wang <wyihan@google.com>
To: Andrew Jones <ajones@ventanamicro.com>, Ackerley Tng <ackerleytng@google.com>, 
	Binbin Wu <binbin.wu@linux.intel.com>, Chao Gao <chao.gao@intel.com>, 
	Chenyi Qiang <chenyi.qiang@intel.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Erdem Aktas <erdemaktas@google.com>, Ira Weiny <iweiny@kernel.org>, 
	Isaku Yamahata <isaku.yamahata@intel.com>, Kiryl Shutsemau <kas@kernel.org>, 
	linux-kselftest@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, 
	"Pratik R. Sampat" <pratikrajesh.sampat@amd.com>, Reinette Chatre <reinette.chatre@intel.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Roger Wang <runanwang@google.com>, 
	Ryan Afranji <afranji@google.com>, Sagi Shahar <sagis@google.com>, 
	Sean Christopherson <seanjc@google.com>, Shuah Khan <shuah@kernel.org>, Xiaoyao Li <xiaoyao.li@intel.com>, 
	Oliver Upton <oupton@kernel.org>
Cc: Jeremiah McReynolds <jmcrey@google.com>, kvm@vger.kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, x86@kernel.org, Lisa Wang <wyihan@google.com>, 
	Ira Weiny <iweiny@kernel.org>
Content-Type: text/plain; charset="utf-8"

From: Sagi Shahar <sagis@google.com>

TDX can't set sregs values directly using KVM_SET_SREGS. Expose the
default values of certain sregs used by TDX VMs so they can be set
manually.

Signed-off-by: Sagi Shahar <sagis@google.com>
Signed-off-by: Lisa Wang <wyihan@google.com>
Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
Reviewed-by: Ira Weiny <ira.weiny@intel.com>
Reviewed-by: Xiaoyao Li <xiaoyao.li@intel.com>
---
 .../testing/selftests/kvm/include/x86/processor.h  | 35 ++++++++++++++++++++++
 tools/testing/selftests/kvm/lib/x86/processor.c    | 20 ++++---------
 2 files changed, 41 insertions(+), 14 deletions(-)

diff --git a/tools/testing/selftests/kvm/include/x86/processor.h b/tools/testing/selftests/kvm/include/x86/processor.h
index e62ca763135e..4db0c7009876 100644
--- a/tools/testing/selftests/kvm/include/x86/processor.h
+++ b/tools/testing/selftests/kvm/include/x86/processor.h
@@ -32,6 +32,10 @@ extern struct kvm_mmu guest_mmu;
 #define MAX_NR_CPUID_ENTRIES 100
 #endif
 
+#ifndef NUM_INTERRUPTS
+#define NUM_INTERRUPTS 256
+#endif
+
 #define NONCANONICAL 0xaaaaaaaaaaaaaaaaull
 
 /* Forced emulation prefix, used to invoke the emulator unconditionally. */
@@ -1672,4 +1676,35 @@ u64 *tdp_get_pte(struct kvm_vm *vm, u64 l2_gpa);
 
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
+static inline u64 kvm_get_default_cr4(int pgtable_levels)
+{
+	u64 cr4 = X86_CR4_PAE | X86_CR4_OSFXSR;
+
+	if (kvm_cpu_has(X86_FEATURE_XSAVE))
+		cr4 |= X86_CR4_OSXSAVE;
+	if (pgtable_levels == 5)
+		cr4 |= X86_CR4_LA57;
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
index fe56df0c7aa4..b8dbb16d5a28 100644
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
@@ -655,17 +651,13 @@ static void vcpu_init_sregs(struct kvm_vm *vm, struct kvm_vcpu *vcpu)
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
-	sregs.efer |= (EFER_LME | EFER_LMA | EFER_NX);
+	sregs.gdt.limit = kvm_get_default_gdt_limit();
+
+	sregs.cr0 = kvm_get_default_cr0();
+	sregs.cr4 |= kvm_get_default_cr4(vm->mmu.pgtable_levels);
+	sregs.efer |= kvm_get_default_efer();
 
 	kvm_seg_set_unusable(&sregs.ldt);
 	kvm_seg_set_kernel_code_64bit(&sregs.cs);

-- 
2.56.0.455.g6c5a503b38-goog

