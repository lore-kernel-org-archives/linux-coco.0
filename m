Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9176474C0D
	for <linux-coco@lists.linux.dev>; Fri, 17 May 2024 14:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715955610; cv=none; b=KQUC8bB+N2yptCIWtSq8TndZGvJjupWB/PQOpN2TizedETD6C+uVoBStwsQHQfokecMGMiDHtGWjDuFa+qTWfOKweWOeKsy3S3ZkFyk6LIfdYSoa1LUez6JRQIODQ7YZ2B7eIixHqKCBozkJkxzssUiIuiRohx18mCdUfagxduI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715955610; c=relaxed/simple;
	bh=WocfCtclpVmI7/9b65p2gbJIFvpIqrPqyDYD9iiubjI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mq/i8k63rVx6YUEC8KPjVdBonTItQOwdqfB48NG+59id3v4aF5v7JzSo710XZPwpfmKInh186iLI1ZyMlYSiUGcT2jbYxvyMNFz843BhlTCONIiVKOxQQtmpKaOkubADl7qIP9UaN5jnZHVBCKcf/L3wqDwlP1xbFFeZgraln8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.helo=mgamail.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UzXcxlAa; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.helo=mgamail.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UzXcxlAa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715955609; x=1747491609;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WocfCtclpVmI7/9b65p2gbJIFvpIqrPqyDYD9iiubjI=;
  b=UzXcxlAaSJDkX7r9val4RbAfu7o4A7oj/JN4zgIM/pGokodAHwBihj+d
   vuCQUELCDryUdQLmsP24NSRiMUWA4zG9SztNuWa5hgD2GMSKMfMrhltI7
   nKSlBz7M46mI9xEEkPNZTYKmJM4IgSqKO9Wm32Yg1C1E64uzfu3bcgBf5
   VrJ+iwu6vIUigr++awH4AwfOYFUEjWxVtrQVYVmrsT00TC5xnLesVWEwq
   tfhcf/l9I0iw7aJJ2IwBqj0FK/TrjowGK1BcaxFX2QpMXC4OqBIfRGQcG
   9dYkvjSv8HiTQey3EAGa2Q/Z/Oq7RGa5Jm6ccrXq7NeF9Fe3Z/AgtAOS/
   A==;
X-CSE-ConnectionGUID: +MT7YYDjQfCwJoKM3D69aA==
X-CSE-MsgGUID: ZroVQoJ2Q12/mzoDCdmDiA==
X-IronPort-AV: E=McAfee;i="6600,9927,11075"; a="22808769"
X-IronPort-AV: E=Sophos;i="6.08,167,1712646000"; 
   d="scan'208";a="22808769"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2024 07:20:05 -0700
X-CSE-ConnectionGUID: gYjuXclTQtSwzEcwcK8DUw==
X-CSE-MsgGUID: WJVtLYOmRje/oWByI/JzNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,167,1712646000"; 
   d="scan'208";a="31944632"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa009.jf.intel.com with ESMTP; 17 May 2024 07:20:01 -0700
Received: by black.fi.intel.com (Postfix, from userid 1000)
	id 8D7701140; Fri, 17 May 2024 17:19:50 +0300 (EEST)
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
Subject: [PATCH 18/20] x86/tdx: Convert VP_VEINFO_GET tdcall to use new TDCALL_5() macro
Date: Fri, 17 May 2024 17:19:36 +0300
Message-ID: <20240517141938.4177174-19-kirill.shutemov@linux.intel.com>
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

Use newly introduced TDCALL_5() instead of tdcall() to issue
VP_VEINFO_GET tdcall.

It cuts code bloat substantially:

Function                                     old     new   delta
tdx_get_ve_info                              253     116    -137

Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
---
 arch/x86/coco/tdx/tdx.c | 31 +++++++------------------------
 1 file changed, 7 insertions(+), 24 deletions(-)

diff --git a/arch/x86/coco/tdx/tdx.c b/arch/x86/coco/tdx/tdx.c
index 6559f3842f67..42436a43bb49 100644
--- a/arch/x86/coco/tdx/tdx.c
+++ b/arch/x86/coco/tdx/tdx.c
@@ -615,32 +615,15 @@ __init bool tdx_early_handle_ve(struct pt_regs *regs)
 
 void tdx_get_ve_info(struct ve_info *ve)
 {
-	struct tdx_module_args args = {};
+	u64 instr_info, ret;
 
-	/*
-	 * Called during #VE handling to retrieve the #VE info from the
-	 * TDX module.
-	 *
-	 * This has to be called early in #VE handling.  A "nested" #VE which
-	 * occurs before this will raise a #DF and is not recoverable.
-	 *
-	 * The call retrieves the #VE info from the TDX module, which also
-	 * clears the "#VE valid" flag. This must be done before anything else
-	 * because any #VE that occurs while the valid flag is set will lead to
-	 * #DF.
-	 *
-	 * Note, the TDX module treats virtual NMIs as inhibited if the #VE
-	 * valid flag is set. It means that NMI=>#VE will not result in a #DF.
-	 */
-	tdcall(TDG_VP_VEINFO_GET, &args);
+	ret = TDCALL_5(TDG_VP_VEINFO_GET, 0, 0, 0, 0,
+		 ve->exit_reason, ve->exit_qual, ve->gla, ve->gpa, instr_info);
 
-	/* Transfer the output parameters */
-	ve->exit_reason = args.rcx;
-	ve->exit_qual   = args.rdx;
-	ve->gla         = args.r8;
-	ve->gpa         = args.r9;
-	ve->instr_len   = lower_32_bits(args.r10);
-	ve->instr_info  = upper_32_bits(args.r10);
+	BUG_ON(ret);
+
+	ve->instr_len   = lower_32_bits(instr_info);
+	ve->instr_info  = upper_32_bits(instr_info);
 }
 
 /*
-- 
2.43.0

