Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BB2819BC0
	for <linux-coco@lists.linux.dev>; Thu,  5 Oct 2023 13:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YzW8BtG1"
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696511808; x=1728047808;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6jCOPtPHdWrnAAWeulGySr3RPESjo4P/hViU3qiYp2Q=;
  b=YzW8BtG1Y724is3UFWiiVG1VgZcf+8DKOhodxrQvfHwbwe4zf0AibpPN
   tFmFGa6JLJp7xMDOToz/mBleUsRakAE5uqVvnnDkbcSQVWdazCv/LeL74
   0N8MSPkx2r9M6Pw923U2PpruTu1ZTXhuL6Zg2z1DPD5kfLKwZMkTuWIMy
   bhfYW3XQZ+8a60J79iL16v1fjDa1QAsfiIfIwXZbuwx+zU0FmNTQKS2H6
   TQjbUbcYXUqYOmXrWSXmmmciwcUV4+98tVMFtWEm2Mrh+uPlPcu+gZW8B
   wWkwZ+DoiDAutvrKX1z9nrbEaEIcIUjE7vyEv/vCx8EACGMS9QB7M7ZYv
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="382357443"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; 
   d="scan'208";a="382357443"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2023 06:14:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="817564301"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; 
   d="scan'208";a="817564301"
Received: from skwasnia-mobl.ger.corp.intel.com (HELO box.shutemov.name) ([10.251.222.71])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2023 06:14:16 -0700
Received: by box.shutemov.name (Postfix, from userid 1000)
	id 35E2A10A14C; Thu,  5 Oct 2023 16:14:14 +0300 (+03)
From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
	Elena Reshetova <elena.reshetova@intel.com>,
	Jun Nakajima <jun.nakajima@intel.com>,
	Rick Edgecombe  <rick.p.edgecombe@intel.com>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	kexec@lists.infradead.org,
	linux-coco@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Subject: [PATCH 04/13] x86/kvm: Do not try to disable kvmclock if it was not enabled
Date: Thu,  5 Oct 2023 16:13:53 +0300
Message-ID: <20231005131402.14611-5-kirill.shutemov@linux.intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231005131402.14611-1-kirill.shutemov@linux.intel.com>
References: <20231005131402.14611-1-kirill.shutemov@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

kvm_guest_cpu_offline() tries to disable kvmclock regardless if it is
present in the VM. It leads to write to a MSR that doesn't exist on some
configurations, namely in TDX guest:

	unchecked MSR access error: WRMSR to 0x12 (tried to write 0x0000000000000000)
	at rIP: 0xffffffff8110687c (kvmclock_disable+0x1c/0x30)

kvmclock enabling is gated by CLOCKSOURCE and CLOCKSOURCE2 KVM paravirt
features.

Do not disable kvmclock if it was not enumerated or disabled by user
from kernel command line.

Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
Fixes: c02027b5742b ("x86/kvm: Disable kvmclock on all CPUs on shutdown")
---
 arch/x86/kernel/kvmclock.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kernel/kvmclock.c b/arch/x86/kernel/kvmclock.c
index fb8f52149be9..cba2e732e53f 100644
--- a/arch/x86/kernel/kvmclock.c
+++ b/arch/x86/kernel/kvmclock.c
@@ -22,7 +22,7 @@
 #include <asm/x86_init.h>
 #include <asm/kvmclock.h>
 
-static int kvmclock __initdata = 1;
+static int kvmclock __ro_after_init = 1;
 static int kvmclock_vsyscall __initdata = 1;
 static int msr_kvm_system_time __ro_after_init = MSR_KVM_SYSTEM_TIME;
 static int msr_kvm_wall_clock __ro_after_init = MSR_KVM_WALL_CLOCK;
@@ -195,7 +195,12 @@ static void kvm_setup_secondary_clock(void)
 
 void kvmclock_disable(void)
 {
-	native_write_msr(msr_kvm_system_time, 0, 0);
+	if (!kvm_para_available() || !kvmclock)
+		return;
+
+	if (kvm_para_has_feature(KVM_FEATURE_CLOCKSOURCE) ||
+	    kvm_para_has_feature(KVM_FEATURE_CLOCKSOURCE2))
+		native_write_msr(msr_kvm_system_time, 0, 0);
 }
 
 static void __init kvmclock_init_mem(void)
-- 
2.41.0

