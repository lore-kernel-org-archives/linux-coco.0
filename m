Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3865223D7FB
	for <linux-coco@lists.linux.dev>; Thu, 29 Jan 2026 01:16:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769649385; cv=none; b=Xk0V4D3AJlGICG/TtRwAj9N23WKNg8Q5/eZL8exfweaKJ021UfE8vxdE32RCrdtt3G5+2TocoI5Ax5jLku1b//ricbBpM44rBZy0nPAQtYDmICnDBm+9IJeKJAv5yfRbRFg6hiDtooctMW/5HeqCUthfJOwwcVDMWe0i8A0E4vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769649385; c=relaxed/simple;
	bh=E/p9aO3ZAiwSbYiHC1+ljXC/97KIVcZ8eXjeNv4DXak=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=d3mHrL5E3zX8T5XR7jOfu8qEirx8Wo+MvuxGuJGmZz5aT04FUM+a0ndhEtRkxSzjvmcytxbVKI8esd72cuS2Sb8RCxTxos/dPAtdUYqxqMZTOlMwZhqTxiohWvPkEFneh+nhmXN/O+kf7lHqMQ45eFaGF3wBEVU4RNE+fnp8KtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=X/qCZE6P; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="X/qCZE6P"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-c63597a63a6so303215a12.3
        for <linux-coco@lists.linux.dev>; Wed, 28 Jan 2026 17:16:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769649382; x=1770254182; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=EhyaETaO3z5ZObA+zH7KzPZSfmMP5O9GD9W3Xs6375s=;
        b=X/qCZE6PLwC4rAhsdz/EMMAYKYfoRGtd7iXBDnbEJ69n0s3pkbCfZ5kFyEQkpJDWpm
         13b7p4egCG79WZ3ynbgyvTFfvnzKhPl70s09cNV/wydS1U461fQP/ULA736M3N5u0vyv
         bhCHQR1xuC/LEcROf0WHS1TMOz9RLI272FaSGExC/wXfSxyxFyFpizzEoDiTQGVxagLN
         wtR/OWiflneVm05KtdtofdWb5IdiOEfnSfVicH0UHEBsZOwYSJkQ1VBOhOLT5w99uz/A
         AbXdOcQ3xzmkrU+5YOLAAyoipQqKct170fS1YtI38JX4gydvnecEQDBSGYqB8OwVBblw
         AlaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769649382; x=1770254182;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EhyaETaO3z5ZObA+zH7KzPZSfmMP5O9GD9W3Xs6375s=;
        b=RFB9zwaN2nH6M1hR09P4mnM7VsnJglk6yb0vL0iRAMJydFxFvedEgWPCz5A1dvdY4W
         UtdD+FEhqMtp0hhj21pEr2OalxvTz0zi5iY5ZYZ+9Lef5/NZ+MSXU4kZsIFpBCXrD8rt
         1tAgEAdT3wdcI2kBwygcmH4On29ASc7kNwUurpJtIiFf6DO2q8n2nEwMiBvsjp3gvrRd
         jD1LNK9/gs+6/2XwuTWYZgJUQMerSArBBH13TQyiT7I5iGGNkAnLqsDWBlNii8Hiq79B
         R28gWWZSdh+tFLYiApByjYd8j4ZM/bC5ATOGWBONjrw6SQYTksCSSndciutASp/4n5HY
         W4Sg==
X-Forwarded-Encrypted: i=1; AJvYcCXm3DWd/yGAw3vXt8BnBfdk5kgmjcEew9UxyTK9ZmgPBaqy9jZAopwvrnjDvrRYT/T6x5gHA762OHC7@lists.linux.dev
X-Gm-Message-State: AOJu0YxvR4+ccHJz0DufZIY2yBYNd0yBB9Vab1a5S5nq3737HPHfttKu
	CvNjYqpjLywKPEKeVCeRI0Vr8SHissPKWbrkiiy9THczMui0V5kXZ5zRqvwuQGxOsgRYiw7erv7
	uK1kHPg==
X-Received: from pggk18.prod.google.com ([2002:a63:d112:0:b0:c5e:9fe:7560])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6300:2206:b0:350:b8e:f99b
 with SMTP id adf61e73a8af0-38ec64182ccmr7501037637.45.1769649382397; Wed, 28
 Jan 2026 17:16:22 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 28 Jan 2026 17:15:01 -0800
In-Reply-To: <20260129011517.3545883-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260129011517.3545883-1-seanjc@google.com>
X-Mailer: git-send-email 2.53.0.rc1.217.geba53bf80e-goog
Message-ID: <20260129011517.3545883-30-seanjc@google.com>
Subject: [RFC PATCH v5 29/45] x86/virt/tdx: Get/Put DPAMT page pair if and
 only if mapping size is 4KB
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

Elide the guts of getting/putting a Dynamic PAMT entry when the associated
mapping is greater than 4KiB, in which case static PAMT pages are used and
there's no need to (un)install extra PAMT pages.

Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
[Yan: Move level checking to callers of tdx_pamt_{get/put}()]
Signed-off-by: Yan Zhao <yan.y.zhao@intel.com>
[sean: move level checking back to tdx_pamt_{get/put}()]
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/include/asm/tdx.h  | 16 ++++++++++++++--
 arch/x86/kvm/vmx/tdx.c      |  6 +++---
 arch/x86/virt/vmx/tdx/tdx.c | 12 ++++++------
 3 files changed, 23 insertions(+), 11 deletions(-)

