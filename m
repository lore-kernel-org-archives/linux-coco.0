Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E4704EE85B;
	Wed, 23 Sep 2026 14:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790172345; cv=none; b=j1GaZ/WuoBW1YaJ1w6OeTTJMCEMnIQfq0jG57p01b/HMK/R0VFFx4iLo84nGKw+/1swFPUq7oAkNRpBQbHNEwRHWmGG8XclA/ClCaKYovaK7X/TQgzjlvLpoBas/afSmVhWxOoXQ4Gji47h/bUV50+bor2FcK/dGF+C2URBHiwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790172345; c=relaxed/simple;
	bh=TnL8zpo4Nvloq0l1vjUbEbdK+1hVErxauspUW3SM6yo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sloRrr2Sls/gP5h3/H/dHvfCW5YLJshR60esk46y+diZS4aNhEdW3fkFW4uMUx7kkKerBfh8yLXrY4pK6akMamJDOYiX+AtyAOyNCwhFG7yoC1+37QPOAmRq5x+0itL29KUJT4XJgtp3r7eswOINqN91VF5m7fka+V8OzLaKheo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HR6Q90vP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HR6Q90vP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 696381F00898;
	Wed, 23 Sep 2026 14:05:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790172335;
	bh=woi6xHIfPsARY6TAraovKfAogTZcwZGDkQDkJXYsi7M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=HR6Q90vPfYQYUBbKLL/si7wucgPhWMcqErv9Tj3pv1VgVq1cTUokE+larAwdj46xE
	 M2SWCuUcSFSRSK6e3PubTLFkrnkfI7DXa+Orr2/9WquTJODWOcY6kBJ1i9gNllRvKV
	 NNHsR0nE07Nj1fSQd6zFvRl3CJH1bVsNwi1rpkA4W40iGVMerxL8i597mi+45zbvke
	 uzCl9hSYGcQZjznFowvizfS+Pm8bW+xP4wfinbpGFyTVCjJnhrT7v96Pn/9cLyj6gv
	 tZ3yzy++kqdrhbORi3EhyAXJEDznOaTQ62UYR265+65YrG/Xhq11tcxVkoIAlCO8/K
	 Si0QUVv7nnkAA==
From: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
To: linux-coco@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Greg KH <gregkh@linuxfoundation.org>,
	Jeremy Linton <jeremy.linton@arm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Will Deacon <will@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Olivia Mackall <olivia@selenic.com>,
	Russell King <linux@armlinux.org.uk>,
	Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Subject: [PATCH v13 8/8] coco: guest: arm64: Remove dummy CCA platform device
Date: Wed, 23 Sep 2026 19:34:05 +0530
Message-ID: <20260923140405.1111554-9-aneesh.kumar@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260923140405.1111554-1-aneesh.kumar@kernel.org>
References: <20260923140405.1111554-1-aneesh.kumar@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SMCCC firmware driver now creates the arm_smccc bus and instantiates
the CCA RSI device once the RSI ABI is discovered. The arm64-specific
arm-cca-dev platform device stub is therefore no longer needed.

Userspace now has /sys/firmware/cca/realm_guest as a dedicated CCA Realm
guest indicator. Remove the dummy arm-cca-dev registration.

Link: https://lore.kernel.org/all/4a7d84b2-2ec4-4773-a2d5-7b63d5c683cf@arm.com
Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
---
 drivers/firmware/arm_rmm/rsi.c | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/drivers/firmware/arm_rmm/rsi.c b/drivers/firmware/arm_rmm/rsi.c
index 29eeb90ffc6b..0fcc4e33bd92 100644
--- a/drivers/firmware/arm_rmm/rsi.c
+++ b/drivers/firmware/arm_rmm/rsi.c
@@ -7,7 +7,6 @@
 #include <linux/memblock.h>
 #include <linux/psci.h>
 #include <linux/swiotlb.h>
-#include <linux/platform_device.h>
 #include <linux/arm-rsi-cmds.h>
 #include <linux/kobject.h>
 #include <linux/sysfs.h>
@@ -216,18 +215,3 @@ static int __init realm_sysfs_init(void)
 	return ret;
 }
 device_initcall(realm_sysfs_init);
-
-static struct platform_device rsi_dev = {
-	.name = "arm-cca-dev",
-	.id = PLATFORM_DEVID_NONE
-};
-
-static int __init arm64_create_dummy_rsi_dev(void)
-{
-	if (is_realm_world() &&
-	    platform_device_register(&rsi_dev))
-		pr_err("failed to register rsi platform device\n");
-	return 0;
-}
-
-arch_initcall(arm64_create_dummy_rsi_dev)
-- 
2.43.0

