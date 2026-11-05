Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793922481;
	b=ppMk/FfisxaiQlWvZv2HljDwZjVG5WZ/z+BlzeuV5RmKVvMQBoPNQ5JeoAV/0L18YgSH
	 rHKYPlvPxNpq2J+t+KJRF7U3sH1m32P14PT8ji3eW8qleBCenrvCPZtbjhxI1eEjF7bFC
	 rzIFwdzmc5UE/k0yQMS96n8SrK6NB4GAlhBiX3VFWydEqC3TRdhvYyzoHQpBtgoeqHBFm
	 iyPTA1Yv3/8/iZ2QVHsmnpZoM1+sYRyoXkdhn/dkYXHbDIA6cDmRJrjRD1cmorAVhavGo
	 j8jIk8p7q3iEhSMai2+y4KrKPa/x4M6fF/YM/tG/c8f0IO8S+H7MpAfcM16ZhquRuKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793922481;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Developer-Key:X-Developer-Signature:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=a4has+3ZOallPubnO5PCgDkTmmWpt2dIq6/LlaB8Yy8=;
	b=QdqRzmeSIC8SWp60KSAPSFX7cIlqzqHEkcyzAdlWC0yamy4H88vJkwCicIYaDpnVneOT
	 kSvRs2DE3wKwBeUpBUmaw5uSkJI4UhDYdJjBSkdwtbkR51qLtJRCTRpfPYRe0Cr2QOKSE
	 +l34Nrxw/+O0s6IrvX0KjqvfB5nmp1dxwU62onSYgICRzuRAmH3iKoo3IjsCdCAyXKYIE
	 taydjfrFGjOFpgTfZGF4pohUqbxH/NIdurEoqMPusRnlblYinjSv838r+pa5889EIyNcb
	 UKU8FvNLwc6WHJ/C3J7BzjQ/pM8UmlOmY/6ZfjZT1oWiB0qJFIf/jKEPfr6tqqLaEng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--wyihan.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=SVTu4FKz;
	arc=none smtp.remote-ip=209.85.215.198
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF6B660A263D
	for <linux-coco@lists.linux.dev>; Thu,  5 Nov 2026 23:48:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF6B660A263D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wyihan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=SVTu4FKz
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cdb155f3229so44979a12.2
        for <linux-coco@lists.linux.dev>; Thu, 05 Nov 2026 15:48:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793922480; x=1794527280; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a4has+3ZOallPubnO5PCgDkTmmWpt2dIq6/LlaB8Yy8=;
        b=SVTu4FKzd+scRwdPd+10AxXKnnmOxC81ItZ9ZWdO7gvc1rBQIlirO6RxwYsMgxYF2H
         mt6Mzol4zsdLuDl45gvkMje/YGrazpTmL2sH+aTjB2GxjK/WmyGIrru7SfOroqe69iby
         Jjy7A7trwwLf9wSsXhsk4ZNjfduB3fxCZB/Ts5dBQW0u+mf7FeZcfyY9ZsfQPVN6p7lc
         9h4dwCbwATmpXyRFTVnYuRH0s3mlqPMuhBW8yYZHaphjQdlDhoe+PmpnsoaHkgJ3ZVs4
         hEJQwKASgEjmTBwFP2MIoKCi+UMC2rHAt63Ujuvy2WwCQlX0ybvCvAb3SAov15qAoSZv
         OpVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793922480; x=1794527280;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a4has+3ZOallPubnO5PCgDkTmmWpt2dIq6/LlaB8Yy8=;
        b=flAGeYHBtvn4T9DDg4uXHmUMgL5ZXDZquOeAxWGLBx/wTFg4/4rwDHu2eGUFIunH1h
         enV1daIPFGeENNeUySIDJ5H7NxOYLUxS8ElJzExguziPjD0cX/0DxU0n48UYG4gyY6Ic
         4de7IR+sRBDPvmh0cHRflAWzYUO/VWbLF07RLV0wy8PNA4vPETSRn+uSxiwtWv5VlSwO
         AfHv4sAubEmLBh3lSzLG3euXrmL6eQFZe092dhAZn87yxSCDhCuyKXWFQnp7K9T5jqtN
         c8ReaEJyOMuIO5Mot4tl7u+AJGrlJ3EIUDRFA2GN6OibQS2Lj/Sfsc67EOD1rhsAOvem
         vTKw==
X-Forwarded-Encrypted: i=1; AKwUvBy2JCIt0gxuuxtkyAeZYba32WtwXA1N2nCeFheEfG391HMQXvNsQuODeCbknSfeB+4YTLSLw7P+K8gS@lists.linux.dev
X-Gm-Message-State: APuU4Z94dMnmTWaOZztLNnLMbCIvJJSCeCOWq5ioVn0AAaC2VR2Ox8Ok
	0x4vnHr6T1qFvLpEW8ofv9yLuzL3ylDaz8K+Ssl5ixVH386ljzdq0T34MhGhYJ3ua8HHXbTn1oB
	8RvSKPA==
