Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D895A1F4181
	for <linux-coco@lists.linux.dev>; Wed,  5 Nov 2025 04:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762315256; cv=none; b=Wm1wqUAvKrycEa3b5+Moqd9mPkCn9W4zlRBtsiz/sZzbSpryN3QbUZMKDkbQvUr/Oku9rx6BJshY/mWXdPDdqG8dgGL2p/fyr7Nhwrbt/b25KvkpdthMRQXF4FasG4/aiqJlnSwF5XzbTIh7LOk8N/85Dm+Zld0L/NIYL/yei4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762315256; c=relaxed/simple;
	bh=7NWCkN82+h+zqnPMIKreBsI7nAGKT+v/iRNc+SUJu2A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oTZvzdl77BYmbVjLN8Da8exvpcK4jHjJ77Z3/QWIWX8lBJ4O3QPkaVGUUeWjQSOc6aFKMyHQMRNyoF16HQaEesMMcpBqMvAzvZW9R0KWbINC5o0Xp5CeAbLZEe3LzHjqnfyn4KSAO266gvwLc+X/AZ8MC/3N0C/FdDajB6Y3W0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e0JulWYb; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e0JulWYb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762315255; x=1793851255;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7NWCkN82+h+zqnPMIKreBsI7nAGKT+v/iRNc+SUJu2A=;
  b=e0JulWYbYvoBxyBcM9H689w75jXBNburA03TrkiL0dq03FiGpvzgW1Vp
   /X/GdjYGpcEv76htzVZLqj3An43mlfywj/NasTp3pHXFu/BfcGNtFUFmu
   k7BsXhAKBObMDTm6bmBHpkGI+DdZURmboXV0AXIEeed42ahx6rbnrd1lr
   gYhUsD5dyXqTTBRs0TnRtj0KFTIWpDB7GBYkxdhWEf9QDuCHPNouMlunV
   +xPr2O/jHrFV5BAFtwon/+4iJ/6L+C9ev+K9idEWUP9DS65JlIJbqncGY
   Dx78lacupKTB3cg2GOnJxVKteUPzTlZ8JrEbfI1eqBQir7mpL4BCvX+99
   g==;
X-CSE-ConnectionGUID: h7f0znJcTtm5Kn1FUL+qJw==
X-CSE-MsgGUID: yTvvOeCPR9CAQ5vUPvNCGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="68259480"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="68259480"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2025 20:00:52 -0800
X-CSE-ConnectionGUID: ntcbriBQTB+Lm8ParSwq8g==
X-CSE-MsgGUID: LAklPVQ2QNygH406HEfhqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,280,1754982000"; 
   d="scan'208";a="224588517"
Received: from dwillia2-desk.jf.intel.com ([10.88.27.145])
  by orviesa001.jf.intel.com with ESMTP; 04 Nov 2025 20:00:52 -0800
From: Dan Williams <dan.j.williams@intel.com>
To: linux-pci@vger.kernel.org
Cc: linux-coco@lists.linux.dev,
	bhelgaas@google.com,
	aneesh.kumar@kernel.org,
	yilun.xu@linux.intel.com,
	aik@amd.com,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [PATCH 1/6] resource: Introduce resource_assigned() for discerning active resources
Date: Tue,  4 Nov 2025 20:00:50 -0800
Message-ID: <20251105040055.2832866-2-dan.j.williams@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251105040055.2832866-1-dan.j.williams@intel.com>
References: <20251105040055.2832866-1-dan.j.williams@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

A PCI bridge resource lifecycle involves both a "request" and "assign"
phase. At any point in time that resource may not yet be assigned, or may
have failed to assign (because it does not fit).

There are multiple conventions to determine when assignment has not
completed: IORESOURCE_UNSET, IORESOURCE_DISABLED, and checking whether the
resource is parented.

In code paths that are known to not be racing assignment, e.g. post
subsys_initcall(), the most reliable method to judge that a bridge resource
is assigned is to check the resource is parented [1].

Introduce a resource_assigned() helper for this purpose.

Link: http://lore.kernel.org/2b9f7f7b-d6a4-be59-14d4-7b4ffccfe373@linux.intel.com [1]
Suggested-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Signed-off-by: Dan Williams <dan.j.williams@intel.com>
---
 include/linux/ioport.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/include/linux/ioport.h b/include/linux/ioport.h
index e8b2d6aa4013..9afa30f9346f 100644
--- a/include/linux/ioport.h
+++ b/include/linux/ioport.h
@@ -334,6 +334,15 @@ static inline bool resource_union(const struct resource *r1, const struct resour
 	return true;
 }
 
+/*
+ * Check if this resource is added to a resource tree or detached. Caller is
+ * responsible for not racing assignment.
+ */
+static inline bool resource_assigned(struct resource *res)
+{
+	return res->parent;
+}
+
 int find_resource_space(struct resource *root, struct resource *new,
 			resource_size_t size, struct resource_constraint *constraint);
 
-- 
2.51.0

