Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E80C2D321A
	for <linux-coco@lists.linux.dev>; Fri, 21 Nov 2025 00:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763686316; cv=none; b=XkiajhHSpHGbsa9JvFUZi1Rn4x7BIQqLqg7NNivTdSY4gjBq0GTnZd9gfbFmEBnvUW6CqyRkzvDtvJRL/Zn22EGtepDSzJDE7SSixcB44GwjQhrCnQJuKGdFMlbuVEp1YpI1Dun0vq2a6SQgXF1EcN84fJ19HSnfXLugL9OXlGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763686316; c=relaxed/simple;
	bh=Qn08wBZBmAH/Yg+spHITIdaIKbVoPLtNw0c9VTkKeJM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CkeHb5i/9StKIkDOZPYzX6G/nalQdMkgIZCIBekT7+gz/PrnaQ3p+eBiCp2hextQXQiU9zOgzOSDYx0YiobQtOuIz8jAyP1WeY/kzztwafpwPmTA3+OBGNCRo/z5DOkepOVNwUODaS8i9Eg/Ewy8bDO+Ku4QB/XO5NK+5IWlaJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xl233205; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xl233205"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763686314; x=1795222314;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Qn08wBZBmAH/Yg+spHITIdaIKbVoPLtNw0c9VTkKeJM=;
  b=Xl233205EyQZ5IvDUFGU641Fwrcvoovjj4kwp1jwSnD1Fcd+tarFtSK+
   5n1CXmcVBiEewC8MgLL94RaLr0FEGTTjdh2YT0EiJpMWwKz5eHguCWSC2
   lmKTMIWQ9FVeqH4DigsGN5gGIPPwXPNhpzvMcWkNLW/Hife85ivos6cu3
   M7qa40UU6+AXtqxZej8mEdDZg+9ATe3Fm6eQ/MbW6qjL+R0S5EQ8JTYHN
   KCtPncoGHDGsTMjc2rBIpszpmKRhWfClCHlU1/CHPBrbbOmps3GKD6F5S
   rhfdBGzJt99FUTyjbfV+X2EugSu1dzLAoMXuuVJ3np/AiYDYdlIY4B/5z
   Q==;
X-CSE-ConnectionGUID: ghCxt1jrRxOO9BSZ356KnQ==
X-CSE-MsgGUID: pdjQrOFXQ/+OgjaXurh0IQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="64780836"
X-IronPort-AV: E=Sophos;i="6.20,214,1758610800"; 
   d="scan'208";a="64780836"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2025 16:51:48 -0800
X-CSE-ConnectionGUID: 9mKq7f/gRoK4VHO1BM6TkA==
X-CSE-MsgGUID: ta8uEFNzR4qOM72s1Yhq1w==
X-ExtLoop1: 1
Received: from rpedgeco-desk.jf.intel.com ([10.88.27.139])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2025 16:51:47 -0800
From: Rick Edgecombe <rick.p.edgecombe@intel.com>
To: bp@alien8.de,
	chao.gao@intel.com,
	dave.hansen@intel.com,
	isaku.yamahata@intel.com,
	kai.huang@intel.com,
	kas@kernel.org,
	kvm@vger.kernel.org,
	linux-coco@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	mingo@redhat.com,
	pbonzini@redhat.com,
	seanjc@google.com,
	tglx@linutronix.de,
	vannapurve@google.com,
	x86@kernel.org,
	yan.y.zhao@intel.com,
	xiaoyao.li@intel.com,
	binbin.wu@intel.com
Cc: rick.p.edgecombe@intel.com,
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Subject: [PATCH v4 16/16] Documentation/x86: Add documentation for TDX's Dynamic PAMT
Date: Thu, 20 Nov 2025 16:51:25 -0800
Message-ID: <20251121005125.417831-17-rick.p.edgecombe@intel.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251121005125.417831-1-rick.p.edgecombe@intel.com>
References: <20251121005125.417831-1-rick.p.edgecombe@intel.com>
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

Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
[Add feedback, update log]
Signed-off-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
---
v3:
 - Trim down docs to be about things that user cares about, instead
   of development history and other details like this.
---
 Documentation/arch/x86/tdx.rst | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/Documentation/arch/x86/tdx.rst b/Documentation/arch/x86/tdx.rst
index 61670e7df2f7..8d45d31fee29 100644
--- a/Documentation/arch/x86/tdx.rst
+++ b/Documentation/arch/x86/tdx.rst
@@ -99,6 +99,27 @@ initialize::
 
   [..] virt/tdx: module initialization failed ...
 
+Dynamic PAMT
+------------
+
+PAMT is memory that the TDX module needs to keep data about each page
+(think like struct page). It needs to handed to the TDX module for its
+exclusive use. For normal PAMT, this is installed when the TDX module
+is first loaded and comes to about 0.4% of system memory.
+
+Dynamic PAMT is a TDX feature that allows VMM to allocate part of the
+PAMT as needed (the parts for tracking 4KB size pages). The other page
+sizes (1GB and 2MB) are still allocated statically at the time of
+TDX module initialization. This reduces the amount of memory that TDX
+uses while TDs are not in use.
+
+When Dynamic PAMT is in use, dmesg shows it like:
+  [..] virt/tdx: Enable Dynamic PAMT
+  [..] virt/tdx: 10092 KB allocated for PAMT
+  [..] virt/tdx: module initialized
+
+Dynamic PAMT is enabled automatically if supported.
+
 TDX Interaction to Other Kernel Components
 ------------------------------------------
 
-- 
2.51.2

