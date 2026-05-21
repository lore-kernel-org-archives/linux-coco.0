Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8302C36DA1B
	for <linux-coco@lists.linux.dev>; Thu, 21 May 2026 23:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779405456; cv=none; b=oIAJWx0jRxuMTxO5aWmZJH/t3HKbbgBNFeRV+sCIgIqUSwehtL7WO0ZKgYGulMrnXovpxdJ/TFtaL2DoDk1xAbo5sUAfDnXR+onNyRM4wQd98n/PikHYAqs9zVEp/ZNfqdEMJ9VIENzFiCoCas1fCH2eDjcNQp1L3cLb/kUKGuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779405456; c=relaxed/simple;
	bh=aD3HXwrZjvyRYUcRcwFGw0yeikfKSuTlbRJOfhgmGv0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=l92ZdVZP4XsvHSs/sCN+lUZiIqaumGiw3QahvSYAj1IYpbynlHQaqkgGNU312hI2gW02Fs+kyR6htdzAXn5K70fP7h3L2b5/UoTuIlRun+NQS/92JuE0RWjWWohAYlgZzIcXCzUyZcBDG6QjcmQezGBQ1hD6bpxpdXGtzgPlwgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--wyihan.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jBYqOR74; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wyihan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jBYqOR74"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-c82c84be9c3so3103895a12.0
        for <linux-coco@lists.linux.dev>; Thu, 21 May 2026 16:17:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779405453; x=1780010253; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=t/YlviOZ+xjrC4BOAGoW0+eAq9T/F0XwYkP7ZCZ/m/M=;
        b=jBYqOR74jBg/LhP24gXd6H6v1IusTjmb/KyIfFpAXBdG9+fGb4ghEw2SU29i1D6suj
         Ce3QZYqGFxwyQScD12x9zvtV5FX5znEe1YzX4VHckdAcDUNOFrXuttYKOmvjzebMgzz4
         LI0m8qhpJ5zKZmH19Hh7P34TfNI9u+NN78mYftX7/s4LxDg2DFyvqdR+c4SmdAPrwwyc
         DU+UtdnlWQwOrNtpqu/jkz++X4abLD208Y+vwrBbv9Noxlzf1Iu5+JYPFHp34MQyXefb
         /01/OqNl7noHaV4+HZrm2EPEJxrHP2JiXhipH1cSwAmCL0IyetLiv79hxTj13H3VMu3h
         gL4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779405453; x=1780010253;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t/YlviOZ+xjrC4BOAGoW0+eAq9T/F0XwYkP7ZCZ/m/M=;
        b=kf6Bu7b90kbRNdfBguBALWoR0BxPuxvBfqSkJ5oSFzU4wPpI2AM4cJCM/pWldslvE5
         evqKggQ2lUQyrKa07PsQfXkEGUX5bYw5OahRuBZ4hM5AFjXIv0H/ifQyaICXUGXE/n5e
         uUQKBwlvaYxNgDpgt5kKAgf5gq5UQFL7gki8MZiyXZkbAXL6mABt1A+ZKB4x7unYHbEJ
         tXsTALjMl7V6JdOzlnPWTqkNgYYsRC/FWpC82QApAcKk0SJKKOd6gXZ+S8Xf02a2BOA3
         qbR2NmtoUJlsIvQKZsCDXFBSf76xKiC/ezI7Q1T8p6lyCoyzT9t7eoujmG9fvD3rVqGJ
         1erA==
X-Forwarded-Encrypted: i=1; AFNElJ+PhEXXQ0wjSia50GTuvx1CFOODISE2htA+2TY7IwlEVbWeNHnYZ34JzWDB4hUzC8AMdi+roKNsSExC@lists.linux.dev
X-Gm-Message-State: AOJu0Yz1zd4hCkQkizOdzrTJJO8yBJJt5m6t84RI9QmX1euJwEM4jzul
	xYzGhAnEzMNe2au0woMAUWYy29N0lSZoUrfbcj8wWmwX8O91Hmd9j2Ldyjix0rJmjb5Nxuo6jnr
	BOHdWVQ==
