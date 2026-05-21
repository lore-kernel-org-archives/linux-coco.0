Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2EAE3264EB
	for <linux-coco@lists.linux.dev>; Thu, 21 May 2026 23:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779405444; cv=none; b=Sp6nvyKeGRqP/4clw4TazQor4vxXnQHt6xMeSK+R0IzC2DZL9ddsUFLAsPhNSTEZHMAQrkMSEpc3G5p2/+aBzhmhoVbgUTjqVcPxtdnm/vl7qAutT+ZmBF0d7WvUm/EHTlzAP3u9iHqu/URJwQ0OwsG2WWSYZsQikiPEv7lZqGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779405444; c=relaxed/simple;
	bh=AJHof9uds57GJf3ZjkCCl1BuKyNY2FzZtq/u9G54vA0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Alcx3Fz22eN17tD6H2tTQkbTHYwleOHEutYoBR6a+x7W4lFNZcWX9s+HyBohRp+X0juuLednp6awBcg9V4HcMhThuGqSdOCrimClyLvqMmn1g5HOK7mpjO3x1CdJC/FwQSowmXHevU0G0JHrTjfFoJSHzh+iIqP5h8PyMReErvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--wyihan.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UQPoB6jc; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wyihan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UQPoB6jc"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-366ded5ab5fso13489950a91.0
        for <linux-coco@lists.linux.dev>; Thu, 21 May 2026 16:17:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779405442; x=1780010242; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=7EAyw0PukGOP2yPXuj5NIxJuzEYzUJ0RUd3D3TdwN3s=;
        b=UQPoB6jcwnt9UK6vy0kgkP2Gzw/kySwzJZpDiv0W1X/91t77+N2W6slxXBK1djCThJ
         stnfxU6FHQkA1FsOwBjtW3U6q+YSuYuOK8RAKOiMzKYiQVLdySp1g6uKZz5B4I9hqFaL
         NgH8Pcv8WJaVWqRwgTNKPFqJdaEOABffViBIrJL6y8UWhl7TICf/Zn5gYB2g/iL6L49J
         o3iwuhLV3o2PY5d/5k847sdbpc+DN5kUgFXQUpwR7kinGMEQjx+2PAXWFaS5zXqu/mHQ
         LBMDeWeV2y0F8nGCdu9JCByfoSlg9bdf1ZT+NFRRp1f3V/cIBBqv/hXOKNWv+6qNRFXl
         XXjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779405442; x=1780010242;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7EAyw0PukGOP2yPXuj5NIxJuzEYzUJ0RUd3D3TdwN3s=;
        b=hOebzCy4uK0vb8aDbxdHI64Mxpfsl6mxzmaPDlEjMx19GBD+wHnXVg5m/c2Uz3Nhkd
         FjWMMbiSOwj7IgN2K2twofXY1rXpOkAE0aC//OF8u3AEwbs0FU1myAKLczNYO2AGfyhx
         O2bP4HnV1nLo+kepfkwKXVyOgWKPRlhYxCWzrt3hgbbvSseMltdAVQU9bb+K5VH0px5x
         bsEoY7JHehWBxbNp8I++Eszpj40ybxsv07Of48raiUB4haKbhTOTGh5xDS3awEf0Twbv
         nPogJghKsskJZ2x7+fKXtJTKEQwqq4RXQ7TYN5jsJJKslKByoCLuCDfo7vLsqIqpCBcu
         XY/w==
X-Forwarded-Encrypted: i=1; AFNElJ8gP4Z6jg1VBmnTMPXTfs7lYf0y0DRA+lmrJkQ11OENcWwi/Iizi5YCpAjgl7jsPwF1bmsjoa2jKWGb@lists.linux.dev
X-Gm-Message-State: AOJu0YyljcoF1i4V0IUzHu5UoyNX3Z1eH+/6SpIVNWuflc2dLxb8s8mz
	z/8A8Jxm2FRxnTm540G8Jk5sZBXwHTnFMXtFBqfCXNjco7b73TM5DbtiASdcekbyZI8URcT3vW7
	QfR5iYQ==
