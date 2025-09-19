Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59F6D314A99
	for <linux-coco@lists.linux.dev>; Fri, 19 Sep 2025 14:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758291768; cv=none; b=Upji0BEXwYYHchYtdu2j1YhhHnAWxzFVMd8U6Z8hdK6OIc6WR2IlkajPXSFNaQRPUQjtkQNp0uArkBGH5lprX3ABJufZboqcXQrxtOZQ7wPZFfneFXq47CteaOgcsG3Q3lvFLe9qK3qbIZAIBshhn5Vh5TyKo0kjx/+nTz0OF4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758291768; c=relaxed/simple;
	bh=9bQ7SBrlvyqvIykaQPGrECKlaL2TOtxOd2gV+gqqHrM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eY04JlgPXevFSNq1THXt7HppX8DcawOhUvph99G6F3Eqs9zuhM8bGIIbsLKV4ZlwO2HzKTG2URHWHV65zv+jwwfMN6Ot/MHWlwz+RoEZu40YgTKw9OYYe9nA6F+TsyOX6VVugFGorn/p28pWvKsYbvPoyChdeDdzWxGPy4rbaBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c7Pv47tj; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c7Pv47tj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758291766; x=1789827766;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9bQ7SBrlvyqvIykaQPGrECKlaL2TOtxOd2gV+gqqHrM=;
  b=c7Pv47tjx2zGN0rDYizwPfurU79LQXhwJFnYFSjzO8Eka1tUJ+P56j6R
   m6GZ3bgNkEWtK4kHjhRfefgALDDsL9ZE+1egDAxhHaq5QAzXqFfU7YjFm
   OJVYur/ZK7nB6C0xPWdumgrSGPybGtEQN9HPV9EcYvz4yTaFA/OchT8Nm
   985Su+WJ8bUWCrEKOOy/irnrR/BwA9cr1vjUIiDjLlOxlXUHR3g6Zy2CI
   0u8XEjvV6G4Feq4VBXwQud+sLkkj+mZkjLONESDIwTVKn1+ah85rQDfQ+
   OnJBND6Rne4lcflDj5o0Icl51LldOpqh3lnT/AyPoy78fwAu7/SevjNIw
   Q==;
X-CSE-ConnectionGUID: X3qB4YcES6GbRsQ/e2W66g==
X-CSE-MsgGUID: 4hJuxUUkR7WN6kOx6k/cdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11557"; a="60750554"
X-IronPort-AV: E=Sophos;i="6.18,278,1751266800"; 
   d="scan'208";a="60750554"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2025 07:22:39 -0700
X-CSE-ConnectionGUID: Ffigt/A3S/mPujQZx+kvWw==
X-CSE-MsgGUID: 103S+GggT86rxrQ6JuAi/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,278,1751266800"; 
   d="scan'208";a="176655041"
Received: from dwillia2-desk.jf.intel.com ([10.88.27.145])
  by fmviesa010.fm.intel.com with ESMTP; 19 Sep 2025 07:22:39 -0700
From: Dan Williams <dan.j.williams@intel.com>
To: linux-coco@lists.linux.dev,
	linux-pci@vger.kernel.org
Cc: xin@zytor.com,
	chao.gao@intel.com,
	Zhenzhong Duan <zhenzhong.duan@intel.com>,
	Xu Yilun <yilun.xu@linux.intel.com>
Subject: [RFC PATCH 16/27] x86/virt/tdx: Add SEAMCALL wrappers for trusted IOMMU setup and clear
Date: Fri, 19 Sep 2025 07:22:25 -0700
Message-ID: <20250919142237.418648-17-dan.j.williams@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250919142237.418648-1-dan.j.williams@intel.com>
References: <20250919142237.418648-1-dan.j.williams@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Zhenzhong Duan <zhenzhong.duan@intel.com>

Add SEAMCALLs to setup/clear trusted IOMMU for TDX Connect.

Enable TEE I/O support for a target device requires to setup trusted IOMMU
for the related IOMMU device first, even only for enabling physical secure
links like SPDM/IDE.

