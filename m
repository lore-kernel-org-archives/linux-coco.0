Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56C24318ED6
	for <linux-coco@lists.linux.dev>; Thu,  7 May 2026 20:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778186082; cv=none; b=XVd3u1VeCFaVj+QC5FJfytmCNOEXmQfvQ6QOyNRZlKfhxipxH5sIoXqLhJNSxkQhe4aLJ+NwOcZ1Q8IyvFTbRWFh9LH0CbeHkPVSmpUiwHV2iecbHoR3gm7PsukxalwO84Y33mKM8RycqftfEQAzzflwoBBZQIELpeVsoga8cIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778186082; c=relaxed/simple;
	bh=+qaEdBH+gYOBdsyFKxFWIyCyUru/7xriN85itsOx9b8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=PB4Zjg9bQXC70cCHv6mcKmIH2byQlCNPYC7EDANzwpfgPqh+ztLZ5OvPd8kUSKdt0Zg7ROb/6OHnNSORvEnahAI9tsmo4R8ejxgFQNNbZSIb2jJHD0vcoBJoiJ3G+bfeehYVgE6yIhlwlwVeIg9Ak/3AfUojVVGnAnJOeB5Eytw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=R5B6Ylf8; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="R5B6Ylf8"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-bce224720d8so690468a12.1
        for <linux-coco@lists.linux.dev>; Thu, 07 May 2026 13:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778186078; x=1778790878; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=TDRRc0jg/jx53tsGeC8eacCCEXJljCHGPEHlQkr/vH8=;
        b=R5B6Ylf8K6h+Z34im5PspAG/Sx1KfrQdIDDxDUeSMzTQA9sRuGExDt4voysjo0nHdQ
         cWBzNaJm0VPxwrSaWZf+Ha6yDIZjXXPkSLferPRapJLFW8LjBLV075qd9M1wiudkkS4P
         vqtGk40ohKa23Zq7+1lSZa16vVxKfcl9N2ik5AjHVK4NIcE/lmW+znj5ZX/ug3tdcT7D
         dVSfNMLJ/lOX7PAM3dJueUAPoPQlRITwohEriSPjQuL/c+G1+8SQfi9T2g7+wOaZvZUY
         KIV3YTIQ34KQ6S53Ijuzv+jElqpChSrh1EZKSnXl/7IyR3QWrtQjK+1nRxSau4o+ofE4
         8jyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778186078; x=1778790878;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TDRRc0jg/jx53tsGeC8eacCCEXJljCHGPEHlQkr/vH8=;
        b=Ny/u6vC8h0iIpvE2UZyGTFTGqQRMvZjTMjy6wNOQll8c8rM/mQIQQCXPPG4USaW4bd
         Vdj8oE9NH5WuiCJtlHlRPQoHn25oWe5EyG8EAV4KMKqEaHFriEVIuUit2FpIxawoqySf
         c27EaW9RnYZ0ecFph9dP3KMv33Ss5nfx++NiZEFkUFzL8+Tg75OMvinKt84QIzbD98n+
         9QIwhMpIygh/JQfKOLXTLAcdpZ8rZtEBEfXKKco88bHVZdTlH9JdYPwaVuj2DrlX5tQc
         phIqpn47kAusgoqNU7P2gQ+EwQVrQPyjvvotmpzN3Q3HD5Xp6qBhiv0d0ljsk0uIoNk2
         6Lig==
X-Forwarded-Encrypted: i=1; AFNElJ+YYX0yl5iVc2UPBIiEqtnP6k1Tfs6l09GupF4Sfc9hg35QoLFGtkteY2L16mYL+JjS/OC/J5s8YquQ@lists.linux.dev
X-Gm-Message-State: AOJu0YzEFM3ehwV7saAxLYyXCRwTO6H58p3hiXSn+y2qXHXveCJJkSnv
	WSwbfe11P4H4XN/xnkqYnZ+kSfIzg4YYHPSiu4fOJrHRJ0GRXDNxvMwlyfr1IEgscwp1DeVm9m/
	t7IqroUIShsOohJ+oUBr0u3j9vw==
