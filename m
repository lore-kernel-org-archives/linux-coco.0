Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793922463;
	b=AlHGpelUzEIf7xxRDRSeJi/mjxhZu79kELvUMSX9FeI24qmCbu7GUxvaTmwenYfq3BW+
	 cY75Um/VDYA1cqyA5Wsr3KmNFVnWanTmzRb/vpypCs3RTscYIjwXv4gNQ/21KsxhIkrIp
	 uXtHmkW2fwvRrbAbM17IgTrq++0vsskS7qI5p4ljlEVfYmLNGCLxUWLZmrBAwKmOcHs/r
	 bSH+88jsYpdvR7hZIhiGTb9l9+pnIlQWjOuMSu9swzj2PYcVZwJpUSFs0Xo8ZW+SPyGXs
	 mi00Qin1hzSfw6sd3EyQiI6jitP45EajMV4TGCZFxDKySHrZfXUohiBJSUSTaqIeElw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793922463;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Developer-Key:X-Developer-Signature:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=tkUD1+HlFzOrZ1P0ClOG0AeXVQBT8WKUQ6xzERWmYvU=;
	b=m/HBYq2nNjIYO0Qgyb+84bofJYVO7cOPZ1q4eAZo9cyYdeRD7dfvQqsvG+wLt679iliM
	 HefDtH5gCv0nTIVT8Kf96nnQfyvJfFDHln4IJKBNcXHkmYPMOlkkkk+YOuQRhaygoTShk
	 NwA21nGZt1lQzWwXgvhmjaU9QcZd36mV/2lnxNOV0lXbjiLrQSRvSMBspQ6qdcx2J6UER
	 k4EPxTCAscdMON9qqL0rFm/aXnqhqAcSa/FZCXvXAWh8CYLubWzOOV9PoT37hdJtU4Ums
	 AfrpSZCl+HDPdlgRIjJQa3uIrLhFKTchBMnz4V1cGnEA53UnjuyjwXHiyt06A7rEEIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--wyihan.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="KjO0GkV/";
	arc=none smtp.remote-ip=209.85.216.69
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6090C606EEBB
	for <linux-coco@lists.linux.dev>; Thu,  5 Nov 2026 23:47:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6090C606EEBB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wyihan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=KjO0GkV/
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ad30487d55so139666a91.2
        for <linux-coco@lists.linux.dev>; Thu, 05 Nov 2026 15:47:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793922463; x=1794527263; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tkUD1+HlFzOrZ1P0ClOG0AeXVQBT8WKUQ6xzERWmYvU=;
        b=KjO0GkV/ZSFvB/qFIKC84JvcioNxsfwBn8r74OwVMvB/i2EWS+84+a9aK1APaKgAs/
         oDjEvzr8itflpixAYVUXy1Vq4aGVcpSeurObRljKkWky291w2mf5XbX2q6zbEjJP0DqI
         ez8cErDfVQ5iAG5AqV5ENMs6s5Oyf3D/QQgsaRLWKgEyrQBi3UM/K7+ohJLxU4PkqywB
         8yZ/DI5pesQ64bAKU7gSxrhnFj0tREZc6jNTtY43yw3T0MpRwSWfukZL/PYTacHNyJEL
         XjxxbeiR7nnSFeuyvzH5Api+Xc0gTBzDTa9G9FPz1tHNfnbGrSlJ173OZZgEkJz/asBb
         Rxaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793922463; x=1794527263;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tkUD1+HlFzOrZ1P0ClOG0AeXVQBT8WKUQ6xzERWmYvU=;
        b=Z71w81kXOgMC6PaCMTq722ya9p3KrA9Mhgnq5OwYSp6cSEzWWnQbXLsXfEIfVmxUM9
         KmzQd3+H3jkP6+3VkQZhkxjgzpWWxN18UukxREcMShLX1Vm4c8yC6Qk5EfwTlQUpk1NX
         215hiLmSF5grmt5EeAwOG/+VROmL0JwQCKGawZp1jNYnLdNq64emdkg8cqjrP2WkPOSf
         9sJymNMLbyYX1zKG77Z8dQBYbwhsqxPRXiEHRRaQZrTimmF9NwDOjmGyljw5nTs+aJ28
         AXlmBJWMoM6YS7t3gNvBA5W6e9lWfP5pqu3+iTg/bx95s6DdEC+WIZJTtmGITgoILMI8
         ZR/w==
