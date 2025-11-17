Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 007E925F988
	for <linux-coco@lists.linux.dev>; Mon, 17 Nov 2025 02:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763347134; cv=none; b=mVlUEXa67aiwK0pnaepRAp1MstiCeVZSrGB/id25isbi1tLhTMrrwxL/u1HGc+2ReLTnsikQlFJ1SF+RasmrDuTDLDnyJ/xq8NYvOfavj+iWMe7tpn3E/2t/1buCatYmJVVkllyOIz8m0zsCvP3/PqRh5Rb3C92b0vOzcmGGyRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763347134; c=relaxed/simple;
	bh=uxCecs1nDCkrmd0czu1Nrl/7Y0MJ7Nk9Dtyg4vxCWGc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UF69StYo/ZmD6heC62ZXHpKp/g82WsN9O5AogT/m60XDBZg0jYmlfy0rc3eemBOXyuh33JSHQQjJujk34e+xTcnZEY0FzqQIfZszko6hGy+HcYAmqfNvMt7SVNEN2rXDJ4gqLSUAGC+EdhXVNT+JbQDFPZparMq5VGEGL/Lzu9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SQAoUWVk; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SQAoUWVk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763347133; x=1794883133;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=uxCecs1nDCkrmd0czu1Nrl/7Y0MJ7Nk9Dtyg4vxCWGc=;
  b=SQAoUWVkqgMUdcposDD9uJaRaOV7ne3a/BLFqzZXW99E/M0e4OdU+Vl9
   pz8+zc+znI8t5Z4U2gzBuNsRxlORku+ER5cvLlMhRFD3sqXB5TzWoc1W2
   /2YaoWEM7KbMg4ZuqI/EPUZ2Yd2EJpp02uj6esMFhdZ98dsAH21GcafVr
   5VWSXfDV7K4j21p5SBL/BZhgEdIsE53DCBje+Fx+v8B4OzSo4prR8I0wv
   GaiSls70IviCvUjY8LqNsbv5fk6loQZ34VX3Tcus/+5UEeI/7G8v63TDz
   5j6jETQfda6o92nzkFwfmrONRnpj9Jh8CzTDu1DJ161imgE/QJSp22X6I
   Q==;
X-CSE-ConnectionGUID: hNtoizXHR+yheG394Vrw2g==
X-CSE-MsgGUID: rW71KnfaS3u5i0vKZoOPjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11615"; a="82729576"
X-IronPort-AV: E=Sophos;i="6.19,310,1754982000"; 
   d="scan'208";a="82729576"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2025 18:38:53 -0800
X-CSE-ConnectionGUID: 9R+uPU7iT1GCqhxgSLF+KA==
X-CSE-MsgGUID: NPKkwfdqTAOFzgnOmWBoMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,310,1754982000"; 
   d="scan'208";a="227658345"
Received: from yilunxu-optiplex-7050.sh.intel.com ([10.239.159.165])
  by orviesa001.jf.intel.com with ESMTP; 16 Nov 2025 18:38:49 -0800
From: Xu Yilun <yilun.xu@linux.intel.com>
To: linux-coco@lists.linux.dev,
	linux-pci@vger.kernel.org
Cc: chao.gao@intel.com,
	dave.jiang@intel.com,
	baolu.lu@linux.intel.com,
	yilun.xu@linux.intel.com,
	yilun.xu@intel.com,
	zhenzhong.duan@intel.com,
	kvm@vger.kernel.org,
	rick.p.edgecombe@intel.com,
	dave.hansen@linux.intel.com,
	dan.j.williams@intel.com,
	kas@kernel.org,
	x86@kernel.org
Subject: [PATCH v1 16/26] x86/virt/tdx: Add a helper to loop on TDX_INTERRUPTED_RESUMABLE
Date: Mon, 17 Nov 2025 10:23:00 +0800
Message-Id: <20251117022311.2443900-17-yilun.xu@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251117022311.2443900-1-yilun.xu@linux.intel.com>
References: <20251117022311.2443900-1-yilun.xu@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a helper to handle SEAMCALL return code TDX_INTERRUPTED_RESUMABLE.

SEAMCALL returns TDX_INTERRUPTED_RESUMABLE to avoid stalling host for
long time. After host has handled the interrupt, it calls the
interrupted SEAMCALL again and TDX Module continues to execute. TDX
Module made progress in this case and would eventually finish. An
infinite loop in host should be safe.

The helper is for SEAMCALL wrappers which output information by using
seamcall_ret() or seamcall_saved_ret(). The 2 functions overwrite input
arguments by outputs but much SEAMCALLs expect the same inputs to
resume.

The helper is not for special cases where the SEAMCALL expects modified
inputs to resume. The helper is also not for SEAMCALLs with no output,
do {...} while (r == TDX_INTERRUPTED_RESUMABLE) just works.

Signed-off-by: Xu Yilun <yilun.xu@linux.intel.com>
---
 arch/x86/virt/vmx/tdx/tdx.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/x86/virt/vmx/tdx/tdx.c b/arch/x86/virt/vmx/tdx/tdx.c
index 46cdb5aaaf68..7bc2c900a8a8 100644
--- a/arch/x86/virt/vmx/tdx/tdx.c
+++ b/arch/x86/virt/vmx/tdx/tdx.c
@@ -2003,6 +2003,29 @@ static inline u64 tdx_tdr_pa(struct tdx_td *td)
 	return page_to_phys(td->tdr_page);
 }
 
+static u64 __maybe_unused __seamcall_ir_resched(sc_func_t sc_func, u64 fn,
+						struct tdx_module_args *args)
+{
+	struct tdx_module_args _args;
+	u64 r;
+
+	while (1) {
+		_args = *(args);
+		r = sc_retry(sc_func, fn, &_args);
+		if (r != TDX_INTERRUPTED_RESUMABLE)
+			break;
+
+		cond_resched();
+	}
+
+	*args = _args;
+
+	return r;
+}
+
+#define seamcall_ret_ir_resched(fn, args)	\
+	__seamcall_ir_resched(__seamcall_ret, fn, args)
+
 noinstr u64 tdh_vp_enter(struct tdx_vp *td, struct tdx_module_args *args)
 {
 	args->rcx = td->tdvpr_pa;
-- 
2.25.1

