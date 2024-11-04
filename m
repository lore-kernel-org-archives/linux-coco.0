Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95A631B0F39
	for <linux-coco@lists.linux.dev>; Mon,  4 Nov 2024 10:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730716710; cv=none; b=XwU6nwgFrt91WouPT5MN8Xq2AZiP7+veZhBhc+uIvg7ZF/AmH1zk2tt4rPimSwktXMBr6A+zVY0pDO0UWf03ImHuzp2kCG3i/kEWRG0rJrEtcaCms7/CGpGOzy4+nwBBiCcT9l12pLyxgqJdXBm/ehJ1GmK5pI4aXT6j0b45mV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730716710; c=relaxed/simple;
	bh=J8QklsU7QHCmDXyMhd1EXmVaokxVmahaaMJYtP38qBc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jcTFXZQ5QitrGfZq/2nExOt4LYzP6UhNvRGCDrXCiSzicX9dPe87FrXDgyjeZb4mO3W+nAaaVg86eD8kanvHZfXEAXBAAQEPacSKs+DAgXgW5dlfQrtgYWPwZxa4gVOCuZF1NMP5hTN4F7NjUjhnXelOmOF4TnUa5Ee1lT+EuXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.helo=mgamail.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H0CSRAas; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.helo=mgamail.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H0CSRAas"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730716708; x=1762252708;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=J8QklsU7QHCmDXyMhd1EXmVaokxVmahaaMJYtP38qBc=;
  b=H0CSRAassU3Vn0IlYsNJh5+hhU80KfL9L13EL8PtKaCkeUn7WEPj4PTr
   e9G8TZxVf0XJcOQciG7xbmsf5lwrdsLk/XTr8gtTNPCeT1B473p+WiJYS
   zFEG646nidUIpbKyH+wIgqXtk9MWxnqg6DqqEbFoVeeko3GC/eYluOqLh
   Ci8TiEmsjuh1G8pghmLAoIylHtglgmr1jeFqmUhXGIx/yBq2uKKfA9Phd
   SgUP05dHuOVtN1qU7bCNUj9m4VfnRsxOyTEx6Gqdx9VJ25nXEZvXjVBN2
   tqhZimcYWV3CP0qzBX4XJ6uCLk+VfS27CmdtQJVUNkkg/x9IS9lbtilul
   A==;
X-CSE-ConnectionGUID: 5cgg3k1JTZe8M1iBZ6fvFw==
X-CSE-MsgGUID: jC3YEf82Qq23CvCALJwXVA==
X-IronPort-AV: E=McAfee;i="6700,10204,11245"; a="18024550"
X-IronPort-AV: E=Sophos;i="6.11,256,1725346800"; 
   d="scan'208";a="18024550"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2024 02:38:27 -0800
X-CSE-ConnectionGUID: 8bLgu44xShG2V0eBw4Keqw==
X-CSE-MsgGUID: vCdi5/OHSA+Nmu8Rx8mTGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,256,1725346800"; 
   d="scan'208";a="88438972"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa005.jf.intel.com with ESMTP; 04 Nov 2024 02:38:25 -0800
Received: by black.fi.intel.com (Postfix, from userid 1000)
	id C387F320; Mon, 04 Nov 2024 12:38:23 +0200 (EET)
From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>
Cc: linux-coco@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Kai Huang <kai.huang@intel.com>
Subject: [PATCHv6, RESEND 4/4] x86/tdx: Enable CPU topology enumeration
Date: Mon,  4 Nov 2024 12:38:03 +0200
Message-ID: <20241104103803.195705-5-kirill.shutemov@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241104103803.195705-1-kirill.shutemov@linux.intel.com>
References: <20241104103803.195705-1-kirill.shutemov@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

TDX 1.0 defines baseline behaviour of TDX guest platform. TDX 1.0
generates a #VE when accessing topology-related CPUID leafs (0xB and
0x1F) and the X2APIC_APICID MSR. The kernel returns all zeros on CPUID
topology. In practice, this means that the kernel can only boot with a
plain topology. Any complications will cause problems.

