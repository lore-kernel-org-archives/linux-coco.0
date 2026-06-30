Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21D3432470F
	for <linux-coco@lists.linux.dev>; Tue, 30 Jun 2026 21:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782855438; cv=none; b=dPpXwEsbEoIWfJROKgO4p9IAu0mS4GqhQhBmIBvBVml9esUY0O5czTleVMk2Yu0ArgIXxNcItqvQHRYYvx1cAbPqUdMaVArO0JNjVixkVRfygf1mJwa5faoDP9Tb5S0h3Kcyu8EDzENyiALNJwsiC2O/BlSkmC/uB7qXMhAbiXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782855438; c=relaxed/simple;
	bh=PfL/KrfF/nM4dCO0Bt5k6/6q2wcRo8P21hIe83hdWwg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Ua6NCpth2BnKMcSG6ED+DR63lEiU1zUsgp8yj0DXqPmyDKpgtpbdCRQp7pbTii/ZkI/bh32IuyjKqeqL5lkEyV2q1iUxYurG6b1KWq8IDO6XkF3QNOjJqlvjq2EMogv6VqtYR0y7W2tv1MzWsC7wvjlXbuz+eTDLnnskdwr1q9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qCa8G1V5; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qCa8G1V5"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-2c987913b08so125495ad.2
        for <linux-coco@lists.linux.dev>; Tue, 30 Jun 2026 14:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782855436; x=1783460236; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=TOW0Zc3HQX5JVoEMdXzsZ2+bZzhBD5tvhepZcMxoBvs=;
        b=qCa8G1V5Z3qufrq1KRJ6+jT5gNuoweUZQnCfS5goypkn2+QugD5g7GjsEjVT7bVclN
         UyE+zcabmtfYR6Ty4uHZFkjSfMkFDHWuDJNThLrf3AekeusWgZF03li06zXEBGFQhcXS
         Ej48hR1qcfIasUfjp5mAO/0aKMvI1J4ivlw+/TYU/Px00mgFDtiA4SrHI8A5X9egSUnW
         cnLZbDvOItj40Iu3iVH6OHZlj7W83dKbuEFHrO/POiluifgWNjiZ3LIVhlKsRibQYqPf
         tAOOUEC37bgrFWSUxjvG0lfQHpqMHafLKlV1RvGlnD/l69jK+xJt5gzLZN3LH4nqCoQf
         7Piw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782855436; x=1783460236;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TOW0Zc3HQX5JVoEMdXzsZ2+bZzhBD5tvhepZcMxoBvs=;
        b=X0e1oSZPkH2wb98p5u41OpKwirJAzztei2YvukXKu+gRkj7AR+eWmz6kJQaWvh3v16
         M228zb78lF47OhA9NOv3mQwuyYVknQRODnu6Uh0S+FZKLbAN5p0C/DX74VgRKLXyb/5N
         Mm3ayRxggCbo73E4GH+6Ck4OOHlnnBnvQFVyg496TcywF+eU+QJgY4zDEcq2FcfHCDSN
         vKyQhIIayij8tUlN53bTxRRvNM6NrEofPUXYbHQ82g+OOsks9NcVcCRHUXakQsq7uisE
         HOMX1ekGsdvUBF8jfnX4IFYa4ZDftbHr2TXwNWqQHM7NlpPWLWg6uKyNmIO4STHqAPc6
         jveQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpw8z2qYy6lRcWbbyePMwdi5BURkCfOPnPRuP66nKuPvJB7i2clu/ycUFaoo1qeRiya58m1JXSEf9wL@lists.linux.dev
X-Gm-Message-State: AOJu0Yx1n/SOYntg4nY/O8jWPjHoHHfJusUqhQjTCovQ6e7WTIqa+jL6
	CvbUzw1iP2dS/udCZdJ77J3B5hiOGWpTqPQ0NWujL8C9+kb+jz7w3jbjOW5FTH/jRmDj9dAncZF
	2XL/YSg==
