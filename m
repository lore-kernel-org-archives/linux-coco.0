Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47430459AD5
	for <linux-coco@lists.linux.dev>; Wed, 22 Jul 2026 23:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784762073; cv=none; b=bP+Y/i7i8PTuigpma6snRro0I4sdtJITT3pY6nkmbig2j/qTG4e5Y1P3gpVJyIFhWZRH+s7Lp3hZMUJnTKnJ48uUD3jmNgj0C37+Thd5x4wg+50q91C5bJaPuMEYv2DiD6GT9JjAnnNP0KWBrHXzuF/GWLvB7Ugoe4LC8vIvyGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784762073; c=relaxed/simple;
	bh=VFBJ0t/KYzCs2iOyhhGs1fkC9wa+psmJ3ukTJr6kCV8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Nt3CK9+i/HpX8Xwd1B2wbZ6VgaGd5ZvXn2m0eZtHWvG4B5u728REsoaRiADMjFwggbVqRPOZxrefAZaDEGCyv+mKKguy4SDqNinqfSfra5uhIkwiS2lLWHKn/TGF8Xjn4i8RrujA84W9+oS6fHwN6CQ3TJqSqe4AgzJoLXSAYqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--wyihan.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hOSRLHQE; arc=none smtp.client-ip=209.85.214.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wyihan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hOSRLHQE"
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cf6acd760cso588155ad.3
        for <linux-coco@lists.linux.dev>; Wed, 22 Jul 2026 16:14:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784762070; x=1785366870; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hvtcY/6dFCZntPWOUjpqqoF1u1G6R7N65DKzf2Q1vxo=;
        b=hOSRLHQE9HqSQdSBoW3rnEVe4hQH2ffXPb5VWcwzLfZFdbnq1z+ZGv5dM9Z1LSimKe
         ygeI1G+OjaEQ2VDd+/nOSIUcxRKHCgIsJWVI78m3fs9UGpkbeuhqLWgjzzxKKsCww06d
         TgMIHyyFUm2X+JXVIUjJWSKjdpZqHVvxaizaeZiT73wLCMPFL5A5fgWTSqNfJPrHWYLV
         9Yi4X5Dt2h3HKvpE0Y2PYSCEcPW8zQbJWsUCz4vq3QKqmkU9N2YhH3v9Qs05H3hkIU8/
         bc0PsS8WpaqRrO/UqTiy5EW3axfwx7e19lmHc3e0mNG5hNsQwWuhy5i7CJgCvmW7qNqF
         pQMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784762070; x=1785366870;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hvtcY/6dFCZntPWOUjpqqoF1u1G6R7N65DKzf2Q1vxo=;
        b=S3z/bOWTe1LGzJy4CxqRGwatHsqRU5DBGe+e/bBpWHa8n/8RlSnA8N3WHuRU3zNgaO
         VwOHfy2l10Y026nHOdTIqP6++6mBsvrARe29bg3eGhApMAu/l+KnDW9iLdAexRuY56QD
         XrwtwyeK7CLpa/OI778VMk4/UX2uZj2w2eFEk+GkEd1Ps7ULDuColARpkFpA9EORec58
         9qFw/H00GnFy7l6NmixdK6CxrRWbMfGHx/3gplqtqjhsysWmuEz/ZXYdLhUpYbsCj5as
         IzE8lo7HtHQgwG0/IWcyPTtU/tPnJeVS/KQ9p8watfotHV+Kg6AuBL51bRe2EY5xo2Fm
         Uixg==
X-Forwarded-Encrypted: i=1; AHgh+Rp8NhFdimnrA7OZVOp2xKX3L/wm6g33TozyWNGs1U0fO6Dc4Y+Rja5ESwIhilpV7XNFhnP8TbNeH+AX@lists.linux.dev
X-Gm-Message-State: AOJu0Yz7kSyumV9886k3kUxZ6Xs3uu+6OUDIuAUJ4qRlRCC9oFEB0HkW
	gppPpdsD/bBhT8muALhVLFR7IbZIoAEIqSPkLu6UVvZrzoOpGXkzJ+hlLzdoECJFCkKGWVRjCP/
	hk/YK/g==
