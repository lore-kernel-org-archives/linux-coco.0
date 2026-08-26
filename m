Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A64693C0A07
	for <linux-coco@lists.linux.dev>; Wed, 26 Aug 2026 09:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787735934; cv=none; b=lgZerxK17vN1goFmVMOhHQ2K8c/j4GvLVaQ5Nflutpt+N5Z2G/755c9OY4l1nO7gR/3wAmaQE/Q60baCtBu8XOuoPCciPYnUQp8Ro9icfjjkggzcJKmxrWfE0N/2ksbOssGJyK0vXOGE2kJZpMCtlqkuf6cA7Moku7cri3SD9zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787735934; c=relaxed/simple;
	bh=PO2MNunZb9HZwBl22ORYDFq+/h4PeNVf9wLGFZFf2Dk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=OzR/RurBatMV3BDUOw21qCS8hf5tRQoYrgzL7MyCdZxSULK1qjLfOFNdmZppt9Lr4vcEDhF4fiGvbhpPpNIcraurdSKov0bZ4jKvocNNT9HccF1IX4dHKV2NRshJBhjtaUW3CmnVlm4y5Y4bDZQFFgEyittWArqk2DqSzz8BxUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=IPyH3DTk; arc=none smtp.client-ip=209.85.214.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="IPyH3DTk"
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cc73f47bdcso10162535ad.3
        for <linux-coco@lists.linux.dev>; Wed, 26 Aug 2026 02:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787735924; x=1788340724; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w/MrPAwScae7SNC5gQ+AgoWAoYfkyZe7/ZGB+P6/Few=;
        b=IPyH3DTk6WvkUNhBVe89NZnkTiuUjZV6VGKaEj2ApJM6RdFEWG8Z1HiA9wHKrJ1w6y
         oZKUduAelxSDnAhSndPeY9Ymp3Mke1LL4+aUHB8mM/Cz0sGYq+eVDb/E1/byLyGYtIOb
         tZ+KZLc+TYj3/BqPn9HMST7lh2aiUzLj4mZYNjFXR0568HMv5RqYsmQqsl+RTgoNCwaB
         ZyYTh55xaELzUG9QGUMjNPPdou4GlhVj3Q95Uk9rPOPXRIApGQdIpWu3cc4q2F5U3IS1
         OxGYcKjZsDfPE4uKGU9S70Ncch5dWiROfLyk90FhHhLXuVGKAL50YnSU1GauWSBPwTBv
         DlyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787735924; x=1788340724;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w/MrPAwScae7SNC5gQ+AgoWAoYfkyZe7/ZGB+P6/Few=;
        b=cQAuu0CivViJxFjEjhaRoNttQYwMTd7HDt/7Vuo6kregqu9RA5zU7zd3YKNdeP1uRu
         vjiVz5MExpeTE2Do5ivE2dFeRhZdM9MXrKWe2IyWNJbSLOopI9l8jrthngj4jLPl/mh1
         dWLTa6tRdY/upsCGgY/xQ6mwe3tnAkc4m+xCSl3Of7xQOO1noN7BJTqha3hk5vfiNWkf
         tVs4t4EoqgzWgx+omovLcTIW0MZjM7ZjvaUlBzZ9zQ02AQ1+EC/Z6FWpBmU7MZtVFex2
         /KtE0NgI50bD/qC77q/l5fIFK+YMTvxA5li9pn6oK10C5ZNpKtHYH/3oFkNFKYXfJvP/
         J4Ww==
X-Forwarded-Encrypted: i=1; AHgh+RoLtktC/4p6tpvuErY6TGx5Od2l9GnrTvjBHyoW6zj4ONWtMMVf47up/15Fb7Gw8XZ2czrpZIeAInWR@lists.linux.dev
X-Gm-Message-State: AFuF++lAX7cXo/c9gdwplzEyeMB/G2Vz+AqtYfdHzbR4xHISy9DPHxI0
	ETHkeXRBgM7zK2uWmNJ8v8v/hc/3OkBlPnEoSfdH/tqlS1E67dgvqrnfeQ6ED59IrBCLRkJUX9r
	pJS1oAOA63MbUkGJB4ltgoBXQRQ==
