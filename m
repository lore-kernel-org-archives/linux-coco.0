Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DB647482
	for <linux-coco@lists.linux.dev>; Wed, 30 Aug 2023 19:33:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693424000; x=1724960000;
  h=subject:from:to:cc:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1QNSa8PfJ6fHxxDbOfg/mWMGFnDXUsLlbGCHGWdkA9Q=;
  b=K/mDAr7/dy1U7iItrZ2gf73WgsOkd9PZOCKaNj9Nf5gyNB2tLByDaIBx
   0OJv631aqkE2AfewZer2J5FaUOiE+n/k8jwyvM3fJrrv39JzDC1TH131e
   wcTypDKrzhVG5UcL3Eg664z5UgFtLoCyMIrd6tJztUe5zVQ43+gx+/GWE
   /g1C22okcoKIuE8QeVrSL1cmDZ8kj0oOFEv5I2rGXTo8GxxqmMrgZYFky
   cWv66Ur52fW7rruIGBohIK/lFuIxPuwPd6N5mITszhDO3nOB4JUsxcP9u
   2EsAAS48DQULSuidn4PhwWE9LIUqU2RRDDKVvOpKV+0g+FBGlRxILvUv3
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="360723611"
X-IronPort-AV: E=Sophos;i="6.02,214,1688454000"; 
   d="scan'208";a="360723611"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2023 12:33:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="853844784"
X-IronPort-AV: E=Sophos;i="6.02,214,1688454000"; 
   d="scan'208";a="853844784"
Received: from nivakuma-mobl.amr.corp.intel.com (HELO dwillia2-xfh.jf.intel.com) ([10.212.238.163])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2023 12:33:19 -0700
Subject: [PATCH v3 1/5] virt: coco: Add a coco/Makefile and coco/Kconfig
From: Dan Williams <dan.j.williams@intel.com>
To: linux-coco@lists.linux.dev
Cc: peterz@infradead.org, linux-kernel@vger.kernel.org, tglx@linutronix.de
Date: Wed, 30 Aug 2023 12:33:18 -0700
Message-ID: <169342399880.3934343.12969478676791150366.stgit@dwillia2-xfh.jf.intel.com>
In-Reply-To: <169342399185.3934343.3035845348326944519.stgit@dwillia2-xfh.jf.intel.com>
References: <169342399185.3934343.3035845348326944519.stgit@dwillia2-xfh.jf.intel.com>
User-Agent: StGit/0.18-3-g996c
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

In preparation for adding another coco build target, relieve
drivers/virt/Makefile of the responsibility to track new compilation
unit additions to drivers/virt/coco/, and do the same for
drivers/virt/Kconfig.

Signed-off-by: Dan Williams <dan.j.williams@intel.com>
---
 drivers/virt/Kconfig       |    6 +-----
 drivers/virt/Makefile      |    4 +---
 drivers/virt/coco/Kconfig  |    9 +++++++++
 drivers/virt/coco/Makefile |    7 +++++++
 4 files changed, 18 insertions(+), 8 deletions(-)
 create mode 100644 drivers/virt/coco/Kconfig
 create mode 100644 drivers/virt/coco/Makefile

diff --git a/drivers/virt/Kconfig b/drivers/virt/Kconfig
index f79ab13a5c28..40129b6f0eca 100644
--- a/drivers/virt/Kconfig
+++ b/drivers/virt/Kconfig
@@ -48,10 +48,6 @@ source "drivers/virt/nitro_enclaves/Kconfig"
 
 source "drivers/virt/acrn/Kconfig"
 
-source "drivers/virt/coco/efi_secret/Kconfig"
-
-source "drivers/virt/coco/sev-guest/Kconfig"
-
-source "drivers/virt/coco/tdx-guest/Kconfig"
+source "drivers/virt/coco/Kconfig"
 
 endif
diff --git a/drivers/virt/Makefile b/drivers/virt/Makefile
index e9aa6fc96fab..f29901bd7820 100644
--- a/drivers/virt/Makefile
+++ b/drivers/virt/Makefile
@@ -9,6 +9,4 @@ obj-y				+= vboxguest/
 
 obj-$(CONFIG_NITRO_ENCLAVES)	+= nitro_enclaves/
 obj-$(CONFIG_ACRN_HSM)		+= acrn/
-obj-$(CONFIG_EFI_SECRET)	+= coco/efi_secret/
-obj-$(CONFIG_SEV_GUEST)		+= coco/sev-guest/
-obj-$(CONFIG_INTEL_TDX_GUEST)	+= coco/tdx-guest/
+obj-y				+= coco/
diff --git a/drivers/virt/coco/Kconfig b/drivers/virt/coco/Kconfig
new file mode 100644
index 000000000000..fc5c64f04c4a
--- /dev/null
+++ b/drivers/virt/coco/Kconfig
@@ -0,0 +1,9 @@
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# Confidential computing related collateral
+#
+source "drivers/virt/coco/efi_secret/Kconfig"
+
+source "drivers/virt/coco/sev-guest/Kconfig"
+
+source "drivers/virt/coco/tdx-guest/Kconfig"
diff --git a/drivers/virt/coco/Makefile b/drivers/virt/coco/Makefile
new file mode 100644
index 000000000000..55302ef719ad
--- /dev/null
+++ b/drivers/virt/coco/Makefile
@@ -0,0 +1,7 @@
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# Confidential computing related collateral
+#
+obj-$(CONFIG_EFI_SECRET)	+= efi_secret/
+obj-$(CONFIG_SEV_GUEST)		+= sev-guest/
+obj-$(CONFIG_INTEL_TDX_GUEST)	+= tdx-guest/