The ENUM_TOPOLOGY feature allows the VMM to provide topology
information to the guest. Enabling the feature eliminates
topology-related #VEs: the TDX module virtualizes accesses to
the CPUID leafs and the MSR.

Enable ENUM_TOPOLOGY if it is available.

Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
Acked-by: Kai Huang <kai.huang@intel.com>
---
 arch/x86/coco/tdx/tdx.c           | 27 +++++++++++++++++++++++++++
 arch/x86/include/asm/shared/tdx.h |  2 ++
 2 files changed, 29 insertions(+)

diff --git a/arch/x86/coco/tdx/tdx.c b/arch/x86/coco/tdx/tdx.c
index a27230c44cc2..d4e7504aec19 100644
--- a/arch/x86/coco/tdx/tdx.c
+++ b/arch/x86/coco/tdx/tdx.c
@@ -250,6 +250,32 @@ static void disable_sept_ve(u64 td_attr)
 	return;
 }
 
+/*
+ * TDX 1.0 generates a #VE when accessing topology-related CPUID leafs (0xB and
+ * 0x1F) and the X2APIC_APICID MSR. The kernel returns all zeros on CPUID #VEs.
+ * In practice, this means that the kernel can only boot with a plain topology.
+ * Any complications will cause problems.
+ *
+ * The ENUM_TOPOLOGY feature allows the VMM to provide topology information.
+ * Enabling the feature  eliminates topology-related #VEs: the TDX module
+ * virtualizes accesses to the CPUID leafs and the MSR.
+ *
+ * Enable ENUM_TOPOLOGY if it is available.
+ */
+static void enable_cpu_topology_enumeration(void)
+{
+	u64 configured;
+
+	/* Has the VMM provided a valid topology configuration? */
+	tdg_vm_rd(TDCS_TOPOLOGY_ENUM_CONFIGURED, &configured);
+	if (!configured) {
+		pr_err("VMM did not configure X2APIC_IDs properly\n");
+		return;
+	}
+
+	tdg_vm_wr(TDCS_TD_CTLS, TD_CTLS_ENUM_TOPOLOGY, TD_CTLS_ENUM_TOPOLOGY);
+}
+
 static void tdx_setup(u64 *cc_mask)
 {
 	struct tdx_module_args args = {};
@@ -281,6 +307,7 @@ static void tdx_setup(u64 *cc_mask)
 	tdg_vm_wr(TDCS_NOTIFY_ENABLES, 0, -1ULL);
 
 	disable_sept_ve(td_attr);
+	enable_cpu_topology_enumeration();
 }
 
 /*
diff --git a/arch/x86/include/asm/shared/tdx.h b/arch/x86/include/asm/shared/tdx.h
index fecb2a6e864b..89f7fcade8ae 100644
--- a/arch/x86/include/asm/shared/tdx.h
+++ b/arch/x86/include/asm/shared/tdx.h
@@ -23,12 +23,14 @@
 #define TDCS_CONFIG_FLAGS		0x1110000300000016
 #define TDCS_TD_CTLS			0x1110000300000017
 #define TDCS_NOTIFY_ENABLES		0x9100000000000010
+#define TDCS_TOPOLOGY_ENUM_CONFIGURED	0x9100000000000019
 
 /* TDCS_CONFIG_FLAGS bits */
 #define TDCS_CONFIG_FLEXIBLE_PENDING_VE	BIT_ULL(1)
 
 /* TDCS_TD_CTLS bits */
 #define TD_CTLS_PENDING_VE_DISABLE	BIT_ULL(0)
+#define TD_CTLS_ENUM_TOPOLOGY		BIT_ULL(1)
 
 /* TDX hypercall Leaf IDs */
 #define TDVMCALL_MAP_GPA		0x10001
-- 
2.45.2

