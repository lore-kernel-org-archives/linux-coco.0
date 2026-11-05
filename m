Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793922478;
	b=X7XX83naMXJ5ACzkkv+geuRKyM9xE3wOGo2xSTXvQmGEC0GwkJkh+IXuVc55Jn2mVDZx
	 JdSD5w7etz8pbl9+kjP2+silEhfub60QX2/gjLrspcF9wXlLffWSKuluTefuKoPF/sZa1
	 vr80eBD5mcmLJRTLrK3wNnAcECUoBMXxp/YgDmxNFDq0X/VihETPpOmu+MnkDmVWggSvg
	 kYhlrQ7s4zGaBgrXHQDkaIRicz5pXF58EFw+yGaMSAf5NlwJDt3Yw4M582l9vdr56khep
	 O7AOFrMcSSEin82pPBv1GlyjGcuzvXeZQW0VNRGKqyODXAJ28iDdWkUjqaWR/x9MqWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793922478;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Developer-Key:X-Developer-Signature:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=LEEA2Tm4kPEuiFuwPm6vN9ZoPvkNTxKJCKru87/Ki1Y=;
	b=0XLfVAx7qKG8saeDKHGwSp9r9HtbkMEkeYpIGP0HDVj2VQaQNGQfUzsG1Aich+Nrn6Mc
	 bObV78GKaRY15DDaysfY5WePxtmaavic8rBMR25naJ8OeCcUeTkL9j1i7wZMv375BaohI
	 v1N8B5scuMt04ed97ThRVOS/tBsZof6I7NB77LUhoSl1jXCnzf03XTYOlslZTbyXQtk9B
	 ajwFFGN57WoUXugm2sLODv6sHtAEcBSy7aTyzznbT/KUrV4hUZn8BepMTD6hz+8cGF0au
	 LthtrS9PIh+bKfI61mown+50o5bqcDyNdAgrPfOkAz098AiqzmhEaHjovatdlGvNB8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--wyihan.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=iOLzzJMj;
	arc=none smtp.remote-ip=209.85.216.71
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54C236083602
	for <linux-coco@lists.linux.dev>; Thu,  5 Nov 2026 23:47:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54C236083602
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wyihan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=iOLzzJMj
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3adad90c894so108202a91.1
        for <linux-coco@lists.linux.dev>; Thu, 05 Nov 2026 15:47:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793922477; x=1794527277; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LEEA2Tm4kPEuiFuwPm6vN9ZoPvkNTxKJCKru87/Ki1Y=;
        b=iOLzzJMjRJsdyEg6uHmatkMaIoXJY9YM6Gw5MoX4wRosaV23RvLZgGKJ8/UJt0rYQb
         H9KUHTOUqNkurWjYyqVLnfn7LBV6rH5X0oQIHWzDEwbQKyFvJ1GbEkfaMWCjogwqNU/6
         pd8joHaJxJwuEulNPXcJDgcgcTW6FLTXtaDCl1Ks2qwUe+R9x+WHYYrimkMBdFIX0gr8
         YEdudxDYKjCy3KYMwHQ298qe1g+MzmyNaNX69T2rJCeqMre0oCTdbdg22Di5/Q6lE3ge
         KVvjn0nkSjH7+8vXxYYNJ22rQliuzJz8HH8RbHVSdE7vRbbGkL22NWxXq7ZRMhaS50tV
         s3tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793922477; x=1794527277;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LEEA2Tm4kPEuiFuwPm6vN9ZoPvkNTxKJCKru87/Ki1Y=;
        b=iDdRfjOvjJplyIKr6l+oUD3KQ5kM0EIYtDFBDi+KMGyVYbTB0eaqOKqGyROR+vgmrY
         JeKHVEIBKeJZyQkOXacY9UzrhkAurIHTxkTfn5YTtGVIvL/azJW5TZq9MN3FYYS5D3Ff
         In4D44VldhrYGsFK5IwZdqATzsi3oJstEr0dgun9oRLxhqC6Z3kjMJB0ZC4hLD+MXlJq
         N4sQhex8r517SO/rtn4na0oSyAZ+nJke/lSBv9UtOY1qmzF049vhNSrossSsPSITJ7AR
         R/VTtmeKtwJ9d3qGRoJnpKdqp5Hinl5oX0nVOH51KYG/oOhHb/nR9XViMn2ohHf9X1xz
         Mkfg==
