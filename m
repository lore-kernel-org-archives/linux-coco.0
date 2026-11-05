Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793922482;
	b=DzWScvHfnSoSZDxfzLCLhr0WhOYF8cMgb4JdcygF8F64XqK1tja7Tsvyf8//tUPIXUhX
	 75+dgC+t/+59vuiAuR+S5Jmrenys40QpTNf+OVMZadINWz/2haIg9IdxvAuyhuGeHRFCi
	 E8rfU8B3bVQyFuVgtYkbgF4HCZc0jVQ7fn92fk0x/6ZC/oGmDcmHEYmCMHXA87Tqx4n9B
	 szm+ZfwEx9IxJrp0hpS1OBW1lnj30ANmDCnZpPmj4bOyegM+I8ExaR0E+2UPc7c0yStH+
	 oVcLIPmjAABG5hAE1dgYClML0EYdUoNFCiV0hW+QmNhuGAe1cEPcatyd+5eENZXTwkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793922482;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Developer-Key:X-Developer-Signature:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=3APDwUUBO5Tor+FhWze8o86U6Ry1uRslwxSo4XqrbcE=;
	b=bUEWm/rXTMO30qiduGwNkwQI4hFEpW0TE2Id185BEq2wqvZau5yLZvcTxE0nKCwH8DSo
	 focx09Fk4GVrLl16ejjN/mAWteNH6FJd5I65YklA+V7S5t8gq+6xWITrjTkTHzpmhdYd7
	 x+AWGb5izTiWOzDbH5uIBAJhHTmuardf1mde+7irjFzuoEpgL1IlJPtypgGb7M281bRlD
	 VFw4hWAe+5eoLEPQPcIusA9pNpDbmg3WTUXyEmERh3+nzu2q/IzvSgXoVDsPGBLunpVSt
	 iMnJ1AZ3C2osb1MjN7ql3UMu/rL5ZDkojX+s2kJcbcT5Sc1StSbe7y/nJbvmRiTYk4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--wyihan.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=fUlS92c1;
	arc=none smtp.remote-ip=209.85.214.199
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E751860A3828
	for <linux-coco@lists.linux.dev>; Thu,  5 Nov 2026 23:48:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E751860A3828
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wyihan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=fUlS92c1
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2e942b1cc86so748505ad.1
        for <linux-coco@lists.linux.dev>; Thu, 05 Nov 2026 15:48:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793922481; x=1794527281; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3APDwUUBO5Tor+FhWze8o86U6Ry1uRslwxSo4XqrbcE=;
        b=fUlS92c1AFfJidacqwWwGyNgUdzjgr2Y2klW+1vNX3SxZrJp0/QZVzdNC33TSbkcVC
         A52Q3I+Jy0RbayJ3oXHFt9Hnk4vWzuCiqvytQrMuoPzsG3nafQM/Vf5rjSk3oSiLuR2w
         SG3jYWoANBUdJGJY3HbnXyg9zmQkPUut/bmdaOKwKxPyoX0swRlxkKy3NnAepRR4mq8N
         +vMYP+sRnNyi25q9MaxFlFIg2kdtbA3QvfFaG3cqhk5iGBWnbuXmyud7m5xVFEsuxjfM
         Ca9qDUEpPaBeb8gkXUqnjmhOb66cTZI5m6Wyi/8h1Ek6NrJjDCFMzXuCj7+ZS7Z/sV8P
         6Ajg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793922481; x=1794527281;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3APDwUUBO5Tor+FhWze8o86U6Ry1uRslwxSo4XqrbcE=;
        b=cmbmYhYjSSu1k4FtFGRQmOIjuuiEedFvT81EAwLJXlo3GqGHUkHr9NbNlouW9/lPlx
         nd+xiJFLqobfOaAzA3OdXly4UV2GS0cg3mo74rgx2/j/PhDzXC8Ign2Nl7rTTbT+/yna
         S3H8kJB25Ku/thUjlnDz/yVinRTO3jffCBGUir8RmDyQQXxX3giAPTkdEo1LgOy4Vp1I
         hCINciDBFshoJgjG4so/cw4aaZRvnmPKt8mLsus4SsOz7an2JW2Yk1lXnDzXK5kbif2v
         NDI7DFYhOHR+4uVClhjEKEoEtH6pNAWOUh0p09jdkjC77Xf9iQcrn6KGYQkNjsSun8bl
         hMOg==
