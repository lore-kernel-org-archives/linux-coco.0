Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F1F25372D2
	for <linux-coco@lists.linux.dev>; Thu,  1 Oct 2026 19:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790883539; cv=none; b=MB7SpuPYKlUSe0/Q8D+uTo+EapL/y6+1ruc9QxMGbbjR6DyAuj9CGQfjl9jLPYFYRyrR1NSehqpoGhCcA43e2brwloCc2wJEa51Za5iv1xDMZa3sNjzsbz3CmkZV6W3upijSyWpn7/HIDfjF/lYcr9ZsaQDrd3Dg/vAo+t+chBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790883539; c=relaxed/simple;
	bh=pVh3W7IgL0tb+3VmdaT+bHcGzD3aMg5/8PYinx/HcFs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ht/+dIfDh6F9F3KtvZj5qs16Op6gmsC8rvoJ3eO+BZ7Lul82uPVNjA0cRKOJLLEpQbbHZHDYJI7/WY6rndlawYMPwVZEl/TtENvVf1Kr1pOKSTK1lPaHCi5XXO2fDSvzwk/ewC5hpEDS0n/qCxtIwwdOwC8i+ePuVRm7uDb+I9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--wyihan.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=P7hDR2Qg; arc=none smtp.client-ip=209.85.214.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wyihan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="P7hDR2Qg"
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2e2d4a8623bso26814095ad.1
        for <linux-coco@lists.linux.dev>; Thu, 01 Oct 2026 12:38:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790883535; x=1791488335; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6bZLzZb4sU4KEN1U8eHEldtPfXW3XPpsor0ue/9+Hb4=;
        b=P7hDR2Qg/EK+DaOoinvsriKY34ScSg7QsA+2PnufNNxrzlyHDC0e/rIEFeA1VAXYx+
         I4/hkG4kFc7UFqUiTLRprmgb/VPT44neHH1cTcl743smNHb79P6EvnkoQ2gkrfumuHvo
         b6VzJw7sM6w8tpMk/ICWhsIF+w1AWzlb6/3Vrph+X5GyjHFCA0sXJUpRJckIVprp8uyB
         sRH2JdD6gRh5fFFDiIjMipicLLC6Edinw/g5oEBIzm2tHjbuQfIztiSBQpZAkWpWwLNG
         dsJzsWe8kUNqgCK87yu4LMPWLaMSzXWP4yocDu/AKBW2EoXJJuEQS72pBmwVB/6Tf+FY
         v7mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790883535; x=1791488335;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6bZLzZb4sU4KEN1U8eHEldtPfXW3XPpsor0ue/9+Hb4=;
        b=WKTD2RwQXxb6tzDWB19Y6TCIKxiXdI+uxQ5ZFtiiyRFoHfDHKJgDfLmXDJIXU5uPUx
         nIbTwFKsetq6pdk6aQ5n3KIFQNE5VLmBn7Rin9RHqC+fuiucl6+Sd/Gm0ju83azJEXxS
         UigGNck9ufVICTvQx2ssB3ob0ZE9r4drC8ZBHNAeIlDwN7UeVtV4EzlEviHILbg17vS0
         rTJ5sqh7/LGl+gva2OiHxO62YwF/yf0aY9EbEXYy0HJDgxdGFC4ARtHuVqANOncNh9dk
         mhSWUwrdKXW9UxbnsiXpjTCM/b7ZCO2XHjKXy8E6gei4aEE4ycaBBotZy79Dd4bAva4X
         oW/Q==
X-Forwarded-Encrypted: i=1; AKwUvBxaQVBoY0YH5B6pklIIXDVi84ESCKIX5RdT+PU6ebvN+KyfUZ+sbxV/TtjUohZkHd0Q12a3jKedDZfN@lists.linux.dev
X-Gm-Message-State: AFq9FYKizLW4YYNjVFtgOGGdmSqh4pWRCXjqRuywKqqzRvwvo4XSrUps
	q4X7eXEboiotc6kMsfBliGCjqBsPch7sqqezxz8GT4wubpDipacD4XnRa+bUv1EUE4WPLyYN0tk
	Ep5MaPQ==
