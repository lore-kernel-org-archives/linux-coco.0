Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793922474;
	b=ioUTt0FgHbzRPCLbQiiD14tSQJBZ8YiD06CQfHxzhvbz6reoMEJ/QJnOqNdrtCNJjf85
	 JvifjyG10qqlsAaHJsf9VBPMUfOkuhJCewnO1bP/Nj/J9ZMtv+++6ydNW0JQJGdtOFHIc
	 5AoWbd4O1SlQQn0YPfCaOx5oxeC01q5rLQo1WIClsn46z/yexiMSbY7IEPpWqbNdklgsg
	 UKmaxLDti7cI6FzXcBFQhcFEUdjtORelop8iQBYG9PpnqOmu5qehzbb5a6GT4MGxuC3F2
	 //GAaOaR0+Mfc8Pr1Hji5px0QyoPpI04ppHgypztmURR0ZI0HXR4YDYzhfNOk399xOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793922474;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Developer-Key:X-Developer-Signature:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=dltJxZOaaLIRzlIDxCRL5isHAiYz3/DbONY34y9BZj8=;
	b=POVwVmMXXvXxBPAWFXArH/nkUOi8F1xfNdsqdL4thkuNk6L06Gl9qwyqJfCakZSAKx9C
	 uMR7Rqb1vuQMynVJ3MUAAG3h6pu9uBRr6IrPdhZPbDq4VdrBWGXi1wwkWMrly5U/G6f/2
	 mi3TgG5XbUHteQrqKT2vAOIk0TyifHP8OTY/hjN8OCSAXmYucH7e6aP6tiueGNQfDVEEw
	 RFQLXy/8zlDGlYBL+nZKEQ6lgVispbop9nonWL7FnL5gLort5tLNK1C9YwOzCYt7aKj5q
	 3YNxWilZNyuUSr+bwOYtfTq5WTwKcDbWuOq3F1X/PGeM0iRr2l8YMHo7e/3HqlFprFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--wyihan.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=RN8jGe4p;
	arc=none smtp.remote-ip=209.85.214.199
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86919606EE9C
	for <linux-coco@lists.linux.dev>; Thu,  5 Nov 2026 23:47:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86919606EE9C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wyihan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=RN8jGe4p
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2eb5375cd68so609445ad.0
        for <linux-coco@lists.linux.dev>; Thu, 05 Nov 2026 15:47:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793922474; x=1794527274; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dltJxZOaaLIRzlIDxCRL5isHAiYz3/DbONY34y9BZj8=;
        b=RN8jGe4pQnXh8+1lVg6azaVZU8ticW+p+GNQ7KTCT2yYoJs31PypOnCpLJMvF5XM46
         DAERECyVb+hjECmCpyjSvKobyH1OGV6r7zb26Jy9IieXkJmbTGEwTUH1iycAdm5NC5Tq
         qSwkFiGvMc0iyU8PL1XKgtGyYfmJvyHjPK4unQWNqL91JaJPYNNSLqvgR79G/YcDP7Rf
         DR6StoUbIuz1PScYCog20ioBLqacyhaP7sCoRPPlyZXlKyk5Xsg90JFADb7Lb1vnt/O4
         WlbasQ/olf8LZRqgwwqgzjv7zfmpV6vx9JaJEqw1dXNWqj0p3C/hyXnDYwIDw/80s5VT
         LlLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793922474; x=1794527274;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dltJxZOaaLIRzlIDxCRL5isHAiYz3/DbONY34y9BZj8=;
        b=QJwlQDCdITRxEzlLNZx3sA/ozx/RkcscrJOJ/VcpV5JMKmsSAEv84ygBMKSwVzAlbF
         jAReI5+qvhZ6xVy/O9yQbwRyhfg0RH8N0JiP82k/0+vq7EudrAKefedw98tlaRh2dJzX
         Y9PE7gHhvcfF5v1kzI2474oww8V+F+ho0ddPAjc6ogBGn1uEOLHYcZRWGVulIFVWvrH1
         V3TKcjH+J+fL8ccbWt2LMX2/wgOaQBCh04dtzxIMIbTvcJWUtNAj+duA4ZN1yL9jCAH+
         QAjZzWrhYP5p4xIhpkvtH6KRXxM6ZBwTceb1/lb6F0zmCECjvsqVvfXe9/i+FS+ZJ5M7
         7SIw==
