Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C2FC36EA82
	for <linux-coco@lists.linux.dev>; Thu, 21 May 2026 23:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779405458; cv=none; b=ECzdWNqTgEUnWtJC9FMKSmXo7h+7GYcHJfqmAEHEJBMoznp1/YjKm2lcm7OqV1dwLdjf1ADodcyRTeZ2EeggbuQ2V3pCW83e+Ae7tncZfPrbzZHziiMfi3Gxj6eqBF3K20Res1E/BoF/dOLMT2Nv6eQizvj+0mQmDZYjhdqpIEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779405458; c=relaxed/simple;
	bh=udDXvjbrsQgFgt7qVk8qtnNJ+IfXYTJzUuuEMBgUW3E=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=jJAma72Rc0tySNPSaE3eN4wHi0v92y/SXlOCy/Cag4vgxkzu5XY4qv6w9geDZ9LQDnWe5+8oRXhsHIg7b+RTklKVm1vicscJM4RYI4pZv9o6GTDlX8zcmCPEgHeeTSZRT6QHAY2W+o7IxIeev+lz+l4qWziZ3WLutVkJQSnolZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--wyihan.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wHlPUwZA; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wyihan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wHlPUwZA"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2b9b8137828so67929705ad.0
        for <linux-coco@lists.linux.dev>; Thu, 21 May 2026 16:17:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779405455; x=1780010255; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=0ssngaACF1pPA6AFVRZmeIqOo2ZrmTp+xXxStiUyWOw=;
        b=wHlPUwZAKfCxfPAuGvHh56DNH3x7TgIy6fu/EPkvd8ZFk5YoE7aQbhQ+dVZZEJ1/q8
         frwL4GWoAHUCszfAYPALQE7IPUgm2WUoaAj/VlQe7JaYTs/+Xjljt2EF7TNJZ6bOQNhZ
         F2vm7qeHia5Z0GG6WfQIiOzq4gGk5uZBS8BbWkylurfaeaMMP4AySrrsmh1NNFDrFjz8
         zyF4WhGg5qSlN46kksQcZHeHQ4CrH9H4JEoKC4O7XQqaNqq8FSAt5lBIiSC0DkukZgUR
         n1QFmsz8+WU4yka/uzvcTR1L3km+sL5oBrEb62PHhZyW88hyo+ndmclrBihrOy7DSnKe
         MixA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779405455; x=1780010255;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0ssngaACF1pPA6AFVRZmeIqOo2ZrmTp+xXxStiUyWOw=;
        b=KYMHTT4PBlp5F1y+MyoyBHjlUjNWZ2T0uQ9pbIGyTso11gOysB6OiYNSUypyfXXfgw
         1AVhoxjbtw7tPdDg0pMGIJhL1dr5maJkRbAAATacdwlVAlJQTriUmtcVodOLS3PptHr1
         zuHJEP6C91POQbr15PWb/BvD/ux4k4gegANVVu3vjoAnZaaQexKBs+0ARhGWrS3BlF5u
         qVC2XJVdFMCYF2hEXe7II1Yddoipkc/EF2b6mse30TCmIiiHWmCPreRBX/hJRkAOup3T
         gGS8In2znJPXGq630abYnTN0R9Ge0u/H1hyxusk336/OJElweeMftCNmHuCWdqP8Z67/
         iTyA==
X-Forwarded-Encrypted: i=1; AFNElJ/65wNkb8twey0Vs0vb9jsv/gZECViMDCOGjT/1NKe/X8JT726ebOKxYBHnIF2PrfCZjcrlWvjsr9hc@lists.linux.dev
X-Gm-Message-State: AOJu0YyyTk9jVmdtcDvuLnT6YdrEAcygT9sroRU5jhYpYlkzm12pttXj
	uu71ESnDxr8fo3eUl4FsxQMai2YVTFDoEEmE2R1NGqiaZxEY8VZqM2a9uWwKB+mK+1K2u+QvWUF
	i43mgYw==
