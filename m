Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD59C4657E3
	for <linux-coco@lists.linux.dev>; Wed, 22 Jul 2026 23:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784762068; cv=none; b=BhDC9aXiMvIMc5uxkunADe/uJvJJ3wJ07Sgq1g3CfmHXozcOsbFMf4JBiyk/SPPgXrSn4XChJUjem0lGSX9LjqFBXxvOEB+norwBmDXvombwXVOB86xailwkoGVZRtPTeGVuycBLdBopi/qg5DjGAqRfceyd0sGqF/6avgg5SfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784762068; c=relaxed/simple;
	bh=nq+rGQSjfz69WWYgD4OukIBKqsD4IMbB46h0B8wIBqw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=kz9oTVUC40BhAPGlGj8mKRLw2qld6csyGkZ7XgRqM3X60PYw++EfW0NXINq4XTU7pbxX6Q5FfLmJ34eXDMPzYJ+LXqry0GGWR7srkRvYIe41JbqN5E0d5VcXtbQcYvwAd3JQI9jbXT4ZtUK12BgRfw0UarEEjOXfeBzUQUhqF2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--wyihan.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=k6+5nDmR; arc=none smtp.client-ip=209.85.214.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wyihan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="k6+5nDmR"
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2caf4173b1cso810285ad.3
        for <linux-coco@lists.linux.dev>; Wed, 22 Jul 2026 16:14:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784762065; x=1785366865; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IBwwN+PCRRt/xqJfZcQgxZJHRiT6JnsNy2fU/hkSPUs=;
        b=k6+5nDmR+khwqCuVt6mXUWtAX+slXrYNLNu3VdMIgMWc+hsr4Y/kZOi4OITL+DCtA6
         JIUipmY/cu4o8BO5dzgb3NKuS8mzTXnAhCLL8n1I4t/MRcECrFL74w7Cf67Zk3K6Or4/
         LMkOQYC3mAqowRV0fVkUtkP6ZQ/XqUVdK+oZTOroePhMddJ0HhQp8QdCdtgckAW26xHo
         7L2plcrOQYk9Xr5yt+Y5RI/7KfSfuTX60UY+XQSskJ2nko448tWI1YDRmmzhKRhy+xL5
         U+4iEDhD98vhsTqKlQ97/cmWQhHB8s7farTyS3mPASDTh9Vp+7U2n7a5qpPKipdoTron
         jC2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784762065; x=1785366865;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IBwwN+PCRRt/xqJfZcQgxZJHRiT6JnsNy2fU/hkSPUs=;
        b=QxYGGFWyx9DDiAuHZRLozRN3LJGvP7zuni2Qw3qxH2SQ9kshBAcQf30MV+48R/I6F2
         uVRGAptJvTJ0H8B+1I8chVeap5WwdN+anmEZKWxFkMFS+Tc4mjhl9x0NxTqfTaTVBmm7
         d1+PdOEGhbMI55Y5FV5ypRKO8EVhq/CDGiEVZjCcvPiuolFe/SPXoyBr4g2vuchnPdWy
         +bIxh/JN45tjonwdGXaTXN0KpsHnlGsuwX63hUKIbSfcLdAONB575t8VxyJk7N2U+vF8
         JJnjfBMQvBMHWFvhAXN7h8QkWvhy25FKJT07oOcz/FgMaAI2l14vrZqRobIIhP9yRR9T
         WbzQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq4LtS21onPYTwSBO9pole237HXO2By9kgtni2Oxxc0jLVWrTgM6XrzhYwN5orBEt4g1YogyfHlGGgH@lists.linux.dev
X-Gm-Message-State: AOJu0Ywz35rYSIRY6rGyudDL/6buZod0tkJtoDeE3rIU0MdWmnqSFDjk
	HEua2TvIGnlAQjaskKaDjccXrYcrzM1vsK9q5A5k2VgKhdt6tZKxcyLvwqIyRswxbLZtS/mB386
	lEVKzFg==
X-Received: from plgg20.prod.google.com ([2002:a17:902:c394:b0:2cb:14cf:72dc])
 (user=wyihan job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:1210:b0:2cc:aa36:c046
 with SMTP id d9443c01a7336-2cfa71d950emr9446725ad.14.1784762065042; Wed, 22
 Jul 2026 16:14:25 -0700 (PDT)
Date: Wed, 22 Jul 2026 23:13:14 +0000
In-Reply-To: <20260722-tdx-selftests-v14-0-15ad654a50db@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260722-tdx-selftests-v14-0-15ad654a50db@google.com>
X-Developer-Key: i=wyihan@google.com; a=ed25519; pk=cRi0fKzS5BMxlHyHY2pJv3w/1zcgfYKr6EYGYppdMYc=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784762054; l=3389;
 i=wyihan@google.com; s=20260319; h=from:subject:message-id;
 bh=bhsiRn8lBZBv3P1/M5hjiDEL+wbuc6DIjb+dyuyxMZk=; b=MjwJBpXr5slFqnNqNoqMOAbg5ESdyMWxsErXuis54CiqGGeWsfipYNb7xccaJwXQKWLISTVgd
 dWxezMqwjNfAHbOaYj52U89ipH/VMVqUmb4NRZY66JG1If0B76bbxuX
X-Mailer: b4 0.14.3
Message-ID: <20260722-tdx-selftests-v14-9-15ad654a50db@google.com>
Subject: [PATCH v14 09/22] KVM: selftests: Expose functions to get default
 sregs values
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

TDX can't set sregs values directly using KVM_SET_SREGS. Expose the
default values of certain sregs used by TDX VMs so they can be set
manually.

Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
Signed-off-by: Sagi Shahar <sagis@google.com>
Reviewed-by: Ira Weiny <ira.weiny@intel.com>
Signed-off-by: Lisa Wang <wyihan@google.com>
---
 .../testing/selftests/kvm/include/x86/processor.h  | 35 ++++++++++++++++++++++
 tools/testing/selftests/kvm/lib/x86/processor.c    | 20 ++++---------
 2 files changed, 41 insertions(+), 14 deletions(-)

diff --git a/tools/testing/selftests/kvm/include/x86/processor.h b/tools/testing/selftests/kvm/include/x86/processor.h
index 76180dfaffea..7e00c9414595 100644
--- a/tools/testing/selftests/kvm/include/x86/processor.h
+++ b/tools/testing/selftests/kvm/include/x86/processor.h
@@ -29,6 +29,10 @@ extern u64 guest_tsc_khz;
 #define MAX_NR_CPUID_ENTRIES 100
 #endif
 
+#ifndef NUM_INTERRUPTS
+#define NUM_INTERRUPTS 256
+#endif
+
 #define NONCANONICAL 0xaaaaaaaaaaaaaaaaull
 
 /* Forced emulation prefix, used to invoke the emulator unconditionally. */
@@ -1564,4 +1568,35 @@ u64 *tdp_get_pte(struct kvm_vm *vm, u64 l2_gpa);
 
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
index 97acc5aaf7b7..ad75e19bb3a2 100644
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
@@ -647,17 +643,13 @@ static void vcpu_init_sregs(struct kvm_vm *vm, struct kvm_vcpu *vcpu)
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
2.55.0.229.g6434b31f56-goog

