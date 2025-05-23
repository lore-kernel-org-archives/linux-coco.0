Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C58722A1E1
	for <linux-coco@lists.linux.dev>; Fri, 23 May 2025 09:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747994011; cv=none; b=jfiRNiaJspVTM0PvnEou2myXozniU3x87lRBaUriToQFAW+nn3ejHAN+7NL7YGqNgM8lBah6vx6+5UJERJS0MJF9fxJrhRXfPaMllcPs3y+RCXnlBUSHuoabf2HOeEZ1cHUZndOqO+JYw1RFczGI0Mda+Yq5tWRIvRC1wUzTrR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747994011; c=relaxed/simple;
	bh=sdQjJ6HwjdsvkBELQmptCZa8jJgdqdaQNOVFMbfnneY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Zg9S9mupKms9ToB/ZI0m5nG6dpAvhkc5KIWf9BM0YuYEFvgncnGD7cA02jz22YJtgK151LkfNukF1LCaG9A4dwXagC0OR3qZKxCptzUBPxKFAJE5r5IIyTqb22f5AjumSvyhkpx3Q7CsU2tJnpl16WpS0mmCw8G/4ptWviC8zVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P58zkELY; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P58zkELY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747994010; x=1779530010;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=sdQjJ6HwjdsvkBELQmptCZa8jJgdqdaQNOVFMbfnneY=;
  b=P58zkELYKbTe6FWzAdLVQxw0RlAX8B1WHcba0UyHnQMWAiDivaSl7PSo
   idUwoQHm1TvYRC3lQvP9iUFBnzw8BmsBfdBKxAGvofhC3oq+CGRhs5KHI
   xC1u9v1fRYRczlfjeIuXM3ftOchBR8bVYrV21aHa38pGEvtRcZpTNX1NH
   xDCPQoWZaO8UGd+yTNEYQThfOHNZmyRXBQcxIZTq/sjtbEckN09P7mPsH
   XsYrl1yd52IAulphLwvle3WceTkHttfGgEfAJMC/WmXqMU0Kq6N8HVPaF
   VZKy98nnPbPIm6PLGkqjuCKKehbIBr4VSfRcQniHaIm2UfN/dYSztgU0q
   w==;
X-CSE-ConnectionGUID: k6OPpsa/QUeS/bXQKCBhjw==
X-CSE-MsgGUID: 1Zs/RAUBSh+L2fCF8+xP/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="75444117"
X-IronPort-AV: E=Sophos;i="6.15,308,1739865600"; 
   d="scan'208";a="75444117"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2025 02:53:28 -0700
X-CSE-ConnectionGUID: 3TYdgRdgT3asMcfb0LWxmg==
X-CSE-MsgGUID: T62owbfFQjO8aZjqgjhcAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,308,1739865600"; 
   d="scan'208";a="164315044"
Received: from 984fee019967.jf.intel.com ([10.165.54.94])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2025 02:53:27 -0700
From: Chao Gao <chao.gao@intel.com>
To: linux-coco@lists.linux.dev,
	x86@kernel.org,
	kvm@vger.kernel.org
Cc: seanjc@google.com,
	pbonzini@redhat.com,
	eddie.dong@intel.com,
	kirill.shutemov@intel.com,
	dave.hansen@intel.com,
	dan.j.williams@intel.com,
	kai.huang@intel.com,
	isaku.yamahata@intel.com,
	elena.reshetova@intel.com,
	rick.p.edgecombe@intel.com,
	Chao Gao <chao.gao@intel.com>,
	Farrah Chen <farrah.chen@intel.com>,
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	"H. Peter Anvin" <hpa@zytor.com>,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 04/20] x86/virt/tdx: Introduce a "tdx" subsystem and "tsm" device
Date: Fri, 23 May 2025 02:52:27 -0700
Message-ID: <20250523095322.88774-5-chao.gao@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250523095322.88774-1-chao.gao@intel.com>
References: <20250523095322.88774-1-chao.gao@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

TDX depends on a platform firmware module that is invoked via
instructions similar to vmenter (i.e. enter into a new privileged
"root-mode" context to manage private memory and private device
mechanisms). It is a software construct that depends on the CPU vmxon
state to enable invocation of TDX-module ABIs. Unlike other
Trusted Execution Environment (TEE) platform implementations that employ
a firmware module running on a PCI device with an MMIO mailbox for
communication, TDX has no hardware device to point to as the "TSM".

