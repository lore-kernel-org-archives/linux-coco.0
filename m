Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 172DD37C912
	for <linux-coco@lists.linux.dev>; Thu, 21 May 2026 23:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779405457; cv=none; b=I6YDq3GcU5HrLXItm1VhWLgjU2RRrDE/YsDMybNFaGeI+Rc3bskz/Yfkmjyvw443BPSl7ufNylT1SbDEinVuHl6ZaAwIojVMcFTaMOr3GaZCN91r6JTUaUgskQeJRHlR1ZpBP/ICRRKLbrNVh0ePk1Z1aA0HR8DJihvXhgUZupA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779405457; c=relaxed/simple;
	bh=2vsQeSx+1A1q3XOu0xejVLQWVglIzn9/j5BiP/t6qxQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=uUpnfSnDGx2mVosLR02N6vTtpfIOsgaTaLKFtctz218Ru7C3/k0a28Ft4prZZaU99UafK5yPU/AdyRydn+17Dryrbe+tcQE0hycYoYqJQHMSTsNBW0U/Q1jRLcQz7+ZLnB7eRmnao08A3g+s1d1kgGcKhjgb/UQ6kXxLVYlWMfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--wyihan.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QAdnI0ro; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wyihan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QAdnI0ro"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2b458add85aso70999585ad.2
        for <linux-coco@lists.linux.dev>; Thu, 21 May 2026 16:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779405454; x=1780010254; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZMW2hzqKIiJOAnHmxoFNGrFaTnzCmmooxhb6UYQuxwA=;
        b=QAdnI0ro478KsUoor+DL+m03e2T//10kk9nVYyLEBnzRItzJbqioJwh5uyyXeUWqsX
         qr9vqIdkEfZYyOEnZ6nFvBNI8YLE9vq2SQ/tVZnJcbxXI/px0eLsmIWIYFQbD/9x71H3
         Guet9vBKuajXzys3C+AdkBOsXndN933sJmSSFwPWOinApuo9dVcFlf5toCCHix72Bg4y
         2PcSsQTDXatZm0RJyY+FU6F5BLxTuf6WAGLR/43Nn5gYXpu1o0e+ko+2GDU51JnQ4WDu
         KeeTbe98hpMNkCdypXDIkaE6/2sr1kFfVT69HLF2EXSfIpk0rjlr9XsAZjyOfDrDekIi
         XV9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779405454; x=1780010254;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZMW2hzqKIiJOAnHmxoFNGrFaTnzCmmooxhb6UYQuxwA=;
        b=d7uTZVV2u5dYjnLW4MThgA/YTgCY/DPtsvWxyA+77nl7vhdJVV2fTH2LHo4h3F+9UF
         GxNw9PjLODwrheMAeSGDBTrVmacn4e+ufIuDx+z0URXfXHpy0YVJv/R8LEY6pat5COAq
         5zZfdTiW8TrPX+Ok/VV6U2l/mHm+01UrSQPJHS0q7vKFAOk1zai5guexQwegDMvxKwgq
         p3cjofv/06bHhYy2Y8e09R32Aufl1+2Y/O97LinHQrwCspyBopLRm8Pb/4Ia7bCc06uf
         rNjbPygxI+A/JHud7C+kc50pFqF/QigkQwD0FIb6i2yyKxUQyKBigocGHT9fXPwF04Dw
         UYfQ==
X-Forwarded-Encrypted: i=1; AFNElJ/t7CP+EIsjOFGpvXmT9NF/nY4ZBe4vY68z1/gCJ3MqGuVM1qogJrCRqB9r22BcQU+re9qR5yh3Uu5/@lists.linux.dev
X-Gm-Message-State: AOJu0YxTZtOYJ3IxbiLE1GdX3yVLnXIbHNomSOGQGU7LfL7YkKe71OWA
	HRJA0qzkBfSVi3Rd1wd5y+fUvreYAv1S/pe3KQxFUdrx8viR7Jc3OqkKMM26N/dN+wjpd2vvVV8
	+Ymgd0A==
X-Received: from plbky6.prod.google.com ([2002:a17:902:f986:b0:2b0:b22a:e6ef])
 (user=wyihan job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:2446:b0:2bd:2439:25e9
 with SMTP id d9443c01a7336-2beb073a217mr8724975ad.40.1779405454203; Thu, 21
 May 2026 16:17:34 -0700 (PDT)
Date: Thu, 21 May 2026 23:16:54 +0000
In-Reply-To: <20260521-tdx-selftests-v13-v13-0-6983ae4c3a4d@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260521-tdx-selftests-v13-v13-0-6983ae4c3a4d@google.com>
X-Developer-Key: i=wyihan@google.com; a=ed25519; pk=cRi0fKzS5BMxlHyHY2pJv3w/1zcgfYKr6EYGYppdMYc=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779405439; l=2055;
 i=wyihan@google.com; s=20260319; h=from:subject:message-id;
 bh=2vsQeSx+1A1q3XOu0xejVLQWVglIzn9/j5BiP/t6qxQ=; b=QLbF+qF+jvwNKoJMNZqmTPEK2KUYuH4T+RynDV6W9IpZjfp4BqRXn02+mT8N0u1xqWIwrE4AK
 Ll2nxFt9Q87AQQ5+lKvY9Hhrh5YRujIkDXXeae0R0//OnF0iOaEKPOM
X-Mailer: b4 0.14.3
Message-ID: <20260521-tdx-selftests-v13-v13-13-6983ae4c3a4d@google.com>
Subject: [PATCH  v13 13/22] KVM: selftests: Set first memory region as shared
 if guest_memfd
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

Set the initial state of the first memory region as shared if it is
backed by guest_memfd, so that the KVM selftest framework functions can
populate mmap()-ed guest_memfd memory the same way memory from other
memory providers are populated.

For CoCo VMs, pages that need to be private are explicitly set to
private before executing the VM.

Signed-off-by: Lisa Wang <wyihan@google.com>
---
 tools/testing/selftests/kvm/lib/kvm_util.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
index 9a29540fff40..1bab7d76a59c 100644
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
 
@@ -495,14 +497,16 @@ struct kvm_vm *__vm_create(struct vm_shape shape, u32 nr_runnable_vcpus,
 	vm = ____vm_create(shape);
 
 	/*
-	 * Force GUEST_MEMFD for the primary memory region if necessary, e.g.
-	 * for CoCo VMs that require GUEST_MEMFD backed private memory.
+	 * Force GUEST_MEMFD for the primary memory region if necessary, and
+	 * initialize it as shared so the selftest framework can populate it
+	 * exactly like other memory providers.
 	 */
-	flags = 0;
-	if (is_guest_memfd_required(shape))
+	if (is_guest_memfd_required(shape)) {
 		flags |= KVM_MEM_GUEST_MEMFD;
+		gmem_flags |= GUEST_MEMFD_FLAG_INIT_SHARED;
+	}
 
-	vm_userspace_mem_region_add(vm, VM_MEM_SRC_ANONYMOUS, 0, 0, nr_pages, flags);
+	vm_mem_add(vm, VM_MEM_SRC_ANONYMOUS, 0, 0, nr_pages, flags, -1, 0, gmem_flags);
 	for (i = 0; i < NR_MEM_REGIONS; i++)
 		vm->memslots[i] = 0;
 

-- 
2.54.0.746.g67dd491aae-goog

