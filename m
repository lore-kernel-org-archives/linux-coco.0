Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B2842D7DDB;
	Tue,  7 Jul 2026 08:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783412066; cv=none; b=dbzjxBuujm6Ep+oR+DWGZ3Z5NKYHexH4p2jhls/YYrq2VjcPsZWCg788qgNPJ63o/YrLRafHACaEXKhlh3saWygFT0ALZumCyZj7Lxif5hmQWVZcigkyyAwV/wuVu0Zg0eohZpfBe9BZC3Ui3dsP/WibzjoGNf91WuVWg9ZpyuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783412066; c=relaxed/simple;
	bh=rL0LrxKH3FPS7CC4pYuENoAazzWRDGEa5avoXBbQBtY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NOW+FWtEUtnPsS5hANPfoMElMmf17VtnwRGrDQp7pjTl7bZx9wx/jac73kCM242YFJokfEwuLk29OJB1QFlKFen99V7eHZpQ5XN3eQeymq6GZvpaKXYc0vd68Z+0nu4LjzzS0WEv/YDp623MqRMjG70srQ9B0Zt+om82t7LKC8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XUfX+fE0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XUfX+fE0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA94C1F000E9;
	Tue,  7 Jul 2026 08:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783412064;
	bh=BBVv5tvYGFGGSH2Ztx76cotXpvBZtoh3e+XJwoD7bKA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=XUfX+fE0lAi1cZkKZIg58/vw+Q2SvSwhaHtg5ST8F2Xzozl/16Y250uidw2zZyyQh
	 KFsedT0JKMMW5XirMBblIOnndJHjb/lk6/tG45rMN+dhl8p0cQ01X63kb8aYLX6tEl
	 GccEjr5P/uGrI3Yd0+dHfwfFKh++a2sjOTbgZAPFHl+bwrMHuAhyF4buLdLsB0d7Zg
	 ctgy5QrV2phcDp2ROs3RX6R/KW7ppi2p2woPzANM2Jfgo+jTrV/vbc/v3ETwAdednw
	 QeF54O5uTKz+nxyS+Sscc/wXBL/vu31CRudzPvH36g/UlyVpA7+nqSLc1NvXLn8y9E
	 1UU8oKpk/d5OQ==
From: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
To: linux-coco@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Greg KH <gregkh@linuxfoundation.org>,
	Jeremy Linton <jeremy.linton@arm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Will Deacon <will@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Andre Przywara <andre.przywara@arm.com>
Subject: [PATCH v8 4/6] virt: coco: arm-cca-guest: Rename TSM report source file
Date: Tue,  7 Jul 2026 13:43:48 +0530
Message-ID: <20260707081351.1680209-5-aneesh.kumar@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260707081351.1680209-1-aneesh.kumar@kernel.org>
References: <20260707081351.1680209-1-aneesh.kumar@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Arm CCA guest driver currently only implements TSM report support, but
follow-up changes will add more TSM-related functionality to the same
module.

Rename arm-cca-guest.c to arm-cca.c and build it as an object of the
arm-cca-guest module. This leaves room for the module to grow additional
source files.

Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
---
 drivers/virt/coco/arm-cca-guest/Makefile                    | 2 ++
 .../virt/coco/arm-cca-guest/{arm-cca-guest.c => arm-cca.c}  | 6 +++---
 2 files changed, 5 insertions(+), 3 deletions(-)
 rename drivers/virt/coco/arm-cca-guest/{arm-cca-guest.c => arm-cca.c} (97%)

diff --git a/drivers/virt/coco/arm-cca-guest/Makefile b/drivers/virt/coco/arm-cca-guest/Makefile
index 69eeba08e98a..778146148515 100644
--- a/drivers/virt/coco/arm-cca-guest/Makefile
+++ b/drivers/virt/coco/arm-cca-guest/Makefile
@@ -1,2 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
 obj-$(CONFIG_ARM_CCA_GUEST) += arm-cca-guest.o
+
+arm-cca-guest-y += arm-cca.o
diff --git a/drivers/virt/coco/arm-cca-guest/arm-cca-guest.c b/drivers/virt/coco/arm-cca-guest/arm-cca.c
similarity index 97%
rename from drivers/virt/coco/arm-cca-guest/arm-cca-guest.c
rename to drivers/virt/coco/arm-cca-guest/arm-cca.c
index d05acddf6c4e..0c9fb61a28f1 100644
--- a/drivers/virt/coco/arm-cca-guest/arm-cca-guest.c
+++ b/drivers/virt/coco/arm-cca-guest/arm-cca.c
@@ -184,7 +184,7 @@ static int arm_cca_report_new(struct tsm_report *report, void *data)
 	return ret;
 }
 
-static const struct tsm_report_ops arm_cca_tsm_ops = {
+static const struct tsm_report_ops arm_cca_tsm_report_ops = {
 	.name = KBUILD_MODNAME,
 	.report_new = arm_cca_report_new,
 };
@@ -205,7 +205,7 @@ static int __init arm_cca_guest_init(void)
 	if (!is_realm_world())
 		return -ENODEV;
 
-	ret = tsm_report_register(&arm_cca_tsm_ops, NULL);
+	ret = tsm_report_register(&arm_cca_tsm_report_ops, NULL);
 	if (ret < 0)
 		pr_err("Error %d registering with TSM\n", ret);
 
@@ -219,7 +219,7 @@ module_init(arm_cca_guest_init);
  */
 static void __exit arm_cca_guest_exit(void)
 {
-	tsm_report_unregister(&arm_cca_tsm_ops);
+	tsm_report_unregister(&arm_cca_tsm_report_ops);
 }
 module_exit(arm_cca_guest_exit);
 
-- 
2.43.0

