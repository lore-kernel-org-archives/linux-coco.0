Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4826F3C3C14
	for <linux-coco@lists.linux.dev>; Thu,  6 Aug 2026 02:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785982152; cv=none; b=b3DPe0+kwxRzFgDymywSu74vJ/n0PBef0iPhkH0CByGU3xGZ6e8OaO9hiQhOxnNmVhbV+UScEwl99tBAkOYOiQ4B2fb+puaxDPZnu1HYhvlYnlwVsPnqcCt2+V+TT7PHocTty1zl+erj0N1iqGzqxUQPH3ybEtDuAYzrvNZSxlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785982152; c=relaxed/simple;
	bh=yjQIMBRgzGAqNYs3xq8f13yTt3sK4whJmripRIABmoU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IXD3GdfEhSKXwvimYKamWPUU/UFIfoNeIO9xBTQGVh0sOcF5HHTMP2bVeLU42mQZRQ+gWE0tq5v813eqXNHTebgNq00TdtekCctSCHG3eHLrlut6Y+FTmcvmEU0InsmVqiEa7t53SHOiNLRIMu9RNIKsND3LbBjp6IDSOQomHog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VA6TxZ4V; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VA6TxZ4V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785982150; x=1817518150;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yjQIMBRgzGAqNYs3xq8f13yTt3sK4whJmripRIABmoU=;
  b=VA6TxZ4V/GB8vet2rKea0EEZb1lsvj57koFqyN0cvEzQKOHLudbvLgMY
   Wg+QqhzUMlq7LqQ6KbgeTveCY4yDLmwELcFq4ivm7gjJzACSX0cdJVFN5
   dspJLlyu6+91zgxHXctwcCdEed6clSKnrryye80Sq8+zn3MaluJXOCO9s
   PXYOKX4zbUxbPxIe8nhjdxAGlZuChRTy5qh5XsHe/AHqtLHwyp08TxIX0
   ekbExJ4SL0v/Tghqq3tMzsrZWsCQjzOeNnQE4YVvnoimquykKi0yUo5mY
   0ERax9LiGIaNEjvXHBxFkYOCcz16swhRNdNHGPtPB2LsPFbdRRUN5/J3z
   g==;
X-CSE-ConnectionGUID: Yvy9tKMkR+u9rvb4iw2fqg==
X-CSE-MsgGUID: nTvXY+tkRAeMD6eFTbioEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11866"; a="86422907"
X-IronPort-AV: E=Sophos;i="6.25,207,1779174000"; 
   d="scan'208";a="86422907"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2026 19:09:05 -0700
X-CSE-ConnectionGUID: qPGPjZvpTgyYzjR0n+dWyA==
X-CSE-MsgGUID: pQkhBovZQoygMuZnQyzVyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,207,1779174000"; 
   d="scan'208";a="258639892"
Received: from rpedgeco-desk.jf.intel.com ([10.88.27.135])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2026 19:09:05 -0700
From: Rick Edgecombe <rick.p.edgecombe@intel.com>
To: bp@alien8.de,
	dave.hansen@intel.com,
	hpa@zytor.com,
	kas@kernel.org,
	kvm@vger.kernel.org,
	linux-coco@lists.linux.dev,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mingo@redhat.com,
	nik.borisov@suse.com,
	pbonzini@redhat.com,
	seanjc@google.com,
	tglx@kernel.org,
	vannapurve@google.com,
	x86@kernel.org,
	chao.gao@intel.com,
	yan.y.zhao@intel.com,
	kai.huang@intel.com,
	tony.lindgren@linux.intel.com,
	binbin.wu@intel.com,
	sohil.mehta@intel.com
Cc: rick.p.edgecombe@intel.com,
	Hongyu Ning <hongyu.ning@linux.intel.com>,
	Binbin Wu <binbin.wu@linux.intel.com>
Subject: [PATCH v9 10/11] Documentation/x86: Add documentation for TDX's Dynamic PAMT
Date: Wed,  5 Aug 2026 19:08:49 -0700
Message-ID: <20260806020850.1221381-11-rick.p.edgecombe@intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260806020850.1221381-1-rick.p.edgecombe@intel.com>
References: <20260806020850.1221381-1-rick.p.edgecombe@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>

Expand TDX documentation to include information on the Dynamic PAMT
feature.

The new section explains PAMT support in the TDX module and how Dynamic
PAMT affects the kernel memory use.

AI was used under supervision to review the docs.

Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
Co-developed-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
Signed-off-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
Tested-by: Hongyu Ning <hongyu.ning@linux.intel.com>
Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
Reviewed-by: Tony Lindgren <tony.lindgren@linux.intel.com>
Acked-by: Sohil Mehta <sohil.mehta@intel.com>
---
v7:
 - Spell out PAMT acronym (Binbin)
 - Drop Assisted-by tag and cover AI use in log (Dave)
 - Add info about kernel parameter

v6:
 - Add missing word (Binbin)
 - Use "::" instead of ":"
 - Make format of dmesg example accurate
---
 .../admin-guide/kernel-parameters.txt         |  3 ++
 Documentation/arch/x86/tdx.rst                | 28 +++++++++++++++++++
 2 files changed, 31 insertions(+)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 49bcd7798876c..a0a7670246bc5 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -7519,6 +7519,9 @@ Kernel parameters
 			Valid parameters: "on", "off"
 			Default: "off"
 
+			For details see:
+			Documentation/arch/x86/tdx.rst
+
 	test_suspend=	[SUSPEND]
 			Format: { "mem" | "standby" | "freeze" }[,N]
 			Specify "mem" (for Suspend-to-RAM) or "standby" (for
diff --git a/Documentation/arch/x86/tdx.rst b/Documentation/arch/x86/tdx.rst
index 3303499ad4c6f..a1c2309230580 100644
--- a/Documentation/arch/x86/tdx.rst
+++ b/Documentation/arch/x86/tdx.rst
@@ -200,6 +200,34 @@ reflects the TCB of the currently running TDX module and therefore
 changes after an update. By contrast, TEE_TCB_SVN reflects the TCB at TD
 launch time and is not affected.
 
+Dynamic PAMT
+------------
+
+Physical Address Metadata Table (PAMT) is memory that the TDX module needs
+to keep data about each page (think like struct page). It needs to be handed
+to the TDX module for its exclusive use. For normal PAMT, this is installed
+when the TDX module is first loaded and comes to about 0.4% of system memory.
+
+Dynamic PAMT is a TDX module feature that allows VMM to allocate part of the
+PAMT as needed (the parts for tracking 4KB size pages). The other page sizes
+(1GB and 2MB) are still allocated statically at the time of TDX module
+initialization. This reduces the amount of memory that TDX uses while TDs are
+not in use.
+
+When Dynamic PAMT is in use, dmesg shows it like::
+
+  [..] virt/tdx: Enable Dynamic PAMT
+  [..] virt/tdx: 10092 KB allocated for PAMT
+  [..] virt/tdx: TDX-Module initialized
+
+Dynamic PAMT is only enabled when supported and the ``tdx_dpamt=`` kernel
+parameter is set to "on". The feature is off by default because TDX module
+internal details prevent Dynamic PAMT from working on all keyid partitioning
+configurations. When the TDX module is fixed to include these constraints in
+its enumeration of Dynamic PAMT support, kernel support can be changed to
+default on. For more information, consult the Intel TDX documentation about
+Dynamic PAMT.
+
 TDX Interaction to Other Kernel Components
 ------------------------------------------
 
-- 
2.54.0

