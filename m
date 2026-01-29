Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DE6A32548C
	for <linux-coco@lists.linux.dev>; Thu, 29 Jan 2026 01:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769649355; cv=none; b=vFxX1Shco1EyH+Cmazsd1IvZU/iJVt4BZeRkPyA9QSxl94+RoKBCJRCC67/70JFLmhucO65a6DSIeUkyDrAPgYSFdJPEl839m381uWCcJjhN8lK1+03xG4QLv3dESP22szGpz5Nd9ZRusxc3hrjmJ91ludJhiXv2USWBz7hCgAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769649355; c=relaxed/simple;
	bh=oX2MlvAYx4zmch8f356wAzFlhGp0Ab7gNL2eHuy2Vxo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=TJaSBwoAw/esubyM6fC5Fx9NwM2QTwah7Y/KucS8TGL86mWFcRz+XM1639TU23nreTlvlBCnl57nxx9OPOfaMi80ob4Z5fXSrw6LaODjePIZKvI+SncdCuw/BIfIhVqcG0wHIyrnwkYdNVSFw9Jpik9nxWle0Y/lJWanTcWTc+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hpLijB7i; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hpLijB7i"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-352e6fcd72dso722139a91.3
        for <linux-coco@lists.linux.dev>; Wed, 28 Jan 2026 17:15:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769649353; x=1770254153; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=oWQPx27FCugyzao24/tqQ+m62u9m5MfQopgQbQNuj2c=;
        b=hpLijB7ixVMmIZu0cbleuQYJrfPM22AQ3HL8+8iu8PksLLXPfdBkVwNs8qHKm1ZD5G
         70jNaGzCbva5KqdkUUtYzaFPj1GLV4wmEfdc+sqqK9ix8GJutvI9yZ/RF7F0/0lTMbOC
         mMSaHFGlJtFS06oNUki3XyX3ww4f/h/gzLJYq0SV/Tigm3KQRfVYg4DhCLRrZqm4oZjs
         bpPyuEvtnKJEL7krfH3aMhW2GVqNJVbk+ErhCfFebMc/GfhGmyWZtbj2yyLDaV584NKp
         hzSCSwwSrAfsurop35z4GdgM3eFOgcGlf3voRhPQ+B5J1VvO1v0DOLE4CClKDrgWNVPv
         nYWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769649353; x=1770254153;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oWQPx27FCugyzao24/tqQ+m62u9m5MfQopgQbQNuj2c=;
        b=RgVLid1oRsACTuOOhON/iKQ8d1Cr7fp+N4+MFNy7uMkX4Lp3eNxgGWfWHHI6Q7Hz28
         9sIdqnDtTebph8qWmod1vPSllZOCYWfBtOIp1VymtHcUgyRO0aiMgZF6KWHFFHeb3xnN
         RSLpVcNzwQG0fesQQYU5qfoAovWSKOwa/z8zlyb/2qgJ377V2HPBT1OyA2gElxubfaYR
         SLwMBhElIzlFYj68QySQBsYqhn/e/Ol3K87YiPDTVqWpMAiUjBHto4FoeznliXPxJ/kv
         Njtaf1jHpl0p5WhviklHgyvlU0SXbBFAWxNQeIwaSm2AIKU5IqG9HWTqk5BHyaUDYW/L
         aasw==
X-Forwarded-Encrypted: i=1; AJvYcCUsp58bZwyVzjbNAwLkqfS4pORVFQ2L+HqLMEyuOez1sXsfcdJSd8/YgFpgJpKMlWo683ACzd4WmvKw@lists.linux.dev
X-Gm-Message-State: AOJu0Yy1lQqkWjRC6QXPrnFazMRMup22G4q+HwdITHXia0pB4xXGY5GT
	LgaizB8WsTYZcCfWyUgXJQKfXPbBPrqt/cPp8IZRwNBUGg73WicrLbHMTNmO88Zde/MyM5/485A
	AZhnG+g==
