Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEE5A37419D
	for <linux-coco@lists.linux.dev>; Thu, 21 May 2026 23:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779405466; cv=none; b=GkQDejuIQU2QaEPygIb+kri115aRY1oFqABn0I0gZhmo+Ag38u+SJJ2AaVB+mFWPFfnhu1gTBXz3clrq1QKoxzF9HVctCrcXHHej5g8aKwIbJzNu5bO5LseFs+n2PR9Zu8K92Fl0TEeoeHAFDi/4zNsGLanr8BanfNDFvwp2+Vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779405466; c=relaxed/simple;
	bh=g07zdxChitPTI9twOohppbiWhlIxXngRCSMr4LUrbCs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=VsSNmM8IxMsmlqyKgHgfsWsrvClXnIHcECnmf12iJd4D+mcdxjn4Oh+NNZUFnOK9YNwlovjhLKg62BRt5rAXuXNtkPnDJYFwTuoh9HBMZVdhmoZoc8L/58j3wxut2LEp9v0TNq0nSSgq2SZsJ80mOlmfaDSSVh6wou8b+vwk7R8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--wyihan.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=AcCwch8L; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wyihan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="AcCwch8L"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-367cb6de61aso12034173a91.1
        for <linux-coco@lists.linux.dev>; Thu, 21 May 2026 16:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779405463; x=1780010263; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=NDuVHbbe9tFqK9kSIH2YOcoslIJRCEw3L/LE+oaB3CE=;
        b=AcCwch8LG71yaGWoh2+vR6YeNdRBTpFIhIfHXJwR6BCIlHyCAY7gd3MpVPpWgiCSY6
         TKk7Y0vWh3AxYDgLlUcDeqNr6mrpZ/mmKZFToJoXy3vzIylaugwqFzyX6AIHfuyEIog/
         XYSTQ8aZBPwRIzBZ0h+WbQYEuLqI7f69asRNx6xW3Iby1zRs99HwAhh2l0HBwXSXUa4B
         9e8zr9LtGjVd6TfomvXKvWvbLcyO9Gc43FI3tdyx8nYagtI0xjQWIorrbQSfrptvOBME
         zjuD8fb0j61ljPIx6L8gyRSK6+gQafp8Hby9mBaRgp1GVMCdm56ebG62ncDBarJffWoj
         hFpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779405463; x=1780010263;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NDuVHbbe9tFqK9kSIH2YOcoslIJRCEw3L/LE+oaB3CE=;
        b=jMNS39LY9JVFlAN/qk+isI3SN/WSpKleaVjQvINpaX1GDjJI53YGAFtlRrlkXuol8h
         lXoiyYoz3gh+bGiIPNkFOb07+YpPkhxBzavePyUn/j0qO0Kz5h0E27cH6LeVdI4mciHY
         4kCs7Q+HxQ4AD5yqu6QhROVU21Mfezd9BsM1aEqmorPcyJVCToYUiSM/J0qSwwpBqALA
         P2/da5Sf4S1SMdkI9jY2MSPCQ/xlhS86hRBb/KsspqNKHtTSUinPrLskN9lgq9aFOPp3
         cZEmGGzh0hmogZHCWnUPfRG9G92sFGBz7mjBe98uF1Ze2nPs9cqjan8/ZLmRBKreXet3
         0Hbg==
X-Forwarded-Encrypted: i=1; AFNElJ9Lm9+AcKGlWP+t3N8uC+G0RzXMtlqrTeUkyvCj9wtTTjBZjuZ68I3+6SGisDdg2yT9T5iHVXbseiRO@lists.linux.dev
X-Gm-Message-State: AOJu0YwQD6YBWh4+O/6tPiSNFpzKEeD2CYUmXd6x8A8VAFp/VAT4T/nx
	/7newkPVtoi1zB4SeDOfxCRD9hNW1InRsg0uc5uJQTrEtBSO0eOH4igZNA3c0QGCJKuyxh3XgLA
	u+oTnDg==
