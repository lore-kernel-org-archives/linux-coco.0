Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D4FF36EA82
	for <linux-coco@lists.linux.dev>; Thu, 21 May 2026 23:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779405461; cv=none; b=c09BSVYHfKclY5I0Af5Cg6XIIq9eQrlF7NuPB3S6EIyDpsrFDnPullJOaigImpt+eHEsdhf1hExUO0LdwRine57wZYuW9wvOu2+/2NicxVhR0jlnTa1pk8pzsdAVc35Fm+YZ8WU1yBq4SjUpAqDmdIF7wt9tPtyHqPxfdWUrtJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779405461; c=relaxed/simple;
	bh=DLAtbrHdvo5WvlVNUy3DYeBFnFMkg96Xemd+rnnf2bI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=jANiq/kzXYK80x9ZObewmYtYCcj06/jki2NyTH/B9LCBT0CE+LOU9/B72mdx/Oa9U8ZiMl3NzY9X3UF036a1GdclSP5qZ6f6xEzDYZrYnQKJHfqB2+OgzciriauN+RIgwemvBe4CDsrlHovqj0n3NbtkPZeXsfhNsoI8S8IDqN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--wyihan.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Tz0aTdGW; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wyihan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Tz0aTdGW"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-2b4530a90fdso119177745ad.1
        for <linux-coco@lists.linux.dev>; Thu, 21 May 2026 16:17:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779405458; x=1780010258; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=FPS+sP3pre8chdLQaPvokk18FwKqoIxFKysij7DMlHI=;
        b=Tz0aTdGWxizNutyQCSCp7bayx9GfCD4CIer3OzMjraA2+/I6Q9sIN79agMq48+3OhM
         SHU9rwb+xsVxLEOdY8MRHZhl+VP4jo+Lv3t+UJj98XOXuICDSlc5XfMTH5DjpAA4VLMc
         Qxx84K/jGjAGhhjeZiTtfMDO8lVL9BA8P9BAgc73wLuyk7RCSXqyIWCLj+jE9jjMFhLC
         o/xgAABeQAc0rmJPRZm7k2KHElW8PeR/76nmW064pNiSKXMRWaAN7gMe1IClY0XY/rv4
         h70uEdkD2/GqlGsQAYernJCuJuio6+Eu89e9vSRpQXtwxKI5jIlUqWHoCn0eYISMh9YC
         bkwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779405458; x=1780010258;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FPS+sP3pre8chdLQaPvokk18FwKqoIxFKysij7DMlHI=;
        b=Odp7TsxhN1ClpIMxbdVNtAR4iWobmxcfGHB+6yqHyqmROKo8QnpleYeXTbfKuVdIXE
         148XA22kzDPTSJJllr1M3LlRTfq7I5jKFIM/u4pSZUD9XqvJh0dyN6rSc0KMzviel1pt
         IsFcaEHCAV5CHrIS8hq9ECh0RyI3xtPa6OfRjOQjcLe2ZSqOWD/92JnQqPnl/xDHNVnq
         81jRJSN7m4dCBR1//bMO3JyFw190BKOd4RXhjHWeUT9A/Y3r12cYl0OApvZEyN5TLIXq
         k/pNiT7QX/yHGwTI8ZcpC4gatGJfOO1XMZMdt/+mJUTLUOa0vsLDSv4btmOjl63yluCs
         R7EA==
X-Forwarded-Encrypted: i=1; AFNElJ93IJ6O/6iE/LTqvgBwpOlPrloxqQBMqbn15DAxoafjKVxPKxqCEPGwE+wNtwIG9INVWE59kK5tpjtm@lists.linux.dev
X-Gm-Message-State: AOJu0Yx23J1gpyfVXvvUQdJLesZ438+KnWlLKLZ7mbG3bECaSR+uToO9
	lDa5UXRFdVfKPAAfDKnz1p9uXY31vm82sBYh9D+TbUYr3Oe5D5seC87ahU6qzy2c8to+azjaLm7
	HBiQZhQ==
X-Received: from plrp5.prod.google.com ([2002:a17:902:b085:b0:2ba:3f4e:3d6])
 (user=wyihan job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:e88e:b0:2ba:6ca2:bd9
 with SMTP id d9443c01a7336-2beb07032fbmr9695845ad.41.1779405457898; Thu, 21
 May 2026 16:17:37 -0700 (PDT)
Date: Thu, 21 May 2026 23:16:58 +0000
In-Reply-To: <20260521-tdx-selftests-v13-v13-0-6983ae4c3a4d@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260521-tdx-selftests-v13-v13-0-6983ae4c3a4d@google.com>
X-Developer-Key: i=wyihan@google.com; a=ed25519; pk=cRi0fKzS5BMxlHyHY2pJv3w/1zcgfYKr6EYGYppdMYc=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779405439; l=2957;
 i=wyihan@google.com; s=20260319; h=from:subject:message-id;
 bh=75vtIEAl1dKIldzNzTlPnRhKHFkQqQMkW79OfZa3kcE=; b=Q9VYAySvG+mi4HBliB0DA/6YC8JFcHSxCIIS/IW7G4YvLcnSpO9YfF7Nkrfxpw+8eXtveLYYt
 Ty96nYghLlbDAvi+eunlB5g1VbkmceAis3Utdu3yMheAU2vWAYRm+sk
X-Mailer: b4 0.14.3
Message-ID: <20260521-tdx-selftests-v13-v13-17-6983ae4c3a4d@google.com>
Subject: [PATCH  v13 17/22] KVM: selftests: Set entry point for TDX guest code
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
index 644de6bbec17..efa4c7f7b1c1 100644
--- a/tools/testing/selftests/kvm/include/x86/tdx/tdx_util.h
+++ b/tools/testing/selftests/kvm/include/x86/tdx/tdx_util.h
@@ -68,5 +68,6 @@ void tdx_vm_setup_boot_code_region(struct kvm_vm *vm);
 void tdx_vm_setup_boot_parameters_region(struct kvm_vm *vm, u32 nr_runnable_vcpus);
 void tdx_vm_load_common_boot_parameters(struct kvm_vm *vm);
 void tdx_vcpu_load_boot_parameters(struct kvm_vm *vm, struct kvm_vcpu *vcpu);
+void tdx_vcpu_set_entry_point(struct kvm_vcpu *vcpu, void *guest_code);
 
 #endif /* SELFTESTS_TDX_TDX_UTIL_H */
diff --git a/tools/testing/selftests/kvm/lib/x86/processor.c b/tools/testing/selftests/kvm/lib/x86/processor.c
index ba332f279f03..d84c629a1945 100644
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
index f26d602501b8..158cba1b95e3 100644
--- a/tools/testing/selftests/kvm/lib/x86/tdx/tdx_util.c
+++ b/tools/testing/selftests/kvm/lib/x86/tdx/tdx_util.c
@@ -117,6 +117,16 @@ void tdx_vcpu_load_boot_parameters(struct kvm_vm *vm, struct kvm_vcpu *vcpu)
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

-- 
2.54.0.746.g67dd491aae-goog

