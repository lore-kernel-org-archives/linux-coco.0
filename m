Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F68239CCEA
	for <linux-coco@lists.linux.dev>; Thu, 24 Sep 2026 04:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790223052; cv=none; b=mWpfcHEmK26Byk1+yI9GtXw78q8sjIWbKLrWxJH2lDMY/4EpQAZgZiUFefZ8qMa3qemZ0vzoSO4TJh2eyg6L8bCBgIZTljpITuJeb+Iaqk6GOD1ZsfRiNgekMX8fGkQJyI5g8jH8+qdiSVIje+12Wltz7oyGmShe6hicP0HwtDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790223052; c=relaxed/simple;
	bh=Ub9M8W0igL+Wh+cmM97paJ6vkhusw5V4SKPrJ1aKoqI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SidHYvYATgvCapudV3aTEsaSUllhawXhAW+ZlHyuzzL5joro2HZaZ0X3+mCuzNxwBgJleh7kP1wV4NEcVmeuiWXWkRyGovnC6VYHJjer7UblAWRyvF7L2vZHU+5fA72/tPWWyLcfiFEwPXPfJjn7ul77pap9vJynBXhmFP7wlbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CuTPnHi2; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CuTPnHi2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790223050; x=1821759050;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Ub9M8W0igL+Wh+cmM97paJ6vkhusw5V4SKPrJ1aKoqI=;
  b=CuTPnHi2b4sNLTShh0CmbB3JoQxYTiaSuEjYDx9yFJ2HN/TN267Z6X1d
   AYFFe/zVyfnzI3qQBrL49Uaan5AhH0U6BBKBuEKtU6TjLEkqZFAm+Mk+q
   P9mih+7rEEQMDgnBYUNK6zUSFs6swMHxBnXUibeFLhhVqzbUNkqgFsGRk
   slEg8Bw7YtcEuZvikqJFjyXTlDrSQ2tWA7O8cnziNYZ2gbBHR+0kpvsjF
   DVLO2r36hoOctPn8kVBvJV1AtGszn5JeJU+tssPJKmLWZKJi5rhxllaAz
   3t+Buq9wxoMxJU2Vw9afkPiAnKhyzi0hVvQLcQf27uIlIVHjE2Bz9rY4j
   w==;
X-CSE-ConnectionGUID: 6EVLKV/tTtCUkFoKJltPRw==
X-CSE-MsgGUID: QqlMqYgBQ+O+Q9cej0gTXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="91002434"
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; 
   d="scan'208";a="91002434"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 21:10:50 -0700
X-CSE-ConnectionGUID: qPKthj/+TBu3LrPKEemGUQ==
X-CSE-MsgGUID: V/8OCflnRWCIvkp3wb2CdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; 
   d="scan'208";a="5009290"
Received: from unknown (HELO gnr-sp-2s-612.sh.intel.com) ([10.112.229.148])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 21:10:46 -0700
From: Zhenzhong Duan <zhenzhong.duan@intel.com>
To: x86@kernel.org,
	linux-coco@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: dave.hansen@linux.intel.com,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	hpa@zytor.com,
	dave.hansen@intel.com,
	kas@kernel.org,
	rick.p.edgecombe@intel.com,
	jgg@nvidia.com,
	nicolinc@nvidia.com,
	aik@amd.com,
	aneesh.kumar@kernel.org,
	seanjc@google.com,
	pbonzini@redhat.com,
	yilun.xu@linux.intel.com,
	chao.gao@intel.com,
	vishal.l.verma@intel.com,
	xiaoyao.li@intel.com,
	kevin.tian@intel.com,
	chao.p.peng@intel.com
Subject: [RFC PATCH 01/15] x86/tdx: Export tdg_vm_rd() for tdx-guest module
Date: Thu, 24 Sep 2026 12:10:18 +0800
Message-ID: <20260924041032.1096569-2-zhenzhong.duan@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260924041032.1096569-1-zhenzhong.duan@intel.com>
References: <20260924041032.1096569-1-zhenzhong.duan@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Export tdg_vm_rd() to allow the tdx-guest driver module to directly
read TD-scoped metadata fields from the Trust Domain Control Structure
(TDCS) via TDG.VM.RD TDCALL.

Since tdg_vm_rd() is read-only and cannot cause harm, exporting it
directly is simpler and more flexible. This allows the tdx-guest driver
to read any TDCS field it needs.

In a following patch, the tdx-guest driver will use tdg_vm_rd() to read
TDCS_CONFIG_FLAGS field directly.

Signed-off-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
---
 arch/x86/coco/tdx/tdx.c    | 3 ++-
 arch/x86/include/asm/tdx.h | 2 ++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/x86/coco/tdx/tdx.c b/arch/x86/coco/tdx/tdx.c
index f904a636d449..22cc177a6db4 100644
--- a/arch/x86/coco/tdx/tdx.c
+++ b/arch/x86/coco/tdx/tdx.c
@@ -79,7 +79,7 @@ static inline void tdcall(u64 fn, struct tdx_module_args *args)
 }
 
 /* Read TD-scoped metadata */
-static inline u64 tdg_vm_rd(u64 field, u64 *value)
+u64 tdg_vm_rd(u64 field, u64 *value)
 {
 	struct tdx_module_args args = {
 		.rdx = field,
@@ -91,6 +91,7 @@ static inline u64 tdg_vm_rd(u64 field, u64 *value)
 
 	return ret;
 }
+EXPORT_SYMBOL_FOR_MODULES(tdg_vm_rd, "tdx-guest");
 
 /* Write TD-scoped metadata */
 static inline u64 tdg_vm_wr(u64 field, u64 value, u64 mask)
diff --git a/arch/x86/include/asm/tdx.h b/arch/x86/include/asm/tdx.h
index 89e97d5761d8..884bb8067521 100644
--- a/arch/x86/include/asm/tdx.h
+++ b/arch/x86/include/asm/tdx.h
@@ -77,6 +77,8 @@ void tdx_halt(void);
 
 bool tdx_early_handle_ve(struct pt_regs *regs);
 
+u64 tdg_vm_rd(u64 field, u64 *value);
+
 int tdx_mcall_get_report0(u8 *reportdata, u8 *tdreport);
 
 int tdx_mcall_extend_rtmr(u8 index, u8 *data);
-- 
2.52.0