TDH.IOMMU.SETUP takes the register base address (VTBAR) to position an
IOMMU device, and outputs an IOMMU_ID as the trusted IOMMU identifier.
TDH.IOMMU.CLEAR takes the IOMMU_ID to reverse the setup.

More information see Intel TDX Connect ABI Specification [1]
Section 3.2 TDX Connect Host-Side (SEAMCALL) Interface Functions.

[1]: https://cdrdv2.intel.com/v1/dl/getContent/858625

Signed-off-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
Co-developed-by: Xu Yilun <yilun.xu@linux.intel.com>
Signed-off-by: Xu Yilun <yilun.xu@linux.intel.com>
Signed-off-by: Dan Williams <dan.j.williams@intel.com>
---
 arch/x86/include/asm/tdx.h  |  2 ++
 arch/x86/virt/vmx/tdx/tdx.c | 28 ++++++++++++++++++++++++++++
 arch/x86/virt/vmx/tdx/tdx.h |  2 ++
 3 files changed, 32 insertions(+)

diff --git a/arch/x86/include/asm/tdx.h b/arch/x86/include/asm/tdx.h
index 4aae56fa225f..5f2bc970cf25 100644
--- a/arch/x86/include/asm/tdx.h
+++ b/arch/x86/include/asm/tdx.h
@@ -223,6 +223,8 @@ u64 tdh_phymem_page_wbinvd_tdr(struct tdx_td *td);
 u64 tdh_phymem_page_wbinvd_hkid(u64 hkid, struct page *page);
 u64 tdh_ext_mem_add(struct tdx_page_array *pg_arr);
 u64 tdh_ext_init(void);
+u64 tdh_iommu_setup(u64 vtbar, struct tdx_page_array *iommu_mt, u64 *iommu_id);
+u64 tdh_iommu_clear(u64 iommu_id, struct tdx_page_array *iommu_mt);
 #else
 static inline void tdx_init(void) { }
 static inline int tdx_enable(void)  { return -ENODEV; }
diff --git a/arch/x86/virt/vmx/tdx/tdx.c b/arch/x86/virt/vmx/tdx/tdx.c
index 1061adcc041f..0f34009411fb 100644
--- a/arch/x86/virt/vmx/tdx/tdx.c
+++ b/arch/x86/virt/vmx/tdx/tdx.c
@@ -2362,3 +2362,31 @@ u64 tdh_ext_init(void)
 	return seamcall(TDH_EXT_INIT, &args);
 }
 EXPORT_SYMBOL_GPL(tdh_ext_init);
+
+u64 tdh_iommu_setup(u64 vtbar, struct tdx_page_array *iommu_mt, u64 *iommu_id)
+{
+	struct tdx_module_args args = {
+		.rcx = vtbar,
+		.rdx = page_to_phys(iommu_mt->root),
+	};
+	u64 r;
+
+	tdx_clflush_page_array(iommu_mt);
+
+	r = seamcall_ret(TDH_IOMMU_SETUP, &args);
+
+	*iommu_id = args.rcx;
+	return r;
+}
+EXPORT_SYMBOL_GPL(tdh_iommu_setup);
+
+u64 tdh_iommu_clear(u64 iommu_id, struct tdx_page_array *iommu_mt)
+{
+	struct tdx_module_args args = {
+		.rcx = iommu_id,
+		.rdx = page_to_phys(iommu_mt->root),
+	};
+
+	return seamcall_ret(TDH_IOMMU_CLEAR, &args);
+}
+EXPORT_SYMBOL_GPL(tdh_iommu_clear);
diff --git a/arch/x86/virt/vmx/tdx/tdx.h b/arch/x86/virt/vmx/tdx/tdx.h
index f4bcfec7fb86..13d11c8ad33d 100644
--- a/arch/x86/virt/vmx/tdx/tdx.h
+++ b/arch/x86/virt/vmx/tdx/tdx.h
@@ -48,6 +48,8 @@
 #define TDH_SYS_CONFIG			45
 #define TDH_EXT_INIT			60
 #define TDH_EXT_MEM_ADD			61
+#define TDH_IOMMU_SETUP			128
+#define TDH_IOMMU_CLEAR			129
 
 /*
  * SEAMCALL leaf:
-- 
2.51.0

