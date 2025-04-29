Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEF68BE65
	for <linux-coco@lists.linux.dev>; Tue, 29 Apr 2025 05:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745904830; cv=none; b=lXmii6WBmBY9d65JEHJjLM7Gl9n2ImQEw0UW/2LhntqBpLuxxCPGCYLTQixoazsN4D9aCwPp3HmdHeIz8oHv7dGPxfwhLeAwY0miBvgwz4YJD+2GY6uNlRk4ynyORG8TCNOrrVOsSNRrs8mC6YuVBuNl/MCKY07KsKnXAKILnns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745904830; c=relaxed/simple;
	bh=63b8EK3yQ1pdAQWPrfqDi870r61kGG42IfnPkh22GPY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FmUCU8JbsyPGAr3OEYAN96udufD0D6K1BzsBIWcYTIjXV6CPhtqtspBXSqId0mXqz8s2E1AYboek6ZlQ0eIWi+rwQ3pD2SeyK7k0Y0mgXjjepErgDwivqu6otyTBE+7JudIX8mb2O5RG5xLV9LQdND/MgvkbRdRUJopgJSahTKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=naPxxAGR; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="naPxxAGR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745904829; x=1777440829;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=63b8EK3yQ1pdAQWPrfqDi870r61kGG42IfnPkh22GPY=;
  b=naPxxAGRupRviuTX0WqcRCpMciqvsC0iIMlWz8epC3DVv7YgwWUwpG1y
   o5gqIxn3nI29qfekhEd9BYxWGqe1GxmaVfHSmRFWm6en672u2Z1MrBYWb
   k+iWchwNrFCUyB5+hDBtqYEP9QsxRpEENThD/5U7SbvdZxlAkeC/dJgwy
   9z0Mfi3ERKXw9kszmZbjJog00VLz/lon6/lHopI8sWre/YHcuMaLPgKCJ
   JSgbxUMbnwD3QIHIOqTu0Fw2SIeLr5c1pcpUYEozYrQlok4/JkMYBNxen
   yktGSwsEA+p2b8p876BlhQ3H8b0nx/Rni0uhntfeQmyhWJ1HZcN6DDCJg
   w==;
X-CSE-ConnectionGUID: qlQ3Se/BR4CGB6wONU1XpA==
X-CSE-MsgGUID: AdSixfqITheFwLmXTPoYow==
X-IronPort-AV: E=McAfee;i="6700,10204,11417"; a="47401603"
X-IronPort-AV: E=Sophos;i="6.15,248,1739865600"; 
   d="scan'208";a="47401603"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2025 22:33:49 -0700
X-CSE-ConnectionGUID: IVVVl5vxTV2HTGVcsYvBtQ==
X-CSE-MsgGUID: 7DMN2RivRha6Ft2fHmw+ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,248,1739865600"; 
   d="scan'208";a="138532246"
Received: from unknown (HELO CannotLeaveINTEL.bj.intel.com) ([10.238.153.146])
  by fmviesa005.fm.intel.com with ESMTP; 28 Apr 2025 22:33:46 -0700
From: Jun Miao <jun.miao@intel.com>
To: kirill.shutemov@linux.intel.com,
	ave.hansen@linux.intel.com
Cc: x86@kernel.org,
	linux-coco@lists.linux.dev,
	jun.miao@intel.com,
	fan.du@intel.com,
	zhiquan1.li@intel.com
Subject: [PATCH 1/1] x86/tdx: add VIRT_CPUID2 virtualization if REDUCE_VE was not successful
Date: Tue, 29 Apr 2025 09:29:18 -0400
Message-ID: <20250429132918.1284811-2-jun.miao@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250429132918.1284811-1-jun.miao@intel.com>
References: <20250429132918.1284811-1-jun.miao@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Zhiquan Li <zhiquan1.li@intel.com>

The ENUM_TOPOLOGY and VIRT_CPUID2 virtualization control are the subset
of the REDUCE_VE control, TD enabling REDUCE_VE will also implicitly
enable ENUM_TOPOLOGY and VIRT_CPUID2.  Both features were introduced
earlier than REDUCE_VE.  Now if enabling REDUCE_VE is failed
will fall back to enabling ENUM_TOPOLOGY, the same reason is applicable
for VIRT_CPUID2.

The VIRT_CPUID2 feature allows TDX module provides fixed values
eax=0x00feff01, ebx=0, ecx=0 and edx=0, meaning "cache data is returned
by CPUID leaf 0x4" and "TLB data is returned by CPUID leaf 0x18" while
TD guest execution of CPUID leaf 0x2, instead the kernel CPUID #VE
handler returns all zeros.  It is quite useful for backward
compatibility.

REDUCE_VE can only be enabled if x2APIC_ID has been properly configured
with unique values for each VCPU.  Check if VMM has provided an activated
topology configuration first as it is the prerequisite of REDUCE_VE and
ENUM_TOPOLOGY, so move it to reduce_unnecessary_ve().  The function
enable_cpu_topology_enumeration() was very little and can be
integrated into reduce_unnecessary_ve().

