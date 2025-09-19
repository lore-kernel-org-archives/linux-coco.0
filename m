Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2127313D54
	for <linux-coco@lists.linux.dev>; Fri, 19 Sep 2025 14:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758291772; cv=none; b=YPKj+IBgaWqpZHaLhsQAWciE1kJF12G9o6RjKteGZbpA8lsVkGI14gzYt5pS7/Hx5/jg+iXBiOsLhT+SKJv8YsEgb27Ilcvjy5OYvsmKyRndHvIqQ/8293ayfjRbbKDZoqh986DRkMrsVEAX7/mDaYn/zVSL2xC+bSuGopBZE6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758291772; c=relaxed/simple;
	bh=4zUw67ndeXVhVWEk0qI61EPpMIM5yMbCG8feHg3bE/4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gk1TTIIVsEIhTGFhX5HXEf8h7T1bDDEVdB/QieioXmT3+L+h2Iq56H9svjk9/5gTaGhoi/kMfWwUykhK4mB7WK3PwEFEZLjEVW3W9MRYch3+ZV6bojXpLB4h5tzikcF4VWuMQyXzjLn7zecuilqzwuaCvGc5pRIZBamzNGXqkwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ccgVs0VY; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ccgVs0VY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758291770; x=1789827770;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4zUw67ndeXVhVWEk0qI61EPpMIM5yMbCG8feHg3bE/4=;
  b=ccgVs0VYNVK5HQVDtMV/1fpRCRXQ5TSOsr/hoNhtUWQL53LAzaKQJtgx
   ARDgRCMJQ7L29qW4Z2P/hfQNMmNzL5/RcIEwLRVgFyPAtnTaXSrcc2UnB
   R398w+E0gexbg/qEV/7SDzC7izSv2YhpfsIbOUw84EatEmIHpMr9Kuxsq
   Ias27PrDk7+fY5cW6HMRJ4pQh6SeP3jBdOHI37ibSCAKgfssVAFYNMuDM
   NtWHC8mJ7coxpTmSKv2twRWMdj505vR1k52UDDHKY4KEZKKEQKPha/Bmh
   UN/CZcRQPiSc144MVLHB3Hsr03n1U4nNSLs8EN65E3McBH9EPBo3InFcZ
   A==;
X-CSE-ConnectionGUID: v5VPP9uMQba+tDuPxDvGDg==
X-CSE-MsgGUID: lSzKB9UrS8K9UhSMmU9Iww==
X-IronPort-AV: E=McAfee;i="6800,10657,11557"; a="60750586"
X-IronPort-AV: E=Sophos;i="6.18,278,1751266800"; 
   d="scan'208";a="60750586"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2025 07:22:41 -0700
X-CSE-ConnectionGUID: LabCWNiIRjqRa/+WWathLw==
X-CSE-MsgGUID: Dr7OtJlASAC48bo5zMtrWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,278,1751266800"; 
   d="scan'208";a="176655071"
Received: from dwillia2-desk.jf.intel.com ([10.88.27.145])
  by fmviesa010.fm.intel.com with ESMTP; 19 Sep 2025 07:22:41 -0700
From: Dan Williams <dan.j.williams@intel.com>
To: linux-coco@lists.linux.dev,
	linux-pci@vger.kernel.org
Cc: xin@zytor.com,
	chao.gao@intel.com,
	Xu Yilun <yilun.xu@linux.intel.com>
Subject: [RFC PATCH 26/27] x86/virt/tdx: Add SEAMCALL wrappers for IDE stream management
Date: Fri, 19 Sep 2025 07:22:35 -0700
Message-ID: <20250919142237.418648-27-dan.j.williams@intel.com>
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

From: Xu Yilun <yilun.xu@linux.intel.com>

Add several SEAMCALL wrappers for IDE stream management.

- TDH.IDE.STREAM.CREATE creates IDE stream metadata buffers for TDX
  Module, and does root port side IDE configuration.
- TDH.IDE.STREAM.BLOCK clears the root port side IDE configuration.
- TDH.IDE.STREAM.DELETE releases the IDE stream metadata buffers.
- TDH.IDE.STREAM.KM deals with the IDE Key Management protocol (IDE-KM)

More information see Intel TDX Connect ABI Specification [1]
Section 3.2 TDX Connect Host-Side (SEAMCALL) Interface Functions.

[1]: https://cdrdv2.intel.com/v1/dl/getContent/858625

Signed-off-by: Xu Yilun <yilun.xu@linux.intel.com>
Signed-off-by: Dan Williams <dan.j.williams@intel.com>
---
 arch/x86/include/asm/tdx.h  | 14 ++++++
 arch/x86/virt/vmx/tdx/tdx.c | 91 +++++++++++++++++++++++++++++++++++++
 arch/x86/virt/vmx/tdx/tdx.h |  4 ++
 3 files changed, 109 insertions(+)

