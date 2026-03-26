Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FA323C553B
	for <linux-coco@lists.linux.dev>; Thu, 26 Mar 2026 08:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774514748; cv=none; b=nHhQYfZi1ONceKw/nxiZAd2/E13fnXP/GwtNYClQ5jShU1ua80xOvpdKdOXOdJ9why4sxUt2Tlh3xjJoy3lqtbAamdUyea78Hcz1fWm4ZBhST7tMFvgH/DcFwXYX5igDKAfaTtU35trI2U213fnkXcHpDhWobMnVCOgJMGWVt1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774514748; c=relaxed/simple;
	bh=S3d9W95aAm3aV0Jdu73JiNtI6xpUrDsl5gsbV6FJ+DE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=a+XHAABNM+xgQGbyvK214GNvT9uXDj3l4ANS9BvgYY20/LjkkSDbROp10bk9o6nj4VR10MZfKtzlhGHbqamUWLu1KPNoiscTGfMBLwsM5e8XqvNxf2egAf7KYGtTDVccQMWOek7qyVR9pbMwDyls3uz6WYWo0M9aW5ctscnbmDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VJzjsyUp; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VJzjsyUp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774514746; x=1806050746;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=S3d9W95aAm3aV0Jdu73JiNtI6xpUrDsl5gsbV6FJ+DE=;
  b=VJzjsyUpdeTo7NCI/VeiE+YSxGbLxglnN//o98fxLrf/H+qI2p4VMGcM
   9tB9PR2PzhdZjLfVC4PPd1msM8N+ZH52FeJM7HiSvSc/2x5GugDlzAx23
   QKmz+O4uG/cy8QmpxtD2FOGhUsnqn52EVfyQvjfltvtfM37KYdxtaM5yU
   muh5N9gPuuzNrpIpph9rYfViK1bMtxCmSjUkosNMck/sFKVTOHYdszmad
   wCKOdgsp56vA1dK8S5wCzjzbkMqWbzPcwzvaM5aqCMd9wBmsHfFVqR/iV
   SyjZOdmb6rseg0qB5B7I0qoIygn31y3/bK80aO+Pn4EyEV9NV14iMTQt4
   g==;
X-CSE-ConnectionGUID: kP3ejV3XSi+O0m2TyoPyqw==
X-CSE-MsgGUID: /Cys5iQSS6+5MoOx+FRRzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="86644771"
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; 
   d="scan'208";a="86644771"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2026 01:45:27 -0700
X-CSE-ConnectionGUID: 7kQtYEwPRnq9tNJaTVd/Dg==
X-CSE-MsgGUID: fTBAZCQTQsGGfUlai/2oEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; 
   d="scan'208";a="224967253"
Received: from 984fee019967.jf.intel.com ([10.23.153.244])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2026 01:45:27 -0700
From: Chao Gao <chao.gao@intel.com>
To: x86@kernel.org,
	linux-coco@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: binbin.wu@linux.intel.com,
	dan.j.williams@intel.com,
	dave.hansen@linux.intel.com,
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
	Chao Gao <chao.gao@intel.com>
Subject: [PATCH v6 20/22] coco/tdx-host: Document TDX module update compatibility criteria
Date: Thu, 26 Mar 2026 01:44:11 -0700
Message-ID: <20260326084448.29947-21-chao.gao@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260326084448.29947-1-chao.gao@intel.com>
References: <20260326084448.29947-1-chao.gao@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The TDX module update protocol facilitates compatible runtime updates.

Document the compatibility criteria and indicators of various update
failures, including violations of the compatibility criteria.

Note that runtime TDX module updates are an "update at your own risk"
operation; userspace must enforce all of the above compatibility
criteria.

Signed-off-by: Chao Gao <chao.gao@intel.com>
Reviewed-by: Dan Williams <dan.j.williams@intel.com>
Reviewed-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
---
v6:
 - improve the error scenario descriptions

v5:
 - drop "dead documentation" about tdxctl
 - add a note in the changelog clarifying that users update at their own risk
 - revise the error code for update limit exhaustion—it changed after
   dropping the related patch.
v4:
 - Drop "compat_capable" kernel ABI [Dan]
 - Document Linux compatibility expectations and results of violating
   them [Dan]
---
 .../ABI/testing/sysfs-devices-faux-tdx-host   | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-devices-faux-tdx-host b/Documentation/ABI/testing/sysfs-devices-faux-tdx-host
index f7221f2e5fec..e1a2f3b2ea65 100644
--- a/Documentation/ABI/testing/sysfs-devices-faux-tdx-host
+++ b/Documentation/ABI/testing/sysfs-devices-faux-tdx-host
@@ -26,3 +26,50 @@ Description:	(RO) Report the number of remaining updates. TDX maintains a
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
+		facilitates "Compatible TDX Module Updates". A compatible update
+		is one that meets the following criteria:
+
+		   Does not interrupt or interfere with any current TDX
+		   operation or TD VM.
+
+		   Does not invalidate any previously consumed Module metadata
+		   values outside of the TEE_TCB_SVN_2 field (updated Security
+		   Version Number) in TD Quotes.
+
+		   Does not require validation of new Module metadata fields. By
+		   implication, new Module features and capabilities are only
+		   available by installing the Module at reboot (BIOS or EFI
+		   helper loaded).
+
+		See tdx_host/firmware/tdx_module/error for information on
+		compatibility check failures.
+
+What:		/sys/devices/faux/tdx_host/firmware/tdx_module/error
+Contact:	linux-coco@lists.linux.dev
+Description:	(RO) See Documentation/ABI/testing/sysfs-class-firmware for
+		baseline expectations for this file. The <ERROR> part in the
+		<STATUS>:<ERROR> format can be:
+
+		   "device-busy": Conflicting operations are in progress, e.g., TD
+				  build or TD migration.
+
+		   "read-write-error": Memory allocation failed.
+
+		   "hw-error": Communication with P-SEAMLDR or TDX module failed
+			       or update limit exhausted.
+
+		   "firmware-invalid": The provided TDX module update is invalid,
+				       or other unexpected errors occurred.
+
+		"hw-error" or "firmware-invalid" may be fatal, causing all TDs
+		and the TDX module to be lost and preventing further TDX
+		operations. This occurs when reading
+		/sys/devices/faux/tdx_host/version returns -ENXIO. For other
+		errors, TDs and the (previous) TDX module stay running.
-- 
2.47.3

