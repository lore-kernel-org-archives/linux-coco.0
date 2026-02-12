Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7742E35D614
	for <linux-coco@lists.linux.dev>; Thu, 12 Feb 2026 14:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770906979; cv=none; b=ss6zEIidyuz+J5k0kh4z6igbTQZK+WigEjbgA0t1YTcy/Ifab4uY0N3weVNPRikqF4EgFNZuK57APEWLp67lmGzR/xNj5pfMJ7P/zSxAEHqBE9U3BV0AEgpLckuToOXmj1ul5+tLcZonFONeETKIigiIgiZEKt0ybI25jbydsJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770906979; c=relaxed/simple;
	bh=NwGxgxxv67qQfhDlV97kBQ4LB9bhRYnlF9Cm5Th1n1E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tII8nc0GujhQYpSPvWrhyiUaCZ69DSb1UigsppBGGeDKGz1VH4pa8rF3bL5M7Yn1HAHBIjIQ0IITux5jd5+j7vjFd4ga5CL43IVQBP94sXwcE4ED4CBEE8TkgPCkqNN83d5euIMlkPuE+t4CDmRs20+LownORXWJxhM5X+6wZ/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V3BiJmzs; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V3BiJmzs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770906977; x=1802442977;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=NwGxgxxv67qQfhDlV97kBQ4LB9bhRYnlF9Cm5Th1n1E=;
  b=V3BiJmzstp4KtDmSDNl4cXi1h1hrpvipqtNvhBHTc0hFK/aXObq+QNaX
   WtZUoVzRTAMmEryR8CDjKpQ3bn0i/n6pROMdTFRWeBhVyePZG2Dimhw5o
   4sHr3swQCCjsgnayRTu/rgZXUWD8amt0lWYvCJs/k8oteeJpN9luF6IjT
   iRix43nPJx/Y26vLCHV/JfIhithgGEpaNGhAN+yZihkF4ElOisE/YreNd
   Bq2d2yj8+enHsHh/e7QQYpKIrAeSPlnoGy6THH8Y3Tai6zCPyNfFDwAFL
   HBbUjDnkfCzgfUTWlyF5pqmRpRr0OxeO0/LifqVv/HSqlfOsfocroAal6
   A==;
X-CSE-ConnectionGUID: E2VExBZlTPWwZmXaWD4bYg==
X-CSE-MsgGUID: HCI6LpCPSC6xfVQiOMua7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11699"; a="89662785"
X-IronPort-AV: E=Sophos;i="6.21,286,1763452800"; 
   d="scan'208";a="89662785"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 06:36:17 -0800
X-CSE-ConnectionGUID: uhnN0O1BRwm9trStFHVHlA==
X-CSE-MsgGUID: 0luhNMCaQdG0C/gfutRFLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,286,1763452800"; 
   d="scan'208";a="211428227"
Received: from 984fee019967.jf.intel.com ([10.23.153.244])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 06:36:16 -0800
From: Chao Gao <chao.gao@intel.com>
To: linux-coco@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	x86@kernel.org
Cc: reinette.chatre@intel.com,
	ira.weiny@intel.com,
	kai.huang@intel.com,
	dan.j.williams@intel.com,
	yilun.xu@linux.intel.com,
	sagis@google.com,
	vannapurve@google.com,
	paulmck@kernel.org,
	nik.borisov@suse.com,
	zhenzhong.duan@intel.com,
	seanjc@google.com,
	rick.p.edgecombe@intel.com,
	kas@kernel.org,
	dave.hansen@linux.intel.com,
	vishal.l.verma@intel.com,
	binbin.wu@linux.intel.com,
	tony.lindgren@linux.intel.com,
	Chao Gao <chao.gao@intel.com>,
	Farrah Chen <farrah.chen@intel.com>
Subject: [PATCH v4 06/24] coco/tdx-host: Expose P-SEAMLDR information via sysfs
Date: Thu, 12 Feb 2026 06:35:09 -0800
Message-ID: <20260212143606.534586-7-chao.gao@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260212143606.534586-1-chao.gao@intel.com>
References: <20260212143606.534586-1-chao.gao@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

TDX Module updates require userspace to select the appropriate module
to load. Expose necessary information to facilitate this decision. Two
values are needed:

- P-SEAMLDR version: for compatibility checks between TDX Module and
		     P-SEAMLDR
- num_remaining_updates: indicates how many updates can be performed

Expose them as tdx-host device attributes.

Signed-off-by: Chao Gao <chao.gao@intel.com>
Reviewed-by: Tony Lindgren <tony.lindgren@linux.intel.com>
Tested-by: Farrah Chen <farrah.chen@intel.com>
---
v4:
 - Make seamldr attribute permission "0400" [Dave]
 - Don't include implementation details in OS ABI docs [Dave]
 - Tag tdx_host_group as static [Kai]

v3:
 - use #ifdef rather than .is_visible() to control P-SEAMLDR sysfs
   visibility [Yilun]