X-Received: from pfbhu35.prod.google.com ([2002:a05:6a00:69a3:b0:82f:5b50:db30])
 (user=wyihan job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:68f:b0:3b1:a9ce:5095
 with SMTP id adf61e73a8af0-3b328d940ebmr891980637.22.1779405441613; Thu, 21
 May 2026 16:17:21 -0700 (PDT)
Date: Thu, 21 May 2026 23:16:42 +0000
In-Reply-To: <20260521-tdx-selftests-v13-v13-0-6983ae4c3a4d@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260521-tdx-selftests-v13-v13-0-6983ae4c3a4d@google.com>
X-Developer-Key: i=wyihan@google.com; a=ed25519; pk=cRi0fKzS5BMxlHyHY2pJv3w/1zcgfYKr6EYGYppdMYc=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779405439; l=7777;
 i=wyihan@google.com; s=20260319; h=from:subject:message-id;
 bh=JHkY9FocbRWshGCdU20jKcRRS7h6ChdXPCzwPWNDo2w=; b=U4JpKZtjKa5yNtiCQmT2R3/E9xKpYLAM51gEtsIpEWhCrEd8LCrGOisO0f7BzDpB4izrlQF0k
 Toz+ep7VWv8BPW523/aWQDZftn4jb58PMrPgjzV5ba2DTCmfa3u2PIi
X-Mailer: b4 0.14.3
Message-ID: <20260521-tdx-selftests-v13-v13-1-6983ae4c3a4d@google.com>
Subject: [PATCH  v13 01/22] KVM: selftests: Add macros to simplify creating VM
 shapes for non-default types
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

From: Sean Christopherson <seanjc@google.com>

Add VM_TYPE() and __VM_TYPE() macros to create a vm_shape structure given
a type (and mode), and use the macros to define VM_SHAPE_{SEV,SEV_ES,SNP}
shapes for x86's SEV family of VM shapes.  Providing common infrastructure
will avoid having to copy+paste vm_sev_create_with_one_vcpu() for TDX.

Use the new SEV+ shapes and drop vm_sev_create_with_one_vcpu().

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
Signed-off-by: Sagi Shahar <sagis@google.com>
Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
Reviewed-by: Ira Weiny <ira.weiny@intel.com>
Signed-off-by: Lisa Wang <wyihan@google.com>
---
 tools/testing/selftests/kvm/include/kvm_util.h     | 13 +++++++
 .../testing/selftests/kvm/include/x86/processor.h  |  4 +++
 tools/testing/selftests/kvm/include/x86/sev.h      |  2 --
 tools/testing/selftests/kvm/lib/x86/sev.c          | 16 ---------
 tools/testing/selftests/kvm/x86/sev_smoke_test.c   | 40 +++++++++++-----------
 5 files changed, 37 insertions(+), 38 deletions(-)

diff --git a/tools/testing/selftests/kvm/include/kvm_util.h b/tools/testing/selftests/kvm/include/kvm_util.h
index dc70c6da63fa..041bdbfb93f7 100644
--- a/tools/testing/selftests/kvm/include/kvm_util.h
+++ b/tools/testing/selftests/kvm/include/kvm_util.h
@@ -233,6 +233,19 @@ kvm_static_assert(sizeof(struct vm_shape) == sizeof(u64));
 	shape;					\
 })
 
+#define __VM_TYPE(__mode, __type)		\
+({						\
+	struct vm_shape shape = {		\
+		.mode = (__mode),		\
+		.type = (__type)		\
+	};					\
+						\
+	shape;					\
+})
+
+#define VM_TYPE(__type)				\
+	__VM_TYPE(VM_MODE_DEFAULT, __type)
+
 extern enum vm_guest_mode vm_mode_default;
 
 #if defined(__aarch64__)
diff --git a/tools/testing/selftests/kvm/include/x86/processor.h b/tools/testing/selftests/kvm/include/x86/processor.h
index 77f576ee7789..0aa6eecfcbde 100644
--- a/tools/testing/selftests/kvm/include/x86/processor.h
+++ b/tools/testing/selftests/kvm/include/x86/processor.h
@@ -365,6 +365,10 @@ static inline unsigned int x86_model(unsigned int eax)
 	return ((eax >> 12) & 0xf0) | ((eax >> 4) & 0x0f);
 }
 
