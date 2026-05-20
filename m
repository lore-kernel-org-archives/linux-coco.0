Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D397E3F1AD1
	for <linux-coco@lists.linux.dev>; Wed, 20 May 2026 13:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779284439; cv=none; b=EzHYdbmsCGQj/pPyQtH7c2d2s0TSmnONGV7assbjU5J5skGIIAB0yj647e+nskHjb7rzaCA7ohAg1QlSHtCjvw5v6oas6IOlkQtGzYjpWbpYVn19F9hCEk3zmNlYJMGNhy2KpGPmmjy/WebWWyHAQNtlvvi0/WwHUlLHc2muZSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779284439; c=relaxed/simple;
	bh=A2JgB4DHHopxCwX7Y7WmXKD8JTPjRRUlFhYez/KTiCQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CkUODgzI4lP5oU4qUhvndN+6wPe4J2UXZKTWk1bzoxTdiptoxdAW64Pl5O1OcNj+IV5TzFs/QzAXkxct7dOaUrOZu9VvMuKuAEasA7IjQtP8zfijOvQaiZSPShI3pfVlSsoZi+y3Xq4eAsMJefI8PQ56IntFMrI+IyvFJMzFmBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UVhP3Mrn; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UVhP3Mrn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779284438; x=1810820438;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=A2JgB4DHHopxCwX7Y7WmXKD8JTPjRRUlFhYez/KTiCQ=;
  b=UVhP3MrnhkISE8kRv8+qYLyM9REge98YH5bqR9fKmfiVXnI9epTW5KOO
   IFH5eFdAWnMfRKcynqYPQor/gfQgXOHeK4oyA9QpN22tzw4wI+FefcVlH
   oDxuUMahjDf7ruUnGTXgkvmK+if52Qq2CyI7zbVPtNmMNsUsQy4mmTYbw
   TSjP30bmP3ZXnw2RaT3EjCjD4Bm1RANrmA4EMyX+b+7clpcUL3pQbWgCq
   o8SeXOTO+VvruEfc2NCAdWdwqi5gF+1dbU5VibXfT6bVUC6iaijdUUNwR
   bWnj0fYCRLanOQe8nAO3qCguv2F0br44awl1MSOYZaIKrgqYZEDgBO8wL
   A==;
X-CSE-ConnectionGUID: d5HyzTuPTPOfvp9zAbTWYQ==
X-CSE-MsgGUID: 9W+jwB1XQ9Omap3ow8Ba7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="80146668"
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; 
   d="scan'208";a="80146668"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2026 06:40:37 -0700
X-CSE-ConnectionGUID: TGM1ThbJQqedZXv1X1Oxrg==
X-CSE-MsgGUID: ySTuf/V8TzaL6WySQc86ZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; 
   d="scan'208";a="235924053"
Received: from 984fee019967.jf.intel.com ([10.23.153.244])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2026 06:40:36 -0700
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
Subject: [PATCH v10 24/25] coco/tdx-host: Document TDX module update compatibility criteria
Date: Wed, 20 May 2026 06:38:27 -0700
Message-ID: <20260520133909.409394-25-chao.gao@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260520133909.409394-1-chao.gao@intel.com>
References: <20260520133909.409394-1-chao.gao@intel.com>
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
index 69b4cfc99d87..5f18ac972468 100644
--- a/Documentation/ABI/testing/sysfs-devices-faux-tdx-host
+++ b/Documentation/ABI/testing/sysfs-devices-faux-tdx-host
@@ -24,3 +24,43 @@ Description:	(RO) Report the number of remaining updates. TDX maintains a
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

