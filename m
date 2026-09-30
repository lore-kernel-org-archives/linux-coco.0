Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A5D618C933
	for <linux-coco@lists.linux.dev>; Wed, 30 Sep 2026 00:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790727093; cv=none; b=ItPdiGa3Cnjx4j4cYkc+7pKdMU+fslzN61+FETUr9DH6ni+klQGMxc5acODofws0eMnrN3+8++oG22KqbKDGTSd5Kl5SpfU4MPmxP7IHAAeatDVS+I4kBymsRe6yLqBOmc0ibwTBBMIYsKWyDVtkJJIEkejqgqzb0YQQD9qc5UM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790727093; c=relaxed/simple;
	bh=sZFXk0BIchYjOjDaEK0ZoynBeIbw22eT1lGZHMbQVgI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=GRHWutg4P17KVuxco77T1ZuqbENYyviD/Gk2rzA0QI7TYl6LUz9NuVGphDmXstPcNYzGTN5qXFYdFmFyM41ni+Pv3CTOxKZJyrY/ElTQPB2QaGq8IyRLpCQ0/j/pwJm3EuQZoWKq5gB6VMa1ycwDgI/yn8v8I9u9LsX+yLVMbwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tKfMlmui; arc=none smtp.client-ip=209.85.214.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tKfMlmui"
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2d7443e0f0bso63522615ad.1
        for <linux-coco@lists.linux.dev>; Tue, 29 Sep 2026 17:11:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790727091; x=1791331891; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=edNeZC9TNiU8IY0mX2z6Pr9YDXA5iNLVK2rM3T8F938=;
        b=tKfMlmuio8yRW7KVjLdWNnb6KReskY9UiDU9P3vrM1im52QobJJy9lnjuzrUboTCeQ
         MSxjFCDmV6Mna2vBnI/mtU5HDUT4QsOQItj9tVjEIrpnoCQTmPaLYwAyfP+AOw5hhgle
         b9HIGKV3tfPdjRk714HbrsKW1Y3StnqNkseOAIO8nAeGcf7EhKMC33JqTzz4044HftRr
         D/gF5amL6lRJJCpSVk/Pmjna5N9bwBIhov4jwojFVB57yeZMxMDpOb2VuoaQP+PaH66N
         OgIZri62zfPrqD02TiLKR/S1jvsOMLYkjaXcCekvq7vIrIkAvvuGU8C8KmIwAL0frUyW
         rDLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790727091; x=1791331891;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=edNeZC9TNiU8IY0mX2z6Pr9YDXA5iNLVK2rM3T8F938=;
        b=jYYiqeVPy63xrIiPWbXUsLQdzF39P6GVUNck4cCybmQ6ASIM+5tdRA++rBgVP8cenr
         y7aeaN12dD5ulo+o7t8/C/pNPJ8MXyzbwWG3pCQcLhWu7xhMVB3YkV92OIueBdyU1ZU0
         R2hFyH9XtEr+gkkj4vbj61SLDJcx7KDJIwBrb8N2gsXGhIhhQJU0TC8afO+gmkO9orHr
         PAW41latUW+16DyACbOI0TMEMl/ToiPP06g1TQQwZpXSoSudFDKtzEbpYdGwcIvJCYdi
         IOGzySUuaoF3uxHbPS8i2KTymiGhYOG6fyWrlnPjfIWh59abThjJIl26/bmeZLYujA6t
         7xLg==
X-Forwarded-Encrypted: i=1; AKwUvBxoSxtSo1zNqUGQPHkV2fWiZxLQP8LDkRVP9sq03sgVfXDF3YWbAleWYPc6MvdFxY4wK1Xoupy7LPii@lists.linux.dev
X-Gm-Message-State: AFq9FYIO2gaC6RKrVskT0+fcWvF7aM22wZCG1znzYIyjHNzP++8LmWwi
	Zjq58CR3Ks4I0OtD7R0SG3RyBzveA9RMDzDLo/v2xf8T+lQY6ZbctJBnoq4MvR6DK8URQSr5jjx
	xxRTlMw==
X-Received: from plme16.prod.google.com ([2002:a17:903:4910:b0:2e2:b29f:52a7])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:d98e:b0:2dd:ad73:c936
 with SMTP id d9443c01a7336-2e2de536e36mr5887855ad.23.1790727090389; Tue, 29
 Sep 2026 17:11:30 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Tue, 29 Sep 2026 17:11:25 -0700
In-Reply-To: <20260930001127.3170009-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260930001127.3170009-1-seanjc@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260930001127.3170009-2-seanjc@google.com>
Subject: [PATCH v2 1/3] KVM: x86: Add a helper to prepare vcpu->run for a
 SHUTDOWN exit to userspace
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Kiryl Shutsemau <kas@kernel.org>, Rick Edgecombe <rick.p.edgecombe@intel.com>
Cc: Dave Hansen <dave.hansen@linux.intel.com>, kvm@vger.kernel.org, x86@kernel.org, 
	linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, 
	James Houghton <jthoughton@google.com>, Xiaoyao Li <xiaoyao.li@intel.com>, 
	Yan Zhao <yan.y.zhao@intel.com>, Binbin Wu <binbin.wu@linux.intel.com>, 
	Ackerley Tng <ackerleytng@google.com>, Vishal Annapurve <vannapurve@google.com>, 
	Sashiko Bot <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Add kvm_prepare_shutdown_exit() to dedup the paths that exit to userspace
