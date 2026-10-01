Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A7435304D4
	for <linux-coco@lists.linux.dev>; Thu,  1 Oct 2026 19:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790883548; cv=none; b=NdMjXjtFFiOqtm5wxebNDY8Jkw9cCm4XIEXTSkCJgJ0+Llf1djWO+qMa6kKmrXIapKBVDyaLMmrCFjZmbzF6jg1Xs+6Ex3YwN1IK9cWqHlal7IVqcx67eRCyLLa+oHTdTjkLO1N0bXBBlQHlZSGb3y52NW1VQkIqEsAPulCbgJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790883548; c=relaxed/simple;
	bh=M4dXSBge5+OeGOkEPm8tEyn1V45XLSawDxNn3M/5cP8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=YFIfd7ohrZHnGiKug0Z+Uf8nXsMJ5dL0Mr3YXZRvoBMivOqWtU6NuSQMBRRYoqhpKrj6urTTaiGMDeb9hzh7j7bfO0FI3cPGnARmb5392XDdhkGOEAn/alHpksxRt4eTpegoKKeSzY7Uq7zt4mNNi740fq1EMbHsDu1IWgwsAJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--wyihan.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=AGJtYxhU; arc=none smtp.client-ip=209.85.216.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wyihan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="AGJtYxhU"
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-39de4e72b33so12095098a91.2
        for <linux-coco@lists.linux.dev>; Thu, 01 Oct 2026 12:39:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790883543; x=1791488343; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kWuVYqccoZ0xuvlXXUJd1igxfZmdeqLxo/EcY9b25x0=;
        b=AGJtYxhU6PjLc7VwsC+zdukxna2657vHnxt5bp2tLUPXhpkSc/NwQy7XFsIIhsQvHX
         AOjfm2Uuns1qzOv5auXCjv72ZmzRdlg7AgL75vG/+vot16t9DjroupwryS9u1y8VLLfm
         24RYZDMjtJnvmaRQ+mSEykYiTpKd7IENdX2lXc+qU9rlBh6ZiSnWBUKCIOYiQ4yAtLdR
         Ie2oIX4lwRclSF6irxxClu0Zb7fcxvMNLxb6QBkeYp2xD/mykRFeIkz1lA5J9vofMus2
         Vwxupmu2sV062tBs5/c5yOkxUyEArymci6uFNPIxLmhpSujJAisjev7iKEO41FQNiSCv
         s7Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790883543; x=1791488343;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kWuVYqccoZ0xuvlXXUJd1igxfZmdeqLxo/EcY9b25x0=;
        b=lKF5GrH8Ncz7ZzqOjNIjQii7Wds5SvOBj1bEWxkSjwMTwiWGGKHiBk+iHZIUyD5fM9
         yDiERWcXb5l99jlGPIBMEyronDM95O8RnpDtWF77glMySVhk/q/ri0VZtMKhgP9RVzZ8
         m5c7bqAIm5NvBD5Z/MnLxImh0uO8RGKqbmYP8zp2jCYhbewdBJYWWUliToA2YlzTe7DG
         G8D15SXX4S4jBcoleB/muO2le/w544UhTxfK+21qhIvq1iUj5ifjwQybia5J9AE1vj4i
         6gEbTjreoLYaHDLQNYGjd3mP1t7Tl0/NBMsNN7r1yRASu8MItDR9gh46lyejbYO4e7Gv
         F1xw==
X-Forwarded-Encrypted: i=1; AKwUvBzy51cXIpnpQ+4GZAxzJuR4z/MhfUonGEqjlWGTUnacGnirogVEouI4hmbRcEc+egV6HLFrFSJXwfRB@lists.linux.dev
X-Gm-Message-State: AFq9FYKi2JZw2uvZORT3J2Vmd8EHkgOT+3lZWChhQIpBJlkvOq4zv+z4
	xLjHJes33t0eWgXcHr41ec8SwS/5R/pZT8DwK1Ttfae+s1cR7g4YArwtm5fPDelgi5HxjnGmuwH
	oGxOvlA==
