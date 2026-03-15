Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC24D364047
	for <linux-coco@lists.linux.dev>; Sun, 15 Mar 2026 13:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773583188; cv=none; b=aD/ChQY2UguJeFGdZkrGluIzV+Ekn73PWAOtAC6wA4+nNBoKo9xnUoU4w4J3YeoJx7Xlv/dP4OIQxZwg7VN0oua4xX6dmvCSp8hKVENVGmpFX/4+eR0rDQ5obHzi97HXFuKn90RRG2GkgrxXbwPFwIRHxAjyUnSlPB+He9ozLwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773583188; c=relaxed/simple;
	bh=erQXWjYg3IDmZ3KFFHbWEdsLQ8MJHunpoDYV6dXAb0I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FIU6wPMYgDUxRTK5VbKxTVuyTSSBX6rTzkd1XmNONrTnANgG8OoLYwb+DJu+ZeDpLzqLrr9OEuesegv3zT7NyuqIzdmP6oAS73J4//60Q31RZIrWFblBQlxjfGqflk7EZptlIbie+K/R5Tiejhreuu1mfHGAK5o2DOQ91JzUgrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L4o2udV7; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L4o2udV7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773583187; x=1805119187;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=erQXWjYg3IDmZ3KFFHbWEdsLQ8MJHunpoDYV6dXAb0I=;
  b=L4o2udV7SwMqugpX+OXwyq4AgMKY+iT+GJH2/ffO4UPHsYDPJGGXWmH8
   iviCkyBYbRZsAVzvUgg7Py5e3ZTrAbWdXcdjPLA2tWEiu0cEgvgnCJSY4
   kH/2sJJnTFxMvNYH76pzQFfAQE/EQ1V5PN1nD5PVwqMkRgTbK3RjKI77d
   Ik6B7VjLNjcIBHVrZCwPphikFIY5SDp8FuWfpXagZgb5hB35m3pLpYPTL
   ITV9LpX1pSnfgM3k6ak6k/a9Cy2KzpeSM8ZACgfhrX4OkOuyC8oyP5nOS
   5eOSR2F/oGP3hDtBJsv/yKUKxpwWNxtN5e2f7L3Vs6LnHPo9HRINzKBIt
   g==;
X-CSE-ConnectionGUID: WHBzMzxtSF2GjsmSMCTx+g==
X-CSE-MsgGUID: CYHW9T9NRaGkwDkFQQFGNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11730"; a="74732511"
X-IronPort-AV: E=Sophos;i="6.23,122,1770624000"; 
   d="scan'208";a="74732511"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2026 06:59:42 -0700
X-CSE-ConnectionGUID: J5qrRmD0SSap9cNFnezhOA==
X-CSE-MsgGUID: t4xAvQ2BQbqdrHWs4En3rA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,122,1770624000"; 
   d="scan'208";a="226123056"
Received: from 984fee019967.jf.intel.com ([10.23.153.244])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2026 06:59:42 -0700
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
Subject: [PATCH v5 13/22] x86/virt/seamldr: Install a new TDX module
Date: Sun, 15 Mar 2026 06:58:33 -0700
Message-ID: <20260315135920.354657-14-chao.gao@intel.com>
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

Following the shutdown of the existing TDX module, the update process
continues with installing the new module. P-SEAMLDR provides the
SEAMLDR.INSTALL SEAMCALL to perform this installation, which must be
executed on all CPUs.

Implement SEAMLDR.INSTALL and execute it on every CPU.

Signed-off-by: Chao Gao <chao.gao@intel.com>
Reviewed-by: Tony Lindgren <tony.lindgren@linux.intel.com>
Reviewed-by: Kai Huang <kai.huang@intel.com>
Reviewed-by: Xu Yilun <yilun.xu@linux.intel.com>
---
v5:
 - drop "serially" from the changelog as it doesn't matter to
   this patch
---
 arch/x86/virt/vmx/tdx/seamldr.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/x86/virt/vmx/tdx/seamldr.c b/arch/x86/virt/vmx/tdx/seamldr.c
index bb4aa6327eee..a64271f94aed 100644
--- a/arch/x86/virt/vmx/tdx/seamldr.c
+++ b/arch/x86/virt/vmx/tdx/seamldr.c
@@ -19,6 +19,7 @@
 
 /* P-SEAMLDR SEAMCALL leaf function */
 #define P_SEAMLDR_INFO			0x8000000000000000
+#define P_SEAMLDR_INSTALL		0x8000000000000001
 
 #define SEAMLDR_MAX_NR_MODULE_4KB_PAGES	496
 #define SEAMLDR_MAX_NR_SIG_4KB_PAGES	4
@@ -186,6 +187,7 @@ static struct seamldr_params *init_seamldr_params(const u8 *data, u32 size)
 enum module_update_state {
 	MODULE_UPDATE_START,
 	MODULE_UPDATE_SHUTDOWN,
+	MODULE_UPDATE_CPU_INSTALL,
 	MODULE_UPDATE_DONE,
 };
 
@@ -225,6 +227,7 @@ static void ack_state(void)
 static int do_seamldr_install_module(void *seamldr_params)
 {
 	enum module_update_state newstate, curstate = MODULE_UPDATE_START;
+	struct tdx_module_args args = {};
 	int cpu = smp_processor_id();
 	bool primary;
 	int ret = 0;
@@ -243,6 +246,10 @@ static int do_seamldr_install_module(void *seamldr_params)
 				if (primary)
 					ret = tdx_module_shutdown();
 				break;
+			case MODULE_UPDATE_CPU_INSTALL:
+				args.rcx = __pa(seamldr_params);
+				ret = seamldr_call(P_SEAMLDR_INSTALL, &args);
+				break;
 			default:
 				break;
 			}
-- 
2.47.3

