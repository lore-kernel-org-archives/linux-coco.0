Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF5C436D51F
	for <linux-coco@lists.linux.dev>; Thu, 21 May 2026 23:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779405459; cv=none; b=E9JPZ9sOLvlFjF4j1TCsRDn0PYDpTcxTV7mbHk8VkaTwbUFuZrPFBodHb5JSv29HOzStcYWLj1CEciVdBVHZmldpgXS50syj81B4nTgZ99S34UQwJxiHnhMFF17sjIwsvs1qu6T26KnnEioFhuQOE9Wmgm+IV2doW6Ee3lkMwXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779405459; c=relaxed/simple;
	bh=qt2LXBAAVSatCHk6qv+r+f44VcaymTYLSqG7UfqKo1s=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=d037gVv51frZPHWawtPCs9xrea1u2TbhHmLDHACfzsPFNQNSaqImWU59xiljQHX0Rmh9m3vVeXT4wJh6fQIewBNszWQQQNOxYs4DA1zO8Dy409buRtRdPyOtibfmk1HNw2033H6+vqdERxb4dj7YVzG7fgJoIvf2zUwcoFqbwOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--wyihan.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uSXHgHJW; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wyihan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uSXHgHJW"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-c8514f8ed5dso814919a12.3
        for <linux-coco@lists.linux.dev>; Thu, 21 May 2026 16:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779405457; x=1780010257; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=kjYeydDvPiSOX/QiZPpD+8PAHMI/7cV8oLRW0sTcZdI=;
        b=uSXHgHJWh+KjjcW6ia81d+gqiDmhVp601wZy8yh0DzzLsX5iAF/lOGAsaMsX1u7XTO
         UEeCnUtn1udUFypK/V6hIOcScRxOwES+Qh4NwfDLL4S3CVkzdHGZfjqFvWOHS4UiY8+T
         EQxhny4F3c4ieuVBWiZynqqSvCueedTt3Re+uEdvmaRxDhsQigGz7d3FfiGsl/KTEu6U
         Ay6PsVOiIdzn7tjqXtA6pCu1oIh1hVYt1Kf8WE5ZPU2u9LMeZG6vRom+e5CdWsw/qdu8
         Rjp+uw7p9ISFdKuJHBYzCnW0bv1/uBQlpA+lI3VO5NA3ea5MLeEdAEr7rxeqhKi7yTyi
         Yz2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779405457; x=1780010257;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kjYeydDvPiSOX/QiZPpD+8PAHMI/7cV8oLRW0sTcZdI=;
        b=DvH8ROyFFD+Ea2ZW3ZtfSZ4H18vpS+ZxY2f+jgZC2YL8sMzOFz4DhEUdBi6hF/C8k/
         iCrpVx4hKhUHIEm1Qqhef+/C0eXyUnuKChUQpUN5lb34hZTxVY/HcFhpGOUPt/yFh1MX
         RKcNK9UuPtLbiKyLlrip0CeB+PVP8du9Zysn6/2RPNCxo5VNZLF9bmK68BhQVd7sPi9W
         N5PuEmb3eksZO8aZBmvv67kJ5dIw4SIsDFr4sE2yVNDnx80w5JBhT7rtomW8ek9I54/Q
         BFX0GhC9vKA9rcfvNmjDYbdFOEgWDsMf1+r2a86cuVoxzlUq9csqWXS97BLiHqS+0sD9
         8YRw==
X-Forwarded-Encrypted: i=1; AFNElJ8pwq9X64VSebes/zAmw6+HECRcvoX4fKcU/SUGVitIbtfahZwx/fuJ3+pokTTGeFgCAaJY0K/x43Hr@lists.linux.dev
X-Gm-Message-State: AOJu0Ywo4ylInkBU6j08+IMxf2W6I7TIAdK/xp1RtI7GgSpZ0L0ToHx1
	l36t9dXAuvIGUG69112QHa62d+3u8b9UapXNVfB5nrUzw/mb7A/9Q1iS63dUocDppPk1hxw+b9B
	cKHa5aA==
