Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 298673DAABE
	for <linux-coco@lists.linux.dev>; Fri, 14 Aug 2026 16:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786723902; cv=none; b=gFWRpARwsDAMR3wM+uP3DIu7KADSf6zmOaKDEvanUsyRDXw7wDoU0LTFWs110DMqFq3i0O+Dwf4bR8kEIIt/mxIZf8lnb7hBjbrX0rDrgF1LnZ/aXPpwMdVHtG8ZmKo4Y9SN9Ii/Y9hJbVfnPkyqy/a2vZEYnkYnaoMQIbVhqd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786723902; c=relaxed/simple;
	bh=zec9Bn6B1wmg9c8Qo8oD/pbZR6VpiOSIiT/CmRsxMu0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=J73ia3rUTLKdgvb2RGZd2cluID/sJt20nSpd+oG7GYoOmtVyA2NLoe6mj/14dk1R/YULt5Hc3lyWzriY/NMeJZmPx+SuyAeoCkSENWVslOENfewL6DKAzK2+M0CEfGzwLbZlYo/cxu7+2aN/LkKmbjOQyMarsJbRQmcJYM/qmvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=A5oZ/exx; arc=none smtp.client-ip=209.85.210.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="A5oZ/exx"
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8485b7e18b4so1668948b3a.1
        for <linux-coco@lists.linux.dev>; Fri, 14 Aug 2026 09:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786723895; x=1787328695; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=FnW9wsBSO7OxZHDCPddc5vJtLigKE2XL3AEM5oSheVQ=;
        b=A5oZ/exxgoRCHrvEOOa9IF98aZE1toCk0kUuCzLUCpNeg/NpeIHAxN1TOapXVhD7aY
         vwiik8DPuDnBMi5ivIoZYLivHtksa+Vx6mTYZY4EyP8X5xwUihJqAjS2VJsaPpNc0lHS
         1Fghnhe/UmBwFKq0dRfbRDmkDVjQzTO1j8wjMFt5rVbqPSEhXcI8nOjCAKqcJLeE4T9k
         rG2L6rlH7PpYhfukMdCEIrfnjbdlx+BkFklO11luU0IjEMRGbboyGfOfSIW3urqdPpgf
         M0qIBxR7q4DqY4mEk9s5pUWqgoctJpP6ICh3yl2fxqw4NOR+HvfKsdUnSQtRzBIfBYl1
         Iv4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786723895; x=1787328695;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FnW9wsBSO7OxZHDCPddc5vJtLigKE2XL3AEM5oSheVQ=;
        b=VEqcIv7jKnttu7Irss/wD/iiHzsyR0xNQzbM8gdvIjZWlKj1ryl8Ff3kMuuw87yShN
         tC7VZ6F8sdGnM4w6OZyHvH3OUBkV7+fvAPhbNlfJGAHRlgPHv2R1I4OhH9Aq0mkeaRqj
         /ot0Le4/3d1wzti6JcFLnvR9pkAz3Yt2cPI85elh7BEOWtXQ2wUDyTJsxXFvGdSxsXw6
         jmnu6xWp629i1T29Hdzs0OX6xc0K6BBmASqes1M4zeef1yqPAz/hF3Q4jYokMbz45qLb
         YAQ0DScfZoRKm91SOlgUabu7oD6RYmM5pSizNxZ5fhNFrMPMk0F7mypubNpWpoLqa4FV
         9tMA==
X-Forwarded-Encrypted: i=1; AHgh+RqUwiu261SmLaaE4b1CajyapZV3OkOj7PCoxx484rfAc7hbOEWYCsXL9sF6b6dN3Hw7GkeLsUmlqWH2@lists.linux.dev
X-Gm-Message-State: AOJu0YxVgSlozeNYGn/Tb/d70qfiaLPJRLZGjWL2Jrq6x4vehB6FSS9d
	7N1QqmvxHFUyjmKYJAFciK/0lsCYYw+b2Na2y+yQZKoCIVF+Z/lYY8jYS4VLUQ6q8xGLRc7abH4
	uK5kT4g==
X-Received: from pfbgp12.prod.google.com ([2002:a05:6a00:3b8c:b0:84b:4480:8b65])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:4193:b0:848:56ff:6ced
 with SMTP id d2e1a72fcca58-84fde11d751mr8247332b3a.8.1786723894753; Fri, 14
 Aug 2026 09:11:34 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 14 Aug 2026 09:11:29 -0700