X-Forwarded-Encrypted: i=1; AKwUvBxRPzaLH/jxc4iZGfqHwk4tFXEw9FhhFpIqKWbv9jSGowx6ZRdG8BwqDr1lzaOA5CWzfXTW8quSWorS@lists.linux.dev
X-Gm-Message-State: APuU4Z/TLc5h310ue6rtV9YoZ6hKAuYlrE0zuNQbnWc79PKzaugfXUu1
	NtIrClWVsLT1lAHZAT7Txdpl9bqNUnLejRJ/3b/JvY8eNdIxd5fA+BwGHpxFmaRdws+9eHBwBCp
	gyn7aAQ==
X-Received: from pjx15.prod.google.com ([2002:a17:90b:568f:b0:3ac:748b:a8ac])
 (user=wyihan job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3890:b0:3ab:a3ee:33ad
 with SMTP id 98e67ed59e1d1-3b0db6bbc23mr686251a91.22.1793922462484; Thu, 05
 Nov 2026 15:47:42 -0800 (PST)
Date: Thu, 05 Nov 2026 23:46:54 +0000
In-Reply-To: <20261105-tdx-selftests-v16-0-2024e8fa517a@google.com>
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Post: <mailto:linux-coco@lists.linux.dev>
List-Help: <mailto:linux-coco+help@lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-coco+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261105-tdx-selftests-v16-0-2024e8fa517a@google.com>
X-Developer-Key: i=wyihan@google.com; a=ed25519; pk=cRi0fKzS5BMxlHyHY2pJv3w/1zcgfYKr6EYGYppdMYc=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793922452; l=4634;
 i=wyihan@google.com; s=20260319; h=from:subject:message-id;
 bh=ZhhGPoqOEWroNK2UMoDhfkXAKKHsS5bAWSvZia0Q+5g=; b=uVMhZ2FdXPVbJGSlxB0VIQkQMJxICidUPHappnc6GTwjrTjmUXfU6ZGsWugbETFpbF5CFbVWJ
 2HldDLha7v/C8BNW9SX9+39zImGJYb+4DPneXwuaYp4n4Z/+paCrboY
X-Mailer: b4 0.14.3
Message-ID: <20261105-tdx-selftests-v16-10-2024e8fa517a@google.com>
Subject: [PATCH v16 10/20] KVM: selftests: Set up TDX boot parameters region
From: Lisa Wang <wyihan@google.com>
To: Andrew Jones <ajones@ventanamicro.com>, Ackerley Tng <ackerleytng@google.com>, 
	Binbin Wu <binbin.wu@linux.intel.com>, Chao Gao <chao.gao@intel.com>, 
	Chenyi Qiang <chenyi.qiang@intel.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Erdem Aktas <erdemaktas@google.com>, Ira Weiny <iweiny@kernel.org>, 
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

Allocate memory for TDX boot parameters and define the utility functions
necessary to fill this memory with the boot parameters.

Co-developed-by: Ackerley Tng <ackerleytng@google.com>
Signed-off-by: Ackerley Tng <ackerleytng@google.com>
Signed-off-by: Sagi Shahar <sagis@google.com>
Signed-off-by: Lisa Wang <wyihan@google.com>
Reviewed-by: Xiaoyao Li <xiaoyao.li@intel.com>
Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
---
 .../selftests/kvm/include/x86/tdx/tdx_util.h       |  2 +
 tools/testing/selftests/kvm/lib/x86/processor.c    |  2 +
 tools/testing/selftests/kvm/lib/x86/tdx/tdx_util.c | 50 ++++++++++++++++++++++
 3 files changed, 54 insertions(+)

diff --git a/tools/testing/selftests/kvm/include/x86/tdx/tdx_util.h b/tools/testing/selftests/kvm/include/x86/tdx/tdx_util.h
index 43b4157e4a13..4330290d29e9 100644
--- a/tools/testing/selftests/kvm/include/x86/tdx/tdx_util.h
+++ b/tools/testing/selftests/kvm/include/x86/tdx/tdx_util.h
@@ -48,5 +48,7 @@ static inline bool is_tdx_vm(struct kvm_vm *vm)
 
 void tdx_init_vm(struct kvm_vm *vm);
 void tdx_vm_setup_boot_code_region(struct kvm_vm *vm);
+void tdx_vm_setup_boot_parameters_region(struct kvm_vm *vm, u32 nr_runnable_vcpus);
+void tdx_vm_load_common_boot_parameters(struct kvm_vm *vm);
 
 #endif /* SELFTESTS_TDX_TDX_UTIL_H */
diff --git a/tools/testing/selftests/kvm/lib/x86/processor.c b/tools/testing/selftests/kvm/lib/x86/processor.c
index 36003cfd8d6a..a215ab6c2ea4 100644
--- a/tools/testing/selftests/kvm/lib/x86/processor.c
+++ b/tools/testing/selftests/kvm/lib/x86/processor.c
@@ -828,6 +828,8 @@ void kvm_arch_vm_post_create(struct kvm_vm *vm, unsigned int nr_vcpus)
 	if (is_tdx_vm(vm)) {
 		tdx_init_vm(vm);
 		tdx_vm_setup_boot_code_region(vm);
+		tdx_vm_setup_boot_parameters_region(vm, nr_vcpus);
+		tdx_vm_load_common_boot_parameters(vm);
 	}
 
 	r = __vm_ioctl(vm, KVM_GET_TSC_KHZ, NULL);
diff --git a/tools/testing/selftests/kvm/lib/x86/tdx/tdx_util.c b/tools/testing/selftests/kvm/lib/x86/tdx/tdx_util.c
index b4a7089b3636..e8deef076f9a 100644
--- a/tools/testing/selftests/kvm/lib/x86/tdx/tdx_util.c
+++ b/tools/testing/selftests/kvm/lib/x86/tdx/tdx_util.c
@@ -8,6 +8,7 @@
 
 /* Arbitrarily selected to avoid overlaps with anything else */
 #define TD_BOOT_CODE_SLOT	20
+#define TD_BOOT_PARAMETERS_SLOT	21
 
 #define X86_RESET_VECTOR	0xfffffff0ul
 
@@ -41,6 +42,55 @@ void tdx_vm_setup_boot_code_region(struct kvm_vm *vm)
 		    (unsigned long)addr_gpa2hva(vm, X86_RESET_VECTOR), (unsigned long)hva);
 }
 