The "/sys/devices/virtual" hierarchy is intended for "software
constructs which need sysfs interface", which aligns with what TDX
needs.

The new tdx_subsys will export global attributes populated by the
TDX-module "sysinfo". A tdx_tsm device is published on this bus to
enable a typical driver model for the low level "TEE Security Manager"
(TSM) flows that talk TDISP to capable PCIe devices.

For now, this is only the base tdx_subsys and tdx_tsm device
registration with attribute definition and TSM driver to follow later.

Co-developed-by: Dan Williams <dan.j.williams@intel.com>
Signed-off-by: Dan Williams <dan.j.williams@intel.com>
Signed-off-by: Chao Gao <chao.gao@intel.com>
Tested-by: Farrah Chen <farrah.chen@intel.com>
---
 arch/x86/virt/vmx/tdx/tdx.c | 75 +++++++++++++++++++++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/arch/x86/virt/vmx/tdx/tdx.c b/arch/x86/virt/vmx/tdx/tdx.c
index b586329dd87d..9719df2f2634 100644
--- a/arch/x86/virt/vmx/tdx/tdx.c
+++ b/arch/x86/virt/vmx/tdx/tdx.c
@@ -28,6 +28,8 @@
 #include <linux/log2.h>
 #include <linux/acpi.h>
 #include <linux/suspend.h>
+#include <linux/device.h>
+#include <linux/cleanup.h>
 #include <linux/idr.h>
 #include <asm/page.h>
 #include <asm/special_insns.h>
@@ -1080,6 +1082,77 @@ static int init_tdmrs(struct tdmr_info_list *tdmr_list)
 	return 0;
 }
 
+static const struct bus_type tdx_subsys = {
+	.name = "tdx",
+};
+
+struct tdx_tsm {
+	struct device dev;
+};
+
+static struct tdx_tsm *alloc_tdx_tsm(void)
+{
+	struct tdx_tsm *tsm = kzalloc(sizeof(*tsm), GFP_KERNEL);
+	struct device *dev;
+
+	if (!tsm)
+		return ERR_PTR(-ENOMEM);
+
+	dev = &tsm->dev;
+	dev->bus = &tdx_subsys;
+	device_initialize(dev);
+
+	return tsm;
+}
+
+DEFINE_FREE(tdx_tsm_put, struct tdx_tsm *,
+	    if (!IS_ERR_OR_NULL(_T)) put_device(&_T->dev))
+static struct tdx_tsm *init_tdx_tsm(void)
+{
+	struct device *dev;
+	int ret;
+
+	struct tdx_tsm *tsm __free(tdx_tsm_put) = alloc_tdx_tsm();
+	if (IS_ERR(tsm))
+		return tsm;
+
+	dev = &tsm->dev;
+	ret = dev_set_name(dev, "tdx_tsm");
+	if (ret)
+		return ERR_PTR(ret);
+
+	ret = device_add(dev);
+	if (ret)
+		return ERR_PTR(ret);
+
+	return no_free_ptr(tsm);
+}
+
+static void tdx_subsys_init(void)
+{
+	struct tdx_tsm *tdx_tsm;
+	int err;
+
+	/* Establish subsystem for global TDX module attributes */
+	err = subsys_virtual_register(&tdx_subsys, NULL);
+	if (err) {
+		pr_err("failed to register tdx_subsys %d\n", err);
+		return;
+	}
+
+	/* Register 'tdx_tsm' for driving optional TDX Connect functionality */
+	tdx_tsm = init_tdx_tsm();
+	if (IS_ERR(tdx_tsm)) {
+		pr_err("failed to initialize TSM device (%pe)\n", tdx_tsm);
+		goto err_bus;
+	}
+
+	return;
+
+err_bus:
+	bus_unregister(&tdx_subsys);
+}
+
 static int init_tdx_module(void)
 {
 	int ret;
@@ -1136,6 +1209,8 @@ static int init_tdx_module(void)
 
 	pr_info("%lu KB allocated for PAMT\n", tdmrs_count_pamt_kb(&tdx_tdmr_list));
 
+	tdx_subsys_init();
+
 out_put_tdxmem:
 	/*
 	 * @tdx_memlist is written here and read at memory hotplug time.
-- 
2.47.1