X-Forwarded-Encrypted: i=1; AKwUvBw/eSCITapSx+YQbLTOhaPcV8rOSs2hdq9/HL16Gzu7QdVBzxsWxt9s2WynSMIOld4inADrGSw+KyhY@lists.linux.dev
X-Gm-Message-State: APuU4Z9ENTM3qDA4TcaJCuxvX0zGtfesrfUFSN6LhrgMtMip6nz4sj7a
	iKXFgkaHaNZEZ7oCy+uYpIMsV0skh6bAIZQjgVxfEUX7isoeTJ5t8CHHC/fqJnPWezIdQiiJOVC
	FOR/RqA==
X-Received: from pjbkl7.prod.google.com ([2002:a17:90b:4987:b0:3b0:98dd:7ee1])
 (user=wyihan job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4a10:b0:3b0:a38a:6715
 with SMTP id 98e67ed59e1d1-3b0db7109dfmr651139a91.59.1793922476377; Thu, 05
 Nov 2026 15:47:56 -0800 (PST)
Date: Thu, 05 Nov 2026 23:46:59 +0000
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793922452; l=4183;
 i=wyihan@google.com; s=20260319; h=from:subject:message-id;
 bh=1fvLyz4z13NOla+r1Hs/PHs9uu0rmBs1fjzBUkzz5ls=; b=URFC8RL1z2/ZNFCgOd5qDDtoX2nyoFhNLaevMBRotwPmJ5vC3rmXdQQwK9H2ZBcga0vYT5Ufu
 8WbXpQfFQ8iAhgNsNuFnDerSLmV+oaqLomuf/g5u2c9ub0IXp/b6CX+
X-Mailer: b4 0.14.3
Message-ID: <20261105-tdx-selftests-v16-15-2024e8fa517a@google.com>
Subject: [PATCH v16 15/20] KVM: selftests: Add helpers to init TDX memory and
 finalize VM
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

From: Ackerley Tng <ackerleytng@google.com>

TDX protected memory needs to be measured and encrypted before it can be
used by the guest. Introduce tdx_load_private_memory() to traverse the
VM's memory regions and initialize all protected ranges by calling
KVM_TDX_INIT_MEM_REGION.

Once all initial private memory is initialized, the VM can be finalized
by calling tdx_vm_finalize(), which invokes KVM_TDX_FINALIZE_VM.

Co-developed-by: Erdem Aktas <erdemaktas@google.com>
Signed-off-by: Erdem Aktas <erdemaktas@google.com>
Co-developed-by: Sagi Shahar <sagis@google.com>
Signed-off-by: Sagi Shahar <sagis@google.com>
Co-developed-by: Lisa Wang <wyihan@google.com>
Signed-off-by: Lisa Wang <wyihan@google.com>
Signed-off-by: Ackerley Tng <ackerleytng@google.com>
Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
Reviewed-by: Ira Weiny <ira.weiny@intel.com>
Reviewed-by: Xiaoyao Li <xiaoyao.li@intel.com>
---
 .../selftests/kvm/include/x86/tdx/tdx_util.h       |  3 ++
 tools/testing/selftests/kvm/lib/x86/tdx/tdx_util.c | 61 ++++++++++++++++++++++
 2 files changed, 64 insertions(+)

diff --git a/tools/testing/selftests/kvm/include/x86/tdx/tdx_util.h b/tools/testing/selftests/kvm/include/x86/tdx/tdx_util.h
index 1cc876891589..67e717521409 100644
--- a/tools/testing/selftests/kvm/include/x86/tdx/tdx_util.h
+++ b/tools/testing/selftests/kvm/include/x86/tdx/tdx_util.h
@@ -74,4 +74,7 @@ void tdx_vm_load_common_boot_parameters(struct kvm_vm *vm);
 void tdx_vcpu_init(struct kvm_vcpu *vcpu);
 void tdx_vcpu_set_entry_point(struct kvm_vcpu *vcpu, void *guest_code);
 
+void tdx_load_private_memory(struct kvm_vm *vm);
+void tdx_vm_finalize(struct kvm_vm *vm);
+
 #endif /* SELFTESTS_TDX_TDX_UTIL_H */
diff --git a/tools/testing/selftests/kvm/lib/x86/tdx/tdx_util.c b/tools/testing/selftests/kvm/lib/x86/tdx/tdx_util.c
index 324f3c41aa61..ea40bd51530d 100644
--- a/tools/testing/selftests/kvm/lib/x86/tdx/tdx_util.c
+++ b/tools/testing/selftests/kvm/lib/x86/tdx/tdx_util.c
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 
+#include <linux/align.h>
 #include <linux/sizes.h>
 
 #include "processor.h"
@@ -237,3 +238,63 @@ void tdx_init_vm(struct kvm_vm *vm)
 
 	free(init_vm);
 }