+#define VM_SHAPE_SEV		VM_TYPE(KVM_X86_SEV_VM)
+#define VM_SHAPE_SEV_ES		VM_TYPE(KVM_X86_SEV_ES_VM)
+#define VM_SHAPE_SNP		VM_TYPE(KVM_X86_SNP_VM)
+
 #define PHYSICAL_PAGE_MASK      GENMASK_ULL(51, 12)
 
 #define PAGE_SHIFT		12
diff --git a/tools/testing/selftests/kvm/include/x86/sev.h b/tools/testing/selftests/kvm/include/x86/sev.h
index 1af44c151d60..944c59dbe510 100644
--- a/tools/testing/selftests/kvm/include/x86/sev.h
+++ b/tools/testing/selftests/kvm/include/x86/sev.h
@@ -53,8 +53,6 @@ void snp_vm_launch_start(struct kvm_vm *vm, u64 policy);
 void snp_vm_launch_update(struct kvm_vm *vm);
 void snp_vm_launch_finish(struct kvm_vm *vm);
 
-struct kvm_vm *vm_sev_create_with_one_vcpu(u32 type, void *guest_code,
-					   struct kvm_vcpu **cpu);
 void vm_sev_launch(struct kvm_vm *vm, u64 policy, u8 *measurement);
 
 kvm_static_assert(SEV_RET_SUCCESS == 0);
diff --git a/tools/testing/selftests/kvm/lib/x86/sev.c b/tools/testing/selftests/kvm/lib/x86/sev.c
index 93f916903461..95d8520eea34 100644
--- a/tools/testing/selftests/kvm/lib/x86/sev.c
+++ b/tools/testing/selftests/kvm/lib/x86/sev.c
@@ -158,22 +158,6 @@ void snp_vm_launch_finish(struct kvm_vm *vm)
 	vm_sev_ioctl(vm, KVM_SEV_SNP_LAUNCH_FINISH, &launch_finish);
 }
 