X-Received: from pgbeq12.prod.google.com ([2002:a05:6a02:268c:b0:c80:23f0:ab71])
 (user=wyihan job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:7289:b0:39b:89e0:2e37
 with SMTP id adf61e73a8af0-3b328cfdaacmr919032637.14.1779405452327; Thu, 21
 May 2026 16:17:32 -0700 (PDT)
Date: Thu, 21 May 2026 23:16:52 +0000
In-Reply-To: <20260521-tdx-selftests-v13-v13-0-6983ae4c3a4d@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260521-tdx-selftests-v13-v13-0-6983ae4c3a4d@google.com>
X-Developer-Key: i=wyihan@google.com; a=ed25519; pk=cRi0fKzS5BMxlHyHY2pJv3w/1zcgfYKr6EYGYppdMYc=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779405439; l=4707;
 i=wyihan@google.com; s=20260319; h=from:subject:message-id;
 bh=BN33KsLCHuN/RaDg069+CrjelUstN+iG9teg2YCApZE=; b=loF/v83C5t/5hp0/ahmXFWBR+WYQZ874vo2GsRCiAyg2Tya7wLx7XnsShach+t2H4yPM2PTlv
 2JG44wiBlf8AX4pd48vxzI+01vl6kdEwlFYBV63GwdxY3S75xE8vHsr
X-Mailer: b4 0.14.3
Message-ID: <20260521-tdx-selftests-v13-v13-11-6983ae4c3a4d@google.com>
Subject: [PATCH  v13 11/22] KVM: selftests: Set up TDX boot parameters region
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

Allocate memory for TDX boot parameters and define the utility functions
necessary to fill this memory with the boot parameters.

Co-developed-by: Ackerley Tng <ackerleytng@google.com>
Signed-off-by: Ackerley Tng <ackerleytng@google.com>
Signed-off-by: Sagi Shahar <sagis@google.com>
Signed-off-by: Lisa Wang <wyihan@google.com>
---
 .../selftests/kvm/include/x86/tdx/tdx_util.h       |  2 +
 tools/testing/selftests/kvm/lib/x86/processor.c    |  2 +
 tools/testing/selftests/kvm/lib/x86/tdx/tdx_util.c | 56 ++++++++++++++++++++++
 3 files changed, 60 insertions(+)

diff --git a/tools/testing/selftests/kvm/include/x86/tdx/tdx_util.h b/tools/testing/selftests/kvm/include/x86/tdx/tdx_util.h
index d66ea7bc85f9..9660ea9d2f31 100644
--- a/tools/testing/selftests/kvm/include/x86/tdx/tdx_util.h
+++ b/tools/testing/selftests/kvm/include/x86/tdx/tdx_util.h
@@ -41,5 +41,7 @@ static inline bool is_tdx_vm(struct kvm_vm *vm)
 
 void tdx_init_vm(struct kvm_vm *vm, u64 attributes);
 void tdx_vm_setup_boot_code_region(struct kvm_vm *vm);
+void tdx_vm_setup_boot_parameters_region(struct kvm_vm *vm, u32 nr_runnable_vcpus);
+void tdx_vm_load_common_boot_parameters(struct kvm_vm *vm);
 
 #endif /* SELFTESTS_TDX_TDX_UTIL_H */
diff --git a/tools/testing/selftests/kvm/lib/x86/processor.c b/tools/testing/selftests/kvm/lib/x86/processor.c
index dfabdfd17976..c7c4a37b3170 100644
--- a/tools/testing/selftests/kvm/lib/x86/processor.c
+++ b/tools/testing/selftests/kvm/lib/x86/processor.c
@@ -794,6 +794,8 @@ void kvm_arch_vm_post_create(struct kvm_vm *vm, unsigned int nr_vcpus)
 	if (is_tdx_vm(vm)) {
 		tdx_init_vm(vm, 0);
 		tdx_vm_setup_boot_code_region(vm);
+		tdx_vm_setup_boot_parameters_region(vm, nr_vcpus);
+		tdx_vm_load_common_boot_parameters(vm);
 	}
 
 	r = __vm_ioctl(vm, KVM_GET_TSC_KHZ, NULL);
diff --git a/tools/testing/selftests/kvm/lib/x86/tdx/tdx_util.c b/tools/testing/selftests/kvm/lib/x86/tdx/tdx_util.c
index bbfaa9af9c60..b16bf24f3ef1 100644
--- a/tools/testing/selftests/kvm/lib/x86/tdx/tdx_util.c
+++ b/tools/testing/selftests/kvm/lib/x86/tdx/tdx_util.c
@@ -3,10 +3,12 @@
 #include "kvm_util.h"
 #include "processor.h"
 #include "tdx/td_boot.h"
+#include "tdx/td_boot_asm.h"
 #include "tdx/tdx_util.h"
 
 /* Arbitrarily selected to avoid overlaps with anything else */
 #define TD_BOOT_CODE_SLOT	20
+#define TD_BOOT_PARAMETERS_SLOT	21
 
 #define X86_RESET_VECTOR	0xfffffff0ul
 #define X86_RESET_VECTOR_SIZE	16
@@ -51,6 +53,60 @@ void tdx_vm_setup_boot_code_region(struct kvm_vm *vm)
 	hva[2] = 0xcc;
 }
 
