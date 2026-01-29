Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F379919755B
	for <linux-coco@lists.linux.dev>; Thu, 29 Jan 2026 01:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769649335; cv=none; b=QRnJA7gm+P9K6HoXt/jhaoHrHGwSdtrUSnWj9C68tKk1ooRyoUxuIJL79VKd9682x2I5FUd5Bm8QEBKnNMVIF+g6Njs7PCJkDMoWSTWTtDGDhhueJK9FZXY8xdikRO7BKcWinEY4JXqVaLncvaqxBqGCpviBRC59DKR9f3d2gl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769649335; c=relaxed/simple;
	bh=rawa+GdPzt/mn/jjYKeF7IrFPzAWvGBv/cL7AH4QpdE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=pgSUfu9N1kY822Ym9H052msMnOz4kNUeHG1LTNW0CsAs5VxcIjsHScIQvWRb3JxXKgNxiuyAqapqxD3LG3uVSCGSwy+QNUlCmVeg8f+vMyz5mL0aI7KNbcelPR94kKWGDEKvVQUoJUaxdPmQsyriBpbn6EKP2OoLBVMmSJO2zTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=texM+EN9; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="texM+EN9"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-2a76f2d7744so3323205ad.3
        for <linux-coco@lists.linux.dev>; Wed, 28 Jan 2026 17:15:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769649333; x=1770254133; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=QDz31TgUHSC/pAT7NKm7s9BECEFc0xut5G3SF9CrPBg=;
        b=texM+EN930gysi1t0e9spAK6SVsO4FwNkXqLm4ZSTh2uBbso9iOKF+Ry9EzcCfjFu1
         /JD1EVqwUyBlzSdeAp/BWCB8VUBaxLPQgYK1EeIgr+xZHRTNpHnDZQLGmi5Zs/9x0jXu
         JVsa4DMiG85+wMcMCoabE0zie9bmisf+HgUkiEvqCWStcDommxwv8coVbYaI7MXzvHKy
         P4lqIWu7do0sa7wbS9TZWwaPIKZG0qtY5U8uOUs/h9P+tNIv197yXUPnJosOKh3eDhG/
         mAsyMB3URryHvVL2SVHnKJ9IvHRAqP82BQtgjP0ac6OGRr79SXNaGSIDux9pOveZhNr+
         Bnpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769649333; x=1770254133;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QDz31TgUHSC/pAT7NKm7s9BECEFc0xut5G3SF9CrPBg=;
        b=BZS6Y8E4uttAu1Gk4PAnlE+r7XV3UYnR1Nm3Tpxob0BGsSb9RumQoaBQMor5qtdT1h
         JigklGSUV13qSp+K8kQ05IqH9QVoSAD1wAefpfj4LSbnbfUINkRuPuieWcrA96C71SYT
         wr5m0/C7qjuUfI7He7QrgzyuTmxyc63nYKPitDLB2uvGpSD4eNqxFzFD9VmmfgLo7Kq6
         NC081XWXMv78oDZ5B1J5T62FX19qQUApNHZkvvCe4PYLWN60Ja5MthQoWhZorWbge+0f
         dtA0AsXgqtPHWSz0jGhYFnDx5wKDRdIrhFmo4CYFOt+MSWL7tZ0T0sDFxa1AFdmQoh/i
         tUYA==
X-Forwarded-Encrypted: i=1; AJvYcCUCKI6pxIiWO0+JTZf5OnmuZv0j4trnMWPnYRpsgBuydYjRQHprKnvuZNs/plcTzjuEX6fywUSTZXk3@lists.linux.dev
X-Gm-Message-State: AOJu0YwsbxTDr2+NZUOGZpTrASf/OaxYuml/ZRBp59Qv3CbtWSsabDa/
	Q/Dzvr6W89M3gpIH5wDJ8C6yiR36msxWnZF/RsFM7q6EtZEXxB66O8xtNurfIjmGCm4L6Y91AFQ
	0ZFZqjA==
X-Received: from pjbnh9.prod.google.com ([2002:a17:90b:3649:b0:352:ff8b:ef26])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:50c8:b0:32b:9774:d340
 with SMTP id 98e67ed59e1d1-353fedb93fbmr6374509a91.33.1769649333379; Wed, 28
 Jan 2026 17:15:33 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 28 Jan 2026 17:14:35 -0800