X-Received: from pjbii14.prod.google.com ([2002:a17:90b:488e:b0:365:f319:9427])
 (user=wyihan job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2e04:b0:359:1130:1047
 with SMTP id 98e67ed59e1d1-36a677c7a77mr1021731a91.17.1779405462422; Thu, 21
 May 2026 16:17:42 -0700 (PDT)
Date: Thu, 21 May 2026 23:17:03 +0000
In-Reply-To: <20260521-tdx-selftests-v13-v13-0-6983ae4c3a4d@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260521-tdx-selftests-v13-v13-0-6983ae4c3a4d@google.com>
X-Developer-Key: i=wyihan@google.com; a=ed25519; pk=cRi0fKzS5BMxlHyHY2pJv3w/1zcgfYKr6EYGYppdMYc=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779405439; l=3221;
 i=wyihan@google.com; s=20260319; h=from:subject:message-id;
 bh=sRLiM6RbKoG5VddtAxKgLddQfa2cG3iSFQQYT2bdoPE=; b=LQ4+Mf9N/xXTNK6v12F5/Hub6eIZiXj/exJGFNQFy/wfFpW4Gkn2yokdKqIUWZEOB5CKda52Q
 Vl26TIS53DfA2JDT220jZpKa3XPSiQ8gKhVMwHGOs/gTm6xxUIFU6wy
X-Mailer: b4 0.14.3
Message-ID: <20260521-tdx-selftests-v13-v13-22-6983ae4c3a4d@google.com>
Subject: [PATCH  v13 22/22] KVM: selftests: Add TDX lifecycle test
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

Adding a test to verify TDX lifecycle by creating a simple TDX VM.

Signed-off-by: Sagi Shahar <sagis@google.com>
Signed-off-by: Lisa Wang <wyihan@google.com>
---
 tools/testing/selftests/kvm/Makefile.kvm           |  1 +
 .../testing/selftests/kvm/include/x86/processor.h  |  1 +
 .../selftests/kvm/include/x86/tdx/tdx_util.h       |  5 ++++
 tools/testing/selftests/kvm/x86/tdx_vm_test.c      | 33 ++++++++++++++++++++++
 4 files changed, 40 insertions(+)

diff --git a/tools/testing/selftests/kvm/Makefile.kvm b/tools/testing/selftests/kvm/Makefile.kvm
index 489324cecf83..14db8eb2bf0d 100644
--- a/tools/testing/selftests/kvm/Makefile.kvm
+++ b/tools/testing/selftests/kvm/Makefile.kvm
@@ -167,6 +167,7 @@ TEST_GEN_PROGS_x86 += rseq_test
 TEST_GEN_PROGS_x86 += steal_time
 TEST_GEN_PROGS_x86 += system_counter_offset_test
 TEST_GEN_PROGS_x86 += pre_fault_memory_test
+TEST_GEN_PROGS_x86 += x86/tdx_vm_test
 
 # Compiled outputs used by test targets
 TEST_GEN_PROGS_EXTENDED_x86 += x86/nx_huge_pages_test
diff --git a/tools/testing/selftests/kvm/include/x86/processor.h b/tools/testing/selftests/kvm/include/x86/processor.h
index ed9c031b77b8..f65755482a97 100644
--- a/tools/testing/selftests/kvm/include/x86/processor.h
+++ b/tools/testing/selftests/kvm/include/x86/processor.h
@@ -372,6 +372,7 @@ static inline unsigned int x86_model(unsigned int eax)
 #define VM_SHAPE_SEV		VM_TYPE(KVM_X86_SEV_VM)
 #define VM_SHAPE_SEV_ES		VM_TYPE(KVM_X86_SEV_ES_VM)
 #define VM_SHAPE_SNP		VM_TYPE(KVM_X86_SNP_VM)
+#define VM_SHAPE_TDX		VM_TYPE(KVM_X86_TDX_VM)
 
 #define PHYSICAL_PAGE_MASK      GENMASK_ULL(51, 12)
 
diff --git a/tools/testing/selftests/kvm/include/x86/tdx/tdx_util.h b/tools/testing/selftests/kvm/include/x86/tdx/tdx_util.h
index 8276622c50d2..56538b1286f3 100644
--- a/tools/testing/selftests/kvm/include/x86/tdx/tdx_util.h
+++ b/tools/testing/selftests/kvm/include/x86/tdx/tdx_util.h
@@ -11,6 +11,11 @@ static inline bool is_tdx_vm(struct kvm_vm *vm)
 	return vm->type == KVM_X86_TDX_VM;
 }
 
+static inline bool is_tdx_supported(void)
+{
+	return !!(kvm_check_cap(KVM_CAP_VM_TYPES) & BIT(KVM_X86_TDX_VM));
+}
+
 /*
  * TDX ioctls
  * Use underscores to avoid collisions with struct member names.
diff --git a/tools/testing/selftests/kvm/x86/tdx_vm_test.c b/tools/testing/selftests/kvm/x86/tdx_vm_test.c
new file mode 100644
index 000000000000..7cdcaf33b585
--- /dev/null
+++ b/tools/testing/selftests/kvm/x86/tdx_vm_test.c
@@ -0,0 +1,33 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include "processor.h"
+#include "kvm_util.h"
+#include "tdx/tdx_util.h"
+#include "ucall_common.h"
+#include "kselftest_harness.h"
+
+static void guest_code_lifecycle(void)
+{
+	GUEST_DONE();
+}
+
+TEST(verify_td_lifecycle)
+{
+	struct kvm_vcpu *vcpu;
+	struct kvm_vm *vm;
+	struct ucall uc;
+
+	vm = vm_create_shape_with_one_vcpu(VM_SHAPE_TDX, &vcpu,
+					   guest_code_lifecycle);
+
+	vcpu_run(vcpu);
+	TEST_ASSERT_EQ(get_ucall(vcpu, &uc), UCALL_DONE);
+
+	kvm_vm_free(vm);
+}
+
+int main(int argc, char **argv)
+{
+	TEST_REQUIRE(is_tdx_supported());
+	return test_harness_run(argc, argv);
+}

-- 
2.54.0.746.g67dd491aae-goog

