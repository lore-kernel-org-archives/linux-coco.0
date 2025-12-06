Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 757C522A7E4
	for <linux-coco@lists.linux.dev>; Sat,  6 Dec 2025 01:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764983471; cv=none; b=dbIUkkxBT82brT5j2ITYt7DKcXQA/3rZYmts+9FCbLtKefhHH8MPiIv4/zGQ6ZamAvCw+4EKJ1YUvVEDMOkrtOW3ULRh+NCQx/c/bZrF9tRMTFtyzINMVDBvtMvcHi85KQIOee90kaasu0Y/3f57BIyDxC176srJQxKhk/q5wG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764983471; c=relaxed/simple;
	bh=Xoj3VzQYzVhpJbx4kNzoLA3tCFxy7VEFT4XaIsLRops=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=EaHE9CPHq3EgH+E5azunwFbrGutZj9Rn0RGZx85gq6izfUe9cI3cQjZSWOyaCGthJsSMkEmybZRkGR2k0FJEO7QSwuN3eHdBtiwBOl4TayS3RH+EDUmejyoxETyBN5nxBCw/igG5/fnGrFkC/BoxhBbyOOziCt0Ma8MKraxajvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bMQhYVB2; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bMQhYVB2"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-295915934bfso37435325ad.0
        for <linux-coco@lists.linux.dev>; Fri, 05 Dec 2025 17:11:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764983469; x=1765588269; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=pC6DfslZcu3nvvZIIA0BpqpSQzylE5RCvOKLxGkj7nQ=;
        b=bMQhYVB2iFsr3URnSzzths1yfYHpJN7iTtfaxvghcZsxct0PB3cbxIp4ecokC1Kvlr
         Ne0NayghXTMJ9todzI0XvNzGaQaqHTOo2q8zbYZu9veT0mHplxd23OeagPlKpdALpLKb
         2rS07+/52V4UgpcmKOJ5tQIkvKYn1NnJTdFdzxMgelsDBttseX1wLGOINfB9/z7lSha7
         02YWOGIUCD74EulPnBn6ReumISbav7T/YBYfYCbO9D8ZPl8TxJR/MurlXDiX8bdgAtZ9
         qU5PwUVAHqXNf710v/TEWCkZhi4oMv7Hdk2zgCA5bn40Isu7ZZ+RK6C2eD3ZqMZ2vwxg
         Hnng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764983469; x=1765588269;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pC6DfslZcu3nvvZIIA0BpqpSQzylE5RCvOKLxGkj7nQ=;
        b=oo+ibqYDhoK5pQAPv78qIhKWJyR5+iqchfsNbIv6KBpeeK+Dt85IlcxsiwVq70OFi1
         2dhcDwevl83szsMgK23xrVMTuAD+AWoVnhUTAZX5g8o0I/u/yxmO5n+mpfYXC9ltaFbc
         A7+vsQEVzSd7HJPsyv6fEncJE32NvgDilBliHpLeBg69UDn+7y7ZzuVx35wGlbeb62wU
         YpYUDqNjZ/844MSNNmxoCM99B+s5q32QTXHEzSbVSqTvVDY/aGk6zptfY0tHKPpC+TBO
         trronwZbW2mepyTCme5VNLnOEL1Wt/TT6Ve7lAS96/uafruNVMzLNjieNaQoGjtjABXh
         hgzQ==
X-Forwarded-Encrypted: i=1; AJvYcCUda+mgW9qNrOjVCDpPH2IMEoCAAR5rkGArt4hMvS7qvnb6nYKwn4HaxcwVBN3pFnKLlg/39hbO/JAo@lists.linux.dev
X-Gm-Message-State: AOJu0Yy4fCHiCBHtNR4CD5S0Ow0hooJw4sXrO6vHH4q7WoKJ+IxnkYE/
	k8hzI/4Q19VGKU4ppxpI6VVtzmMqVHBxjPrzWx3fS3O7h4XTkodxg1+kZFWLJgDCqc8sIkWETSX
	kVOKflQ==
X-Google-Smtp-Source: AGHT+IHqg7v/oM3O+Iza+gbHQ+Fut3uvvdzLynuyyGHbiI9eTt5zTPTdsfs0StG85k5cWuU3XEHxZlf+cm8=
X-Received: from pldo13.prod.google.com ([2002:a17:903:8d:b0:27e:ed03:b5a5])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:e805:b0:295:ac6f:c899
 with SMTP id d9443c01a7336-29df5dd24f3mr8573855ad.47.1764983468487; Fri, 05
 Dec 2025 17:11:08 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri,  5 Dec 2025 17:10:48 -0800
