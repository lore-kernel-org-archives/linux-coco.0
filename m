Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF7BC27466D
	for <linux-coco@lists.linux.dev>; Wed,  1 Oct 2025 02:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759285428; cv=none; b=qmcbL/OSmv/EJ/sV83e3ye0h/V/RmH1ml6s5xsW/BhL2/HdDjOB7uy3Os/sLlCuGyfNy11F5pODXG23kdXqJgjvJ+DEbhe5isL2np4YVfgidwbSXVpydPdLE5W0t9HQbCivmTTQCQxkzObCaw845xaCZ/E8Sb/KSCHT5V8WZ4c4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759285428; c=relaxed/simple;
	bh=WxXsKqyjvjdx1jE1eDRPPZIssIPZhCk1RArR1l+TZM8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Fu3wa2XHayA2aXNVxMZrSH5IC/uQ8aru4kAyUF1nLPS3tezJ5a2pQ1Uwd3ewLmn6P2rm5yV4AB5MjqM3IVBJFDGkR5mj6vpXf4Ub2VD4ftFjXHdOMIR3/uJORmG0aM/Iwj413rkxy68f9loBqJnhMejwuNddE2c0zZsm7+R5Mbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Mg1OGnc7; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mg1OGnc7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759285426; x=1790821426;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WxXsKqyjvjdx1jE1eDRPPZIssIPZhCk1RArR1l+TZM8=;
  b=Mg1OGnc7WM2C4jRUUrlyKdBIXj3VI5BzLcbiqDaKJjv3ON+zL+otw8fo
   wHWYHFa1P6CXofj1LmZMyt3XGrG7LrkscmxEOPcnvRntzCOnWvzAx1hjz
   eKf6L9DkGb5yCPom76DzvuMI+Hle5CwaEcfMBxI/J07kXtlUMTuMfBrlT
   qUm5nJbmv/kHpVLBQvPW5NAx1Outsh70Zm2CKB92Kikcl9PCJMjlFUyIB
   RVOPo7Auvn12JxGkOZbnKZ5GvrHd/2Z7NXtKswHcshyIjkZtI9sNE98tD
   gBF9LxskxPShrLQhPIzs8Ov+6xOa+pT9cFdBb4JNPB9v0Nehi0Dy+VpV5
   A==;
X-CSE-ConnectionGUID: KvKbHD8FTj+g5ci162HZug==
X-CSE-MsgGUID: I4mnPHsBSSO3+JU86FqaRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="61445009"
X-IronPort-AV: E=Sophos;i="6.18,305,1751266800"; 
   d="scan'208";a="61445009"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2025 19:23:45 -0700
X-CSE-ConnectionGUID: M0C/LwP+SzG+oRNWd6CY5Q==
X-CSE-MsgGUID: Pf1CYrooQpWz68horitnaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,305,1751266800"; 
   d="scan'208";a="183079922"
Received: from 984fee019967.jf.intel.com ([10.165.54.94])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2025 19:23:46 -0700
From: Chao Gao <chao.gao@intel.com>
To: linux-coco@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	x86@kernel.org
Cc: Chao Gao <chao.gao@intel.com>,
	"Kirill A. Shutemov" <kas@kernel.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Xu Yilun <yilun.xu@linux.intel.com>
Subject: [PATCH 2/2] coco/tdx-host: Expose TDX module version
Date: Tue, 30 Sep 2025 19:22:45 -0700
Message-ID: <20251001022309.277238-3-chao.gao@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251001022309.277238-1-chao.gao@intel.com>
References: <20251001022309.277238-1-chao.gao@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently these is no way to know the TDX module version from the
userspace. such information is helpful for bug reporting or
debugging.

With the tdx-host device in place, expose the TDX module version as
a device attribute via sysfs.

Signed-off-by: Chao Gao <chao.gao@intel.com>
---
 .../ABI/testing/sysfs-devices-faux-tdx-host   |  6 +++++
 MAINTAINERS                                   |  1 +
 drivers/virt/coco/tdx-host/tdx-host.c         | 25 ++++++++++++++++++-
 3 files changed, 31 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/ABI/testing/sysfs-devices-faux-tdx-host

diff --git a/Documentation/ABI/testing/sysfs-devices-faux-tdx-host b/Documentation/ABI/testing/sysfs-devices-faux-tdx-host
new file mode 100644
index 000000000000..18d4a4a71b80
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-devices-faux-tdx-host
@@ -0,0 +1,6 @@
+What:		/sys/devices/faux/tdx_host/version
+Contact:	linux-coco@lists.linux.dev
+Description:	(RO) Report the version of the loaded TDX module. The TDX module
+		version is formatted as x.y.z, where "x" is the major version,
+		"y" is the minor version and "z" is the update version. Versions
+		are used for bug reporting, TD-Preserving updates and etc.
diff --git a/MAINTAINERS b/MAINTAINERS
index c1ad1294560c..7560dcf8a53d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -27333,6 +27333,7 @@ L:	x86@kernel.org
 L:	linux-coco@lists.linux.dev
 S:	Supported
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/tdx
+F:	Documentation/ABI/testing/sysfs-devices-faux-tdx-host
 F:	Documentation/ABI/testing/sysfs-devices-virtual-misc-tdx_guest
 F:	arch/x86/boot/compressed/tdx*
 F:	arch/x86/coco/tdx/
diff --git a/drivers/virt/coco/tdx-host/tdx-host.c b/drivers/virt/coco/tdx-host/tdx-host.c
index 49c205913ef6..968a19f4e01a 100644
--- a/drivers/virt/coco/tdx-host/tdx-host.c
+++ b/drivers/virt/coco/tdx-host/tdx-host.c
@@ -22,6 +22,29 @@ MODULE_DEVICE_TABLE(x86cpu, tdx_host_ids);
 
 static struct faux_device *fdev;
 
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
 static int __init tdx_host_init(void)
 {
 	int r;
@@ -34,7 +57,7 @@ static int __init tdx_host_init(void)
 	if (r)
 		return r;
 
-	fdev = faux_device_create(KBUILD_MODNAME, NULL, NULL);
+	fdev = faux_device_create_with_groups(KBUILD_MODNAME, NULL, NULL, tdx_host_groups);
 	if (!fdev)
 		return -ENODEV;
 
-- 
2.47.3

