Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8830929B228
	for <linux-coco@lists.linux.dev>; Fri, 21 Nov 2025 00:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763686311; cv=none; b=clJsOuf3V49DruzcsmiBCNeauYwGekDO35aDKTif/otk0a8vpGWKASZI1hbKaWog8s2Pz4ApaLvCj5X7gFa39ifjkN3AKldzzvznL+uvoUaiykU5jUG/tGvbJVcIIzVYim8DlwJmDeN+cgWuTbqYvN8ZQdM7jtOD3ncM5FZbE60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763686311; c=relaxed/simple;
	bh=79xQkIJuz06sItl6ATwysWTQBqW/BysewDEEWdMSceY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QdQoo7x00yU+KM3U2tFUEbUCMv4h7FECbtDz6+GhWI+7RUhP9g7qpLtzxa0Msq9wRiwiGWwYDqCO5Hc0xk5f2k3DmLTosFwoCOjG4e1VVy1V9ubrR0UXD5rmTzaarlY+dQ+c1Aba8dkCJfZWER+Kc7i7q2AKi8ZZuC2DYrFTFsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ODfp5wT6; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ODfp5wT6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763686310; x=1795222310;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=79xQkIJuz06sItl6ATwysWTQBqW/BysewDEEWdMSceY=;
  b=ODfp5wT6MWSiGJWTvZWxu6eyw0CAUMm5pdhwvXQZ+HaH4kYdzhlLGCAC
   vkh3iMTMw/6qhWWnsDGWf1mbakPalpFFbwEnvcoda3vcNeYgvXWo7MGt1
   EEbWHisl7kMSd4zpl2Reowrm+BkldfLUrk3eP29pcEydknpMA0g1JIOX1
   CocCCNic+T2nFxvSHLDCIu/lvLcPMyiBCaftXb/Z7K6G2+RDHuUXMLWvg
   yRi5KWRrO9Clgnm8NOp5qdBiXfKNV1IuwsT3ZWDye1zx5G044KKI7DCEG
   o5StBUuiaeSYp/Znfi9k+MbOk1N3bpZz+YV8FaiQV074A27Q3SXBl2aW7
   g==;
X-CSE-ConnectionGUID: sIOM/1g8Q9mFnlZLzRBmwQ==
X-CSE-MsgGUID: qiVrqWb2RPGKXm9cl9a+iQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="64780782"
X-IronPort-AV: E=Sophos;i="6.20,214,1758610800"; 
   d="scan'208";a="64780782"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2025 16:51:45 -0800
X-CSE-ConnectionGUID: txT64Tm1RaeYpmlW8nPJVw==
X-CSE-MsgGUID: qowO2VGTSFOMloQ1+2t+QA==
X-ExtLoop1: 1
Received: from rpedgeco-desk.jf.intel.com ([10.88.27.139])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2025 16:51:44 -0800
From: Rick Edgecombe <rick.p.edgecombe@intel.com>
To: bp@alien8.de,
	chao.gao@intel.com,
	dave.hansen@intel.com,
	isaku.yamahata@intel.com,
	kai.huang@intel.com,
	kas@kernel.org,
	kvm@vger.kernel.org,
	linux-coco@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	mingo@redhat.com,
	pbonzini@redhat.com,
	seanjc@google.com,
	tglx@linutronix.de,
	vannapurve@google.com,
	x86@kernel.org,
	yan.y.zhao@intel.com,
	xiaoyao.li@intel.com,
	binbin.wu@intel.com
Cc: rick.p.edgecombe@intel.com,
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Subject: [PATCH v4 09/16] KVM: TDX: Allocate PAMT memory for TD control structures
Date: Thu, 20 Nov 2025 16:51:18 -0800
Message-ID: <20251121005125.417831-10-rick.p.edgecombe@intel.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251121005125.417831-1-rick.p.edgecombe@intel.com>
References: <20251121005125.417831-1-rick.p.edgecombe@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>

TDX TD control structures are provided to the TDX module at 4KB page size
and require PAMT backing. This means for Dynamic PAMT they need to also
have 4KB backings installed.

Previous changes introduced tdx_alloc_page()/tdx_free_page() that can
allocate a page and automatically handle the DPAMT maintenance. Use them
for vCPU control structures instead of alloc_page()/__free_page().

Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
[update log]
Signed-off-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
---
v3:
 - Write log. Rename from “KVM: TDX: Allocate PAMT memory in __tdx_td_init()”
---
 arch/x86/kvm/vmx/tdx.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
index 0eed334176b3..8c4c1221e311 100644
--- a/arch/x86/kvm/vmx/tdx.c
+++ b/arch/x86/kvm/vmx/tdx.c
@@ -2398,7 +2398,7 @@ static int __tdx_td_init(struct kvm *kvm, struct td_params *td_params,
 
 	atomic_inc(&nr_configured_hkid);
 
-	tdr_page = alloc_page(GFP_KERNEL);
+	tdr_page = tdx_alloc_page();
 	if (!tdr_page)
 		goto free_hkid;
 
@@ -2411,7 +2411,7 @@ static int __tdx_td_init(struct kvm *kvm, struct td_params *td_params,
 		goto free_tdr;
 
 	for (i = 0; i < kvm_tdx->td.tdcs_nr_pages; i++) {
-		tdcs_pages[i] = alloc_page(GFP_KERNEL);
+		tdcs_pages[i] = tdx_alloc_page();
 		if (!tdcs_pages[i])
 			goto free_tdcs;
 	}
@@ -2529,10 +2529,8 @@ static int __tdx_td_init(struct kvm *kvm, struct td_params *td_params,
 teardown:
 	/* Only free pages not yet added, so start at 'i' */
 	for (; i < kvm_tdx->td.tdcs_nr_pages; i++) {
-		if (tdcs_pages[i]) {
-			__free_page(tdcs_pages[i]);
-			tdcs_pages[i] = NULL;
-		}
+		tdx_free_page(tdcs_pages[i]);
+		tdcs_pages[i] = NULL;
 	}
 	if (!kvm_tdx->td.tdcs_pages)
 		kfree(tdcs_pages);
@@ -2548,15 +2546,13 @@ static int __tdx_td_init(struct kvm *kvm, struct td_params *td_params,
 
 free_tdcs:
 	for (i = 0; i < kvm_tdx->td.tdcs_nr_pages; i++) {
-		if (tdcs_pages[i])
-			__free_page(tdcs_pages[i]);
+		tdx_free_page(tdcs_pages[i]);
 	}
 	kfree(tdcs_pages);
 	kvm_tdx->td.tdcs_pages = NULL;
 
 free_tdr:
-	if (tdr_page)
-		__free_page(tdr_page);
+	tdx_free_page(tdr_page);
 	kvm_tdx->td.tdr_page = NULL;
 
 free_hkid:
-- 
2.51.2

