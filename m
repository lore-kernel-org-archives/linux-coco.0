Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BDFE4A13A6
	for <linux-coco@lists.linux.dev>; Wed,  8 Jul 2026 17:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783530221; cv=none; b=iLCciSJ10MJJLtbL7XU++eQvxEIpSKBKSd7Mz+y2iM0UClmR/8altb3YQ/6xVjQ4gL7mMe73FVHW2AcpYa6jU+UcjMdfEse/uQEvPdCONyqOKHiBxiUtPcXPV1MT+lST8UY1o0ZdB8EMExwFls2t4CUWzPNBL9V3JLrqn2Q6i7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783530221; c=relaxed/simple;
	bh=t/g77YT9P3m8kXLyiUdG2tXEDCJYA9xrv9VL9+UNxm4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ZOFYqHWsFJERZR0ofGsPzqmj/8pGgPwvI57Wm4gOK4vsyx3KFPa9+lGB2xRFx6xUVwJTuU4UwErFHDJDpgGxydrsXkgQDi/M6u8pF3uK2Hd/MLOR8rgLkJqETrrlzKZxT+ml0v/SXY29gIMVq22N/ttWRVX5WzQXY7MK7yZs6mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZFPlEjpn; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZFPlEjpn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783530217; x=1815066217;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=t/g77YT9P3m8kXLyiUdG2tXEDCJYA9xrv9VL9+UNxm4=;
  b=ZFPlEjpnplix/wDx7HS5S8rdgD2qV4nGTnB2180jb8iB8XbxkizITVD0
   9w8NcnXPoltPUpZ4T/FNJpElzdLj/0gcbeRMyqY+RnO71E+IlWcPJGD/A
   EbxOgMy7zLXGAh/3i003rJ110G8hw3P3LE0Ny2NfPhFQ5THlirlL6OCMt
   tbVNv1c5OvF2fflDdVirEF6sOh7mUwZKnFv98k0gtIjcCZl20dpTU9PFA
   QaE0sGM/73R2qYQiwYThNIzXBcjYiWkY7avORktjE6rcx1FkI5IHPN4CH
   ZfI4x8wXpDxY7ktdU4dewvGiCQrwKY6NNuW8Oo3wnb33cACSuafp+uFIO
   A==;
X-CSE-ConnectionGUID: bvSb3g0NSEKzshFuMzEP2Q==
X-CSE-MsgGUID: tXvxvX18RIODULhN7a3CqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="95718209"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="95718209"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2026 10:03:35 -0700
X-CSE-ConnectionGUID: auERyr5vQeuTz0N52Lj5sg==
X-CSE-MsgGUID: zI3LVsJvRp+XeOmSkh5yrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="251691818"
Received: from yilunxu-optiplex-7050.sh.intel.com ([10.239.159.165])
  by fmviesa008.fm.intel.com with ESMTP; 08 Jul 2026 10:03:32 -0700
From: Xu Yilun <yilun.xu@linux.intel.com>
To: x86@kernel.org,
	linux-kernel@vger.kernel.org
Cc: kas@kernel.org,
	rick.p.edgecombe@intel.com,
	dave.hansen@intel.com,
	dave.hansen@linux.intel.com,
	yilun.xu@linux.intel.com,
	yilun.xu@intel.com,
	chao.gao@intel.com,
	djbw@kernel.org,
	linux-coco@lists.linux.dev,
	peter.fang@intel.com,
	xiaoyao.li@intel.com
Subject: [PATCH v2] x86/virt/tdx: Formalize SEAMCALL version encoding support
Date: Thu,  9 Jul 2026 01:03:30 +0800
Message-Id: <20260708170330.83850-1-yilun.xu@linux.intel.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

SEAMCALL invokes TDX module functions using a function number and
parameters. To extend the functionalities of existing SEAMCALLs while
keeping backward compatibility, TDX adds more numbered SEAMCALLs of the
same family. This is just like syscalls, except that TDX defines a
specific function number encoding pattern: a base function number and a
version together encode the full function number.

An existing SEAMCALL helper (TDH.VP.INIT) is already using the version
field. Having the caller pack the version into the function number
open-codes the ABI layout.

Add a version field in struct tdx_module_args [1], so that most existing
SEAMCALL helpers get a default "version == 0" behavior without code
churn, while callers requiring extended functionalities can specify the
version descriptively. Encode the tdx_module_args.version in the
function number before calling into assembly code.

Link: https://lore.kernel.org/kvm/4f4b0f29-424b-45ed-8cfd-c77da2ea390f@intel.com/ # [1]
Signed-off-by: Xu Yilun <yilun.xu@linux.intel.com>
---
Two alternative schemes were considered:

1. Define versioned macros like TDH_VP_INIT_V0, TDH_VP_INIT_V1, etc.
   This breaks naming consistency unless all existing stable function
   macros are changed to TDH_XXX_V0.