X-Received: from plgl2.prod.google.com ([2002:a17:902:f682:b0:2ce:fc90:1592])
 (user=ackerleytng job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:4b24:b0:2c9:9a2e:dab0 with SMTP id d9443c01a7336-2d707954e7amr92849785ad.3.1787735923219;
 Wed, 26 Aug 2026 02:18:43 -0700 (PDT)
Date: Wed, 26 Aug 2026 09:18:19 +0000
In-Reply-To: <20260826-gmem-inplace-conversion-v11-0-0a15d8a799aa@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260826-gmem-inplace-conversion-v11-0-0a15d8a799aa@google.com>
X-Developer-Key: i=ackerleytng@google.com; a=ed25519; pk=sAZDYXdm6Iz8FHitpHeFlCMXwabodTm7p8/3/8xUxuU=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787735885; l=3571;
 i=ackerleytng@google.com; s=20260225; h=from:subject:message-id;
 bh=PO2MNunZb9HZwBl22ORYDFq+/h4PeNVf9wLGFZFf2Dk=; b=COR7GFzGLu/psgq6NvdCH71Xw562i7ft3V4TM/YczzmbWiVB3kTpG3bS8GYlAlyMnzKrTQKrs
 8XWKHarrzHICgz5dCrSpg3pNIwENjmrLkU/Y5GeRNUx1eSb93bTXP7P
X-Mailer: b4 0.16.0
Message-ID: <20260826-gmem-inplace-conversion-v11-21-0a15d8a799aa@google.com>
Subject: [PATCH v11 21/46] KVM: TDX: Make source page optional for KVM_TDX_INIT_MEM_REGION
From: Ackerley Tng <ackerleytng@google.com>
To: aik@amd.com, andrew.jones@linux.dev, binbin.wu@linux.intel.com, 
	brauner@kernel.org, chao.p.peng@linux.intel.com, david@kernel.org, 
	jmattson@google.com, jthoughton@google.com, michael.roth@amd.com, 
	oupton@kernel.org, pankaj.gupta@amd.com, qperret@google.com, 
	rick.p.edgecombe@intel.com, rientjes@google.com, shivankg@amd.com, 
	steven.price@arm.com, willy@infradead.org, wyihan@google.com, 
	yan.y.zhao@intel.com, forkloop@google.com, pratyush@kernel.org, 
	suzuki.poulose@arm.com, aneesh.kumar@kernel.org, liam@infradead.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Shuah Khan <shuah@kernel.org>, Vishal Annapurve <vannapurve@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>, 
	Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Nhat Pham <nphamcs@gmail.com>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Youngjun Park <youngjun.park@lge.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Kiryl Shutsemau <kas@kernel.org>, Baoquan He <baoquan.he@linux.dev>, Jason Gunthorpe <jgg@ziepe.ca>, 
	John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, tarunsahu@google.com, 
	Fuad Tabba <fuad.tabba@linux.dev>, Vlastimil Babka <vbabka@kernel.org>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-coco@lists.linux.dev, Ackerley Tng <ackerleytng@google.com>, 
	Xiaoyao Li <xiaoyao.li@intel.com>
Content-Type: text/plain; charset="utf-8"

Update tdx_gmem_post_populate() to handle cases where userspace requests
"no source page". To handle "no source page", populate (perform
TDH.MEM.PAGE.ADD) using memory in-place at the target PFN.

Allow "no source page" only when gmem_in_place_conversion is enabled,
because retroactively adding support for out-of-place conversion would mean
requiring a userspace update for a feature that's being deprecated.

Also, KVM supporting "no source page" without in-place conversion would
effectively be an obscure zero-page optimization that relies on the page
being zeroed when it is allocated by guest_memfd.

Rejecting "no source page" without in-place conversion scenario is valuable
for KVM developers since it helps newcomers understand what exactly is and
isn't possible.

Co-developed-by: Sean Christopherson <seanjc@google.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
Tested-by: Shivank Garg <shivankg@amd.com>
Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
Tested-by: Yan Zhao <yan.y.zhao@intel.com>
Reviewed-by: Yan Zhao <yan.y.zhao@intel.com>
Reviewed-by: Xiaoyao Li <xiaoyao.li@intel.com>
Signed-off-by: Ackerley Tng <ackerleytng@google.com>
---
 Documentation/virt/kvm/x86/intel-tdx.rst | 4 ++++
 arch/x86/kvm/vmx/tdx.c                   | 8 +++++---
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/Documentation/virt/kvm/x86/intel-tdx.rst b/Documentation/virt/kvm/x86/intel-tdx.rst
index 6a222e9d09541..d8d9409120e61 100644
--- a/Documentation/virt/kvm/x86/intel-tdx.rst
+++ b/Documentation/virt/kvm/x86/intel-tdx.rst
@@ -158,6 +158,10 @@ KVM_TDX_INIT_MEM_REGION
 Initialize @nr_pages TDX guest private memory starting from @gpa with userspace
 provided data from @source_addr. @source_addr must be PAGE_SIZE-aligned.
 
+If guest_memfd in-place conversion is enabled, pass 0 for @source_addr
+to represent "no source page". A source page is required if in-place
+conversion is not enabled or not supported.
+
 Note, before calling this sub command, memory attribute of the range
 [gpa, gpa + nr_pages] needs to be private.  Userspace can use
 KVM_SET_MEMORY_ATTRIBUTES to set the attribute.
diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
index b272c20586a74..7654a9f5fa128 100644
--- a/arch/x86/kvm/vmx/tdx.c
+++ b/arch/x86/kvm/vmx/tdx.c
@@ -3189,7 +3189,7 @@ static int tdx_gmem_post_populate(struct kvm *kvm, gfn_t gfn, kvm_pfn_t pfn,
 	if (KVM_BUG_ON(kvm_tdx->page_add_src, kvm))
 		return -EIO;
 
-	kvm_tdx->page_add_src = src_page;
+	kvm_tdx->page_add_src = src_page ?: pfn_to_page(pfn);
 	ret = kvm_tdp_mmu_map_private_pfn(arg->vcpu, gfn, pfn);
 	kvm_tdx->page_add_src = NULL;
 
@@ -3235,7 +3235,8 @@ static int tdx_vcpu_init_mem_region(struct kvm_vcpu *vcpu, struct kvm_tdx_cmd *c
 	if (copy_from_user(&region, u64_to_user_ptr(cmd->data), sizeof(region)))
 		return -EFAULT;
 
-	if (!PAGE_ALIGNED(region.source_addr) || !region.source_addr ||
+	if (!PAGE_ALIGNED(region.source_addr) ||
+	    (!gmem_in_place_conversion && !region.source_addr) ||
 	    !PAGE_ALIGNED(region.gpa) || !region.nr_pages ||
 	    region.gpa + (region.nr_pages << PAGE_SHIFT) <= region.gpa ||
 	    !vt_is_tdx_private_gpa(kvm, region.gpa) ||
@@ -3266,7 +3267,8 @@ static int tdx_vcpu_init_mem_region(struct kvm_vcpu *vcpu, struct kvm_tdx_cmd *c
 			break;
 		}
 
-		region.source_addr += PAGE_SIZE;
+		if (region.source_addr)
+			region.source_addr += PAGE_SIZE;
 		region.gpa += PAGE_SIZE;
 		region.nr_pages--;
 

-- 
2.55.0.887.g758fc8c411-goog