with KVM_EXIT_SHUTDOWN, all of which happen to be x86 (presumably other
architectures use KVM_EXIT_SYSTEM_EVENT?).

Note, this adds a clearing of mmio_needed for SVM's shutdown_interception().
Not clearing mmio_needed in that case is all but guaranteed to be benign;
KVM should never enter the guest with outstanding emulated MMIO operations
(the equivalent VMX and TDX paths likely copy+pasted the code from
KVM_REQ_TRIPLE_FAULT, which does need to clear mmio_needed as KVM can
synthesize a triple fault shutdown in the middle of instruction emulation).

Cc: stable@vger.kernel.org
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/svm/svm.c   | 3 +--
 arch/x86/kvm/vmx/tdx.c   | 3 +--
 arch/x86/kvm/vmx/vmx.c   | 3 +--
 arch/x86/kvm/x86.c       | 3 +--
 include/linux/kvm_host.h | 8 ++++++++
 5 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
index 0eb1623052c1..d2feb57d774f 100644
--- a/arch/x86/kvm/svm/svm.c
+++ b/arch/x86/kvm/svm/svm.c
@@ -2190,7 +2190,6 @@ static int mc_interception(struct kvm_vcpu *vcpu)
 
 static int shutdown_interception(struct kvm_vcpu *vcpu)
 {
-	struct kvm_run *kvm_run = vcpu->run;
 	struct vcpu_svm *svm = to_svm(vcpu);
 
 
@@ -2214,7 +2213,7 @@ static int shutdown_interception(struct kvm_vcpu *vcpu)
 		kvm_vcpu_reset(vcpu, true);
 	}
 
-	kvm_run->exit_reason = KVM_EXIT_SHUTDOWN;
+	kvm_prepare_shutdown_exit(vcpu);
 	return 0;
 }
 
diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
index ee1d412b0ee6..29d4751f37fb 100644
--- a/arch/x86/kvm/vmx/tdx.c
+++ b/arch/x86/kvm/vmx/tdx.c
@@ -2092,8 +2092,7 @@ int tdx_handle_exit(struct kvm_vcpu *vcpu, fastpath_t fastpath)
 
 	switch (exit_reason.basic) {
 	case EXIT_REASON_TRIPLE_FAULT:
-		vcpu->run->exit_reason = KVM_EXIT_SHUTDOWN;
-		vcpu->mmio_needed = 0;
+		kvm_prepare_shutdown_exit(vcpu);
 		return 0;
 	case EXIT_REASON_EXCEPTION_NMI:
 		return tdx_handle_exception_nmi(vcpu);
diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index dc635145eeaf..35db7197c586 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -5588,8 +5588,7 @@ static __always_inline int handle_external_interrupt(struct kvm_vcpu *vcpu)
 
 static int handle_triple_fault(struct kvm_vcpu *vcpu)
 {
-	vcpu->run->exit_reason = KVM_EXIT_SHUTDOWN;
-	vcpu->mmio_needed = 0;
+	kvm_prepare_shutdown_exit(vcpu);
 	return 0;
 }
 
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index cf3fcdfd8ad2..cffd1b6ef789 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -8139,8 +8139,7 @@ static int vcpu_enter_guest(struct kvm_vcpu *vcpu)
 				kvm_nested_call(triple_fault)(vcpu);
 
 			if (kvm_check_request(KVM_REQ_TRIPLE_FAULT, vcpu)) {
-				vcpu->run->exit_reason = KVM_EXIT_SHUTDOWN;
-				vcpu->mmio_needed = 0;
+				kvm_prepare_shutdown_exit(vcpu);
 				r = 0;
 				goto out;
 			}
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index a836756baebb..02ca5d5d83b5 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -2522,6 +2522,14 @@ static inline void kvm_account_pgtable_pages(void *virt, int nr)
 /* Max number of entries allowed for each kvm dirty ring */
 #define  KVM_DIRTY_RING_MAX_ENTRIES  65536
 
+static inline void kvm_prepare_shutdown_exit(struct kvm_vcpu *vcpu)
+{
+	vcpu->run->exit_reason = KVM_EXIT_SHUTDOWN;
+#ifdef CONFIG_HAS_IOMEM
+	vcpu->mmio_needed = 0;
+#endif
+}
+
 static inline void kvm_prepare_memory_fault_exit(struct kvm_vcpu *vcpu,
 						 gpa_t gpa, gpa_t size,
 						 bool is_write, bool is_exec,
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

