Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E10821B275
	for <linux-coco@lists.linux.dev>; Thu,  5 Oct 2023 13:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N1fy3oX/"
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696511810; x=1728047810;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=UutLKR1Vg2FeYITzS3ethN6UgzHw9Sr7YlTqsZDUwd0=;
  b=N1fy3oX/zpljFB9+tiYkQzlB29itAkUU6QEPGYsI3s86pNyuTkZMXE5Z
   PMWReAqn+Gu9tjiX9K+l8+fm0QlwXk1pN+xi44Tyn7tV+zNlsH/HfYIis
   bNdJ3rFLpfmbZR8giMqJh1fVpq02s1+qThFteBOY3wbUtNvXf+CDF0dc+
   yTL8fSrguI7QV6sMa6okuhvAfSIXsEpr+LTpIUUajd62p1IiH3Bv84/Yv
   lQw2jhIYTeD7H/aiPja5Niqon3V8NnrVFcBEeawQK3kvnwhH8XN8/a6B6
   8z/3MrSSHKCOL9nrLcPo9RTTgjwkTuuMGW8mfYWHLiE3QsodsvnCIbKSl
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="382357452"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; 
   d="scan'208";a="382357452"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2023 06:14:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="817564303"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; 
   d="scan'208";a="817564303"
Received: from skwasnia-mobl.ger.corp.intel.com (HELO box.shutemov.name) ([10.251.222.71])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2023 06:14:16 -0700
Received: by box.shutemov.name (Postfix, from userid 1000)
	id 2BD9910A14A; Thu,  5 Oct 2023 16:14:14 +0300 (+03)
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
Subject: [PATCH 03/13] cpu/hotplug, x86/acpi: Disable CPU hotplug for ACPI MADT wakeup
Date: Thu,  5 Oct 2023 16:13:52 +0300
Message-ID: <20231005131402.14611-4-kirill.shutemov@linux.intel.com>
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

ACPI MADT doesn't allow to offline CPU after it got woke up.

Currently hotplug prevented based on the confidential computing
attribute which is set for Intel TDX. But TDX is not the only possible
user of the wake up method.

Mark CPU hotplug as "not supported" on ACPI MADT wakeup enumeration.

Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
---
 arch/x86/coco/core.c               |  1 -
 arch/x86/kernel/acpi/madt_wakeup.c |  4 ++++
 include/linux/cc_platform.h        | 10 ----------
 kernel/cpu.c                       |  2 +-
 4 files changed, 5 insertions(+), 12 deletions(-)

diff --git a/arch/x86/coco/core.c b/arch/x86/coco/core.c
index eeec9986570e..f07c3bb7deab 100644
--- a/arch/x86/coco/core.c
+++ b/arch/x86/coco/core.c
@@ -20,7 +20,6 @@ static bool noinstr intel_cc_platform_has(enum cc_attr attr)
 {
 	switch (attr) {
 	case CC_ATTR_GUEST_UNROLL_STRING_IO:
-	case CC_ATTR_HOTPLUG_DISABLED:
 	case CC_ATTR_GUEST_MEM_ENCRYPT:
 	case CC_ATTR_MEM_ENCRYPT:
 		return true;
diff --git a/arch/x86/kernel/acpi/madt_wakeup.c b/arch/x86/kernel/acpi/madt_wakeup.c
index 1b9747bfd5b9..15bdf10b1393 100644
--- a/arch/x86/kernel/acpi/madt_wakeup.c
+++ b/arch/x86/kernel/acpi/madt_wakeup.c
@@ -1,4 +1,5 @@
 #include <linux/acpi.h>
+#include <linux/cpu.h>
 #include <asm/apic.h>
 
 /* Physical address of the Multiprocessor Wakeup Structure mailbox */
@@ -74,6 +75,9 @@ int __init acpi_parse_mp_wake(union acpi_subtable_headers *header,
 
 	acpi_mp_wake_mailbox_paddr = mp_wake->base_address;
 
+	/* Disable CPU onlining/offlining */
+	cpu_hotplug_not_supported();
+
 	apic_update_callback(wakeup_secondary_cpu_64, acpi_wakeup_cpu);
 
 	return 0;
diff --git a/include/linux/cc_platform.h b/include/linux/cc_platform.h
index cb0d6cd1c12f..d08dd65b5c43 100644
--- a/include/linux/cc_platform.h
+++ b/include/linux/cc_platform.h
@@ -80,16 +80,6 @@ enum cc_attr {
 	 * using AMD SEV-SNP features.
 	 */
 	CC_ATTR_GUEST_SEV_SNP,
-
-	/**
-	 * @CC_ATTR_HOTPLUG_DISABLED: Hotplug is not supported or disabled.
-	 *
-	 * The platform/OS is running as a guest/virtual machine does not
-	 * support CPU hotplug feature.
-	 *
-	 * Examples include TDX Guest.
-	 */
-	CC_ATTR_HOTPLUG_DISABLED,
 };
 
 #ifdef CONFIG_ARCH_HAS_CC_PLATFORM
diff --git a/kernel/cpu.c b/kernel/cpu.c
index cf536fe1a88a..9d4279476b40 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -1522,7 +1522,7 @@ static int cpu_down_maps_locked(unsigned int cpu, enum cpuhp_state target)
 	 * If the platform does not support hotplug, report it explicitly to
 	 * differentiate it from a transient offlining failure.
 	 */
-	if (cc_platform_has(CC_ATTR_HOTPLUG_DISABLED) || !cpu_hotplug_supported)
+	if (!cpu_hotplug_supported)
 		return -EOPNOTSUPP;
 	if (cpu_hotplug_disabled)
 		return -EBUSY;
-- 
2.41.0