+void tdx_vm_setup_boot_parameters_region(struct kvm_vm *vm, u32 nr_runnable_vcpus)
+{
+	size_t boot_params_size = sizeof(struct td_boot_parameters) +
+		nr_runnable_vcpus * sizeof(struct td_per_vcpu_parameters);
+	int npages = DIV_ROUND_UP(boot_params_size, PAGE_SIZE);
+	u64 gmem_flags = 0;
+	gpa_t gpa;
+
+	if (kvm_has_gmem_attributes)
+		gmem_flags |= GUEST_MEMFD_FLAG_INIT_SHARED | GUEST_MEMFD_FLAG_MMAP;
+	vm_mem_add(vm, VM_MEM_SRC_SHMEM, TD_BOOT_PARAMETERS_GPA,
+		   TD_BOOT_PARAMETERS_SLOT, npages,
+		   KVM_MEM_GUEST_MEMFD, -1, 0, gmem_flags);
+	gpa = ____vm_phy_pages_alloc(vm, npages, TD_BOOT_PARAMETERS_GPA,
+				     TD_BOOT_PARAMETERS_SLOT, true, false);
+	TEST_ASSERT(gpa == TD_BOOT_PARAMETERS_GPA, "Failed vm_phy_pages_alloc");
+
+	virt_map(vm, TD_BOOT_PARAMETERS_GPA, TD_BOOT_PARAMETERS_GPA, npages);
+}
+
+void tdx_vm_load_common_boot_parameters(struct kvm_vm *vm)
+{
+	struct td_boot_parameters *params = addr_gpa2hva(vm, TD_BOOT_PARAMETERS_GPA);
+	u32 cr4;
+
+	cr4 = kvm_get_default_cr4(vm->mmu.pgtable_levels);
+
+	/* Per the TDX spec, CR4 bit MCE is fixed to 1 */
+	cr4 |= X86_CR4_MCE;
+
+	/* Per the TDX spec, CR4 bit VMXE and SMXE are fixed to 0 */
+	cr4 &= ~(X86_CR4_VMXE | X86_CR4_SMXE);
+
+	/* Set parameters! */
+	params->cr0 = kvm_get_default_cr0();
+	TEST_ASSERT(vm->mmu.pgd < (1ULL << 32),
+		    "PGD must be within 32-bit address space for 32-bit boot code");
+	params->cr3 = vm->mmu.pgd;
+	params->cr4 = cr4;
+	TEST_ASSERT(vm->arch.idt < (1ULL << 32),
+		    "idt must be within 32-bit address space for 32-bit boot code");
+	params->idtr.base = vm->arch.idt;
+	params->idtr.limit = kvm_get_default_idt_limit();
+	TEST_ASSERT(vm->arch.gdt < (1ULL << 32),
+		    "gdt must be within 32-bit address space for 32-bit boot code");
+	params->gdtr.base = vm->arch.gdt;
+	params->gdtr.limit = kvm_get_default_gdt_limit();
+}
+
 static const struct kvm_tdx_capabilities *tdx_read_capabilities(struct kvm_vm *vm)
 {
 	static struct kvm_tdx_capabilities *tdx_cap;

-- 
2.56.0.455.g6c5a503b38-goog