X-Received: from pjyd6.prod.google.com ([2002:a17:90a:dfc6:b0:353:8d2b:682])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:5183:b0:352:ccae:fe65
 with SMTP id 98e67ed59e1d1-353fecba611mr6392881a91.4.1769649352912; Wed, 28
 Jan 2026 17:15:52 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 28 Jan 2026 17:14:45 -0800
In-Reply-To: <20260129011517.3545883-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260129011517.3545883-1-seanjc@google.com>
X-Mailer: git-send-email 2.53.0.rc1.217.geba53bf80e-goog
Message-ID: <20260129011517.3545883-14-seanjc@google.com>
Subject: [RFC PATCH v5 13/45] x86/virt/tdx: Allocate page bitmap for Dynamic PAMT
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

The Physical Address Metadata Table (PAMT) holds TDX metadata for physical
memory and must be allocated by the kernel during TDX module
initialization.

The exact size of the required PAMT memory is determined by the TDX module
and may vary between TDX module versions. Currently it is approximately
0.4% of the system memory. This is a significant commitment, especially if
it is not known upfront whether the machine will run any TDX guests.

For normal PAMT, each memory region that the TDX module might use (TDMR)
needs three separate PAMT allocations. One for each supported page size
(1GB, 2MB, 4KB).

At a high level, Dynamic PAMT still has the 1GB and 2MB levels allocated
on TDX module initialization, but the 4KB level allocated dynamically at
TD runtime. However, in the details, the TDX module still needs some per
4KB page data. The TDX module exposed how many bits per page need to be
allocated (currently it is 1). The bits-per-page value can then be used to
calculate the size to pass in place of the 4KB allocations in the TDMR,
which TDX specs call "PAMT_PAGE_BITMAP".

So in effect, Dynamic PAMT just needs a different (smaller) size
allocation for the 4KB level part of the allocation. Although it is
functionally something different, it is passed in the same way the 4KB page
size PAMT allocation is.

Begin to implement Dynamic PAMT in the kernel by reading the bits-per-page
needed for Dynamic PAMT. Calculate the size needed for the bitmap,
and use it instead of the 4KB size determined for normal PAMT, in the case
of Dynamic PAMT. In doing so, reduce the static allocations to
approximately 0.004%, a 100x improvement.

Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
[Enhanced log]
Signed-off-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
Tested-by: Sagi Shahar <sagis@google.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/include/asm/tdx.h                  |  5 +++++
 arch/x86/include/asm/tdx_global_metadata.h  |  1 +
 arch/x86/virt/vmx/tdx/tdx.c                 | 19 ++++++++++++++++++-
 arch/x86/virt/vmx/tdx/tdx_global_metadata.c |  7 +++++++
 4 files changed, 31 insertions(+), 1 deletion(-)

diff --git a/arch/x86/include/asm/tdx.h b/arch/x86/include/asm/tdx.h
index 441a26988d3b..57d5f07e3735 100644
--- a/arch/x86/include/asm/tdx.h
+++ b/arch/x86/include/asm/tdx.h
@@ -130,6 +130,11 @@ int tdx_enable(void);
 const char *tdx_dump_mce_info(struct mce *m);
 const struct tdx_sys_info *tdx_get_sysinfo(void);
 
+static inline bool tdx_supports_dynamic_pamt(const struct tdx_sys_info *sysinfo)
+{
+	return false; /* To be enabled when kernel is ready */
+}
+
 int tdx_guest_keyid_alloc(void);
 u32 tdx_get_nr_guest_keyids(void);
 void tdx_guest_keyid_free(unsigned int keyid);
