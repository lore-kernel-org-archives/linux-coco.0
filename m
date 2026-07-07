Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81EC92EDD7D;
	Tue,  7 Jul 2026 08:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783412077; cv=none; b=YonJylRZkZJUyF3ea9VBOFPgHTNppNDUUSJcKXQKd40nlMlTC3Ow6DqaJyVwYdcBcgqlWf+dt5ggkWWK/T0h781PlQvnwQ+SqBYXu8ioDwDHa9p8nJ2d7/Jms9rWhAgCekzqm6DMzBFwmLaMF/TRcWG9crH+D0pVC45NtKCAS4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783412077; c=relaxed/simple;
	bh=iA/6eVaIs2YRbOL8p+zvsk4lHQ7EZADkD10ncYRdudw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Po9y5fo4Z02LTzXHWUPKdiEYyYG+cqi7KRE8JMVsRo1c5U+Lf5LMahRqwC5pZooumqBE2+ynem0nJF6kEO/yCfT+8g+iKxYs8PXfHhsvu/fMQxon6BUNvZuR0Z+Omvr2rU10RYT7y2kfcnjF2sMgFfevdtKeUTJgGk96/PEOD5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FwAUVK8e; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FwAUVK8e"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E8471F000E9;
	Tue,  7 Jul 2026 08:14:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783412076;
	bh=F2nYKWWl6fKV1ODVGqLXuKiCYR5y2lxxAtCQSJik2Eo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=FwAUVK8eI5RU2CyXqbP5uo8yjYfbIl0tA5619XMMtRD4i5WUqHWM/mWgYyKbxVXpc
	 B4Afb7S4JENPuSzlqKIQfZkIQCkLm2B4+E51LlOS0MRAR6LmIbMQYtnzcEIjYPf0Lw
	 f12lUgJq0TeY/BsHtN0WW3v/knlq3KYq8zeRi+jkwFHh/t7Gq4U5yfx4bp/rKyd+IK
	 mq4jFEBU95r6mpWbATE5zY8FaYCDh9Hhc9Dzy7YY4zMNP3OVtH9CWmZti8kJTK6PVn
	 vjLeU6t4Gt4PV4TQidlzqO+LYKLq2KMjHCfE3BJY+zFXYCudQv6n6qujBWYg4NmbBk
	 IwcHbLWMyedhw==
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
Subject: [PATCH v8 6/6] coco: guest: arm64: Replace dummy CCA device with sysfs ABI
Date: Tue,  7 Jul 2026 13:43:50 +0530
Message-ID: <20260707081351.1680209-7-aneesh.kumar@kernel.org>
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

The SMCCC firmware driver now creates the arm-smccc platform device and
instantiates the CCA RSI auxiliary devices once the RSI ABI is discovered.
The arm64-specific arm-cca-dev platform device stub is therefore no longer
needed.

However, userspace has used the arm-cca-dev platform device to detect Arm
CCA Realm guests [1]. Removing it without a replacement would break that
detection and would also leave userspace depending on kernel device-model
details.

Add /sys/firmware/cca/realm_guest as a stable, architecture-provided ABI
for detecting whether the kernel is running as an Arm CCA Realm guest. The
file returns 1 in Realm world and 0 otherwise, similar to the existing s390
/sys/firmware/uv/prot_virt_guest interface for protected virtualization
guests.

Remove the dummy arm-cca-dev registration now that userspace has a
dedicated CCA Realm guest indicator, and document the new ABI in
Documentation/ABI/testing/sysfs-firmware-cca.

[1] https://lore.kernel.org/all/4a7d84b2-2ec4-4773-a2d5-7b63d5c683cf@arm.com

Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
---
 Documentation/ABI/testing/sysfs-firmware-cca | 10 +++++
 arch/arm64/kernel/rsi.c                      | 39 +++++++++++++++-----
 2 files changed, 39 insertions(+), 10 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-firmware-cca

diff --git a/Documentation/ABI/testing/sysfs-firmware-cca b/Documentation/ABI/testing/sysfs-firmware-cca
new file mode 100644
index 000000000000..bf177d636b92
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-firmware-cca
@@ -0,0 +1,10 @@
+What:		/sys/firmware/cca/realm_guest
+Date:		May 2026
+Contact:	Linux ARM Kernel Mailing list <linux-arm-kernel@lists.infradead.org>
+Description:	Read-only. Indicates whether the kernel is running as an
+		Arm Confidential Compute Architecture (CCA) Realm guest.
+
+		The value is one of:
+
+		0: the kernel is not running as a Realm guest
+		1: the kernel is running as a Realm guest
diff --git a/arch/arm64/kernel/rsi.c b/arch/arm64/kernel/rsi.c
index da440f71bb64..a333029ddf08 100644
--- a/arch/arm64/kernel/rsi.c
+++ b/arch/arm64/kernel/rsi.c
@@ -9,6 +9,8 @@
 #include <linux/swiotlb.h>
 #include <linux/cc_platform.h>
 #include <linux/platform_device.h>
+#include <linux/kobject.h>
+#include <linux/sysfs.h>
 
 #include <asm/io.h>
 #include <asm/mem_encrypt.h>
@@ -16,6 +18,7 @@
 #include <asm/rsi.h>
 
 static struct realm_config config;
+static struct kobject *cca_kobj;
 
 unsigned long prot_ns_shared;
 EXPORT_SYMBOL(prot_ns_shared);
@@ -160,17 +163,33 @@ void __init arm64_rsi_init(void)
 	static_branch_enable(&rsi_present);
 }
 
-static struct platform_device rsi_dev = {
-	.name = "arm-cca-dev",
-	.id = PLATFORM_DEVID_NONE
+static ssize_t cca_is_realm_guest(struct kobject *kobj,
+		struct kobj_attribute *attr, char *buf)
+{
+	return sysfs_emit(buf, "%d\n", is_realm_world());
+}
+
+static struct kobj_attribute cca_realm_guest =
+	__ATTR(realm_guest, 0444, cca_is_realm_guest, NULL);
+
+static const struct attribute *cca_realm_attrs[] = {
+	&cca_realm_guest.attr,
+	NULL,
 };
 
-static int __init arm64_create_dummy_rsi_dev(void)
+static int __init realm_sysfs_init(void)
 {
-	if (is_realm_world() &&
-	    platform_device_register(&rsi_dev))
-		pr_err("failed to register rsi platform device\n");
-	return 0;
-}
+	int ret;
+
+	cca_kobj = kobject_create_and_add("cca", firmware_kobj);
+	if (!cca_kobj)
+		return -ENOMEM;
 
-arch_initcall(arm64_create_dummy_rsi_dev)
+	ret = sysfs_create_files(cca_kobj, cca_realm_attrs);
+	if (!ret)
+		return 0;
+
+	kobject_put(cca_kobj);
+	return ret;
+}
+device_initcall(realm_sysfs_init);
-- 
2.43.0

