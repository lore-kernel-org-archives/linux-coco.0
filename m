Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AC93531610
	for <linux-coco@lists.linux.dev>; Thu,  1 Oct 2026 19:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790883533; cv=none; b=rfbLqGhtBOjmOA2zApRyh5DFj/g6NAib1wzwWmqZpYLdC3icILWf5HGYIr4fdF9y16PLGpVF1Qe6yyZbtbDaq9bpUBBy5Cc8r6InjoipJALBEaY25JiDhXbbtWENODQkaXWJyOtCwN76ggBdU/z7bgLZ3ftL+3d9EmlGJksfToA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790883533; c=relaxed/simple;
	bh=7l4Q+rDowHfpli+CXiLobxkRfzj0K0AnSNqvgkTEDRo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=utniWfp20lydSjo8UsdFkQXKClgdhvTqlyRYOYP3lbv4x5VmsJrZCLl2ynbNFcn4YGTRMJJu0kjrWAvZXgUdUHUf68tJYwPDOM+3Voce+kzR2BG14fU96dw0mESXCEypGjhsGkhQEbKhzoJHiMjJMXN4Va3cOIV70i9/leNpFfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--wyihan.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=M4KcvhB3; arc=none smtp.client-ip=209.85.214.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wyihan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="M4KcvhB3"
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2e2d83bb68cso21971155ad.0
        for <linux-coco@lists.linux.dev>; Thu, 01 Oct 2026 12:38:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790883529; x=1791488329; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yaiP3zKcJOVKeubnF5b9VUytsKLxmEjlQwuwQfnGsys=;
        b=M4KcvhB3kQRSrZ/fGsx/CTkOGSGpIWy2t/tiXRIJSWPt5XjvZaqGvBbRaGM7WXMWMU
         B2/1IS9qjU88uAAHQH5chwLf4Buf1KPjaaveBEmRyvm2X+s0/TmeFsEodrBHsbc0Vp+L
         kbMtlBIc3EfluSxBUV+QDLnBRvryw34n9+xHt/QZkQXHYzehO6N/X7RyBVykSjGdKvmD
         JH8OtA7/EgY2NMgaXlqINwA/JbCcsASvT0rFTN93e3fwRThA1+oF4dDci2Znxa1iqvjS
         bQfPR5LfW+9y9SwGkVwak8qmRLll75Qe6zdKBh7T3hjS/eLtXLHfXlrjp7HyPL4sBNhs
         G9eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790883529; x=1791488329;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yaiP3zKcJOVKeubnF5b9VUytsKLxmEjlQwuwQfnGsys=;
        b=CWcZmhJkBPHFrmJT2XUWY2q8yUiGzK1MpTTGbLXNBw1XHuiqKy7ADWqIu6YvhxGf8l
         2WTr1+oB9OpXV9BwDEndB4nMqHKOMufF//2fdeM2NDCbA5yMnzpN1vF0Cyfgh/8+xCX6
         k0aGtDksfSZeQ322BncfCS1wUDs2lkLEKMuSvwKS652UxDOt/xd06EkRRz1cGpOA8k6z
         oAI0Y5NQkRuFujzMBd1GXuYGBqB4wsiRXee7OUpk/K4+monPYOuOVUhTokBoFZGYLJan
         oTYutla/QNbVjhvWVuAYlUWGiSzp0Oz0hVPovAwm81/brH/DQl7ZhpKKdGjvkVaI6CUd
         Y2zw==
X-Forwarded-Encrypted: i=1; AKwUvBwP4FBLRFdZhyGe1Oe1pphsIdgOBtvQmRYUQSz9Nbd8BOvZ5yUwWcGOULWTC7sWmFvqxHNmgfdvnGG7@lists.linux.dev
X-Gm-Message-State: AFq9FYKt+/z8eyTB4LHqzeKxwfG9+7LRq5ZvLGnYndpsO27YU75eZAz5
	IALy5L87RMbOpYhWcJiSnZTp9Kluh2gRY9nUWXpwO9AkYBouvojfnt3yR5fdDAp+P8jeQ3B4AQu
	f/1KVKw==
