Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BFAB497B74
	for <linux-coco@lists.linux.dev>; Mon, 21 Sep 2026 12:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789994445; cv=none; b=e1aoPzghi5W1Tn0NMccX1sXREcTZB8C4BXp9Sc/+5LgTZTGb+nkDgQzZTLwmxKFtRnYfBIlEiouS8JXfPw4UlXt8HBmGa/f5eduLrApYYcUAYlIPXyN0/mOcVqcHCjsNWQM80KzpWBunYWtU5YpjQKVAQ/9MrZo3UH1biAbPuh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789994445; c=relaxed/simple;
	bh=qOasYInneoN0EZ3587lCUuZljaHnG6mn9iFIikVWGB4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=BxJjoHliK4UtNuRtaO4MxoyADg8vF6KDspe2X29A0xhbVxSfPiPhLGPJPzJhKbVykxwcCyXu6VMnm5+d65izmqZ/ImHf42ao55qvyKqpLhJcvY8GwE9ppWke6TRN80QHnggP2MFkOGQiWcvo9kXv1BI3CeDA6HILYJKjbs4I8Js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DbW/8760; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DbW/8760"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789994441; x=1821530441;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:to:cc;
  bh=qOasYInneoN0EZ3587lCUuZljaHnG6mn9iFIikVWGB4=;
  b=DbW/87601+gV4ck7a2UaedZ8fQYs3Ya5t1V4HCWpaqoVdA6vgKY1hc9X
   aWHsiNiCeLCjw1jswpVJaFPo43408NyuOZERN7pJvvb56qsbh39jYxzpJ
   xpAbyXMgcLnhuTTASLBwOgU5Xu4sEd+RRpFPqqkhsRmfa+HOE8Fue8cyG
   XKeIIXFkNUoIJXOCXoko50eGU29MdZ72pyJnq2P17MDGlr+2Sr8UQM6jp
   ncbydgF3VbD39kwVkiwDtbAO77O3Fgu6xSy9AQFCt5dnQbQSZVnxDBb+i
   3McpKFZqkO8droHcNBcrZ9ug9f3G03cs9NKMaIZKRbmKv23qFerRpuNEM
   g==;
X-CSE-ConnectionGUID: JyikEEnsTOazUykr/8hR3g==
X-CSE-MsgGUID: Oa2877X3SfCXYCMSecM/ww==
X-IronPort-AV: E=McAfee;i="6800,10657,11911"; a="94328918"
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; 
   d="scan'208";a="94328918"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2026 05:40:40 -0700
X-CSE-ConnectionGUID: z5vthbDzRkixQzgbvEhRQg==
X-CSE-MsgGUID: 8zITi4Y/ReOksJLOW63Wmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; 
   d="scan'208";a="300572494"
Received: from yilunxu-optiplex-7050.sh.intel.com (HELO [127.0.1.1]) ([10.239.47.46])
  by fmviesa001.fm.intel.com with ESMTP; 21 Sep 2026 05:40:37 -0700
From: Xu Yilun <yilun.xu@linux.intel.com>
Date: Mon, 21 Sep 2026 20:39:23 +0800
Subject: [PATCH v7] x86/virt/tdx: Formalize SEAMCALL leaf version encoding
 support
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-seamcall-version-v7-1-cf05fe76b467@linux.intel.com>
X-B4-Tracking: v=1; b=H4sIAHolsWoC/02MSw6CMBQAr0Le2jZt+VRYeQ/jopaHPFOKaSnBE
 O4u6MblJDOzQsRAGKHJVgg4U6TR76BPGdje+AcyancGJVQlaiVZRDNY4xybMRwya3VVF7bMFdY
 S9uwVsKPlu7zefhzT/Yl2Oj6H0YVxYFMf0PytpZCiyAvNK1Xm+swke5NLni/p4sinhZOf0HE7D
 rBtH74wm323AAAA
X-Change-ID: 20260921-seamcall-version-d7694c532e91
To: Dave Hansen <dave.hansen@linux.intel.com>, dave.hansen@intel.com, 
 x86@kernel.org, linux-kernel@vger.kernel.org
