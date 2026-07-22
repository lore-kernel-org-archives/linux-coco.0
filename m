Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5BA8470425
	for <linux-coco@lists.linux.dev>; Wed, 22 Jul 2026 23:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784762075; cv=none; b=UD3mCF3v6YqDmBqkwtf7rMgTye5ajMbdOKv7RQmoW/jupgZBy/r5W4eAk3L2d5YBU9GBkABsX2RdH3JFW6OgPFklU9XpGyZfdwB5RSoVBrUiBEtpU6aBpCC7eNyFllRMuravc0GbcUuCpPzdcxMkn6gbr3uUNNI3QfMg4Fd4AlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784762075; c=relaxed/simple;
	bh=85nJ9/hYOiJ96H11w7YE6HgvAK/atu2QWkFdBC4kTTk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=gsoDY9XMS0Q26ioi3xBEm/I9bzIua9HFexshPeElgeeaytZ/66NZz4YgzpIWwd41FRt5pTlXzs8UdOoXAeZP+heCyG849leXDd/1YIu0FXPo0ilet8s8mWtj6Eqb/mByZpPtu+oxoi99vXzn0wbHg0sLNxcEXD1TUQQS7HvBV3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--wyihan.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Q23OZrZT; arc=none smtp.client-ip=209.85.214.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wyihan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Q23OZrZT"
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cd01a14e81so621865ad.1
        for <linux-coco@lists.linux.dev>; Wed, 22 Jul 2026 16:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784762073; x=1785366873; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fZLWKI1tlBYiW8AamRHdf/1OfHZxF/vT4pGO9bOW1EQ=;
        b=Q23OZrZTwPW1uV0kzRIQ+VgAREDJeL77HFsOugKoQAKH3y7QOusDwZwu2Bs+AnefUK
         yMr2Evf3Pjc9bvsZOwxpoFDFWnGtLqpjUK7cEZoCrg1AVoMm4MmuFw/m5lISyK8Y1dcA
         yjQxmA7YkA+FqMie1AL0HZAUnbYqdoGS61roYNkpiXRZmjXYqNrxs1Ni83UinaxPmk/P
         Ym8dX3kbnmPhrG1xVTMo2dAWwIzRbBOHrier/Yo93kHAqrKxdlBg+xCV/I6i85p05UiR
         Roygm4+z782HmnhIoa0iI+WUj6f0Y+/dS/Bj5roDWIYQm1kLmX3MVGyYTQDgFbLOFkAF
         TmWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784762073; x=1785366873;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fZLWKI1tlBYiW8AamRHdf/1OfHZxF/vT4pGO9bOW1EQ=;
        b=N8+QD0tB9cLznIMf+XYkE1IlhQz/oVHdLXbAn8CSqSdnYdLS6xWX3jF9rcKRFCQTbQ
         hGdzFYL4OaQEW1e9MeXO6W5pnTo6gZFr/mPTPaEkOCjO3PuQ8vJhQ0cJgACbCrwtb7DS
         TXvkhMECGQVx43uYP+62iY+WZhkFVS6oRmQ6aqRYeUdgAtML8BrZ9AXcaS3EkH7RIjO0
         wi6rW+iayw9E1LUM+atdTbdKw2jj4wJRjZT5mxxXucgwus6r0yq9g5x8zhCDrxN/9zRl
         GcJETnLYLQNjyBrlcSqmVYGYtYHxuCnJEVO0uVrw5/I5RmumttnD4nwxsb5bU6k/n6An
         DIsA==
X-Forwarded-Encrypted: i=1; AHgh+RqsbqMsx2M6vSDRSF9VZ5Cr8fP/n3xr5cjL3JbU/oFyoZuUpQeZKMhSEmTf4rABSKz66N4JE8h+ADW5@lists.linux.dev
X-Gm-Message-State: AOJu0YwdwZ/i4OUcGdhS8xcrxhC+T4OWKyeeaUb1Wo3rpZzuKXY8BHfA
	i+o4ulzuM02DT5YuTXTouuGI3ycmAoIrgPHO6ooBnbVvCD3AHReiozasixQ7mmHnF/nUtkgT1mL
	Q5EpXEQ==