X-Received: from pldv18.prod.google.com ([2002:a17:902:ca92:b0:2e1:32ec:8412])
 (user=wyihan job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:3bc8:b0:2dd:c053:e662
 with SMTP id d9443c01a7336-2e49b6a4af2mr4352805ad.40.1790883529087; Thu, 01
 Oct 2026 12:38:49 -0700 (PDT)
Date: Thu, 01 Oct 2026 19:37:35 +0000
In-Reply-To: <20261001-tdx-selftests-v15-0-7c62a5d8a992@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20261001-tdx-selftests-v15-0-7c62a5d8a992@google.com>
X-Developer-Key: i=wyihan@google.com; a=ed25519; pk=cRi0fKzS5BMxlHyHY2pJv3w/1zcgfYKr6EYGYppdMYc=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790883521; l=3448;
 i=wyihan@google.com; s=20260319; h=from:subject:message-id;
 bh=5WwoSOJ4B7PQoIbZABgnDJo9uu2Dxyr72z45Xa0sFQ8=; b=zeie09mBOMiEchj6pJHrL1dy0T3WB7Fi6Efxx9MJGcW5MPoN6WOCr7uRhw1o39LtrMJpxVmmC
 nqHIEOrabJbAucKdlBVNet7QXEzqn+zcOJtOU1Y0B4R8P6rroWfrgw5
X-Mailer: b4 0.14.3
Message-ID: <20261001-tdx-selftests-v15-8-7c62a5d8a992@google.com>
Subject: [PATCH v15 08/23] KVM: selftests: Expose functions to get default
 sregs values
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
	linux-kernel@vger.kernel.org, x86@kernel.org, Lisa Wang <wyihan@google.com>, 
	Ira Weiny <iweiny@kernel.org>
Content-Type: text/plain; charset="utf-8"

From: Sagi Shahar <sagis@google.com>

TDX can't set sregs values directly using KVM_SET_SREGS. Expose the
default values of certain sregs used by TDX VMs so they can be set
manually.

Signed-off-by: Sagi Shahar <sagis@google.com>
Signed-off-by: Lisa Wang <wyihan@google.com>
Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
Reviewed-by: Ira Weiny <ira.weiny@intel.com>
Reviewed-by: Xiaoyao Li <xiaoyao.li@intel.com>
---
 .../testing/selftests/kvm/include/x86/processor.h  | 35 ++++++++++++++++++++++
 tools/testing/selftests/kvm/lib/x86/processor.c    | 20 ++++---------
 2 files changed, 41 insertions(+), 14 deletions(-)

diff --git a/tools/testing/selftests/kvm/include/x86/processor.h b/tools/testing/selftests/kvm/include/x86/processor.h
index 08b7b194f213..8854ee052d29 100644
--- a/tools/testing/selftests/kvm/include/x86/processor.h
+++ b/tools/testing/selftests/kvm/include/x86/processor.h
@@ -30,6 +30,10 @@ extern struct kvm_mmu guest_mmu;
 #define MAX_NR_CPUID_ENTRIES 100
 #endif
 
+#ifndef NUM_INTERRUPTS
+#define NUM_INTERRUPTS 256
+#endif
+
 #define NONCANONICAL 0xaaaaaaaaaaaaaaaaull
 
 /* Forced emulation prefix, used to invoke the emulator unconditionally. */
@@ -1651,4 +1655,35 @@ u64 *tdp_get_pte(struct kvm_vm *vm, u64 l2_gpa);
 
 bool sys_clocksource_is_based_on_tsc(void);
 
+static inline u16 kvm_get_default_idt_limit(void)
+{
+	return NUM_INTERRUPTS * sizeof(struct idt_entry) - 1;
+}
+
+static inline u16 kvm_get_default_gdt_limit(void)
+{
+	return getpagesize() - 1;
+}
+
+static inline u64 kvm_get_default_cr0(void)
+{
+	return X86_CR0_PE | X86_CR0_NE | X86_CR0_PG;
+}
+
+static inline u64 kvm_get_default_cr4(int pgtable_levels)
+{
+	u64 cr4 = X86_CR4_PAE | X86_CR4_OSFXSR;
+
+	if (kvm_cpu_has(X86_FEATURE_XSAVE))
+		cr4 |= X86_CR4_OSXSAVE;
+	if (pgtable_levels == 5)
+		cr4 |= X86_CR4_LA57;
+	return cr4;
+}
+
+static inline u64 kvm_get_default_efer(void)
+{
+	return EFER_LME | EFER_LMA | EFER_NX;
+}
+
 #endif /* SELFTEST_KVM_PROCESSOR_H */
diff --git a/tools/testing/selftests/kvm/lib/x86/processor.c b/tools/testing/selftests/kvm/lib/x86/processor.c
index 1944eb2489d8..0c3779e7c275 100644
--- a/tools/testing/selftests/kvm/lib/x86/processor.c
+++ b/tools/testing/selftests/kvm/lib/x86/processor.c
@@ -15,10 +15,6 @@
 #include "tdx/tdx_util.h"
 #include "vmx.h"
 
-#ifndef NUM_INTERRUPTS
-#define NUM_INTERRUPTS 256
-#endif
-
 gva_t exception_handlers;
 bool host_cpu_is_amd;
 bool host_cpu_is_intel;
@@ -650,17 +646,13 @@ static void vcpu_init_sregs(struct kvm_vm *vm, struct kvm_vcpu *vcpu)
 	vcpu_sregs_get(vcpu, &sregs);
 
 	sregs.idt.base = vm->arch.idt;
-	sregs.idt.limit = NUM_INTERRUPTS * sizeof(struct idt_entry) - 1;
+	sregs.idt.limit = kvm_get_default_idt_limit();
 	sregs.gdt.base = vm->arch.gdt;
-	sregs.gdt.limit = getpagesize() - 1;
-
-	sregs.cr0 = X86_CR0_PE | X86_CR0_NE | X86_CR0_PG;
-	sregs.cr4 |= X86_CR4_PAE | X86_CR4_OSFXSR;
-	if (kvm_cpu_has(X86_FEATURE_XSAVE))
-		sregs.cr4 |= X86_CR4_OSXSAVE;
-	if (vm->mmu.pgtable_levels == 5)
-		sregs.cr4 |= X86_CR4_LA57;
-	sregs.efer |= (EFER_LME | EFER_LMA | EFER_NX);
+	sregs.gdt.limit = kvm_get_default_gdt_limit();
+
+	sregs.cr0 = kvm_get_default_cr0();
+	sregs.cr4 |= kvm_get_default_cr4(vm->mmu.pgtable_levels);
+	sregs.efer |= kvm_get_default_efer();
 
 	kvm_seg_set_unusable(&sregs.ldt);
 	kvm_seg_set_kernel_code_64bit(&sregs.cs);

-- 
2.56.0.rc1.315.gc6ed9934b7-goog