Cc: Kiryl Shutsemau <kas@kernel.org>, 
 Rick Edgecombe <rick.p.edgecombe@intel.com>, linux-kernel@vger.kernel.org, 
 linux-coco@lists.linux.dev, yilun.xu@linux.intel.com, yilun.xu@intel.com, 
 nik.borisov@suse.com, tony.lindgren@linux.intel.com, 
 binbin.wu@linux.intel.com, Kishen Maloor <kishen.maloor@intel.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=9252;
 i=yilun.xu@linux.intel.com; h=from:subject:message-id;
 bh=qOasYInneoN0EZ3587lCUuZljaHnG6mn9iFIikVWGB4=;
 b=owGbwMvMwCH2Zztz45IFPbcYT6slMWRtVJ1ibqf088JkNdaNV6OEfr93i88wWrNUpHbRhrWqJ
 1vymwVrOzpZGMQ4GAzFFFkWeMxymtI+i2nrp53XYOawMoEMEZapzMwpzdOrKHXIzCtJzdFLzs9l
 4OIUgKkKf8rwz1Km+9j1e9XVmU+9ik/FHL5Y9fdxI5/b9f3yW/bGCX7Sk2dkuL006C6LccCan59
 ZL6TsPGz5M3n9V+sFVbk5xh0dCYya3AA=
X-Developer-Key: i=yilun.xu@linux.intel.com; a=openpgp;
 fpr=A612D44FA98BA699FECC642BE2C8D72186AC3949

The TDX architecture includes a syscall-like ABI for OSes to communicate
with SEAM mode software. This ABI has the concept of a "leaf". Each leaf
is roughly analogous to a Linux syscall: it has a set of register
arguments and does one logical thing like adding a page of memory to a
VM or running a VM. The TDX architecture refers to this interface
function as a "SEAMCALL leaf".

Just like syscalls, the TDX architecture wants to evolve the ABI to
extend functionality while keeping compatibility. But unlike syscalls,
which do this by picking a totally new syscall number, the ABI encodes
the "version" number directly into the bits of a register argument. So
instead of openatN being whatever the next free number is, the SEAMCALL
leaf number and version number are encoded into certain bits in how the
RAX register is defined in the ABI.

In Linux, several seamcall*() wrappers have been introduced to invoke
SEAMCALL leafs. They all take a u64 "fn" argument for the leaf number
which eventually gets set in the register. As above, the version number
lives in the same register as the leaf number. So callers that want to
select a specific version of the leaf, can jam it in the right place in
the register by passing it in the "fn" argument. Today only the caller
of TDH.VP.INIT does this hack, but future kernel changes will need to
select versions for more SEAMCALL leafs. So a less hacky solution is
needed.

Explicitly define the arguments for seamcall*() wrappers:

  - Add a build-time assertion to ensure "fn" only contains valid
    SEAMCALL leaf number bits. Note the P-SEAMLDR selector bit (bit 63)
    is part of the leaf number for SEAM loader calls, so it is allowed.
    This also means the "fn" can't be a narrower type, such as u16, to
    exclude unrelated bits.

  - Add a "version" field in struct tdx_module_args [1], so most
    existing callers get a default "version == 0" behavior without code
    churn. Update the TDH.VP.INIT caller to specify the version
    descriptively.

Encode the leaf number and tdx_module_args.version into RAX in assembly,
because this is the place where the "fn" and struct tdx_module_args
fields are marshaled into registers.

AI was used under supervision to review code and workshop logs. In
particular, it helped evaluate the assembly changes.

Signed-off-by: Xu Yilun <yilun.xu@linux.intel.com>
Reviewed-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
Reviewed-by: Nikolay Borisov <nik.borisov@suse.com>
Reviewed-by: Tony Lindgren <tony.lindgren@linux.intel.com>
Reviewed-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
Reviewed-by: Kishen Maloor <kishen.maloor@intel.com>
Link: https://lore.kernel.org/kvm/4f4b0f29-424b-45ed-8cfd-c77da2ea390f@intel.com/ # [1]
---
Thanks to all reviewers for helping improve this patch. Dave, please
help take a look.