X-Received: from pgjq12.prod.google.com ([2002:a63:e94c:0:b0:c82:2d14:39c8])
 (user=wyihan job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:600f:b0:35d:5d40:6d79
 with SMTP id adf61e73a8af0-3b329152a47mr703134637.12.1779405456963; Thu, 21
 May 2026 16:17:36 -0700 (PDT)
Date: Thu, 21 May 2026 23:16:57 +0000
In-Reply-To: <20260521-tdx-selftests-v13-v13-0-6983ae4c3a4d@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260521-tdx-selftests-v13-v13-0-6983ae4c3a4d@google.com>
X-Developer-Key: i=wyihan@google.com; a=ed25519; pk=cRi0fKzS5BMxlHyHY2pJv3w/1zcgfYKr6EYGYppdMYc=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779405439; l=2770;
 i=wyihan@google.com; s=20260319; h=from:subject:message-id;
 bh=svONZOzYgvB9uLNw7Dd3f+OSjFLXcc689lDb5h7CPLY=; b=NDG/VNPc1LnSu8n/1kL7ViTe0ceOo5Dm6jNO1YYWzgar9WZierYah2T9zWdcmfQa5Gl+NCdoj
 6A/yqBz+EybAB51kiI5NezZ09lf6fMQ49/zfGREJnBtYM1EkZ056LCW
X-Mailer: b4 0.14.3
Message-ID: <20260521-tdx-selftests-v13-v13-16-6983ae4c3a4d@google.com>
Subject: [PATCH  v13 16/22] KVM: selftests: Load per-vCPU guest stack in TDX
 boot parameters
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

Allocate a guest stack for each vCPU and record the GVA in the TDX boot
parameters region to allow proper vCPU initialization.

Co-developed-by: Ackerley Tng <ackerleytng@google.com>
Signed-off-by: Ackerley Tng <ackerleytng@google.com>
Signed-off-by: Sagi Shahar <sagis@google.com>
Signed-off-by: Lisa Wang <wyihan@google.com>
---
 tools/testing/selftests/kvm/include/x86/tdx/tdx_util.h |  1 +
 tools/testing/selftests/kvm/lib/x86/processor.c        |  2 ++
 tools/testing/selftests/kvm/lib/x86/tdx/tdx_util.c     | 11 +++++++++++
 3 files changed, 14 insertions(+)

diff --git a/tools/testing/selftests/kvm/include/x86/tdx/tdx_util.h b/tools/testing/selftests/kvm/include/x86/tdx/tdx_util.h
index 4d01f806b37d..644de6bbec17 100644
--- a/tools/testing/selftests/kvm/include/x86/tdx/tdx_util.h
+++ b/tools/testing/selftests/kvm/include/x86/tdx/tdx_util.h
@@ -67,5 +67,6 @@ void tdx_init_vm(struct kvm_vm *vm, u64 attributes);
 void tdx_vm_setup_boot_code_region(struct kvm_vm *vm);
 void tdx_vm_setup_boot_parameters_region(struct kvm_vm *vm, u32 nr_runnable_vcpus);
 void tdx_vm_load_common_boot_parameters(struct kvm_vm *vm);
+void tdx_vcpu_load_boot_parameters(struct kvm_vm *vm, struct kvm_vcpu *vcpu);
 
 #endif /* SELFTESTS_TDX_TDX_UTIL_H */
diff --git a/tools/testing/selftests/kvm/lib/x86/processor.c b/tools/testing/selftests/kvm/lib/x86/processor.c
index 757da2295ba0..ba332f279f03 100644
--- a/tools/testing/selftests/kvm/lib/x86/processor.c
+++ b/tools/testing/selftests/kvm/lib/x86/processor.c
@@ -847,6 +847,8 @@ static void tdx_vcpu_init(struct kvm_vm *vm, struct kvm_vcpu *vcpu)
 	vcpu_init_cpuid(vcpu, cpuid);
 	free(cpuid);
 	tdx_vcpu_ioctl(vcpu, KVM_TDX_INIT_VCPU, 0, NULL);
+
+	tdx_vcpu_load_boot_parameters(vm, vcpu);
 }
 
 struct kvm_vcpu *vm_arch_vcpu_add(struct kvm_vm *vm, u32 vcpu_id)
diff --git a/tools/testing/selftests/kvm/lib/x86/tdx/tdx_util.c b/tools/testing/selftests/kvm/lib/x86/tdx/tdx_util.c
index b16bf24f3ef1..f26d602501b8 100644
--- a/tools/testing/selftests/kvm/lib/x86/tdx/tdx_util.c
+++ b/tools/testing/selftests/kvm/lib/x86/tdx/tdx_util.c
@@ -107,6 +107,17 @@ void tdx_vm_load_common_boot_parameters(struct kvm_vm *vm)
 	TEST_ASSERT(params->idtr.base != 0, "idt base address should not be 0");
 }
 
+void tdx_vcpu_load_boot_parameters(struct kvm_vm *vm, struct kvm_vcpu *vcpu)
+{
+	struct td_boot_parameters *params =
+		addr_gpa2hva(vm, TD_BOOT_PARAMETERS_GPA);
+	struct td_per_vcpu_parameters *vcpu_params =
+		&params->per_vcpu[vcpu->id];
+
+	vcpu_params->esp_gva = kvm_allocate_vcpu_stack(vm);
+}
+
+
 static struct kvm_tdx_capabilities *tdx_read_capabilities(struct kvm_vm *vm)
 {
 	struct kvm_tdx_capabilities *tdx_cap = NULL;

-- 
2.54.0.746.g67dd491aae-goog

