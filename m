Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AE934CA287
	for <linux-coco@lists.linux.dev>; Wed, 13 May 2026 15:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778685123; cv=none; b=H9Z2Ca+Y58NBKoeH4oR4Hy4HcR2IWcGlR/AKKL9lvC8BfOangoS4TR0fRV8s0azJ4lKE4rQOKxQFd/dOsja94QK+eNf2VFN3xpFfko25hUgiLdPwK5S6YgLTYUFfWgTEK0q+i+Nu3unOg68u0SPAFSFkxq4sUC+W4V8ZqjyWgW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778685123; c=relaxed/simple;
	bh=gWj4SKVTRQCwExj/mUY7jfmfe/QOQ3xzc83+8c8gWAc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RbvVXLmNT8URZ6dLbrckt9z+mYkz3ofcxw/IS2d747+3qWlNSvDM4HAmW3pG5QNiYNnRVzqlb9Dty96s0qaj9dsRVgfjLQEkc9o9xIg8KqW6p8bIYfBj3TxOjgJ9bkUnTqR5aPzk6DxESEnhN9wbX6cERBmyum5F9fmqMcVb4nM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=edD8N4cG; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="edD8N4cG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778685122; x=1810221122;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=gWj4SKVTRQCwExj/mUY7jfmfe/QOQ3xzc83+8c8gWAc=;
  b=edD8N4cGNO2ZTdRY9tCWqUOOIgqwoJMAza0rpUHZgLJTb0uBUs0D/GYl
   pDH6rWAnZ3IyQtfT6dRpTbsp5Dx7pCSVCseCASb/FQW0avGtww+EhqouU
   ftyDuRHmLt4HDrmJrJrawgVPrpNWmGpcHe0V6uXKrixuwEZ9cVtRJArSA
   eyu9YZ1N2WcCYmJ3pTtEBASVi0CyEFWFlit3/M6sx5oGTMa3atqT8bQNH
   eCbwgEZG4F8c5CnJ4sEkGxkof/AS/2Wz/FeL4MtZoV8yuneBIO0d9yT38
   YsrkP9InHmHATO9L8YbLcE17uRAXFTHGaFQ0EwTKqszgDf+YCx/409vMR
   w==;
X-CSE-ConnectionGUID: B9beSJ9+QcKxxY0OZ5Dd1Q==
X-CSE-MsgGUID: on7ZkhJeRj20W0vMtVCCvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="89921822"
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; 
   d="scan'208";a="89921822"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 08:12:01 -0700
X-CSE-ConnectionGUID: 9HZRAnETT5uGIAx+21Wvbw==
X-CSE-MsgGUID: f0eUhzklR9iyLwPnM3EozQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; 
   d="scan'208";a="231716930"
Received: from 984fee019967.jf.intel.com ([10.23.153.244])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 08:12:00 -0700
From: Chao Gao <chao.gao@intel.com>
To: kvm@vger.kernel.org,
	linux-coco@lists.linux.dev,
	x86@kernel.org,
	linux-kernel@vger.kernel.org
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
Subject: [PATCH v9 22/23] coco/tdx-host: Document TDX module update compatibility criteria
Date: Wed, 13 May 2026 08:10:05 -0700
Message-ID: <20260513151045.1420990-23-chao.gao@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260513151045.1420990-1-chao.gao@intel.com>
References: <20260513151045.1420990-1-chao.gao@intel.com>
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
operation; userspace is responsible for ensuring that the update meets
the compatibility criteria.

Signed-off-by: Chao Gao <chao.gao@intel.com>
Reviewed-by: Dan Williams <dan.j.williams@intel.com>
Reviewed-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
---
v9:
 - Reword the update error descriptions.
---
 .../ABI/testing/sysfs-devices-faux-tdx-host   | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-devices-faux-tdx-host b/Documentation/ABI/testing/sysfs-devices-faux-tdx-host
index 65897fe6abc0..9e08db231da1 100644
--- a/Documentation/ABI/testing/sysfs-devices-faux-tdx-host
+++ b/Documentation/ABI/testing/sysfs-devices-faux-tdx-host
@@ -26,3 +26,43 @@ Description:	(RO) Report the number of remaining updates. TDX maintains a
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
+		   "device-busy": The update conflicted with an ongoing
+		   compatibility-sensitive operation.
+
+		   "firmware-invalid": The update failed for any other reason.
+
+		"firmware-invalid" may be fatal, causing all TDs and the TDX
+		module to be lost and preventing further TDX operations. This
+		occurs when reading /sys/devices/faux/tdx_host/version returns
+		-ENXIO.
-- 
2.52.0