X-Received: from plcl21.prod.google.com ([2002:a17:902:e2d5:b0:2c7:ed23:f48b])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:e949:b0:2c6:9f6a:9f6f
 with SMTP id d9443c01a7336-2ca5a5eaff3mr18323585ad.28.1782855436276; Tue, 30
 Jun 2026 14:37:16 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Tue, 30 Jun 2026 14:37:11 -0700
In-Reply-To: <20260630213711.479692-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260630213711.479692-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
Message-ID: <20260630213711.479692-3-seanjc@google.com>
Subject: [PATCH v2 2/2] KVM: TDX: Return EINVAL, not EOPNOTSUPP, for NULL
 INIT_MEM_REGION source
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Kiryl Shutsemau <kas@kernel.org>
Cc: Dave Hansen <dave.hansen@linux.intel.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, kvm@vger.kernel.org, x86@kernel.org, 
	linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Sashiko Bot <sashiko-bot@kernel.org>, Joerg Roedel <joerg.roedel@amd.com>, 
	Yan Zhao <yan.y.zhao@intel.com>, Ackerley Tng <ackerleytng@google.com>
Content-Type: text/plain; charset="UTF-8"

Return EINVAL instead of EOPNOTSUPP if userspace attempts to pass a NULL
pointer for the source page of INIT_MEM_REGION, so that KVM's ABI is
consistent between TDX and SNP (for LAUNCH_UPDATE).  EOPNOTSUPP was chosen
to be a forward-looking error code for when guest_memfd supports in-place
conversion, but even when in-place conversion comes along, it's an awkward
error code as KVM is deliberately choosing to disallow virtual address '0',
which is technically a legal userspace address.  I.e. it's not so much a
lack of support as it is that KVM reserves address '0' to simplify KVM's
internal implementation.

Opportunistically move the check so that it's co-located with the other
checks on the userspace address, and so that it's more obvious that a NULL
source address is explicitly disallowed.

Fixes: 2a62345b3052 ("KVM: guest_memfd: GUP source pages prior to populating guest memory")
Cc: Yan Zhao <yan.y.zhao@intel.com>
Cc: Ackerley Tng <ackerleytng@google.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/tdx.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
index ffe9d0db58c5..b0ec054732b9 100644
--- a/arch/x86/kvm/vmx/tdx.c
+++ b/arch/x86/kvm/vmx/tdx.c
@@ -3198,9 +3198,6 @@ static int tdx_gmem_post_populate(struct kvm *kvm, gfn_t gfn, kvm_pfn_t pfn,
 	if (KVM_BUG_ON(kvm_tdx->page_add_src, kvm))
 		return -EIO;
 
-	if (!src_page)
-		return -EOPNOTSUPP;
-
 	kvm_tdx->page_add_src = src_page;
 	ret = kvm_tdp_mmu_map_private_pfn(arg->vcpu, gfn, pfn);
 	kvm_tdx->page_add_src = NULL;
@@ -3247,8 +3244,8 @@ static int tdx_vcpu_init_mem_region(struct kvm_vcpu *vcpu, struct kvm_tdx_cmd *c
 	if (copy_from_user(&region, u64_to_user_ptr(cmd->data), sizeof(region)))
 		return -EFAULT;
 
-	if (!PAGE_ALIGNED(region.source_addr) || !PAGE_ALIGNED(region.gpa) ||
-	    !region.nr_pages ||
+	if (!PAGE_ALIGNED(region.source_addr) || !region.source_addr ||
+	    !PAGE_ALIGNED(region.gpa) || !region.nr_pages ||
 	    region.gpa + (region.nr_pages << PAGE_SHIFT) <= region.gpa ||
 	    !vt_is_tdx_private_gpa(kvm, region.gpa) ||
 	    !vt_is_tdx_private_gpa(kvm, region.gpa + (region.nr_pages << PAGE_SHIFT) - 1))
-- 
2.55.0.rc0.799.gd6f94ed593-goog

