Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC5CB3DB323;
	Mon, 14 Sep 2026 06:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789365974; cv=none; b=m8ngowAZpWZeRJDYwRUytCta0ButcvhvUu+GhiX4SKHO6HCVJCsFo/zWkP/+axRgJN2Oe5TUPDvO1EZdN/UdVPDkxYjkLKVmQAzNBDZ6sLsKNavpQYv+dYFMK443/p/4TGlGX+2I3tInlkXdbQ6Bh/ZlOEaL9//EnkphNYB18yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789365974; c=relaxed/simple;
	bh=WVhEo6SeEQqP+QvIKbU+21Y16Dfk6SYNjbB2vqoqLF8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Yp0RzKxJFJF1QLyJ8T12ahaMF9j/tKCj6CZLLtusdBoVSFVxbJN1c8EoykwN1fkb8xvqRFmSUszcm6LHe8bBUhvEnA+hSANi3CCVR/Tagv6p3F+RQYB/t/wIi4aGT8R13kZ3iI6+ov31EpKMeG17nf5AGwKz2gs5//KNBqzW3x8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CzoYt5Vg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CzoYt5Vg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40CAB1F00893;
	Mon, 14 Sep 2026 06:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789365966;
	bh=zQhmhJMTXwneX/RqH3DzVF+nOtJL2DGWLLD8wsqyKPs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=CzoYt5VgNmseKdHJScMgJ8A7M8ysbwdkORR7hRm7LXrvSVI3h/67n0xvtBU/aPYNW
	 8mmsqszPwekSJGVQJZdFUmrSGpRp8jBuvLq29DvAOs3d/h+Yen4iUYv7QxV9Lfjdy0
	 pxJ6VBuvl/wVhJ2f3zxLH8Z0HkKBzm+uniWMzDcTgVJZ2Q+TfQoGzcfO4x7IlhAVGk
	 x1R7MqIXgSiSApdrLEu4j2LL5fl2S9lakRjkFtmRhqQ78MyeseWSwKXi/0u70cvSt9
	 KirrPdP720sKVFcrvwCJlDG+xP9gZ0RZs/YFkPzlFxQc9On7xC+cnWturF8FMZlHNy
	 yzPcqWSRdUGOw==
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
Subject: [PATCH v11 7/7] coco: guest: arm64: Replace dummy CCA device with sysfs ABI
Date: Mon, 14 Sep 2026 11:35:11 +0530
Message-ID: <20260914060511.277948-8-aneesh.kumar@kernel.org>
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

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
---
 Documentation/ABI/testing/sysfs-firmware-cca | 10 +++++
 drivers/firmware/arm_rmm/rsi.c               | 42 +++++++++++++++-----
 2 files changed, 42 insertions(+), 10 deletions(-)
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
diff --git a/drivers/firmware/arm_rmm/rsi.c b/drivers/firmware/arm_rmm/rsi.c
index 2dd69febedbd..52f40256bd78 100644
--- a/drivers/firmware/arm_rmm/rsi.c
+++ b/drivers/firmware/arm_rmm/rsi.c
@@ -9,12 +9,15 @@
 #include <linux/swiotlb.h>
 #include <linux/platform_device.h>
 #include <linux/arm-rsi-cmds.h>
+#include <linux/kobject.h>
+#include <linux/sysfs.h>
 
 #include <asm/io.h>
 #include <asm/mem_encrypt.h>
 #include <asm/pgtable.h>
 
 static struct realm_config config;
+static struct kobject *cca_kobj;
 
 unsigned long prot_ns_shared;
 EXPORT_SYMBOL(prot_ns_shared);
@@ -182,17 +185,36 @@ void __init arm64_rsi_init(void)
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
 
-arch_initcall(arm64_create_dummy_rsi_dev)
+	if (!static_branch_unlikely(&rsi_present))
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
-- 
2.43.0

