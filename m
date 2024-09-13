Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F40C31C14
	for <linux-coco@lists.linux.dev>; Fri, 13 Sep 2024 00:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726187192; cv=none; b=uGo0xiA4ICj3ej1egO86G0KSNxt6NSQTaeVLY7b0EvwIrFNBQRfJLN9XmL552/BpBxDLc9/FR6JOJ/r17YmF+2gNf0u+ERIRwxcUOImLvAmeaIKUdbBA4VBMTUW++4xwGthSa+sejIeEQ4Ei5YL+QAl5qpwFuMa5qfMgIVysrYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726187192; c=relaxed/simple;
	bh=wMNI9U7zdOEhy2BB3cj/d5g3YfbNI8pqQgJnaoYd1Xg=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QKVHLFHMmTngDLsHmXcX+f0Q/erHnxSCvlueNCJDoxv1vgowjTmQP0mgHqUt5d2xNPOLjXzoN/R4YDqlzq22KGtmYQdE42kAX+ZT8rkrabMYpKL4bhhSVCoo4UAlHsghSrbGdX+K2nH9pYZDhNp5DRNDF9ZVzeJdq0KTmb8x1jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HlnJeltq; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HlnJeltq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726187190; x=1757723190;
  h=subject:from:to:cc:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wMNI9U7zdOEhy2BB3cj/d5g3YfbNI8pqQgJnaoYd1Xg=;
  b=HlnJeltq5CTHcrK18Wjl66Bn///sJKRc/b/h3Tm2Q4pgF9gC71Fr7KlW
   2l58oCvOJKNitbghcK4H6d09LN6lAjTJ8NcZEQ83nBidfdyRLTPvOE3d/
   NBEY0/4igUeWtz9UvL9NXTPQqXDThtcYztEDOfOftHOSkx0GSY5gmjprP
   FEGnfbXtvoiwmReNqNIDqS4fRkpZLuJRxONHlr33BtCfcHKjOrKCjPOww
   R8VFXJHdIwSt3BnbSYvba32bfeKU1SZrTBgFazxgZB0pxY7M15vwW1m+/
   XkmU2Ab4GhG7JWKl/TrpjRCwL6Qf0i6kLPJI+nZJwadKY5wjuK1JI4c23
   Q==;
X-CSE-ConnectionGUID: rYYSWFSCQZC9++Z3WsfSVg==
X-CSE-MsgGUID: CHdy0s//ROmCYAMwTrnsMA==
X-IronPort-AV: E=McAfee;i="6700,10204,11193"; a="27990488"
X-IronPort-AV: E=Sophos;i="6.10,224,1719903600"; 
   d="scan'208";a="27990488"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2024 17:26:29 -0700
X-CSE-ConnectionGUID: u30lrkU8S8yzs5jpTmvkew==
X-CSE-MsgGUID: UZtfrgoSRU2pJL2aW34wHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,224,1719903600"; 
   d="scan'208";a="67970190"
Received: from inaky-mobl1.amr.corp.intel.com (HELO dwillia2-xfh.jf.intel.com) ([10.125.108.106])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2024 17:26:28 -0700
Subject: [PATCH 4/4] configfs-tsm-report: Introduce TCB stability
 enumeration and watchdog
From: Dan Williams <dan.j.williams@intel.com>
To: linux-coco@lists.linux.dev
Cc: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Tom Lendacky <thomas.lendacky@amd.com>,
 "Borislav Petkov \(AMD\)" <bp@alien8.de>,
 Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 Thomas Gleixner <tglx@linutronix.de>, Michael Roth <michael.roth@amd.com>,
 x86@kernel.org, aik@amd.com, elena.reshetova@intel.com, pgonda@google.com
Date: Thu, 12 Sep 2024 17:26:26 -0700
Message-ID: <172618718534.516322.14804707935022669853.stgit@dwillia2-xfh.jf.intel.com>
In-Reply-To: <172618715121.516322.9909313629463814714.stgit@dwillia2-xfh.jf.intel.com>
References: <172618715121.516322.9909313629463814714.stgit@dwillia2-xfh.jf.intel.com>
User-Agent: StGit/0.18-3-g996c
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

