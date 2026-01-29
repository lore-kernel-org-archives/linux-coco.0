Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A2BE343D76
	for <linux-coco@lists.linux.dev>; Thu, 29 Jan 2026 01:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769649367; cv=none; b=FiH9MrPpjBgRBNGiP/6jGz6HBUGrKAxMguz+/fBe7wC8pJlLeRa6k/lFlJmnSRdVb4UGMEWfby3XHHapldxtNrRcWRgfkR8ZBA4nasnIDbJPOehZ/CYtJXx7kroQoDP3rfeJzDjf1gFPaJ3cEjyL0DmwYAZdcW5jy/OFSMtzVP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769649367; c=relaxed/simple;
	bh=AXxQxnhtnt5YWRVt+lGWA6sUB4Tt8qHFbJ97Bkuq2Ck=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=rBKDZ9Wn4DAp/RtR1iQoMYwYOWuI+LXYSGG0Kx3z5s90kgxtEtFmhUd9qTdxf3K9crEwA6Wc/1U95zaTHqDIc77w6Y0jElx9Juo3T0NPeuaWY1zMcc1fWrD6yNSWbbgIqRYykUfKEpNGrG6oqaPBlgiBjS/Qgu4VC+KzLIjAvaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=3r3BgHfR; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3r3BgHfR"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-34c66cb671fso314880a91.3
        for <linux-coco@lists.linux.dev>; Wed, 28 Jan 2026 17:16:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769649363; x=1770254163; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=CQTLYZXbjXhuegQycdxIvwBS6byU7gVEkkc0u846/P4=;
        b=3r3BgHfRD1dGXoN4gZPr9924dOwz3XUKvIOjYCoMI6BmY1BdLEKkCrAHZa97InRzwf
         XFQG8yQsZ5/iXLZgIwnwVjr/glrjWLEzPqL4PGHRDqselm0HES7VLcoR92z//EMbInMr
         AHL9Qjlb+5d7YatZrgkk5HFVi73UlnV2D2WiBfYl/Ip+pZ5fLqF8WL4CupErHFlYQp4k
         +qRtgw0gCzDWMT57dDztUiKfoDTucik0ZaH1B9OBQKVyKjTZzD0tGtuAENVjAWkOhuvC
         l6+R25sgXd9rfUtqP1XJp3BRy3PvPyHfmOm8keSSkjMqH5tD/E9uFLxvGAyDYVG/jtVV
         7TAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769649363; x=1770254163;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CQTLYZXbjXhuegQycdxIvwBS6byU7gVEkkc0u846/P4=;
        b=liisvCcX3YbOYpl2jTkT+9wNp+BzWrdtrfRLdkL+4Im2ISdoNuJLsbPQCtxbWVCHnO
         tcpUrzXizQ9LY+P1GvSaNot/5dVm0oG4qJxigegz4o4YwX2hf9ybicSpXq3AwtNyC/+V
         8YRqGJJXF5eIFqJZ1z3FACRV97qB0yTF3xk3uSWhowm0gMj7zQpyH1ffZLuHxUMCMGDB
         Fni+NnBv8Ps+4uEiwYKWMvJy+RvCZDkQLwFwewwYWDOpvTOZF0bOf511+PVKLLmXBR3a
         hib/Iem437R4GIkxazqGU2/+JTBoZqb5jFqP8scFBUVd8MvVH3whN0xI8ypUM9Qh0ML9
         O7gw==
X-Forwarded-Encrypted: i=1; AJvYcCWGUU+GowcxdT2hjHG0/Ti9Cvg+nuLkVdVpQlivKtWleaNK6tpLp7CRXKqqN2XLl6roLduxGj+rM4GB@lists.linux.dev
X-Gm-Message-State: AOJu0YzUv29rIR/N5+52ScKABkACsOdgbC1iUtZ9BlniFPy5c9QhK0a6
	ifExqD0WSrX4HAl8tODTjtsmwkmllPRR7VuJUFZUrkNkyI5Tdasm9NA47Bxk7kpwl74vYUyAvVe
	lv7qTTg==