In-Reply-To: <20260129011517.3545883-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260129011517.3545883-1-seanjc@google.com>
X-Mailer: git-send-email 2.53.0.rc1.217.geba53bf80e-goog
Message-ID: <20260129011517.3545883-4-seanjc@google.com>
Subject: [RFC PATCH v5 03/45] KVM: TDX: Account all non-transient page
 allocations for per-TD structures
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

Account all non-transient allocations associated with a single TD (or its
vCPUs), as KVM's ABI is that allocations that are active for the lifetime
of a VM are accounted.  Leave temporary allocations, i.e. allocations that
are freed within a single function/ioctl, unaccounted, to again align with
KVM's existing behavior, e.g. see commit dd103407ca31 ("KVM: X86: Remove
unnecessary GFP_KERNEL_ACCOUNT for temporary variables").

Fixes: 8d032b683c29 ("KVM: TDX: create/destroy VM structure")
Fixes: a50f673f25e0 ("KVM: TDX: Do TDX specific vcpu initialization")
Cc: stable@vger.kernel.org
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/tdx.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
index 561461c9d131..5688c77616e3 100644
--- a/arch/x86/kvm/vmx/tdx.c
+++ b/arch/x86/kvm/vmx/tdx.c
@@ -2397,7 +2397,7 @@ static int __tdx_td_init(struct kvm *kvm, struct td_params *td_params,
 
 	atomic_inc(&nr_configured_hkid);
 
-	tdr_page = alloc_page(GFP_KERNEL);
+	tdr_page = alloc_page(GFP_KERNEL_ACCOUNT);
 	if (!tdr_page)
 		goto free_hkid;
 
@@ -2405,12 +2405,12 @@ static int __tdx_td_init(struct kvm *kvm, struct td_params *td_params,
 	/* TDVPS = TDVPR(4K page) + TDCX(multiple 4K pages), -1 for TDVPR. */
 	kvm_tdx->td.tdcx_nr_pages = tdx_sysinfo->td_ctrl.tdvps_base_size / PAGE_SIZE - 1;
 	tdcs_pages = kcalloc(kvm_tdx->td.tdcs_nr_pages, sizeof(*kvm_tdx->td.tdcs_pages),
-			     GFP_KERNEL);
+			     GFP_KERNEL_ACCOUNT);
 	if (!tdcs_pages)
 		goto free_tdr;
 
 	for (i = 0; i < kvm_tdx->td.tdcs_nr_pages; i++) {
-		tdcs_pages[i] = alloc_page(GFP_KERNEL);
+		tdcs_pages[i] = alloc_page(GFP_KERNEL_ACCOUNT);
 		if (!tdcs_pages[i])
 			goto free_tdcs;
 	}
@@ -2885,7 +2885,7 @@ static int tdx_td_vcpu_init(struct kvm_vcpu *vcpu, u64 vcpu_rcx)
 	int ret, i;
 	u64 err;
 
-	page = alloc_page(GFP_KERNEL);
+	page = alloc_page(GFP_KERNEL_ACCOUNT);
 	if (!page)
 		return -ENOMEM;
 	tdx->vp.tdvpr_page = page;
@@ -2898,14 +2898,14 @@ static int tdx_td_vcpu_init(struct kvm_vcpu *vcpu, u64 vcpu_rcx)
 	tdx->vp.tdvpr_pa = page_to_phys(tdx->vp.tdvpr_page);
 
 	tdx->vp.tdcx_pages = kcalloc(kvm_tdx->td.tdcx_nr_pages, sizeof(*tdx->vp.tdcx_pages),
-			       	     GFP_KERNEL);
+				     GFP_KERNEL_ACCOUNT);
 	if (!tdx->vp.tdcx_pages) {
 		ret = -ENOMEM;
 		goto free_tdvpr;
 	}
 
 	for (i = 0; i < kvm_tdx->td.tdcx_nr_pages; i++) {
-		page = alloc_page(GFP_KERNEL);
+		page = alloc_page(GFP_KERNEL_ACCOUNT);
 		if (!page) {
 			ret = -ENOMEM;
 			goto free_tdcx;
-- 
2.53.0.rc1.217.geba53bf80e-goog

