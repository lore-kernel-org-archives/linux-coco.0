Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D00310E3
	for <linux-coco@lists.linux.dev>; Fri, 13 Sep 2024 00:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726187182; cv=none; b=rA3X7uqa5aRfcAfzRz8dNtVGevJ7vOIm9wCE57PBMFmXp+GKBuXzqPqRn5XUhE9rEGjGB579inVl8UgBeO/U+ovN1zsB1r4VrwEv8qYZba2F4g6XZy3yHlHxh0UjlKwi2mww+gDqht9oWW3wO4NfEKYrtluN1w++0f12+Kysz7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726187182; c=relaxed/simple;
	bh=yloFuvnpAfEBlxM8T2rNrxO3AZISOkXtU59Jg0rV9oU=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tJZb2IMehDySqkJqMLZBEBAyjo5pfFzJ7Zd13MmHayGK6/yWPFBWO1J3IOUPeln8Wg9bW+PWB8+dve8Q6KSUlY63Ph8ChPUTxpmulK5QIPpVYtpJVEhWl3qKjV1pJ0GnSNQr7BToj58Vxqk/Ko9c1+dvkaOTXs8ggAhmQBlOr1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PTiRMkh1; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PTiRMkh1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726187181; x=1757723181;
  h=subject:from:to:cc:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yloFuvnpAfEBlxM8T2rNrxO3AZISOkXtU59Jg0rV9oU=;
  b=PTiRMkh1xTF8EdkOwVDRnhHFy7gBtAOKtY3JS7YUfaMwKYb1wKdkafEX
   WRCgH/jkVusuaftjZZl+Mrr8f3WNmJpLBnx1NKt509UQQdAfzxVzdtm3x
   Az9mJa6U6vE8P0cjtgL5mfOZf8k9y1tClKStS/LYAFFdlJmaAPYgf51ap
   0Eddkq61vMu+IDEav6r//tAgl44UPc4zAn3E+CZfVbT+7dHjBJaMjbEIV
   4NZBpoZQoW5szMRigA2X+xWRtXXgdxwGLEVwwunWfM5l7OYwmzejGBWc9
   X+mVIFuXBj79z6dvWMMntgGV1897Q2UXnnLL2l4sBZSUNnBemsuDWcxat
   g==;
X-CSE-ConnectionGUID: NjWmJ73MQtWTc6VlbMpkCQ==
X-CSE-MsgGUID: RRt9oI0uS5qE5XOAAcP0xQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11193"; a="27990466"
X-IronPort-AV: E=Sophos;i="6.10,224,1719903600"; 
   d="scan'208";a="27990466"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2024 17:26:20 -0700
X-CSE-ConnectionGUID: i9Mv2TYiQTyX33C9En8erg==
X-CSE-MsgGUID: dyC5S2ybQPmdmGxZ0YlNxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,224,1719903600"; 
   d="scan'208";a="67970166"
Received: from inaky-mobl1.amr.corp.intel.com (HELO dwillia2-xfh.jf.intel.com) ([10.125.108.106])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2024 17:26:20 -0700
Subject: [PATCH 3/4] x86/tdx: Introduce guest global metadata retrieval
 infrastructure
From: Dan Williams <dan.j.williams@intel.com>
To: linux-coco@lists.linux.dev
Cc: Kai Huang <kai.huang@intel.com>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, aik@amd.com,
 elena.reshetova@intel.com, pgonda@google.com
Date: Thu, 12 Sep 2024 17:26:18 -0700
Message-ID: <172618717675.516322.6087817418162288917.stgit@dwillia2-xfh.jf.intel.com>
In-Reply-To: <172618715121.516322.9909313629463814714.stgit@dwillia2-xfh.jf.intel.com>
References: <172618715121.516322.9909313629463814714.stgit@dwillia2-xfh.jf.intel.com>
User-Agent: StGit/0.18-3-g996c
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

Similar to the host side [1], build some macro helpers for retrieving
global metadata fields.

This infrastructure is overkill if the guest only ends up consuming a
few fields of metadata. Some of the overhead reduced later by
refactoring the TDH_SYS_RD (host side) infrastructure to optionally
support TDG_SYS_RD (guest side) as an alternate low-level transport.

