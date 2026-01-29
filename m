Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E396374755
	for <linux-coco@lists.linux.dev>; Thu, 29 Jan 2026 01:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769649401; cv=none; b=d7mASMW7Kq5h3PSdlQZdGrg/eK7ZROaAXgqN81lvr+rE/qOL9wbd4h0ZfQljgXNVvDOLitjGOMm3q/RVWQEyUjoFVFCkHZvlZlq8tDAAVPUyGEXbdFuClYgtRqQkvYhd48M6R/s9so3b2ZOeVzZ8CGVpJiib+Ob5tLDGXBkemkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769649401; c=relaxed/simple;
	bh=E81ZhmT2t0PJD5dbqVBjf6xweJIj6b/NPrrZPd0lj4k=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=sSiv2w2MQuYR6MOcUWXwRLyV15HCGA5lXGKZ9HRPz4edgsumFn5+eFjL67gWQJJTGLHXVq51tRTp1orNqAIUrj2xQHjB5sDIs45duro97Y/BMq0W5jroIitgYWsRULHtmNvAVifiIJ6+5Qot8/6innNTensoFAUo5CpYacNN9Rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Za/VyZuE; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Za/VyZuE"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-81c68fef4d4so1145349b3a.2
        for <linux-coco@lists.linux.dev>; Wed, 28 Jan 2026 17:16:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769649400; x=1770254200; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=4KWczVW3BK+JCRmXurxu5hKVHytxWOCNoKeowZmDwwM=;
        b=Za/VyZuET9CtJZ0cpTJZzD+hUCTV5abDZSMniEC21hdbc1tzRgaxZCZ8nI+uCg7osl
         +rPZT5b7W2c3XR4ScrprBKBok5Esm4WXjErNJaNK2OqyloWH0wX5ck0WsEtNpoBIruyx
         GBzQ0EvHMz8BGDwW1dAdM58ejXWMPJw0Qb5JrrEOykT3ejQkNStRz9lttkMD4jQ4xxzL
         wNtTFRqumEWBL9nYOQLWSOkx7RifH53usH8SNxIJJ+8QePUDxkgmYZu1MIIImordWfQU
         ++OLi7cvzkE/vOEErLaSgCWw8ZPBSbeb3bhtAFVVq1PPrH987B6E8RZWz4cTO3oxNHUH
         SD1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769649400; x=1770254200;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4KWczVW3BK+JCRmXurxu5hKVHytxWOCNoKeowZmDwwM=;
        b=Hw6Wpk1lAdfFK0DfCTYjopTXKExeiWVM9mPv/iq8yXYs8sODl40VHtidhO5cS0kCbQ
         sz1aWgtYFMkLz6UAXNy+S18taK4kB3BPgRRypwj9VG/qO0oDrMYYKNbXk+uDOwZr0NJP
         8NqVW/KK7C+cod3vKjtl3Gi1i6cQC0JGHr7OHw+cKhUzzmZzooNvnhUNQ9/SCVZs6lEu
         PTx6A6UZfaCFg/WewJKwwyo7XXDWoMOxXrrFshjRNCY05rvE3DJvVIpZtuXXSwGRSdTe
         34vtvpTT+fRcCWyNkj8OtB8vsgpYFlYVRLKQJpZa5SfyXAPryLwoq1ckF5kzBgyF2T3s
         SDkg==
X-Forwarded-Encrypted: i=1; AJvYcCX1/putEEkaYXlJj+6MwCNnlcbGQqSq+drwB0Rvq3+jG7g3ieDTqy+49zIOjKWGsqeK6cNg3yVYR1Px@lists.linux.dev
X-Gm-Message-State: AOJu0YyZl+sWYhPhECkKhHOCmxpS5uIzuw7lT7WnuNVhb+3QFQcbnpJa
	WhGfp9K9dvdrG2zIjHmn8IrOXRtwO+maneWLXCfyHpLayVYzHmLwOy1Jlq1YFRTzXxlGCr0IamP
	dxV+xNg==