Only try to enable VIRT_CPUID2 when REDUCE_VE was not successful and the
depended x2APIC_ID didn't set to each TD vCPU.

Fixes: cd9ce8217345 ("x86/tdx: Disable unnecessary virtualization exceptions")
Co-developed-by: Jun Miao <jun.miao@intel.com>
Signed-off-by: Zhiquan Li <zhiquan1.li@intel.com>
---
 arch/x86/coco/tdx/tdx.c | 56 +++++++++++++++++++++++++----------------
 1 file changed, 35 insertions(+), 21 deletions(-)

diff --git a/arch/x86/coco/tdx/tdx.c b/arch/x86/coco/tdx/tdx.c
index edab6d6049be..be1469886501 100644
--- a/arch/x86/coco/tdx/tdx.c
+++ b/arch/x86/coco/tdx/tdx.c
@@ -247,43 +247,57 @@ static void disable_sept_ve(u64 td_attr)
 }
 
 /*
+ * Newer TDX modules provide a "REDUCE_VE" feature.  When enabled, it
+ * drastically cuts cases when guests receive #VE on MSR and CPUID accesses,
+ * and TDX module also forces ENUM_TOPOLOGY and VIRT_CPUID to enabled.
+ *
+ * But REDUCE_VE can only be enabled if x2APIC_ID has been properly configured
+ * with unique values for each VCPU.  So check if VMM has provided a valid
+ * topology configuration first.
+ *
  * TDX 1.0 generates a #VE when accessing topology-related CPUID leafs (0xB and
  * 0x1F) and the X2APIC_APICID MSR. The kernel returns all zeros on CPUID #VEs.
  * In practice, this means that the kernel can only boot with a plain topology.
  * Any complications will cause problems.
  *
  * The ENUM_TOPOLOGY feature allows the VMM to provide topology information.
- * Enabling the feature  eliminates topology-related #VEs: the TDX module
+ * Enabling the feature eliminates topology-related #VEs: the TDX module
  * virtualizes accesses to the CPUID leafs and the MSR.
  *
- * Enable ENUM_TOPOLOGY if it is available.
+ * The VIRT_CPUID2 feature allows TDX module provides fixed values
+ * eax=0x00feff01, ebx=0, ecx=0 and edx=0, meaning "cache data is returned by
+ * CPUID leaf 0x4" and "TLB data is returned by CPUID leaf 0x18" while TD
+ * guest execution of CPUID leaf 0x2, instead the kernel CPUID #VE handler
+ * returns all zeros.  It is quite useful for backward compatibility.
+ *
+ * Both ENUM_TOPOLOGY and VIRT_CPUID2 are earlier than REDUCE_VE, fall back to
+ * enable them if REDUCE_VE was not successful.
  */
-static void enable_cpu_topology_enumeration(void)
+static void reduce_unnecessary_ve(void)
 {
+	u64 err = TDX_SUCCESS;
 	u64 configured;
 
 	/* Has the VMM provided a valid topology configuration? */
 	tdg_vm_rd(TDCS_TOPOLOGY_ENUM_CONFIGURED, &configured);
-	if (!configured) {
-		pr_err("VMM did not configure X2APIC_IDs properly\n");
-		return;
-	}
 
-	tdg_vm_wr(TDCS_TD_CTLS, TD_CTLS_ENUM_TOPOLOGY, TD_CTLS_ENUM_TOPOLOGY);
+	if (configured) {
+		err = tdg_vm_wr(TDCS_TD_CTLS, TD_CTLS_REDUCE_VE, TD_CTLS_REDUCE_VE);
+		if (err != TDX_SUCCESS)
+			/*
+			 * Enabling REDUCE_VE includes ENUM_TOPOLOGY. Only try to
+			 * enable ENUM_TOPOLOGY if REDUCE_VE was not successful.
+			 */
+			tdg_vm_wr(TDCS_TD_CTLS, TD_CTLS_ENUM_TOPOLOGY,TD_CTLS_ENUM_TOPOLOGY);
+	} else{
+		pr_err("VMM did not configure X2APIC_IDs properly\n");
+			/*
+			* Enabling REDUCE_VE includes VIRT_CPUID2. Only try to enable
+			* VIRT_CPUID2 if REDUCE_VE was not successful.
+			*/
+		if (!configured || err != TDX_SUCCESS)
+			tdg_vm_wr(TDCS_TD_CTLS, TD_CTLS_VIRT_CPUID2, TD_CTLS_VIRT_CPUID2);
 }
-
-static void reduce_unnecessary_ve(void)
-{
-	u64 err = tdg_vm_wr(TDCS_TD_CTLS, TD_CTLS_REDUCE_VE, TD_CTLS_REDUCE_VE);
-
-	if (err == TDX_SUCCESS)
-		return;
-
-	/*
-	 * Enabling REDUCE_VE includes ENUM_TOPOLOGY. Only try to
-	 * enable ENUM_TOPOLOGY if REDUCE_VE was not successful.
-	 */
-	enable_cpu_topology_enumeration();
 }
 
 static void tdx_setup(u64 *cc_mask)
-- 
2.43.0

