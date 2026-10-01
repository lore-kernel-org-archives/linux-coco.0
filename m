Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FAA953CA8F
	for <linux-coco@lists.linux.dev>; Thu,  1 Oct 2026 19:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790883548; cv=none; b=Yjc4CY2EK1MW77OjA6pIJCTBkhT9iKdLrR6TTdT/WUDs1nlv14RsTMEQOnHIvznYBietF4epceUMcvvX6vLcnRsQ3kxbTIu+pRYucMIJAzlnZDm00XLH0V+kCAh24QMwbSPAbDMrIJvZM2yzbB0XiBVqOkVy7vIRNqIq+GhJVRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790883548; c=relaxed/simple;
	bh=dVXSyhg/g9o0I+LsPbLg9Ann6ALR6u7liqDjjRTBXiw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=n9JhlKHaG0K3SXbJlw29teO5f+Eq8iQXr686WlmwIalyL6TSSexJDmKyGOjwO068T+G/HQcBsXqfULK0UkDEu7k2QMxn9zZrMIbO2X6mSNI+71V2qQikMyU3Mi+D0VgtloYuytpmNd5JUBNXU40vg3pqcdpHsuvb1dgQEoVmYns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--wyihan.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qt5BXlvh; arc=none smtp.client-ip=209.85.214.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wyihan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qt5BXlvh"
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2df5a65671eso14426925ad.1
        for <linux-coco@lists.linux.dev>; Thu, 01 Oct 2026 12:39:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790883542; x=1791488342; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MyA/uAMna8xAgobn/jD2jjUCPNIFZIu1vX7TPIQYo1A=;
        b=qt5BXlvhabUdM0wQu7057jCEB36YDKVmDCN15YOAmiRbQE70b2WsevtBBLCxw17G7b
         tl4yOK4gffiC9+9AaIK/uE071W4K6o19AufCYqj3T9NYHrxawlqHnYElcqofjr3CAukn
         qRdTvQI91MTbRqxZilJ8AufvmR067hNH6v8kTl4yp79XMB8qLet3A3hRQIkNvtoF6fyF
         eJr+OT4Pc4F4hheCcdBRIUQM+kIHwDVy84032FkDXotvRcw9uS5IGSethHWWqhWWI3Hx
         Sbf8qkkxrx0XXMwQrFrWCAuDJfTUY2D1WaSyQ6OlOGN3Wa+cQIaTe0ojBmzzh3atotJr
         RfFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790883542; x=1791488342;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MyA/uAMna8xAgobn/jD2jjUCPNIFZIu1vX7TPIQYo1A=;
        b=o9HoLoymyCgK3Az354WqwLYIlUpqXjvenlzZs2njTtzz9Bz08cUnt6HsqvKx3rLM/i
         T7A3tfEQUQmG8QRmtB14sXsjFbIjsxGgXvGgOdXL21lfSSVa+VPl0agOQxTVTd9+sTN1
         2+lsVEAEeyUmoK9F0AUIWFsv/RtwKAl0JJ6LINwS6wrx4lGLM7+Ai8MI7/UWNHDtqTCs
         hdDabMDninlRYLIqdBOjkNsUGmEicD2uMJwF1H1aEz1AYTu7kryol2dbQTyIaePKGlxg
         QaWJ0T7XtwlWxYDGhifpGqt6XRsVJnCEc+tPjegCMmb53OTztIX5fifheoGZ046zRq+J
         sdHw==
X-Forwarded-Encrypted: i=1; AKwUvBx0CfRCypNcaru4NZldpXPIi+4WIJV0yctO4DjQiee7q2poxy8yfeqOzXk6yya5yV4VE+iGxoMFXLqL@lists.linux.dev
X-Gm-Message-State: AFq9FYKDsNoX+P6NuYGPTCl/hFmKyrIxhUVwdHwJmW/o+68x/2dzbQJX
	tvQaLqzd7IUX5O9ZEBg0AEonL0TO/FIHxEP3w/gYFaKu1Wxau/wVCnbGKERm5zQRwwW6bMpmjb5
	ezDDgEw==
X-Received: from plan4.prod.google.com ([2002:a17:903:4044:b0:2df:8ab5:8354])
 (user=wyihan job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:e881:b0:2df:91ae:7ab3
 with SMTP id d9443c01a7336-2e49b647128mr3061845ad.9.1790883541552; Thu, 01
 Oct 2026 12:39:01 -0700 (PDT)
Date: Thu, 01 Oct 2026 19:37:49 +0000
In-Reply-To: <20261001-tdx-selftests-v15-0-7c62a5d8a992@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20261001-tdx-selftests-v15-0-7c62a5d8a992@google.com>
X-Developer-Key: i=wyihan@google.com; a=ed25519; pk=cRi0fKzS5BMxlHyHY2pJv3w/1zcgfYKr6EYGYppdMYc=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790883521; l=3595;
 i=wyihan@google.com; s=20260319; h=from:subject:message-id;
 bh=6S4+/n1Z4TWZv0P7ShyY84tJxM7Qef8lyBCMU8CqznE=; b=oIR9GF334oomBSIMnczcLkzWF69jFJVMBfoULZ9Qp2w2H9vDkIV7B9Vf59axzv2NAOYfHL4Cs
 ARdUOmgQ/kWDiruEE1+VmnBiQwDHeZJkD+NYGGi5YC1dsAoV0KLFi77
X-Mailer: b4 0.14.3
Message-ID: <20261001-tdx-selftests-v15-22-7c62a5d8a992@google.com>
Subject: [PATCH v15 22/23] KVM: selftests: Add support for TDX ucalls, via TDVMCALL_REPORT_FATAL_ERROR
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
is perfectly suited for passing information to host userspace, is both the
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
---
 tools/testing/selftests/kvm/include/x86/tdx/tdx.h |  7 ++++++
 tools/testing/selftests/kvm/lib/x86/ucall.c       | 27 ++++++++++++++++++++++-
 2 files changed, 33 insertions(+), 1 deletion(-)

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
index c003df3c7b8a..c1cd32d68464 100644
--- a/tools/testing/selftests/kvm/lib/x86/ucall.c
+++ b/tools/testing/selftests/kvm/lib/x86/ucall.c
@@ -5,8 +5,28 @@
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
+	if (run->exit_reason == KVM_EXIT_SYSTEM_EVENT &&
+	    run->system_event.type == KVM_SYSTEM_EVENT_TDX_FATAL &&
+	    run->system_event.data[12] == UCALL_TDX_MAGIC)
+		return (void *)(run->system_event.data[13]);
+
+	return NULL;
+}
 
 static void ucall_x86_do_ucall(gva_t uc)
 {
@@ -37,6 +57,11 @@ static struct {
 
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
2.56.0.rc1.315.gc6ed9934b7-goog

