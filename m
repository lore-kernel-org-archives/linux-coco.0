Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B0716F065
	for <linux-coco@lists.linux.dev>; Fri, 17 May 2024 14:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715955606; cv=none; b=ByXaEfntfD6vCg2RkdiVTe8nScRcWl48xRo3ZgMNZkjq3WwDCJqLyCgBO3bLsBhb8Q4o2HV7Zuf/so2xJUzRtCl/dUDRCGJE5mzANa9obaZlV+1B86sTzGjVk/tm+NN3CUW70ENcHSgj2t/wH0IUtXdHoZ+oD5RAZ5sd8UZbVtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715955606; c=relaxed/simple;
	bh=/CzwNXVaKGEQ3E9bwjs3O7QSiO6r7/AsWG/VCkB8/H8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EujuvrHgWbEjO05gbWJKqUvB7MVi2/bWt3L8lJzGqUtkd619OjLSn9NfwLt6i4LjohkNDyrVMjmVJ4x93BGbOug7G0ZnRy60KjAXRlWjNIoA9pkhr+I1GGCg0exC/u4BLoovn1nViKz1aedxtQX4CwEq8qVJ6pX9J8IHGvRoRr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.helo=mgamail.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AHPBSFqn; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.helo=mgamail.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AHPBSFqn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715955605; x=1747491605;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/CzwNXVaKGEQ3E9bwjs3O7QSiO6r7/AsWG/VCkB8/H8=;
  b=AHPBSFqngzFVIimkOaZOGLmpRjNEqKr3b9fc5xv3ut9wLTb5j4909y8j
   /5wI42BJj1E9pgutrwVKgyupBCcwgLvasKdDCjE02keHKU8y+7DHCexqc
   0cMbnnsZQ/rYBuc76v/rq4lcwfCfHrmIZu52rdfn+UBMuRgPP8otR9Et6
   z9ktr+0wKnER235OXIJgTsVc/mn0ptI7Oziqe4ZpmySomEkqiumnJgceL
   GELiOQPdwiiefqAeY7i3XrctL3E/C3MSouWyHhMLwL4KlTqLY+yENDUQW
   4rn8THx4kwsEB5yqIGqOIZmGQ398NEDRb+7a36OlquLOkVNYPNKIMmWsJ
   A==;
X-CSE-ConnectionGUID: w5Z+scynSoyfi8+fV/EfQQ==
X-CSE-MsgGUID: OiaOs5v3STGXLoBMm90ZDA==
X-IronPort-AV: E=McAfee;i="6600,9927,11075"; a="22808693"
X-IronPort-AV: E=Sophos;i="6.08,167,1712646000"; 
   d="scan'208";a="22808693"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2024 07:20:01 -0700
X-CSE-ConnectionGUID: O4NnF3dCRe+gATw4xDL+bg==
X-CSE-MsgGUID: Ps04XFBGQCydR14R0EDIpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,167,1712646000"; 
   d="scan'208";a="69253384"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa001.jf.intel.com with ESMTP; 17 May 2024 07:19:56 -0700
Received: by black.fi.intel.com (Postfix, from userid 1000)
	id 1B2CED7B; Fri, 17 May 2024 17:19:50 +0300 (EEST)
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
Subject: [PATCH 09/20] x86/tdx: Convert MAP_GPA hypercall to use new TDVMCALL macros
Date: Fri, 17 May 2024 17:19:27 +0300
Message-ID: <20240517141938.4177174-10-kirill.shutemov@linux.intel.com>
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

Use newly introduced TDVMCALL_1() instead of __tdx_hypercall() to issue
MAP_GPA hypercall.

It cuts code bloat substantially:

Function                                     old     new   delta
tdx_enc_status_changed                       352     242    -110
tdx_kexec_finish                             645     530    -115
tdx_enc_status_change_prepare                326     181    -145
Total: Before=5553, After=5183, chg -6.66%

Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
---
 arch/x86/coco/tdx/tdx.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/arch/x86/coco/tdx/tdx.c b/arch/x86/coco/tdx/tdx.c
index df3e10d899b3..7c874a50a319 100644
--- a/arch/x86/coco/tdx/tdx.c
+++ b/arch/x86/coco/tdx/tdx.c
@@ -797,15 +797,10 @@ static bool tdx_map_gpa(phys_addr_t start, phys_addr_t end, bool enc)
 	}
 
 	while (retry_count < max_retries_per_page) {
-		struct tdx_module_args args = {
-			.r10 = TDX_HYPERCALL_STANDARD,
-			.r11 = TDVMCALL_MAP_GPA,
-			.r12 = start,
-			.r13 = end - start };
-
-		u64 map_fail_paddr;
-		u64 ret = __tdx_hypercall(&args);
+		u64 map_fail_paddr, ret;
 
+		ret = TDVMCALL_1(TDVMCALL_MAP_GPA,
+				 start, end - start, 0, 0, map_fail_paddr);
 		if (ret != TDVMCALL_STATUS_RETRY)
 			return !ret;
 		/*
@@ -813,7 +808,6 @@ static bool tdx_map_gpa(phys_addr_t start, phys_addr_t end, bool enc)
 		 * region starting at the GPA specified in R11. R11 comes
 		 * from the untrusted VMM. Sanity check it.
 		 */
-		map_fail_paddr = args.r11;
 		if (map_fail_paddr < start || map_fail_paddr >= end)
 			return false;
 
-- 
2.43.0