-struct kvm_vm *vm_sev_create_with_one_vcpu(u32 type, void *guest_code,
-					   struct kvm_vcpu **cpu)
-{
-	struct vm_shape shape = {
-		.mode = VM_MODE_DEFAULT,
-		.type = type,
-	};
-	struct kvm_vm *vm;
-	struct kvm_vcpu *cpus[1];
-
-	vm = __vm_create_with_vcpus(shape, 1, 0, guest_code, cpus);
-	*cpu = cpus[0];
-
-	return vm;
-}
-
 void vm_sev_launch(struct kvm_vm *vm, u64 policy, u8 *measurement)
 {
 	if (is_sev_snp_vm(vm)) {
diff --git a/tools/testing/selftests/kvm/x86/sev_smoke_test.c b/tools/testing/selftests/kvm/x86/sev_smoke_test.c
index 1a49ee391586..fe2c438882ae 100644
--- a/tools/testing/selftests/kvm/x86/sev_smoke_test.c
+++ b/tools/testing/selftests/kvm/x86/sev_smoke_test.c
@@ -104,7 +104,7 @@ static void compare_xsave(u8 *from_host, u8 *from_guest)
 		abort();
 }
 
-static void test_sync_vmsa(u32 type, u64 policy)
+static void test_sync_vmsa(struct vm_shape shape, u64 policy)
 {
 	struct kvm_vcpu *vcpu;
 	struct kvm_vm *vm;
@@ -114,7 +114,7 @@ static void test_sync_vmsa(u32 type, u64 policy)
 	double x87val = M_PI;
 	struct kvm_xsave __attribute__((aligned(64))) xsave = { 0 };
 
-	vm = vm_sev_create_with_one_vcpu(type, guest_code_xsave, &vcpu);
+	vm = vm_create_shape_with_one_vcpu(shape, &vcpu, guest_code_xsave);
 	gva = vm_alloc_shared(vm, PAGE_SIZE, KVM_UTIL_MIN_VADDR,
 			      MEM_REGION_TEST_DATA);
 	hva = addr_gva2hva(vm, gva);
@@ -150,13 +150,13 @@ static void test_sync_vmsa(u32 type, u64 policy)
 	kvm_vm_free(vm);
 }
 
-static void test_sev(void *guest_code, u32 type, u64 policy)
+static void test_sev(void *guest_code, struct vm_shape shape, u64 policy)
 {
 	struct kvm_vcpu *vcpu;
 	struct kvm_vm *vm;
 	struct ucall uc;
 
-	vm = vm_sev_create_with_one_vcpu(type, guest_code, &vcpu);
+	vm = vm_create_shape_with_one_vcpu(shape, &vcpu, guest_code);
 
 	/* TODO: Validate the measurement is as expected. */
 	vm_sev_launch(vm, policy, NULL);
@@ -201,12 +201,12 @@ static void guest_shutdown_code(void)
 	__asm__ __volatile__("ud2");
 }
 
-static void test_sev_shutdown(u32 type, u64 policy)
+static void test_sev_shutdown(struct vm_shape shape, u64 policy)
 {
 	struct kvm_vcpu *vcpu;
 	struct kvm_vm *vm;
 
-	vm = vm_sev_create_with_one_vcpu(type, guest_shutdown_code, &vcpu);
+	vm = vm_create_shape_with_one_vcpu(shape, &vcpu, guest_shutdown_code);
 
 	vm_sev_launch(vm, policy, NULL);
 
@@ -218,28 +218,28 @@ static void test_sev_shutdown(u32 type, u64 policy)
 	kvm_vm_free(vm);
 }
 
-static void test_sev_smoke(void *guest, u32 type, u64 policy)
+static void test_sev_smoke(void *guest, struct vm_shape shape, u64 policy)
 {
 	const u64 xf_mask = XFEATURE_MASK_X87_AVX;
 
-	if (type == KVM_X86_SNP_VM)
-		test_sev(guest, type, policy | SNP_POLICY_DBG);
+	if (shape.type == KVM_X86_SNP_VM)
+		test_sev(guest, shape, policy | SNP_POLICY_DBG);
 	else
-		test_sev(guest, type, policy | SEV_POLICY_NO_DBG);
-	test_sev(guest, type, policy);
+		test_sev(guest, shape, policy | SEV_POLICY_NO_DBG);
+	test_sev(guest, shape, policy);
 
-	if (type == KVM_X86_SEV_VM)
+	if (shape.type == KVM_X86_SEV_VM)
 		return;
 
-	test_sev_shutdown(type, policy);
+	test_sev_shutdown(shape, policy);
 
 	if (kvm_has_cap(KVM_CAP_XCRS) &&
 	    (xgetbv(0) & kvm_cpu_supported_xcr0() & xf_mask) == xf_mask) {
-		test_sync_vmsa(type, policy);
-		if (type == KVM_X86_SNP_VM)
-			test_sync_vmsa(type, policy | SNP_POLICY_DBG);
+		test_sync_vmsa(shape, policy);
+		if (shape.type == KVM_X86_SNP_VM)
+			test_sync_vmsa(shape, policy | SNP_POLICY_DBG);
 		else
-			test_sync_vmsa(type, policy | SEV_POLICY_NO_DBG);
+			test_sync_vmsa(shape, policy | SEV_POLICY_NO_DBG);
 	}
 }
 
@@ -247,13 +247,13 @@ int main(int argc, char *argv[])
 {
 	TEST_REQUIRE(kvm_cpu_has(X86_FEATURE_SEV));
 
-	test_sev_smoke(guest_sev_code, KVM_X86_SEV_VM, 0);
+	test_sev_smoke(guest_sev_code, VM_SHAPE_SEV, 0);
 
 	if (kvm_cpu_has(X86_FEATURE_SEV_ES))
-		test_sev_smoke(guest_sev_es_code, KVM_X86_SEV_ES_VM, SEV_POLICY_ES);
+		test_sev_smoke(guest_sev_es_code, VM_SHAPE_SEV_ES, SEV_POLICY_ES);
 
 	if (kvm_cpu_has(X86_FEATURE_SEV_SNP))
-		test_sev_smoke(guest_snp_code, KVM_X86_SNP_VM, snp_default_policy());
+		test_sev_smoke(guest_snp_code, VM_SHAPE_SNP, snp_default_policy());
 
 	return 0;
 }

-- 
2.54.0.746.g67dd491aae-goog