+void tdx_vm_setup_boot_parameters_region(struct kvm_vm *vm, u32 nr_runnable_vcpus)
+{
+	size_t boot_params_size =
+		sizeof(struct td_boot_parameters) +
+		nr_runnable_vcpus * sizeof(struct td_per_vcpu_parameters);
+	int npages = DIV_ROUND_UP(boot_params_size, PAGE_SIZE);
+	gpa_t gpa;
+
+	vm_userspace_mem_region_add(vm, VM_MEM_SRC_ANONYMOUS,
+				    TD_BOOT_PARAMETERS_GPA,
+				    TD_BOOT_PARAMETERS_SLOT, npages,
+				    KVM_MEM_GUEST_MEMFD);
+	gpa = vm_phy_pages_alloc(vm, npages, TD_BOOT_PARAMETERS_GPA, TD_BOOT_PARAMETERS_SLOT);
+	TEST_ASSERT(gpa == TD_BOOT_PARAMETERS_GPA, "Failed vm_phy_pages_alloc\n");
+
+	virt_map(vm, TD_BOOT_PARAMETERS_GPA, TD_BOOT_PARAMETERS_GPA, npages);
+}
+
+void tdx_vm_load_common_boot_parameters(struct kvm_vm *vm)
+{
+	struct td_boot_parameters *params =
+		addr_gpa2hva(vm, TD_BOOT_PARAMETERS_GPA);
+	u32 cr4;
+
+	TEST_ASSERT_EQ(vm->mode, VM_MODE_PXXVYY_4K);
+
+	cr4 = kvm_get_default_cr4();
+	if (vm->mmu.pgtable_levels == 5)
+		cr4 |= X86_CR4_LA57;
+
+	/* TDX spec 11.6.2: CR4 bit MCE is fixed to 1 */
+	cr4 |= X86_CR4_MCE;
+
+	/* TDX spec 11.6.2: CR4 bit VMXE and SMXE are fixed to 0 */
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
+	TEST_ASSERT(params->cr0 != 0, "cr0 should not be 0");
+	TEST_ASSERT(params->cr3 != 0, "cr3 should not be 0");
+	TEST_ASSERT(params->cr4 != 0, "cr4 should not be 0");
+	TEST_ASSERT(params->gdtr.base != 0, "gdt base address should not be 0");
+	TEST_ASSERT(params->idtr.base != 0, "idt base address should not be 0");
+}
+
 static struct kvm_tdx_capabilities *tdx_read_capabilities(struct kvm_vm *vm)
 {
 	struct kvm_tdx_capabilities *tdx_cap = NULL;

-- 
2.54.0.746.g67dd491aae-goog

