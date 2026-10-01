Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 328785304A8
	for <linux-coco@lists.linux.dev>; Thu,  1 Oct 2026 19:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790883542; cv=none; b=PVZupYM/IU5QfPx4e5+2dtFqUkvjWVH3j72C+dUSi9M4OQ/G++QRZpP35Y+/5lpVXbBET3DsPr3JqOocdFTJqFKuEfJGfpr0mTKN1ntEYDBHvtPuu0iujIjP0gjg+rH5pEVbT+PJS+DPt/Y6zzRkdCb5ChG4wLQbTSnlzRm9azk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790883542; c=relaxed/simple;
	bh=SV/MXgGWckWhx+Jyo7DLJEx2fZgBooEYcqqqXWGamts=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=iIKIcb1ktyeOJ7EtNfAwoAkbbUw7h/IOjxF9JYsK31RbfxCeGViP8HmBwi403mw/PpUqguXxcksMYnoLAyDnBR1e4zXK0AENtYf0v3tknObCrof8MFUdeLJzsVlC5ms6P2T6mn0wTuD+n6A9QoCl/6wTZ+dPLs2B3F5BOihH7ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--wyihan.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=oSIKckcj; arc=none smtp.client-ip=209.85.215.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wyihan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="oSIKckcj"
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc1b8088202so4865614a12.3
        for <linux-coco@lists.linux.dev>; Thu, 01 Oct 2026 12:38:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790883538; x=1791488338; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rRbrmyW96rrCs3DEZjhRs/AR+c7fdb5fNUuxs/BXvEg=;
        b=oSIKckcjRq/YGK2UVC3toOEhXb3BGmYxcALZVf6ux/ZcoXz4P39XSZ3rjR8nmC5Rny
         A+QVA0FxABdVv2dg6fDgDkTBP4bMg0ZQtgmfwAe3EVdIdis6uDSFAnkVBDK+7x8XFVDJ
         /uSx+aXZbTupIEUrsDZaCSazA6fz7S+ucmbmTM8akoCO2TL8GPV9pBETZrTvLLfN2/mk
         La7RtDUMeSpADKb3VGFNlc0lZgmtK93xCts9BgXCcvS8V4PEprJzlLmszpj2rqtIM42D
         JN8iUStaUnaFcTAgUop7j1mGvnFI7pkWuCIlG7TAXod36V+bRggc7C7XpRHLHopvbJwx
         JwYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790883538; x=1791488338;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rRbrmyW96rrCs3DEZjhRs/AR+c7fdb5fNUuxs/BXvEg=;
        b=MgoTV9zhoxXSGTJM/BLywkCqMhZiwb1O5rfUOPv7tyOUzuzll6SONzbReQzemWGYlI
         z27OCEe5BhMZY+KDr0vPht8OzSWd0zfMGxo9Ta49L/f0awZLJ+Ld4UIp0QXcWuvCGtsW
         igmlsliy3sAugqbLpNqpjKVzo9aPoO1Vey+TvaYXoSkbqkGWvcr8b4wztRh0SArvRznl
         sfVQgK4cwAWnX7GT0HCtzylc5C7zDlucnQDaXzsb7AWYOSbhowm9sTKkrNUehPuQPt0X
         DaylcuEwSyB6BvS99ynhIpogSuA13lr7YeZdewbUYhvIO7mW+01aJoa6K2uyV7bQdx9Q
         Dk9Q==
X-Forwarded-Encrypted: i=1; AKwUvBwLjgpgithhtN8n695hOwR13FvtT0MrZqJ30hnG5SEC/KD1+xvGFOz8B10vmtYE0qrZJLkDSVYQPnsv@lists.linux.dev
X-Gm-Message-State: AFuF++mAOjIKXVA5PuMSvOUKCWjOdE6o3mdAizDCVDfJYkUntajjzTRx
	bQ1EPaOmJRBL14IKWwCD7G1wqycK7IGYt7boyKWBIPzmiahq+rmbeMVwazbZWKjhZoFhgeZKnTZ
	MTqlrqw==
