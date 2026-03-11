Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1994D364E83
	for <linux-coco@lists.linux.dev>; Wed, 11 Mar 2026 00:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773189237; cv=none; b=u4tOkXG/Xzj5TqxCQy+a5D0LneZdCh2RTgVfHy1obtqTWH4Z/7iis+QIz8sJ/SC9AH6F3tOYIGKC9sc34ZLoxiQGvYsdT4Hd4gJw8VYIyMjj8kOFXUF5flOj+TFXHf0fQGCRjLi+odAj1mUsVEpW6m4jHkiiO30KE8P0wwL0CCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773189237; c=relaxed/simple;
	bh=a0f1FlFR/Z7SQKhHn397KaI8/VGpAunEqgFSRX9v8iY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=e3g7eCtioxa2i+YfVw15IzsEC9bj0mKVPFh9Ajz8LNltGXEVWjHqOCIQRu1egS4AYWZclBlL7Pp8k+8BIOv4IPJW6oy5slyrL4n29jlO23a5VPTZeQk0XWcLdeRpWaaSov2MdAjpGY9FmNcUTL+Si3iEyGIbyhXMbb5fgS3TV1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JKxQKAYm; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JKxQKAYm"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-c7381a9a932so3594293a12.3
        for <linux-coco@lists.linux.dev>; Tue, 10 Mar 2026 17:33:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773189235; x=1773794035; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=X69ggzZm2sR1A00OKZAFN6tQgMWt6GCX53/2b8xcbDE=;
        b=JKxQKAYma9F4CUtkkfnAoNGTaVgEzB2Lw+OuAQ4o6HoFP+cNrj8F+IbjS2sUUY05Rv
         ZeqLuklieNJGrlo5cU53Fi93Yate4qXEqjFS9Z09Xot68T4fo2wq2zbRRmrZnjrhfxGq
         QrGt4hvFEt1NUdV8YkcrA6u0ko5c3IxEoX2xe49DYsxdeoVxBnD9hS8FjUIzb0h9kz7T
         gM982fu2395DhLE/av7mrWMK0gMUpuRa4H/LTy0x84M5DfiwwL2SjPrCfPzBWw8FDVO6
         jVaeog8+d2fFoWsOgoJiju7/tt51LIOozOEaHCSO6yydjNTCuH10UhMTfhAErytyclMz
         8D9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773189235; x=1773794035;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X69ggzZm2sR1A00OKZAFN6tQgMWt6GCX53/2b8xcbDE=;
        b=CdjmU5B/LS73IVXYZ97TOXLn6wGsPWZznBFZ3PV4qzvnvV9n+d1FwDLVGbtIFwwQXy
         JUI4UBnCyahv5hoW242MaQidORPO5RXzfASu/GmkBJs2YfNq2DW8flnM2YK3XU7t3NA1
         Nueynww43wwv9XBknWxk87OB9IASdFaufo3HlJzlG0NDCaX041+zDc0AzX+3E0AU6DeX
         a6j+Dq8PuEoFXHq/vQrszgKnR8oAilCNAK9a5dhNWA8rwzeeF8rWVPAyJTQMw3OCW1cm
         ahUbgpFXtdzGGMoMTA+klUmpimb+YiPCso5uTi2QPFxzecyMIi5V/DmRaSTQGcyFxkyM
         tfGA==
X-Forwarded-Encrypted: i=1; AJvYcCWfyGygOVYQgeVPcdUuIBdduHTu6aYX6BXbaeoglcE6wEy6eB4uds8nudSRMYK833RsOFXpTbnNs5yi@lists.linux.dev
X-Gm-Message-State: AOJu0YxSDyjjWRSt3HQfibo2UDKI3SsQghMBzgd3DjwxmiLZiUXWHb9Z
	MWJh0Bymv+Iy31qYPJ3nHU3Ezmniinh/NV8AlnRn6JGmqbWwWpTpRcV3y222LYnrLHbuYf2rvBf
	o0rPKyA==