+
+static void tdx_init_mem_region(struct kvm_vm *vm, void *source_pages,
+				u64 gpa, u64 size)
+{
+	u32 flags = KVM_TDX_MEASURE_MEMORY_REGION;
+	struct kvm_tdx_init_mem_region mem_region = {
+		.source_addr = (u64)source_pages,
+		.gpa = gpa,
+		.nr_pages = size / PAGE_SIZE,
+	};
+	struct kvm_vcpu *vcpu;
+
+	vcpu = list_first_entry_or_null(&vm->vcpus, struct kvm_vcpu, list);
+
+	TEST_ASSERT(size && IS_ALIGNED(size, PAGE_SIZE),
+		    "Cannot add partial pages to the guest memory.");
+	TEST_ASSERT(IS_ALIGNED((u64)source_pages, PAGE_SIZE),
+		    "Source memory buffer is not page aligned");
+	tdx_vcpu_ioctl(vcpu, KVM_TDX_INIT_MEM_REGION, flags, &mem_region);
+}
+
+void tdx_load_private_memory(struct kvm_vm *vm)
+{
+	struct userspace_mem_region *region;
+	int ctr;
+
+	hash_for_each(vm->regions.slot_hash, ctr, region, slot_node) {
+		const struct sparsebit *protected_pages = region->protected_phy_pages;
+		const gpa_t gpa_base = region->region.guest_phys_addr;
+		const u64 hva_base = region->region.userspace_addr;
+		const sparsebit_idx_t lowest_page_in_region = gpa_base >> vm->page_shift;
+		void *source_pages = NULL;
+		sparsebit_idx_t i, j;
+
+		if (!sparsebit_any_set(protected_pages))
+			continue;
+
+		TEST_ASSERT(region->region.guest_memfd != -1,
+			    "TD private memory must be backed by guest_memfd");
+
+		sparsebit_for_each_set_range(protected_pages, i, j) {
+			const u64 size_to_load = (j - i + 1) * vm->page_size;
+			const u64 offset =
+				(i - lowest_page_in_region) * vm->page_size;
+			const u64 hva = hva_base + offset;
+			const u64 gpa = gpa_base + offset;
+
+			if (!kvm_has_gmem_attributes)
+				source_pages = (void *)hva;
+
+			vm_mem_set_private(vm, gpa, size_to_load);
+			tdx_init_mem_region(vm, source_pages, gpa, size_to_load);
+		}
+	}
+}
+
+void tdx_vm_finalize(struct kvm_vm *vm)
+{
+	tdx_vm_ioctl(vm, KVM_TDX_FINALIZE_VM, 0, NULL);
+}

-- 
2.56.0.455.g6c5a503b38-goog

