Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 628ED33859A
	for <linux-coco@lists.linux.dev>; Mon, 27 Apr 2026 15:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777303806; cv=none; b=r5QQ04VM7iTYbLu0XZjS4VgRWNgZ7RTH9aLaA3/sRFzoy8RhJV+1izxabOHN0dAuCalFPcTHw75GNOyGlO7qQ4l5btQ4mrs+E+jIsK56EkG5fh5YNVcwT4/QXyrCiw16zUGRc2jYtOOn7altR/8N01hosMW6rDBBSw8BtQfNS0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777303806; c=relaxed/simple;
	bh=m7AVvJRaxqKCLBJJMlHcgctO9YivIqh3maXP2UqICDE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aKe6MSw6RTQmU4Yy9I0AJZdKG4/cE5vdHfZyrNJwp4l3Vsw9julxeW9uy/aV57rPaYC1SCIFlO/CaeONpGA3xCpRv931GdeRlZytUxGbsVbUpyJyI6yagmMlV1l56BHk89m6wAQ58h6HSQ0fjGU0wLP1mtmXbp8hxuuUhpmK9A4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e1vORoOL; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e1vORoOL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777303804; x=1808839804;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=m7AVvJRaxqKCLBJJMlHcgctO9YivIqh3maXP2UqICDE=;
  b=e1vORoOLTgx6xDP5ldqFQowz15olW31SQcVDomPmRXrNYx58sC2GknXL
   LLZnuscm/LeDaaGfKlKkYMBRBz5z8lq6d9xaX/5wlXJq0ZNcRvV4SfsSC
   e1YjSW7zU4LHMW4JPNZ74C1aKaLwl2O3K1iTlYh654qtutMeB6Y8LbfYL
   xwZmdG7AHo6y1zkTQ7rpXWxz1OLLcVRIfxgF5qIL3fU/nr7N12DXvcDfu
   UcGh/hHoEQ4g9oGvoQpEiMUidnbI5MqQk4vPiYGmH4hXtMvZlRczbIZIo
   MvSfcMpUbb1AUtuNRq/uYtO25cKt3BGOGV1l28nhsDpI0Y0zPRCTY/xPw
   A==;
X-CSE-ConnectionGUID: JE0uHp2nTsuXh+muMqPFHA==
X-CSE-MsgGUID: rwhABrV5T8Gk2sJxvulYvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11769"; a="77900735"
X-IronPort-AV: E=Sophos;i="6.23,202,1770624000"; 
   d="scan'208";a="77900735"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2026 08:30:01 -0700
X-CSE-ConnectionGUID: XKB/eandQ+SnX38venfP5g==
X-CSE-MsgGUID: eEpcX28PTiaz9HacQj9DPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,202,1770624000"; 
   d="scan'208";a="232673272"
Received: from 984fee019967.jf.intel.com ([10.23.153.244])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2026 08:30:01 -0700
From: Chao Gao <chao.gao@intel.com>
To: kvm@vger.kernel.org,
	linux-coco@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	x86@kernel.org
Cc: binbin.wu@linux.intel.com,
	dave.hansen@linux.intel.com,
	djbw@kernel.org,
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
	xiaoyao.li@intel.com,
	yan.y.zhao@intel.com,
	Chao Gao <chao.gao@intel.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH v8 11/21] x86/virt/tdx: Reset software states during TDX module shutdown
Date: Mon, 27 Apr 2026 08:28:05 -0700
Message-ID: <20260427152854.101171-12-chao.gao@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260427152854.101171-1-chao.gao@intel.com>
References: <20260427152854.101171-1-chao.gao@intel.com>
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

As tdx_module_initialized is changed at runtime, drop its "__ro_after_init"
tag.

Signed-off-by: Chao Gao <chao.gao@intel.com>
Reviewed-by: Tony Lindgren <tony.lindgren@linux.intel.com>
Reviewed-by: Kai Huang <kai.huang@intel.com>
Reviewed-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
---
v8:
 - drop "__ro_after_init" from tdx_module_initialized.
---
 arch/x86/virt/vmx/tdx/tdx.c | 26 +++++++++++++++++++++-----
 1 file changed, 21 insertions(+), 5 deletions(-)

diff --git a/arch/x86/virt/vmx/tdx/tdx.c b/arch/x86/virt/vmx/tdx/tdx.c
index d28421ac4180..ff5644f5daa4 100644
--- a/arch/x86/virt/vmx/tdx/tdx.c
+++ b/arch/x86/virt/vmx/tdx/tdx.c
@@ -55,11 +55,14 @@ static DEFINE_PER_CPU(bool, tdx_lp_initialized);
 
 static struct tdmr_info_list tdx_tdmr_list;
 
+static bool sysinit_done;
+static int sysinit_ret;
+
 /* All TDX-usable memory regions.  Protected by mem_hotplug_lock. */
 static LIST_HEAD(tdx_memlist);
 
 static struct tdx_sys_info tdx_sysinfo __ro_after_init;
-static bool tdx_module_initialized __ro_after_init;
+static bool tdx_module_initialized;
 
 /*
  * Do the module global initialization once and return its result.
@@ -69,8 +72,6 @@ static int try_init_module_global(void)
 {
 	struct tdx_module_args args = {};
 	static DEFINE_RAW_SPINLOCK(sysinit_lock);
-	static bool sysinit_done;
-	static int sysinit_ret;
 
 	raw_spin_lock(&sysinit_lock);
 
@@ -1237,7 +1238,7 @@ int tdx_module_shutdown(void)
 {
 	struct tdx_sys_info_handoff handoff = {};
 	struct tdx_module_args args = {};
-	int ret;
+	int ret, cpu;
 
 	ret = get_tdx_sys_info_handoff(&handoff);
 	WARN_ON_ONCE(ret);
@@ -1247,7 +1248,22 @@ int tdx_module_shutdown(void)
 	 * module can produce and most likely supported by newer modules.
 	 */
 	args.rcx = handoff.module_hv;
-	return seamcall_prerr(TDH_SYS_SHUTDOWN, &args);
+	ret = seamcall_prerr(TDH_SYS_SHUTDOWN, &args);
+	if (ret)
+		return ret;
+
+	/*
+	 * Clear global and per-CPU initialization flags so the new module
+	 * can be fully re-initialized after a successful update.
+	 *
+	 * No locks needed as no concurrent accesses can occur here.
+	 */
+	tdx_module_initialized = false;
+	sysinit_done = false;
+	sysinit_ret = 0;
+	for_each_possible_cpu(cpu)
+		per_cpu(tdx_lp_initialized, cpu) = false;
+	return 0;
 }
 
 static bool is_pamt_page(unsigned long phys)
-- 
2.47.1

