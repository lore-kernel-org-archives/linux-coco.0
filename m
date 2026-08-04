Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 373F9442106
	for <linux-coco@lists.linux.dev>; Tue,  4 Aug 2026 08:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785833835; cv=none; b=jYODtXol6spINr7IUQG3wlwKzUC0rlPltUorteYUlahqD07v85rOUxKhmk7WSstLwvMxlTJOufsQ3yIZsHKTzDT7Z6i9gsO2tOMA5GUUF+GcbVhwGyqz4SqvbBEzsGN7an5CM1zp2UL/cUHpMo2mRdITMQgkY0voX0Ql8pVIph0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785833835; c=relaxed/simple;
	bh=1A2skNW0fN7dm+OBf8jIaGXE2yYWVr77paPvQp7wDt0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Suec5Oto+np307MayEA3GzAyXp1BDNTW2+rjTJ7E1+XdXfUR3ultEbp4D3j9KfKSEUVdSQj9dEynJV/DzY+BOq18YmA1lL9e+lPkFMNbUo0F6JxavTBJpI56SnAEAFBmDiDnYDWp1mHEsCPwzUppkzLmTJ3eDddd+fnogscqUbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A0qk2H5o; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A0qk2H5o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785833833; x=1817369833;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=1A2skNW0fN7dm+OBf8jIaGXE2yYWVr77paPvQp7wDt0=;
  b=A0qk2H5o+JpQagPedTqZq4JE5zumj+hjZjRu3VIRJXHZR/JyQLQfLmLX
   3/LYY2WtGo0NFgl7pjP+1noPF16cUPdlNvOTBF7+2V64+IXs3pGXiQpZy
   HQLnIpMmt5KZ20uYj2TRL3X4EN6DssYSgkV2FqGRBu/YgKlRn55nFQUQ1
   EhQ7+ynDTh1NE+5flErHtoywPCIQiqkVpE3TBoH4qQpElJOfaDNY0HTjV
   nvam1CatuDsKCEb9EjwbJofk/V1lJSBFYjMDLig9xT6BZdgW75SxdTkYu
   T8xLqz1vWWAkhDvZ+5ikHM65ux6qhesV5fmQsLROv5ykJOtJKC7fv4IFE
   A==;
X-CSE-ConnectionGUID: 5aG0fczHSiWkGU8DtHc3dg==
X-CSE-MsgGUID: cUtfBpUyTRaorlcMf9EEaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11864"; a="86389927"
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; 
   d="scan'208";a="86389927"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2026 01:57:12 -0700
X-CSE-ConnectionGUID: TC24PBpUR5yFIAvMsaei+Q==
X-CSE-MsgGUID: YKzUWdMqRxSTZh0bdK8hfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; 
   d="scan'208";a="257123626"
Received: from yilunxu-optiplex-7050.sh.intel.com ([10.239.159.165])
  by fmviesa006.fm.intel.com with ESMTP; 04 Aug 2026 01:50:55 -0700
From: Xu Yilun <yilun.xu@linux.intel.com>
To: dave.hansen@intel.com,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	linux-kernel@vger.kernel.org
Cc: kas@kernel.org,
	rick.p.edgecombe@intel.com,
	yilun.xu@linux.intel.com,
	yilun.xu@intel.com,
	linux-coco@lists.linux.dev
Subject: [PATCH v4] x86/virt/tdx: Formalize SEAMCALL version encoding support
Date: Tue,  4 Aug 2026 16:50:54 +0800
Message-Id: <20260804085054.190847-1-yilun.xu@linux.intel.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

SEAMCALL invokes TDX module functions using a function number and
parameters. To extend the functionality of existing SEAMCALLs while
keeping backward compatibility, TDX adds more numbered SEAMCALLs of the
same family. This is just like syscalls, except that TDX defines a
specific function number encoding pattern: a base function number and a
version together encode the full function number.

One concern is the compatibility with older TDX modules which don't
recognize the new SEAMCALLs. The kernel should decide which SEAMCALL
version to use at runtime, selecting the minimum version number for the
required functionality. It can't overwrite the function number with a
new value at compile time.

