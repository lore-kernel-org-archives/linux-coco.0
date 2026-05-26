Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47E923148A8
	for <linux-coco@lists.linux.dev>; Tue, 26 May 2026 02:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779762937; cv=none; b=WyCafXMJGUrH7rfwyKuJmChCpkY8Du0MK+PCn8YrxzQ5/gl/AgT37x5fqG24Uy9sEr0Y0oDHshFArNFLVO50Wa7Xar6UUUoYIMC/R9OF3NBmvdKKldVi+Nn2PaHwASAdQqe+ZnVSscPsTUiXywXq9UZhxihCiJWpjMNW6JnM5oA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779762937; c=relaxed/simple;
	bh=6WuNs68Db22YKlyZABLkieFbKvfcpx6Rf74QPb8/WiQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tlqVGvE605Hbf6Ha35Oi/c5bN49oVpURfmW9z6CuhGSbhdur4SvFws4aJsf5/T0snuG6ZCcC9mY+3qTo7+u3+URadOZMafmZ9eo5YJmeQLTgM4/aKhoA5fVxWlFLanIpfalgVoampq6KPlwhRyb0KOjFlcI+X2qULLlR624z+Qo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lJymC5DX; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lJymC5DX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779762935; x=1811298935;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6WuNs68Db22YKlyZABLkieFbKvfcpx6Rf74QPb8/WiQ=;
  b=lJymC5DXb8BdzkzLU+j6OGNE9lEd08ZHGijNr7mGy2vn/fpjYH/oEFe+
   DL93gN4E9Umq2YRvhm4QtHeGaBFYrQHnC/2YczAyh9JKwfOi7qG3iT8iv
   3nW2wp3I1nb4Qx99FEoZ09JScdK1T0AmU99e5nQTJW7ykvGroHyYEu65W
   ZH3w6F4NGWHWaWuhrSOnjL/yS5yb0aZLEK1EPshqaq+MCevxDj674l92L
   hxaEAvnUSp84IbQOCMVl9Q/BLY1j+zVhpnljbPfmrFCVF6v6oJdVLL+G6
   xuOYURq3gNbsEPj2VcbGHum+YUckJ0jseetybUUpu9KtYuFJoKIKuY24W
   w==;
X-CSE-ConnectionGUID: XloAWKgLRuKibxlx/KD+BQ==
X-CSE-MsgGUID: q7kpPLYzSbS6EmN5idEbsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="91677842"
X-IronPort-AV: E=Sophos;i="6.24,168,1774335600"; 
   d="scan'208";a="91677842"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2026 19:35:24 -0700
X-CSE-ConnectionGUID: 2Ngf3jtgRpWTN/eSGePtIw==
X-CSE-MsgGUID: kDW/DPGxS6CHeP/Vo9jHSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,168,1774335600"; 
   d="scan'208";a="279878326"
Received: from rpedgeco-desk.jf.intel.com ([10.88.27.139])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2026 19:35:24 -0700
From: Rick Edgecombe <rick.p.edgecombe@intel.com>
To: bp@alien8.de,
	dave.hansen@intel.com,
	hpa@zytor.com,
	kas@kernel.org,
	kvm@vger.kernel.org,
	linux-coco@lists.linux.dev,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mingo@redhat.com,
	nik.borisov@suse.com,
	pbonzini@redhat.com,
	seanjc@google.com,
	tglx@kernel.org,
	vannapurve@google.com,
	x86@kernel.org,
	chao.gao@intel.com,
	yan.y.zhao@intel.com,
	kai.huang@intel.com
Cc: rick.p.edgecombe@intel.com,
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Subject: [PATCH v6 10/11] x86/virt/tdx: Enable Dynamic PAMT
Date: Mon, 25 May 2026 19:35:14 -0700
Message-ID: <20260526023515.288829-11-rick.p.edgecombe@intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260526023515.288829-1-rick.p.edgecombe@intel.com>
References: <20260526023515.288829-1-rick.p.edgecombe@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>

The Physical Address Metadata Table (PAMT) holds TDX metadata for
physical memory and must be allocated by the kernel during TDX module
initialization. Dynamic PAMT is a TDX module feature that can reduce this
memory use by allocating part of the PAMT dynamically.

All pieces are in place to Enable Dynamic PAMT if it is supported.
Determine if the TDX module supports it by checking the 'features0' bit
exposed by the TDX module.

The TDX module also exposes information about whether the *system* (and
not the module) supports Dynamic PAMT.

The TDX module documentation describes how PAMT works internally. To allow
the last level to be dynamically allocated, it uses a 3 level tree
structure, not unlike page tables. Like page tables, it has a maximum
address space that it can cover. This address space can be covered in 48
bits. If the host physical address space is higher than this, than the
TDX module can't guarantee the tree will be able to cover the TDX memory.

