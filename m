Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AAA573194
	for <linux-coco@lists.linux.dev>; Fri, 17 May 2024 14:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715955608; cv=none; b=NKC4u5NXn7XNP+3Gzr0JFOwM8I9dGdABtRvDr5UdE2k0FxeF/ZeU88CCxO8ko4lE1B04oY+6LUD6+7PSPjWJeuh7gUpin4dJMsPLJVujmtGamrBh+D9Vtz95rJDy3306txirPBtAsAknkFOEN2C7Qn9YDiTWAhw+Lih9OkYAnoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715955608; c=relaxed/simple;
	bh=+tEVi3m8qovNSY+AQYMMcgzTha+KB60hRspc+QX9Oac=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bTy9ptvYpta5nQaqPzyO3ipUTeEl+Iu0YuiupkG917VcYftOwcnqm0lCfOoKdSaT1KxSGkkmD6Q7y17GNwAQlNRapxXECRVPvcw4l/ZRZnQvdb/uruy12jupeZP6K/H+UOMCpzJzgNXpXe4G96zh0zn6u/m7enwf8et/N/AgUqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.helo=mgamail.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PAeHd9ub; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.helo=mgamail.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PAeHd9ub"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715955607; x=1747491607;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+tEVi3m8qovNSY+AQYMMcgzTha+KB60hRspc+QX9Oac=;
  b=PAeHd9ubG19WrRn2peTkq3/wUsvBltPEclWW829B3z+FgeF8zJv/WaQ5
   dilwMsWuPfe7WMHro4vJEQ4P42Z1ITv662Ol6TywEB0ZPRqPzvAgW266o
   P3I1qI+jGUqopK5bSSYjdkxw8qTHOFTE/jy3OV4IV8KnYEvAypQKdxVVp
   uee5XNl+BMw66PrV/AMZmdXWiFUfTcx4Mv7bLQ1tWijkJQjl76A2FdFFq
   RL6sGwmNRlGoZ8VUoec47k9+yObLS4XPwXnDaI73FFJ5od1jErbSoIHTS
   CW+hGgXTWc2Oj2/l42QU/3gYxAUl4rM/Oencq5bGXvHuMi/hP6pRn2R+7
   w==;
X-CSE-ConnectionGUID: 9kxdUASATe6d8NlDxj/z2Q==
X-CSE-MsgGUID: /mDLISWWSIqOi75i9AYL+A==
X-IronPort-AV: E=McAfee;i="6600,9927,11075"; a="22808759"
X-IronPort-AV: E=Sophos;i="6.08,167,1712646000"; 
   d="scan'208";a="22808759"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2024 07:20:05 -0700
X-CSE-ConnectionGUID: 0/qU8eDTSq6mSdb2tK0n+Q==
X-CSE-MsgGUID: C1NoCwySQLm2a2euxgmfAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,167,1712646000"; 
   d="scan'208";a="69253427"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa001.jf.intel.com with ESMTP; 17 May 2024 07:20:01 -0700
Received: by black.fi.intel.com (Postfix, from userid 1000)
	id 9AADB1146; Fri, 17 May 2024 17:19:50 +0300 (EEST)
From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
To: Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	"K. Y. Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>,
	Dexuan Cui <decui@microsoft.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>
Cc: linux-coco@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-hyperv@vger.kernel.org,
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Subject: [PATCH 19/20] x86/tdx: Convert MR_REPORT tdcall to use new TDCALL_0() macro
Date: Fri, 17 May 2024 17:19:37 +0300
Message-ID: <20240517141938.4177174-20-kirill.shutemov@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240517141938.4177174-1-kirill.shutemov@linux.intel.com>
References: <20240517141938.4177174-1-kirill.shutemov@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use newly introduced TDCALL_0() instead of tdcall() to issue
MR_REPORT tdcall.

It cuts code bloat substantially:

Function                                     old     new   delta
tdx_mcall_get_report0                        229     111    -118

Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
---
 arch/x86/coco/tdx/tdx.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/arch/x86/coco/tdx/tdx.c b/arch/x86/coco/tdx/tdx.c
index 42436a43bb49..45be53d5eeb4 100644
--- a/arch/x86/coco/tdx/tdx.c
+++ b/arch/x86/coco/tdx/tdx.c
@@ -101,19 +101,15 @@ static inline u64 tdg_vm_wr(u64 field, u64 value, u64 mask)
  */
 int tdx_mcall_get_report0(u8 *reportdata, u8 *tdreport)
 {
-	struct tdx_module_args args = {
-		.rcx = virt_to_phys(tdreport),
-		.rdx = virt_to_phys(reportdata),
-		.r8 = TDREPORT_SUBTYPE_0,
-	};
 	u64 ret;
 
-	ret = __tdcall(TDG_MR_REPORT, &args);
-	if (ret) {
-		if (TDCALL_RETURN_CODE(ret) == TDCALL_INVALID_OPERAND)
-			return -EINVAL;
+	ret = TDCALL_0(TDG_MR_REPORT, virt_to_phys(tdreport),
+		       virt_to_phys(reportdata), TDREPORT_SUBTYPE_0, 0);
+
+	if (TDCALL_RETURN_CODE(ret) == TDCALL_INVALID_OPERAND)
+		return -EINVAL;
+	else if (ret)
 		return -EIO;
-	}
 
 	return 0;
 }
-- 
2.43.0

