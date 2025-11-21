Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7E7929BDBD
	for <linux-coco@lists.linux.dev>; Fri, 21 Nov 2025 00:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763686311; cv=none; b=lJlQXWNhnbXuO458SVry8pliPbPM49vm1N/4NnodOwrfz1cDKd9+qPQvshAnazDQzab74AaTDZ9zLYzBnrtc9kkMm30aLZ+4m+bBlSiuwpIQs39NgTKY8cZICgBU4YZLmBky3JcHv4Q0kQEDE2dqZaY4iYiPiAdf/eVoyG/U+wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763686311; c=relaxed/simple;
	bh=kPB6qJw0RQ0uKhgIzE4Nb0jjFz7PQ7mO7NFAXf93bm8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bOW/tQHfHhYNDF2eE8PpTZlC3M/VsFJVu4y3x0MQDFYfbMjx/NKP4UPsHEfc3eog/n5Fuv8m/yvzRBreSui2GnRGRnGPIVYRoBCEMSUyKt0Z+WqJtWh60gnzFsrfHRWajfoVylZrj/JeBZXAVZSiUS3DXHtPOkKd1yUfnSVCJ2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AIslnFBS; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AIslnFBS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763686310; x=1795222310;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=kPB6qJw0RQ0uKhgIzE4Nb0jjFz7PQ7mO7NFAXf93bm8=;
  b=AIslnFBSnirbDbYsE1Bqk/x2ArxsmieeOYxvsYOnnaWTr8ZkpovarelT
   ns5TjW6fLneeSSu4N7Vh/12m9zoe9FZrq8+yyhL81Zw2qBtRTLw3aT7IN
   881uP+eujkwvpdcLPurpj3qassryb5oj4aiJUywQa0zYGZGJ947GQRpEe
   CDDnb2XPFKo67YFt20nd++DkiKafdqQZNVhC1YdlStbPmBs3Qswv507oz
   ihshfz7S69Nfi+6IHc7k8OH0F8TVoCiOT/WhP9atM9yM72DlRHz0xRpHB
   gXUXL7Jcr/8makGCR5vw0GPq5RU9Jz273S0toOW5ZsdoUNmfRm0KpM8I+
   Q==;
X-CSE-ConnectionGUID: Xz7PY39qR4+plVQFmx7bVA==
X-CSE-MsgGUID: IXuhqqh9TFu24gq5+q5AVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="64780790"
X-IronPort-AV: E=Sophos;i="6.20,214,1758610800"; 
   d="scan'208";a="64780790"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2025 16:51:45 -0800
X-CSE-ConnectionGUID: RBJ4stqKQIWQkphX5+tk/g==
X-CSE-MsgGUID: n2+ap+otReO526p+/ES6vQ==
X-ExtLoop1: 1
Received: from rpedgeco-desk.jf.intel.com ([10.88.27.139])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2025 16:51:45 -0800
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
Subject: [PATCH v4 10/16] KVM: TDX: Allocate PAMT memory for vCPU control structures
Date: Thu, 20 Nov 2025 16:51:19 -0800
Message-ID: <20251121005125.417831-11-rick.p.edgecombe@intel.com>
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

TDX vCPU control structures are provided to the TDX module at 4KB page
size and require PAMT backing. This means for Dynamic PAMT they need to
also have 4KB backings installed.

Previous changes introduced tdx_alloc_page()/tdx_free_page() that can
allocate a page and automatically handle the DPAMT maintenance. Use them
for vCPU control structures instead of alloc_page()/__free_page().

Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
[update log]
Signed-off-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
---
v3:
 - Write log. Reame from “Allocate PAMT memory for TDH.VP.CREATE and
   TDH.VP.ADDCX”.
 - Remove new line damage
---
 arch/x86/kvm/vmx/tdx.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
index 8c4c1221e311..b6d7f4b5f40f 100644
--- a/arch/x86/kvm/vmx/tdx.c
+++ b/arch/x86/kvm/vmx/tdx.c
@@ -2882,7 +2882,7 @@ static int tdx_td_vcpu_init(struct kvm_vcpu *vcpu, u64 vcpu_rcx)
 	int ret, i;
 	u64 err;
 
-	page = alloc_page(GFP_KERNEL);
+	page = tdx_alloc_page();
 	if (!page)
 		return -ENOMEM;
 	tdx->vp.tdvpr_page = page;
@@ -2902,7 +2902,7 @@ static int tdx_td_vcpu_init(struct kvm_vcpu *vcpu, u64 vcpu_rcx)
 	}
 
 	for (i = 0; i < kvm_tdx->td.tdcx_nr_pages; i++) {
-		page = alloc_page(GFP_KERNEL);
+		page = tdx_alloc_page();
 		if (!page) {
 			ret = -ENOMEM;
 			goto free_tdcx;
@@ -2924,7 +2924,7 @@ static int tdx_td_vcpu_init(struct kvm_vcpu *vcpu, u64 vcpu_rcx)
 			 * method, but the rest are freed here.
 			 */
 			for (; i < kvm_tdx->td.tdcx_nr_pages; i++) {
-				__free_page(tdx->vp.tdcx_pages[i]);
+				tdx_free_page(tdx->vp.tdcx_pages[i]);
 				tdx->vp.tdcx_pages[i] = NULL;
 			}
 			return -EIO;
@@ -2952,16 +2952,14 @@ static int tdx_td_vcpu_init(struct kvm_vcpu *vcpu, u64 vcpu_rcx)
 
 free_tdcx:
 	for (i = 0; i < kvm_tdx->td.tdcx_nr_pages; i++) {
-		if (tdx->vp.tdcx_pages[i])
-			__free_page(tdx->vp.tdcx_pages[i]);
+		tdx_free_page(tdx->vp.tdcx_pages[i]);
 		tdx->vp.tdcx_pages[i] = NULL;
 	}
 	kfree(tdx->vp.tdcx_pages);
 	tdx->vp.tdcx_pages = NULL;
 
 free_tdvpr:
-	if (tdx->vp.tdvpr_page)
-		__free_page(tdx->vp.tdvpr_page);
+	tdx_free_page(tdx->vp.tdvpr_page);
 	tdx->vp.tdvpr_page = NULL;
 	tdx->vp.tdvpr_pa = 0;
 
-- 
2.51.2