In-Reply-To: <20260814161129.2177118-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260814161129.2177118-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.691.gc56d675ccc-goog
Message-ID: <20260814161129.2177118-4-seanjc@google.com>
Subject: [PATCH 3/3] KVM: VMX: Rename posted interrupt prefixes from "vmx" to "vt"
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Kiryl Shutsemau <kas@kernel.org>, Rick Edgecombe <rick.p.edgecombe@intel.com>
Cc: Dave Hansen <dave.hansen@linux.intel.com>, kvm@vger.kernel.org, x86@kernel.org, 
	linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Xiaoyao Li <xiaoyao.li@intel.com>, Binbin Wu <binbin.wu@linux.intel.com>, 
	Kai Huang <kai.huang@intel.com>, Yan Zhao <yan.y.zhao@intel.com>
Content-Type: text/plain; charset="UTF-8"

Rename all common posted interrupt APIs that use a "vmx" prefix to instead
use a "vt" prefix to capture that they are used for both VMX and TDX vCPUs.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/main.c        |  4 ++--
 arch/x86/kvm/vmx/posted_intr.c | 16 ++++++++--------
 arch/x86/kvm/vmx/posted_intr.h |  8 ++++----
 arch/x86/kvm/vmx/tdx.c         |  4 ++--
 arch/x86/kvm/vmx/vmx.c         |  4 ++--
 5 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/arch/x86/kvm/vmx/main.c b/arch/x86/kvm/vmx/main.c
index 95d89d809c19..9a113613a1f9 100644
--- a/arch/x86/kvm/vmx/main.c
+++ b/arch/x86/kvm/vmx/main.c
@@ -1075,8 +1075,8 @@ struct kvm_x86_ops vt_x86_ops __initdata = {
 
 	.update_cpu_dirty_logging = vt_op(update_cpu_dirty_logging),
 
-	.pi_update_irte = vmx_pi_update_irte,
-	.pi_start_bypass = vmx_pi_start_bypass,
+	.pi_update_irte = vt_pi_update_irte,
+	.pi_start_bypass = vt_pi_start_bypass,
 
 #ifdef CONFIG_X86_64
 	.set_hv_timer = vt_op(set_hv_timer),
diff --git a/arch/x86/kvm/vmx/posted_intr.c b/arch/x86/kvm/vmx/posted_intr.c
index 24221ba553be..7a6a44587044 100644
--- a/arch/x86/kvm/vmx/posted_intr.c
+++ b/arch/x86/kvm/vmx/posted_intr.c
@@ -56,7 +56,7 @@ static int pi_try_set_control(struct pi_desc *pi_desc, u64 *pold, u64 new)
 	return 0;
 }
 
-void vmx_vcpu_pi_load(struct kvm_vcpu *vcpu, int cpu)
+void vt_vcpu_pi_load(struct kvm_vcpu *vcpu, int cpu)
 {
 	struct pi_desc *pi_desc = vcpu_to_pi_desc(vcpu);
 	struct vcpu_vt *vt = to_vt(vcpu);
@@ -146,7 +146,7 @@ void vmx_vcpu_pi_load(struct kvm_vcpu *vcpu, int cpu)
 		pi_set_on(pi_desc);
 }
 
-static bool vmx_can_use_vtd_pi(struct kvm *kvm)
+static bool vt_can_use_vtd_pi(struct kvm *kvm)
 {
 	/*
 	 * Note, reading the number of possible bypass IRQs can race with a
@@ -219,10 +219,10 @@ static bool vmx_needs_pi_wakeup(struct kvm_vcpu *vcpu)
 	 * back to the pi_wakeup_handler() function.
 	 */
 	return (vmx_can_use_ipiv(vcpu) && !is_td_vcpu(vcpu)) ||
-		vmx_can_use_vtd_pi(vcpu->kvm);
+		vt_can_use_vtd_pi(vcpu->kvm);
 }
 