diff --git a/arch/x86/include/asm/tdx.h b/arch/x86/include/asm/tdx.h
index e61b0b3cc403..50feea01b066 100644
--- a/arch/x86/include/asm/tdx.h
+++ b/arch/x86/include/asm/tdx.h
@@ -154,8 +154,20 @@ static inline void tdx_init_pamt_cache(struct tdx_pamt_cache *cache)
 
 void tdx_free_pamt_cache(struct tdx_pamt_cache *cache);
 int tdx_topup_pamt_cache(struct tdx_pamt_cache *cache, unsigned long npages);
-int tdx_pamt_get(u64 pfn, struct tdx_pamt_cache *cache);
-void tdx_pamt_put(u64 pfn);
+int __tdx_pamt_get(u64 pfn, struct tdx_pamt_cache *cache);
+void __tdx_pamt_put(u64 pfn);
+
+static inline int tdx_pamt_get(u64 pfn, enum pg_level level,
+			       struct tdx_pamt_cache *cache)
+{
+	return level == PG_LEVEL_4K ? __tdx_pamt_get(pfn, cache) : 0;
+}
+
+static inline void tdx_pamt_put(u64 pfn, enum pg_level level)
+{
+	if (level == PG_LEVEL_4K)
+		__tdx_pamt_put(pfn);
+}
 
 void __tdx_quirk_reset_page(u64 pfn, enum pg_level level);
 
diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
index aca556923822..bd5d902da303 100644
--- a/arch/x86/kvm/vmx/tdx.c
+++ b/arch/x86/kvm/vmx/tdx.c
@@ -1729,7 +1729,7 @@ static int tdx_sept_set_private_spte(struct kvm *kvm, gfn_t gfn,
 
 	WARN_ON_ONCE((mirror_spte & VMX_EPT_RWX_MASK) != VMX_EPT_RWX_MASK);
 
-	ret = tdx_pamt_get(pfn, &tdx->pamt_cache);
+	ret = tdx_pamt_get(pfn, level, &tdx->pamt_cache);
 	if (ret)
 		return ret;
 
@@ -1751,7 +1751,7 @@ static int tdx_sept_set_private_spte(struct kvm *kvm, gfn_t gfn,
 		ret = tdx_mem_page_add(kvm, gfn, level, pfn);
 
 	if (ret)
-		tdx_pamt_put(pfn);
+		tdx_pamt_put(pfn, level);
 
 	return ret;
 }
@@ -1872,7 +1872,7 @@ static void tdx_sept_remove_private_spte(struct kvm *kvm, gfn_t gfn,
 		return;
 
 	__tdx_quirk_reset_page(pfn, level);
-	tdx_pamt_put(pfn);
+	tdx_pamt_put(pfn, level);
 }
 
 void tdx_deliver_interrupt(struct kvm_lapic *apic, int delivery_mode,
diff --git a/arch/x86/virt/vmx/tdx/tdx.c b/arch/x86/virt/vmx/tdx/tdx.c
index 411e5feef39f..cff325fdec79 100644
--- a/arch/x86/virt/vmx/tdx/tdx.c
+++ b/arch/x86/virt/vmx/tdx/tdx.c
@@ -2195,7 +2195,7 @@ static u64 tdh_phymem_pamt_remove(u64 pfn, u64 *pamt_pa_array)
 static DEFINE_SPINLOCK(pamt_lock);
 
 /* Bump PAMT refcount for the given page and allocate PAMT memory if needed */
-int tdx_pamt_get(u64 pfn, struct tdx_pamt_cache *cache)
+int __tdx_pamt_get(u64 pfn, struct tdx_pamt_cache *cache)
 {
 	u64 pamt_pa_array[MAX_NR_DPAMT_ARGS];
 	atomic_t *pamt_refcount;
@@ -2266,13 +2266,13 @@ int tdx_pamt_get(u64 pfn, struct tdx_pamt_cache *cache)
 	free_pamt_array(pamt_pa_array);
 	return ret;
 }
-EXPORT_SYMBOL_FOR_KVM(tdx_pamt_get);
+EXPORT_SYMBOL_FOR_KVM(__tdx_pamt_get);
 
 /*
  * Drop PAMT refcount for the given page and free PAMT memory if it is no
  * longer needed.
  */
-void tdx_pamt_put(u64 pfn)
+void __tdx_pamt_put(u64 pfn)
 {
 	u64 pamt_pa_array[MAX_NR_DPAMT_ARGS];
 	atomic_t *pamt_refcount;
@@ -2326,7 +2326,7 @@ void tdx_pamt_put(u64 pfn)
 	 */
 	free_pamt_array(pamt_pa_array);
 }
-EXPORT_SYMBOL_FOR_KVM(tdx_pamt_put);
+EXPORT_SYMBOL_FOR_KVM(__tdx_pamt_put);
 
 void tdx_free_pamt_cache(struct tdx_pamt_cache *cache)
 {
@@ -2372,7 +2372,7 @@ struct page *__tdx_alloc_control_page(gfp_t gfp)
 	if (!page)
 		return NULL;
 
-	if (tdx_pamt_get(page_to_pfn(page), NULL)) {
+	if (__tdx_pamt_get(page_to_pfn(page), NULL)) {
 		__free_page(page);
 		return NULL;
 	}
@@ -2390,7 +2390,7 @@ void __tdx_free_control_page(struct page *page)
 	if (!page)
 		return;
 
-	tdx_pamt_put(page_to_pfn(page));
+	__tdx_pamt_put(page_to_pfn(page));
 	__free_page(page);
 }
 EXPORT_SYMBOL_FOR_KVM(__tdx_free_control_page);
-- 
2.53.0.rc1.217.geba53bf80e-goog

