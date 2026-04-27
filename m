Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 171403CCFD1
	for <linux-coco@lists.linux.dev>; Mon, 27 Apr 2026 15:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777303815; cv=none; b=jRUyH5kPmdBrOQoE5tC3P5V55DbeN67g8cxz76xkIZuUnPL5Lveg1hPysNBzxFwPCHKom4HveHlZ9713ozgDPzCrd4OAU2wePSeG54LeyzEy9O8/O3i/+TbrunZCQgSIKLtjaya0NxTzwyF+7+97OFEtugQGP/GtBQvNc1H84/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777303815; c=relaxed/simple;
	bh=kCDnYE84IhcVSaGCNgIxLXQGT3/fsvk1n+/vFHxvdo4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=m5rv+jKqq3ep3B8YakfG+EtiiNGAKORiGMb+jTkewDOLdA7zzKqiRu7f0WGrxV+kOubb1Kb6nbXRSOiwuCsSxGIlRzGpIZJcvyF3WCepVlX6pYMhN+1HIn7i8PQsGveW/LgFREv3MBgm18zFBxKnEZrAhGZGLCZIzrOnJCijG00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aV8FZee0; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aV8FZee0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777303813; x=1808839813;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=kCDnYE84IhcVSaGCNgIxLXQGT3/fsvk1n+/vFHxvdo4=;
  b=aV8FZee0ytDbtU95KI2e/K+VcCAZn/UPyHnNBXqfmSUiiOGp4vYsslCl
   ON4y8bQlP//yl9fq/VRw87GXLVvigvJoZHOMR+GOFW98P5jbfjHwMLpVg
   PB5OATq9bfS1ptQo522Gyn8cjhK/8JahqIM4iQRa50GnPb4mWwmRvBxdo
   9RwcPXY8tQcLi2S8CiKbP6mAjCVtjNrK2qGCbH99qNPFvuqnesWjWPtHY
   yoizNh6zYZBhJgstaDgJtP8YdQkODD7/5iVLN0868Apu5UBTm+fjmMkDA
   NvwkF2gJCwtSQgLz+7pnazMqsHenkAuy+uDuIkyIg4ooqMrELBOR1e9zJ
   A==;
X-CSE-ConnectionGUID: Rh1eSrgdTvOn0CESlZ/tlw==
X-CSE-MsgGUID: n/xeVqebQ3+mwXW24f8aTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11769"; a="77900826"
X-IronPort-AV: E=Sophos;i="6.23,202,1770624000"; 
   d="scan'208";a="77900826"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2026 08:30:07 -0700
X-CSE-ConnectionGUID: MvDe03MAR3qRswU3bOMrnQ==
X-CSE-MsgGUID: hpuV16JLTS2IP2iUAaMO8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,202,1770624000"; 
   d="scan'208";a="232673363"
Received: from 984fee019967.jf.intel.com ([10.23.153.244])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2026 08:30:07 -0700
From: Chao Gao <chao.gao@intel.com>
To: kvm@vger.kernel.org,
	linux-coco@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	x86@kernel.org
Cc: binbin.wu@linux.intel.com,
	dave.hansen@linux.intel.com,
	djbw@kernel.org,
	ira.weiny@intel.com,
	kai.huang@intel.com,
	kas@kernel.org,
	nik.borisov@suse.com,
	paulmck@kernel.org,
	pbonzini@redhat.com,
	reinette.chatre@intel.com,
	rick.p.edgecombe@intel.com,
	sagis@google.com,
	seanjc@google.com,
	tony.lindgren@linux.intel.com,
	vannapurve@google.com,
	vishal.l.verma@intel.com,
	yilun.xu@linux.intel.com,
	xiaoyao.li@intel.com,
	yan.y.zhao@intel.com,
	Chao Gao <chao.gao@intel.com>,
	Dan Williams <dan.j.williams@intel.com>
Subject: [PATCH v8 20/21] coco/tdx-host: Document TDX module update compatibility criteria
Date: Mon, 27 Apr 2026 08:28:14 -0700
Message-ID: <20260427152854.101171-21-chao.gao@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260427152854.101171-1-chao.gao@intel.com>
References: <20260427152854.101171-1-chao.gao@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The TDX module update protocol facilitates compatible runtime updates.

Document the compatibility criteria and indicators of update failures.

Note that runtime TDX module updates are an "update at your own risk"
operation; userspace is responsible for ensureing that the update meets
the compatibility criteria.

Signed-off-by: Chao Gao <chao.gao@intel.com>
Reviewed-by: Dan Williams <dan.j.williams@intel.com>
Reviewed-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
---
v8:
 - Do not map -EIO and -ENOMEM to separate fw_upload errors. There is no
   current need to distinguish them in the userspace ABI, and fw_upload
   has no matching error code for -ENOMEM.
 - some wording changes.
---
 .../ABI/testing/sysfs-devices-faux-tdx-host   | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-devices-faux-tdx-host b/Documentation/ABI/testing/sysfs-devices-faux-tdx-host
index 65897fe6abc0..ff585c79aa6e 100644
--- a/Documentation/ABI/testing/sysfs-devices-faux-tdx-host
+++ b/Documentation/ABI/testing/sysfs-devices-faux-tdx-host
@@ -26,3 +26,42 @@ Description:	(RO) Report the number of remaining updates. TDX maintains a
 		See Intel® Trust Domain Extensions - SEAM Loader (SEAMLDR)
 		Interface Specification, Chapter "SEAMLDR_INFO" and Chapter
 		"SEAMLDR.INSTALL" for more information.
+
+What:		/sys/devices/faux/tdx_host/firmware/tdx_module
+Contact:	linux-coco@lists.linux.dev
+Description:	(Directory) The tdx_module directory implements the fw_upload
+		sysfs ABI, see Documentation/ABI/testing/sysfs-class-firmware
+		for the general description of the attributes @data, @cancel,
+		@error, @loading, @remaining_size, and @status. This ABI
+		facilitates "Compatible TDX module Updates". A compatible update
+		is one that meets the following criteria:
+
+		   Does not interrupt or interfere with any current TDX
+		   operation or TD VM.
+
+		   Does not invalidate any previously consumed module metadata
+		   values outside of the TEE_TCB_SVN_2 field (updated Security
+		   Version Number) in TD Quotes.
+
+		   Does not require validation of new module metadata fields. By
+		   implication, new module features and capabilities are only
+		   available by installing the module at reboot (BIOS or EFI
+		   helper loaded).
+
+		See tdx_host/firmware/tdx_module/error for information on
+		update failure indicators.
+
+What:		/sys/devices/faux/tdx_host/firmware/tdx_module/error
+Contact:	linux-coco@lists.linux.dev
+Description:	(RO) See Documentation/ABI/testing/sysfs-class-firmware for
+		baseline expectations for this file. The <ERROR> part in the
+		<STATUS>:<ERROR> format can be:
+
+		   "device-busy": The update conflicts with an in-progress TDX
+		   operation.
+
+		   "firmware-invalid": The update failed for any other reason.
+
+		A "firmware-invalid" result may be fatal. If the TDX module is
+		lost, further TDX operation is not possible, and reading
+		/sys/devices/faux/tdx_host/version returns -ENXIO.
-- 
2.47.1