X-Received: from plbms3.prod.google.com ([2002:a17:903:ac3:b0:2ca:e163:e0c8])
 (user=wyihan job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:e748:b0:2c9:b8b7:5d27
 with SMTP id d9443c01a7336-2cfa6a4f988mr10057535ad.1.1784762068777; Wed, 22
 Jul 2026 16:14:28 -0700 (PDT)
Date: Wed, 22 Jul 2026 23:13:18 +0000
In-Reply-To: <20260722-tdx-selftests-v14-0-15ad654a50db@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260722-tdx-selftests-v14-0-15ad654a50db@google.com>
X-Developer-Key: i=wyihan@google.com; a=ed25519; pk=cRi0fKzS5BMxlHyHY2pJv3w/1zcgfYKr6EYGYppdMYc=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784762054; l=3672;
 i=wyihan@google.com; s=20260319; h=from:subject:message-id;
 bh=VFBJ0t/KYzCs2iOyhhGs1fkC9wa+psmJ3ukTJr6kCV8=; b=VhHaHVb0I75TaoDJIEAtXtpsU7m6/ncrsMDtWYFpT14qUn134qFdM73dltqi2aFGrCgNQByvn
 fazU2D+Dgo1Bd/meIx1oMboFmwZ2EQQh9HMJmeWqDkUPlBKETqAPkub
X-Mailer: b4 0.14.3
Message-ID: <20260722-tdx-selftests-v14-13-15ad654a50db@google.com>
Subject: [PATCH v14 13/22] KVM: selftests: Support guest_memfd in-place conversion
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

Set the memory region as shared if guest_memfd in-place conversion is
support, so that the KVM selftest framework functions can populate
mmap()-ed guest_memfd memory the same way memory from other memory
providers are populated.

For CoCo VMs, pages that need to be private are explicitly set to
private before executing the VM.

Signed-off-by: Lisa Wang <wyihan@google.com>
---
 tools/testing/selftests/kvm/lib/kvm_util.c         | 20 ++++++++++++++------
 tools/testing/selftests/kvm/lib/x86/tdx/tdx_util.c |  8 ++++++--
 2 files changed, 20 insertions(+), 8 deletions(-)

diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
index 4a48c4b42095..e547ea341ff7 100644
--- a/tools/testing/selftests/kvm/lib/kvm_util.c
+++ b/tools/testing/selftests/kvm/lib/kvm_util.c
@@ -484,8 +484,10 @@ struct kvm_vm *__vm_create(struct vm_shape shape, u32 nr_runnable_vcpus,
 	u64 nr_pages = vm_nr_pages_required(shape.mode, nr_runnable_vcpus,
 						 nr_extra_pages);
 	struct userspace_mem_region *slot0;
+	u64 gmem_flags = 0;
 	struct kvm_vm *vm;
-	int i, flags;
+	int flags = 0;
+	int i;
 
 	kvm_set_files_rlimit(nr_runnable_vcpus);
 
@@ -495,14 +497,20 @@ struct kvm_vm *__vm_create(struct vm_shape shape, u32 nr_runnable_vcpus,
 	vm = ____vm_create(shape);
 
 	/*
-	 * Force GUEST_MEMFD for the primary memory region if necessary, e.g.
-	 * for CoCo VMs that require GUEST_MEMFD backed private memory.
+	 * Force GUEST_MEMFD for the primary memory region if necessary, and
+	 * initialize it as shared if in-place conversion is support, so the
+	 * selftest framework can populate it exactly like other memory
+	 * providers.
 	 */
-	flags = 0;
-	if (is_guest_memfd_required(shape))
+	if (is_guest_memfd_required(shape)) {
 		flags |= KVM_MEM_GUEST_MEMFD;
+		if (kvm_has_gmem_attributes)
+			gmem_flags |= GUEST_MEMFD_FLAG_INIT_SHARED |
+				      GUEST_MEMFD_FLAG_MMAP;
+	}
 
-	vm_userspace_mem_region_add(vm, VM_MEM_SRC_ANONYMOUS, 0, 0, nr_pages, flags);
+	vm_mem_add(vm, VM_MEM_SRC_ANONYMOUS, 0, 0, nr_pages, flags,
+		   -1, 0, gmem_flags);
 	for (i = 0; i < NR_MEM_REGIONS; i++)
 		vm->memslots[i] = 0;
 
diff --git a/tools/testing/selftests/kvm/lib/x86/tdx/tdx_util.c b/tools/testing/selftests/kvm/lib/x86/tdx/tdx_util.c
index 2ce8c297f7ed..5bbe51ad0f66 100644
--- a/tools/testing/selftests/kvm/lib/x86/tdx/tdx_util.c
+++ b/tools/testing/selftests/kvm/lib/x86/tdx/tdx_util.c
@@ -17,10 +17,12 @@ void tdx_vm_setup_boot_code_region(struct kvm_vm *vm)
 	gpa_t boot_code_gpa = X86_RESET_VECTOR - TD_BOOT_CODE_SIZE;
 	gpa_t alloc_gpa = round_down(boot_code_gpa, PAGE_SIZE);
 	size_t nr_pages = DIV_ROUND_UP(total_code_size, PAGE_SIZE);
-	const u64 gmem_flags = 0;
+	u64 gmem_flags = 0;
 	gpa_t gpa;
 	u8 *hva;
 
+	if (kvm_has_gmem_attributes)
+		gmem_flags |= GUEST_MEMFD_FLAG_INIT_SHARED | GUEST_MEMFD_FLAG_MMAP;
 	vm_mem_add(vm, VM_MEM_SRC_SHMEM, alloc_gpa, TD_BOOT_CODE_SLOT,
 		   nr_pages, KVM_MEM_GUEST_MEMFD, -1, 0, gmem_flags);
 
@@ -56,9 +58,11 @@ void tdx_vm_setup_boot_parameters_region(struct kvm_vm *vm, u32 nr_runnable_vcpu
 		sizeof(struct td_boot_parameters) +
 		nr_runnable_vcpus * sizeof(struct td_per_vcpu_parameters);
 	int npages = DIV_ROUND_UP(boot_params_size, PAGE_SIZE);
-	const u64 gmem_flags = 0;
+	u64 gmem_flags = 0;
 	gpa_t gpa;
 
+	if (kvm_has_gmem_attributes)
+		gmem_flags |= GUEST_MEMFD_FLAG_INIT_SHARED | GUEST_MEMFD_FLAG_MMAP;
 	vm_mem_add(vm, VM_MEM_SRC_SHMEM, TD_BOOT_PARAMETERS_GPA,
 		   TD_BOOT_PARAMETERS_SLOT, npages,
 		   KVM_MEM_GUEST_MEMFD, -1, 0, gmem_flags);

-- 
2.55.0.229.g6434b31f56-goog