2. Add an explicit 'version' parameter to the base seamcall() API. This
   forces all stable SEAMCALL helpers to pass a meaningless '0'
   argument. The magic '0' or '1' values at caller sites are not
   descriptive.

Change in v2:
- Drop the C wrapper __seamcall_encode_fn()
- Rewrite the first paragraph of the changelog
- Make change log concise
- Add a link to the thread where this was suggested
- Move alternative schemes description below the separator

v1: https://lore.kernel.org/all/20260702144614.59464-1-yilun.xu@linux.intel.com/
---
 arch/x86/include/asm/shared/tdx.h         |  2 ++
 arch/x86/virt/vmx/tdx/seamcall_internal.h | 10 ++++++++++
 arch/x86/virt/vmx/tdx/tdx.h               |  8 --------
 arch/x86/virt/vmx/tdx/tdx.c               |  5 +++--
 4 files changed, 15 insertions(+), 10 deletions(-)

diff --git a/arch/x86/include/asm/shared/tdx.h b/arch/x86/include/asm/shared/tdx.h
index f20e91d7ac35..b9aac2de233a 100644
--- a/arch/x86/include/asm/shared/tdx.h
+++ b/arch/x86/include/asm/shared/tdx.h
@@ -143,6 +143,8 @@ struct tdx_module_args {
 	u64 rbx;
 	u64 rdi;
 	u64 rsi;
+	/* ABI version, encoded in rax */
+	u8  version;
 };
 
 /* Used to communicate with the TDX module */
diff --git a/arch/x86/virt/vmx/tdx/seamcall_internal.h b/arch/x86/virt/vmx/tdx/seamcall_internal.h
index be5f446467df..53d7ab037750 100644
--- a/arch/x86/virt/vmx/tdx/seamcall_internal.h
+++ b/arch/x86/virt/vmx/tdx/seamcall_internal.h
@@ -11,6 +11,7 @@
 #ifndef _X86_VIRT_SEAMCALL_INTERNAL_H
 #define _X86_VIRT_SEAMCALL_INTERNAL_H
 
+#include <linux/bitfield.h>
 #include <linux/printk.h>
 #include <linux/types.h>
 #include <asm/archrandom.h>
@@ -23,6 +24,14 @@ u64 __seamcall_saved_ret(u64 fn, struct tdx_module_args *args);
 
 typedef u64 (*sc_func_t)(u64 fn, struct tdx_module_args *args);
 
+/*
+ * SEAMCALL leaf:
+ *
+ * Bit 15:0	Leaf number
+ * Bit 23:16	Version number
+ */
+#define SEAMCALL_VERSION_MASK		GENMASK_U64(23, 16)
+
 static __always_inline u64 __seamcall_dirty_cache(sc_func_t func, u64 fn,
 						  struct tdx_module_args *args)
 {
@@ -39,6 +48,7 @@ static __always_inline u64 __seamcall_dirty_cache(sc_func_t func, u64 fn,
 	 */
 	this_cpu_write(cache_state_incoherent, true);
 
+	FIELD_MODIFY(SEAMCALL_VERSION_MASK, &fn, args->version);
 	return func(fn, args);
 }
 
diff --git a/arch/x86/virt/vmx/tdx/tdx.h b/arch/x86/virt/vmx/tdx/tdx.h
index bdfd0e1e337a..63e3acfb5d0c 100644
--- a/arch/x86/virt/vmx/tdx/tdx.h
+++ b/arch/x86/virt/vmx/tdx/tdx.h
@@ -50,14 +50,6 @@
 #define TDH_SYS_UPDATE			53
 #define TDH_SYS_DISABLE			69
 
-/*
- * SEAMCALL leaf:
- *
- * Bit 15:0	Leaf number
- * Bit 23:16	Version number
- */
-#define TDX_VERSION_SHIFT		16
-
 /* TDX page types */
 #define	PT_NDA		0x0
 #define	PT_RSVD		0x1
diff --git a/arch/x86/virt/vmx/tdx/tdx.c b/arch/x86/virt/vmx/tdx/tdx.c
index 42df8ea464c4..7a89e29b118c 100644
--- a/arch/x86/virt/vmx/tdx/tdx.c
+++ b/arch/x86/virt/vmx/tdx/tdx.c
@@ -1910,10 +1910,11 @@ u64 tdh_vp_init(struct tdx_vp *vp, u64 initial_rcx, u32 x2apicid)
 		.rcx = vp->tdvpr_pa,
 		.rdx = initial_rcx,
 		.r8 = x2apicid,
+		/* apicid requires version == 1. */
+		.version = 1,
 	};
 
-	/* apicid requires version == 1. */
-	return seamcall(TDH_VP_INIT | (1ULL << TDX_VERSION_SHIFT), &args);
+	return seamcall(TDH_VP_INIT, &args);
 }
 EXPORT_SYMBOL_FOR_KVM(tdh_vp_init);
 
-- 
2.25.1