X-Received: from plcu11.prod.google.com ([2002:a17:903:308b:b0:2e3:bd2:38ec])
 (user=wyihan job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:3d05:b0:2e9:9522:ed3a
 with SMTP id d9443c01a7336-2ed4198726fmr11039015ad.22.1793922479962; Thu, 05
 Nov 2026 15:47:59 -0800 (PST)
Date: Thu, 05 Nov 2026 23:47:03 +0000
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793922452; l=3781;
 i=wyihan@google.com; s=20260319; h=from:subject:message-id;
 bh=ye0dh2bn0KuuGDqjMywSIYVHmjvFFWLyKdkM/LtZa10=; b=vgff3Sgn5XANvkH0beXOhFTw4ETPjNQv8H6v3gSbnsRrc4f3vCOyzTiujFNd/P7ja9qHSfLIX
 gRypAWyRJDSChnyrxV5WGD7fjHqXI9tiPxKrooyiMg4b2CXatxrlq1x
X-Mailer: b4 0.14.3
Message-ID: <20261105-tdx-selftests-v16-19-2024e8fa517a@google.com>
Subject: [PATCH v16 19/20] KVM: selftests: Add support for TDX ucalls, via TDVMCALL_REPORT_FATAL_ERROR
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

From: Sean Christopherson <seanjc@google.com>

Add support for doing ucalls on TDX by abusing TDVMCALL_REPORT_FATAL_ERROR
to pass the address of the payload to the host.  The "fatal error" TDVMCALL
is perfectly suited for passing information to host userspace, as both the
TDX Module and KVM allow the guest to pass (almost) all registers to the
host, i.e. provide enough of a data payload to make a collision with a real
fatal error practically impossible.

TDX can't use port I/O, as the TDX ABI doesn't allow the guest to share
arbitrary register state with the host on a port I/O exit, and the port I/O
data payload is limited to 4 bytes, i.e. would potentially truncate the
ucall address.

Alternatively, TDX could use MMIO, but using a magic emulated MMIO address
is fragile (see the TODO in __vm_create()), especially for TDX since TDX
doesn't support read-only memslots, i.e. doesn't have line of sight towards
addressing the TODO.  E.g. TDX could hardcode the address to something that
is all but guaranteed to be unused on x86, e.g. the I/O APIC base address
or the HPET address, but that doesn't truly address the fragility concerns,
and it's ugly because ucall_arch_init() would completely ignore the passed
in @mmio_gpa despite obviously utilizing emulated MMIO.

Signed-off-by: Sean Christopherson <seanjc@google.com>
Signed-off-by: Lisa Wang <wyihan@google.com>
Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
---
 tools/testing/selftests/kvm/include/x86/tdx/tdx.h |  7 +++++
 tools/testing/selftests/kvm/lib/x86/ucall.c       | 31 ++++++++++++++++++++++-
 2 files changed, 37 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/include/x86/tdx/tdx.h b/tools/testing/selftests/kvm/include/x86/tdx/tdx.h
index d41a1efc8a63..9982aaaba885 100644
--- a/tools/testing/selftests/kvm/include/x86/tdx/tdx.h
+++ b/tools/testing/selftests/kvm/include/x86/tdx/tdx.h
@@ -4,6 +4,13 @@
 
 #include <linux/types.h>
 
+/* TDX hypercall Leaf IDs */
+#define TDVMCALL_GET_TD_VM_CALL_INFO		0x10000
+#define TDVMCALL_MAP_GPA			0x10001
+#define TDVMCALL_GET_QUOTE			0x10002
+#define TDVMCALL_REPORT_FATAL_ERROR		0x10003
+#define TDVMCALL_SETUP_EVENT_NOTIFY_INTERRUPT	0x10004
+
 u64 __tdvmcall(u64 fn, u64 r12, u64 r13, u64 r14, u64 r15);
 
 #endif /* SELFTEST_KVM_TDX_TDX_H */
diff --git a/tools/testing/selftests/kvm/lib/x86/ucall.c b/tools/testing/selftests/kvm/lib/x86/ucall.c
index 3aec4dd46d1b..2a1c61785e5f 100644
--- a/tools/testing/selftests/kvm/lib/x86/ucall.c
+++ b/tools/testing/selftests/kvm/lib/x86/ucall.c
@@ -5,8 +5,32 @@
  * Copyright (C) 2018, Red Hat, Inc.
  */
 #include "kvm_util.h"
+#include "tdx/tdx.h"
+#include "tdx/tdx_util.h"
 
-#define UCALL_PIO_PORT ((u16)0x1000)
+#define UCALL_PIO_PORT		((u16)0x1000)
+#define UCALL_TDX_MAGIC		0xabacadabaULL
+
+static void ucall_tdx_do_ucall(gva_t uc)
+{
+	__tdvmcall(TDVMCALL_REPORT_FATAL_ERROR, UCALL_TDX_MAGIC, uc, 0, 0);
+}
+
+static void *ucall_tdx_get_ucall(struct kvm_vcpu *vcpu)
+{
+	struct kvm_run *run = vcpu->run;
+
+	/*
+	 * KVM_SYSTEM_EVENT_TDX_FATAL stores R0..R15 in data[0..15].  R12
+	 * holds the ucall magic and R13 holds the ucall GVA.
+	 */
+	if (run->exit_reason == KVM_EXIT_SYSTEM_EVENT &&
+	    run->system_event.type == KVM_SYSTEM_EVENT_TDX_FATAL &&
+	    run->system_event.data[12] == UCALL_TDX_MAGIC)
+		return (void *)(run->system_event.data[13]);
+
+	return NULL;
+}
 
 static void ucall_x86_do_ucall(gva_t uc)
 {
@@ -37,6 +61,11 @@ static struct {
 
 void ucall_arch_init(struct kvm_vm *vm, gpa_t mmio_gpa)
 {
+	if (is_tdx_vm(vm)) {
+		ucall_x86_ops.do_ucall = ucall_tdx_do_ucall;
+		ucall_x86_ops.get_ucall = ucall_tdx_get_ucall;
+	}
+
 	sync_global_to_guest(vm, ucall_x86_ops);
 }
 

-- 
2.56.0.455.g6c5a503b38-goog

