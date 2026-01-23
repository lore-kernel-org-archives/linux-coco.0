Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03050364047
	for <linux-coco@lists.linux.dev>; Fri, 23 Jan 2026 15:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769180438; cv=none; b=Wwr/GPwRkAEAe8BdgTXq2/iTKUy4NNgdVKagp027lJzUUABYzbiSltmnwkh2OBNrZ4iZdeZUQyAkjqaudxYADVTz7I2qrzzLJNKaIsd2wqXnwzIctybwRg54WW+UcOam/1m3o26E8HyNFObN/XXb7fVXq9GYCwbYZGuvV+x9bbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769180438; c=relaxed/simple;
	bh=xW4j0l2qmTh00vzb82ZFjrNGHJwRR46YR7Za6lDhCTM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SJahAWtwsaWN5Iw2hJC3+Sslf3V8Dv8xFTN9J3ZpDZulqWb3sNrtyrKmY2EqLbHGvkbB7lrpWpSzTk+jXCipEKgppu/OJ/0/LeYBaNWEogTzDahetmfaFmmzje+MKuhRBoKXwXg0eSJznTBoTjjrkkWTbM4FcvVDlZLtYy9NfCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nLixZieV; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nLixZieV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769180436; x=1800716436;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xW4j0l2qmTh00vzb82ZFjrNGHJwRR46YR7Za6lDhCTM=;
  b=nLixZieVFWr2Mij+xWRMmBYa0ROECXZ/ATUeYN4kvROpD/lc+GSli4qS
   wqhTlfA+gMKbIcXtip9F2swfq/TYHjGAIJ73UUPYf2ndTD0YQyiQ0Pv8m
   CWmnE8kn2ATTgXKnM4NFl2g6T3Bh/x+8rSBp2Ln7eA0HAwVaSEyRnvnKa
   vxuKtW/SxiDG/K+txtwd0EXi4BfX+JtY5A8ZI5QdqoSMfa4usknu+IiwT
   jrTkwO6KYNYC0YvvZHVOCSeskVU5psQZcaNta9hAGvpYQhgjDGUQXknpQ
   Dqq0CgC0JJBVhMio2Xb7fEqDUNfU33Lark9FeiVw49RTuQgRsXa9rfUdV
   g==;
X-CSE-ConnectionGUID: 5+e/qgQxR0edYp9Of3XWaw==
X-CSE-MsgGUID: UkpQSou5Tsa7AhHFLkI76A==
X-IronPort-AV: E=McAfee;i="6800,10657,11680"; a="70334504"
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; 
   d="scan'208";a="70334504"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2026 07:00:19 -0800
X-CSE-ConnectionGUID: GrFZaddoSyyEii7M73hpiA==
X-CSE-MsgGUID: TzUN+6HIRUWT81G8RXPZyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; 
   d="scan'208";a="237697199"
Received: from 984fee019967.jf.intel.com ([10.23.153.244])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2026 07:00:19 -0800
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
Subject: [PATCH v3 21/26] x86/virt/tdx: Establish contexts for the new TDX Module
Date: Fri, 23 Jan 2026 06:55:29 -0800
Message-ID: <20260123145645.90444-22-chao.gao@intel.com>
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

After being installed, the new TDX Module shouldn't re-configure the
global HKID, TDMRs or PAMTs. Instead, to preserve running TDs, it should
import the handoff data from the old module to establish all necessary
contexts.

Once the import is done, the TDX Module update is complete, and the new
module is ready to handle requests from the VMM and guests.

Call the TDH.SYS.UPDATE SEAMCALL to import the handoff data from the old
module.

Note that the location and the format of handoff data is defined by the
TDX Module. The new module knows where to get the handoff data and how to
parse it. The kernel doesn't need to provide its location, format etc.

Signed-off-by: Chao Gao <chao.gao@intel.com>
Tested-by: Farrah Chen <farrah.chen@intel.com>
---
v3:
 - use seamcall_prerr() rather than raw seamcall() [Binbin]
 - use pr_err() to print error message [Binbin]
---
 arch/x86/virt/vmx/tdx/seamldr.c |  5 +++++
 arch/x86/virt/vmx/tdx/tdx.c     | 16 ++++++++++++++++
 arch/x86/virt/vmx/tdx/tdx.h     |  2 ++
 3 files changed, 23 insertions(+)

diff --git a/arch/x86/virt/vmx/tdx/seamldr.c b/arch/x86/virt/vmx/tdx/seamldr.c
index ee672f381dd5..7fa68c0c6ce4 100644
--- a/arch/x86/virt/vmx/tdx/seamldr.c
+++ b/arch/x86/virt/vmx/tdx/seamldr.c
@@ -240,6 +240,7 @@ enum tdp_state {
 	TDP_SHUTDOWN,
 	TDP_CPU_INSTALL,
 	TDP_CPU_INIT,
+	TDP_RUN_UPDATE,
 	TDP_DONE,
 };
 
@@ -307,6 +308,10 @@ static int do_seamldr_install_module(void *seamldr_params)
 			case TDP_CPU_INIT:
 				ret = tdx_cpu_enable();
 				break;
+			case TDP_RUN_UPDATE:
+				if (primary)
+					ret = tdx_module_run_update();
+				break;
 			default:
 				break;
 			}
diff --git a/arch/x86/virt/vmx/tdx/tdx.c b/arch/x86/virt/vmx/tdx/tdx.c
index 2763c1869b78..2654aa169dda 100644
--- a/arch/x86/virt/vmx/tdx/tdx.c
+++ b/arch/x86/virt/vmx/tdx/tdx.c
@@ -1202,6 +1202,22 @@ int tdx_module_shutdown(void)
 	return 0;
 }
 
+int tdx_module_run_update(void)
+{
+	struct tdx_module_args args = {};
+	int ret;
+
+	ret = seamcall_prerr(TDH_SYS_UPDATE, &args);
+	if (ret) {
+		pr_err("TDX-Module update failed (%d)\n", ret);
+		tdx_module_status = TDX_MODULE_ERROR;
+		return ret;
+	}
+
+	tdx_module_status = TDX_MODULE_INITIALIZED;
+	return 0;
+}
+
 static bool is_pamt_page(unsigned long phys)
 {
 	struct tdmr_info_list *tdmr_list = &tdx_tdmr_list;
diff --git a/arch/x86/virt/vmx/tdx/tdx.h b/arch/x86/virt/vmx/tdx/tdx.h
index 1c4da9540ae0..0887debfd139 100644
--- a/arch/x86/virt/vmx/tdx/tdx.h
+++ b/arch/x86/virt/vmx/tdx/tdx.h
@@ -47,6 +47,7 @@
 #define TDH_VP_WR			43
 #define TDH_SYS_CONFIG			45
 #define TDH_SYS_SHUTDOWN		52
+#define TDH_SYS_UPDATE		53
 
 /*
  * SEAMCALL leaf:
@@ -120,5 +121,6 @@ struct tdmr_info_list {
 };
 
 int tdx_module_shutdown(void);
+int tdx_module_run_update(void);
 
 #endif
-- 
2.47.3

