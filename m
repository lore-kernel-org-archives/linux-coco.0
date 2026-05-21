Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A23463839AB
	for <linux-coco@lists.linux.dev>; Thu, 21 May 2026 23:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779405464; cv=none; b=exqopCVh/MU8428cXFfYi+V4kf4gF4UT7rEhdE5RCVIbYJcVKS10b0pD3H7ul9NKQ/VOgKEqd0IQwLRKd+xFwRumfFEEa8iRuqmfWB8S/ab8GGdp1oRgzJ+wuSHBXSARqpxxBs3evi2GxzOESevY3acRj0uvtiX32tTmynDb/4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779405464; c=relaxed/simple;
	bh=8ym0n79Mz6+GweMZSkeYy57YJ4KREmGpmy6oG1UrCOk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=jdDRELaSRyxDAOrLNteio5bSgDQ1az4BrFUhGkpOT+gM0KvQ9iN7IirdXA3BvKTNi061gZcUpevSfH8tCUjYJDthF2SkcfGBJwZim0UWATi/te6XJUtKV1jvTK6EdQZIgGoO70wfZdspsaQ/BTia/qf4n6pI1EpoacBztF5v4A0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--wyihan.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VnEnojC2; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wyihan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VnEnojC2"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-2ba6fe41283so68688515ad.1
        for <linux-coco@lists.linux.dev>; Thu, 21 May 2026 16:17:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779405462; x=1780010262; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=YIjV3Fpz1AHb9XpyYS3cxfTD/+OUKDFYDMCz40m7qCY=;
        b=VnEnojC2CAwIvRDseH0zv2H5h4bzenUqwGU5SgK7AwOyH/+Txyn49pe13UU+LAhhMH
         dB9QTDUlnbzKhcWChP34NDMR42Ud0N3aIOPIbnLkxh6RzPqZqtGV3OjLyfkkDL1QHzqb
         BrTOE/0b4DJHNzzBeP0PMxPp9saZWEDQI5pmXBhFWiIubs3HmzoBp/zHUJoYdoDQK5nQ
         fsFkmyXIoIaFFrWUhnUtGEXZikWV4gb3I3VAiUYPnGaCbcg2HpXBdbJlB0Qf9KbJK9n1
         ljuk3KvvjW/SVstU8quDBvW8qbM6TSe89DRGJ4y0s21IyakbdpzrTzYzBR1Nv23LGXwo
         Zq/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779405462; x=1780010262;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YIjV3Fpz1AHb9XpyYS3cxfTD/+OUKDFYDMCz40m7qCY=;
        b=XJJUmTFtG+VPr9GDSeEWLxz9H6aT5iJFckoCnVbJ8aBGLMsZ0djMLs+QLnKAQZGgao
         6IqxPppDqjCFlLCF2W7FHmS4trZQoBStspZwUGRQ9eJX/fmZ9cittCEGZLaaNYNo0U65
         87ZryNFNke3rHfm3pJ9nCyJi3uUzNgilM+sM+ORYO7RZ8+hSCaVcLLmRALH3ntfWwXbT
         rB9bu7qdLJuvYg8P+tDx3FQIVZt9YI4AMB18QkiwkFCWVlJifEeJfbArgzm9Xc4z+KQ8
         phhFjH2mzAJ7TazcFtsoO3DBeou4/VwheYAK72OoM/UxZ/eyCN+cfJZ94RlhPl71KvC8
         0gng==
X-Forwarded-Encrypted: i=1; AFNElJ9dSUn65qibAwGHmgFRZs/Y778JDb7woXJtnft3KmahLbFO+K2B8TQmpXIAmac2C1J2k0KHAkiCoxN3@lists.linux.dev
X-Gm-Message-State: AOJu0YxlE+q76YGP9cutvQ4WaxaPgmTKXB5Bn2FmsEljgr40oKhE6Ldv
	fPH9zTipjlyqbjTwHOT2a7NxW/36L7CJ+V9CrKjWqoUIv4v704hbY3OJD3vxoNIB3OJJ7WS99lY
	ppNiOpg==
