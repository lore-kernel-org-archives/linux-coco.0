Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7E2528DB46
	for <linux-coco@lists.linux.dev>; Wed, 25 Feb 2026 01:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771982482; cv=none; b=gtdvOiZ+67CWXzfvte3Vj7CA8gUku5Nlj0DinbrCkurAms02BTA8kdilPERlRWUbRjvwUO51hMBnQvf5NlwgXZ3D8TKffXE3GDUmJIBGaG83/w6Dao0lZkM/L3TjMUSsIaP0YnxNTo9XY7CC7QgGeg0JxylDQdE1wmbKy/Rg5e4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771982482; c=relaxed/simple;
	bh=IuDnIRUgFkFMGAUuxCS338MB/VHIWV/Tt1I66OqunQE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=F14CCMPcxXeRecUddx818kVLHMqSHScJ+8RvhgG0oHWTtVXfgMTEMugU2AK7Zmh+WeQQ28965IvgN/hCS5LDg+SPN4xTDhMAavqNXSKgejuCblBEddZYDqrZm2YGK9NTjwYDQevc0U4QQpiwwei8OO3idWwytHE1P9ClJ+oYyGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=2EbtYDtA; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="2EbtYDtA"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-c65d08b623aso263798a12.0
        for <linux-coco@lists.linux.dev>; Tue, 24 Feb 2026 17:21:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771982479; x=1772587279; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=06Kr2IGpW9wlaU49L7FaC2EfLlqxR0kfrYYtwtYSIqY=;
        b=2EbtYDtA+1V70DDHv8Jb8Wd0+oL6UvtuCz1dc9ws3iVIP0zVcWgqV5bTYRWLVf0OW3
         1L5bLJ7bxxKESLC/aM05TnxAeMnQtWYdIvPf5zXVoSeS7AwPHto/JOj2pEVM88sVoKnz
         5PqNhEj7/o7U1MZ828zL6Z3muOc+x3DTNilE8XBU7DwvprASM81wN/HxFDGM912gXkBf
         4KnRjpVM44XakI3F34XdckoWL7v1KHIiQu9NnkHsyG+QY0DMqkjjLCGqA7IrIf2SlcpL
         mk2A5NXB2NiUAaGbJo2DQaLpGFE3JggpHKXR37wQq7OsZv0suP1b3hNi3eS1EMN6zz7F
         dvWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771982479; x=1772587279;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=06Kr2IGpW9wlaU49L7FaC2EfLlqxR0kfrYYtwtYSIqY=;
        b=TZtiw1h6aEac4klWbcvUaO+mCtTwvW13bz7I9aoJxsqvjLEK3sNGsFLsdDvmfm9yHr
         iXQsGplMXpLp85SNwRT08h3h2YlQiT+dYC/OS46TuMDx8ScHYTymyycck2dLKIgw1Zve
         f8k/IJCLVOgwH2PqEmiodMcqmxI0zcG7Lu2UCozEjtMj1iOPvmiuYV50Y95T2nC7A98t
         eAhx+ZMvznCS/kVoeWzFlR/sA0d+I0VaWLGoxqUrFrrq7l8Dn29xfBkLd8r0vt3syAoh
         Pii76diqldHfpOOHHLecOzlRs3oELe+kqfCBFV45glKLHddICOroSNVggh14Pb9UFN+J
         YDoQ==
X-Forwarded-Encrypted: i=1; AJvYcCVKfQruNaYFnYbLoFBugQj2uq/OqoamNttTjXpjbkAu4b+WlLAjNjjEW5WmVc1l8fMYRcg1d/YKQKJa@lists.linux.dev
X-Gm-Message-State: AOJu0YwYLI2vRydNodgVm7HsrqNpa5H9RXJV1wDlR35fJiuTABKx/CMe
	+4/56lLfPlKV0WQGKN8XVadfwc/nNO0FJ+A29XslLUsyuUrC5pctsBRKd289WeuhvWqOgihWN+X
	IYQ1+Cw==
X-Received: from pgeh5.prod.google.com ([2002:a05:6a02:53c5:b0:c6e:8a5c:a772])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:7d9b:b0:37c:b74c:d8c7
 with SMTP id adf61e73a8af0-3959ac989c4mr1507787637.22.1771982478801; Tue, 24
 Feb 2026 17:21:18 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Tue, 24 Feb 2026 17:20:49 -0800
