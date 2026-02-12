Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCADD364E81
	for <linux-coco@lists.linux.dev>; Thu, 12 Feb 2026 14:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770907000; cv=none; b=SJMB3cWqfECT6AsrHDPBhQhz1p0SGkvfwFIFf28fseGcd/xg8IOgh/6kJ89k+idprEANe217Ls0yNcUQryGILU2Hy/9L/73N4N3vEF1HjgRu1by6va8g9L6zr61gOy2AiMe29U5d7q9KXL47YUeBBICvRmSs5cvm9txKKtxVR/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770907000; c=relaxed/simple;
	bh=/dAN6pjPYkAlspD1dSRRcEHHqjm+lR6Zi8ZYkj93Ua8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jsf8oA+ln7gmPblqpKVaOMNTLDWABH4Ix9x9FVYXfBUy6C9ra3TIY39Xjmr1cPhwQHOLEjlImn3yc0INifEiha3u7c/MfRVpoWVvQabXOYLOb5qWuZlbbPApnSD6tIh/pbjQQ6sHOG+VIjS9/eiFsNj/WGIxaDWuk/9NZy8NrD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FwPPGRxz; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FwPPGRxz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770906993; x=1802442993;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/dAN6pjPYkAlspD1dSRRcEHHqjm+lR6Zi8ZYkj93Ua8=;
  b=FwPPGRxzTuR4FWUI24qqW0fbOB3bej8HdjAHJV8sznCCBv7wHa0cVke4
   7rxJloRvBM4Xj5zVBYYoLH8AJYpEO8aQPHkkQN7Oqq2NHqmfYpYn67mfu
   uYuVyB92BSXvwxU5dilg8ucsJxRndaQov6SDK0HOV/bl0/6NlCyiZhV+o
   7uzuS9H16EFikBU8jCWNvXC7j8vRXSd85SOKfwRw1b4tcSzh3MB+kR/iu
   it6rG1nMdLjQcykWglNxXAjV4MWpGGSohVOUgjG5H2Eal8AwAyoGBB/tm
   87mW0JG+4i8AY4M+d7LfW1ykmhu3wb/TWLBFxaHtN/t+SED9SNZ5yPeL0
   g==;
X-CSE-ConnectionGUID: mZASCuBJQS+65byTlXCmlw==
X-CSE-MsgGUID: 8ot/VJ7TTN6rIcuHenxXLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11699"; a="89662925"
X-IronPort-AV: E=Sophos;i="6.21,286,1763452800"; 
   d="scan'208";a="89662925"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 06:36:31 -0800
X-CSE-ConnectionGUID: VJxnIGBZRBaT+DKh5UJYAw==
X-CSE-MsgGUID: 9QdBvV5XR6uJ44/RjkvytQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,286,1763452800"; 
   d="scan'208";a="211428308"
Received: from 984fee019967.jf.intel.com ([10.23.153.244])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 06:36:31 -0800
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
	Chao Gao <chao.gao@intel.com>
Subject: [PATCH v4 22/24] coco/tdx-host: Document TDX Module update expectations
Date: Thu, 12 Feb 2026 06:35:25 -0800
Message-ID: <20260212143606.534586-23-chao.gao@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260212143606.534586-1-chao.gao@intel.com>
References: <20260212143606.534586-1-chao.gao@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The TDX Module update protocol facilitates compatible runtime updates.

Document the compatibility criteria and indicators of various update
failures, including violations of the compatibility criteria.

Signed-off-by: Chao Gao <chao.gao@intel.com>
Reviewed-by: Dan Williams <dan.j.williams@intel.com>
---
v4
 - Drop "compat_capable" kernel ABI [Dan]
 - Document Linux compatibility expectations and results of violating
   them [Dan]
---
 .../ABI/testing/sysfs-devices-faux-tdx-host   | 53 +++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-devices-faux-tdx-host b/Documentation/ABI/testing/sysfs-devices-faux-tdx-host
index 88a9c0b2bdfe..fefe762998db 100644
--- a/Documentation/ABI/testing/sysfs-devices-faux-tdx-host
+++ b/Documentation/ABI/testing/sysfs-devices-faux-tdx-host
@@ -27,3 +27,56 @@ Description:	(RO) Report the number of remaining updates. TDX maintains a
 		Interface Specification, Revision 343755-003, Chapter 3.3
 		"SEAMLDR_INFO" and Chapter 4.2 "SEAMLDR.INSTALL" for more
 		information.
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
+		compatibility check failures and how to prevent them.
+
+What:		/sys/devices/faux/tdx_host/firmware/tdx_module/error
+Contact:	linux-coco@lists.linux.dev
+Description:	(RO) See Documentation/ABI/testing/sysfs-class-firmware for
+		baseline expectations for this file. The <ERROR> part in the
+		<STATUS>:<ERROR> format can be:
+
+		   "device-busy": Compatibility checks failed or not all CPUs
+		                  are online
+
+		   "flash-wearout": The number of updates reached the limit.
+
+		   "read-write-error": Memory allocation failed.
+
+		   "hw-error": Cannot communicate with P-SEAMLDR or TDX Module.
+
+		   "firmware-invalid": The provided TDX Module update is invalid
+		                       or other unexpected errors occurred.
+
+		"hw-error" or "firmware-invalid" may be fatal, causing all TDs
+		and the TDX Module to be lost and preventing further TDX
+		operations. This occurs when reading
+		/sys/devices/faux/tdx_host/version returns -ENXIO. For other
+		errors, TDs and the (previous) TDX Module stay running.
+
+		See tdxctl [1] documentation for how to detect compatible
+		updates and whether the current platform components catch errors
+		or let them leak and cause potential TD attestation failures.
+		[1]: <TBD - tdxctl link>
-- 
2.47.3

