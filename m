Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A1B6259CAB
	for <linux-coco@lists.linux.dev>; Fri,  2 May 2025 13:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746191333; cv=none; b=W5PpJA4Nvrh1qjv2hnERMJdN0QbWGgfTDjztoLPL679rDt3irQQfUfjtxxIIGC8l95DEqCgyh4yovYQpyJyTQjMhwkyUrsKOLr/BsSTC+NQ7elZWnmd0qAHPKJfzk5fEtfgIklsDUlowieweU/ahRbByg0U3FA8x1Y4uuxjQNUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746191333; c=relaxed/simple;
	bh=j5Y6GYyeSlhNDi2dLeXJ+8OeWOwUzdTAtd6KqruAJps=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Zlh89EZ0Y03cShev8aVoKVt6XFrC7YU3fE6NCkVb/lwm2F9rg5dY3EXcD/kL2hsK70mDIp9tatRO22TrRjk5Av4+EUzpkel3gWYyDtbyHX32Y/nhH6zLxz6ha5a6zTI5D25sYJ1OpCG2wSCFMNIDMMIYC7IwCF7rMympgbl4mxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.helo=mgamail.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=enzTLFcP; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.helo=mgamail.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="enzTLFcP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746191331; x=1777727331;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=j5Y6GYyeSlhNDi2dLeXJ+8OeWOwUzdTAtd6KqruAJps=;
  b=enzTLFcPERIWFwONInrkb0pSZQTRx5Fa2avgwwASpoPymjjWodRXb1dY
   MjrbDLfjtzGdS/Bbq6MXXNSk1nkJJ7oE8clBu7X14KmOXrLLOiWFPrM4j
   qOJY3OYWpzm0sgP6Crtb52ua4/LaLZvWr+HRbs0795geV+KkkY/wklLvR
   NGABXKGCC+fTnzx+lC5fBclt9LW0szZ+dqLuyLByXO3pDp66vhuxA/Tw3
   LszBKlm0rqnurzB0mJg6qG4PG4ZwSXXh5zZ3jDHxfuBJoLuF4lSjGruM+
   TghWxKwWnB8be9mNtWaKHR79/TlBqr4y25XeK9y92z0Oj4JplCg0XH3Mg
   A==;
X-CSE-ConnectionGUID: 7d273a7TT6ew916FMvqxsg==
X-CSE-MsgGUID: Pe0spMlaR/mFHZy8ImATbw==
X-IronPort-AV: E=McAfee;i="6700,10204,11421"; a="58495269"
X-IronPort-AV: E=Sophos;i="6.15,256,1739865600"; 
   d="scan'208";a="58495269"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2025 06:08:51 -0700
X-CSE-ConnectionGUID: 0Z/06JEGRTaayqBgyOFGwg==
X-CSE-MsgGUID: 695OBPPCQACgw1ezPztR6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,256,1739865600"; 
   d="scan'208";a="138657788"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa003.fm.intel.com with ESMTP; 02 May 2025 06:08:41 -0700
Received: by black.fi.intel.com (Postfix, from userid 1000)
	id 656B2325; Fri, 02 May 2025 16:08:36 +0300 (EEST)
From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
To: pbonzini@redhat.com,
	seanjc@google.com
Cc: rick.p.edgecombe@intel.com,
	isaku.yamahata@intel.com,
	kai.huang@intel.com,
	yan.y.zhao@intel.com,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	kvm@vger.kernel.org,
	x86@kernel.org,
	linux-coco@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Subject: [RFC, PATCH 07/12] KVM: TDX: Allocate PAMT memory in tdx_td_vcpu_init()
Date: Fri,  2 May 2025 16:08:23 +0300
Message-ID: <20250502130828.4071412-8-kirill.shutemov@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250502130828.4071412-1-kirill.shutemov@linux.intel.com>
References: <20250502130828.4071412-1-kirill.shutemov@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Allocate PAMT memory for TDH.VP.CREATE and TDH.VP.ADDCX.

PAMT memory that is associated with pages successfully added to the TD
with TDH.VP.ADDCX will be removed in tdx_reclaim_page() on
tdx_reclaim_control_page().

Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
---
 arch/x86/kvm/vmx/tdx.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
index 59bbae2df485..18c4ae00cd8d 100644
--- a/arch/x86/kvm/vmx/tdx.c
+++ b/arch/x86/kvm/vmx/tdx.c
@@ -2983,7 +2983,7 @@ static int tdx_td_vcpu_init(struct kvm_vcpu *vcpu, u64 vcpu_rcx)
 	int ret, i;
 	u64 err;
 
-	page = alloc_page(GFP_KERNEL);
+	page = tdx_alloc_page();
 	if (!page)
 		return -ENOMEM;
 	tdx->vp.tdvpr_page = page;
@@ -2996,7 +2996,7 @@ static int tdx_td_vcpu_init(struct kvm_vcpu *vcpu, u64 vcpu_rcx)
 	}
 
 	for (i = 0; i < kvm_tdx->td.tdcx_nr_pages; i++) {
-		page = alloc_page(GFP_KERNEL);
+		page = tdx_alloc_page();
 		if (!page) {
 			ret = -ENOMEM;
 			goto free_tdcx;
@@ -3020,7 +3020,7 @@ static int tdx_td_vcpu_init(struct kvm_vcpu *vcpu, u64 vcpu_rcx)
 			 * method, but the rest are freed here.
 			 */
 			for (; i < kvm_tdx->td.tdcx_nr_pages; i++) {
-				__free_page(tdx->vp.tdcx_pages[i]);
+				tdx_free_page(tdx->vp.tdcx_pages[i]);
 				tdx->vp.tdcx_pages[i] = NULL;
 			}
 			return -EIO;
@@ -3039,16 +3039,15 @@ static int tdx_td_vcpu_init(struct kvm_vcpu *vcpu, u64 vcpu_rcx)
 
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
+
 	tdx->vp.tdvpr_page = 0;
 
 	return ret;
-- 
2.47.2

