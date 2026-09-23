Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AE0D538D81;
	Wed, 23 Sep 2026 14:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790172330; cv=none; b=YtXx4tC78n7zAGnCx8y2FXRjpiispv2h4TTMnlacUTU1iWPwZjOZroCDSIbsjxHfmShzd8D+AtB2Q37i4aVutpLSCqg8kA5K1A+wFETbsoo9sZttvA/WpWpk6rNJLdPnVyhqBPLvfqH08FVFLu3MoMS8qwVXie99z8zAyDa+7zU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790172330; c=relaxed/simple;
	bh=AWA1SKT1V2w9RHuyLL9VB2kYGgEZUZ3eUnK7pIjKY4w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V5acxrIWCkSa7tM/XQ1SQ9fKr2bqVZuyuVwkFl/1TaN13zIYLC67mprahLgV0ljHQ2fvgxm9X/T29aittNSTKE09WjJlglzucBSB15z5hwb43Thr3qO9j8BjJ2wX0IU8rrXniiPgdMY5d/RsKphkwhJyomVsNDFXnTz6f9g0Dg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kJ87Z6Jk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kJ87Z6Jk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC63C1F000FF;
	Wed, 23 Sep 2026 14:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790172325;
	bh=oUPGVnyjXr0wjlDdYgG25EkMyiw+NLBsCbmXTz2cKDw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=kJ87Z6JktrmAiUp2+7QQl6BKZ94hsEvT1wHHiKmE85QUAUoB14PDatOOhzvnAMR+s
	 qGuEuhi2hPZdroEU9XY1e2E5ZOoydPUtFX14EQ0SO5a0syGJMeKvpT+OrluAD1fq7C
	 q96zXObigPn0IlHGYUhweGzIKT8gPhyU1Y3hBRD599L3T1wD9kcAIIQFNVnR3p2IvU
	 1DDSuecyud3ldDcPPPXS+HfqJm1587vWgquIC0K+Nl8X3RWJ70BwGoNzYXysetel8z
	 suI/leoGces9iR1SoLy2pG5Gs+GAk1BW4kvU4quDHW6MgCU6TOJFxayWIy24ffCc7m
	 ZsvEk+3rnoXeA==
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
Subject: [PATCH v13 7/8] coco: guest: arm64: Add sysfs ABI for CCA Realm guests
Date: Wed, 23 Sep 2026 19:34:04 +0530
Message-ID: <20260923140405.1111554-8-aneesh.kumar@kernel.org>
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

Userspace has used the arm-cca-dev platform device to detect Arm CCA
Realm guests. Removing it without a replacement would break that
detection and would also leave userspace depending on kernel
device-model details.

Add /sys/firmware/cca/realm_guest as a stable ABI for detecting whether
the kernel is running as an Arm CCA Realm guest. Create the file only in
Realm world, where it reads 1.

Document the new ABI in Documentation/ABI/testing/sysfs-firmware-cca.

Link: https://lore.kernel.org/all/4a7d84b2-2ec4-4773-a2d5-7b63d5c683cf@arm.com
Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
---
 Documentation/ABI/testing/sysfs-firmware-cca |  7 ++++
 MAINTAINERS                                  |  1 +
 drivers/firmware/arm_rmm/rsi.c               | 35 ++++++++++++++++++++
 3 files changed, 43 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-firmware-cca

diff --git a/Documentation/ABI/testing/sysfs-firmware-cca b/Documentation/ABI/testing/sysfs-firmware-cca
new file mode 100644
index 000000000000..d545b7523530
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-firmware-cca
@@ -0,0 +1,7 @@
+What:		/sys/firmware/cca/realm_guest
+Date:		September 2026
+Contact:	Linux ARM Kernel Mailing list <linux-arm-kernel@lists.infradead.org>
+Description:	Read-only. Present only when the kernel is running as an
+		Arm Confidential Compute Architecture (CCA) Realm guest, in
+		which case it reads 1. If the file does not exist, the kernel
+		is not running as a Realm guest.
diff --git a/MAINTAINERS b/MAINTAINERS
index caf2e0235d99..1e543163a8cc 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3949,6 +3949,7 @@ R:	Mark Rutland <mark.rutland@arm.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git
+F:	Documentation/ABI/testing/sysfs-firmware-cca
 F:	Documentation/arch/arm64/
 F:	arch/arm64/
 F:	drivers/firmware/arm_rmm/
diff --git a/drivers/firmware/arm_rmm/rsi.c b/drivers/firmware/arm_rmm/rsi.c
index 2dd69febedbd..29eeb90ffc6b 100644
--- a/drivers/firmware/arm_rmm/rsi.c
+++ b/drivers/firmware/arm_rmm/rsi.c
@@ -9,6 +9,8 @@
 #include <linux/swiotlb.h>
 #include <linux/platform_device.h>
 #include <linux/arm-rsi-cmds.h>
+#include <linux/kobject.h>
+#include <linux/sysfs.h>
 
 #include <asm/io.h>
 #include <asm/mem_encrypt.h>
@@ -182,6 +184,39 @@ void __init arm64_rsi_init(void)
 	static_branch_enable(&rsi_present);
 }
 
+static ssize_t realm_guest_show(struct kobject *kobj,
+		struct kobj_attribute *attr, char *buf)
+{
+	return sysfs_emit(buf, "1\n");
+}
+
+static struct kobj_attribute cca_realm_guest = __ATTR_RO(realm_guest);
+static const struct attribute *cca_realm_attrs[] = {
+	&cca_realm_guest.attr,
+	NULL
+};
+
+static int __init realm_sysfs_init(void)
+{
+	int ret;
+	struct kobject *cca_kobj;
+
+	if (!is_realm_world())
+		return 0;
+
+	cca_kobj = kobject_create_and_add("cca", firmware_kobj);
+	if (!cca_kobj)
+		return -ENOMEM;
+
+	ret = sysfs_create_files(cca_kobj, cca_realm_attrs);
+	if (!ret)
+		return 0;
+
+	kobject_put(cca_kobj);
+	return ret;
+}
+device_initcall(realm_sysfs_init);
+
 static struct platform_device rsi_dev = {
 	.name = "arm-cca-dev",
 	.id = PLATFORM_DEVID_NONE
-- 
2.43.0

