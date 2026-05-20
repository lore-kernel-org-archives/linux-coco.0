Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CB653F0746
	for <linux-coco@lists.linux.dev>; Wed, 20 May 2026 13:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779284438; cv=none; b=IBNUcI61ttw3zzekHyEgRoz0KsHyMWAL50TSPRswNioJ1f0Ilo/BcegSkotjOtayzM2++qKb43G4jtzKF60lEaRwjAfY77rxDoqpXV2vJkqdB/c1F2E+oTxkiIWLtNuEWUSxLye9rlLzAuCA4iw1ghz89Zv5XFIoc4mLUURmSyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779284438; c=relaxed/simple;
	bh=NKjcSYXRbvLTovLssfzj1NQJ+Uo5FfLtMzRr4pePg8w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aCuDmwxJMjPuQgQBhTld8xTrr7Qg5VJtMBlFYZxdcl1cuqm7uz2AZSvt3QhFCMn//eZKAUFidjA+ETGdGraTHn3VJ++NnWwq63alOHuydbkJbBGSOMCjuxuY9+SGuZePt7xiORH+oRaTvV5awGf3MLj50MLX7038oLypI2UJF4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PHbSEMHk; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PHbSEMHk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779284437; x=1810820437;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=NKjcSYXRbvLTovLssfzj1NQJ+Uo5FfLtMzRr4pePg8w=;
  b=PHbSEMHkiX/FZ9lOyDHkiW2YjYK/2ZIzbR6e25DvUMMGUhZEwmUbekJD
   Zo+3DUKxdmyiGh48VbGoyfYNILl0meY+cWuOXdcYH3Z+i+EGJiKU69p84
   UCfaguZ/OACMrj72FWlZpKXYLJVw4Spi41jwuvrNw/KYHvF1isoK230fZ
   gES66dfpQc2i14kSXFCKu3SEzr03nLC/uNyZnwRsmO3v7xuYo3YIqhI8Q
   k1KnqiAkUc12fhlobuPlYVS8z2vSEX0f5eIxHzuTbttz1JyHlGsIpKjP4
   mVg4k8YPcHl7MnrPKGL0geY6UIB9sPVvqEwixXYMY+4zL+wR4J8Vajnba
   g==;
X-CSE-ConnectionGUID: QMR6fmL3SYS7E9f+IOQJvQ==
X-CSE-MsgGUID: jowAlEP4RT298vCEPYHW0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="80146659"
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; 
   d="scan'208";a="80146659"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2026 06:40:36 -0700
X-CSE-ConnectionGUID: ITYUc7h9Q1CJT03wVv5gaQ==
X-CSE-MsgGUID: HvAYQfPUQQ+r6RIp3MPTHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; 
   d="scan'208";a="235924045"
Received: from 984fee019967.jf.intel.com ([10.23.153.244])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2026 06:40:35 -0700
From: Chao Gao <chao.gao@intel.com>
To: kvm@vger.kernel.org,
	linux-coco@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: binbin.wu@linux.intel.com,
	dave.hansen@linux.intel.com,
	djbw@kernel.org,
	ira.weiny@intel.com,
	kai.huang@intel.com,
	kas@kernel.org,
	nik.borisov@suse.com,
	paulmck@kernel.org,
	pbonzini@redhat.com,
	reinette.chatre@intel.com,
	rick.p.edgecombe@intel.com,
	sagis@google.com,
	seanjc@google.com,
	tony.lindgren@linux.intel.com,
	vannapurve@google.com,
	vishal.l.verma@intel.com,
	yilun.xu@linux.intel.com,
	xiaoyao.li@intel.com,
	yan.y.zhao@intel.com,
	Chao Gao <chao.gao@intel.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH v10 23/25] x86/virt/tdx: Enable TDX module runtime updates
Date: Wed, 20 May 2026 06:38:26 -0700
Message-ID: <20260520133909.409394-24-chao.gao@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260520133909.409394-1-chao.gao@intel.com>
References: <20260520133909.409394-1-chao.gao@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

All pieces of TDX module runtime updates are in place. Enable it if it
is supported.

Signed-off-by: Chao Gao <chao.gao@intel.com>
Reviewed-by: Xu Yilun <yilun.xu@linux.intel.com>
Reviewed-by: Tony Lindgren <tony.lindgren@linux.intel.com>
Reviewed-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
Reviewed-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
---
 arch/x86/include/asm/tdx.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/include/asm/tdx.h b/arch/x86/include/asm/tdx.h
index 282cb0e08b8e..c848483d815f 100644
--- a/arch/x86/include/asm/tdx.h
+++ b/arch/x86/include/asm/tdx.h
@@ -34,6 +34,7 @@
 #define TDX_UPDATE_COMPAT_SENSITIVE	0x8000051200000000ULL
 
 /* Bit definitions of TDX_FEATURES0 metadata field */
+#define TDX_FEATURES0_TD_PRESERVING	BIT_ULL(1)
 #define TDX_FEATURES0_NO_RBP_MOD	BIT_ULL(18)
 
 #ifndef __ASSEMBLER__
@@ -114,8 +115,7 @@ const struct tdx_sys_info *tdx_get_sysinfo(void);
 
 static inline bool tdx_supports_runtime_update(const struct tdx_sys_info *sysinfo)
 {
-	/* To be enabled when kernel is ready. */
-	return false;
+	return sysinfo->features.tdx_features0 & TDX_FEATURES0_TD_PRESERVING;
 }
 
 int tdx_guest_keyid_alloc(void);
-- 
2.52.0