diff --git a/arch/x86/include/asm/tdx.h b/arch/x86/include/asm/tdx.h
index 97e0d7a1f38d..a10e6a08874c 100644
--- a/arch/x86/include/asm/tdx.h
+++ b/arch/x86/include/asm/tdx.h
@@ -236,6 +236,20 @@ u64 tdh_spdm_disconnect(u64 spdm_id, struct page *spdm_rsp,
 u64 tdh_spdm_mng(u64 spdm_id, u64 spdm_op, struct page *spdm_param,
 		 struct page *spdm_rsp, struct page *spdm_req,
 		 struct tdx_page_array *spdm_out, u64 *spdm_req_or_out_len);
+u64 tdh_ide_stream_create(u64 stream_info, u64 spdm_id,
+			  struct tdx_page_array *stream_mt, u64 stream_ctrl,
+			  u64 rid_assoc1, u64 rid_assoc2,
+			  u64 addr_assoc1, u64 addr_assoc2,
+			  u64 addr_assoc3,
+			  u64 *stream_id,
+			  u64 *rp_ide_id);
+u64 tdh_ide_stream_block(u64 spdm_id, u64 stream_id);
+u64 tdh_ide_stream_delete(u64 spdm_id, u64 stream_id,
+			  struct tdx_page_array *stream_mt,
+			  unsigned int *nr_released, u64 *released_hpa);
+u64 tdh_ide_stream_km(u64 spdm_id, u64 stream_id, u64 operation,
+		      struct page *spdm_rsp, struct page *spdm_req,
+		      u64 *spdm_req_len);
 #else
 static inline void tdx_init(void) { }
 static inline int tdx_enable(void)  { return -ENODEV; }
diff --git a/arch/x86/virt/vmx/tdx/tdx.c b/arch/x86/virt/vmx/tdx/tdx.c
index 86dd855d7361..179c976eab01 100644
--- a/arch/x86/virt/vmx/tdx/tdx.c
+++ b/arch/x86/virt/vmx/tdx/tdx.c
@@ -2523,3 +2523,94 @@ u64 tdh_spdm_mng(u64 spdm_id, u64 spdm_op, struct page *spdm_param,
 	return r;
 }
 EXPORT_SYMBOL_GPL(tdh_spdm_mng);
+
+u64 tdh_ide_stream_create(u64 stream_info, u64 spdm_id,
+			  struct tdx_page_array *stream_mt, u64 stream_ctrl,
+			  u64 rid_assoc1, u64 rid_assoc2,
+			  u64 addr_assoc1, u64 addr_assoc2,
+			  u64 addr_assoc3,
+			  u64 *stream_id,
+			  u64 *rp_ide_id)
+{
+	struct tdx_module_args args = {
+		.rcx = stream_info,
+		.rdx = spdm_id,
+		.r8 = hpa_array_t_assign_raw(stream_mt),
+		.r9 = stream_ctrl,
+		.r10 = rid_assoc1,
+		.r11 = rid_assoc2,
+		.r12 = addr_assoc1,
+		.r13 = addr_assoc2,
+		.r14 = addr_assoc3,
+	};
+	u64 r;
+
+	tdx_clflush_page_array(stream_mt);
+
+	r = seamcall_saved_ret(TDH_IDE_STREAM_CREATE, &args);
+
+	*stream_id = args.rcx;
+	*rp_ide_id = args.rdx;
+
+	return r;
+}
+EXPORT_SYMBOL_GPL(tdh_ide_stream_create);
+
+u64 tdh_ide_stream_block(u64 spdm_id, u64 stream_id)
+{
+	struct tdx_module_args args = {
+		.rcx = spdm_id,
+		.rdx = stream_id,
+	};
+	u64 r;
+
+	r = seamcall(TDH_IDE_STREAM_BLOCK, &args);
+
+	return r;
+}
+EXPORT_SYMBOL_GPL(tdh_ide_stream_block);
+
+u64 tdh_ide_stream_delete(u64 spdm_id, u64 stream_id,
+			  struct tdx_page_array *stream_mt,
+			  unsigned int *nr_released, u64 *released_hpa)
+{
+	struct tdx_module_args args = {
+		.rcx = spdm_id,
+		.rdx = stream_id,
+		.r8 = hpa_array_t_release_raw(stream_mt),
+	};
+	union hpa_array_t released;
+	u64 r;
+
+	r = seamcall_ret(TDH_IDE_STREAM_DELETE, &args);
+	if (r < 0)
+		return r;
+
+	released.raw = args.rcx;
+	*nr_released = released.array_size + 1;
+	*released_hpa = released.pfn << PAGE_SHIFT;
+
+	return r;
+}
+EXPORT_SYMBOL_GPL(tdh_ide_stream_delete);
+
+u64 tdh_ide_stream_km(u64 spdm_id, u64 stream_id, u64 operation,
+		      struct page *spdm_rsp, struct page *spdm_req,
+		      u64 *spdm_req_len)
+{
+	struct tdx_module_args args = {
+		.rcx = spdm_id,
+		.rdx = stream_id,
+		.r8 = operation,
+		.r9 = page_to_phys(spdm_rsp),
+		.r10 = page_to_phys(spdm_req),
+	};
+	u64 r;
+
+	r = seamcall_ret(TDH_IDE_STREAM_KM, &args);
+
+	*spdm_req_len = args.rcx;
+
+	return r;
+}
+EXPORT_SYMBOL_GPL(tdh_ide_stream_km);
diff --git a/arch/x86/virt/vmx/tdx/tdx.h b/arch/x86/virt/vmx/tdx/tdx.h
index eb67fd9d1f55..3f73926aebec 100644
--- a/arch/x86/virt/vmx/tdx/tdx.h
+++ b/arch/x86/virt/vmx/tdx/tdx.h
@@ -52,6 +52,10 @@
 #define TDH_IOMMU_CLEAR			129
 #define TDH_SPDM_CREATE			130
 #define TDH_SPDM_DELETE			131
+#define TDH_IDE_STREAM_CREATE		132
+#define TDH_IDE_STREAM_BLOCK		133
+#define TDH_IDE_STREAM_DELETE		134
+#define TDH_IDE_STREAM_KM		135
 #define TDH_SPDM_CONNECT		142
 #define TDH_SPDM_DISCONNECT		143
 #define TDH_SPDM_MNG			144
-- 
2.51.0