X-Forwarded-Encrypted: i=1; AKwUvByuT+arDM5FDFal+jjtNFa5ePZP47rh2jmcj3BMZR1BnIWSYR46VtpC9QGNrEBgk6ItItaifHlOvcrb@lists.linux.dev
X-Gm-Message-State: APuU4Z/cU/7ifLqjeP3TVgxjU4kAKVJr8ioITl0evcPDC95a3SF+enCb
	PBsFf7o87EbJZ5qly3e+HDeO6BijIOYf0y1MCgXmH4pMfDcPKRPiLdlc6ZMkQYB3fN82GuBg2kC
	XBab2PQ==
X-Received: from plbkk12.prod.google.com ([2002:a17:903:70c:b0:2e9:6e08:e249])
 (user=wyihan job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:f687:b0:2df:ad58:cf54
 with SMTP id d9443c01a7336-2ed40bdde10mr11672345ad.34.1793922473653; Thu, 05
 Nov 2026 15:47:53 -0800 (PST)
Date: Thu, 05 Nov 2026 23:46:56 +0000
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793922452; l=4756;
 i=wyihan@google.com; s=20260319; h=from:subject:message-id;
 bh=xg4VCXAEcI/squiJR5LykngUMIA2TG3fuJmNzqsXTYk=; b=Aqkp8MzL3DHBTEXTKQtgCet5lNRmh6G+KNMhKEoKvCWwSpBvnv7ANRei87X+c6tDZollC/ud7
 wcGy4KzQUpPAsQ4mHa1U8bQqxgIQjM6O+47atZY3EJ7zJ0toeuQkto1
X-Mailer: b4 0.14.3
Message-ID: <20261105-tdx-selftests-v16-12-2024e8fa517a@google.com>
Subject: [PATCH v16 12/20] KVM: selftests: Call KVM_TDX_INIT_VCPU when
 creating a new TDX vcpu
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

TDX VMs need to issue the KVM_TDX_INIT_VCPU ioctl for each vcpu after
vcpu creation.

KVM_TDX_INIT_VCPU has a strict prerequisite for the CPUID state. To
satisfy this requirement, call KVM_TDX_GET_CPUID and KVM_SET_CPUID2 to
pull the CPUID configuration from the TDCS and commit it into KVM,
allowing KVM_TDX_INIT_VCPU to succeed.

Additionally, unlike tdx_vm_ioctl(), tdx_vcpu_ioctl() doesn't check
hw_error. KVM's vCPU-scoped TDX ioctl handlers don't propagate SEAMCALL
errors into hw_error: the error is handled in the kernel and only an
errno is returned. Checking the ioctl's return value and errno is
therefore sufficient.

Signed-off-by: Sagi Shahar <sagis@google.com>
Signed-off-by: Lisa Wang <wyihan@google.com>
---
 .../selftests/kvm/include/x86/tdx/tdx_util.h       | 22 ++++++++++++++++++
 tools/testing/selftests/kvm/lib/x86/processor.c    | 27 +++++++++++++++-------
 tools/testing/selftests/kvm/lib/x86/tdx/tdx_util.c | 11 +++++++++
 3 files changed, 52 insertions(+), 8 deletions(-)

diff --git a/tools/testing/selftests/kvm/include/x86/tdx/tdx_util.h b/tools/testing/selftests/kvm/include/x86/tdx/tdx_util.h
index 4330290d29e9..9d951f67b3b5 100644
--- a/tools/testing/selftests/kvm/include/x86/tdx/tdx_util.h
+++ b/tools/testing/selftests/kvm/include/x86/tdx/tdx_util.h
@@ -46,9 +46,31 @@ static inline bool is_tdx_vm(struct kvm_vm *vm)
 		    #cmd, ret, errno, strerror(errno), hw_error);	\
 })
 
