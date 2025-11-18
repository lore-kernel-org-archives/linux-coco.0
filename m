Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAFB8311971
	for <linux-coco@lists.linux.dev>; Tue, 18 Nov 2025 22:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763504618; cv=none; b=W3v9arqRVOoo83rPi//g1kzLXiXz/wu6w/wUmLObhEg/zPIvnTkI1d69gdwsajxG858rthTpB5YN29swJ1nc1wckPMe4cqpEmZDmTFs0n4XFIO/UmlsdVJjU7NxbGqLU9mz2dzik2EEi/kEGgYOwp/HkHRUqTebzZ0p+JHCXebY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763504618; c=relaxed/simple;
	bh=ZcXkqhGD9PzgbbKyCx8gdo8aDoDPwaqdJrHsFW+B7ME=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=j7L0jxtaxHrzrMYyKhHBVNx1MENGOsAFMEdEgkERjC7CIf8iCw9xMLaTUcK5PB5yWYlLKYlfWthcHTCmI3FdjxsBvbNTYXtfN26Nqz8L51yFw1Fnx7Xlk+T8Qtzxzux9nx+Avq7CCDhLAgDT1vk80gnU/jNFfwtyJXZ6V1r1NEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CvZ44MlB; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CvZ44MlB"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-2954d676f9dso48230075ad.0
        for <linux-coco@lists.linux.dev>; Tue, 18 Nov 2025 14:23:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763504616; x=1764109416; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=sX0elw2DqT+JqQ8ikKrHK9opKrqwOpcjb2Urt9cPTN8=;
        b=CvZ44MlB8ePxHldMDWu+xP/4YDB/DYfzZrk/4KAV4eB4K1vG6TZTiWBrkpf9qwUhJF
         ZnCFKbQWHxFbMeUc9WpZFJR1Crk/qvxrnPX1AxNipT+pfeuDolaqXk1p1xzpJOnTePzY
         nbu8DOqIPqRBMCyX0r7cPokcFHX0E3YPJ+eno1+ryQE55nQGdnGx7MAyqVAj2jwbwCZQ
         Fx0yQAJoH3oebWyCu2z6tPpMdo+Y53GhQTyjwTJ4nQkS1ThJtio+BQm8FUIX5/l0LQYH
         FByEmbH+LZsE+W/fATI50KDV0ssDDCWhg0uIvr/brHfHlntF2L7Y4YNNeCEvu9MCRSiu
         rHjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763504616; x=1764109416;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sX0elw2DqT+JqQ8ikKrHK9opKrqwOpcjb2Urt9cPTN8=;
        b=SOK1B3dCkT7rHIIQkBvXi9hYD1R3uVotLLQrlS/RLcsGN4G4FunNqeOW67ywaW/Ath
         HBuAMgLSUiE8eI+GWrVTCdCo444pq+YdJWbOQcMKNqTZnBmag11cUVbLbaZcpQqph99F
         WDZ4BGkv1UAmmdXTL6dylsBjr98UXsOMpNvaow7jIgbVXuI2c7kIXVtb8sA2Ecr/EBCx
         nFzx4gElEpIG/RMkXOWKKgKJxY06y6VcemsZ9eOa3CgCz3zGmH7ZZi395NbL4VbQQmJu
         2ycqSoSiWOjw4UYHv6nBWaFRB/bEILkI9r9NVtpNSs9EtSSeuUI+2O1Mwav3didFL+Lm
         /9pw==
X-Forwarded-Encrypted: i=1; AJvYcCU7ZwaC9V7UglA+GXlnznSGeTXQRt0eaV67mrdy1eGD2aksgBAfGwlfnBGersr2OTMnaviIuipTO5Xl@lists.linux.dev
X-Gm-Message-State: AOJu0YxQeoWFn1M5FUmK9UoK1vW+JapkK5Q2mFhryyKfyGhG4ee6d8zW
	hCugpkF6k7hUWKNUZ2+5+doI7t9rug9l6x9rFXO9bwz+9c8GCHHSaqKRgv/I0eceGnz8l0/Cc30
	KotUB6Q==