diff --git a/arch/x86/include/asm/tdx_global_metadata.h b/arch/x86/include/asm/tdx_global_metadata.h
index 060a2ad744bf..5eb808b23997 100644
--- a/arch/x86/include/asm/tdx_global_metadata.h
+++ b/arch/x86/include/asm/tdx_global_metadata.h
@@ -15,6 +15,7 @@ struct tdx_sys_info_tdmr {
 	u16 pamt_4k_entry_size;
 	u16 pamt_2m_entry_size;
 	u16 pamt_1g_entry_size;
+	u8  pamt_page_bitmap_entry_bits;
 };
 
 struct tdx_sys_info_td_ctrl {
diff --git a/arch/x86/virt/vmx/tdx/tdx.c b/arch/x86/virt/vmx/tdx/tdx.c
index 0c4c873bff80..517c6759c3ca 100644
--- a/arch/x86/virt/vmx/tdx/tdx.c
+++ b/arch/x86/virt/vmx/tdx/tdx.c
@@ -441,6 +441,18 @@ static int fill_out_tdmrs(struct list_head *tmb_list,
 	return 0;
 }
 
+static unsigned long tdmr_get_pamt_bitmap_sz(struct tdmr_info *tdmr)
+{
+	unsigned long pamt_sz, nr_pamt_entries;
+	int bits_per_entry;
+
+	bits_per_entry = tdx_sysinfo.tdmr.pamt_page_bitmap_entry_bits;
+	nr_pamt_entries = tdmr->size >> PAGE_SHIFT;
+	pamt_sz = DIV_ROUND_UP(nr_pamt_entries * bits_per_entry, BITS_PER_BYTE);
+
+	return PAGE_ALIGN(pamt_sz);
+}
+
 /*
  * Calculate PAMT size given a TDMR and a page size.  The returned
  * PAMT size is always aligned up to 4K page boundary.
@@ -508,7 +520,12 @@ static int tdmr_set_up_pamt(struct tdmr_info *tdmr,
 	 * Calculate the PAMT size for each TDX supported page size
 	 * and the total PAMT size.
 	 */
-	tdmr->pamt_4k_size = tdmr_get_pamt_sz(tdmr, TDX_PS_4K);
+	if (tdx_supports_dynamic_pamt(&tdx_sysinfo)) {
+		/* With Dynamic PAMT, PAMT_4K is replaced with a bitmap */
+		tdmr->pamt_4k_size = tdmr_get_pamt_bitmap_sz(tdmr);
+	} else {
+		tdmr->pamt_4k_size = tdmr_get_pamt_sz(tdmr, TDX_PS_4K);
+	}
 	tdmr->pamt_2m_size = tdmr_get_pamt_sz(tdmr, TDX_PS_2M);
 	tdmr->pamt_1g_size = tdmr_get_pamt_sz(tdmr, TDX_PS_1G);
 	tdmr_pamt_size = tdmr->pamt_4k_size + tdmr->pamt_2m_size + tdmr->pamt_1g_size;
diff --git a/arch/x86/virt/vmx/tdx/tdx_global_metadata.c b/arch/x86/virt/vmx/tdx/tdx_global_metadata.c
index 13ad2663488b..00ab0e550636 100644
--- a/arch/x86/virt/vmx/tdx/tdx_global_metadata.c
+++ b/arch/x86/virt/vmx/tdx/tdx_global_metadata.c
@@ -33,6 +33,13 @@ static int get_tdx_sys_info_tdmr(struct tdx_sys_info_tdmr *sysinfo_tdmr)
 		sysinfo_tdmr->pamt_2m_entry_size = val;
 	if (!ret && !(ret = read_sys_metadata_field(0x9100000100000012, &val)))
 		sysinfo_tdmr->pamt_1g_entry_size = val;
+	/*
+	 * Don't fail here if tdx_supports_dynamic_pamt() isn't supported. The
+	 * TDX code can fallback to normal PAMT if it's not supported.
+	 */
+	if (!ret && tdx_supports_dynamic_pamt(&tdx_sysinfo) &&
+	    !(ret = read_sys_metadata_field(0x9100000100000013, &val)))
+		sysinfo_tdmr->pamt_page_bitmap_entry_bits = val;
 
 	return ret;
 }
-- 
2.53.0.rc1.217.geba53bf80e-goog