X-Received: from pfje17.prod.google.com ([2002:a05:6a00:d1:b0:83a:d498:99fb])
 (user=ackerleytng job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:3944:b0:398:962e:83d7 with SMTP id adf61e73a8af0-3aa5a9df237mr10814249637.43.1778186078034;
 Thu, 07 May 2026 13:34:38 -0700 (PDT)
Date: Thu,  7 May 2026 13:34:25 -0700
In-Reply-To: <cover.1778185936.git.ackerleytng@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260507-gmem-inplace-conversion-v6-0-91ab5a8b19a4@google.com> <cover.1778185936.git.ackerleytng@google.com>
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
Message-ID: <252ec123d00e4b60e1adb9ac5c84e0e4349fc488.1778185936.git.ackerleytng@google.com>
Subject: [POC PATCH 4/5] KVM: selftests: Allow specifying CoCo-privateness
 while mapping a page
From: Ackerley Tng <ackerleytng@google.com>
To: devnull+ackerleytng.google.com@kernel.org
Cc: ackerleytng@google.com, aik@amd.com, akpm@linux-foundation.org, 
	andrew.jones@linux.dev, aneesh.kumar@kernel.org, axelrasmussen@google.com, 
	baohua@kernel.org, bhe@redhat.com, binbin.wu@linux.intel.com, bp@alien8.de, 
	brauner@kernel.org, chao.p.peng@linux.intel.com, chrisl@kernel.org, 
	corbet@lwn.net, dave.hansen@linux.intel.com, david@kernel.org, 
	forkloop@google.com, hpa@zytor.com, ira.weiny@intel.com, jgg@ziepe.ca, 
	jmattson@google.com, jthoughton@google.com, kas@kernel.org, 
	kasong@tencent.com, kvm@vger.kernel.org, liam@infradead.org, 
	linux-coco@lists.linux.dev, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-mm@kvack.org, linux-trace-kernel@vger.kernel.org, 
	mathieu.desnoyers@efficios.com, mhiramat@kernel.org, michael.roth@amd.com, 
	mingo@redhat.com, nphamcs@gmail.com, oupton@kernel.org, pankaj.gupta@amd.com, 
	pbonzini@redhat.com, pratyush@kernel.org, qi.zheng@linux.dev, 
	qperret@google.com, rick.p.edgecombe@intel.com, rientjes@google.com, 
	rostedt@goodmis.org, seanjc@google.com, shakeel.butt@linux.dev, 
	shikemeng@huaweicloud.com, shivankg@amd.com, shuah@kernel.org, 
	skhan@linuxfoundation.org, steven.price@arm.com, suzuki.poulose@arm.com, 
	tabba@google.com, tglx@kernel.org, vannapurve@google.com, vbabka@kernel.org, 
	weixugc@google.com, willy@infradead.org, wyihan@google.com, x86@kernel.org, 
	yan.y.zhao@intel.com, youngjun.park@lge.com, yuanchu@google.com
Content-Type: text/plain; charset="UTF-8"

Signed-off-by: Ackerley Tng <ackerleytng@google.com>
---
 tools/testing/selftests/kvm/include/x86/processor.h |  2 ++
 tools/testing/selftests/kvm/lib/x86/processor.c     | 13 ++++++++++---
 2 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/kvm/include/x86/processor.h b/tools/testing/selftests/kvm/include/x86/processor.h
index 77f576ee7789d..683f21452db58 100644
--- a/tools/testing/selftests/kvm/include/x86/processor.h
+++ b/tools/testing/selftests/kvm/include/x86/processor.h
@@ -1507,6 +1507,8 @@ enum pg_level {
 void tdp_mmu_init(struct kvm_vm *vm, int pgtable_levels,
 		  struct pte_masks *pte_masks);
 
+void ___virt_pg_map(struct kvm_vm *vm, struct kvm_mmu *mmu, gva_t gva,
+		    gpa_t gpa,  int level, bool private);
 void __virt_pg_map(struct kvm_vm *vm, struct kvm_mmu *mmu, gva_t gva,
 		   gpa_t gpa,  int level);
 void virt_map_level(struct kvm_vm *vm, gva_t gva, gpa_t gpa,
diff --git a/tools/testing/selftests/kvm/lib/x86/processor.c b/tools/testing/selftests/kvm/lib/x86/processor.c
index b51467d70f6e7..02781194f51a2 100644
--- a/tools/testing/selftests/kvm/lib/x86/processor.c
+++ b/tools/testing/selftests/kvm/lib/x86/processor.c
@@ -256,8 +256,8 @@ static u64 *virt_create_upper_pte(struct kvm_vm *vm,
 	return pte;
 }
 
-void __virt_pg_map(struct kvm_vm *vm, struct kvm_mmu *mmu, gva_t gva,
-		   gpa_t gpa, int level)
+void ___virt_pg_map(struct kvm_vm *vm, struct kvm_mmu *mmu, gva_t gva,
+		    gpa_t gpa, int level, bool private)
 {
 	const u64 pg_size = PG_LEVEL_SIZE(level);
 	u64 *pte = &mmu->pgd;
@@ -309,12 +309,19 @@ void __virt_pg_map(struct kvm_vm *vm, struct kvm_mmu *mmu, gva_t gva,
 	 * Neither SEV nor TDX supports shared page tables, so only the final
 	 * leaf PTE needs manually set the C/S-bit.
 	 */
-	if (vm_is_gpa_protected(vm, gpa))
+	if (private)
 		*pte |= PTE_C_BIT_MASK(mmu);
 	else
 		*pte |= PTE_S_BIT_MASK(mmu);
 }
 
+void __virt_pg_map(struct kvm_vm *vm, struct kvm_mmu *mmu, gva_t gva,
+		   gpa_t gpa, int level)
+{
+	___virt_pg_map(vm, mmu, gva, gpa, level,
+		       vm_is_gpa_protected(vm, gpa));
+}
+
 void virt_arch_pg_map(struct kvm_vm *vm, gva_t gva, gpa_t gpa)
 {
 	__virt_pg_map(vm, &vm->mmu, gva, gpa, PG_LEVEL_4K);
-- 
2.54.0.563.g4f69b47b94-goog

