Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 034DD262FFC
	for <linux-coco@lists.linux.dev>; Sat, 18 Jul 2026 01:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784339129; cv=none; b=L1n+GfS//5H2Yz9+kq9D7JKY1Ts0/WcdZ0s2QySTDtWqNiOEcCjMwx+DF+fkg+hfmY1EPapaBvNG8GDLM80c53UyTGRt+lrSpetgmtJN8L+iykQUSqz6a6T6incLbYAHOClNBhVwK/OYVqEqb2AELu64hf1BIGyrLe9mdYMr9FA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784339129; c=relaxed/simple;
	bh=7LozmiJpvCC4BDW3SOxqWy/rewZdhAty3fuN3HAe8jg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rMD5GOmeaUAB9WUSycowzBN7utNxPF479OHeVV+rTdpt7dm0UvcFVyNfMuzS3bvjT3i0yAK4VwkX3NdRt8HleEKwnFyThGN27IBzR1nWc/SoKfjXQRYVflUq9jlSNqOthU6ZuuYNzRpEfGsY9kQ1IggaKMSI9EXCNoRf+NugcFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MsYGSHbw; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MsYGSHbw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784339127; x=1815875127;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7LozmiJpvCC4BDW3SOxqWy/rewZdhAty3fuN3HAe8jg=;
  b=MsYGSHbwbpz8pR+zg/d8MjiQkw3GrHDe2nttsMpZe2gCrblna3p5MiSH
   ngffqd5h+1uLcVNGpJA7Cfgv4y+C3E1giTe+ePxZtJ23iN0fEu5GGJfnt
   Z6H5pTbrcIK0pXjV0sSUuO/N9R87FgqC2excmcRGTpcp9VZfSIE3sW/pA
   dYGl+O73MqqR+f9JjoaeACiir+dAPLJJ/VE93/ZyvmXbxBvHf7VsqDrQK
   LAVmyyE2SlYF9RknrHbrP1uM0X0XhIyRuHHw80h7hs1r30rE8S7YeBOmf
   4bFvsyFq1ees4UUIHPoNXcSZKTbkEDjIBYK4cZuMR2Z7UYDccsmoiMQH6
   g==;
X-CSE-ConnectionGUID: zR440TPMSJmLL4lLnBFdEg==
X-CSE-MsgGUID: POkfhOAWTPSka6RPkWdScg==
X-IronPort-AV: E=McAfee;i="6800,10657,11849"; a="96377180"
X-IronPort-AV: E=Sophos;i="6.25,170,1779174000"; 
   d="scan'208";a="96377180"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2026 18:45:17 -0700
X-CSE-ConnectionGUID: oJ7mDoNyQAejCZZlNhwsXg==
X-CSE-MsgGUID: cUeCrQdGT0uwmGH3MaUQcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,170,1779174000"; 
   d="scan'208";a="254296290"
Received: from rpedgeco-desk.jf.intel.com ([10.88.27.135])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2026 18:45:10 -0700
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
	binbin.wu@intel.com
Cc: rick.p.edgecombe@intel.com,
	Binbin Wu <binbin.wu@linux.intel.com>
Subject: [PATCH v7 10/11] Documentation/x86: Add documentation for TDX's Dynamic PAMT
Date: Fri, 17 Jul 2026 18:44:59 -0700
Message-ID: <20260718014500.2231262-11-rick.p.edgecombe@intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260718014500.2231262-1-rick.p.edgecombe@intel.com>
References: <20260718014500.2231262-1-rick.p.edgecombe@intel.com>
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
Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
Reviewed-by: Tony Lindgren <tony.lindgren@linux.intel.com>
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
index be4928489b02f..7c8627ce07eb4 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -1328,6 +1328,9 @@ Kernel parameters
 			Valid parameters: "on", "off"
 			Default: "off"
 
+			For details see:
+			Documentation/arch/x86/tdx.rst
+
 	reg_file_data_sampling=
 			[X86] Controls mitigation for Register File Data
 			Sampling (RFDS) vulnerability. RFDS is a CPU
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