Another concern is the obscure usage of the 'fn' parameter for SEAMCALL
wrappers. An existing caller for TDH.VP.INIT packs the version into the
'fn' to match the low-level TDX ABI RAX layout. The RAX layout
interprets some bits differently, such as INTERRUPT_MODE, SEAMLDR flag,
which are not a good fit for the function number definition.

Refactor the SEAMCALL wrappers to allow for version selection. Add a
version field in struct tdx_module_args [1], so that most existing
callers get a default "version == 0" behavior without code churn, while
callers requiring extended functionalities can specify the version
descriptively. Enforce the 'fn' parameter as the base function number.
Encode the base function number and tdx_module_args.version in RAX
before invoking the SEAMCALL instruction in assembly code.

Link: https://lore.kernel.org/kvm/4f4b0f29-424b-45ed-8cfd-c77da2ea390f@intel.com/ # [1]
Reviewed-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
Reviewed-by: Nikolay Borisov <nik.borisov@suse.com>
Signed-off-by: Xu Yilun <yilun.xu@linux.intel.com>
---
We've reached agreement on the main concern in v3 that 'fn' only
contains the base leaf number, and the version is placed in
struct tdx_module_args.

Rick asked if the BUILD_BUG_ON() may cause some compiler to complain.
We discussed that existing __seamcall*() already rely on the
__always_inline to work and haven't see problem. We've agreed the new
compile-time assertion will not add more problem.

We've got some Reviewed-bys. Dave, please review it and consider taking
it to linux-next.

Changes:
- Add Reviewed-by tags. No other change.

v3: https://lore.kernel.org/all/20260722084634.131020-1-yilun.xu@linux.intel.com/
- Move the RAX encoding in assembly code.
- Compile-time check that fn only contain base leaf number bits
- Add the full description of SEAMCALL leaf according to TDX module SPEC
- Fix the description of struct tdx_module_args.

v2: https://lore.kernel.org/all/20260708170330.83850-1-yilun.xu@linux.intel.com/
- Drop the C wrapper __seamcall_encode_fn()
- Rewrite the first paragraph of the changelog
- Make change log concise
- Add a link to the thread where this was suggested
- Move alternative schemes description below the separator

v1: https://lore.kernel.org/all/20260702144614.59464-1-yilun.xu@linux.intel.com/
---
 arch/x86/include/asm/shared/tdx.h         | 10 +++++++---
 arch/x86/virt/vmx/tdx/seamcall_internal.h | 19 +++++++++++++++++++
 arch/x86/virt/vmx/tdx/tdx.h               |  8 --------
 arch/x86/virt/vmx/tdx/tdxcall.S           | 10 ++++++++--
 arch/x86/kernel/asm-offsets.c             |  1 +
 arch/x86/virt/vmx/tdx/tdx.c               |  5 +++--
 6 files changed, 38 insertions(+), 15 deletions(-)

