Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16AFB184F
	for <linux-coco@lists.linux.dev>; Tue, 26 Sep 2023 04:17:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695701832; x=1727237832;
  h=subject:from:to:cc:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=b7vp5OcVBoNhgN64VhsxskMsEKIzR4SqcCbOS2xbSV8=;
  b=bf85GHzEKejdMbM3hNZ7TkOmz+pc8ZvuXJBCI23GkbvcBjOomfwYwf/l
   qXM3p7BOCmBm+NxHPTIPHPAvLeIxt93yuOsrbrfxKauu7NQLHryv4ePXR
   d9U0LmUJ7E27LJJq8tevCq9wKoyCFENjddq7hYWG/bQ5Wyowaojos8zAw
   Ivw+v36m38AaLtee8pRfjqQGg87fRQMzpR3Rfs1f2mPXpbEb3DdV9hWoQ
   eK8P8bxeisGu3H9HxxeCE2iULKecMtqKdgbQCqwLS2kfievitWIya80Qv
   Mj8alH7e3Kw1dIi7X/hvMIg3BirVzWd7HWQNnPDNiJ13RThnCMHGviGqB
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="412395796"
X-IronPort-AV: E=Sophos;i="6.03,177,1694761200"; 
   d="scan'208";a="412395796"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2023 21:17:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="814314514"
X-IronPort-AV: E=Sophos;i="6.03,177,1694761200"; 
   d="scan'208";a="814314514"
Received: from fvivekku-mobl.amr.corp.intel.com (HELO dwillia2-xfh.jf.intel.com) ([10.251.18.72])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2023 21:17:04 -0700
Subject: [PATCH v4 1/6] virt: coco: Add a coco/Makefile and coco/Kconfig
From: Dan Williams <dan.j.williams@intel.com>
To: linux-coco@lists.linux.dev
Cc: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 peterz@infradead.org, linux-kernel@vger.kernel.org, x86@kernel.org,
 dave.hansen@linux.intel.com
Date: Mon, 25 Sep 2023 21:17:03 -0700
Message-ID: <169570182376.596431.13665321099443794459.stgit@dwillia2-xfh.jf.intel.com>
In-Reply-To: <169570181657.596431.6178773442587231200.stgit@dwillia2-xfh.jf.intel.com>
References: <169570181657.596431.6178773442587231200.stgit@dwillia2-xfh.jf.intel.com>
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

