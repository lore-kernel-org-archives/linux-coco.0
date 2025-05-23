Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DFE1242D64
	for <linux-coco@lists.linux.dev>; Fri, 23 May 2025 09:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747994040; cv=none; b=mb/1LlYlddY7J54KmhjB8/Th6a2O5bIh0021tF/T7KUevFLs2JFN17G3Pq97TPhxUpGgCmh6MGZPP2jQ6WVHQkQN6hB4OxM9dCB0hOrxca4DYKmnEv+b995TS6qV1a9Yi83k6b7jq8YSol0GUiGjA3AKeGlpcI15ZVYMfHHDHA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747994040; c=relaxed/simple;
	bh=MHYI6BG+L0TzNrsOZ1WeYjrr84DT6xKaIAXH83HbkR8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AS6NhGZVvXMoCZnD+l0Wx0GZYagugaDB2FroEiBvvADh5D0wk6I79WJquNTwFsTCxHG/3rihgnzoADsRV8HAq8fP24Y6OqT4K5iInXywSKPm5nzJn6Bor+bssBX0tUKpKchuvQ5fvPCsuwy5HTgvH0bX1PY4nL6NHXa1+scXE2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ts7g1Rsw; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ts7g1Rsw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747994037; x=1779530037;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=MHYI6BG+L0TzNrsOZ1WeYjrr84DT6xKaIAXH83HbkR8=;
  b=Ts7g1RswhkzqtXJ5OCVlE6Ebf/JXq3i1PV9EmcDt3SnuVqYdIiWXr1b8
   G0QfRrCUOLAWVDjYr3Vsn5JQG+b8xbnZDUp44FIk0ohyMl3h8OLbBAkGx
   Ws+OnMJLI1wSNL+5unj2gOGttDB/1rWq65JCB4xxkFGalsCzKYrb9W5C4
   Rt5aNBGdCh0ev3kDfwSSVF8MuZaTgjGbQCqVAqa3DI1VB59/nXNQQmo+c
   tG1rAzyuMBXjJm2iUuWUC4P79+pOgTrKiGNGXr6kLIqKDXIMFiWQkzVcu
   u259YWZqNOP6d6925stPyXLo7jWiA3ggb24erU+w/cRP3CDTXSyFiNXXa
   g==;
X-CSE-ConnectionGUID: G3/Fd7m5TLuCLljlYFb7jw==
X-CSE-MsgGUID: CLUgZZKTQVyyYLLD4O5Wug==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="75444244"
X-IronPort-AV: E=Sophos;i="6.15,308,1739865600"; 
   d="scan'208";a="75444244"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2025 02:53:56 -0700
X-CSE-ConnectionGUID: pWgkUhH1SnGujQhMaoDXKg==
X-CSE-MsgGUID: t2+7IjtaTu+hILJ8cKt8pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,308,1739865600"; 
   d="scan'208";a="164315091"
Received: from 984fee019967.jf.intel.com ([10.165.54.94])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2025 02:53:56 -0700
From: Chao Gao <chao.gao@intel.com>
To: linux-coco@lists.linux.dev,
	x86@kernel.org,
	kvm@vger.kernel.org
Cc: seanjc@google.com,
	pbonzini@redhat.com,
	eddie.dong@intel.com,
	kirill.shutemov@intel.com,
	dave.hansen@intel.com,
	dan.j.williams@intel.com,
	kai.huang@intel.com,
	isaku.yamahata@intel.com,
	elena.reshetova@intel.com,
	rick.p.edgecombe@intel.com,
	Chao Gao <chao.gao@intel.com>,
	Farrah Chen <farrah.chen@intel.com>,
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	"H. Peter Anvin" <hpa@zytor.com>,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 17/20] x86/virt/tdx: Establish contexts for the new module
Date: Fri, 23 May 2025 02:52:40 -0700
Message-ID: <20250523095322.88774-18-chao.gao@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250523095322.88774-1-chao.gao@intel.com>
References: <20250523095322.88774-1-chao.gao@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

TD-Preserving doesn't need to re-configure the global HKID, TDMRs or PAMTs.
The new module can import the handoff data created by the old module to
establish all necessary contexts. The TDH.SYS.UPDATE API is introduced for
the import process

Once the import is done, the module update is complete, and the new module
is ready to handle requests from the VMM and guests.

Signed-off-by: Chao Gao <chao.gao@intel.com>
Tested-by: Farrah Chen <farrah.chen@intel.com>
---
 arch/x86/virt/vmx/tdx/seamldr.c |  7 +++++++
 arch/x86/virt/vmx/tdx/tdx.c     | 16 ++++++++++++++++
 arch/x86/virt/vmx/tdx/tdx.h     |  2 ++
 3 files changed, 25 insertions(+)

diff --git a/arch/x86/virt/vmx/tdx/seamldr.c b/arch/x86/virt/vmx/tdx/seamldr.c
index c4e1b7540a43..168fd2afd0c9 100644
--- a/arch/x86/virt/vmx/tdx/seamldr.c
+++ b/arch/x86/virt/vmx/tdx/seamldr.c
@@ -246,6 +246,7 @@ enum tdp_state {
 	TDP_SHUTDOWN,
 	TDP_CPU_INSTALL,
 	TDP_CPU_INIT,
+	TDP_RUN_UPDATE,
 	TDP_DONE,
 };
 
@@ -322,6 +323,12 @@ static int do_seamldr_install_module(void *params)
 			case TDP_CPU_INIT:
 				ret = tdx_cpu_enable();
 				break;
+			case TDP_RUN_UPDATE:
+				if (!primary)
+					break;
+
+				ret = tdx_module_run_update();
+				break;
 			default:
 				break;
 			}
diff --git a/arch/x86/virt/vmx/tdx/tdx.c b/arch/x86/virt/vmx/tdx/tdx.c
index 331c86eeddcf..5f678c9da4ee 100644
--- a/arch/x86/virt/vmx/tdx/tdx.c
+++ b/arch/x86/virt/vmx/tdx/tdx.c
@@ -1390,6 +1390,22 @@ void tdx_module_set_error(void)
 	tdx_module_status = TDX_MODULE_ERROR;
 }
 
+int tdx_module_run_update(void)
+{
+	struct tdx_module_args args = {};
+	int ret;
+
+	ret = seamcall(TDH_SYS_UPDATE, &args);
+	if (ret) {
+		tdx_module_status = TDX_MODULE_ERROR;
+		pr_info("module update failed: %d\n", ret);
+		return ret;
+	}
+
+	tdx_module_status = TDX_MODULE_INITIALIZED;
+	return ret;
+}
+
 static bool is_pamt_page(unsigned long phys)
 {
 	struct tdmr_info_list *tdmr_list = &tdx_tdmr_list;
diff --git a/arch/x86/virt/vmx/tdx/tdx.h b/arch/x86/virt/vmx/tdx/tdx.h
index ed3d74c991f6..a05e3c21e7f5 100644
--- a/arch/x86/virt/vmx/tdx/tdx.h
+++ b/arch/x86/virt/vmx/tdx/tdx.h
@@ -49,6 +49,7 @@
 #define TDH_VP_WR			43
 #define TDH_SYS_CONFIG			45
 #define TDH_SYS_SHUTDOWN		52
+#define TDH_SYS_UPDATE		53
 
 /*
  * SEAMCALL leaf:
@@ -126,5 +127,6 @@ int seamldr_prerr(u64 fn, struct tdx_module_args *args);
 
 int tdx_module_shutdown(void);
 void tdx_module_set_error(void);
+int tdx_module_run_update(void);
 
 #endif
-- 
2.47.1

