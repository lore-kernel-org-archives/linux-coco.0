Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA00113AF9
	for <linux-coco@lists.linux.dev>; Tue,  8 Aug 2023 16:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691512018; x=1723048018;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=0z1l/njVD+UEzwVIY4bLXSqHss3Uzx8s2RCDApioNEA=;
  b=DEsmh2jrk0VMhiyR6uuOqtHlDuU5+LSPrbIpltfo2A/zKjPBt6MJR4Bf
   7rZ8qdG2tO6R+n2NEHqMHzqr3iXzoqbErOzNcXZN8yRXCFT7e63pxv3qg
   FmoR0oPiebG+Qg7agdTZMi6mn14VvLwR7uRujxjV8jcc22PO64ou//5SX
   B1SkXkZDOt02fTuUaPqz/Pi2TngrfE1RGVUK+9+0AvVK6W+sRoCmpnSna
   4+SmlKAqENE75xrQb547nkWzhxyKr6qPqZYszyxcjlw4faD4L+dgxifLP
   eQ3afSK4GV8QIoJYenrr4Hz3fDbnX7JqBmyfFExpa4R7kSTCR8dUeGNqZ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="374551728"
X-IronPort-AV: E=Sophos;i="6.01,156,1684825200"; 
   d="scan'208";a="374551728"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2023 09:23:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="977932468"
X-IronPort-AV: E=Sophos;i="6.01,156,1684825200"; 
   d="scan'208";a="977932468"
Received: from vevladis-mobl.ccr.corp.intel.com (HELO box.shutemov.name) ([10.252.49.245])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2023 09:23:27 -0700
Received: by box.shutemov.name (Postfix, from userid 1000)
	id E348C10A12B; Tue,  8 Aug 2023 19:23:24 +0300 (+03)
From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Dave Hansen <dave.hansen@intel.com>,
	Borislav Petkov <bp@alien8.de>,
	Andy Lutomirski <luto@kernel.org>
Cc: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
	Elena Reshetova <elena.reshetova@intel.com>,
	Jun Nakajima <jun.nakajima@intel.com>,
	x86@kernel.org,
	linux-coco@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Subject: [PATCH] x86/tdx: Mark TSC reliable
Date: Tue,  8 Aug 2023 19:23:20 +0300
Message-ID: <20230808162320.27297-1-kirill.shutemov@linux.intel.com>
X-Mailer: git-send-email 2.41.0
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

In x86 virtualization environments, including TDX, RDTSC instruction is
handled without causing a VM exit, resulting in minimal overhead and
jitters. On the other hand, other clock sources (such as HPET, ACPI
timer, APIC, etc.) necessitate VM exits to implement, resulting in more
fluctuating measurements compared to TSC. Thus, those clock sources are
not effective for calibrating TSC.

In TD guests, TSC is virtualized by the TDX module, which ensures:

  - Virtual TSC values are consistent among all the TD’s VCPUs;
  - Monotonously incrementing for any single VCPU;
  - The frequency is determined by TD configuration. The host TSC is
    invariant on platforms where TDX is available.

Use TSC as the only reliable clock source in TD guests, bypassing
unstable calibration.

Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
---
 arch/x86/coco/tdx/tdx.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/x86/coco/tdx/tdx.c b/arch/x86/coco/tdx/tdx.c
index 1d6b863c42b0..1583ec64d92e 100644
--- a/arch/x86/coco/tdx/tdx.c
+++ b/arch/x86/coco/tdx/tdx.c
@@ -769,6 +769,9 @@ void __init tdx_early_init(void)
 
 	setup_force_cpu_cap(X86_FEATURE_TDX_GUEST);
 
+	/* TSC is the only reliable clock in TDX guest */
+	setup_force_cpu_cap(X86_FEATURE_TSC_RELIABLE);
+
 	cc_vendor = CC_VENDOR_INTEL;
 	tdx_parse_tdinfo(&cc_mask);
 	cc_set_mask(cc_mask);
-- 
2.41.0

