Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 290E9143899
	for <linux-coco@lists.linux.dev>; Mon,  6 May 2024 12:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714997761; cv=none; b=iKawRdPglRd7A9OXFchkaV5Sw+x8c1folg1jqPZZzCEpwKRII03kG/hIj/aNNr88ZCZ13sl2HoLn53Ug6GvMJUJVBvTkIwfHbNyStzzsirOLrLawActOXhwRElic0MpOJgvgCQh+3HCIpJ654jT/kRWcUILiHKFdZ+BAC7RpBpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714997761; c=relaxed/simple;
	bh=K+dV6HEn8WSN1OZJCuqaweN1G3AuuzUtKe1m6ZoBwds=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r0bzp2k1aJbCZj/MTVRgISFhED1Ax8nqQyWKoP4301K1tMg1ZvATvw2hwG2mCQFOEw5znA5HFrQ8jSR5RvPy5h8kMONWhDW0mCdtIEfCdSxW/BqWjTN43QNMT7TVshh/iMbSJ8TDsR95sI9jKykbBw6tFgmuJ2q6ppVK5L1H03Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.helo=mgamail.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AE4rysjD; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.helo=mgamail.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AE4rysjD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714997760; x=1746533760;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=K+dV6HEn8WSN1OZJCuqaweN1G3AuuzUtKe1m6ZoBwds=;
  b=AE4rysjDpV2jZlXPBN71p5o23BOmariVsELF+6R8yVqm8Fzk6riGmP8s
   RlRijE8IyoSFQF/fHhiUUDXpFHGLTw+tXgymeTZITtg0J3EzhhreevNgn
   5C2AyxuefBN4uL0Qbbh89iPVTD4hGYbJdBGEI2+rljzeXSpYvEgwDQVf8
   ZCst/oEhdQoImiYzVSJT4vkEbktkiYSP11EbJa0SzweCczB/wJyrNEivS
   38Xrxy2q5WAsjPSbVvpA8kln1Kc2qwS47XOvX6VN5+lXhDuwFJIh1Vgox
   tFOB7GTz8HWN/aZkDYqyhdlHIXwtHH9u7o1yW+Z10Wsn88kCc2+R7BXFB
   A==;
X-CSE-ConnectionGUID: Ws5+7x0aTzykEZrXzeBrsg==
X-CSE-MsgGUID: QVYVJ0IBQPG1DHrSDrg4pQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11064"; a="11271847"
X-IronPort-AV: E=Sophos;i="6.07,258,1708416000"; 
   d="scan'208";a="11271847"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2024 05:15:58 -0700
X-CSE-ConnectionGUID: JsTlhZnvTX+Iai9KaWWj5w==
X-CSE-MsgGUID: 8M7Q8N/WTtesgOOV+M5sZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,258,1708416000"; 
   d="scan'208";a="28140600"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa007.fm.intel.com with ESMTP; 06 May 2024 05:15:56 -0700
Received: by black.fi.intel.com (Postfix, from userid 1000)
	id 0E931452; Mon, 06 May 2024 15:15:55 +0300 (EEST)
From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>
Cc: linux-coco@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCHv3 4/4] x86/tdx: Enable ENUM_TOPOLOGY
Date: Mon,  6 May 2024 15:15:53 +0300
Message-ID: <20240506121553.3824346-5-kirill.shutemov@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240506121553.3824346-1-kirill.shutemov@linux.intel.com>
References: <20240506121553.3824346-1-kirill.shutemov@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

TDX 1.0 defines baseline behaviour of TDX guest platform. In TDX 1.0
generates a #VE when accessing topology-related CPUID leafs (0xB and
0x1F) and the X2APIC_APICID MSR. The kernel returns all zeros on CPUID
topology. Any complications will cause problems.

The ENUM_TOPOLOGY feature allows the VMM to provide topology
information to the guest. Enabling the feature eliminates
topology-related #VEs: the TDX module virtualizes accesses to
the CPUID leafs and the MSR.

Enable ENUM_TOPOLOGY if it is available.

Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
---
 arch/x86/coco/tdx/tdx.c           | 32 +++++++++++++++++++++++++++++++
 arch/x86/include/asm/shared/tdx.h |  3 +++
 2 files changed, 35 insertions(+)

diff --git a/arch/x86/coco/tdx/tdx.c b/arch/x86/coco/tdx/tdx.c
index 6124d86e0b1d..23c507fa4057 100644
--- a/arch/x86/coco/tdx/tdx.c
+++ b/arch/x86/coco/tdx/tdx.c
@@ -249,6 +249,36 @@ static int try_to_disable_sept_ve(u64 features0, u64 td_attr)
 	return 0;
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
+static void enable_cpu_topology_enumeration(u64 features0)
+{
+	u64 configured;
+
+	/* Does the TDX module support topology enumeration? */
+	if (!(features0 & TDX_FEATURES0_ENUM_TOPOLOGY))
+		return;
+
+	/* Has the VMM provided a valid topology configuration? */
+	if (tdg_vm_rd(TDCS_TOPOLOGY_ENUM_CONFIGURED, &configured) &&
+	    configured) {
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
@@ -314,6 +344,8 @@ static void tdx_setup(u64 *cc_mask)
 		else
 			tdx_panic(msg);
 	}
+
+	enable_cpu_topology_enumeration(features0);
 }
 
 /*
diff --git a/arch/x86/include/asm/shared/tdx.h b/arch/x86/include/asm/shared/tdx.h
index 282497d2964b..08a9ef35d04e 100644
--- a/arch/x86/include/asm/shared/tdx.h
+++ b/arch/x86/include/asm/shared/tdx.h
@@ -27,15 +27,18 @@
 #define TDCS_CONFIG_FLAGS		0x1110000300000016
 #define TDCS_TD_CTLS			0x1110000300000017
 #define TDCS_NOTIFY_ENABLES		0x9100000000000010
+#define TDCS_TOPOLOGY_ENUM_CONFIGURED	0x9100000000000019
 
 /* TDX_FEATURES0 bits */
 #define TDX_FEATURES0_PENDING_EPT_VIOLATION_V2	BIT_ULL(16)
+#define TDX_FEATURES0_ENUM_TOPOLOGY		BIT_ULL(20)
 
 /* TDCS_CONFIG_FLAGS bits */
 #define TDCS_CONFIG_FLEXIBLE_PENDING_VE	BIT_ULL(1)
 
 /* TDCS_TD_CTLS bits */
 #define TD_CTLS_PENDING_VE_DISABLE	BIT_ULL(0)
+#define TD_CTLS_ENUM_TOPOLOGY		BIT_ULL(1)
 
 /* TDX hypercall Leaf IDs */
 #define TDVMCALL_MAP_GPA		0x10001
-- 
2.43.0