The TDX module exposes this system support via metadata stating the
minimum number of HKIDs that need to be available in order for Dynamic
PAMT to be usable. The reasoning appears to be that more HKIDs can shrink
the "real" addressable physical address bits enough to make the 48 bit
Dynamic PAMT limit workable on high physical address width HW. However,
the docs also clearly explain the 48 bit limit and how this fits into the
Dymamic PAMT tree constraints.

The handy x86_phys_bits value is already read and adjusted for keyid bits.
So just compare that against 48 instead of reading more metadata and
burdening the code with the more tenuous connection to minimum HKID bits.

Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
Co-developed-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
Signed-off-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
---
v6:
 - After Nikolai pointed out that the TDX docs actually have the Dynamic
   PAMT pages-per-2MB region fixed at 2 instead of variable sized, I
   checked over the docs more closely looking for anything else that might
   have been missed. Spotted this 48 bit physical address bit check in the
   docs, so added it.
---
 arch/x86/include/asm/tdx.h  | 11 ++++++++++-
 arch/x86/virt/vmx/tdx/tdx.c | 11 +++++++++--
 arch/x86/virt/vmx/tdx/tdx.h |  3 ---
 3 files changed, 19 insertions(+), 6 deletions(-)

diff --git a/arch/x86/include/asm/tdx.h b/arch/x86/include/asm/tdx.h
index 191da84bbf2a1..187014686df3e 100644
--- a/arch/x86/include/asm/tdx.h
+++ b/arch/x86/include/asm/tdx.h
@@ -33,6 +33,10 @@
 #define TDX_SUCCESS		0ULL
 #define TDX_RND_NO_ENTROPY	0x8000020300000000ULL
 
+/* Bit definitions of TDX_FEATURES0 metadata field */
+#define TDX_FEATURES0_NO_RBP_MOD		BIT_ULL(18)
+#define TDX_FEATURES0_DYNAMIC_PAMT		BIT_ULL(36)
+
 #ifndef __ASSEMBLER__
 
 #include <uapi/asm/mce.h>
@@ -152,7 +156,12 @@ const struct tdx_sys_info *tdx_get_sysinfo(void);
 
 static inline bool tdx_supports_dynamic_pamt(const struct tdx_sys_info *sysinfo)
 {
-	return false; /* To be enabled when kernel is ready */
+	/*
+	 * The TDX Module's internal Dynamic PAMT tree structure can't
+	 * handle physical addresses with more than 48 bits.
+	 */
+	return sysinfo->features.tdx_features0 & TDX_FEATURES0_DYNAMIC_PAMT &&
+	       boot_cpu_data.x86_phys_bits <= 48;
 }
 
 /* Simple structure for pre-allocating Dynamic PAMT pages outside of locks. */
diff --git a/arch/x86/virt/vmx/tdx/tdx.c b/arch/x86/virt/vmx/tdx/tdx.c
index 3544794fb092a..75140511571bf 100644
--- a/arch/x86/virt/vmx/tdx/tdx.c
+++ b/arch/x86/virt/vmx/tdx/tdx.c
@@ -1028,8 +1028,9 @@ static __init int construct_tdmrs(struct list_head *tmb_list,
 	return ret;
 }
 
-static __init int config_tdx_module(struct tdmr_info_list *tdmr_list,
-				    u64 global_keyid)
+#define TDX_SYS_CONFIG_DYNAMIC_PAMT	BIT(16)
+
+static __init int config_tdx_module(struct tdmr_info_list *tdmr_list, u64 global_keyid)
 {
 	struct tdx_module_args args = {};
 	u64 *tdmr_pa_array;
@@ -1056,6 +1057,12 @@ static __init int config_tdx_module(struct tdmr_info_list *tdmr_list,
 	args.rcx = __pa(tdmr_pa_array);
 	args.rdx = tdmr_list->nr_consumed_tdmrs;
 	args.r8 = global_keyid;
+
+	if (tdx_supports_dynamic_pamt(&tdx_sysinfo)) {
+		pr_info("Enable Dynamic PAMT\n");
+		args.r8 |= TDX_SYS_CONFIG_DYNAMIC_PAMT;
+	}
+
 	ret = seamcall_prerr(TDH_SYS_CONFIG, &args);
 
 	/* Free the array as it is not required anymore. */
diff --git a/arch/x86/virt/vmx/tdx/tdx.h b/arch/x86/virt/vmx/tdx/tdx.h
index 8c39dde347cc2..68a68468fbeb6 100644
--- a/arch/x86/virt/vmx/tdx/tdx.h
+++ b/arch/x86/virt/vmx/tdx/tdx.h
@@ -86,9 +86,6 @@ struct tdmr_info {
 	DECLARE_FLEX_ARRAY(struct tdmr_reserved_area, reserved_areas);
 } __packed __aligned(TDMR_INFO_ALIGNMENT);
 
-/* Bit definitions of TDX_FEATURES0 metadata field */
-#define TDX_FEATURES0_NO_RBP_MOD	BIT(18)
-
 /*
  * Do not put any hardware-defined TDX structure representations below
  * this comment!
-- 
2.54.0

