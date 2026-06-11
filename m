Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D54A8403B04;
	Thu, 11 Jun 2026 13:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781183107; cv=none; b=NnzLP2SIgy7r+XwyGuCQBW2qauxF0wH5fZeIWeJJ03UBz7GLQJt5tEslXbsT77mIqqOfqDNxSmCliV3ki3pke5KykiTPNTVKqG0HCFfCjVAf3SsFHi7WHtCd8fFR3gTYftXPGI6rbQTxQ1so//tQdfy1DUO+HS6T4c/1nLy6kN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781183107; c=relaxed/simple;
	bh=hgEOQMplP8La7I1cpBA/EfoAXtpZjlignFEnH5fQ5V0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NaYpxWkHksCRi+7dfqbyY/3zc+4sOzv8dSv03bJTmKTgpm+vWJvNEMiH+aw89yUC/GcasxUsm0EBMvbUvamKzZ4n8bDZg6r/Azx0sKct/jNztKomrxPYhQMZ+7R2GnKMCRnUkNaq8fYlLNxr+zYOuwmyX53iN0fqrwgnZOxXxuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RZfHvLPQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RZfHvLPQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62F0B1F00899;
	Thu, 11 Jun 2026 13:05:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781183106;
	bh=Jh8bWKGmPuYwh7hitiYl8VrG4BgLt5boypsRwdeG7jU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=RZfHvLPQHXz8EFq+1KFjW5RZM4m6LxLllLy3SzvDbAIUJwE+YQ8T1n9CAa8nqyRM+
	 6LJ7DFdTBWoPKzuQz2jfU/7Q0vOvmeX2dttEP2xwUWLicIs9z8gF1ub70aVRwkkD58
	 6DifoIidfFQvM+XIhzykVsF1dfGgktHnIGkvBaHqBzsHQNxttXoXA+libNY2rxZe+d
	 0kyyxZJG8M/Rd2W3KMrH2S0hCzHL6XY4785NwCWghRyZwGyXAEyzg9p1XJ+Mank8wu
	 lncyfApIxR0nIHbTuX8wGhlN0/Ml0c4O1OOCo1kywsmDmqrP3QvEjxeCjKdI4W22w2
	 hGMe6cwu8H2Tg==
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
Subject: [PATCH v7 4/6] virt: coco: arm-cca-guest: Rename TSM report source file
Date: Thu, 11 Jun 2026 18:34:27 +0530
Message-ID: <20260611130429.295516-5-aneesh.kumar@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260611130429.295516-1-aneesh.kumar@kernel.org>
References: <20260611130429.295516-1-aneesh.kumar@kernel.org>
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
index 8b6854e7a188..0bbd1fa53ee4 100644
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

