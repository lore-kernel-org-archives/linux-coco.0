Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B412517993
	for <linux-coco@lists.linux.dev>; Wed, 15 Nov 2023 12:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c4BOhufw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700049685; x=1731585685;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=rVDdAYq1Ch/guP+3CGD6S7ZzZZb7LGAbyXgUV4HgkN0=;
  b=c4BOhufwM6RuNzO/ays0W+tXSYCJIIfzL0DUolMMNMa7G5gLwGeLBMiy
   A4B1pWchU8PChrglRG5MM9SP/defqcSr4qnVVypNNFlsERkAn5dkBOhsE
   /9tm7QzHD0TAdjGZbbbuA7usGr+EzR8ApuAEdT7JvcfOyhnyrdGQ16PDP
   MaqeO0+aj+aIYpSwYO2EDKEPdG2fGkU11we0Bm97KGwtHYNkb/mVflUa5
   rzFsr91/g5fv5RXVKSm4JUnTo157QJx5Y6zdi3ROqJjOPUrY+N4DYkjve
   f+UPgKxc7SFBTN0ITtqHOjFVomCQ9gb02j1CX9H0/Xf4r9XlK22UGEIAF
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="12411906"
X-IronPort-AV: E=Sophos;i="6.03,304,1694761200"; 
   d="scan'208";a="12411906"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2023 04:01:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,304,1694761200"; 
   d="scan'208";a="6377679"
Received: from mituomis-mobl.ger.corp.intel.com (HELO box.shutemov.name) ([10.249.44.135])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2023 04:01:15 -0800
Received: by box.shutemov.name (Postfix, from userid 1000)
	id 5088E10A0F9; Wed, 15 Nov 2023 15:01:12 +0300 (+03)
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
Subject: [PATCHv3 03/14] cpu/hotplug: Add support for declaring CPU offlining not supported
Date: Wed, 15 Nov 2023 15:00:33 +0300
Message-ID: <20231115120044.8034-4-kirill.shutemov@linux.intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231115120044.8034-1-kirill.shutemov@linux.intel.com>
References: <20231115120044.8034-1-kirill.shutemov@linux.intel.com>
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

Introduce cpu_hotplug_not_supported() that can be called to indicate
that CPU offlining should be disabled.

This function is going to replace CC_ATTR_HOTPLUG_DISABLED for ACPI
MADT.

Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
---
 include/linux/cpu.h |  2 ++
 kernel/cpu.c        | 13 ++++++++++++-
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/include/linux/cpu.h b/include/linux/cpu.h
index fc8094419084..46f2e34a0c5e 100644
--- a/include/linux/cpu.h
+++ b/include/linux/cpu.h
@@ -134,6 +134,7 @@ extern void cpus_read_lock(void);
 extern void cpus_read_unlock(void);
 extern int  cpus_read_trylock(void);
 extern void lockdep_assert_cpus_held(void);
+extern void cpu_hotplug_disable_offlining(void);
 extern void cpu_hotplug_disable(void);
 extern void cpu_hotplug_enable(void);
 void clear_tasks_mm_cpumask(int cpu);
@@ -149,6 +150,7 @@ static inline void cpus_read_lock(void) { }
 static inline void cpus_read_unlock(void) { }
 static inline int  cpus_read_trylock(void) { return true; }
 static inline void lockdep_assert_cpus_held(void) { }
+static inline void cpu_hotplug_disable_offlining(void) { }
 static inline void cpu_hotplug_disable(void) { }
 static inline void cpu_hotplug_enable(void) { }
 static inline int remove_cpu(unsigned int cpu) { return -EPERM; }
diff --git a/kernel/cpu.c b/kernel/cpu.c
index a86972a91991..af8034ccda8e 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -484,6 +484,8 @@ static int cpu_hotplug_disabled;
 
 DEFINE_STATIC_PERCPU_RWSEM(cpu_hotplug_lock);
 
+static bool cpu_hotplug_offline_disabled;
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
2.41.0