In-Reply-To: <20260225012049.920665-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260225012049.920665-1-seanjc@google.com>
X-Mailer: git-send-email 2.53.0.414.gf7e9f6c205-goog
Message-ID: <20260225012049.920665-15-seanjc@google.com>
Subject: [PATCH 14/14] KVM: x86: Add helpers to prepare kvm_run for userspace
 MMIO exit
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Kiryl Shutsemau <kas@kernel.org>
Cc: kvm@vger.kernel.org, x86@kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Yashu Zhang <zhangjiaji1@huawei.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Binbin Wu <binbin.wu@linux.intel.com>, 
	Xiaoyao Li <xiaoyao.li@intel.com>, Tom Lendacky <thomas.lendacky@amd.com>, 
	Michael Roth <michael.roth@amd.com>
Content-Type: text/plain; charset="UTF-8"

Add helpers to fill kvm_run for userspace MMIO exits to deduplicate a
variety of code, and to allow for a cleaner return path in
emulator_read_write().

No functional change intended.

Cc: Rick Edgecombe <rick.p.edgecombe@intel.com>
Cc: Binbin Wu <binbin.wu@linux.intel.com>
Cc: Xiaoyao Li <xiaoyao.li@intel.com>
Cc: Tom Lendacky <thomas.lendacky@amd.com>
Cc: Michael Roth <michael.roth@amd.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/tdx.c | 14 ++++----------
 arch/x86/kvm/x86.c     | 42 ++++++++----------------------------------
 arch/x86/kvm/x86.h     | 24 ++++++++++++++++++++++++
 3 files changed, 36 insertions(+), 44 deletions(-)

diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
index 5df9d32d2058..a813c502336c 100644
--- a/arch/x86/kvm/vmx/tdx.c
+++ b/arch/x86/kvm/vmx/tdx.c
@@ -1467,17 +1467,11 @@ static int tdx_emulate_mmio(struct kvm_vcpu *vcpu)
 
 	/* Request the device emulation to userspace device model. */
 	vcpu->mmio_is_write = write;
-	if (!write)
+
+	__kvm_prepare_emulated_mmio_exit(vcpu, gpa, size, &val, write);
+
+	if (!write) {
 		vcpu->arch.complete_userspace_io = tdx_complete_mmio_read;
-
-	vcpu->run->mmio.phys_addr = gpa;
-	vcpu->run->mmio.len = size;
-	vcpu->run->mmio.is_write = write;
-	vcpu->run->exit_reason = KVM_EXIT_MMIO;
-
-	if (write) {
-		memcpy(vcpu->run->mmio.data, &val, size);
-	} else {
 		vcpu->mmio_fragments[0].gpa = gpa;
 		vcpu->mmio_fragments[0].len = size;
 		trace_kvm_mmio(KVM_TRACE_MMIO_READ_UNSATISFIED, size, gpa, NULL);
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 5376b370b4db..889a9098403c 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -8210,7 +8210,6 @@ static int emulator_read_write(struct x86_emulate_ctxt *ctxt,
 			const struct read_write_emulator_ops *ops)
 {
 	struct kvm_vcpu *vcpu = emul_to_vcpu(ctxt);
-	struct kvm_mmio_fragment *frag;
 	int rc;
 
 	if (WARN_ON_ONCE((bytes > 8u || !ops->write) && object_is_on_stack(val)))
@@ -8268,12 +8267,9 @@ static int emulator_read_write(struct x86_emulate_ctxt *ctxt,
 
 	vcpu->mmio_needed = 1;
 	vcpu->mmio_cur_fragment = 0;
+	vcpu->mmio_is_write = ops->write;
 
-	frag = &vcpu->mmio_fragments[0];
-	vcpu->run->mmio.len = min(8u, frag->len);
-	vcpu->run->mmio.is_write = vcpu->mmio_is_write = ops->write;
-	vcpu->run->exit_reason = KVM_EXIT_MMIO;
-	vcpu->run->mmio.phys_addr = frag->gpa;
+	kvm_prepare_emulated_mmio_exit(vcpu, &vcpu->mmio_fragments[0]);
 
 	/*
 	 * For MMIO reads, stop emulating and immediately exit to userspace, as
@@ -8283,11 +8279,7 @@ static int emulator_read_write(struct x86_emulate_ctxt *ctxt,
 	 * after completing emulation (see the check on vcpu->mmio_needed in
 	 * x86_emulate_instruction()).
 	 */
-	if (!ops->write)
-		return X86EMUL_IO_NEEDED;
-
-	memcpy(vcpu->run->mmio.data, frag->data, min(8u, frag->len));
-	return X86EMUL_CONTINUE;
+	return ops->write ? X86EMUL_CONTINUE : X86EMUL_IO_NEEDED;
 }
 
 static int emulator_read_emulated(struct x86_emulate_ctxt *ctxt,
@@ -11884,12 +11876,7 @@ static int complete_emulated_mmio(struct kvm_vcpu *vcpu)
 		return complete_emulated_io(vcpu);
 	}
 
-	run->exit_reason = KVM_EXIT_MMIO;
-	run->mmio.phys_addr = frag->gpa;
-	if (vcpu->mmio_is_write)
-		memcpy(run->mmio.data, frag->data, min(8u, frag->len));
-	run->mmio.len = min(8u, frag->len);
-	run->mmio.is_write = vcpu->mmio_is_write;
+	kvm_prepare_emulated_mmio_exit(vcpu, frag);
 	vcpu->arch.complete_userspace_io = complete_emulated_mmio;
 	return 0;
 }
@@ -14296,15 +14283,8 @@ static int complete_sev_es_emulated_mmio(struct kvm_vcpu *vcpu)
 	}
 
 	// More MMIO is needed
-	run->mmio.phys_addr = frag->gpa;
-	run->mmio.len = min(8u, frag->len);
-	run->mmio.is_write = vcpu->mmio_is_write;
-	if (run->mmio.is_write)
-		memcpy(run->mmio.data, frag->data, min(8u, frag->len));
-	run->exit_reason = KVM_EXIT_MMIO;
-
+	kvm_prepare_emulated_mmio_exit(vcpu, frag);
 	vcpu->arch.complete_userspace_io = complete_sev_es_emulated_mmio;
-
 	return 0;
 }
 
