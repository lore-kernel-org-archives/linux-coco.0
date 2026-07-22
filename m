Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D402447124C
	for <linux-coco@lists.linux.dev>; Wed, 22 Jul 2026 23:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784762077; cv=none; b=C45BI+6lj3FmrNGaiUjMmSnGWdYoL/r9QQY+yXfXXR+2ndAVOTxCcV2ZdE2LJJLi/4NnrTU5TtViJ76vCcdj9PyC+ygrpprAi2311CFJAa3h6MZq8PeyFNXKVVp1UHR5UvF5n5amNf2UX7481zjzSOGh5fCLEvr37+VzBrWYP2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784762077; c=relaxed/simple;
	bh=jpR9xtsvpa/RjBQ8wnCwKk/x2/b0KiCTZGNnNI5CsfE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ipQJLEQ59IIDCqae1bg2LZlVpFOEf2AVP+lyeiIoTAApe0FOIUK327MfIs+f/08O/VkfoQP+KivPOnpomjsRCRK1K48bTpZQvrtoGyEtH96/o32ZnHvnBs8SiVoeUZIQ/Z7dLSFnCryiRsYgv2UrWqKg+y3vEoSC4Lg/cBwHjCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--wyihan.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aFQ2Ie6z; arc=none smtp.client-ip=209.85.214.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wyihan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aFQ2Ie6z"
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ccafc5e82cso541245ad.3
        for <linux-coco@lists.linux.dev>; Wed, 22 Jul 2026 16:14:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784762075; x=1785366875; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h/BhsDx/NrVOxcO3ExGYsFuYgkeOvxYZ93mj2rERXwA=;
        b=aFQ2Ie6zWT6lASXAlIHdXB2jZjvVzdZPc1KLFava9lgsWNi20GP2I2EXdrbLvhOdVz
         g6C+MsKxUURodgtIeAtIeNocA9yBTb52Kzkrev2H6/aCacN9pKtbcRIa8Jr/M+GfLO3B
         0mAX7pFYQv5Fg31zxNZMk1hAhpC9HK7s/cbULkQMdCpzfIeY7f9F6/+mwnXWss5OMeTh
         sCSop1+m7I/0hsH9W0RJD+wu2DqKdmuW69CEdRmowpXoVb6oVhG7lJqeDsLBLHWlBIEb
         X1V7eAsgVIOIo7+5NB+peqO63wK7mLD3GJoFY9b7/lN2ZOjF597UUD3zlyktfYakR0us
         hwuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784762075; x=1785366875;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h/BhsDx/NrVOxcO3ExGYsFuYgkeOvxYZ93mj2rERXwA=;
        b=Vj0Alqh78MCIHLWTi3mFuq9hwjCYazVa3WXEQZas831Kve3HLpvoNyZLXVCKw0eI+p
         hOZITqhIt+PN9d9hdsOygJTw7sKzoW3lqxKpzcX+SZkc6uIoykIZmLQAr5RRYkECET/c
         vQ1cnA8RSAu3V5SF6WxsSvI77v85EGFo0S/owFPIaPgiCkLcmWp4iYQNHo4oT4uGyPmA
         sxdjhLAs50HwOKgZvcyjnpF5K2QKoWVckiT2889M375f8Dke6UAUFn74n2iLP2BiqWda
         zJmkk37/3ZbGt70kImNheB1bXYA5lKGQ2x3VRzC5E9iREw8C9tlLYWQtTARPuqaurb/8
         1yww==
X-Forwarded-Encrypted: i=1; AHgh+RpE6v1oDsKFAbOjIT0bqI7t1kjAQEooVVDdBLnFjmocnq5Syaky0AsGwycBsbG3fIJpYTM+g0nQpbKi@lists.linux.dev
X-Gm-Message-State: AOJu0Yx0+eyx2LQHnchWYqcWwQGhkgp/h9dpOcyzp2HnnNBYPlDM2nfY
	z912sBreEW8fyl3eWouVHMxWpqY1FClMbpQ3NpwoFIgZ6b7SPBpkf2ShZwRAFE604TzErnwg1M0
	TC4noIA==