In-Reply-To: <20251206011054.494190-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20251206011054.494190-1-seanjc@google.com>
X-Mailer: git-send-email 2.52.0.223.gf5cc29aaa4-goog
Message-ID: <20251206011054.494190-2-seanjc@google.com>
Subject: [PATCH v2 1/7] KVM: x86: Move kvm_rebooting to x86
From: Sean Christopherson <seanjc@google.com>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Kiryl Shutsemau <kas@kernel.org>, Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev, 
	kvm@vger.kernel.org, Chao Gao <chao.gao@intel.com>, 
	Dan Williams <dan.j.williams@intel.com>
Content-Type: text/plain; charset="UTF-8"

Move kvm_rebooting, which is only read by x86, to KVM x86 so that it can
be moved again to core x86 code.  Add a "shutdown" arch hook to facilate
setting the flag in KVM x86.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/x86.c       | 13 +++++++++++++
 arch/x86/kvm/x86.h       |  1 +
 include/linux/kvm_host.h |  2 +-
 virt/kvm/kvm_main.c      | 14 +++++++-------
 4 files changed, 22 insertions(+), 8 deletions(-)

diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 0c6d899d53dd..80cb882f19e2 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -694,6 +694,9 @@ static void drop_user_return_notifiers(void)
 		kvm_on_user_return(&msrs->urn);
 }
 
+__visible bool kvm_rebooting;
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_rebooting);
+
 /*
  * Handle a fault on a hardware virtualization (VMX or SVM) instruction.
  *
@@ -13100,6 +13103,16 @@ int kvm_arch_enable_virtualization_cpu(void)
 	return 0;
 }
 
+void kvm_arch_shutdown(void)
+{
+	/*
+	 * Set kvm_rebooting to indicate that KVM has asynchronously disabled
+	 * hardware virtualization, i.e. that relevant errors and exceptions
+	 * aren't entirely unexpected.
+	 */
+	kvm_rebooting = true;
+}
+
 void kvm_arch_disable_virtualization_cpu(void)
 {
 	kvm_x86_call(disable_virtualization_cpu)();
diff --git a/arch/x86/kvm/x86.h b/arch/x86/kvm/x86.h
index fdab0ad49098..40993348a967 100644
--- a/arch/x86/kvm/x86.h
+++ b/arch/x86/kvm/x86.h
@@ -54,6 +54,7 @@ struct kvm_host_values {
 	u64 arch_capabilities;
 };
 
+extern bool kvm_rebooting;
 void kvm_spurious_fault(void);
 
 #define SIZE_OF_MEMSLOTS_HASHTABLE \
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index d93f75b05ae2..a453fe6ce05a 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -1621,6 +1621,7 @@ static inline void kvm_create_vcpu_debugfs(struct kvm_vcpu *vcpu) {}
 #endif
 
 #ifdef CONFIG_KVM_GENERIC_HARDWARE_ENABLING
+void kvm_arch_shutdown(void);
 /*
  * kvm_arch_{enable,disable}_virtualization() are called on one CPU, under
  * kvm_usage_lock, immediately after/before 0=>1 and 1=>0 transitions of
@@ -2302,7 +2303,6 @@ static inline bool kvm_check_request(int req, struct kvm_vcpu *vcpu)
 
 #ifdef CONFIG_KVM_GENERIC_HARDWARE_ENABLING
 extern bool enable_virt_at_load;
-extern bool kvm_rebooting;
 #endif
 
 extern unsigned int halt_poll_ns;
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index f1f6a71b2b5f..3278ee9381bd 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -5586,13 +5586,15 @@ bool enable_virt_at_load = true;
 module_param(enable_virt_at_load, bool, 0444);
 EXPORT_SYMBOL_FOR_KVM_INTERNAL(enable_virt_at_load);
 
-__visible bool kvm_rebooting;
-EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_rebooting);
-
 static DEFINE_PER_CPU(bool, virtualization_enabled);
 static DEFINE_MUTEX(kvm_usage_lock);
 static int kvm_usage_count;
 
+__weak void kvm_arch_shutdown(void)
+{
+
+}
+
 __weak void kvm_arch_enable_virtualization(void)
 {
 
@@ -5646,10 +5648,9 @@ static int kvm_offline_cpu(unsigned int cpu)
 
 static void kvm_shutdown(void)
 {
+	kvm_arch_shutdown();
+
 	/*
-	 * Disable hardware virtualization and set kvm_rebooting to indicate
-	 * that KVM has asynchronously disabled hardware virtualization, i.e.
-	 * that relevant errors and exceptions aren't entirely unexpected.
 	 * Some flavors of hardware virtualization need to be disabled before
 	 * transferring control to firmware (to perform shutdown/reboot), e.g.
 	 * on x86, virtualization can block INIT interrupts, which are used by
@@ -5658,7 +5659,6 @@ static void kvm_shutdown(void)
 	 * 100% comprehensive.
 	 */
 	pr_info("kvm: exiting hardware virtualization\n");
-	kvm_rebooting = true;
 	on_each_cpu(kvm_disable_virtualization_cpu, NULL, 1);
 }
 
-- 
2.52.0.223.gf5cc29aaa4-goog

