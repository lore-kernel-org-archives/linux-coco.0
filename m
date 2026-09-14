Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEB50378838;
	Mon, 14 Sep 2026 06:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789365960; cv=none; b=s+gOmtxMNarTAldLvCNNYK5sA9aDBibGsn23LFyaSXcuO1PZFlJiuHs7xVKbBZs5pOIdlxDLwV/CARCkPmXbD68yTNwF/TFjwRZm7vn/MCHxxAauPi3JDme21+GrtSOcRXrwfjz3VgMYqw4z1axfANskoXMKHUre0J3rWFOBgWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789365960; c=relaxed/simple;
	bh=QpiDO+GtkLc4AAE2Qj0pkem7UQdosl2uRgxofwY7300=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W0IdYUMtAappnUSn6FS5ffqIou7Jkhokn/XOkX6PsJwBEi/Kh3mBJHcwN8DgIIhj6MCj4esfvJj2Ed4TOB6O4czJWshi5BetmXDhLUgiuzzRs728jKnIwY5gyOwm5xGUE/4gIrYdc6viNoi6RMDDPLDNJ9BgBZOIgmKiclVMCdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SVEahWpw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SVEahWpw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D897A1F00893;
	Mon, 14 Sep 2026 06:05:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789365954;
	bh=1YB+AnZJs9InucE69alYwLYDHkAk/7QPiTIJ6yiBUco=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=SVEahWpwGKf7hfU1NjhUJ4yCGlqR4i33qJrs4QkHXqVfPMTvj3lPt2cNrFOyvqDVY
	 7p9mzIJJ8tfx88EUOABAyojg9DZJhUAroC9+/zDI71LpUW7Unc4xUpEHdBtxk8Xv8m
	 7GDNmfgxe4MfbGpgbXZr/S23Gg1qVNCw1+Dfvcnv+z+ynfACwHRkXZ3PrSt1D1Vj8A
	 GROofYmu7gVko/aJS82h/UtokIZGGO1z6wrpOxMpRfJFP09slalwlJsv8KIwf7PdLv
	 WbDsZ7Zh7K/dJ80/U2oYSoC0ua0VzQcAUDbuPkMf76qKHtLwGGKO23NzdP3A+Oed0h
	 ramw8nNhlCR9A==
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
	Will Deacon <will@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Andre Przywara <andre.przywara@arm.com>
Subject: [PATCH v11 5/7] virt: coco: arm-cca-guest: Rename TSM report source file
Date: Mon, 14 Sep 2026 11:35:09 +0530
Message-ID: <20260914060511.277948-6-aneesh.kumar@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260914060511.277948-1-aneesh.kumar@kernel.org>
References: <20260914060511.277948-1-aneesh.kumar@kernel.org>
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

Rename arm-cca-guest.c to main.c and build it as an object of the
arm-cca-guest module. This leaves room for the module to grow additional
source files.

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
---
 drivers/virt/coco/arm-cca-guest/Makefile                    | 2 ++
 drivers/virt/coco/arm-cca-guest/{arm-cca-guest.c => main.c} | 6 +++---
 2 files changed, 5 insertions(+), 3 deletions(-)
 rename drivers/virt/coco/arm-cca-guest/{arm-cca-guest.c => main.c} (97%)

diff --git a/drivers/virt/coco/arm-cca-guest/Makefile b/drivers/virt/coco/arm-cca-guest/Makefile
index 69eeba08e98a..7564f4fcc4a4 100644
--- a/drivers/virt/coco/arm-cca-guest/Makefile
+++ b/drivers/virt/coco/arm-cca-guest/Makefile
@@ -1,2 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
 obj-$(CONFIG_ARM_CCA_GUEST) += arm-cca-guest.o
+
+arm-cca-guest-y += main.o
diff --git a/drivers/virt/coco/arm-cca-guest/arm-cca-guest.c b/drivers/virt/coco/arm-cca-guest/main.c
similarity index 97%
rename from drivers/virt/coco/arm-cca-guest/arm-cca-guest.c
rename to drivers/virt/coco/arm-cca-guest/main.c
index b741643d1364..80659f0885e9 100644
--- a/drivers/virt/coco/arm-cca-guest/arm-cca-guest.c
+++ b/drivers/virt/coco/arm-cca-guest/main.c
@@ -156,7 +156,7 @@ static int arm_cca_report_new(struct tsm_report *report, void *data)
 	return ret;
 }
 
-static const struct tsm_report_ops arm_cca_tsm_ops = {
+static const struct tsm_report_ops arm_cca_tsm_report_ops = {
 	.name = KBUILD_MODNAME,
 	.report_new = arm_cca_report_new,
 };
@@ -177,7 +177,7 @@ static int __init arm_cca_guest_init(void)
 	if (!is_realm_world())
 		return -ENODEV;
 
-	ret = tsm_report_register(&arm_cca_tsm_ops, NULL);
+	ret = tsm_report_register(&arm_cca_tsm_report_ops, NULL);
 	if (ret < 0)
 		pr_err("Error %d registering with TSM\n", ret);
 
@@ -191,7 +191,7 @@ module_init(arm_cca_guest_init);
  */
 static void __exit arm_cca_guest_exit(void)
 {
-	tsm_report_unregister(&arm_cca_tsm_ops);
+	tsm_report_unregister(&arm_cca_tsm_report_ops);
 }
 module_exit(arm_cca_guest_exit);
 
-- 
2.43.0

