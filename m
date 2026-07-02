Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9E1B4E3795
	for <linux-coco@lists.linux.dev>; Thu,  2 Jul 2026 14:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783003580; cv=none; b=gmXsKMxeMnK3ohC9mjjT9cgSh1yFucozXfQUyjxbPeG52hbydF5Mw/KAbO2BjoZMVN9cUPbRk5pxpE8aKRC57f/uWz+q8KWemci6FtT+8nUptxgfPW1hFFiNhCcLhVJdOGB7FisYV2ab7/+G2yoGxGgQ6eIuH9zLuxbaLd0rSNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783003580; c=relaxed/simple;
	bh=AhGEHMjoSFJS41jJNuP3r5KzF4DiP4K+TE056Rzwp7Q=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=AswCxLmMiWRK16W1kWhPJo0R2OmcqaOBCrlWD/SLRvlSkCMNCOSBp7naMpejjZGqZOb00LifB6sAtEOd80L7VxEAHh5Oy9QFIQ7eLLX30lWSc6O9U2IYVVWW05fkUraTafoiDJWLGVJozagBE5wT7IQ8PrfpjR4mF8GSw59D4Ug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Yhg8/ClM; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Yhg8/ClM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783003579; x=1814539579;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=AhGEHMjoSFJS41jJNuP3r5KzF4DiP4K+TE056Rzwp7Q=;
  b=Yhg8/ClMGbLDZGWkvjbO0jEYe36Qp/mcD6MGXae4snW31nrbi0MX+ovx
   RYhtYIcHdhedLFR+GEE+FyMRBoL1wrYwbXPdDJmOIL0YY89Qh9ZMLn/ei
   IGRsmdyifere5SnfqhxrMy6mb61JX+K4MLvpGOTj2Fkm1ijBuqeB5gmdW
   Z5il8fVMHvlou5Ws3DK5ULUV1P96h6tj9KDVHhdXDXwQ65xLDwmTvbI9m
   FZtFf/bgj98G1lE/Kt1nHsNdWP2eUDj+o1cV9yH+QjITkr0/z7h3TFZ1h
   uDbmJ/Cskw58M5fhMJxO4q61VsjqPieCcTaFR7Gt0tleGPhnh76wO6J9k
   A==;
X-CSE-ConnectionGUID: nqbWBmvGT3a0bE4gqKGYVg==
X-CSE-MsgGUID: g539dCNrSg2AjiL8KV1O0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="94358606"
X-IronPort-AV: E=Sophos;i="6.25,144,1779174000"; 
   d="scan'208";a="94358606"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2026 07:46:18 -0700
X-CSE-ConnectionGUID: bGZBAgMvS/ifPgGj7l7GUQ==
X-CSE-MsgGUID: dpAooArFREOJcBAVUzWrQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,144,1779174000"; 
   d="scan'208";a="277201127"
Received: from yilunxu-optiplex-7050.sh.intel.com ([10.239.159.165])
  by fmviesa001.fm.intel.com with ESMTP; 02 Jul 2026 07:46:15 -0700
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
	peter.fang@intel.com
Subject: [PATCH] x86/virt/tdx: Formalize SEAMCALL version encoding support
Date: Thu,  2 Jul 2026 22:46:14 +0800
Message-Id: <20260702144614.59464-1-yilun.xu@linux.intel.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

TDX uses the SEAMCALL instruction to invoke various TDX module
functions. Just like the syscall, a SEAMCALL specifies the operation
using a function number and parameters. Moreover, TDX also uses SEAMCALL
versions to extend the functionalities of existing SEAMCALLs while
keeping backward compatibility. Unlike syscall versions that assign
brand new numbers, TDX segments the function number into a basic
function number field and a version field. Together, they encode the new
function number.

An existing SEAMCALL (TDH.VP.INIT) helper is already using the version
field. However, having the caller pack the version into the function
number open-codes the ABI layout, making the SEAMCALL helper definition
obscure and error prone.

Add a version field in struct tdx_module_args, so that most existing
SEAMCALL helpers get a default "version == 0" behavior without code
churn, while callers requiring extended functionalities can specify the
version descriptively. As an internal implementation detail, encode the
tdx_module_args.version in the function number before calling into
assembly code.

Two alternative schemes were considered:

1. Define versioned macros like TDH_VP_INIT_V0, TDH_VP_INIT_V1, etc.
   However, this breaks naming consistency unless all existing stable
   function macros are changed to TDH_XXX_V0.

2. Add an explicit 'version' parameter to the base seamcall() API. This
   unnecessarily forces all stable SEAMCALL helpers to pass a
   meaningless '0' argument. Additionally, the magic '0' or '1' values
   at caller sites are not descriptive.

Signed-off-by: Xu Yilun <yilun.xu@linux.intel.com>
---
 arch/x86/include/asm/shared/tdx.h         |  2 ++
 arch/x86/virt/vmx/tdx/seamcall_internal.h | 19 ++++++++++++++++++-
 arch/x86/virt/vmx/tdx/tdx.h               |  8 --------
 arch/x86/virt/vmx/tdx/tdx.c               |  5 +++--
 4 files changed, 23 insertions(+), 11 deletions(-)

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
index be5f446467df..7002e41cddad 100644
--- a/arch/x86/virt/vmx/tdx/seamcall_internal.h
+++ b/arch/x86/virt/vmx/tdx/seamcall_internal.h
@@ -11,6 +11,7 @@
 #ifndef _X86_VIRT_SEAMCALL_INTERNAL_H
 #define _X86_VIRT_SEAMCALL_INTERNAL_H
 
+#include <linux/bitfield.h>
 #include <linux/printk.h>
 #include <linux/types.h>
 #include <asm/archrandom.h>
@@ -23,6 +24,22 @@ u64 __seamcall_saved_ret(u64 fn, struct tdx_module_args *args);
 
 typedef u64 (*sc_func_t)(u64 fn, struct tdx_module_args *args);
 
+/*
+ * SEAMCALL leaf:
+ *
+ * Bit 15:0	Leaf number
+ * Bit 23:16	Version number
+ */
+#define SEAMCALL_VERSION_MASK		GENMASK_U64(23, 16)
+
+static __always_inline u64 __seamcall_encode_fn(sc_func_t func, u64 fn,
+						struct tdx_module_args *args)
+{
+	FIELD_MODIFY(SEAMCALL_VERSION_MASK, &fn, args->version);
+
+	return func(fn, args);
+}
+
 static __always_inline u64 __seamcall_dirty_cache(sc_func_t func, u64 fn,
 						  struct tdx_module_args *args)
 {
@@ -39,7 +56,7 @@ static __always_inline u64 __seamcall_dirty_cache(sc_func_t func, u64 fn,
 	 */
 	this_cpu_write(cache_state_incoherent, true);
 
-	return func(fn, args);
+	return __seamcall_encode_fn(func, fn, args);
 }
 
 static __always_inline u64 sc_retry(sc_func_t func, u64 fn,
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