-void vmx_vcpu_pi_put(struct kvm_vcpu *vcpu)
+void vt_vcpu_pi_put(struct kvm_vcpu *vcpu)
 {
 	struct pi_desc *pi_desc = vcpu_to_pi_desc(vcpu);
 
@@ -294,17 +294,17 @@ bool pi_has_pending_interrupt(struct kvm_vcpu *vcpu)
 /*
  * Kick all vCPUs when the first possible bypass IRQ is attached to a VM, as
  * blocking vCPUs may scheduled out without reconfiguring PID.NV to the wakeup
- * vector, i.e. if the bypass IRQ came along after vmx_vcpu_pi_put().
+ * vector, i.e. if the bypass IRQ came along after vt_vcpu_pi_put().
  */
-void vmx_pi_start_bypass(struct kvm *kvm)
+void vt_pi_start_bypass(struct kvm *kvm)
 {
-	if (WARN_ON_ONCE(!vmx_can_use_vtd_pi(kvm)))
+	if (WARN_ON_ONCE(!vt_can_use_vtd_pi(kvm)))
 		return;
 
 	kvm_make_all_cpus_request(kvm, KVM_REQ_UNBLOCK);
 }
 
-int vmx_pi_update_irte(struct kvm_kernel_irqfd *irqfd, struct kvm *kvm,
+int vt_pi_update_irte(struct kvm_kernel_irqfd *irqfd, struct kvm *kvm,
 		       unsigned int host_irq, uint32_t guest_irq,
 		       struct kvm_vcpu *vcpu, u32 vector)
 {
diff --git a/arch/x86/kvm/vmx/posted_intr.h b/arch/x86/kvm/vmx/posted_intr.h
index a4af39948cf0..c5860ea828ae 100644
--- a/arch/x86/kvm/vmx/posted_intr.h
+++ b/arch/x86/kvm/vmx/posted_intr.h
@@ -8,16 +8,16 @@
 
 #include <asm/posted_intr.h>
 
-void vmx_vcpu_pi_load(struct kvm_vcpu *vcpu, int cpu);
-void vmx_vcpu_pi_put(struct kvm_vcpu *vcpu);
+void vt_vcpu_pi_load(struct kvm_vcpu *vcpu, int cpu);
+void vt_vcpu_pi_put(struct kvm_vcpu *vcpu);
 void pi_wakeup_handler(void);
 void __init pi_init_cpu(int cpu);
 void pi_apicv_pre_state_restore(struct kvm_vcpu *vcpu);
 bool pi_has_pending_interrupt(struct kvm_vcpu *vcpu);
-int vmx_pi_update_irte(struct kvm_kernel_irqfd *irqfd, struct kvm *kvm,
+int vt_pi_update_irte(struct kvm_kernel_irqfd *irqfd, struct kvm *kvm,
 		       unsigned int host_irq, uint32_t guest_irq,
 		       struct kvm_vcpu *vcpu, u32 vector);
-void vmx_pi_start_bypass(struct kvm *kvm);
+void vt_pi_start_bypass(struct kvm *kvm);
 
 static inline int pi_find_highest_vector(struct pi_desc *pi_desc)
 {
diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
index b272c20586a7..6e7a2acb3f92 100644
--- a/arch/x86/kvm/vmx/tdx.c
+++ b/arch/x86/kvm/vmx/tdx.c
@@ -716,7 +716,7 @@ void tdx_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
 {
 	struct vcpu_tdx *tdx = to_tdx(vcpu);
 
-	vmx_vcpu_pi_load(vcpu, cpu);
+	vt_vcpu_pi_load(vcpu, cpu);
 	if (vcpu->cpu == cpu || !is_hkid_assigned(to_kvm_tdx(vcpu->kvm)))
 		return;
 
@@ -826,7 +826,7 @@ static void tdx_prepare_switch_to_host(struct kvm_vcpu *vcpu)
 
 void tdx_vcpu_put(struct kvm_vcpu *vcpu)
 {
-	vmx_vcpu_pi_put(vcpu);
+	vt_vcpu_pi_put(vcpu);
 	tdx_prepare_switch_to_host(vcpu);
 }
 
diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index aa0098723976..40bae81bc041 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -1577,12 +1577,12 @@ void vmx_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
 
 	vmx_vcpu_load_vmcs(vcpu, cpu);
 
-	vmx_vcpu_pi_load(vcpu, cpu);
+	vt_vcpu_pi_load(vcpu, cpu);
 }
 
 void vmx_vcpu_put(struct kvm_vcpu *vcpu)
 {
-	vmx_vcpu_pi_put(vcpu);
+	vt_vcpu_pi_put(vcpu);
 
 	vmx_prepare_switch_to_host(to_vmx(vcpu));
 }
-- 
2.55.0.691.gc56d675ccc-goog

