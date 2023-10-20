Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E260377
	for <linux-coco@lists.linux.dev>; Fri, 20 Oct 2023 01:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PHrp/T31"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697764598; x=1729300598;
  h=subject:from:to:cc:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=sfca4VtQYE+K4CM4pTo19QD9LMGaBTwrqv7qoHQdaP0=;
  b=PHrp/T31tYuRyDtB8PJEgHU9qDaonCAUvEQ5nleJBhwenaAXHQhWYQby
   W3cYwq8tPCFKgxCyNt6J4RShvctAu4Gl0vydiQOnS0oxnd4WvCH2MqBpp
   ddIHJTFA9D3shUEscYUm9XhlFhmhM8NFioHgX83ij0rHE6De3KTRtYpMG
   z0IieDlZB5gbQ5QjlVqvpIy737z/3wzoL2WFdLHrEGooplCDREAogLZ9N
   4kDbh+p65NDnjQ/vkkkQwxLDGh7j+0yjruS42EbKyQ2MqLo3SGaoVHNt1
   lWV4y2d7bF9BKqWBVwyM5R7vfZvSRL6N/aWKJ4tznWiKdC7PZu0xDIbeC
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="452886039"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; 
   d="scan'208";a="452886039"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2023 18:16:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="733793461"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; 
   d="scan'208";a="733793461"
Received: from hilldani-mobl.amr.corp.intel.com (HELO dwillia2-xfh.jf.intel.com) ([10.209.27.118])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2023 18:16:37 -0700
Subject: [PATCH v7 2/7] virt: coco: Add a coco/Makefile and coco/Kconfig
From: Dan Williams <dan.j.williams@intel.com>
To: linux-coco@lists.linux.dev
Cc: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 Tom Lendacky <thomas.lendacky@amd.com>, peterz@infradead.org,
 dave.hansen@linux.intel.com, x86@kernel.org
Date: Thu, 19 Oct 2023 18:16:37 -0700
Message-ID: <169776459727.1705513.7788747248679717363.stgit@dwillia2-xfh.jf.intel.com>
In-Reply-To: <169776458564.1705513.13069337506739791098.stgit@dwillia2-xfh.jf.intel.com>
References: <169776458564.1705513.13069337506739791098.stgit@dwillia2-xfh.jf.intel.com>
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

Reviewed-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Tested-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Reviewed-by: Tom Lendacky <thomas.lendacky@amd.com>
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

