Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 449E43DD500;
	Wed,  5 Aug 2026 06:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785911627; cv=none; b=gBwcyUPA06eOojosAeEL2juKqUF+aA8T/LCqsAqEF+0b8Vb9CNghatfehc91E1bAZs2i1cwZZtOkiefR9x1Hvlf3L5p89pk7Yj9gUdn7JgPr6SO+N5Ax2bSaRA/1OJOYvOcs7jwq259Uh+3JxdKtpTTCT7oKCjcX5qct8SvV/DA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785911627; c=relaxed/simple;
	bh=OC4VLs58s2FAVASsFufhy7jRR+y56nqWvhjkO4JOX68=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TT2CzvRKRi7+hpl5JAGq/Js80mWzEmkx6OVxhAYJwZWJ7JNK4kdSjfmsQk1HXlqYj4Xy/llrdfmylQc3l4NFj6n731g7iR2SElwHFfQG8kE5//wzlQEZ19gmxxTWoV6wr2VrDCg74/C+kfXDDzZlWAlHk0tvT/kOgLSU7+fFUH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AagRKnWq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AagRKnWq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15A951F00A3D;
	Wed,  5 Aug 2026 06:33:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785911626;
	bh=3UEgeoaW/w43eP7Ky5d+XFBp5+DMWGE+2R8m9AIqlWY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=AagRKnWqM2AZ8zBSbPoDdK5E/Mey0v8goo5rj2MlmDv08h4JvAdqulXwowUw5bCfP
	 0e1YzqFOrAqK+Ei76Ge/63J9i3MfLLgaP4F2kRwsVqdBVsrvq8gKK7RbDzwYoU4gtT
	 wyfqdfD6yy48GDbm/mo8xhxvBoFJijGfPZFWCJUxUDIOkDA4Yd3LAZITCYcFjPtSAB
	 c2Y56HViguYt8XU+drXPgJVO+3CYVGJ8AtRCKoobZQl7Bg1BjExklldJvL9xnSBA9A
	 5/+YX0+dn80SuGzVQid8Seo4PWHXICXKo+XROojQU3/+wCB60KOJbRA4U0e8POlJzS
	 PUOHTpSHAcdlA==
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
	Andre Przywara <andre.przywara@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>
Subject: [PATCH v9 5/7] virt: coco: arm-cca-guest: Rename TSM report source file
Date: Wed,  5 Aug 2026 12:02:53 +0530
Message-ID: <20260805063255.1638614-6-aneesh.kumar@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260805063255.1638614-1-aneesh.kumar@kernel.org>
References: <20260805063255.1638614-1-aneesh.kumar@kernel.org>
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

Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
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
index b741643d1364..80659f0885e9 100644
--- a/drivers/virt/coco/arm-cca-guest/arm-cca-guest.c
+++ b/drivers/virt/coco/arm-cca-guest/arm-cca.c
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

