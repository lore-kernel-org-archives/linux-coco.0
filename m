Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBFDE36683F
	for <linux-coco@lists.linux.dev>; Sun, 15 Mar 2026 13:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773583188; cv=none; b=YaUFiE1QyHrkA3RVOJPL0Orqde7+AaaVRbAr9h1dSYV9OkSPLCCSUlQraNnHgWY/kflv6akYUL/mgJX22gFh924QZ5JK6t2qrZCgb+ewSxi8lIb3odiVv9yz/0OsWdUkr4lYoZAYHhhRqt0J2txZ06cCVHsSuLGXgVtrSScXLUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773583188; c=relaxed/simple;
	bh=9od5RH+Szc/uLU/7F3TctiEqLtF23AMVNZFRQyMwpxc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZuGylmWF6/hfRF78pwV28dSw+aoc6+NpiFF6XJOT5gffEBeNasQhjTlqyeiWu1nSGutOEqMpsvLNuvIaaX8xqPbeHDLkzYB9UtD3imgjwA0jQVVeCFFdoZhEEXrP1azE7M5cEO3lzm2s3lOsUZNL1DfeOn5+7FzBzZqwomcCSug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XYKRs1XK; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XYKRs1XK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773583186; x=1805119186;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9od5RH+Szc/uLU/7F3TctiEqLtF23AMVNZFRQyMwpxc=;
  b=XYKRs1XKuuKrfEEKYKjQd7EGESd/R4lrEqhZKUwkVTe1kj2COKDpj9FH
   4H8sO3dEGGu2fXzELh4L9oBitDtr9rPF+PdyDlFwl8okW58ond2IT73KJ
   e2ZNoD3CVXKwSMcedACGxiis0PVWnSeyRBn543UJmix7ZfUsJYfJ5O46+
   PDJkhq5gp/M6kQOpJHyRwra4eFZ2HewdvqM69jsI/0Pj6DN/7QUJEYeZQ
   /PrJTJCR+S5kZGzOIgN1ROvjz1UN4ZcM029wmaUyf6aoVto2IQV7a5oga
   wEek+k5vsmhQmjLR+YKwO8d60hD5CEwxzQCVSMxu2JqzrqSKoxPmfQX/W
   g==;
X-CSE-ConnectionGUID: cHB3SlfVQ0SS//B+TT/Kug==
X-CSE-MsgGUID: ATqH44q8Rf24aXl1rEh1Ag==
X-IronPort-AV: E=McAfee;i="6800,10657,11730"; a="74732503"
X-IronPort-AV: E=Sophos;i="6.23,122,1770624000"; 
   d="scan'208";a="74732503"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2026 06:59:41 -0700
X-CSE-ConnectionGUID: sqjdxlOYQ3aYkpi0zgU3QA==
X-CSE-MsgGUID: n1BjOrIsQR2uprUTnvDsPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,122,1770624000"; 
   d="scan'208";a="226123052"
Received: from 984fee019967.jf.intel.com ([10.23.153.244])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2026 06:59:41 -0700
From: Chao Gao <chao.gao@intel.com>
To: linux-kernel@vger.kernel.org,
	linux-coco@lists.linux.dev,
	kvm@vger.kernel.org
Cc: binbin.wu@linux.intel.com,
	dan.j.williams@intel.com,
	dave.hansen@linux.intel.com,
	ira.weiny@intel.com,
	kai.huang@intel.com,
	kas@kernel.org,
	nik.borisov@suse.com,
	paulmck@kernel.org,
	pbonzini@redhat.com,
	reinette.chatre@intel.com,
	rick.p.edgecombe@intel.com,
	sagis@google.com,
	seanjc@google.com,
	tony.lindgren@linux.intel.com,
	vannapurve@google.com,
	vishal.l.verma@intel.com,
	yilun.xu@linux.intel.com,
	Chao Gao <chao.gao@intel.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH v5 12/22] x86/virt/tdx: Reset software states during TDX module shutdown
Date: Sun, 15 Mar 2026 06:58:32 -0700
Message-ID: <20260315135920.354657-13-chao.gao@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260315135920.354657-1-chao.gao@intel.com>
References: <20260315135920.354657-1-chao.gao@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The TDX module requires a one-time global initialization (TDH.SYS.INIT) and
per-CPU initialization (TDH.SYS.LP.INIT) before use. These initializations
are guarded by software flags to prevent repetition.

After TDX module updates, the new TDX module requires the same global and
per-CPU initializations, but the existing software flags prevent
re-initialization.

Reset all software flags guarding the initialization flows to allow the
global and per-CPU initializations to be triggered again after updates.

Signed-off-by: Chao Gao <chao.gao@intel.com>
Reviewed-by: Tony Lindgren <tony.lindgren@linux.intel.com>
Reviewed-by: Kai Huang <kai.huang@intel.com>
---
v5:
 - add a comment to clarify why state access doesn't require holding a
   lock. [Kai]
---
 arch/x86/virt/vmx/tdx/tdx.c | 22 +++++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)

diff --git a/arch/x86/virt/vmx/tdx/tdx.c b/arch/x86/virt/vmx/tdx/tdx.c
index f87fad429f4e..cfe76d4ca570 100644
--- a/arch/x86/virt/vmx/tdx/tdx.c
+++ b/arch/x86/virt/vmx/tdx/tdx.c
@@ -55,6 +55,8 @@ static struct tdmr_info_list tdx_tdmr_list;
 
 static enum tdx_module_status_t tdx_module_status;
 static DEFINE_MUTEX(tdx_module_lock);
+static bool sysinit_done;
+static int sysinit_ret;
 
 /* All TDX-usable memory regions.  Protected by mem_hotplug_lock. */
 static LIST_HEAD(tdx_memlist);
@@ -70,8 +72,6 @@ static int try_init_module_global(void)
 {
 	struct tdx_module_args args = {};
 	static DEFINE_RAW_SPINLOCK(sysinit_lock);
-	static bool sysinit_done;
-	static int sysinit_ret;
 
 	lockdep_assert_irqs_disabled();
 
@@ -1179,6 +1179,7 @@ EXPORT_SYMBOL_FOR_KVM(tdx_enable);
 int tdx_module_shutdown(void)
 {
 	struct tdx_module_args args = {};
+	int ret, cpu;
 
 	/*
 	 * Shut down the TDX module and prepare handoff data for the next
@@ -1188,7 +1189,22 @@ int tdx_module_shutdown(void)
 	 * modules as new modules likely have higher handoff version.
 	 */
 	args.rcx = tdx_sysinfo.handoff.module_hv;
-	return seamcall_prerr(TDH_SYS_SHUTDOWN, &args);
+	ret = seamcall_prerr(TDH_SYS_SHUTDOWN, &args);
+	if (ret)
+		return ret;
+
+	tdx_module_status = TDX_MODULE_UNINITIALIZED;
+	sysinit_done = false;
+	sysinit_ret = 0;
+
+	/*
+	 * By reaching here CPUHP is disabled and all present CPUs
+	 * are online. It's safe to just loop all online CPUs and
+	 * reset the per-cpu flag.
+	 */
+	for_each_online_cpu(cpu)
+		per_cpu(tdx_lp_initialized, cpu) = false;
+	return 0;
 }
 
 static bool is_pamt_page(unsigned long phys)
-- 
2.47.3

