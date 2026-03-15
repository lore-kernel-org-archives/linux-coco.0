Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0788136493D
	for <linux-coco@lists.linux.dev>; Sun, 15 Mar 2026 13:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773583194; cv=none; b=XSbzI5uN2sIXYHBJz4X/+0JRs+zi3WDUx5O6iBI/0Zmps12KTVkxScKEoLz+I5Nme/3biP0fLZTgWNpQuuLkE7ZDHhcVMQtpo4gyWLvOj1Vzhb9Isrzp4sQRO1hYAaKWGjSFSWSLQkBHzrtSbuQd5rq0gYQdeoYT9P1wxpAN6Vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773583194; c=relaxed/simple;
	bh=zWbgm/m3zFcFvtMF5+WkaY2Oh+0AYCHrmhiETLv09Ok=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pDDH4xzlU4fCRqBdW7NzaaluYwnef7/PdxVDx8s+hlYXFIVM+dA0LnObefZNHp5+ezEUpdAiR1nOygXjAH8uxge6KbiyvKNOLLCSK/eKgf9/2mGiC9nKTQhDK2zZCrinq/d/ORu0CSoRBo67P/e+LZwIzJ++v+jlILZgmTx1yKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MYzkGpDY; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MYzkGpDY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773583192; x=1805119192;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=zWbgm/m3zFcFvtMF5+WkaY2Oh+0AYCHrmhiETLv09Ok=;
  b=MYzkGpDYJ09cvCceynNgJHK7xLrqDd2P6Syxie26EmiePKrb3KpC15iF
   Ijk6hT9txVq4GV+We2kTXScjvCmLT6li9JNREji19eWiPd2ZdRixpGu+1
   ODo7Is/oav3afpzKS229nC6wLve1ycyyiNLU8aL8YoVQezdUpWq+X5sM1
   79v4Wzha/lBGruwtcEp7zHS3f+vHI4YvywjlNaMyK1OPeErTJinzwyRAs
   uU3xAwk0qJlYHVfIWvEAkfDoFhrJw8L/iB+pdq+lxK+1jZtaK9FrAukWj
   1TZ8r2cvvRzdHBZu9JdHGfX78xV5MS3g1zUXeMMU4LRehfS2og7nMLXUx
   A==;
X-CSE-ConnectionGUID: gQXeB7AfRlq9wY0Mayv8+Q==
X-CSE-MsgGUID: k0eJqcT5SM+LPBwAqE1s9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11730"; a="74732568"
X-IronPort-AV: E=Sophos;i="6.23,122,1770624000"; 
   d="scan'208";a="74732568"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2026 06:59:45 -0700
X-CSE-ConnectionGUID: 5nPOHcUsRcyZXpdm1+kHdw==
X-CSE-MsgGUID: Os0zlHB1THi3kgRZrBHrYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,122,1770624000"; 
   d="scan'208";a="226123087"
Received: from 984fee019967.jf.intel.com ([10.23.153.244])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2026 06:59:45 -0700
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
	Chao Gao <chao.gao@intel.com>
Subject: [PATCH v5 20/22] coco/tdx-host: Document TDX module update compatibility criteria
Date: Sun, 15 Mar 2026 06:58:40 -0700
Message-ID: <20260315135920.354657-21-chao.gao@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260315135920.354657-1-chao.gao@intel.com>
References: <20260315135920.354657-1-chao.gao@intel.com>
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
---
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
 .../ABI/testing/sysfs-devices-faux-tdx-host   | 46 +++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-devices-faux-tdx-host b/Documentation/ABI/testing/sysfs-devices-faux-tdx-host
index 44b8356aed6b..97840db794c0 100644
--- a/Documentation/ABI/testing/sysfs-devices-faux-tdx-host
+++ b/Documentation/ABI/testing/sysfs-devices-faux-tdx-host
@@ -27,3 +27,49 @@ Description:	(RO) Report the number of remaining updates. TDX maintains a
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
+		compatibility check failures.
+
+What:		/sys/devices/faux/tdx_host/firmware/tdx_module/error
+Contact:	linux-coco@lists.linux.dev
+Description:	(RO) See Documentation/ABI/testing/sysfs-class-firmware for
+		baseline expectations for this file. The <ERROR> part in the
+		<STATUS>:<ERROR> format can be:
+
+		   "device-busy": Compatibility checks failed.
+
+		   "read-write-error": Memory allocation failed.
+
+		   "hw-error": Cannot communicate with P-SEAMLDR or TDX module.
+
+		   "firmware-invalid": The provided TDX module update is invalid,
+		                       or the number of updates reached the limit,
+				       or other unexpected errors occurred.
+
+		"hw-error" or "firmware-invalid" may be fatal, causing all TDs
+		and the TDX module to be lost and preventing further TDX
+		operations. This occurs when reading
+		/sys/devices/faux/tdx_host/version returns -ENXIO. For other
+		errors, TDs and the (previous) TDX module stay running.
-- 
2.47.3