X-Received: from pjbmy4.prod.google.com ([2002:a17:90b:4c84:b0:353:31e9:fe44])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:51cb:b0:340:a5b2:c305
 with SMTP id 98e67ed59e1d1-353feccf407mr5767501a91.2.1769649363134; Wed, 28
 Jan 2026 17:16:03 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 28 Jan 2026 17:14:50 -0800
In-Reply-To: <20260129011517.3545883-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260129011517.3545883-1-seanjc@google.com>
X-Mailer: git-send-email 2.53.0.rc1.217.geba53bf80e-goog
Message-ID: <20260129011517.3545883-19-seanjc@google.com>
Subject: [RFC PATCH v5 18/45] KVM: TDX: Allocate PAMT memory for TD and vCPU
 control structures
From: Sean Christopherson <seanjc@google.com>
To: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Kiryl Shutsemau <kas@kernel.org>, Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev, 
	kvm@vger.kernel.org, Kai Huang <kai.huang@intel.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Yan Zhao <yan.y.zhao@intel.com>, 
	Vishal Annapurve <vannapurve@google.com>, Ackerley Tng <ackerleytng@google.com>, 
	Sagi Shahar <sagis@google.com>, Binbin Wu <binbin.wu@linux.intel.com>, 
	Xiaoyao Li <xiaoyao.li@intel.com>, Isaku Yamahata <isaku.yamahata@intel.com>
Content-Type: text/plain; charset="UTF-8"

From: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>

TDX TD control structures are provided to the TDX module at 4KB page size
and require PAMT backing. This means for Dynamic PAMT they need to also
have 4KB backings installed. Use the recently introduce TDX APIs for
allocating/freeing control pages, which handle DPAMT maintenance, to
allocate/free TD and vCPU pages for TDX guests.

Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
[update log]
Signed-off-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
[sean: handle alloc+free+reclaim in one patch]
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/tdx.c | 35 ++++++++++++++---------------------
 1 file changed, 14 insertions(+), 21 deletions(-)

diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
index 4ef414ee27b4..323aae4300a1 100644
--- a/arch/x86/kvm/vmx/tdx.c
+++ b/arch/x86/kvm/vmx/tdx.c
@@ -360,7 +360,7 @@ static void tdx_reclaim_control_page(struct page *ctrl_page)
 	if (tdx_reclaim_page(ctrl_page))
 		return;
 
-	__free_page(ctrl_page);
+	__tdx_free_control_page(ctrl_page);
 }
 
 struct tdx_flush_vp_arg {
@@ -597,7 +597,7 @@ static void tdx_reclaim_td_control_pages(struct kvm *kvm)
 
 	tdx_quirk_reset_page(kvm_tdx->td.tdr_page);
 
-	__free_page(kvm_tdx->td.tdr_page);
+	__tdx_free_control_page(kvm_tdx->td.tdr_page);
 	kvm_tdx->td.tdr_page = NULL;
 }
 