---
 .../ABI/testing/sysfs-devices-faux-tdx-host   | 23 +++++++
 drivers/virt/coco/tdx-host/tdx-host.c         | 63 ++++++++++++++++++-
 2 files changed, 85 insertions(+), 1 deletion(-)

diff --git a/Documentation/ABI/testing/sysfs-devices-faux-tdx-host b/Documentation/ABI/testing/sysfs-devices-faux-tdx-host
index 901abbae2e61..88a9c0b2bdfe 100644
--- a/Documentation/ABI/testing/sysfs-devices-faux-tdx-host
+++ b/Documentation/ABI/testing/sysfs-devices-faux-tdx-host
@@ -4,3 +4,26 @@ Description:	(RO) Report the version of the loaded TDX Module. The TDX Module
 		version is formatted as x.y.z, where "x" is the major version,
 		"y" is the minor version and "z" is the update version. Versions
 		are used for bug reporting, TDX Module updates and etc.
+
+What:		/sys/devices/faux/tdx_host/seamldr/version
+Contact:	linux-coco@lists.linux.dev
+Description:	(RO) Report the version of the loaded SEAM loader. The SEAM
+		loader version is formatted as x.y.z, where "x" is the major
+		version, "y" is the minor version and "z" is the update version.
+		Versions are used for bug reporting and compatibility checks.
+
+What:		/sys/devices/faux/tdx_host/seamldr/num_remaining_updates
+Contact:	linux-coco@lists.linux.dev
+Description:	(RO) Report the number of remaining updates. TDX maintains a
+		log about each TDX Module which has been loaded. This log has
+		a finite size which limits the number of TDX Module updates
+		which can be performed.
+
+		After each successful update, the number reduces by one. Once it
+		reaches zero, further updates will fail until next reboot. The
+		number is always zero if the P-SEAMLDR doesn't support updates.
+
+		See Intel® Trust Domain Extensions - SEAM Loader (SEAMLDR)
+		Interface Specification, Revision 343755-003, Chapter 3.3
+		"SEAMLDR_INFO" and Chapter 4.2 "SEAMLDR.INSTALL" for more
+		information.
diff --git a/drivers/virt/coco/tdx-host/tdx-host.c b/drivers/virt/coco/tdx-host/tdx-host.c
index 0424933b2560..fd6ffb4f2ff1 100644
--- a/drivers/virt/coco/tdx-host/tdx-host.c
+++ b/drivers/virt/coco/tdx-host/tdx-host.c
@@ -11,6 +11,7 @@
 #include <linux/sysfs.h>
 
 #include <asm/cpu_device_id.h>
+#include <asm/seamldr.h>
 #include <asm/tdx.h>
 
 static const struct x86_cpu_id tdx_host_ids[] = {
@@ -40,7 +41,67 @@ static struct attribute *tdx_host_attrs[] = {
 	&dev_attr_version.attr,
 	NULL,
 };
-ATTRIBUTE_GROUPS(tdx_host);
+
+static struct attribute_group tdx_host_group = {
+	.attrs = tdx_host_attrs,
+};
+
+static ssize_t seamldr_version_show(struct device *dev, struct device_attribute *attr,
+				    char *buf)
+{
+	struct seamldr_info info;
+	int ret;
+
+	ret = seamldr_get_info(&info);
+	if (ret)
+		return ret;
+
+	return sysfs_emit(buf, "%u.%u.%02u\n", info.major_version,
+					       info.minor_version,
+					       info.update_version);
+}
+
+static ssize_t num_remaining_updates_show(struct device *dev,
+					  struct device_attribute *attr,
+					  char *buf)
+{
+	struct seamldr_info info;
+	int ret;
+
+	ret = seamldr_get_info(&info);
+	if (ret)
+		return ret;
+
+	return sysfs_emit(buf, "%u\n", info.num_remaining_updates);
+}
+
+/*
+ * Open-code DEVICE_ATTR_ADMIN_RO to specify a different 'show' function
+ * for P-SEAMLDR version as version_show() is used for TDX Module version.
+ *
+ * admin-only readable as reading these attributes calls into P-SEAMLDR,
+ * which may have potential performance and system impact.
+ */
+static struct device_attribute dev_attr_seamldr_version =
+	__ATTR(version, 0400, seamldr_version_show, NULL);
+static DEVICE_ATTR_ADMIN_RO(num_remaining_updates);
+
+static struct attribute *seamldr_attrs[] = {
+	&dev_attr_seamldr_version.attr,
+	&dev_attr_num_remaining_updates.attr,
+	NULL,
+};
+
+static struct attribute_group seamldr_group = {
+	.name = "seamldr",
+	.attrs = seamldr_attrs,
+};
+
+static const struct attribute_group *tdx_host_groups[] = {
+	&tdx_host_group,
+	&seamldr_group,
+	NULL,
+};
 
 static struct faux_device *fdev;
 
-- 
2.47.3

