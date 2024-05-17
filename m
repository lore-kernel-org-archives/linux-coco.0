Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBDBB5C603
	for <linux-coco@lists.linux.dev>; Fri, 17 May 2024 14:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715955598; cv=none; b=DVTFQGpUc2vx3Z9Rbabg6qXqQiqrHvxjI7m/GNtYZtXvbvEYmM67QHBb/i7LIP0d+EN16H16J8hC+LFxrbeENj5yOs89QgSWQs83VWzkMhieuBESPZlA6mSyNDNeTvZFQshJ8VoST9P4qSDiZcwUgEzT0Kk37I1LkSjip6DDYsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715955598; c=relaxed/simple;
	bh=gUQwV2IPZDrjdWlz6cSzIXD3iiQavq2X5QqqGPE9TCs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rU44jJze6pbVQZavzyH7XOmwjyJiwC5CMY7OaJSNlIMpeKSaesYmq4SlpI6lj5IttHtBtgj+Ov1h4xFvPFRMxZWJbpJLLjp+WNSxEsJtpjOcjfHcXfEFHuf/+wzraxB1hZEYv8K8CNI8gqKvIx4xuWI2frabJ5gn9kcHLg9GIt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.helo=mgamail.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ur5exFrN; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.helo=mgamail.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ur5exFrN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715955597; x=1747491597;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=gUQwV2IPZDrjdWlz6cSzIXD3iiQavq2X5QqqGPE9TCs=;
  b=Ur5exFrNBid9XakU+PDSHA6MBtbM9HsVlRe7sWuYyftzZdIXvmPeXiD6
   CiExdonZOp8esSWeF9MJ+BkDUj0Q5YM/VbGq6b6aVSaBGe8K92ENfwhPH
   D9594x6J3BmhcorV281NuiqEM+10sHns+6xHmJkpAEGXseteiFW9H+PKV
   dyEbtR2rqOSEBmnhuwJUNPJMskB0Aw7a0cqAjp+HmIBajNrGpKOYSajmh
   NJthkow80846Ftoo08t7kzh3BnmWV1nfo/J5RfIKe7MeW8NJDWRG44eLr
   dXq/Jo7oZjjLih9jxtiOvqWHh4FNPrG3xA0fK0rNHVq0nJ2mcHx7y7l+M
   Q==;
X-CSE-ConnectionGUID: CDRFgLM7QbySbYeaD67vsw==
X-CSE-MsgGUID: iC23sUBgR7ScJRxeyn8zGw==
X-IronPort-AV: E=McAfee;i="6600,9927,11075"; a="22808562"
X-IronPort-AV: E=Sophos;i="6.08,167,1712646000"; 
   d="scan'208";a="22808562"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2024 07:19:55 -0700
X-CSE-ConnectionGUID: o5lTv1OzQjC7OWiR8ekdMA==
X-CSE-MsgGUID: fb+T84JAQ2+KBcIRl2f4eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,167,1712646000"; 
   d="scan'208";a="31944606"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa009.jf.intel.com with ESMTP; 17 May 2024 07:19:51 -0700
Received: by black.fi.intel.com (Postfix, from userid 1000)
	id C299BAFB; Fri, 17 May 2024 17:19:49 +0300 (EEST)
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
Subject: [PATCH 04/20] x86/tdx: Convert HLT handling to use new TDVMCALL_0()
Date: Fri, 17 May 2024 17:19:22 +0300
Message-ID: <20240517141938.4177174-5-kirill.shutemov@linux.intel.com>
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

Use newly introduced TDVMCALL_0() instead of __tdx_hypercall() to handle
HLT instruction emulation.

It cuts code bloat substantially:

Function                                     old     new   delta
tdx_safe_halt                                 58      88     +30
tdx_handle_virt_exception                   2023    2052     +29
__pfx___halt                                  16       -     -16
__halt                                       171       -    -171
Total: Before=6350, After=6222, chg -2.02%

Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
---
 arch/x86/coco/tdx/tdx.c | 29 ++++++-----------------------
 1 file changed, 6 insertions(+), 23 deletions(-)

diff --git a/arch/x86/coco/tdx/tdx.c b/arch/x86/coco/tdx/tdx.c
index 6e0e5648ebd1..dce7d6f9f895 100644
--- a/arch/x86/coco/tdx/tdx.c
+++ b/arch/x86/coco/tdx/tdx.c
@@ -350,18 +350,12 @@ static int ve_instr_len(struct ve_info *ve)
 	}
 }
 
-static u64 __cpuidle __halt(const bool irq_disabled)
+static int handle_halt(struct ve_info *ve)
 {
-	struct tdx_module_args args = {
-		.r10 = TDX_HYPERCALL_STANDARD,
-		.r11 = hcall_func(EXIT_REASON_HLT),
-		.r12 = irq_disabled,
-	};
-
 	/*
 	 * Emulate HLT operation via hypercall. More info about ABI
 	 * can be found in TDX Guest-Host-Communication Interface
-	 * (GHCI), section 3.8 TDG.VP.VMCALL<Instruction.HLT>.
+	 * (GHCI), section TDG.VP.VMCALL<Instruction.HLT>.
 	 *
 	 * The VMM uses the "IRQ disabled" param to understand IRQ
 	 * enabled status (RFLAGS.IF) of the TD guest and to determine
@@ -370,14 +364,7 @@ static u64 __cpuidle __halt(const bool irq_disabled)
 	 * can keep the vCPU in virtual HLT, even if an IRQ is
 	 * pending, without hanging/breaking the guest.
 	 */
-	return __tdx_hypercall(&args);
-}
-
-static int handle_halt(struct ve_info *ve)
-{
-	const bool irq_disabled = irqs_disabled();
-
-	if (__halt(irq_disabled))
+	if (TDVMCALL_0(hcall_func(EXIT_REASON_HLT), irqs_disabled(), 0, 0, 0))
 		return -EIO;
 
 	return ve_instr_len(ve);
@@ -385,13 +372,9 @@ static int handle_halt(struct ve_info *ve)
 
 void __cpuidle tdx_safe_halt(void)
 {
-	const bool irq_disabled = false;
-
-	/*
-	 * Use WARN_ONCE() to report the failure.
-	 */
-	if (__halt(irq_disabled))
-		WARN_ONCE(1, "HLT instruction emulation failed\n");
+	/* See comment in handle_halt() */
+	WARN_ONCE(TDVMCALL_0(hcall_func(EXIT_REASON_HLT), false, 0, 0, 0),
+		  "HLT instruction emulation failed");
 }
 
 static int read_msr(struct pt_regs *regs, struct ve_info *ve)
-- 
2.43.0

