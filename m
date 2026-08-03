Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FD96404BE8
	for <linux-coco@lists.linux.dev>; Mon,  3 Aug 2026 12:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785761918; cv=none; b=YNA4wO+R8JgOA9D3Jby84uApEgBc+HJLjnIzzJtOoHo7uAP2M8eaKwbOfm3F7l9UWj8lfuYG62qfDweXjuNNYHiiJbvWGvQQEzoRj8rWRchXVfo+9Jvw3MdqFkn1qjtyeheEUr7j6geN9aoSzWc2sqvG+I4Q98XosOV0C+8qg9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785761918; c=relaxed/simple;
	bh=3ouubRflyWbyLzAnUYbvyhOT742fyAencjI54ziiJmY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CLkkrMPZbZTwXzei0XFQnJKYOZlbJmthF9QqGrYxvIjyNZayDj/qQ1Eo3VF3zJ3BTC7TVudEHjI+P3S8xcSOXQWkKCwoLzhQZdgLGZ2DOIT5CBt3u0W58K0TeqxyFzWLtScbYIekUNGZxya2IazcdIenIr87C1gbuf5+xcW41Hc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Received: from io.fritz.box (p200300f6af4fc500dcfec4a187edd2e0.dip0.t-ipconnect.de [IPv6:2003:f6:af4f:c500:dcfe:c4a1:87ed:d2e0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id AB74320417A;
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
Subject: [PATCH 3/3] x86/coco/sev: Make SEV_STATUS available via SYSFS
Date: Mon,  3 Aug 2026 14:58:27 +0200
Message-ID: <20260803125827.718024-4-joro@8bytes.org>
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

Current user-space tooling which needs access to the SEV_STATUS MSR is
using the MSR module. The use of this module poses a security risk in
any trusted execution environment and is generally discouraged.

Instead, provide an file in SYSFS in the /sys/devices/system/cpu/sev/
directory to provide the value of the SEV_STATUS MSR to user-space.

Signed-off-by: Joerg Roedel <joerg.roedel@amd.com>
---
 .../ABI/testing/sysfs-devices-system-cpu         |  4 ++++
 arch/x86/coco/sev/core.c                         | 16 +++++++++++++++-
 2 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/Documentation/ABI/testing/sysfs-devices-system-cpu b/Documentation/ABI/testing/sysfs-devices-system-cpu
index 63586e299aa8..cec413a71491 100644
--- a/Documentation/ABI/testing/sysfs-devices-system-cpu
+++ b/Documentation/ABI/testing/sysfs-devices-system-cpu
@@ -690,6 +690,7 @@ Description:	Umwait control
 
 What:		/sys/devices/system/cpu/sev
 		/sys/devices/system/cpu/sev/vmpl
+		/sys/devices/system/cpu/sev/sev_status
 Date:		May 2024
 Contact:	Linux kernel mailing list <linux-kernel@vger.kernel.org>
 Description:	Secure Encrypted Virtualization (SEV) information
@@ -700,6 +701,9 @@ Description:	Secure Encrypted Virtualization (SEV) information
 		      the SEV-SNP guest is running. This file is only present
 		      when running as an SEV-SNP guest.
 
+		sev_status: Reports the value of the SEV_STATUS MSR which
+			    enumerates the enabled features of an SEV
+			    environment.
 
 What:		/sys/devices/system/cpu/svm
 Date:		August 2019
diff --git a/arch/x86/coco/sev/core.c b/arch/x86/coco/sev/core.c
index 5770b99feb9b..4532ffc27041 100644
--- a/arch/x86/coco/sev/core.c
+++ b/arch/x86/coco/sev/core.c
@@ -1431,9 +1431,23 @@ static ssize_t vmpl_show(struct kobject *kobj,
 	return sysfs_emit(buf, "%d\n", snp_vmpl);
 }
 
+static ssize_t sev_status_show(struct kobject *kobj,
+			       struct kobj_attribute *attr, char *buf)
+{
+	return sysfs_emit(buf, "0x%llx\n", sev_status);
+}
+
 static struct kobj_attribute vmpl_attr = __ATTR_RO(vmpl);
+static struct kobj_attribute sev_status_attr = __ATTR_RO(sev_status);
 
-static struct attribute_group sev_attr_group = {};
+static struct attribute *sev_status_attrs[] = {
+	&sev_status_attr.attr,
+	NULL
+};
+
+static struct attribute_group sev_attr_group = {
+	.attrs = sev_status_attrs,
+};
 
 static int __init sev_sysfs_init(void)
 {
-- 
2.53.0

