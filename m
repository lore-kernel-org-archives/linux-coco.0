Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E27421104
	for <linux-coco@lists.linux.dev>; Sun, 12 May 2024 12:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715516524; cv=none; b=lfdPRyOUSb9iHj1E8kQyhh/YFptwFkNYIsbhfmHHlvxB+rweYThSpj9DCIEtqoKihGyef01IYrYGHORsBFlura3p4QRSJQLEjUjuP5i/c1tR4m2fG8HxCW4zyt70nHXs9eAZTLOQk4EXQoM3m0Hj0uc8OgbRxKhiKS2BQDYm++c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715516524; c=relaxed/simple;
	bh=6OozzRL9Ac8RminZLGX0NityVv8OgHFWYl7lEm738KY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IaD4u12zmND4KFXWSPoqLQt1qVoKxo3OmQoAxqpedtDixXOZac8Ah35XA7OBcAgJT/7+TFwcC5xS5p93rTY+Vk39u69X6Bf/Dy0+0J1ym7IpGuCHgu0fXA6H9JWv3E7h44dHpnRtEqAVF48kPSsexJP5Fy4yDGvWw9NdmrCxvmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.helo=mgamail.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P6V78zv1; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.helo=mgamail.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P6V78zv1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715516523; x=1747052523;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6OozzRL9Ac8RminZLGX0NityVv8OgHFWYl7lEm738KY=;
  b=P6V78zv1Qb29KgquIHJxFxSlREt7JGw03FJqMM06ltTol5SdsF96rWIQ
   hCCBKZFXu/TTfYM/uq7lxFgglpJeJHvxMvTzWiYT/Wxv3hDGya1Hi9qrQ
   FQlqAVrniBhErj5+PYtK5cgLPv42AUdGC7Vl7OI7D56q/CYhbkTjTQ0ik
   Mh1xaDUcx2JPqsEauAw0xOws9LFg3NoEfrC+JACbPpQkjpT+/Pay1VEEi
   thBGS7GznkCd2slazBL5TmYNZ2/yyxcJCpUcMY0ts06vtnZEEC1F9HIco
   77b2PKaAyDD+0s0AtAlb6VFX9hY7eFubTj8dVnczxt9PTdatM07ueCoCY
   g==;
X-CSE-ConnectionGUID: FGsvQfm5Q7qMmpfk0Zikeg==
X-CSE-MsgGUID: kQ+mjFf4SGuFUIgG2RBgXA==
X-IronPort-AV: E=McAfee;i="6600,9927,11071"; a="11594203"
X-IronPort-AV: E=Sophos;i="6.08,155,1712646000"; 
   d="scan'208";a="11594203"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2024 05:22:02 -0700
X-CSE-ConnectionGUID: 3tizv2yDTRO6W5TGaqJsUQ==
X-CSE-MsgGUID: 5e9xAJobSmCweaAA/TZMbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,155,1712646000"; 
   d="scan'208";a="61258786"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa001.fm.intel.com with ESMTP; 12 May 2024 05:21:59 -0700
Received: by black.fi.intel.com (Postfix, from userid 1000)
	id 163BFA5; Sun, 12 May 2024 15:21:58 +0300 (EEST)
From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>
Cc: linux-coco@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Kai Huang <kai.huang@intel.com>,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
	stable@vger.kernel.org
Subject: [PATCHv4 1/4] x86/tdx: Factor out TD metadata write TDCALL
Date: Sun, 12 May 2024 15:21:51 +0300
Message-ID: <20240512122154.2655269-2-kirill.shutemov@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240512122154.2655269-1-kirill.shutemov@linux.intel.com>
References: <20240512122154.2655269-1-kirill.shutemov@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The TDG_VM_WR TDCALL is used to ask the TDX module to change some
TD-specific VM configuration. There is currently only one user in the
kernel of this TDCALL leaf.  More will be added shortly.

Refactor to make way for more users of TDG_VM_WR who will need to modify
other TD configuration values.

Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
Reviewed-by: Kai Huang <kai.huang@intel.com>
Reviewed-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Cc: stable@vger.kernel.org
---
 arch/x86/coco/tdx/tdx.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/arch/x86/coco/tdx/tdx.c b/arch/x86/coco/tdx/tdx.c
index b556cbcc847e..4bb786dcd6b4 100644
--- a/arch/x86/coco/tdx/tdx.c
+++ b/arch/x86/coco/tdx/tdx.c
@@ -77,6 +77,18 @@ static inline void tdcall(u64 fn, struct tdx_module_args *args)
 		panic("TDCALL %lld failed (Buggy TDX module!)\n", fn);
 }
 
+/* Write TD-scoped metadata */
+static inline u64 tdg_vm_wr(u64 field, u64 value, u64 mask)
+{
+	struct tdx_module_args args = {
+		.rdx = field,
+		.r8 = value,
+		.r9 = mask,
+	};
+
+	return __tdcall(TDG_VM_WR, &args);
+}
+
 /**
  * tdx_mcall_get_report0() - Wrapper to get TDREPORT0 (a.k.a. TDREPORT
  *                           subtype 0) using TDG.MR.REPORT TDCALL.
@@ -901,10 +913,6 @@ static void tdx_kexec_finish(void)
 
 void __init tdx_early_init(void)
 {
-	struct tdx_module_args args = {
-		.rdx = TDCS_NOTIFY_ENABLES,
-		.r9 = -1ULL,
-	};
 	u64 cc_mask;
 	u32 eax, sig[3];
 
@@ -923,7 +931,7 @@ void __init tdx_early_init(void)
 	cc_set_mask(cc_mask);
 
 	/* Kernel does not use NOTIFY_ENABLES and does not need random #VEs */
-	tdcall(TDG_VM_WR, &args);
+	tdg_vm_wr(TDCS_NOTIFY_ENABLES, 0, -1ULL);
 
 	/*
 	 * All bits above GPA width are reserved and kernel treats shared bit
-- 
2.43.0