@@ -14333,23 +14313,17 @@ int kvm_sev_es_mmio(struct kvm_vcpu *vcpu, bool is_write, gpa_t gpa,
 	 *       requests that split a page boundary.
 	 */
 	frag = vcpu->mmio_fragments;
-	vcpu->mmio_nr_fragments = 1;
 	frag->len = bytes;
 	frag->gpa = gpa;
 	frag->data = data;
 
 	vcpu->mmio_needed = 1;
 	vcpu->mmio_cur_fragment = 0;
+	vcpu->mmio_nr_fragments = 1;
+	vcpu->mmio_is_write = is_write;
 
-	vcpu->run->mmio.phys_addr = gpa;
-	vcpu->run->mmio.len = min(8u, frag->len);
-	vcpu->run->mmio.is_write = is_write;
-	if (is_write)
-		memcpy(vcpu->run->mmio.data, frag->data, min(8u, frag->len));
-	vcpu->run->exit_reason = KVM_EXIT_MMIO;
-
+	kvm_prepare_emulated_mmio_exit(vcpu, frag);
 	vcpu->arch.complete_userspace_io = complete_sev_es_emulated_mmio;
-
 	return 0;
 }
 EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_sev_es_mmio);
diff --git a/arch/x86/kvm/x86.h b/arch/x86/kvm/x86.h
index 1d0f0edd31b3..d66f1c53d2b5 100644
--- a/arch/x86/kvm/x86.h
+++ b/arch/x86/kvm/x86.h
@@ -718,6 +718,30 @@ int kvm_sev_es_string_io(struct kvm_vcpu *vcpu, unsigned int size,
 			 unsigned int port, void *data,  unsigned int count,
 			 int in);
 
+static inline void __kvm_prepare_emulated_mmio_exit(struct kvm_vcpu *vcpu,
+						    gpa_t gpa, unsigned int len,
+						    const void *data,
+						    bool is_write)
+{
+	struct kvm_run *run = vcpu->run;
+
+	run->mmio.len = min(8u, len);
+	run->mmio.is_write = is_write;
+	run->exit_reason = KVM_EXIT_MMIO;
+	run->mmio.phys_addr = gpa;
+	if (is_write)
+		memcpy(run->mmio.data, data, min(8u, len));
+}
+
+static inline void kvm_prepare_emulated_mmio_exit(struct kvm_vcpu *vcpu,
+						  struct kvm_mmio_fragment *frag)
+{
+	WARN_ON_ONCE(!vcpu->mmio_needed || !vcpu->mmio_nr_fragments);
+
+	__kvm_prepare_emulated_mmio_exit(vcpu, frag->gpa, frag->len, frag->data,
+					 vcpu->mmio_is_write);
+}
+
 static inline bool user_exit_on_hypercall(struct kvm *kvm, unsigned long hc_nr)
 {
 	return kvm->arch.hypercall_exit_enabled & BIT(hc_nr);
-- 
2.53.0.414.gf7e9f6c205-goog

