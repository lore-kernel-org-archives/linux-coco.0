Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA4D927707
	for <linux-coco@lists.linux.dev>; Mon,  3 Aug 2026 12:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785761919; cv=none; b=mmwXaHckStpad6bt/kedRRFh+eEcl6jYZf0n+GWLO1Vq2DzPvmIQXrrb8ZRHo3PrDL6oMR3ZtLwbCplat3+AaqunFcIeRYzry8z2vMdMzBWTuntPD5Msb7kEQh1NxfOBmbib2cxHijjm+/XWog9y2XjWQYIFzORsESR3N9zY7NQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785761919; c=relaxed/simple;
	bh=Xfhnt3vX8MDy33WKNvLx/DwOXGmQqO5YRLa2ivNLn+8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CJnONB08mfaRnZ6Y/jN9iStR/dN1ZvI++xW0MU8x0TFOi0yoYF+OJvpCat5quCNjLwM8H3GizGONezOiT/MabCIoNPFAF7JBH3GPAOZ5bQbOlXl3q01ji7QSg+nwSBPgojn4/nVCFIvPKopslkyu4wA8M4TexLpTjCyGaRf0/Zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Received: from io.fritz.box (p200300f6af4fc500dcfec4a187edd2e0.dip0.t-ipconnect.de [IPv6:2003:f6:af4f:c500:dcfe:c4a1:87ed:d2e0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 8C82D204179;
	Mon,  3 Aug 2026 14:58:29 +0200 (CEST)
From: =?UTF-8?q?J=C3=B6rg=20R=C3=B6del?= <joro@8bytes.org>
To: Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org
Cc: hpa@zytor.com,
	Tom Lendacky <thomas.lendacky@amd.com>,
	joro@8bytes.org,
	linux-kernel@vger.kernel.org,
	linux-coco@lists.linux.dev,
	Joerg Roedel <joerg.roedel@amd.com>
Subject: [PATCH 2/3] x86/sev: Create /sys/devices/system/cpu/sev/ for all SEV guests
Date: Mon,  3 Aug 2026 14:58:26 +0200
Message-ID: <20260803125827.718024-3-joro@8bytes.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260803125827.718024-1-joro@8bytes.org>
References: <20260803125827.718024-1-joro@8bytes.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Joerg Roedel <joerg.roedel@amd.com>

The SYSFS directory for SEV is only created for SEV-SNP guests right
now. Change it to create it for SEV and SEV-ES guests as well so
attributes available on all versions of SEV have a place.

Signed-off-by: Joerg Roedel <joerg.roedel@amd.com>
---
 .../ABI/testing/sysfs-devices-system-cpu      |  5 ++--
 arch/x86/coco/sev/core.c                      | 29 ++++++++++++-------
 2 files changed, 22 insertions(+), 12 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-devices-system-cpu b/Documentation/ABI/testing/sysfs-devices-system-cpu
index 82d10d556cc8..63586e299aa8 100644
--- a/Documentation/ABI/testing/sysfs-devices-system-cpu
+++ b/Documentation/ABI/testing/sysfs-devices-system-cpu
@@ -694,10 +694,11 @@ Date:		May 2024
 Contact:	Linux kernel mailing list <linux-kernel@vger.kernel.org>
 Description:	Secure Encrypted Virtualization (SEV) information
 
-		This directory is only present when running as an SEV-SNP guest.
+		This directory is only present when running as an SEV guest.
 
 		vmpl: Reports the Virtual Machine Privilege Level (VMPL) at which
-		      the SEV-SNP guest is running.
+		      the SEV-SNP guest is running. This file is only present
+		      when running as an SEV-SNP guest.
 
 
 What:		/sys/devices/system/cpu/svm
diff --git a/arch/x86/coco/sev/core.c b/arch/x86/coco/sev/core.c
index ecd77d3217f3..5770b99feb9b 100644
--- a/arch/x86/coco/sev/core.c
+++ b/arch/x86/coco/sev/core.c
@@ -1433,14 +1433,7 @@ static ssize_t vmpl_show(struct kobject *kobj,
 
 static struct kobj_attribute vmpl_attr = __ATTR_RO(vmpl);
 
-static struct attribute *vmpl_attrs[] = {
-	&vmpl_attr.attr,
-	NULL
-};
-
-static struct attribute_group sev_attr_group = {
-	.attrs = vmpl_attrs,
-};
+static struct attribute_group sev_attr_group = {};
 
 static int __init sev_sysfs_init(void)
 {
@@ -1448,7 +1441,7 @@ static int __init sev_sysfs_init(void)
 	struct device *dev_root;
 	int ret;
 
-	if (!cc_platform_has(CC_ATTR_GUEST_SEV_SNP))
+	if (!cc_platform_has(CC_ATTR_GUEST_SEV))
 		return -ENODEV;
 
 	dev_root = bus_get_dev_root(&cpu_subsys);
@@ -1463,9 +1456,25 @@ static int __init sev_sysfs_init(void)
 
 	ret = sysfs_create_group(sev_kobj, &sev_attr_group);
 	if (ret)
-		kobject_put(sev_kobj);
+		goto drop_kobj;
+
+	/* Add SEV-SNP specific attributes */
+	if (cc_platform_has(CC_ATTR_GUEST_SEV_SNP)) {
+		/* VMPL */
+		ret = sysfs_add_file_to_group(sev_kobj, &vmpl_attr.attr, NULL);
+		if (ret)
+			goto drop_sysfs;
+	}
+
+	return 0;
+
+drop_sysfs:
+	sysfs_remove_group(sev_kobj, &sev_attr_group);
+drop_kobj:
+	kobject_put(sev_kobj);
 
 	return ret;
+
 }
 arch_initcall(sev_sysfs_init);
 #endif // CONFIG_SYSFS
-- 
2.53.0

