Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE440241116
	for <linux-coco@lists.linux.dev>; Fri,  9 May 2025 03:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746759855; cv=none; b=NtJEKfWFLdMDYTO1wAKOK+i+v7Us8PvWDozqPusLqBxZvW9ZQ9niUcG71AYpiNoV8EirXIm+da11AgjiilHFnWzvsjnm5OThnwTztGKiTKNlVgfk6xVYxt5Rpqd0h02gMzznD/psvp0waVk8efdXd4XL0Sm+AXqpMClZlFr6PYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746759855; c=relaxed/simple;
	bh=KKl63Wt+nYJttZzpHCIN9ATRxLv/kJAaRlJgySVlJm0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lnqdUf2A+ZnrRtuAdE7zVmuO/GlYxLcxgQOELtlTps0VFDBx94Gt1GN5alJIbL0TcNW3oh94UXKSyNtlc6aIpkX3NIkbsgauOMQSm2JjGLOMoLiG/jEKkk6+9NFrtw8N11+iEGO2K9lN6zxikvPzXaOOR20T6RfEas8xNwq/fRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L9NAgJpq; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L9NAgJpq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746759854; x=1778295854;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=KKl63Wt+nYJttZzpHCIN9ATRxLv/kJAaRlJgySVlJm0=;
  b=L9NAgJpquB2H4RI+qzCIXZHcdBFhFI6pGSC1c4D/mzMGHA1BuWXaPrOR
   PrHV32KgEvwO1G9aytwBwNBnRLb5xPU6t9x30z3dEAPb2EUQcJTVthnJp
   Zbkmha8MGkbExPwap1b+VPLbzPsqEgHokQYeWbm26URsUhYVYMi7MlItL
   KZzt9arBRFcshje+MODP3ea9T3mZRw4RNcaJTQ8dcuQDJbS+cLBYvoIJp
   1zpWYqnfvoKkQWfOgVKNnOT2Wjm1t3vk+wvgf1JTvsM/BjVVzYlofvVvW
   eh2Vf3tslqTbPe2lfPN1efldW6oFqvGdLHmt1KvcMAf8WkOB8MsZeAKH1
   w==;
X-CSE-ConnectionGUID: CA8QXBKgTVK1RIE2N+qb2A==
X-CSE-MsgGUID: oGdg2/9RS5yWexThD/Dl/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="48651024"
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; 
   d="scan'208";a="48651024"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 20:04:12 -0700
X-CSE-ConnectionGUID: MTbKVIMLT76QxgpgMIm9Vg==
X-CSE-MsgGUID: YPjzkcQUSrOUbl22NICMQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; 
   d="scan'208";a="136874095"
Received: from mrunalsh-mobl2.amr.corp.intel.com (HELO bxing-mobl1.clients.intel.com) ([10.246.112.149])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 20:04:10 -0700
From: Cedric Xing <cedric.xing@intel.com>
To: dan.j.williams@intel.com
Cc: linux-coco@lists.linux.dev,
	Cedric Xing <cedric.xing@intel.com>
Subject: [PATCH] sample/tsm-mr: Fix missing static for sample_report
Date: Thu,  8 May 2025 22:03:50 -0500
Message-ID: <20250509030350.22363-1-cedric.xing@intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

0day robot reports 'sample_report' can be static, fix it up.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202505090938.avfIhLsl-lkp@intel.com/
Signed-off-by: Cedric Xing <cedric.xing@intel.com>
---
 samples/tsm-mr/tsm_mr_sample.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/samples/tsm-mr/tsm_mr_sample.c b/samples/tsm-mr/tsm_mr_sample.c
index f3e16301de40..a2c652148639 100644
--- a/samples/tsm-mr/tsm_mr_sample.c
+++ b/samples/tsm-mr/tsm_mr_sample.c
@@ -8,7 +8,7 @@
 #include <linux/miscdevice.h>
 #include <crypto/hash.h>
 
-struct {
+static struct {
 	u8 static_mr[SHA384_DIGEST_SIZE];
 	u8 config_mr[SHA512_DIGEST_SIZE];
 	u8 rtmr0[SHA256_DIGEST_SIZE];
-- 
2.43.0