diff --git a/arch/x86/include/asm/shared/tdx.h b/arch/x86/include/asm/shared/tdx.h
index f20e91d7ac35..67490c330d91 100644
--- a/arch/x86/include/asm/shared/tdx.h
+++ b/arch/x86/include/asm/shared/tdx.h
@@ -122,9 +122,11 @@
 #include <linux/compiler_attributes.h>
 
 /*
- * Used in __tdcall*() to gather the input/output registers' values of the
- * TDCALL instruction when requesting services from the TDX module. This is a
- * software only structure and not part of the TDX module/VMM ABI
+ * Used in __tdcall*() to gather the input/output parameters of the TDCALL
+ * instruction when requesting services from the TDX module. 'version' is
+ * encoded in rax along with the Leaf number. Others are raw input/output
+ * registers' values. This is a software only structure and not part of the TDX
+ * module/VMM ABI.
  */
 struct tdx_module_args {
 	/* callee-clobbered */
@@ -143,6 +145,8 @@ struct tdx_module_args {
 	u64 rbx;
 	u64 rdi;
 	u64 rsi;
+	/* Leaf ABI version, encoded in rax */
+	u8  version;
 };
 
 /* Used to communicate with the TDX module */
diff --git a/arch/x86/virt/vmx/tdx/seamcall_internal.h b/arch/x86/virt/vmx/tdx/seamcall_internal.h
index be5f446467df..c586ddad072f 100644
--- a/arch/x86/virt/vmx/tdx/seamcall_internal.h
+++ b/arch/x86/virt/vmx/tdx/seamcall_internal.h
@@ -11,6 +11,7 @@
 #ifndef _X86_VIRT_SEAMCALL_INTERNAL_H
 #define _X86_VIRT_SEAMCALL_INTERNAL_H
 
+#include <linux/bitfield.h>
 #include <linux/printk.h>
 #include <linux/types.h>
 #include <asm/archrandom.h>
@@ -23,9 +24,27 @@ u64 __seamcall_saved_ret(u64 fn, struct tdx_module_args *args);
 
 typedef u64 (*sc_func_t)(u64 fn, struct tdx_module_args *args);
 
+/*
+ * SEAMCALL leaf:
+ *
+ * Bit 15:0	Leaf number
+ * Bit 23:16	Leaf ABI version number
+ * Bit 24	Pending interrupts detection mode
+ * Bit 63	1 for P-SEAMLDR leaf, 0 for TDX module leaf
+ */
+#define SEAMCALL_LEAF_MASK		GENMASK_U64(15, 0)
+#define SEAMCALL_SEAMLDR_MASK		BIT_U64(63)
+
 static __always_inline u64 __seamcall_dirty_cache(sc_func_t func, u64 fn,
 						  struct tdx_module_args *args)
 {
+	/*
+	 * fn contains base leaf number for TDX module calls and P-SEAMLDR
+	 * calls. Other fields in SEAMCALL leaf like leaf ABI version number
+	 * are in struct tdx_module_args.
+	 */
+	BUILD_BUG_ON(fn & ~(SEAMCALL_LEAF_MASK | SEAMCALL_SEAMLDR_MASK));
+
 	lockdep_assert_preemption_disabled();
 
 	/*
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
diff --git a/arch/x86/virt/vmx/tdx/tdxcall.S b/arch/x86/virt/vmx/tdx/tdxcall.S
index 016a2a1ec1d6..a01542c02c36 100644
--- a/arch/x86/virt/vmx/tdx/tdxcall.S
+++ b/arch/x86/virt/vmx/tdx/tdxcall.S
@@ -45,8 +45,14 @@
 .macro TDX_MODULE_CALL host:req ret=0 saved=0
 	FRAME_BEGIN
 
-	/* Move Leaf ID to RAX */
-	mov %rdi, %rax
+	/* Leaf ABI version -> RAX[23:16]. Zero rest of RAX. */
+	movzbl	TDX_MODULE_version(%rsi), %eax
+	shl	$16, %eax
+	/*
+	 * Combine base leaf number arg and leaf ABI version into RAX, they
+	 * don't overlap.
+	 */
+	or	%rdi, %rax
 
 	/* Move other input regs from 'struct tdx_module_args' */
 	movq	TDX_MODULE_rcx(%rsi), %rcx
diff --git a/arch/x86/kernel/asm-offsets.c b/arch/x86/kernel/asm-offsets.c
index 081816888f7a..b3c00ff4d819 100644
--- a/arch/x86/kernel/asm-offsets.c
+++ b/arch/x86/kernel/asm-offsets.c
@@ -95,6 +95,7 @@ static void __used common(void)
 	OFFSET(TDX_MODULE_rbx, tdx_module_args, rbx);
 	OFFSET(TDX_MODULE_rdi, tdx_module_args, rdi);
 	OFFSET(TDX_MODULE_rsi, tdx_module_args, rsi);
+	OFFSET(TDX_MODULE_version, tdx_module_args, version);
 
 	BLANK();
 	OFFSET(BP_scratch, boot_params, scratch);
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