X-Received: from pjbin12.prod.google.com ([2002:a17:90b:438c:b0:369:74c4:4855])
 (user=wyihan job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4e84:b0:369:946d:32fa
 with SMTP id 98e67ed59e1d1-36a676ee27amr1240497a91.5.1779405461532; Thu, 21
 May 2026 16:17:41 -0700 (PDT)
Date: Thu, 21 May 2026 23:17:02 +0000
In-Reply-To: <20260521-tdx-selftests-v13-v13-0-6983ae4c3a4d@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260521-tdx-selftests-v13-v13-0-6983ae4c3a4d@google.com>
X-Developer-Key: i=wyihan@google.com; a=ed25519; pk=cRi0fKzS5BMxlHyHY2pJv3w/1zcgfYKr6EYGYppdMYc=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779405439; l=3234;
 i=wyihan@google.com; s=20260319; h=from:subject:message-id;
 bh=j3tpvq/GgxXgc3htDFWvHIgX4JqpFWKTcGg78pPJQ9w=; b=QBwJx23Jf4cNjfCxhnsSUVVUpHdxsCGCy9Y0fv6Zbpv7mfqosATQ+ArS7j5s1SirdXatbWk81
 BfTl33UGbycCNYXAdZZkK3GiKX/gihkbJ9yLMSGgfE7KqIrePSUCh+C
X-Mailer: b4 0.14.3
Message-ID: <20260521-tdx-selftests-v13-v13-21-6983ae4c3a4d@google.com>
Subject: [PATCH  v13 21/22] KVM: selftests: Add ucall support for TDX
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

From: Ackerley Tng <ackerleytng@google.com>

Implement TDX ucall using TDCALL-based MMIO to pass the ucall address
from the VM to the host.

In standard KVM selftests, ucall uses a PIO instruction as a trigger
to exit to the host, which then retrieves the ucall address by reading
the guest's RDI register. This approach is incompatible with TDX
because the host cannot access guest registers.

Furthermore, PIO exits only expose 4 bytes of immediate data, which
is insufficient for a 8-byte ucall address. By using TDCALL-based MMIO,
the VM can share the full 8-byte address in a single exit without
refactoring the common ucall framework and other non-x86 architectures.

Signed-off-by: Ackerley Tng <ackerleytng@google.com>
Co-developed-by: Sagi Shahar <sagis@google.com>
Signed-off-by: Sagi Shahar <sagis@google.com>
Co-developed-by: Lisa Wang <wyihan@google.com>
Signed-off-by: Lisa Wang <wyihan@google.com>
---
 tools/testing/selftests/kvm/include/x86/ucall.h |  6 -----
 tools/testing/selftests/kvm/lib/x86/ucall.c     | 30 +++++++++++++++++++++++++
 2 files changed, 30 insertions(+), 6 deletions(-)

diff --git a/tools/testing/selftests/kvm/include/x86/ucall.h b/tools/testing/selftests/kvm/include/x86/ucall.h
index 0e4950041e3e..7e54ec2c1a45 100644
--- a/tools/testing/selftests/kvm/include/x86/ucall.h
+++ b/tools/testing/selftests/kvm/include/x86/ucall.h
@@ -2,12 +2,6 @@
 #ifndef SELFTEST_KVM_UCALL_H
 #define SELFTEST_KVM_UCALL_H
 
-#include "kvm_util.h"
-
 #define UCALL_EXIT_REASON       KVM_EXIT_IO
 
-static inline void ucall_arch_init(struct kvm_vm *vm, gpa_t mmio_gpa)
-{
-}
-
 #endif
diff --git a/tools/testing/selftests/kvm/lib/x86/ucall.c b/tools/testing/selftests/kvm/lib/x86/ucall.c
index e7dd5791959b..c8e3418d53af 100644
--- a/tools/testing/selftests/kvm/lib/x86/ucall.c
+++ b/tools/testing/selftests/kvm/lib/x86/ucall.c
@@ -5,11 +5,34 @@
  * Copyright (C) 2018, Red Hat, Inc.
  */
 #include "kvm_util.h"
+#include "tdx/tdx.h"
+#include "tdx/tdx_util.h"
 
 #define UCALL_PIO_PORT ((u16)0x1000)
 
+static u8 vm_type;
+static gpa_t host_ucall_mmio_gpa;
+static gpa_t ucall_mmio_gpa;
+
+void ucall_arch_init(struct kvm_vm *vm, gpa_t mmio_gpa)
+{
+	vm_type = vm->type;
+	sync_global_to_guest(vm, vm_type);
+
+	if (is_tdx_vm(vm)) {
+		host_ucall_mmio_gpa = ucall_mmio_gpa = mmio_gpa;
+		ucall_mmio_gpa |= vm->arch.s_bit;
+		sync_global_to_guest(vm, ucall_mmio_gpa);
+	}
+}
+
 void ucall_arch_do_ucall(gva_t uc)
 {
+	if (vm_type == KVM_X86_TDX_VM) {
+		tdx_mmio_write(ucall_mmio_gpa, MMIO_SIZE_8B, uc);
+		return;
+	}
+
 	/*
 	 * FIXME: Revert this hack (the entire commit that added it) once nVMX
 	 * preserves L2 GPRs across a nested VM-Exit.  If a ucall from L2, e.g.
@@ -46,6 +69,13 @@ void *ucall_arch_get_ucall(struct kvm_vcpu *vcpu)
 {
 	struct kvm_run *run = vcpu->run;
 
+	if (vm_type == KVM_X86_TDX_VM) {
+		if (run->exit_reason == KVM_EXIT_MMIO &&
+		    run->mmio.phys_addr == host_ucall_mmio_gpa &&
+		    run->mmio.len == MMIO_SIZE_8B && run->mmio.is_write)
+			return (void *)(*((u64 *)run->mmio.data));
+	}
+
 	if (run->exit_reason == KVM_EXIT_IO && run->io.port == UCALL_PIO_PORT) {
 		struct kvm_regs regs;
 

-- 
2.54.0.746.g67dd491aae-goog