X-Received: from pfcy16.prod.google.com ([2002:a05:6a00:93d0:b0:823:747:7567])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:3d14:b0:81b:1a87:9eb9
 with SMTP id d2e1a72fcca58-823691866damr6265136b3a.25.1769649399557; Wed, 28
 Jan 2026 17:16:39 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 28 Jan 2026 17:15:10 -0800
In-Reply-To: <20260129011517.3545883-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260129011517.3545883-1-seanjc@google.com>
X-Mailer: git-send-email 2.53.0.rc1.217.geba53bf80e-goog
Message-ID: <20260129011517.3545883-39-seanjc@google.com>
Subject: [RFC PATCH v5 38/45] KVM: x86/mmu: Add Dynamic PAMT support in TDP
 MMU for vCPU-induced page split
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

Extend the TDP MMU to support vCPU-induced hugepage splits in mirror roots
when Dynamic PAMT is enabled.  I.e. top-up the PAMT cache when allocating
a new child page table, so that if the split is successful, there will be
a PAMT paging waiting to associated with the new less/non-huge mapping.

Note, the allocation is for the guest memory, not the S-EPT page, as PAMT
pages are accounted up front by .alloc_external_sp().

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/mmu/tdp_mmu.c | 25 ++++++++++++++++---------
 arch/x86/kvm/vmx/tdx.c     |  3 +++
 2 files changed, 19 insertions(+), 9 deletions(-)

diff --git a/arch/x86/kvm/mmu/tdp_mmu.c b/arch/x86/kvm/mmu/tdp_mmu.c
index 4f5b80f0ca03..e32034bfca5a 100644
--- a/arch/x86/kvm/mmu/tdp_mmu.c
+++ b/arch/x86/kvm/mmu/tdp_mmu.c
@@ -1456,21 +1456,28 @@ static struct kvm_mmu_page *tdp_mmu_alloc_sp_for_split(struct tdp_iter *iter)
 		return NULL;
 
 	sp->spt = (void *)get_zeroed_page(GFP_KERNEL_ACCOUNT);
-	if (!sp->spt) {
-		kmem_cache_free(mmu_page_header_cache, sp);
-		return NULL;
-	}
+	if (!sp->spt)
+		goto err_spt;
 
 	if (is_mirror_sptep(iter->sptep)) {
 		sp->external_spt = (void *)kvm_x86_call(alloc_external_sp)(GFP_KERNEL_ACCOUNT);
-		if (!sp->external_spt) {
-			free_page((unsigned long)sp->spt);
-			kmem_cache_free(mmu_page_header_cache, sp);
-			return NULL;
-		}
+		if (!sp->external_spt)
+			goto err_external_spt;
+
+		if (kvm_x86_call(topup_external_cache)(kvm_get_running_vcpu(), 1))
+			goto err_external_split;
 	}
 
 	return sp;
+
+err_external_split:
+	kvm_x86_call(free_external_sp)((unsigned long)sp->external_spt);
+err_external_spt:
+	free_page((unsigned long)sp->spt);
+err_spt:
+	kmem_cache_free(mmu_page_header_cache, sp);
+	return NULL;
+
 }
 
 /* Note, the caller is responsible for initializing @sp. */
diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
index 59b7ba36d3d9..e90610540a0b 100644
--- a/arch/x86/kvm/vmx/tdx.c
+++ b/arch/x86/kvm/vmx/tdx.c
@@ -1625,6 +1625,9 @@ static int tdx_topup_external_pamt_cache(struct kvm_vcpu *vcpu, int min)
 	if (!tdx_supports_dynamic_pamt(tdx_sysinfo))
 		return 0;
 
+	if (WARN_ON_ONCE(!vcpu))
+		return -EIO;
+
 	return tdx_topup_pamt_cache(&to_tdx(vcpu)->pamt_cache, min);
 }
 
-- 
2.53.0.rc1.217.geba53bf80e-goog

