Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DBF3533596
	for <linux-coco@lists.linux.dev>; Thu,  1 Oct 2026 19:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790883536; cv=none; b=g+CfPxtDH5pjN44vn+3YSlU5On35W1egZcy5RtkF87wYkAAQZB4NQ9kz7j6sIUlgnjqtxy/8uBeiGRjkYIiWaOCSP9FdeLK/DAQb0nlJAIFBuACWQkD9hid00P3CrpO+AWBrGu21lj6+Mm0oEuk1Nl1GOQKV88V57fJeLxdKwtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790883536; c=relaxed/simple;
	bh=HlbnkIcJPfFFIitWm+gEVqEsBm9wc3VToMUwIji4ft4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=B2YditFc8SzrpBCtaWNdC635DELJoev/AWI4+UwAhEfmSOyMQM3Qz/DPjtN2CpAgWqYgtAxWi9ZUYjoAF/pF+C9HEw/xyPWBNRjTbQlkNjBZRcizgt8xKa557vPHP+ln2M44WU6/csMhu7c3tG5wIyuOtNDWOvCn3dabo7BFW6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--wyihan.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZzktHe+v; arc=none smtp.client-ip=209.85.215.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wyihan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZzktHe+v"
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc7ce00b8c6so2451422a12.2
        for <linux-coco@lists.linux.dev>; Thu, 01 Oct 2026 12:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790883532; x=1791488332; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KSQecXUu7UgGshRnwEk4eE8YoqvOs6quNBkSkvEKtX0=;
        b=ZzktHe+vfYUF3Z71HrN9lCrCBzRxEYAWpqiU+4RJfWtVxAessmz2lgNqEdordjSmhJ
         6Px7zURCCkXfIbOKToE9qADfqF33+9nEA6qT58BW4kKTPepAr6kUjLBvc5Ou+lekloZD
         IJUTGH0QSoUgh40Rgc5yMcHpTGLC4tMXGQJdJ/cYVgYrwasTf0OgJWUnd94X9qqE14JX
         g8Qw1EwuU8YOPx82dMCv80zKjsGOmVKs2Q+446fQM+gdWo6ywzHjowhBz4LdfJZXg8XT
         rpX7dflr2fhXjeBdhm4YvY72VU7nB0pvIa/tSo9ukzGksNGATRZ/l7d9ZjgENnGzi8GE
         nLTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790883532; x=1791488332;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KSQecXUu7UgGshRnwEk4eE8YoqvOs6quNBkSkvEKtX0=;
        b=Q0Ql9k2PwAX0Rg1STXRyar+0ky2vrLmOkWWURhRU3Se+rlh++kLyuC2qH/++rS+7on
         +8foxpbkexXIhMNcZxn6y2N35JwAxY03rc1mXUC2L09YhNllX9DChKVvo0lEpf7kkQzk
         8uVN2362oG9Kmo5sEEpfRQlHLt8hqNaMEofpu+5i3NUFQsHHJTTGwrSJ14FEcmONX3oz
         aiGwQ2arvEB+fj4EK+y5zT+GEB3hW64S79rrOSVzGer2tW1NbKs2B3tRXI54DZI0hmsN
         5VFkh6t53mJ1HweRCcpNH/9S9ET8o8O1qw+pTf6k+X/X+42HTswLWtyafjgBNKMcGHse
         g2WA==
X-Forwarded-Encrypted: i=1; AKwUvBxY7u8H1T26KenMgoKPptuLvu9O1TNPtnbIzrOm0p2KYtfbxiyGRUDK9Hc/t2QF6EvsJA+WlzGoiPA+@lists.linux.dev
X-Gm-Message-State: AFuF++nA2AdjERinhrpIIVTK2Bs0wSC47XHEKHp077HPxulUS2oixE10
	YhwMa+TiSz5WH+JzJGDw37Zr8SuhemWYM8WCBU6O/jf31cDVVH+gxiBgtF+GFkBGtPfVvk6bSgw
	nqpVgJA==