If this moves forward, expect that it is rebased on the host side
metadata patches to share infrastructure.

Link: http://lore.kernel.org/cover.1724741926.git.kai.huang@intel.com [1]
Cc: Kai Huang <kai.huang@intel.com>
Cc: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: x86@kernel.org
Signed-off-by: Dan Williams <dan.j.williams@intel.com>
---
 arch/x86/coco/tdx/tdx.c           |   39 +++++++++++++++++++++++++++++++++++++
 arch/x86/include/asm/shared/tdx.h |    9 +++++++++
 2 files changed, 48 insertions(+)

diff --git a/arch/x86/coco/tdx/tdx.c b/arch/x86/coco/tdx/tdx.c
index 078e2bac2553..270da751eb24 100644
--- a/arch/x86/coco/tdx/tdx.c
+++ b/arch/x86/coco/tdx/tdx.c
@@ -922,6 +922,42 @@ static void tdx_kexec_finish(void)
 	}
 }
 
+static void tdg_sys_rd(u64 field_id, u64 *data)
+{
+	struct tdx_module_args args = {};
+
+	/*
+	 * TDG.SYS.RD -- reads one global metadata field
+	 *  - RDX (in): the field to read
+	 *  - R8 (out): the field data
+	 */
+	args.rdx = field_id;
+	tdcall(TDG_SYS_RD, &args);
+	*data = args.r8;
+}
+
+#define build_tdg_sys_rd(size)                                          \
+	static __init void tdg_sys_rd##size(u64 field_id, u##size *val) \
+	{                                                               \
+		u64 tmp;                                                \
+									\
+		tdg_sys_rd(field_id, &tmp);                             \
+		*val = tmp;                                             \
+	}
+
+build_tdg_sys_rd(64);
+build_tdg_sys_rd(8);
+
+/* TODO: move these to a shared host/guest location */
+#define MD_FIELD_ID_NUM_TDX_FEATURES 0x0A00000000000001ULL
+#define MD_FIELD_ID_TDX_FEATURES0 0x0A00000300000008ULL
+
+struct tdg_sys_info_features tdg_sys_info_features __ro_after_init;
+EXPORT_SYMBOL(tdg_sys_info_features);
+
+#define READ_SYS_INFO_FEATURES(_id, _member, _size) \
+	tdg_sys_rd##_size(MD_FIELD_ID_##_id, &tdg_sys_info_features._member)
+
 void __init tdx_early_init(void)
 {
 	struct tdx_module_args args = {
@@ -995,5 +1031,8 @@ void __init tdx_early_init(void)
 	 */
 	x86_cpuinit.parallel_bringup = false;
 
+	READ_SYS_INFO_FEATURES(NUM_TDX_FEATURES, num_tdx_features, 8);
+	READ_SYS_INFO_FEATURES(TDX_FEATURES0, features0, 64);
+
 	pr_info("Guest detected\n");
 }
diff --git a/arch/x86/include/asm/shared/tdx.h b/arch/x86/include/asm/shared/tdx.h
index fdfd41511b02..0b7e408104d3 100644
--- a/arch/x86/include/asm/shared/tdx.h
+++ b/arch/x86/include/asm/shared/tdx.h
@@ -17,6 +17,7 @@
 #define TDG_MR_REPORT			4
 #define TDG_MEM_PAGE_ACCEPT		6
 #define TDG_VM_WR			8
+#define TDG_SYS_RD			11
 
 /* TDCS fields. To be used by TDG.VM.WR and TDG.VM.RD module calls */
 #define TDCS_NOTIFY_ENABLES		0x9100000000000010
@@ -121,6 +122,14 @@ void __noreturn __tdx_hypercall_failed(void);
 
 bool tdx_accept_memory(phys_addr_t start, phys_addr_t end);
 
+extern struct tdg_sys_info_features {
+	u8 num_tdx_features;
+	u64 features0;
+} tdg_sys_info_features;
+
+#define TDX_FEATURE_TD_PRESERVING_BIT 1
+#define TDX_FEATURE_TD_PRESERVING BIT(TDX_FEATURE_TD_PRESERVING_BIT)
+
 /*
  * The TDG.VP.VMCALL-Instruction-execution sub-functions are defined
  * independently from but are currently matched 1:1 with VMX EXIT_REASONs.