@@ -2412,7 +2412,7 @@ static int __tdx_td_init(struct kvm *kvm, struct td_params *td_params,
 
 	atomic_inc(&nr_configured_hkid);
 
-	tdr_page = alloc_page(GFP_KERNEL_ACCOUNT);
+	tdr_page = __tdx_alloc_control_page(GFP_KERNEL_ACCOUNT);
 	if (!tdr_page)
 		goto free_hkid;
 
@@ -2425,7 +2425,7 @@ static int __tdx_td_init(struct kvm *kvm, struct td_params *td_params,
 		goto free_tdr;
 
 	for (i = 0; i < kvm_tdx->td.tdcs_nr_pages; i++) {
-		tdcs_pages[i] = alloc_page(GFP_KERNEL_ACCOUNT);
+		tdcs_pages[i] = __tdx_alloc_control_page(GFP_KERNEL_ACCOUNT);
 		if (!tdcs_pages[i])
 			goto free_tdcs;
 	}
@@ -2543,10 +2543,8 @@ static int __tdx_td_init(struct kvm *kvm, struct td_params *td_params,
 teardown:
 	/* Only free pages not yet added, so start at 'i' */
 	for (; i < kvm_tdx->td.tdcs_nr_pages; i++) {
-		if (tdcs_pages[i]) {
-			__free_page(tdcs_pages[i]);
-			tdcs_pages[i] = NULL;
-		}
+		__tdx_free_control_page(tdcs_pages[i]);
+		tdcs_pages[i] = NULL;
 	}
 	if (!kvm_tdx->td.tdcs_pages)
 		kfree(tdcs_pages);
@@ -2561,16 +2559,13 @@ static int __tdx_td_init(struct kvm *kvm, struct td_params *td_params,
 	free_cpumask_var(packages);
 
 free_tdcs:
-	for (i = 0; i < kvm_tdx->td.tdcs_nr_pages; i++) {
-		if (tdcs_pages[i])
-			__free_page(tdcs_pages[i]);
-	}
+	for (i = 0; i < kvm_tdx->td.tdcs_nr_pages; i++)
+		__tdx_free_control_page(tdcs_pages[i]);
 	kfree(tdcs_pages);
 	kvm_tdx->td.tdcs_pages = NULL;
 
 free_tdr:
-	if (tdr_page)
-		__free_page(tdr_page);
+	__tdx_free_control_page(tdr_page);
 	kvm_tdx->td.tdr_page = NULL;
 
 free_hkid:
@@ -2900,7 +2895,7 @@ static int tdx_td_vcpu_init(struct kvm_vcpu *vcpu, u64 vcpu_rcx)
 	int ret, i;
 	u64 err;
 
-	page = alloc_page(GFP_KERNEL_ACCOUNT);
+	page = __tdx_alloc_control_page(GFP_KERNEL_ACCOUNT);
 	if (!page)
 		return -ENOMEM;
 	tdx->vp.tdvpr_page = page;
@@ -2920,7 +2915,7 @@ static int tdx_td_vcpu_init(struct kvm_vcpu *vcpu, u64 vcpu_rcx)
 	}
 
 	for (i = 0; i < kvm_tdx->td.tdcx_nr_pages; i++) {
-		page = alloc_page(GFP_KERNEL_ACCOUNT);
+		page = __tdx_alloc_control_page(GFP_KERNEL_ACCOUNT);
 		if (!page) {
 			ret = -ENOMEM;
 			goto free_tdcx;
@@ -2942,7 +2937,7 @@ static int tdx_td_vcpu_init(struct kvm_vcpu *vcpu, u64 vcpu_rcx)
 			 * method, but the rest are freed here.
 			 */
 			for (; i < kvm_tdx->td.tdcx_nr_pages; i++) {
-				__free_page(tdx->vp.tdcx_pages[i]);
+				__tdx_free_control_page(tdx->vp.tdcx_pages[i]);
 				tdx->vp.tdcx_pages[i] = NULL;
 			}
 			return -EIO;
@@ -2970,16 +2965,14 @@ static int tdx_td_vcpu_init(struct kvm_vcpu *vcpu, u64 vcpu_rcx)
 
 free_tdcx:
 	for (i = 0; i < kvm_tdx->td.tdcx_nr_pages; i++) {
-		if (tdx->vp.tdcx_pages[i])
-			__free_page(tdx->vp.tdcx_pages[i]);
+		__tdx_free_control_page(tdx->vp.tdcx_pages[i]);
 		tdx->vp.tdcx_pages[i] = NULL;
 	}
 	kfree(tdx->vp.tdcx_pages);
 	tdx->vp.tdcx_pages = NULL;
 
 free_tdvpr:
-	if (tdx->vp.tdvpr_page)
-		__free_page(tdx->vp.tdvpr_page);
+	__tdx_free_control_page(tdx->vp.tdvpr_page);
 	tdx->vp.tdvpr_page = NULL;
 	tdx->vp.tdvpr_pa = 0;
 
-- 
2.53.0.rc1.217.geba53bf80e-goog

