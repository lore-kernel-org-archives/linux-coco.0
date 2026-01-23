Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CFCD2F39D7
	for <linux-coco@lists.linux.dev>; Fri, 23 Jan 2026 15:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769180421; cv=none; b=q4QEguKVQuE9nWxl/fDgiIhSDboh8mHuZBK/S/y8lyqbBQamKVx3N33jO/O46BoV+1CzBvLKLJcs3y8Qaw8c6KS9dQYMlDVyEKHS73vjaMOfS0s1VW1gZLq2RIpG7nwK0W+GVODYnVrvzQFSems1JHXOACHn73SbPE4AXey27Hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769180421; c=relaxed/simple;
	bh=tCpcmovCbl3/A+tZy+bcjGs0zPptOmPyXEVVuw3kWpQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gG6x/9n+VwqzQmWo1KY7YRapAMkvNfEW7jeU5oiNBo0pdmsX56rmcTnmbN4dP9FJbQgU9ZZ+2rv6zMWwZ4AcifWxgB6NKLORwEGDP6u54a6xweOy7LMrrnWaXFBVcpCsO/KJHu4OoMBU28VgkgJM2zWWosj0qsNvZje+1gfzdS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ILJ6uWSq; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ILJ6uWSq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769180418; x=1800716418;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tCpcmovCbl3/A+tZy+bcjGs0zPptOmPyXEVVuw3kWpQ=;
  b=ILJ6uWSqufyWpNAuPPkwz7BUx7p1vIxvk/G5gc6WFI97Qfn00MnKvuXe
   0i46268VufHzScMvFf4xC9gsCWkqjuZnhovAPypxe0y/8zxWyoauSultk
   ZqJDOndVablqufDXo63414RwOFd+znnZ9jIboEqiqKlYrrt5wUT1xK3n3
   3p2X5DdSpMv7E5akb6hu4hmAqINd3PvFZ694p1hyG4vI4cWNF0mAfJTMm
   qxLhBUjdRq5sHlSWevjJg3X3//k8jW/rMHaBLRvVAWpY6oDR5KLEZShuE
   L2mNEjskkhgcXmu23p9y67jJ5sO7DEWfV995tJcitySTavz2FZsZB58SY
   w==;
X-CSE-ConnectionGUID: o3mcMyEzTcez4LkJsAgPlg==
X-CSE-MsgGUID: X0vTSOQmR+KAs3lC863kKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11680"; a="70334365"
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; 
   d="scan'208";a="70334365"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2026 07:00:10 -0800
X-CSE-ConnectionGUID: 1Sr+YLbfRsqwmaOVUyqbeg==
X-CSE-MsgGUID: nujEMQ3ESBKhi9kvOv0uNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; 
   d="scan'208";a="237697084"
Received: from 984fee019967.jf.intel.com ([10.23.153.244])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2026 07:00:10 -0800
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
	Chao Gao <chao.gao@intel.com>
Subject: [PATCH v3 05/26] coco/tdx-host: Expose TDX Module version
Date: Fri, 23 Jan 2026 06:55:13 -0800
Message-ID: <20260123145645.90444-6-chao.gao@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260123145645.90444-1-chao.gao@intel.com>
References: <20260123145645.90444-1-chao.gao@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For TDX Module updates, userspace needs to select compatible update
versions based on the current module version. This design delegates
module selection complexity to userspace because TDX Module update
policies are complex and version series are platform-specific.

For example, the 1.5.x series is for certain platform generations, while
the 2.0.x series is intended for others. And TDX Module 1.5.x may be
updated to 1.5.y but not to 1.5.y+1.

Expose the TDX Module version to userspace via sysfs to aid module
selection. Since the TDX faux device will drive module updates, expose
the version as its attribute.

This approach follows the pattern used by microcode updates and other
CoCo implementations:

1. AMD has a PCI device for the PSP for SEV which provides an existing
   place to hang their equivalent metadata.

2. ARM CCA will likely have a faux device (although it isn't obvious if
   they have a need to export version information there) [1]

3. Microcode revisions are exposed as CPU device attributes

One bonus of exposing TDX Module version via sysfs is: TDX Module
version information remains available even after dmesg logs are cleared.

Signed-off-by: Chao Gao <chao.gao@intel.com>
Link: https://lore.kernel.org/all/2025073035-bulginess-rematch-b92e@gregkh/ # [1]
---
v3:
 - Justify the sysfs ABI choice and expand background on other CoCo
   implementations.
---
 .../ABI/testing/sysfs-devices-faux-tdx-host   |  6 +++++
 drivers/virt/coco/tdx-host/tdx-host.c         | 26 ++++++++++++++++++-
 2 files changed, 31 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/ABI/testing/sysfs-devices-faux-tdx-host

diff --git a/Documentation/ABI/testing/sysfs-devices-faux-tdx-host b/Documentation/ABI/testing/sysfs-devices-faux-tdx-host
new file mode 100644
index 000000000000..901abbae2e61
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-devices-faux-tdx-host
@@ -0,0 +1,6 @@
+What:		/sys/devices/faux/tdx_host/version
+Contact:	linux-coco@lists.linux.dev
+Description:	(RO) Report the version of the loaded TDX Module. The TDX Module
+		version is formatted as x.y.z, where "x" is the major version,
+		"y" is the minor version and "z" is the update version. Versions
+		are used for bug reporting, TDX Module updates and etc.
diff --git a/drivers/virt/coco/tdx-host/tdx-host.c b/drivers/virt/coco/tdx-host/tdx-host.c
index c77885392b09..0424933b2560 100644
--- a/drivers/virt/coco/tdx-host/tdx-host.c
+++ b/drivers/virt/coco/tdx-host/tdx-host.c
@@ -8,6 +8,7 @@
 #include <linux/device/faux.h>
 #include <linux/module.h>
 #include <linux/mod_devicetable.h>
+#include <linux/sysfs.h>
 
 #include <asm/cpu_device_id.h>
 #include <asm/tdx.h>
@@ -18,6 +19,29 @@ static const struct x86_cpu_id tdx_host_ids[] = {
 };
 MODULE_DEVICE_TABLE(x86cpu, tdx_host_ids);
 
+static ssize_t version_show(struct device *dev, struct device_attribute *attr,
+			    char *buf)
+{
+	const struct tdx_sys_info *tdx_sysinfo = tdx_get_sysinfo();
+	const struct tdx_sys_info_version *ver;
+
+	if (!tdx_sysinfo)
+		return -ENXIO;
+
+	ver = &tdx_sysinfo->version;
+
+	return sysfs_emit(buf, "%u.%u.%02u\n", ver->major_version,
+					       ver->minor_version,
+					       ver->update_version);
+}
+static DEVICE_ATTR_RO(version);
+
+static struct attribute *tdx_host_attrs[] = {
+	&dev_attr_version.attr,
+	NULL,
+};
+ATTRIBUTE_GROUPS(tdx_host);
+
 static struct faux_device *fdev;
 
 static int __init tdx_host_init(void)
@@ -25,7 +49,7 @@ static int __init tdx_host_init(void)
 	if (!x86_match_cpu(tdx_host_ids) || !tdx_get_sysinfo())
 		return -ENODEV;
 
-	fdev = faux_device_create(KBUILD_MODNAME, NULL, NULL);
+	fdev = faux_device_create_with_groups(KBUILD_MODNAME, NULL, NULL, tdx_host_groups);
 	if (!fdev)
 		return -ENODEV;
 
-- 
2.47.3