X-Google-Smtp-Source: AGHT+IHub6aQoEkwDwmYjltvKOLCy+EyIsxZ+4Fg008fmfhq1lkJD2yOYl4kqF1FuX4dDzXK27Kcuy57/mg=
X-Received: from plop7.prod.google.com ([2002:a17:902:8a87:b0:273:67d3:6303])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:1211:b0:297:d6c1:26e
 with SMTP id d9443c01a7336-2986a6b7bd1mr211711575ad.6.1763504616132; Tue, 18
 Nov 2025 14:23:36 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Tue, 18 Nov 2025 14:23:27 -0800
In-Reply-To: <20251118222328.2265758-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20251118222328.2265758-1-seanjc@google.com>
X-Mailer: git-send-email 2.52.0.rc1.455.g30608eb744-goog
Message-ID: <20251118222328.2265758-4-seanjc@google.com>
Subject: [PATCH v2 3/4] KVM: x86: Load guest/host XCR0 and XSS outside of the
 fastpath run loop
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	"Kirill A. Shutemov" <kas@kernel.org>
Cc: kvm@vger.kernel.org, x86@kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	Jon Kohler <jon@nutanix.com>, Tony Lindgren <tony.lindgren@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"

Move KVM's swapping of XFEATURE masks, i.e. XCR0 and XSS, out of the
fastpath loop now that the guts of the #MC handler runs in task context,
i.e. won't invoke schedule() with preemption disabled and clobber state
(or crash the kernel) due to trying to context switch XSTATE with a mix
of host and guest state.

For all intents and purposes, this reverts commit 1811d979c716 ("x86/kvm:
move kvm_load/put_guest_xcr0 into atomic context"), which papered over an
egregious bug/flaw in the #MC handler where it would do schedule() even
though IRQs are disabled.  E.g. the call stack from the commit:

  kvm_load_guest_xcr0
  ...
  kvm_x86_ops->run(vcpu)
    vmx_vcpu_run
      vmx_complete_atomic_exit
        kvm_machine_check
          do_machine_check
            do_memory_failure
              memory_failure
                lock_page

Commit 1811d979c716 "fixed" the immediate issue of XRSTORS exploding, but
completely ignored that scheduling out a vCPU task while IRQs and
preemption is wildly broken.  Thankfully, commit 5567d11c21a1 ("x86/mce:
Send #MC singal from task work") (somewhat incidentally?) fixed that flaw
by pushing the meat of the work to the user-return path, i.e. to task
context.

KVM has also hardened itself against #MC goofs by moving #MC forwarding to
kvm_x86_ops.handle_exit_irqoff(), i.e. out of the fastpath.  While that's
by no means a robust fix, restoring as much state as possible before
handling the #MC will hopefully provide some measure of protection in the
event that #MC handling goes off the rails again.

Note, KVM always intercepts XCR0 writes for vCPUs without protected state,
e.g. there's no risk of consuming a stale XCR0 when determining if a PKRU
update is needed; kvm_load_host_xfeatures() only reads, and never writes,
vcpu->arch.xcr0.

Deferring the XCR0 and XSS loads shaves ~300 cycles off the fastpath for
Intel, and ~500 cycles for AMD.  E.g. using INVD in KVM-Unit-Test's
vmexit.c, which an extra hack to enable CR4.OXSAVE, latency numbers for
AMD Turin go from ~2000 => 1500, and for Intel Emerald Rapids, go from
~1300 => ~1000.

Cc: Jon Kohler <jon@nutanix.com>
Reviewed-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
Reviewed-by: Jon Kohler <jon@nutanix.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/x86.c | 39 ++++++++++++++++++++++++++-------------
 1 file changed, 26 insertions(+), 13 deletions(-)

diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index f98c5afa3e41..d8d547c5e014 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -1216,13 +1216,12 @@ void kvm_lmsw(struct kvm_vcpu *vcpu, unsigned long msw)
 }
 EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_lmsw);
 