X-Received: from plcl21.prod.google.com ([2002:a17:902:e2d5:b0:2ca:5d68:247c])
 (user=wyihan job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:e544:b0:2cf:8131:75f3
 with SMTP id d9443c01a7336-2cfa6a558e5mr9703405ad.7.1784762074619; Wed, 22
 Jul 2026 16:14:34 -0700 (PDT)
Date: Wed, 22 Jul 2026 23:13:22 +0000
In-Reply-To: <20260722-tdx-selftests-v14-0-15ad654a50db@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260722-tdx-selftests-v14-0-15ad654a50db@google.com>
X-Developer-Key: i=wyihan@google.com; a=ed25519; pk=cRi0fKzS5BMxlHyHY2pJv3w/1zcgfYKr6EYGYppdMYc=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784762054; l=3002;
 i=wyihan@google.com; s=20260319; h=from:subject:message-id;
 bh=/f3t5qAAcjcel6oyHhPMCidPw1Nejh4ZBp7/fc5KqHM=; b=NQPWIjycJ+6xb4w0LTnFIA7Ko3LQ1ujfT5ISJno2PAeSTeWTXp/i4m3eMhUFBPNaSX7sc4prV
 AvAdTcIn6trCzFRLDIDTpJu/5gKDNMpvrzmGRQqT0HaRbKzLREq3ekg
X-Mailer: b4 0.14.3
Message-ID: <20260722-tdx-selftests-v14-17-15ad654a50db@google.com>
Subject: [PATCH v14 17/22] KVM: selftests: Set entry point for TDX guest code
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
	Sean Christopherson <seanjc@google.com>, Shuah Khan <shuah@kernel.org>, Xiaoyao Li <xiaoyao.li@intel.com>, 
	Oliver Upton <oupton@kernel.org>
Cc: Jeremiah McReynolds <jmcrey@google.com>, kvm@vger.kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, x86@kernel.org, Lisa Wang <wyihan@google.com>
Content-Type: text/plain; charset="utf-8"

From: Sagi Shahar <sagis@google.com>

Since the rip register is inaccessible for TDX VMs, we need a different
way to set the guest entry point for TDX VMs. This is done by writing
the guest code address to a predefined location in the guest memory and
loading it into rip as part of the TDX boot code.

Signed-off-by: Sagi Shahar <sagis@google.com>
Signed-off-by: Lisa Wang <wyihan@google.com>
---
 tools/testing/selftests/kvm/include/x86/tdx/tdx_util.h |  1 +
 tools/testing/selftests/kvm/lib/x86/processor.c        | 10 +++++++---
 tools/testing/selftests/kvm/lib/x86/tdx/tdx_util.c     | 10 ++++++++++
 3 files changed, 18 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/kvm/include/x86/tdx/tdx_util.h b/tools/testing/selftests/kvm/include/x86/tdx/tdx_util.h
index 93ce6e1ad2c8..307e2c0bc9c9 100644
--- a/tools/testing/selftests/kvm/include/x86/tdx/tdx_util.h
+++ b/tools/testing/selftests/kvm/include/x86/tdx/tdx_util.h
@@ -70,5 +70,6 @@ void tdx_vm_setup_boot_code_region(struct kvm_vm *vm);
 void tdx_vm_setup_boot_parameters_region(struct kvm_vm *vm, u32 nr_runnable_vcpus);
 void tdx_vm_load_common_boot_parameters(struct kvm_vm *vm);
 void tdx_vcpu_load_boot_parameters(struct kvm_vm *vm, struct kvm_vcpu *vcpu);
+void tdx_vcpu_set_entry_point(struct kvm_vcpu *vcpu, void *guest_code);
 
 #endif /* SELFTESTS_TDX_TDX_UTIL_H */
diff --git a/tools/testing/selftests/kvm/lib/x86/processor.c b/tools/testing/selftests/kvm/lib/x86/processor.c
index 5e415c6577b8..4b97a9a1bb5e 100644
--- a/tools/testing/selftests/kvm/lib/x86/processor.c
+++ b/tools/testing/selftests/kvm/lib/x86/processor.c
@@ -808,9 +808,13 @@ void vcpu_arch_set_entry_point(struct kvm_vcpu *vcpu, void *guest_code)
 {
 	struct kvm_regs regs;
 
-	vcpu_regs_get(vcpu, &regs);
-	regs.rip = (unsigned long) guest_code;
-	vcpu_regs_set(vcpu, &regs);
+	if (is_tdx_vm(vcpu->vm)) {
+		tdx_vcpu_set_entry_point(vcpu, guest_code);
+	} else {
+		vcpu_regs_get(vcpu, &regs);
+		regs.rip = (unsigned long)guest_code;
+		vcpu_regs_set(vcpu, &regs);
+	}
 }
 
 gva_t kvm_allocate_vcpu_stack(struct kvm_vm *vm)
diff --git a/tools/testing/selftests/kvm/lib/x86/tdx/tdx_util.c b/tools/testing/selftests/kvm/lib/x86/tdx/tdx_util.c
index 3c3ac6c7ce40..be63d8652a02 100644
--- a/tools/testing/selftests/kvm/lib/x86/tdx/tdx_util.c
+++ b/tools/testing/selftests/kvm/lib/x86/tdx/tdx_util.c
@@ -114,6 +114,16 @@ void tdx_vcpu_load_boot_parameters(struct kvm_vm *vm, struct kvm_vcpu *vcpu)
 	vcpu_params->esp_gva = kvm_allocate_vcpu_stack(vm);
 }
 
+void tdx_vcpu_set_entry_point(struct kvm_vcpu *vcpu, void *guest_code)
+{
+	struct td_boot_parameters *params =
+		addr_gpa2hva(vcpu->vm, TD_BOOT_PARAMETERS_GPA);
+	struct td_per_vcpu_parameters *vcpu_params =
+		&params->per_vcpu[vcpu->id];
+
+	vcpu_params->guest_code = (u64)guest_code;
+}
+
 static struct kvm_tdx_capabilities *tdx_read_capabilities(struct kvm_vm *vm)
 {
 	static struct kvm_tdx_capabilities *tdx_cap;

-- 
2.55.0.229.g6434b31f56-goog

