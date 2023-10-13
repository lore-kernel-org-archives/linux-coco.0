Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22B05A44
	for <linux-coco@lists.linux.dev>; Fri, 13 Oct 2023 02:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YQMN9INC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697163249; x=1728699249;
  h=subject:from:to:cc:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Adp3dfXsPTEJHqDm9H3uBhIWcUnQgJ9w0nBIvLqSFH4=;
  b=YQMN9INCaixbbuYrgcEZLL3e7/8pC0rtXVmIDbjBNhz4JgM8v7D1+KhD
   coFuHdej8iSNDMjApYErzNEv8wJqBqwAPczWWJQgY5poO106HF6SSoaZm
   w5KhhpBrylrwMZsa6qGnfAWsdFcUHofc5FDzMzwyLnoCTejgiPqiyXKaR
   s5JoJsnwfXatM11aw/I/wfGHXHuniWZS9BSDyYcr8qYcH7EJI4kDMrE5V
   zDB93H/UKxfQOameca2rWLJkwjhUZmBh1VatnH+pOmO4fY1k/lpg8oGkb
   yPJBCE8qvSCLYQzN83xm56MSS+ZYEjNq+pKbTWoSZ3y6Aa6KdCtXwJzvf
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="387940568"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; 
   d="scan'208";a="387940568"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2023 19:14:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="820390924"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; 
   d="scan'208";a="820390924"
Received: from jamieko-mobl1.amr.corp.intel.com (HELO dwillia2-xfh.jf.intel.com) ([10.209.108.60])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2023 19:14:07 -0700
Subject: [PATCH v6 2/7] virt: coco: Add a coco/Makefile and coco/Kconfig
From: Dan Williams <dan.j.williams@intel.com>
To: linux-coco@lists.linux.dev
Cc: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 peterz@infradead.org, sathyanarayanan.kuppuswamy@linux.intel.com,
 dave.hansen@linux.intel.com, bp@alien8.de
Date: Thu, 12 Oct 2023 19:14:07 -0700
Message-ID: <169716324699.984874.3096976280354377048.stgit@dwillia2-xfh.jf.intel.com>
In-Reply-To: <169716323436.984874.9170967990536970455.stgit@dwillia2-xfh.jf.intel.com>
References: <169716323436.984874.9170967990536970455.stgit@dwillia2-xfh.jf.intel.com>
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