X-Received: from plble4.prod.google.com ([2002:a17:902:fb04:b0:2e3:3e4f:56e7])
 (user=wyihan job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:c951:b0:2e3:1ed7:d5d3
 with SMTP id d9443c01a7336-2e49b7f27e2mr3915375ad.67.1790883534303; Thu, 01
 Oct 2026 12:38:54 -0700 (PDT)
Date: Thu, 01 Oct 2026 19:37:41 +0000
In-Reply-To: <20261001-tdx-selftests-v15-0-7c62a5d8a992@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20261001-tdx-selftests-v15-0-7c62a5d8a992@google.com>
X-Developer-Key: i=wyihan@google.com; a=ed25519; pk=cRi0fKzS5BMxlHyHY2pJv3w/1zcgfYKr6EYGYppdMYc=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790883521; l=3422;
 i=wyihan@google.com; s=20260319; h=from:subject:message-id;
 bh=j/m+vrnUGb48Imqx0CMR7UIlIq8TwL0A1eGENaF91Kg=; b=DOEcCJY81kvyAGiiQ4zAi43IcAu7/xLkCVUiC3LZZ0sVAKYGxMJiKW3Wf5HTI2FuCEkLprj9h
 1lTOhqQqdkBB4NtcRKOcK1YgNRU8En3KckALp4hl0HCXLXXuBt7ibpo
X-Mailer: b4 0.14.3
Message-ID: <20261001-tdx-selftests-v15-14-7c62a5d8a992@google.com>
Subject: [PATCH v15 14/23] KVM: selftests: Expose function to allocate vCPU stack
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
	linux-kernel@vger.kernel.org, x86@kernel.org, Lisa Wang <wyihan@google.com>, 
	Ira Weiny <iweiny@kernel.org>
Content-Type: text/plain; charset="utf-8"

From: Sagi Shahar <sagis@google.com>

Introduce kvm_allocate_vcpu_stack() to allocate a vCPU's stack
in preparation for TDX to allocate a vCPU's stack and initialize
its stack pointer.

TDX VMs' registers are protected state and cannot be initialized
using the KVM_SET_REGS ioctl() that is used for normal VMs. A TDX
vCPU's stack address will be a property of the TDX specific boot code
that initializes the vCPUs' stack pointers at boot.

Signed-off-by: Sagi Shahar <sagis@google.com>
Signed-off-by: Lisa Wang <wyihan@google.com>
Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
Reviewed-by: Ira Weiny <ira.weiny@intel.com>
Reviewed-by: Xiaoyao Li <xiaoyao.li@intel.com>
---
 .../testing/selftests/kvm/include/x86/processor.h  |  2 ++
 tools/testing/selftests/kvm/lib/x86/processor.c    | 25 +++++++++++++++++++---
 2 files changed, 24 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/kvm/include/x86/processor.h b/tools/testing/selftests/kvm/include/x86/processor.h
index 8854ee052d29..1eb380dd216c 100644
--- a/tools/testing/selftests/kvm/include/x86/processor.h
+++ b/tools/testing/selftests/kvm/include/x86/processor.h
@@ -1212,6 +1212,8 @@ static inline void vcpu_clear_cpuid_feature(struct kvm_vcpu *vcpu,
 	vcpu_set_or_clear_cpuid_feature(vcpu, feature, false);
 }
 
+gva_t kvm_allocate_vcpu_stack(struct kvm_vm *vm);
+
 u64 vcpu_get_msr(struct kvm_vcpu *vcpu, u64 msr_index);
 int _vcpu_set_msr(struct kvm_vcpu *vcpu, u64 msr_index, u64 msr_value);
 
diff --git a/tools/testing/selftests/kvm/lib/x86/processor.c b/tools/testing/selftests/kvm/lib/x86/processor.c
index da430d4e7765..4a753fb43007 100644
--- a/tools/testing/selftests/kvm/lib/x86/processor.c
+++ b/tools/testing/selftests/kvm/lib/x86/processor.c
@@ -851,12 +851,31 @@ void vcpu_arch_set_entry_point(struct kvm_vcpu *vcpu, void *guest_code)
 	vcpu_regs_set(vcpu, &regs);
 }
 
-struct kvm_vcpu *vm_arch_vcpu_add(struct kvm_vm *vm, u32 vcpu_id)
+gva_t kvm_allocate_vcpu_stack(struct kvm_vm *vm)
 {
 	struct kvm_mp_state mp_state;
 	struct kvm_regs regs;
+	gva_t stack_gva;
 	struct kvm_vcpu *vcpu;
 
+	stack_gva = __vm_alloc(vm, DEFAULT_STACK_PGS * getpagesize(),
+			       DEFAULT_GUEST_STACK_VADDR_MIN, MEM_REGION_DATA);
+
+	stack_gva += DEFAULT_STACK_PGS * getpagesize();
+
+	/*
+	 * Align stack to match calling sequence requirements in section "The
+	 * Stack Frame" of the System V ABI AMD64 Architecture Processor
+	 * Supplement, which requires the value (%rsp + 8) to be a multiple of
+	 * 16 when control is transferred to the function entry point.
+	 *
+	 * If this code is ever used to launch a vCPU with 32-bit entry point it
+	 * may need to subtract 4 bytes instead of 8 bytes.
+	 */
+	TEST_ASSERT(IS_ALIGNED(stack_gva, PAGE_SIZE),
+		    "__vm_alloc() did not provide a page-aligned address");
+	stack_gva -= 8;
+
 	vcpu = __vm_vcpu_add(vm, vcpu_id);
 	vcpu_init_cpuid(vcpu, kvm_get_supported_cpuid());
 	vcpu_init_sregs(vm, vcpu);
@@ -864,8 +883,8 @@ struct kvm_vcpu *vm_arch_vcpu_add(struct kvm_vm *vm, u32 vcpu_id)
 
 	/* Setup guest general purpose registers */
 	vcpu_regs_get(vcpu, &regs);
-	regs.rflags = regs.rflags | X86_EFLAGS_FIXED;
-	regs.rsp = vm_alloc_stack(vm, DEFAULT_STACK_PGS);
+	regs.rflags = regs.rflags | 0x2;
+	regs.rsp = kvm_allocate_vcpu_stack(vm);
 	vcpu_regs_set(vcpu, &regs);
 
 	/* Setup the MP state */

-- 
2.56.0.rc1.315.gc6ed9934b7-goog