+#define __tdx_vcpu_ioctl(vcpu, cmd, _flags, arg)			\
+({									\
+	union {								\
+		struct kvm_tdx_cmd c;					\
+		unsigned long raw;					\
+	} tdx_cmd = { .c = {						\
+		.id = (cmd),						\
+		.flags = (u32)(_flags),					\
+		.data = (u64)(arg),					\
+	} };								\
+									\
+	__vcpu_ioctl(vcpu, KVM_MEMORY_ENCRYPT_OP, &tdx_cmd.raw);	\
+})
+
+#define tdx_vcpu_ioctl(vcpu, cmd, flags, arg)				\
+({									\
+	int ret = __tdx_vcpu_ioctl(vcpu, cmd, flags, arg);		\
+									\
+	TEST_ASSERT(!ret, "%s failed, rc: %i errno: %i (%s)",		\
+		    #cmd, ret, errno, strerror(errno));			\
+})
 void tdx_init_vm(struct kvm_vm *vm);
 void tdx_vm_setup_boot_code_region(struct kvm_vm *vm);
 void tdx_vm_setup_boot_parameters_region(struct kvm_vm *vm, u32 nr_runnable_vcpus);
 void tdx_vm_load_common_boot_parameters(struct kvm_vm *vm);
+void tdx_vcpu_init(struct kvm_vcpu *vcpu);
 
 #endif /* SELFTESTS_TDX_TDX_UTIL_H */
diff --git a/tools/testing/selftests/kvm/lib/x86/processor.c b/tools/testing/selftests/kvm/lib/x86/processor.c
index a215ab6c2ea4..110d23e50bcc 100644
--- a/tools/testing/selftests/kvm/lib/x86/processor.c
+++ b/tools/testing/selftests/kvm/lib/x86/processor.c
@@ -865,15 +865,26 @@ struct kvm_vcpu *vm_arch_vcpu_add(struct kvm_vm *vm, u32 vcpu_id)
 	struct kvm_vcpu *vcpu;
 
 	vcpu = __vm_vcpu_add(vm, vcpu_id);
-	vcpu_init_cpuid(vcpu, kvm_get_supported_cpuid());
-	vcpu_init_sregs(vm, vcpu);
-	vcpu_init_xcrs(vm, vcpu);
+	/*
+	 * Both kvm_get_supported_cpuid() (for legacy VMs) and KVM_TDX_GET_CPUID
+	 * (for TDX VMs) return VM-scoped CPUID, e.g. the APIC ID isn't
+	 * populated per vCPU. This is fine because KVM selftests don't
+	 * currently test CPUID topology enumeration.
+	 */
+	if (is_tdx_vm(vm)) {
+		tdx_vcpu_init(vcpu);
+	} else {
+		vcpu_init_cpuid(vcpu, kvm_get_supported_cpuid());
 
-	/* Setup guest general purpose registers */
-	vcpu_regs_get(vcpu, &regs);
-	regs.rflags = regs.rflags | X86_EFLAGS_FIXED;
-	regs.rsp = vm_alloc_stack(vm, DEFAULT_STACK_PGS);
-	vcpu_regs_set(vcpu, &regs);
+		vcpu_init_sregs(vm, vcpu);
+		vcpu_init_xcrs(vm, vcpu);
+
+		/* Setup guest general purpose registers */
+		vcpu_regs_get(vcpu, &regs);
+		regs.rflags = regs.rflags | X86_EFLAGS_FIXED;
+		regs.rsp = vm_alloc_stack(vm, DEFAULT_STACK_PGS);
+		vcpu_regs_set(vcpu, &regs);
+	}
 
 	/* Setup the MP state */
 	mp_state.mp_state = 0;
diff --git a/tools/testing/selftests/kvm/lib/x86/tdx/tdx_util.c b/tools/testing/selftests/kvm/lib/x86/tdx/tdx_util.c
index e8deef076f9a..1719dc1bb060 100644
--- a/tools/testing/selftests/kvm/lib/x86/tdx/tdx_util.c
+++ b/tools/testing/selftests/kvm/lib/x86/tdx/tdx_util.c
@@ -91,6 +91,17 @@ void tdx_vm_load_common_boot_parameters(struct kvm_vm *vm)
 	params->gdtr.limit = kvm_get_default_gdt_limit();
 }
 
+void tdx_vcpu_init(struct kvm_vcpu *vcpu)
+{
+	struct kvm_cpuid2 *cpuid;
+
+	cpuid = allocate_kvm_cpuid2(MAX_NR_CPUID_ENTRIES);
+	tdx_vcpu_ioctl(vcpu, KVM_TDX_GET_CPUID, 0, cpuid);
+	vcpu_init_cpuid(vcpu, cpuid);
+	free(cpuid);
+	tdx_vcpu_ioctl(vcpu, KVM_TDX_INIT_VCPU, 0, NULL);
+}
+
 static const struct kvm_tdx_capabilities *tdx_read_capabilities(struct kvm_vm *vm)
 {
 	static struct kvm_tdx_capabilities *tdx_cap;

-- 
2.56.0.455.g6c5a503b38-goog

