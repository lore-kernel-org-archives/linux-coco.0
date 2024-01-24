Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E59577655
	for <linux-coco@lists.linux.dev>; Wed, 24 Jan 2024 12:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.134.136.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706101012; cv=none; b=AlWM+UC6dcY/wFB3YRin/GaZAnX0hAdKBOTrC0FsX0jlhLEoq+EjoisJdwU1GGsyIATjap31ZUie/xpUxF+LtFNrkqRXpBJG1n2Sqm2JB90Lsj78Xfi8aUtl3MRPOkO0XLJjiruUH/TyaL6FbAtBCyzNuMI+xYhz0h6bHQQGtCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706101012; c=relaxed/simple;
	bh=yc+q4KsjIiSfEwY6TeHFKJsFn5r2uXtVujdyv1Did04=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BhbQcLDDH0ezicgWHEh0ty0PeSZvx3HoS1xofLi/aCkwBQ4lqMRRzWJLdK6QvLGHMq3ES9aKhfjgM+FekF9N/2fRXSI4wcZHXuANNctl97rCPvKxwhRarwnr0oyprRVRYKARtXojgvWHdqRziK94u288gxcGjKoYMgeLCkhR//Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.helo=mgamail.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IQBD805N; arc=none smtp.client-ip=134.134.136.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.helo=mgamail.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IQBD805N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706101010; x=1737637010;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yc+q4KsjIiSfEwY6TeHFKJsFn5r2uXtVujdyv1Did04=;
  b=IQBD805NdQuGrkms+kRVovwsF9/2e7MKeFLJsRN2ZnEpQBvbEYm8DN+6
   iIOsIr6L610Czi6dc/tYdw0QFX+OTGs6zr0om4xP5iBXC1jpJXH0EaB58
   SZREqIaoXU6AGH1Jee8OceSOZN1fCODPqgp0xQjNwIObvDr4beQhZ52wv
   nCszP/WCuHsWN+H72GGekhacWe6mRjiUe1Gxvstyo6rqc4P/FXowD5vvy
   iIlVK7Jf9sHYNGF6I0TYKERhv9WzfNERBvRCqVw9rz/zbCk8GAmc9maEA
   UC4gRayKWf5TTmAGi2nQh0Cyfyd42dVaXP3CN2l0y3sdTDVoYeu3U+GMb
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="466110035"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="466110035"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2024 04:56:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="735924055"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="735924055"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga003.jf.intel.com with ESMTP; 24 Jan 2024 04:56:40 -0800
Received: by black.fi.intel.com (Postfix, from userid 1000)
	id 2E8BE65B; Wed, 24 Jan 2024 14:56:02 +0200 (EET)
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
	"Kalra, Ashish" <ashish.kalra@amd.com>,
	Sean Christopherson <seanjc@google.com>,
	"Huang, Kai" <kai.huang@intel.com>,
	Baoquan He <bhe@redhat.com>,
	kexec@lists.infradead.org,
	linux-coco@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Subject: [PATCHv6 03/16] cpu/hotplug: Add support for declaring CPU offlining not supported
Date: Wed, 24 Jan 2024 14:55:44 +0200
Message-ID: <20240124125557.493675-4-kirill.shutemov@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240124125557.493675-1-kirill.shutemov@linux.intel.com>
References: <20240124125557.493675-1-kirill.shutemov@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ACPI MADT mailbox wakeup method doesn't allow to offline CPU after
it got woke up.

Currently offlining hotplug is prevented based on the confidential
computing attribute which is set for Intel TDX. But TDX is not
the only possible user of the wake up method. The MADT wakeup can be
implemented outside of a confidential computing environment. Offline
support is a property of the wakeup method, not the CoCo implementation.

Introduce cpu_hotplug_disable_offlining() that can be called to indicate
that CPU offlining should be disabled.

This function is going to replace CC_ATTR_HOTPLUG_DISABLED for ACPI
MADT wakeup method.

Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
Reviewed-by: Thomas Gleixner <tglx@linutronix.de>
---
 include/linux/cpu.h |  2 ++
 kernel/cpu.c        | 13 ++++++++++++-
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/include/linux/cpu.h b/include/linux/cpu.h
index dcb89c987164..aa89ef93a884 100644
--- a/include/linux/cpu.h
+++ b/include/linux/cpu.h
@@ -139,6 +139,7 @@ extern void cpus_read_lock(void);
 extern void cpus_read_unlock(void);
 extern int  cpus_read_trylock(void);
 extern void lockdep_assert_cpus_held(void);
+extern void cpu_hotplug_disable_offlining(void);
 extern void cpu_hotplug_disable(void);
 extern void cpu_hotplug_enable(void);
 void clear_tasks_mm_cpumask(int cpu);
@@ -154,6 +155,7 @@ static inline void cpus_read_lock(void) { }
 static inline void cpus_read_unlock(void) { }
 static inline int  cpus_read_trylock(void) { return true; }
 static inline void lockdep_assert_cpus_held(void) { }
+static inline void cpu_hotplug_disable_offlining(void) { }
 static inline void cpu_hotplug_disable(void) { }
 static inline void cpu_hotplug_enable(void) { }
 static inline int remove_cpu(unsigned int cpu) { return -EPERM; }
diff --git a/kernel/cpu.c b/kernel/cpu.c
index e6ec3ba4950b..7c28a07afe8b 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -484,6 +484,8 @@ static int cpu_hotplug_disabled;
 
 DEFINE_STATIC_PERCPU_RWSEM(cpu_hotplug_lock);
 
+static bool cpu_hotplug_offline_disabled __ro_after_init;
+
 void cpus_read_lock(void)
 {
 	percpu_down_read(&cpu_hotplug_lock);
@@ -543,6 +545,14 @@ static void lockdep_release_cpus_lock(void)
 	rwsem_release(&cpu_hotplug_lock.dep_map, _THIS_IP_);
 }
 
+/* Declare CPU offlining not supported */
+void cpu_hotplug_disable_offlining(void)
+{
+	cpu_maps_update_begin();
+	cpu_hotplug_offline_disabled = true;
+	cpu_maps_update_done();
+}
+
 /*
  * Wait for currently running CPU hotplug operations to complete (if any) and
  * disable future CPU hotplug (from sysfs). The 'cpu_add_remove_lock' protects
@@ -1522,7 +1532,8 @@ static int cpu_down_maps_locked(unsigned int cpu, enum cpuhp_state target)
 	 * If the platform does not support hotplug, report it explicitly to
 	 * differentiate it from a transient offlining failure.
 	 */
-	if (cc_platform_has(CC_ATTR_HOTPLUG_DISABLED))
+	if (cc_platform_has(CC_ATTR_HOTPLUG_DISABLED) ||
+	    cpu_hotplug_offline_disabled)
 		return -EOPNOTSUPP;
 	if (cpu_hotplug_disabled)
 		return -EBUSY;
-- 
2.43.0