X-Received: from pjbdt7.prod.google.com ([2002:a17:90a:fa47:b0:3a4:f73c:50c4])
 (user=wyihan job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2585:b0:3a4:b418:94ce
 with SMTP id 98e67ed59e1d1-3a6ce5fa387mr579569a91.1.1790883542430; Thu, 01
 Oct 2026 12:39:02 -0700 (PDT)
Date: Thu, 01 Oct 2026 19:37:50 +0000
In-Reply-To: <20261001-tdx-selftests-v15-0-7c62a5d8a992@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20261001-tdx-selftests-v15-0-7c62a5d8a992@google.com>
X-Developer-Key: i=wyihan@google.com; a=ed25519; pk=cRi0fKzS5BMxlHyHY2pJv3w/1zcgfYKr6EYGYppdMYc=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790883521; l=3341;
 i=wyihan@google.com; s=20260319; h=from:subject:message-id;
 bh=eahQ/Qg0Jjy4E99ZAgvlDKelpVaZbNc+WKsobSaVqcE=; b=Dwk024wKMQMop0ug36RFw+ZisT1Gxgnh7qxnlmzhTrCyBGcmUvBqXFBld4BObW7rX4ebrGJpP
 Mwwe+dWVRoIC8u0q73KBSPTwOEnU7St2O7f139XS6ZpyMq6h8yR7nMc
X-Mailer: b4 0.14.3
Message-ID: <20261001-tdx-selftests-v15-23-7c62a5d8a992@google.com>
Subject: [PATCH v15 23/23] KVM: selftests: Add TDX lifecycle test
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

Add a test to verify TDX lifecycle by creating a simple TDX VM.

Signed-off-by: Sagi Shahar <sagis@google.com>
Signed-off-by: Lisa Wang <wyihan@google.com>
Reviewed-by: Xiaoyao Li <xiaoyao.li@intel.com>
---
 tools/testing/selftests/kvm/Makefile.kvm           |  1 +
 .../testing/selftests/kvm/include/x86/processor.h  |  1 +
 .../selftests/kvm/include/x86/tdx/tdx_util.h       |  5 ++++
 tools/testing/selftests/kvm/x86/tdx_vm_test.c      | 33 ++++++++++++++++++++++
 4 files changed, 40 insertions(+)

diff --git a/tools/testing/selftests/kvm/Makefile.kvm b/tools/testing/selftests/kvm/Makefile.kvm
index 495de8ef8166..14cff95cf291 100644
--- a/tools/testing/selftests/kvm/Makefile.kvm
+++ b/tools/testing/selftests/kvm/Makefile.kvm
@@ -161,6 +161,7 @@ TEST_GEN_PROGS_x86 += x86/triple_fault_event_test
 TEST_GEN_PROGS_x86 += x86/recalc_apic_map_test
 TEST_GEN_PROGS_x86 += x86/aperfmperf_test
 TEST_GEN_PROGS_x86 += x86/guest_memfd_conversions_test
+TEST_GEN_PROGS_x86 += x86/tdx_vm_test
 TEST_GEN_PROGS_x86 += access_tracking_perf_test
 TEST_GEN_PROGS_x86 += coalesced_io_test
 TEST_GEN_PROGS_x86 += dirty_log_perf_test
diff --git a/tools/testing/selftests/kvm/include/x86/processor.h b/tools/testing/selftests/kvm/include/x86/processor.h
index 1eb380dd216c..61ae02d927c1 100644
--- a/tools/testing/selftests/kvm/include/x86/processor.h
+++ b/tools/testing/selftests/kvm/include/x86/processor.h
@@ -393,6 +393,7 @@ static inline unsigned int x86_model(unsigned int eax)
 #define VM_SHAPE_SEV		VM_TYPE(KVM_X86_SEV_VM)
 #define VM_SHAPE_SEV_ES		VM_TYPE(KVM_X86_SEV_ES_VM)
 #define VM_SHAPE_SNP		VM_TYPE(KVM_X86_SNP_VM)
+#define VM_SHAPE_TDX		VM_TYPE(KVM_X86_TDX_VM)
 
 #define PHYSICAL_PAGE_MASK      GENMASK_ULL(51, 12)
 
diff --git a/tools/testing/selftests/kvm/include/x86/tdx/tdx_util.h b/tools/testing/selftests/kvm/include/x86/tdx/tdx_util.h
index dcfc62ffbaeb..85791fe16f68 100644
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
2.56.0.rc1.315.gc6ed9934b7-goog