One of the points of contention for enabling runtime updates of the TDX
Module has been what to do about the fact that it results in
confidential VMs seeing surprise updates to their TCB. The general
concern is that there is a non-zero confidentiality regression risk for
updating measured TCB components. Not only the TDX Module, but
microcode, SEV-SNP PSP firmware, RISCV and ARM equivalents etc. The
degree to which the TCB is or is not compromised by an unexpected update
is unknowable by the kernel, but it should at least try to be
transparent about what it knows about TCB stability.

Ironically, microcode and PSP firmware update flows predated this
launch-state attestation era of confidential computing and resulted in a
"permissive" by default policy. So while TDX Module update is a new
concern that triggers fresh questions, the resolution of that question
reads on more than just the TDX Module.

The proposal is: update the cross-vendor TSM Reports mechanism to have a
unified response to this question in the form of a "TCB Stability"
build-time configuration stance.

Likely hosting providers expect tenants to be permissive of updates at
all times in which case they can just mandate
CONFIG_TSM_REPORTS_TCB_STABILITY_PERMISSIVE in tenant Linux kernel
configs, and no need to read the rest of this changelog.

Outside of that case though the kernel has a responsibility to be
transparent about what it knows about the stability of launch
attestation reports, and it has the ability to supplement the lack of
proactive notification of pending updates with an after-the-fact
watchdog.

The expectation is that userspace that depends on remote attestation
(the common ecosystem expectation for confidential computing
deployments) already has everything it needs to periodically revalidate
the TCB. However, similar to how the typical watchdog backstops
unexpected lockup scenarios to limit downtime, the
CONFIG_TSM_REPORTS_TCB_STABILITY_RELAXED policy backstops unexpected
remote attestation connectivity losses in a common way.

Lastly, CONFIG_TSM_REPORTS_TCB_STABILITY_STRICT, for completeness,
allows the kernel to be toxic to even the possibility of runtime
updates. The inclusion of this option is mainly for the communication
value it provides to later survey how many Linux distributions, cloud
hosting providers and confidential computing host platforms offer
compatibility with a "no runtime TCB component update" policy. The
maintenance burden of this option is low compared to that communication
value.

The enforcement of "Relaxed" or "Strict" violations is expected to adopt
the kernel's "panic_on_warn" policy. I.e. a violation is only a WARN()
in either configuration.

For now, only tdx-guest is updated to convey when runtime updates are
disbaled. sev-guest always asserts that runtime updates are enabled.

Cc: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: Tom Lendacky <thomas.lendacky@amd.com>
Cc: "Borislav Petkov (AMD)" <bp@alien8.de>
Cc: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Michael Roth <michael.roth@amd.com>
Cc: x86@kernel.org
Signed-off-by: Dan Williams <dan.j.williams@intel.com>
---
 Documentation/ABI/testing/configfs-tsm-report |   41 ++++++++++++
 drivers/virt/coco/guest/Kconfig               |   65 +++++++++++++++++++
 drivers/virt/coco/guest/Makefile              |    1 
 drivers/virt/coco/guest/report.c              |   85 +++++++++++++++++++++++++
 drivers/virt/coco/guest/watchdog.c            |   59 +++++++++++++++++
 drivers/virt/coco/guest/watchdog.h            |   40 ++++++++++++
 drivers/virt/coco/sev-guest/sev-guest.c       |    2 -
 drivers/virt/coco/tdx-guest/tdx-guest.c       |    9 ++-
 include/linux/tsm.h                           |    9 ++-
 9 files changed, 307 insertions(+), 4 deletions(-)
 create mode 100644 drivers/virt/coco/guest/watchdog.c
 create mode 100644 drivers/virt/coco/guest/watchdog.h

diff --git a/Documentation/ABI/testing/configfs-tsm-report b/Documentation/ABI/testing/configfs-tsm-report
index 534408bc1408..28c89afc265b 100644
--- a/Documentation/ABI/testing/configfs-tsm-report
+++ b/Documentation/ABI/testing/configfs-tsm-report
@@ -143,3 +143,44 @@ Description:
 
 		See 'service_provider' for information on the format of the
 		service manifest version.
