Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83C7128EA
	for <linux-coco@lists.linux.dev>; Tue, 10 Oct 2023 08:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="baDagjfc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696926936; x=1728462936;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XRUCF/P5uKgDye69B2VNPFxzhkCFQCyWEdXoWuKd6KA=;
  b=baDagjfcVCO9bTcwhBlxRVxVcGwGiB0zXLqQCA9NMLxjyuT9l5kwBx8e
   42B7cKQVrW1cDnHrzKrmH1Juqvn3suOWuKxSw9QCgrQsDPea/WVfHqU0S
   ZNgptR6arPSymVUZAPFZeP7vupbqKn8gKNGDlAoVGtzfNAGIr5zUUSVo8
   9cNxr42xfqLxQ30oi0BQkTwRzFsXQN2BEDHqSbSSL+py3rkAhqRRU6yTD
   EjZfloOnlFmFm5KbdppkBkAZlVDnNbBEAIMOtQ0QqZAHsBhW8G4gy0aqI
   2oMfrP/LYL7s5Uf62F5npowMKXfKY35G2kM8TWmyh1P4q5T+rO/lwlYEm
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="387176590"
X-IronPort-AV: E=Sophos;i="6.03,212,1694761200"; 
   d="scan'208";a="387176590"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2023 01:35:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="730001327"
X-IronPort-AV: E=Sophos;i="6.03,212,1694761200"; 
   d="scan'208";a="730001327"
Received: from ls.sc.intel.com (HELO localhost) ([172.25.112.31])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2023 01:35:32 -0700
From: isaku.yamahata@intel.com
To: kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: isaku.yamahata@intel.com,
	isaku.yamahata@gmail.com,
	Michael Roth <michael.roth@amd.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	linux-coco@lists.linux.dev,
	Chao Peng <chao.p.peng@linux.intel.com>
Subject: [PATCH 01/12] x86/mce: Fix hw MCE injection feature detection
Date: Tue, 10 Oct 2023 01:35:09 -0700
Message-Id: <23c6fa20777498bccd486aedc435eef9af174748.1696926843.git.isaku.yamahata@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1696926843.git.isaku.yamahata@intel.com>
References: <cover.1696926843.git.isaku.yamahata@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Isaku Yamahata <isaku.yamahata@intel.com>

When initializing x86 MCE injection framework, it checks if hardware mce
injection is available or not.  When it's not available on AMD, set the
boolean variable to false to not use it.  The variable is on by default and
the feature is AMD specific based on the code.

Because the variable is default on, it is true on Intel platform (probably
on other non-AMD x86 platform).  It results in unchecked msr access of
MSR_K7_HWCR=0xc0010015 when injecting MCE on Intel platform.  (Probably on
other x86 platform.)

Make the variable of by default, and set the variable on when the hardware
feature is usable.

The procedure to produce on Intel platform.
  echo hw > /sys/kernel/debug/mce-inject/flags
    This succeeds.
    set other MCE parameters if necessary.
  echo 0 > /sys/kernel/debug/mce-inject/bank
    This triggers mce injection.

The kernel accesses MSR_K7_HWCR=0xc0010015 resulting unchecked MSR access.

Fixes: 891e465a1bd8 ("x86/mce: Check whether writes to MCA_STATUS are getting ignored")
Signed-off-by: Isaku Yamahata <isaku.yamahata@intel.com>
---
 arch/x86/kernel/cpu/mce/inject.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kernel/cpu/mce/inject.c b/arch/x86/kernel/cpu/mce/inject.c
index 4d8d4bcf915d..881898a1d2f4 100644
--- a/arch/x86/kernel/cpu/mce/inject.c
+++ b/arch/x86/kernel/cpu/mce/inject.c
@@ -33,7 +33,7 @@
 
 #include "internal.h"
 
-static bool hw_injection_possible = true;
+static bool hw_injection_possible;
 
 /*
  * Collect all the MCi_XXX settings
@@ -732,6 +732,7 @@ static void check_hw_inj_possible(void)
 	if (!cpu_feature_enabled(X86_FEATURE_SMCA))
 		return;
 
+	hw_injection_possible = true;
 	cpu = get_cpu();
 
 	for (bank = 0; bank < MAX_NR_BANKS; ++bank) {
-- 
2.25.1