Two alternative schemes were considered:

 1. Define versioned macros like TDH_VP_INIT_V0, TDH_VP_INIT_V1, etc.
    Then callers could use them without encoding RAX bits themselves.
    However, this would break naming consistency unless all existing
    stable function macros are changed to TDH_XXX_V0.

 2. Add an explicit "version" parameter to seamcall*() wrappers. This
    would unnecessarily force all stable seamcall*() wrappers to pass a
    meaningless '0' argument. Additionally, the magic '0' or '1' values
    at caller sites are not descriptive.

v7:
- Changelog: split the last sentence in paragraph 3 into two (Rick)
- Add more Reviewed-by tags
- Maintain the patch by b4, in order to produce change-id for reference.

v6: https://lore.kernel.org/all/20260910104347.625378-1-yilun.xu@linux.intel.com/
- Don't change comments for struct tdx_module_args, comment on the
  version field (Dave & Tony)
- Add more Reviewed-by tags

v5: https://lore.kernel.org/all/20260901105436.461823-1-yilun.xu@linux.intel.com/
- Refactor the changelog. Retained the Reviewed-by tags, please let me
  know if you object.
- Rebase to v7.3-rc1

v4: https://lore.kernel.org/all/20260804085054.190847-1-yilun.xu@linux.intel.com/
- Add Reviewed-by tags

v3: https://lore.kernel.org/all/20260722084634.131020-1-yilun.xu@linux.intel.com/
- Move the RAX encoding in assembly code.
- Compile-time check that fn only contain base leaf number bits
- Add the full description of SEAMCALL leaf according to TDX module SPEC
- Fix the description of struct tdx_module_args.

v2: https://lore.kernel.org/all/20260708170330.83850-1-yilun.xu@linux.intel.com/
v1: https://lore.kernel.org/all/20260702144614.59464-1-yilun.xu@linux.intel.com/
---
 arch/x86/include/asm/shared/tdx.h         |  5 +++++
 arch/x86/virt/vmx/tdx/seamcall_internal.h | 19 +++++++++++++++++++
 arch/x86/virt/vmx/tdx/tdx.h               |  8 --------
 arch/x86/virt/vmx/tdx/tdxcall.S           | 10 ++++++++--
 arch/x86/kernel/asm-offsets.c             |  1 +
 arch/x86/virt/vmx/tdx/tdx.c               |  5 +++--
 6 files changed, 36 insertions(+), 12 deletions(-)

diff --git a/arch/x86/include/asm/shared/tdx.h b/arch/x86/include/asm/shared/tdx.h
index f20e91d7ac35..f2cfa71cf0ea 100644
--- a/arch/x86/include/asm/shared/tdx.h
+++ b/arch/x86/include/asm/shared/tdx.h
@@ -143,6 +143,11 @@ struct tdx_module_args {
 	u64 rbx;
 	u64 rdi;
 	u64 rsi;
+	/*
+	 * Leaf ABI version. Note that it gets encoded into RAX along with the
+	 * leaf number.
+	 */
+	u8  version;
 };
 
 /* Used to communicate with the TDX module */
diff --git a/arch/x86/virt/vmx/tdx/seamcall_internal.h b/arch/x86/virt/vmx/tdx/seamcall_internal.h
index be5f446467df..051ad2d45cab 100644
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
+	 * fn contains leaf number for TDX module calls and P-SEAMLDR calls.
+	 * Other fields in SEAMCALL leaf like leaf ABI version number are in
+	 * struct tdx_module_args.
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
index 016a2a1ec1d6..a194e83613e7 100644
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
+	 * Combine leaf number arg and leaf ABI version into RAX, they don't
+	 * overlap.
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
index 1b9ff749dd8e..1668f8615607 100644
--- a/arch/x86/virt/vmx/tdx/tdx.c
+++ b/arch/x86/virt/vmx/tdx/tdx.c
@@ -1912,10 +1912,11 @@ u64 tdh_vp_init(struct tdx_vp *vp, u64 initial_rcx, u32 x2apicid)
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
 

---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20260921-seamcall-version-d7694c532e91

Best regards,
-- 
Xu Yilun <yilun.xu@linux.intel.com>