X-Received: from pgaz8.prod.google.com ([2002:a05:6a02:50e8:b0:cc7:caf5:50f3])
 (user=wyihan job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:3987:b0:3dd:a00a:7ac9
 with SMTP id adf61e73a8af0-3e0bd2ce276mr381873637.54.1790883537939; Thu, 01
 Oct 2026 12:38:57 -0700 (PDT)
Date: Thu, 01 Oct 2026 19:37:45 +0000
In-Reply-To: <20261001-tdx-selftests-v15-0-7c62a5d8a992@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20261001-tdx-selftests-v15-0-7c62a5d8a992@google.com>
X-Developer-Key: i=wyihan@google.com; a=ed25519; pk=cRi0fKzS5BMxlHyHY2pJv3w/1zcgfYKr6EYGYppdMYc=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790883521; l=4084;
 i=wyihan@google.com; s=20260319; h=from:subject:message-id;
 bh=B0/+AYwoNGMvhRTjH0hvziwoAGkXGZBATDrRe3FTczI=; b=XmUVuwsaLPQHE5JnV3C5LhZEiXXFAZAmrE8yvKo3mx/4aIirB+K9fhi9QYnUBWUyePemkGtoE
 jD6v7R/Wm9KACDs+wsCbUgCBidbgkppxfx37bYK7dbeJaVyokWiPfJA
X-Mailer: b4 0.14.3
Message-ID: <20261001-tdx-selftests-v15-18-7c62a5d8a992@google.com>
Subject: [PATCH v15 18/23] KVM: selftests: Add helpers to init TDX memory and
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
used by the guest. Traverse the VM's memory regions and initialize all
the protected ranges by calling KVM_TDX_INIT_MEM_REGION.

Once all the memory is initialized, the VM can be finalized by calling
KVM_TDX_FINALIZE_VM.

Co-developed-by: Erdem Aktas <erdemaktas@google.com>
Signed-off-by: Erdem Aktas <erdemaktas@google.com>
Co-developed-by: Sagi Shahar <sagis@google.com>
Signed-off-by: Sagi Shahar <sagis@google.com>
Co-developed-by: Lisa Wang <wyihan@google.com>
Signed-off-by: Lisa Wang <wyihan@google.com>
Signed-off-by: Ackerley Tng <ackerleytng@google.com>
Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
Reviewed-by: Ira Weiny <ira.weiny@intel.com>
---
 .../selftests/kvm/include/x86/tdx/tdx_util.h       |  2 +
 tools/testing/selftests/kvm/lib/x86/tdx/tdx_util.c | 62 ++++++++++++++++++++++
 2 files changed, 64 insertions(+)

diff --git a/tools/testing/selftests/kvm/include/x86/tdx/tdx_util.h b/tools/testing/selftests/kvm/include/x86/tdx/tdx_util.h
index f36cddbd045c..dcfc62ffbaeb 100644
--- a/tools/testing/selftests/kvm/include/x86/tdx/tdx_util.h
+++ b/tools/testing/selftests/kvm/include/x86/tdx/tdx_util.h
@@ -73,4 +73,6 @@ void tdx_vm_load_common_boot_parameters(struct kvm_vm *vm);
 void tdx_vcpu_load_boot_parameters(struct kvm_vm *vm, struct kvm_vcpu *vcpu);
 void tdx_vcpu_set_entry_point(struct kvm_vcpu *vcpu, void *guest_code);
 
+void tdx_vm_finalize(struct kvm_vm *vm);
+
 #endif /* SELFTESTS_TDX_TDX_UTIL_H */
diff --git a/tools/testing/selftests/kvm/lib/x86/tdx/tdx_util.c b/tools/testing/selftests/kvm/lib/x86/tdx/tdx_util.c
index 5f10a7c1455d..b8e1f848cf54 100644
--- a/tools/testing/selftests/kvm/lib/x86/tdx/tdx_util.c
+++ b/tools/testing/selftests/kvm/lib/x86/tdx/tdx_util.c
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 
+#include <linux/align.h>
 #include <linux/sizes.h>
 
 #include "processor.h"
@@ -228,3 +229,64 @@ void tdx_init_vm(struct kvm_vm *vm)
 
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
+		    "Cannot add partial pages to the guest memory.\n");
+	TEST_ASSERT(IS_ALIGNED((u64)source_pages, PAGE_SIZE),
+		    "Source memory buffer is not page aligned\n");
+	tdx_vcpu_ioctl(vcpu, KVM_TDX_INIT_MEM_REGION, flags, &mem_region);
+}
+
+static void tdx_load_private_memory(struct kvm_vm *vm)
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
+	tdx_load_private_memory(vm);
+	tdx_vm_ioctl(vm, KVM_TDX_FINALIZE_VM, 0, NULL);
+}

-- 
2.56.0.rc1.315.gc6ed9934b7-goog