+
+What:		/sys/kernel/config/tsm/report/$name/tcb_static
+Date:		September, 2024
+KernelVersion:	v6.13
+Contact:	linux-coco@lists.linux.dev
+Description:
+		(RO) Reports 1 if low level TCB component versions are subject to
+		change at runtime, reports 0 otherwise.  Note that TSM provider
+		implementations may draw the line on what can be updated at
+		runtime differently. For example, only small security fixes are
+		suitable for runtime update while major feature versions require
+		VM shutdown. Consult with the platform provider on what component
+		updates are included in runtime updates.
+
+What:		/sys/kernel/config/tsm/report/$name/watchdog
+Date:		September, 2024
+KernelVersion:	v6.13
+Contact:	linux-coco@lists.linux.dev
+Description:
+		(WO) Attribute is visible if the kernel is built with
+		CONFIG_TSM_REPORTS_TCB_STABILITY_RELAXED=y and @tcb_static reports
+		"0". Userspace is required to write "1" to this file at least once
+		every @watchdog_timeout period to assert that the TCB has not
+		changed and that userspace connectivity with remote attestation
+		services is still alive. The watchdog starts upon the first read
+		from @outblob.
+
+What:		/sys/kernel/config/tsm/report/$name/watchdog_timeout
+Date:		September, 2024
+KernelVersion:	v6.13
+Contact:	linux-coco@lists.linux.dev
+Description:
+		(RW) Attribute is visible if the kernel is built with
+		CONFIG_TSM_REPORTS_TCB_STABILITY_RELAXED=y and @tcb_static reports
+		"0". It reports the current timeout value in seconds when read.
+		Writing an integer value establishes the next timeout for the
+		period initiated with a write to @watchdog, or retrieval of a new
+		report from @outblob. A write of "0" disables the watchdog. Also
+		consider building the kernel with
+		CONFIG_TSM_REPORTS_TCB_STABILITY_PERMISSIVE=y if there is no
+		intent to use the watchdog.
diff --git a/drivers/virt/coco/guest/Kconfig b/drivers/virt/coco/guest/Kconfig
index ed9bafbdd854..d59cb237b1e0 100644
--- a/drivers/virt/coco/guest/Kconfig
+++ b/drivers/virt/coco/guest/Kconfig
@@ -5,3 +5,68 @@
 config TSM_REPORTS
 	select CONFIGFS_FS
 	tristate
+
+choice
+	prompt "TSM Reports: TCB Stability Policy"
+	depends on TSM_REPORTS
+	help
+	  Confidential Computing Launch attestation includes the version of
+	  components like the TSM firmware and CPU microcode.
+
+	  While updates to those components are designed to maintain or improve
+	  confidentiality and integrity, there is a non-zero chance for
+	  regressions. Select one of "Strict", "Relaxed", or "Permissive" to
+	  determine the kernel's default policy with respect to runtime updates.
+	  Select "Relaxed" if unsure, the historical default is "Permissive",
+	  but otherwise, consult with your VM host provider and/or attestation
+	  service provider for the recommended policy.
+
+config TSM_REPORTS_TCB_STABILITY_PERMISSIVE
+	bool "Permissive"
+	help
+	  If the VM running this kernel trusts or is contractually obligated to
+	  accept runtime updates, set this option. It assumes that the
+	  regression risk of updates is lower than the risk of continuing with
+	  an older TCB, or the hosting provider has an operational deployment
+	  requirement to mandate runtime updates. Set this option to disable
+	  kernel diligence around asserting that the TCB is not being mutated in
+	  unexpected ways.
+
+config TSM_REPORTS_TCB_STABILITY_RELAXED
+	bool "Relaxed"
+	help
+	  There are legitimate reasons for runtime updates of TCB components.
+	  The kernel is not in a position to pre-approve exposure to updated
+	  TCBs, or to parse a myriad of vendor specific report formats across
+	  platforms. It is, however, in a position to trigger self protection of
+	  confidentiality and integrity when TCB update surprises occur and go
+	  unhandled. This option requires userspace to positively assert that
+	  each new attestation report it receives has not modified the TCB in a
+	  way that userspace does not expect. It is a watchdog to set a kernel
+	  enforced maximum amount of time that the VM is exposed to new TCB
+	  components without validation.  See "watchdog" in
+	  Documentation/ABI/testing/configfs-tsm-report.
+
+config TSM_REPORTS_TCB_STABILITY_STRICT
+	bool "Strict"
+	help
+	  For maximum paranoia, trigger a warning immediately upon userspace
+	  retrieving an attestation report that is subject to potential surprise
+	  updates of any of the measured components, or if the kernel cannot
+	  determine that such updates are disabled. The system "panic_on_warn"
+	  policy can be deployed to escalate this notification to terminating
+	  the kernel to prevent exposure to updated TCBs that may not yet be
+	  approved by a verifier. Contact the VMM host provider to determine if
+	  disabling exposure to dynamic TCBs is possible.
+endchoice
+
+config TSM_REPORTS_WATCHDOG_TIMEOUT
+	int "TSM Reports: TCB Stability Watchdog Timeout"
+	depends on TSM_REPORTS_TCB_STABILITY_RELAXED
+	range 1 300
+	default 60
+	help
+	  Set a timeout, in seconds, for userspace to assert that newly
+	  retrieved attestation reports have not modified a measured component
+	  version outside of expectations, and require revalidation of the TCB
+	  on this period.
diff --git a/drivers/virt/coco/guest/Makefile b/drivers/virt/coco/guest/Makefile
index b3b217af77cf..341009357400 100644
--- a/drivers/virt/coco/guest/Makefile
+++ b/drivers/virt/coco/guest/Makefile
@@ -1,3 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0
 obj-$(CONFIG_TSM_REPORTS)	+= tsm_report.o
 tsm_report-y := report.o