-void kvm_load_guest_xsave_state(struct kvm_vcpu *vcpu)
+static void kvm_load_guest_xfeatures(struct kvm_vcpu *vcpu)
 {
 	if (vcpu->arch.guest_state_protected)
 		return;
 
 	if (kvm_is_cr4_bit_set(vcpu, X86_CR4_OSXSAVE)) {
-
 		if (vcpu->arch.xcr0 != kvm_host.xcr0)
 			xsetbv(XCR_XFEATURE_ENABLED_MASK, vcpu->arch.xcr0);
 
@@ -1230,6 +1229,27 @@ void kvm_load_guest_xsave_state(struct kvm_vcpu *vcpu)
 		    vcpu->arch.ia32_xss != kvm_host.xss)
 			wrmsrq(MSR_IA32_XSS, vcpu->arch.ia32_xss);
 	}
+}
+
+static void kvm_load_host_xfeatures(struct kvm_vcpu *vcpu)
+{
+	if (vcpu->arch.guest_state_protected)
+		return;
+
+	if (kvm_is_cr4_bit_set(vcpu, X86_CR4_OSXSAVE)) {
+		if (vcpu->arch.xcr0 != kvm_host.xcr0)
+			xsetbv(XCR_XFEATURE_ENABLED_MASK, kvm_host.xcr0);
+
+		if (guest_cpu_cap_has(vcpu, X86_FEATURE_XSAVES) &&
+		    vcpu->arch.ia32_xss != kvm_host.xss)
+			wrmsrq(MSR_IA32_XSS, kvm_host.xss);
+	}
+}
+
+void kvm_load_guest_xsave_state(struct kvm_vcpu *vcpu)
+{
+	if (vcpu->arch.guest_state_protected)
+		return;
 
 	if (cpu_feature_enabled(X86_FEATURE_PKU) &&
 	    vcpu->arch.pkru != vcpu->arch.host_pkru &&
@@ -1251,17 +1271,6 @@ void kvm_load_host_xsave_state(struct kvm_vcpu *vcpu)
 		if (vcpu->arch.pkru != vcpu->arch.host_pkru)
 			wrpkru(vcpu->arch.host_pkru);
 	}
-
-	if (kvm_is_cr4_bit_set(vcpu, X86_CR4_OSXSAVE)) {
-
-		if (vcpu->arch.xcr0 != kvm_host.xcr0)
-			xsetbv(XCR_XFEATURE_ENABLED_MASK, kvm_host.xcr0);
-
-		if (guest_cpu_cap_has(vcpu, X86_FEATURE_XSAVES) &&
-		    vcpu->arch.ia32_xss != kvm_host.xss)
-			wrmsrq(MSR_IA32_XSS, kvm_host.xss);
-	}
-
 }
 EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_load_host_xsave_state);
 
@@ -11311,6 +11320,8 @@ static int vcpu_enter_guest(struct kvm_vcpu *vcpu)
 	if (vcpu->arch.guest_fpu.xfd_err)
 		wrmsrq(MSR_IA32_XFD_ERR, vcpu->arch.guest_fpu.xfd_err);
 
+	kvm_load_guest_xfeatures(vcpu);
+
 	if (unlikely(vcpu->arch.switch_db_regs &&
 		     !(vcpu->arch.switch_db_regs & KVM_DEBUGREG_AUTO_SWITCH))) {
 		set_debugreg(DR7_FIXED_1, 7);
@@ -11397,6 +11408,8 @@ static int vcpu_enter_guest(struct kvm_vcpu *vcpu)
 	vcpu->mode = OUTSIDE_GUEST_MODE;
 	smp_wmb();
 
+	kvm_load_host_xfeatures(vcpu);
+
 	/*
 	 * Sync xfd before calling handle_exit_irqoff() which may
 	 * rely on the fact that guest_fpu::xfd is up-to-date (e.g.
-- 
2.52.0.rc1.455.g30608eb744-goog