X-Forwarded-Encrypted: i=1; AKwUvBzJ9q5EW/L9bTkTHgt+s3ZmIdrnLAGnelXlnJszJfnpLxKSJjDYVKNIixJMBjnQJvT7+eEGrbKOsjTg@lists.linux.dev
X-Gm-Message-State: APuU4Z8yN+7o6DjLNaMca7VWx2bJkPAyqDtqsgpdo0rdqRN8pW7ICOUQ
	M4doFygsd2zVXRj3xVjMJDZqW/R1Qtps2G+oE1Bu0Xz2F5hSuFIoafOH4RjWvPFfLQRLyJPou9o
	xVolxwg==
X-Received: from plhn7.prod.google.com ([2002:a17:903:1107:b0:2ea:775e:19b7])
 (user=wyihan job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:ecd0:b0:2e9:9522:ed3b
 with SMTP id d9443c01a7336-2ed40e0f220mr10754625ad.70.1793922480859; Thu, 05
 Nov 2026 15:48:00 -0800 (PST)
Date: Thu, 05 Nov 2026 23:47:04 +0000
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793922452; l=3389;
 i=wyihan@google.com; s=20260319; h=from:subject:message-id;
 bh=rtaSAm22wUuQqMoCfkhcKnDPwilIcSWfTJAYTINBIKY=; b=q/dD+BNThuDw5f3at4kbEcwCii+6ek0wqsmjTN3LQGQmhXgtKQX6+UCbiVQitmA5mNX1BEa4R
 9z2eYcAE3KgA05oLcdk6QFkljZrZqgcF5VZUP/WWlOV1hgn5CBvSC7J
X-Mailer: b4 0.14.3
Message-ID: <20261105-tdx-selftests-v16-20-2024e8fa517a@google.com>
Subject: [PATCH v16 20/20] KVM: selftests: Add TDX lifecycle test
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
Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
---
 tools/testing/selftests/kvm/Makefile.kvm           |  1 +
 .../testing/selftests/kvm/include/x86/processor.h  |  1 +
 .../selftests/kvm/include/x86/tdx/tdx_util.h       |  5 ++++
 tools/testing/selftests/kvm/x86/tdx_vm_test.c      | 33 ++++++++++++++++++++++
 4 files changed, 40 insertions(+)

diff --git a/tools/testing/selftests/kvm/Makefile.kvm b/tools/testing/selftests/kvm/Makefile.kvm
index ab797c8dd497..1ea7b42db22d 100644
--- a/tools/testing/selftests/kvm/Makefile.kvm
+++ b/tools/testing/selftests/kvm/Makefile.kvm
@@ -166,6 +166,7 @@ TEST_GEN_PROGS_x86 += x86/triple_fault_event_test
 TEST_GEN_PROGS_x86 += x86/recalc_apic_map_test
 TEST_GEN_PROGS_x86 += x86/aperfmperf_test
 TEST_GEN_PROGS_x86 += x86/guest_memfd_conversions_test
+TEST_GEN_PROGS_x86 += x86/tdx_vm_test
 TEST_GEN_PROGS_x86 += access_tracking_perf_test
 TEST_GEN_PROGS_x86 += coalesced_io_test
 TEST_GEN_PROGS_x86 += dirty_log_perf_test
diff --git a/tools/testing/selftests/kvm/include/x86/processor.h b/tools/testing/selftests/kvm/include/x86/processor.h
index 4db0c7009876..4c390edb634b 100644
--- a/tools/testing/selftests/kvm/include/x86/processor.h
+++ b/tools/testing/selftests/kvm/include/x86/processor.h
@@ -396,6 +396,7 @@ static inline unsigned int x86_model(unsigned int eax)
 #define VM_SHAPE_SEV		VM_TYPE(KVM_X86_SEV_VM)
 #define VM_SHAPE_SEV_ES		VM_TYPE(KVM_X86_SEV_ES_VM)
 #define VM_SHAPE_SNP		VM_TYPE(KVM_X86_SNP_VM)
+#define VM_SHAPE_TDX		VM_TYPE(KVM_X86_TDX_VM)
 
 #define PHYSICAL_PAGE_MASK      GENMASK_ULL(51, 12)
 
diff --git a/tools/testing/selftests/kvm/include/x86/tdx/tdx_util.h b/tools/testing/selftests/kvm/include/x86/tdx/tdx_util.h
index 67e717521409..cef54d2676bf 100644
--- a/tools/testing/selftests/kvm/include/x86/tdx/tdx_util.h
+++ b/tools/testing/selftests/kvm/include/x86/tdx/tdx_util.h
@@ -12,6 +12,11 @@ static inline bool is_tdx_vm(struct kvm_vm *vm)
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
2.56.0.455.g6c5a503b38-goog