X-Received: from plbku3.prod.google.com ([2002:a17:903:2883:b0:2bf:8db:4516])
 (user=wyihan job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:ecd0:b0:2c6:9f6a:9f6f
 with SMTP id d9443c01a7336-2cfa6c66734mr9553835ad.28.1784762072595; Wed, 22
 Jul 2026 16:14:32 -0700 (PDT)
Date: Wed, 22 Jul 2026 23:13:20 +0000
In-Reply-To: <20260722-tdx-selftests-v14-0-15ad654a50db@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260722-tdx-selftests-v14-0-15ad654a50db@google.com>
X-Developer-Key: i=wyihan@google.com; a=ed25519; pk=cRi0fKzS5BMxlHyHY2pJv3w/1zcgfYKr6EYGYppdMYc=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784762054; l=3521;
 i=wyihan@google.com; s=20260319; h=from:subject:message-id;
 bh=xqpuRNldDHsQw4caqxUrdj/Q5OmHfnukgRI/kPmbKvA=; b=lro9gw6spAzyLdUzV3VuSRQIK+ZItJCg11HfLCf1lzHdMGraZlgSyxEOVHfijLoItxsnTtGLy
 nqcpK0M8FOyAze6f36y/Zonp0LYbMf4Ht+uI3WjVyWGfhWGCj7xCKum
X-Mailer: b4 0.14.3
Message-ID: <20260722-tdx-selftests-v14-15-15ad654a50db@google.com>
Subject: [PATCH v14 15/22] KVM: selftests: Call KVM_TDX_INIT_VCPU when
 creating a new TDX vcpu
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

TDX VMs need to issue the KVM_TDX_INIT_VCPU ioctl for each vcpu after
vcpu creation.

Since the cpuids for TD are managed by the TDX module, read the values
virtualized for the TD using KVM_TDX_GET_CPUID and set them in kvm using
KVM_SET_CPUID2 so that kvm has an accurate view of the VM cpuid values.

Signed-off-by: Sagi Shahar <sagis@google.com>
Signed-off-by: Lisa Wang <wyihan@google.com>
---
 .../selftests/kvm/include/x86/tdx/tdx_util.h       | 21 ++++++++++++++
 tools/testing/selftests/kvm/lib/x86/processor.c    | 33 ++++++++++++++++------
 2 files changed, 46 insertions(+), 8 deletions(-)

diff --git a/tools/testing/selftests/kvm/include/x86/tdx/tdx_util.h b/tools/testing/selftests/kvm/include/x86/tdx/tdx_util.h
index f5003cbaa106..07e7f5c90329 100644
--- a/tools/testing/selftests/kvm/include/x86/tdx/tdx_util.h
+++ b/tools/testing/selftests/kvm/include/x86/tdx/tdx_util.h
@@ -44,6 +44,27 @@ static inline bool is_tdx_vm(struct kvm_vm *vm)
 	}								\
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
+	TEST_ASSERT(!ret, "%s failed, errno: %d (%s)",			\
+		     #cmd, errno, strerror(errno));			\
+})
+
 void tdx_init_vm(struct kvm_vm *vm, u64 attributes);
 void tdx_vm_setup_boot_code_region(struct kvm_vm *vm);
 void tdx_vm_setup_boot_parameters_region(struct kvm_vm *vm, u32 nr_runnable_vcpus);
diff --git a/tools/testing/selftests/kvm/lib/x86/processor.c b/tools/testing/selftests/kvm/lib/x86/processor.c
index 8f8bb90fec35..f6a2aa6b86a4 100644
--- a/tools/testing/selftests/kvm/lib/x86/processor.c
+++ b/tools/testing/selftests/kvm/lib/x86/processor.c
@@ -838,6 +838,17 @@ gva_t kvm_allocate_vcpu_stack(struct kvm_vm *vm)
 	return stack_gva;
 }
 
+static void tdx_vcpu_init(struct kvm_vm *vm, struct kvm_vcpu *vcpu)
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
 struct kvm_vcpu *vm_arch_vcpu_add(struct kvm_vm *vm, u32 vcpu_id)
 {
 	struct kvm_mp_state mp_state;
@@ -845,15 +856,21 @@ struct kvm_vcpu *vm_arch_vcpu_add(struct kvm_vm *vm, u32 vcpu_id)
 	struct kvm_regs regs;
 
 	vcpu = __vm_vcpu_add(vm, vcpu_id);
-	vcpu_init_cpuid(vcpu, kvm_get_supported_cpuid());
-	vcpu_init_sregs(vm, vcpu);
-	vcpu_init_xcrs(vm, vcpu);
 
-	/* Setup guest general purpose registers */
-	vcpu_regs_get(vcpu, &regs);
-	regs.rflags = regs.rflags | 0x2;
-	regs.rsp = kvm_allocate_vcpu_stack(vm);
-	vcpu_regs_set(vcpu, &regs);
+	if (is_tdx_vm(vm)) {
+		tdx_vcpu_init(vm, vcpu);
+	} else {
+		vcpu_init_cpuid(vcpu, kvm_get_supported_cpuid());
+
+		vcpu_init_sregs(vm, vcpu);
+		vcpu_init_xcrs(vm, vcpu);
+
+		/* Setup guest general purpose registers */
+		vcpu_regs_get(vcpu, &regs);
+		regs.rflags = regs.rflags | 0x2;
+		regs.rsp = kvm_allocate_vcpu_stack(vm);
+		vcpu_regs_set(vcpu, &regs);
+	}
 
 	/* Setup the MP state */
 	mp_state.mp_state = 0;

-- 
2.55.0.229.g6434b31f56-goog