X-Received: from pgdu12.prod.google.com ([2002:a05:6a02:2f4c:b0:cc7:db17:7dd0])
 (user=wyihan job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:9191:b0:3d1:2dc5:7d37
 with SMTP id adf61e73a8af0-3e0bca3a778mr486774637.3.1790883530776; Thu, 01
 Oct 2026 12:38:50 -0700 (PDT)
Date: Thu, 01 Oct 2026 19:37:37 +0000
In-Reply-To: <20261001-tdx-selftests-v15-0-7c62a5d8a992@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20261001-tdx-selftests-v15-0-7c62a5d8a992@google.com>
X-Developer-Key: i=wyihan@google.com; a=ed25519; pk=cRi0fKzS5BMxlHyHY2pJv3w/1zcgfYKr6EYGYppdMYc=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790883521; l=4427;
 i=wyihan@google.com; s=20260319; h=from:subject:message-id;
 bh=Jw1tvFOPTGPquV0fdAJ8aVKlQMb5t2Jsm3NIxuDfRDU=; b=ujgxpIU6cy06HUXqBMMU1hZz8l9eSOhPP/wFsu38uOtxg7OjYXGFme+jZIW4pPWgqrNBjlL2E
 bC5QidgIdJMDafra8lm5Mt3pmaWYG400j7/9vvDrrdkfJFlkZAlq6bv
X-Mailer: b4 0.14.3
Message-ID: <20261001-tdx-selftests-v15-10-7c62a5d8a992@google.com>
Subject: [PATCH v15 10/23] KVM: selftests: Set up TDX boot parameters region
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
---
 .../selftests/kvm/include/x86/tdx/tdx_util.h       |  2 +
 tools/testing/selftests/kvm/lib/x86/processor.c    |  2 +
 tools/testing/selftests/kvm/lib/x86/tdx/tdx_util.c | 48 ++++++++++++++++++++++
 3 files changed, 52 insertions(+)

diff --git a/tools/testing/selftests/kvm/include/x86/tdx/tdx_util.h b/tools/testing/selftests/kvm/include/x86/tdx/tdx_util.h
index e14566919601..e529c587aeae 100644
--- a/tools/testing/selftests/kvm/include/x86/tdx/tdx_util.h
+++ b/tools/testing/selftests/kvm/include/x86/tdx/tdx_util.h
@@ -48,5 +48,7 @@ static inline bool is_tdx_vm(struct kvm_vm *vm)
 
 void tdx_init_vm(struct kvm_vm *vm);
 void tdx_vm_setup_boot_code_region(struct kvm_vm *vm);
+void tdx_vm_setup_boot_parameters_region(struct kvm_vm *vm, u32 nr_runnable_vcpus);
+void tdx_vm_load_common_boot_parameters(struct kvm_vm *vm);
 
 #endif /* SELFTESTS_TDX_TDX_UTIL_H */
diff --git a/tools/testing/selftests/kvm/lib/x86/processor.c b/tools/testing/selftests/kvm/lib/x86/processor.c
index e3cf56c9c852..da430d4e7765 100644
--- a/tools/testing/selftests/kvm/lib/x86/processor.c
+++ b/tools/testing/selftests/kvm/lib/x86/processor.c
@@ -821,6 +821,8 @@ void kvm_arch_vm_post_create(struct kvm_vm *vm, unsigned int nr_vcpus)
 	if (is_tdx_vm(vm)) {
 		tdx_init_vm(vm);
 		tdx_vm_setup_boot_code_region(vm);
+		tdx_vm_setup_boot_parameters_region(vm, nr_vcpus);
+		tdx_vm_load_common_boot_parameters(vm);
 	}
 
 	r = __vm_ioctl(vm, KVM_GET_TSC_KHZ, NULL);
diff --git a/tools/testing/selftests/kvm/lib/x86/tdx/tdx_util.c b/tools/testing/selftests/kvm/lib/x86/tdx/tdx_util.c
index 6187cfcf6a74..e348507a6be8 100644
--- a/tools/testing/selftests/kvm/lib/x86/tdx/tdx_util.c
+++ b/tools/testing/selftests/kvm/lib/x86/tdx/tdx_util.c
@@ -8,6 +8,7 @@
 
 /* Arbitrarily selected to avoid overlaps with anything else */
 #define TD_BOOT_CODE_SLOT	20
+#define TD_BOOT_PARAMETERS_SLOT	21
 
 #define X86_RESET_VECTOR	0xfffffff0ul
 
@@ -38,6 +39,53 @@ void tdx_vm_setup_boot_code_region(struct kvm_vm *vm)
 		    (unsigned long)addr_gpa2hva(vm, X86_RESET_VECTOR), (unsigned long)hva);
 }
 
+void tdx_vm_setup_boot_parameters_region(struct kvm_vm *vm, u32 nr_runnable_vcpus)
+{
+	size_t boot_params_size = sizeof(struct td_boot_parameters) +
+		nr_runnable_vcpus * sizeof(struct td_per_vcpu_parameters);
+	int npages = DIV_ROUND_UP(boot_params_size, PAGE_SIZE);
+	const u64 gmem_flags = 0;
+	gpa_t gpa;
+
+	vm_mem_add(vm, VM_MEM_SRC_SHMEM, TD_BOOT_PARAMETERS_GPA,
+		   TD_BOOT_PARAMETERS_SLOT, npages,
+		   KVM_MEM_GUEST_MEMFD, -1, 0, gmem_flags);
+	gpa = vm_phy_pages_alloc(vm, npages, TD_BOOT_PARAMETERS_GPA, TD_BOOT_PARAMETERS_SLOT);
+	TEST_ASSERT(gpa == TD_BOOT_PARAMETERS_GPA, "Failed vm_phy_pages_alloc\n");
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
+	params->idtr.base = vm->arch.idt;
+	params->idtr.limit = kvm_get_default_idt_limit();
+	params->gdtr.base = vm->arch.gdt;
+	params->gdtr.limit = kvm_get_default_gdt_limit();
+
+	TEST_ASSERT(params->idtr.base < (1ULL << 32),
+		    "idt must be within 32-bit address space for 32-bit boot code");
+	TEST_ASSERT(params->gdtr.base < (1ULL << 32),
+		    "gdt must be within 32-bit address space for 32-bit boot code");
+}
+
 static const struct kvm_tdx_capabilities *tdx_read_capabilities(struct kvm_vm *vm)
 {
 	static struct kvm_tdx_capabilities *tdx_cap;

-- 
2.56.0.rc1.315.gc6ed9934b7-goog