X-Received: from pghq16.prod.google.com ([2002:a63:e210:0:b0:c73:356e:5ea1])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6300:2289:b0:398:9099:6079
 with SMTP id adf61e73a8af0-398c5e6ceccmr429036637.7.1773189235315; Tue, 10
 Mar 2026 17:33:55 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Tue, 10 Mar 2026 17:33:40 -0700
In-Reply-To: <20260311003346.2626238-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260311003346.2626238-1-seanjc@google.com>
X-Mailer: git-send-email 2.53.0.473.g4a7958ca14-goog
Message-ID: <20260311003346.2626238-2-seanjc@google.com>
Subject: [PATCH 1/7] KVM: x86: Add dedicated storage for guest RIP
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Kiryl Shutsemau <kas@kernel.org>
Cc: kvm@vger.kernel.org, x86@kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, "Chang S . Bae" <chang.seok.bae@intel.com>
Content-Type: text/plain; charset="UTF-8"

Add kvm_vcpu_arch.rip to track guest RIP instead of including it in the
generic regs[] array.  Decoupling RIP from regs[] will allow using a
*completely* arbitrary index for RIP, as opposed to the mostly-arbitrary
index that is currently used.  That in turn will allow using indices
16-31 to track R16-R31 that are coming with APX.

Note, although RIP can used for addressing, it does NOT have an
architecturally defined index, and so can't be reached via flows like
get_vmx_mem_address() where KVM "blindly" reads a general purpose register
given the SIB information reported by hardware.  For RIP-relative
addressing, hardware reports the full "offset" in vmcs.EXIT_QUALIFICATION.

Note #2, keep the available/dirty tracking as RSP is context switched
through the VMCS, i.e. needs to be cached for VMX.

Opportunistically rename NR_VCPU_REGS to NR_VCPU_GENERAL_PURPOSE_REGS to
better capture what it tracks, and so that KVM can slot in R16-R13 without
running into weirdness where KVM's definition of "EXREG" doesn't line up
with APX's definition of "extended reg".

No functional change intended.

Cc: Chang S. Bae <chang.seok.bae@intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/include/asm/kvm_host.h | 10 ++++++----
 arch/x86/kvm/kvm_cache_regs.h   | 12 ++++++++----
 arch/x86/kvm/svm/sev.c          |  2 +-
 arch/x86/kvm/svm/svm.c          |  6 +++---
 arch/x86/kvm/vmx/vmx.c          |  8 ++++----
 arch/x86/kvm/vmx/vmx.h          |  2 +-
 6 files changed, 23 insertions(+), 17 deletions(-)

diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index c94556fefb75..0461ba97a3be 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -191,10 +191,11 @@ enum kvm_reg {
 	VCPU_REGS_R14 = __VCPU_REGS_R14,
 	VCPU_REGS_R15 = __VCPU_REGS_R15,
 #endif
-	VCPU_REGS_RIP,
-	NR_VCPU_REGS,
+	NR_VCPU_GENERAL_PURPOSE_REGS,
 
-	VCPU_EXREG_PDPTR = NR_VCPU_REGS,
+	VCPU_REG_RIP = NR_VCPU_GENERAL_PURPOSE_REGS,
+
+	VCPU_EXREG_PDPTR,
 	VCPU_EXREG_CR0,
 	/*
 	 * Alias AMD's ERAPS (not a real register) to CR3 so that common code
@@ -799,7 +800,8 @@ struct kvm_vcpu_arch {
 	 * rip and regs accesses must go through
 	 * kvm_{register,rip}_{read,write} functions.
 	 */
-	unsigned long regs[NR_VCPU_REGS];
+	unsigned long regs[NR_VCPU_GENERAL_PURPOSE_REGS];
+	unsigned long rip;
 	u32 regs_avail;
 	u32 regs_dirty;
 
diff --git a/arch/x86/kvm/kvm_cache_regs.h b/arch/x86/kvm/kvm_cache_regs.h
index 8ddb01191d6f..9b7df9de0e87 100644
--- a/arch/x86/kvm/kvm_cache_regs.h
+++ b/arch/x86/kvm/kvm_cache_regs.h
@@ -112,7 +112,7 @@ static __always_inline bool kvm_register_test_and_mark_available(struct kvm_vcpu
  */
 static inline unsigned long kvm_register_read_raw(struct kvm_vcpu *vcpu, int reg)
 {
-	if (WARN_ON_ONCE((unsigned int)reg >= NR_VCPU_REGS))
+	if (WARN_ON_ONCE((unsigned int)reg >= NR_VCPU_GENERAL_PURPOSE_REGS))
 		return 0;
 
 	if (!kvm_register_is_available(vcpu, reg))
@@ -124,7 +124,7 @@ static inline unsigned long kvm_register_read_raw(struct kvm_vcpu *vcpu, int reg
 static inline void kvm_register_write_raw(struct kvm_vcpu *vcpu, int reg,
 					  unsigned long val)
 {
-	if (WARN_ON_ONCE((unsigned int)reg >= NR_VCPU_REGS))
+	if (WARN_ON_ONCE((unsigned int)reg >= NR_VCPU_GENERAL_PURPOSE_REGS))
 		return;
 
 	vcpu->arch.regs[reg] = val;
@@ -133,12 +133,16 @@ static inline void kvm_register_write_raw(struct kvm_vcpu *vcpu, int reg,
 
 static inline unsigned long kvm_rip_read(struct kvm_vcpu *vcpu)
 {
-	return kvm_register_read_raw(vcpu, VCPU_REGS_RIP);
+	if (!kvm_register_is_available(vcpu, VCPU_REG_RIP))
+		kvm_x86_call(cache_reg)(vcpu, VCPU_REG_RIP);
+
+	return vcpu->arch.rip;
 }
 
 static inline void kvm_rip_write(struct kvm_vcpu *vcpu, unsigned long val)
 {
-	kvm_register_write_raw(vcpu, VCPU_REGS_RIP, val);
+	vcpu->arch.rip = val;
+	kvm_register_mark_dirty(vcpu, VCPU_REG_RIP);
 }
 
 static inline unsigned long kvm_rsp_read(struct kvm_vcpu *vcpu)
diff --git a/arch/x86/kvm/svm/sev.c b/arch/x86/kvm/svm/sev.c
index b1aa85a6ca5a..0dec619490c3 100644
--- a/arch/x86/kvm/svm/sev.c
+++ b/arch/x86/kvm/svm/sev.c
@@ -913,7 +913,7 @@ static int sev_es_sync_vmsa(struct vcpu_svm *svm)
 	save->r14 = svm->vcpu.arch.regs[VCPU_REGS_R14];
 	save->r15 = svm->vcpu.arch.regs[VCPU_REGS_R15];
 #endif
-	save->rip = svm->vcpu.arch.regs[VCPU_REGS_RIP];
+	save->rip = svm->vcpu.arch.rip;
 
 	/* Sync some non-GPR registers before encrypting */
 	save->xcr0 = svm->vcpu.arch.xcr0;
diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
index 3407deac90bd..4b9d79412da7 100644
--- a/arch/x86/kvm/svm/svm.c
+++ b/arch/x86/kvm/svm/svm.c
@@ -4436,7 +4436,7 @@ static __no_kcsan fastpath_t svm_vcpu_run(struct kvm_vcpu *vcpu, u64 run_flags)
 
 	svm->vmcb->save.rax = vcpu->arch.regs[VCPU_REGS_RAX];
 	svm->vmcb->save.rsp = vcpu->arch.regs[VCPU_REGS_RSP];
-	svm->vmcb->save.rip = vcpu->arch.regs[VCPU_REGS_RIP];
+	svm->vmcb->save.rip = vcpu->arch.rip;
 
 	/*
 	 * Disable singlestep if we're injecting an interrupt/exception.
@@ -4522,7 +4522,7 @@ static __no_kcsan fastpath_t svm_vcpu_run(struct kvm_vcpu *vcpu, u64 run_flags)
 		vcpu->arch.cr2 = svm->vmcb->save.cr2;
 		vcpu->arch.regs[VCPU_REGS_RAX] = svm->vmcb->save.rax;
 		vcpu->arch.regs[VCPU_REGS_RSP] = svm->vmcb->save.rsp;
-		vcpu->arch.regs[VCPU_REGS_RIP] = svm->vmcb->save.rip;
+		vcpu->arch.rip = svm->vmcb->save.rip;
 	}
 	vcpu->arch.regs_dirty = 0;
 
@@ -4954,7 +4954,7 @@ static int svm_enter_smm(struct kvm_vcpu *vcpu, union kvm_smram *smram)
 
 	svm->vmcb->save.rax = vcpu->arch.regs[VCPU_REGS_RAX];
 	svm->vmcb->save.rsp = vcpu->arch.regs[VCPU_REGS_RSP];
-	svm->vmcb->save.rip = vcpu->arch.regs[VCPU_REGS_RIP];
+	svm->vmcb->save.rip = vcpu->arch.rip;
 
 	nested_svm_simple_vmexit(svm, SVM_EXIT_SW);
 
diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index 9302c16571cd..802cc5d8bf43 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -2604,8 +2604,8 @@ void vmx_cache_reg(struct kvm_vcpu *vcpu, enum kvm_reg reg)
 	case VCPU_REGS_RSP:
 		vcpu->arch.regs[VCPU_REGS_RSP] = vmcs_readl(GUEST_RSP);
 		break;
-	case VCPU_REGS_RIP:
-		vcpu->arch.regs[VCPU_REGS_RIP] = vmcs_readl(GUEST_RIP);
+	case VCPU_REG_RIP:
+		vcpu->arch.rip = vmcs_readl(GUEST_RIP);
 		break;
 	case VCPU_EXREG_PDPTR:
 		if (enable_ept)
@@ -7536,8 +7536,8 @@ fastpath_t vmx_vcpu_run(struct kvm_vcpu *vcpu, u64 run_flags)
 
 	if (kvm_register_is_dirty(vcpu, VCPU_REGS_RSP))
 		vmcs_writel(GUEST_RSP, vcpu->arch.regs[VCPU_REGS_RSP]);
-	if (kvm_register_is_dirty(vcpu, VCPU_REGS_RIP))
-		vmcs_writel(GUEST_RIP, vcpu->arch.regs[VCPU_REGS_RIP]);
+	if (kvm_register_is_dirty(vcpu, VCPU_REG_RIP))
+		vmcs_writel(GUEST_RIP, vcpu->arch.rip);
 	vcpu->arch.regs_dirty = 0;
 
 	if (run_flags & KVM_RUN_LOAD_GUEST_DR6)
diff --git a/arch/x86/kvm/vmx/vmx.h b/arch/x86/kvm/vmx/vmx.h
index 70bfe81dea54..31bee8b0e4a1 100644
--- a/arch/x86/kvm/vmx/vmx.h
+++ b/arch/x86/kvm/vmx/vmx.h
@@ -623,7 +623,7 @@ BUILD_CONTROLS_SHADOW(tertiary_exec, TERTIARY_VM_EXEC_CONTROL, 64)
  * cache on demand.  Other registers not listed here are synced to
  * the cache immediately after VM-Exit.
  */
-#define VMX_REGS_LAZY_LOAD_SET	((1 << VCPU_REGS_RIP) |         \
+#define VMX_REGS_LAZY_LOAD_SET	((1 << VCPU_REG_RIP) |         \
 				(1 << VCPU_REGS_RSP) |          \
 				(1 << VCPU_EXREG_RFLAGS) |      \
 				(1 << VCPU_EXREG_PDPTR) |       \
-- 
2.53.0.473.g4a7958ca14-goog