+tsm_report-$(CONFIG_TSM_REPORTS_TCB_STABILITY_RELAXED) += watchdog.o
diff --git a/drivers/virt/coco/guest/report.c b/drivers/virt/coco/guest/report.c
index bcb515b50c68..6e33804702e7 100644
--- a/drivers/virt/coco/guest/report.c
+++ b/drivers/virt/coco/guest/report.c
@@ -12,8 +12,11 @@
 #include <linux/cleanup.h>
 #include <linux/configfs.h>
 
+#include "watchdog.h"
+
 static struct tsm_provider {
 	const struct tsm_report_ops *ops;
+	unsigned long flags;
 	void *data;
 } provider;
 static DECLARE_RWSEM(tsm_rwsem);
@@ -42,6 +45,7 @@ struct tsm_report_state {
 	unsigned long write_generation;
 	unsigned long read_generation;
 	struct config_item cfg;
+	struct tcb_stability_state tcb;
 };
 
 enum tsm_data_select {
@@ -221,6 +225,66 @@ static ssize_t tsm_report_provider_show(struct config_item *cfg, char *buf)
 }
 CONFIGFS_ATTR_RO(tsm_report_, provider);
 
+static ssize_t tsm_report_tcb_static_show(struct config_item *cfg, char *buf)
+{
+	guard(rwsem_read)(&tsm_rwsem);
+	return sysfs_emit(buf, "%d\n",
+			  !!(provider.flags & TSM_REPORT_TCB_STATIC));
+}
+CONFIGFS_ATTR_RO(tsm_report_, tcb_static);
+
+static ssize_t tsm_report_watchdog_timeout_store(struct config_item *cfg,
+						 const char *buf, size_t len)
+{
+	struct tsm_report *report = to_tsm_report(cfg);
+	struct tsm_report_state *state = to_state(report);
+	int rc;
+
+	rc = kstrtoul(buf, 0, &state->tcb.tmo);
+	if (rc)
+		return rc;
+	return len;
+}
+
+static ssize_t tsm_report_watchdog_timeout_show(struct config_item *cfg,
+						char *buf)
+{
+	struct tsm_report *report = to_tsm_report(cfg);
+	struct tsm_report_state *state = to_state(report);
+
+	return sysfs_emit(buf, "%ld\n", state->tcb.tmo);
+}
+CONFIGFS_ATTR(tsm_report_, watchdog_timeout);
+
+static ssize_t tsm_report_watchdog_store(struct config_item *cfg,
+					 const char *buf, size_t len)
+{
+	struct tsm_report *report = to_tsm_report(cfg);
+	struct tsm_report_state *state = to_state(report);
+
+	return __tsm_report_watchdog_store(&state->tcb, buf, len);
+}
+CONFIGFS_ATTR_WO(tsm_report_, watchdog);
+
+static void check_tcb_stability(struct tsm_report_state *state)
+{
+	if (provider.flags & TSM_REPORT_TCB_STATIC || state->tcb.report)
+		return;
+
+	if (IS_ENABLED(CONFIG_TSM_REPORTS_TCB_STABILITY_PERMISSIVE)) {
+		pr_info("%s: TCB is subject to dynamic low level component updates\n",
+			state->tcb.name);
+		state->tcb.report = true;
+	} else if (IS_ENABLED(CONFIG_TSM_REPORTS_TCB_STABILITY_RELAXED))
+		tcb_watchdog_trigger(&state->tcb);
+	else if (IS_ENABLED(CONFIG_TSM_REPORTS_TCB_STABILITY_STRICT)) {
+		WARN(1,
+		     pr_fmt("%s: TCB is subject to dynamic low level component updates\n"),
+		     state->tcb.name);
+		state->tcb.report = true;
+	}
+}
+
 static ssize_t __read_report(struct tsm_report *report, void *buf, size_t count,
 			     enum tsm_data_select select)
 {
@@ -303,6 +367,7 @@ static ssize_t tsm_report_read(struct tsm_report *report, void *buf,
 	if (rc < 0)
 		return rc;
 	state->read_generation = state->write_generation;
+	check_tcb_stability(state);
 out:
 	return __read_report(report, buf, count, select);
 }
@@ -342,6 +407,9 @@ static struct configfs_attribute *tsm_report_attrs[] = {
 	[TSM_REPORT_SERVICE_PROVIDER] = &tsm_report_attr_service_provider,
 	[TSM_REPORT_SERVICE_GUID] = &tsm_report_attr_service_guid,
 	[TSM_REPORT_SERVICE_MANIFEST_VER] = &tsm_report_attr_service_manifest_version,
+	[TSM_REPORT_TCB_STATIC] = &tsm_report_attr_tcb_static,
+	[TSM_REPORT_TCB_WATCHDOG] = &tsm_report_attr_watchdog,
+	[TSM_REPORT_TCB_WATCHDOG_TIMEOUT] = &tsm_report_attr_watchdog_timeout,
 	NULL,
 };
 
@@ -358,6 +426,7 @@ static void tsm_report_item_release(struct config_item *cfg)
 	struct tsm_report *report = to_tsm_report(cfg);
 	struct tsm_report_state *state = to_state(report);
 
+	tcb_watchdog_shutdown(&state->tcb);
 	kvfree(report->manifestblob);
 	kvfree(report->auxblob);
 	kvfree(report->outblob);
@@ -376,6 +445,16 @@ static bool tsm_report_is_visible(struct config_item *item,
 	if (!provider.ops)
 		return false;
 
+	if (attr == &tsm_report_attr_tcb_static)
+		return true;
+
+	if (attr == &tsm_report_attr_watchdog ||
+	    attr == &tsm_report_attr_watchdog_timeout) {
+		if (IS_ENABLED(CONFIG_TSM_REPORTS_TCB_STABILITY_RELAXED))
+			return true;
+		return false;
+	}
+
 	if (!provider.ops->report_attr_visible)
 		return true;
 
@@ -421,6 +500,7 @@ static struct config_item *tsm_report_make_item(struct config_group *group,
 	if (!state)
 		return ERR_PTR(-ENOMEM);
 
+	tcb_watchdog_init(&state->tcb, name);
 	config_item_init_type_name(&state->cfg, name, &tsm_report_type);
 	return &state->cfg;
 }
@@ -448,7 +528,8 @@ static struct configfs_subsystem tsm_configfs = {
 	.su_mutex = __MUTEX_INITIALIZER(tsm_configfs.su_mutex),
 };
 
-int tsm_report_register(const struct tsm_report_ops *ops, void *priv)
+int tsm_report_register(const struct tsm_report_ops *ops, unsigned long flags,
+			void *priv)
 {
 	const struct tsm_report_ops *conflict;
 
@@ -461,6 +542,7 @@ int tsm_report_register(const struct tsm_report_ops *ops, void *priv)
 
 	provider.ops = ops;
 	provider.data = priv;
+	provider.flags = flags;
 	return 0;
 }
 EXPORT_SYMBOL_GPL(tsm_report_register);
@@ -472,6 +554,7 @@ int tsm_report_unregister(const struct tsm_report_ops *ops)
 		return -EBUSY;
 	provider.ops = NULL;
 	provider.data = NULL;
+	provider.flags = 0;
 	return 0;
 }
 EXPORT_SYMBOL_GPL(tsm_report_unregister);
diff --git a/drivers/virt/coco/guest/watchdog.c b/drivers/virt/coco/guest/watchdog.c
new file mode 100644
index 000000000000..58577a286a13
--- /dev/null
+++ b/drivers/virt/coco/guest/watchdog.c
@@ -0,0 +1,59 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/* Copyright(c) 2024 Intel Corporation. All rights reserved. */
+
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
+#include <linux/workqueue.h>
+#include "watchdog.h"
+
+/*
+ * a new report has been retrieved, require userspace to assert that
+ * connectivity with and approval from remote attestation is still
+ * intact, and remains intact on an ongoing basis
+ */
+void tcb_watchdog_trigger(struct tcb_stability_state *tcb)
+{
+	unsigned long tmo = READ_ONCE(tcb->tmo);
+
+	if (!tmo)
+		return;
+
+	schedule_delayed_work(&tcb->watchdog_work, msecs_to_jiffies(tmo * 1000));
+}
+
+static void tcb_watchdog_work(struct work_struct *work)
+{
+	struct tcb_stability_state *tcb = container_of(
+		work, struct tcb_stability_state, watchdog_work.work);
+
+	WARN(1, pr_fmt("%s: Timeout awaiting TCB stability validation\n"), tcb->name);
+	tcb->report = true;
+}
+
+void tcb_watchdog_init(struct tcb_stability_state *tcb, const char *name)
+{
+	INIT_DELAYED_WORK(&tcb->watchdog_work, tcb_watchdog_work);
+	tcb->tmo = CONFIG_TSM_REPORTS_WATCHDOG_TIMEOUT;
+	tcb->name = name;
+}
+
+ssize_t __tsm_report_watchdog_store(struct tcb_stability_state *tcb, const char *buf,
+				    size_t len)
+{
+	unsigned long tmo = READ_ONCE(tcb->tmo);
+	bool cancel;
+	int rc;
+
+	rc = kstrtobool(buf, &cancel);
+	if (rc)
+		return rc;
+	if (!cancel)
+		return len;
+	if (!tmo) {
+		cancel_delayed_work(&tcb->watchdog_work);
+		return len;
+	}
+
+	schedule_delayed_work(&tcb->watchdog_work, msecs_to_jiffies(tmo * 1000));
+	return len;
+}
diff --git a/drivers/virt/coco/guest/watchdog.h b/drivers/virt/coco/guest/watchdog.h
new file mode 100644
index 000000000000..c29a0d8e3833
--- /dev/null
+++ b/drivers/virt/coco/guest/watchdog.h
@@ -0,0 +1,40 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __TCB_WATCHDOG_H
+#define __TCB_WATCHDOG_H
+#include <linux/workqueue.h>
+
+struct tcb_stability_state {
+	const char *name;
+	bool report;
+	unsigned long tmo;
+	struct delayed_work watchdog_work;
+};
+
+#ifdef CONFIG_TSM_REPORTS_TCB_STABILITY_RELAXED
+void tcb_watchdog_trigger(struct tcb_stability_state *tcb);
+ssize_t __tsm_report_watchdog_store(struct tcb_stability_state *tcb,
+				    const char *buf, size_t len);
+void tcb_watchdog_init(struct tcb_stability_state *tcb, const char *name);
+static inline void tcb_watchdog_shutdown(struct tcb_stability_state *tcb)
+{
+	cancel_delayed_work_sync(&tcb->watchdog_work);
+}
+#else
+static inline void tcb_watchdog_init(struct tcb_stability_state *tcb,
+				     const char *name)
+{
+}
+static inline void tcb_watchdog_shutdown(struct tcb_stability_state *tcb)
+{
+}
+static inline void tcb_watchdog_trigger(struct tcb_stability_state *tcb)
+{
+}
+static inline ssize_t
+__tsm_report_watchdog_store(struct tcb_stability_state *tcb, const char *buf,
+			    size_t len)
+{
+	return -ENXIO;
+}
+#endif /* CONFIG_TSM_REPORTS_TCB_STABILITY_RELAXED */
+#endif /* __TCB_WATCHDOG_H */
diff --git a/drivers/virt/coco/sev-guest/sev-guest.c b/drivers/virt/coco/sev-guest/sev-guest.c
index 2fc818c7ece0..89b160ae719d 100644
--- a/drivers/virt/coco/sev-guest/sev-guest.c
+++ b/drivers/virt/coco/sev-guest/sev-guest.c
@@ -1160,7 +1160,7 @@ static int __init sev_guest_probe(struct platform_device *pdev)
 	/* Set the privlevel_floor attribute based on the vmpck_id */
 	sev_tsm_report_ops.privlevel_floor = vmpck_id;
 
-	ret = tsm_report_register(&sev_tsm_report_ops, snp_dev);
+	ret = tsm_report_register(&sev_tsm_report_ops, 0, snp_dev);
 	if (ret)
 		goto e_free_cert_data;
 
diff --git a/drivers/virt/coco/tdx-guest/tdx-guest.c b/drivers/virt/coco/tdx-guest/tdx-guest.c
index a74b9a509658..122a10a8dd2b 100644
--- a/drivers/virt/coco/tdx-guest/tdx-guest.c
+++ b/drivers/virt/coco/tdx-guest/tdx-guest.c
@@ -309,6 +309,7 @@ static const struct tsm_report_ops tdx_tsm_ops = {
 
 static int __init tdx_guest_init(void)
 {
+	unsigned long flags;
 	int ret;
 
 	if (!x86_match_cpu(tdx_guest_ids))
@@ -325,7 +326,13 @@ static int __init tdx_guest_init(void)
 		goto free_misc;
 	}
 
-	ret = tsm_report_register(&tdx_tsm_ops, NULL);
+	flags = TSM_REPORT_TCB_STATIC;
+	if (tdg_sys_info_features.num_tdx_features >
+		    TDX_FEATURE_TD_PRESERVING_BIT &&
+	    tdg_sys_info_features.features0 & TDX_FEATURE_TD_PRESERVING)
+		flags = 0;
+
+	ret = tsm_report_register(&tdx_tsm_ops, flags, NULL);
 	if (ret)
 		goto free_quote;
 
diff --git a/include/linux/tsm.h b/include/linux/tsm.h
index 431054810dca..e53c237620f2 100644
--- a/include/linux/tsm.h
+++ b/include/linux/tsm.h
@@ -62,6 +62,8 @@ struct tsm_report {
  * @TSM_REPORT_SERVICE_PROVIDER: index of the service provider identifier attribute
  * @TSM_REPORT_SERVICE_GUID: index of the service GUID attribute
  * @TSM_REPORT_SERVICE_MANIFEST_VER: index of the service manifest version attribute
+ * @TSM_REPORT_TCB_WATCHDOG: TCB stability monitor
+ * @TSM_REPORT_TCB_WATCHDOG_TIMEOUT: TCB stability timeout value (seconds)
  */
 enum tsm_attr_index {
 	TSM_REPORT_GENERATION,
@@ -71,6 +73,8 @@ enum tsm_attr_index {
 	TSM_REPORT_SERVICE_PROVIDER,
 	TSM_REPORT_SERVICE_GUID,
 	TSM_REPORT_SERVICE_MANIFEST_VER,
+	TSM_REPORT_TCB_WATCHDOG,
+	TSM_REPORT_TCB_WATCHDOG_TIMEOUT,
 };
 
 /**
@@ -107,6 +111,9 @@ struct tsm_report_ops {
 	bool (*report_bin_attr_visible)(int n);
 };
 
-int tsm_report_register(const struct tsm_report_ops *ops, void *priv);
+#define TSM_REPORT_TCB_STATIC BIT(0)
+
+int tsm_report_register(const struct tsm_report_ops *ops, unsigned long flags,
+			void *priv);
 int tsm_report_unregister(const struct tsm_report_ops *ops);
 #endif /* __TSM_H */

