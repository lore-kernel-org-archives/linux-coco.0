Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63C6817BCA
	for <linux-coco@lists.linux.dev>; Tue,  3 Mar 2026 00:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772496061; cv=none; b=ghYpoW2uCWV+7MUuAf/P/85exMjldwvoK8z2UHCnCqnV/sl6AXSEDEdba1693SYKKvZxYMiMpZZd2eerc9ELsJ3AlMgRl39cT+RXIewm0has2QKdXYD0+BSYjXxjrY7Ft78+7dKfTV1mnMFvHyC9JLDlZIDmCLZLr1vZzkV6elo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772496061; c=relaxed/simple;
	bh=FBguRzawW9jcBSLc0iNmlSGdfhZfUJk73hVmylfFlOI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bJVOHgURWMv+YfPikCXLL1girKclViVvoAr1ln8fUwLAXvc29VBeZt3r3X6xtmI3h6pgnJ/fEiS3V7c1be6GYIBjb9ZblIeNweh4F+8LnObLDg+QxuI9oScb5mqsKf5p7Px/D24uKh6YsetPeoG2gyzdqRMwt4pgmleYC79TJRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ASUHkdsC; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ASUHkdsC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772496060; x=1804032060;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FBguRzawW9jcBSLc0iNmlSGdfhZfUJk73hVmylfFlOI=;
  b=ASUHkdsChrWeS7oJ+88kNJ3cqv9abzlBNuVtJfI0CqBvwsTDWDacbOV2
   IKjrvuZ+y30VtU/gfMCXUZSu07mLRUXBmtDR5srHsa/jMhX95xjPSqUZX
   U/DQRaL/99KEHiljZvMemDeEzjkBbi0mVnHVVy7XDmVf5LNZp79zZjk0T
   6UMnLbZ2Ce19O9Vp1VihKojzyNHev8FLzSp6CJaCfe4Cpm3Sts5yTvvRV
   xEsJ5ItL2kxhi3eP2PwI6aKN4H2c/hTQuh9OI8+1qJJMDlqIjBifLurUI
   VqUnPOBauu17LbwAzVIW98mwdE/tkgAtJxQii4iSye4p6zIF/1pJb3jon
   w==;
X-CSE-ConnectionGUID: eJz9qeiiSGGuU8m5ZjlSOw==
X-CSE-MsgGUID: QtYKKhPHRfWHc7ZRHyj+WA==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="73482870"
X-IronPort-AV: E=Sophos;i="6.21,321,1763452800"; 
   d="scan'208";a="73482870"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2026 16:00:55 -0800
X-CSE-ConnectionGUID: 4K98e43UQYud+lPVSKfsCg==
X-CSE-MsgGUID: 6mUZvKyNT7SWtsaYoF7qzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,321,1763452800"; 
   d="scan'208";a="214967084"
Received: from dwillia2-desk.jf.intel.com ([10.88.27.145])
  by fmviesa006.fm.intel.com with ESMTP; 02 Mar 2026 16:00:54 -0800
From: Dan Williams <dan.j.williams@intel.com>
To: linux-coco@lists.linux.dev,
	linux-pci@vger.kernel.org
Cc: gregkh@linuxfoundation.org,
	aik@amd.com,
	aneesh.kumar@kernel.org,
	yilun.xu@linux.intel.com,
	bhelgaas@google.com,
	alistair23@gmail.com,
	lukas@wunner.de,
	jgg@nvidia.com,
	Saravana Kannan <saravanak@google.com>,
	Luis Chamberlain <mcgrof@kernel.org>
Subject: [PATCH v2 04/19] modules: Document the global async_probe parameter
Date: Mon,  2 Mar 2026 16:01:52 -0800
Message-ID: <20260303000207.1836586-5-dan.j.williams@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260303000207.1836586-1-dan.j.williams@intel.com>
References: <20260303000207.1836586-1-dan.j.williams@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In preparation for adding another /sys/module/module/parameters entry,
document the existing async_probe parameter.

Cc: Saravana Kannan <saravanak@google.com>
Cc: Luis Chamberlain <mcgrof@kernel.org>
Signed-off-by: Dan Williams <dan.j.williams@intel.com>
---
 Documentation/ABI/stable/sysfs-module | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/ABI/stable/sysfs-module b/Documentation/ABI/stable/sysfs-module
index 41b1f16e8795..397c5c850894 100644
--- a/Documentation/ABI/stable/sysfs-module
+++ b/Documentation/ABI/stable/sysfs-module
@@ -45,3 +45,13 @@ Date:		Jun 2005
 Description:
 		If the module source has MODULE_VERSION, this file will contain
 		the version of the source code.
+
+What:		/sys/module/module/parameters/async_probe
+Description:
+		(RW) Emits "1" if drivers from loadable modules attempt async
+		probing by default. Emits "0" if drivers from loadable modules
+		attempt synchronous probing by default. This value is overridden
+		(in priority order) by: the module's built-in "PROBE_FORCE_*"
+		requests, the "driver_async_probe=..." kernel command line, the
+		"async_probe" module option, then this default. Write a valid
+		boolean value to toggle this policy.
-- 
2.52.0