X-Received: from plbmg4.prod.google.com ([2002:a17:903:3484:b0:2bd:4d9a:20b3])
 (user=wyihan job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:4b48:b0:2bd:ba75:81c4
 with SMTP id d9443c01a7336-2beb05d9d4cmr9896875ad.13.1779405455121; Thu, 21
 May 2026 16:17:35 -0700 (PDT)
Date: Thu, 21 May 2026 23:16:55 +0000
In-Reply-To: <20260521-tdx-selftests-v13-v13-0-6983ae4c3a4d@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260521-tdx-selftests-v13-v13-0-6983ae4c3a4d@google.com>
X-Developer-Key: i=wyihan@google.com; a=ed25519; pk=cRi0fKzS5BMxlHyHY2pJv3w/1zcgfYKr6EYGYppdMYc=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779405439; l=3023;
 i=wyihan@google.com; s=20260319; h=from:subject:message-id;
 bh=Ki6Ro/RympvdJQKZ3KpSyOqEmxDilEWNNZSaA2+PhPg=; b=jAtvfx/1WqUdQdC9BMuOORGL6WZjJo5rYK84U8hDNsisbvaK4Z0zLQYPqfV9EPP+ce1U4elTx
 q55psohvAkLCorHDAehIti+DZZ+gWYmB5aGGQuW0FdGP6VnRb+UOA5m
X-Mailer: b4 0.14.3
Message-ID: <20260521-tdx-selftests-v13-v13-14-6983ae4c3a4d@google.com>
Subject: [PATCH  v13 14/22] KVM: selftests: Expose function to allocate vCPU stack
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

Introduce kvm_allocate_vcpu_stack() to allocate a vCPU's stack
in preparation for TDX to allocate a vCPU's stack and initialize
its stack pointer.

TDX VMs' registers are protected state and cannot be initialized
using the KVM_SET_REGS ioctl() that is used for normal VMs. A TDX
vCPU's stack address will be a property of the TDX specific boot code
that initializes the vCPUs' stack pointers at boot.

Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
Signed-off-by: Sagi Shahar <sagis@google.com>
Reviewed-by: Ira Weiny <ira.weiny@intel.com>
Signed-off-by: Lisa Wang <wyihan@google.com>
---
 tools/testing/selftests/kvm/include/x86/processor.h |  2 ++
 tools/testing/selftests/kvm/lib/x86/processor.c     | 16 +++++++++++-----
 2 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/tools/testing/selftests/kvm/include/x86/processor.h b/tools/testing/selftests/kvm/include/x86/processor.h
index 1ebf161ec5d0..ed9c031b77b8 100644
--- a/tools/testing/selftests/kvm/include/x86/processor.h
+++ b/tools/testing/selftests/kvm/include/x86/processor.h
@@ -1142,6 +1142,8 @@ static inline void vcpu_clear_cpuid_feature(struct kvm_vcpu *vcpu,
 	vcpu_set_or_clear_cpuid_feature(vcpu, feature, false);
 }
 
+gva_t kvm_allocate_vcpu_stack(struct kvm_vm *vm);
+
 u64 vcpu_get_msr(struct kvm_vcpu *vcpu, u64 msr_index);
 int _vcpu_set_msr(struct kvm_vcpu *vcpu, u64 msr_index, u64 msr_value);
 
diff --git a/tools/testing/selftests/kvm/lib/x86/processor.c b/tools/testing/selftests/kvm/lib/x86/processor.c
index c7c4a37b3170..8b0aa64384a1 100644
--- a/tools/testing/selftests/kvm/lib/x86/processor.c
+++ b/tools/testing/selftests/kvm/lib/x86/processor.c
@@ -813,12 +813,9 @@ void vcpu_arch_set_entry_point(struct kvm_vcpu *vcpu, void *guest_code)
 	vcpu_regs_set(vcpu, &regs);
 }
 
-struct kvm_vcpu *vm_arch_vcpu_add(struct kvm_vm *vm, u32 vcpu_id)
+gva_t kvm_allocate_vcpu_stack(struct kvm_vm *vm)
 {
-	struct kvm_mp_state mp_state;
-	struct kvm_regs regs;
 	gva_t stack_gva;
-	struct kvm_vcpu *vcpu;
 
 	stack_gva = __vm_alloc(vm, DEFAULT_STACK_PGS * getpagesize(),
 			       DEFAULT_GUEST_STACK_VADDR_MIN, MEM_REGION_DATA);
@@ -838,6 +835,15 @@ struct kvm_vcpu *vm_arch_vcpu_add(struct kvm_vm *vm, u32 vcpu_id)
 		    "__vm_alloc() did not provide a page-aligned address");
 	stack_gva -= 8;
 
+	return stack_gva;
+}
+
+struct kvm_vcpu *vm_arch_vcpu_add(struct kvm_vm *vm, u32 vcpu_id)
+{
+	struct kvm_mp_state mp_state;
+	struct kvm_vcpu *vcpu;
+	struct kvm_regs regs;
+
 	vcpu = __vm_vcpu_add(vm, vcpu_id);
 	vcpu_init_cpuid(vcpu, kvm_get_supported_cpuid());
 	vcpu_init_sregs(vm, vcpu);
@@ -846,7 +852,7 @@ struct kvm_vcpu *vm_arch_vcpu_add(struct kvm_vm *vm, u32 vcpu_id)
 	/* Setup guest general purpose registers */
 	vcpu_regs_get(vcpu, &regs);
 	regs.rflags = regs.rflags | 0x2;
-	regs.rsp = stack_gva;
+	regs.rsp = kvm_allocate_vcpu_stack(vm);
 	vcpu_regs_set(vcpu, &regs);
 
 	/* Setup the MP state */

-- 
2.54.0.746.g67dd491aae-goog

