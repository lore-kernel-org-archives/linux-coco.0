Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17B7C335573
	for <linux-coco@lists.linux.dev>; Fri, 23 Jan 2026 15:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769180436; cv=none; b=M5L3uCZt56OeD+TcmaFasMdD1qmEXHogEV109CSaz714X2gKT5VKtmmMuj2mPRZKTnmyeF9xS33BLFO48Mcbd5AORWvEXee772RHvE5lamhMxAbI9IIrTHpW+03YOvUDQZUjz6WxLEKYuUEFCps6K9t4h4HvC83h5NERI14gLdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769180436; c=relaxed/simple;
	bh=KJpmqqhLnjAbDclaNk+4xpsm/pXva8svEd54xfOtQPw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X7SlrvgQKlmDg43i+VckfOSfLQ1yh+CuWkZfbsnKCjjrVN/bdEuJtFOgQXd+MjHcw04kXV/Ia02BvBBJ6k7fYyK2ORBexcOtLjl7lWwSdm9LuNzzX+35+An/fB2j7Nt0CBenu6izWgMyICCTPo8NIzGCp7TwmjL+g+AXtNp7g1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jHhLV4Ku; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jHhLV4Ku"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769180434; x=1800716434;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KJpmqqhLnjAbDclaNk+4xpsm/pXva8svEd54xfOtQPw=;
  b=jHhLV4KutZQ3WL1wSaytfwlWkAT+0cmUrFS7T9xxjkGcN6wv6neT7dcA
   CdsSVNSRABb+1vWDMtSaEq9gmIoymWZnayDR5Yj0li1Bypfs9kCSdYsu9
   9pfxSoH7miI2Mg7LxkP0qtRFPr2/QsjqzZ7SgoMQ7wPt7TGIqOS3HDSES
   +uE44hSNJQBQ94Ufs58YuEbNY24IRp8N2YyyVes1vonf/g0Ek3cfpGqnw
   zq/eY5mlttwNKLtjy4trFzQo78n6xv9K8TcjnSYyAmRM7SvfMpUDIgN2l
   TwlD2oIY6JL4VJfvUhhhum9U+0SBUWi619K2WlfEFvNxGpCDuak9CU8g4
   w==;
X-CSE-ConnectionGUID: dU7ZjW+DRtKwyg1nul4fWw==
X-CSE-MsgGUID: 13lSvGlvTXu+m4f0lmYPjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11680"; a="70334485"
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; 
   d="scan'208";a="70334485"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2026 07:00:18 -0800
X-CSE-ConnectionGUID: VtwK72JFTvOS9MSnXDwF1w==
X-CSE-MsgGUID: OiWuBPkKR72fDYfjxuD+Ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; 
   d="scan'208";a="237697186"
Received: from 984fee019967.jf.intel.com ([10.23.153.244])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2026 07:00:18 -0800
From: Chao Gao <chao.gao@intel.com>
To: linux-coco@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	x86@kernel.org
Cc: reinette.chatre@intel.com,
	ira.weiny@intel.com,
	kai.huang@intel.com,
	dan.j.williams@intel.com,
	yilun.xu@linux.intel.com,
	sagis@google.com,
	vannapurve@google.com,
	paulmck@kernel.org,
	nik.borisov@suse.com,
	zhenzhong.duan@intel.com,
	seanjc@google.com,
	rick.p.edgecombe@intel.com,
	kas@kernel.org,
	dave.hansen@linux.intel.com,
	vishal.l.verma@intel.com,
	Chao Gao <chao.gao@intel.com>,
	Farrah Chen <farrah.chen@intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH v3 19/26] x86/virt/seamldr: Install a new TDX Module
Date: Fri, 23 Jan 2026 06:55:27 -0800
Message-ID: <20260123145645.90444-20-chao.gao@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260123145645.90444-1-chao.gao@intel.com>
References: <20260123145645.90444-1-chao.gao@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After shutting down the running TDX module, the next step is to install the
new TDX Module supplied by userspace.

P-SEAMLDR provides the SEAMLDR.INSTALL SEAMCALL for that. The SEAMCALL
accepts the seamldr_params struct and should be called serially on all
CPUs.

Invoke the SEAMLDR.INSTALL SEAMCALL serially on all CPUs and add a new
spinlock to enforce serialization.

Signed-off-by: Chao Gao <chao.gao@intel.com>
Tested-by: Farrah Chen <farrah.chen@intel.com>
---
 arch/x86/virt/vmx/tdx/seamldr.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/arch/x86/virt/vmx/tdx/seamldr.c b/arch/x86/virt/vmx/tdx/seamldr.c
index b497fa72ebb6..13c34e6378e0 100644
--- a/arch/x86/virt/vmx/tdx/seamldr.c
+++ b/arch/x86/virt/vmx/tdx/seamldr.c
@@ -13,6 +13,7 @@
 #include <linux/mm.h>
 #include <linux/nmi.h>
 #include <linux/slab.h>
+#include <linux/spinlock.h>
 #include <linux/stop_machine.h>
 #include <linux/types.h>
 
@@ -23,6 +24,7 @@
 
 /* P-SEAMLDR SEAMCALL leaf function */
 #define P_SEAMLDR_INFO			0x8000000000000000
+#define P_SEAMLDR_INSTALL		0x8000000000000001
 
 /* P-SEAMLDR can accept up to 496 4KB pages for TDX module binary */
 #define SEAMLDR_MAX_NR_MODULE_4KB_PAGES	496
@@ -45,6 +47,7 @@ struct seamldr_params {
 } __packed;
 
 static struct seamldr_info seamldr_info __aligned(256);
+static DEFINE_RAW_SPINLOCK(seamldr_lock);
 
 static inline int seamldr_call(u64 fn, struct tdx_module_args *args)
 {
@@ -235,6 +238,7 @@ static struct seamldr_params *init_seamldr_params(const u8 *data, u32 size)
 enum tdp_state {
 	TDP_START,
 	TDP_SHUTDOWN,
+	TDP_CPU_INSTALL,
 	TDP_DONE,
 };
 
@@ -272,9 +276,10 @@ static void print_update_failure_message(void)
  * See multi_cpu_stop() from where this multi-cpu state-machine was
  * adopted, and the rationale for touch_nmi_watchdog()
  */
-static int do_seamldr_install_module(void *params)
+static int do_seamldr_install_module(void *seamldr_params)
 {
 	enum tdp_state newstate, curstate = TDP_START;
+	struct tdx_module_args args = {};
 	int cpu = smp_processor_id();
 	bool primary;
 	int ret = 0;
@@ -293,6 +298,11 @@ static int do_seamldr_install_module(void *params)
 				if (primary)
 					ret = tdx_module_shutdown();
 				break;
+			case TDP_CPU_INSTALL:
+				args.rcx = __pa(seamldr_params);
+				scoped_guard(raw_spinlock, &seamldr_lock)
+					ret = seamldr_call(P_SEAMLDR_INSTALL, &args);
+				break;
 			default:
 				break;
 			}
-- 
2.47.3

