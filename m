Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32F1E357A25
	for <linux-coco@lists.linux.dev>; Mon, 27 Apr 2026 15:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777303810; cv=none; b=pkg2RwQLG/c0O/M6BAeLLh/TuBpNbKZdu9tSa+qhZvGRrTfJrAyXNpYQozKl8iVEaiLbD75fUzOC0n5ybn2aNGm7248ADOynv6L4qIWw2ifiAUSADRZ9tcC+kAIrdO3XCO98b5pgXw12tvvPAWJlEI1V12F0886R1BN2Ec2lmH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777303810; c=relaxed/simple;
	bh=G6E/SUwn0tSQlC4UDt7dGl8v/X5x4hxGEc8gPhZREI4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=soHfg3Ox/EuYATQRhLzuTupadWKdA55vh4+J7Cr+95K3WKuDKlSwobIWGC0Yyc0nKOh5Wb2ih3ZpCuMv7/Mkacx35hYXkl+ch1VTmLbnm8N4+xqQaC12odCT4faJI6JVNx9vgSs1eQQA+NG29Si37ydJ1t9ZVpdeNedy4KUFpJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SRiLmeTU; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SRiLmeTU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777303808; x=1808839808;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=G6E/SUwn0tSQlC4UDt7dGl8v/X5x4hxGEc8gPhZREI4=;
  b=SRiLmeTUuOioMgk+5i+LZQoSQj4E+h4076hOCeLyk6IMnrVtUTcwUM9J
   ZLfJAYGKosuGwFujMlAc3OFn6hIMMDclXRW9hp6cSDZIAEnsVjHSG4L54
   YSGWcdpTtv4fdkTd+B47Kyz2IIr23SlJVXAcXkP3T+C3hJ8J3l6X+8fyj
   ErkYYHV5D5NmPMz/yngkm+xiS7AL+O9KDePMff886E9UaFqgqapSJl+jO
   oK7DZna9vH9vkK9nigk2DMxa8xfLstEOm1+xLkfSwzUMJaPYpHf/84aXI
   wqh0TgoXswXR1PuyXbXHK1JB09XBElmNY1QurjpOXpqOrknL6e9gmcZLx
   w==;
X-CSE-ConnectionGUID: ZV/w0K3iRxmkOQtUTNOS3A==
X-CSE-MsgGUID: 8lHFV5+GRrmGHkr91+zV3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11769"; a="77900771"
X-IronPort-AV: E=Sophos;i="6.23,202,1770624000"; 
   d="scan'208";a="77900771"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2026 08:30:04 -0700
X-CSE-ConnectionGUID: Vy+h/VF+Ql2sCPWxLM8gog==
X-CSE-MsgGUID: SCdPSp5eTOi4lK0+9eu2eQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,202,1770624000"; 
   d="scan'208";a="232673318"
Received: from 984fee019967.jf.intel.com ([10.23.153.244])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2026 08:30:04 -0700
From: Chao Gao <chao.gao@intel.com>
To: kvm@vger.kernel.org,
	linux-coco@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	x86@kernel.org
Cc: binbin.wu@linux.intel.com,
	dave.hansen@linux.intel.com,
	djbw@kernel.org,
	ira.weiny@intel.com,
	kai.huang@intel.com,
	kas@kernel.org,
	nik.borisov@suse.com,
	paulmck@kernel.org,
	pbonzini@redhat.com,
	reinette.chatre@intel.com,
	rick.p.edgecombe@intel.com,
	sagis@google.com,
	seanjc@google.com,
	tony.lindgren@linux.intel.com,
	vannapurve@google.com,
	vishal.l.verma@intel.com,
	yilun.xu@linux.intel.com,
	xiaoyao.li@intel.com,
	yan.y.zhao@intel.com,
	Chao Gao <chao.gao@intel.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH v8 15/21] x86/virt/tdx: Refresh TDX module version after update
Date: Mon, 27 Apr 2026 08:28:09 -0700
Message-ID: <20260427152854.101171-16-chao.gao@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260427152854.101171-1-chao.gao@intel.com>
References: <20260427152854.101171-1-chao.gao@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The kernel exposes the TDX module version through sysfs so userspace can
check update compatibility. That information needs to remain accurate
across runtime updates.

A runtime update may change the module's update_version, so refresh the
cached version after a successful update and emit a log message to show
the version change.

Drop __ro_after_init from tdx_sysinfo because it is now updated at runtime.

Perform the refresh outside of stop_machine() since printk() within
stop_machine() would add significant latency.

Do not refresh the rest of tdx_sysinfo. Refreshing them at runtime could
disrupt running software that relies on the previously reported values.

Note that major and minor versions are not refreshed because runtime updates
are supported only between releases with identical major and minor versions.

Signed-off-by: Chao Gao <chao.gao@intel.com>
---
Sashiko flagged a potential torn-read concern: update_version is read
via sysfs while it is refreshed post-update. But, update_version is a
naturally-aligned u16, and on x86, the compiler won't split aligned u16
accesses. So READ_ONCE/WRITE_ONCE() aren't needed for update_version.

v8:
- drop the unnecessary old/new metadata comparison
- do not refresh the handoff version, since it is no longer cached
- rename the helper to reflect its purpose instead of using the generic
  tdx_module_post_update()
---
 arch/x86/virt/vmx/tdx/seamldr.c             |  8 +++++++-
 arch/x86/virt/vmx/tdx/tdx.c                 | 21 ++++++++++++++++++++-
 arch/x86/virt/vmx/tdx/tdx.h                 |  1 +
 arch/x86/virt/vmx/tdx/tdx_global_metadata.c |  2 +-
 4 files changed, 29 insertions(+), 3 deletions(-)

diff --git a/arch/x86/virt/vmx/tdx/seamldr.c b/arch/x86/virt/vmx/tdx/seamldr.c
index 98a8d9d3ae25..c81b26c4bac1 100644
--- a/arch/x86/virt/vmx/tdx/seamldr.c
+++ b/arch/x86/virt/vmx/tdx/seamldr.c
@@ -306,6 +306,8 @@ DEFINE_FREE(free_seamldr_params, struct seamldr_params *,
  */
 int seamldr_install_module(const u8 *data, u32 size)
 {
+	int ret;
+
 	struct seamldr_params *params __free(free_seamldr_params) =
 						init_seamldr_params(data, size);
 	if (IS_ERR(params))
@@ -314,6 +316,10 @@ int seamldr_install_module(const u8 *data, u32 size)
 	/* Ensure a stable set of online CPUs for the update process. */
 	guard(cpus_read_lock)();
 	set_target_state(MODULE_UPDATE_START + 1);
-	return stop_machine_cpuslocked(do_seamldr_install_module, params, cpu_online_mask);
+	ret = stop_machine_cpuslocked(do_seamldr_install_module, params, cpu_online_mask);
+	if (ret)
+		return ret;
+
+	return tdx_module_refresh_version();
 }
 EXPORT_SYMBOL_FOR_MODULES(seamldr_install_module, "tdx-host");
diff --git a/arch/x86/virt/vmx/tdx/tdx.c b/arch/x86/virt/vmx/tdx/tdx.c
index 9e4085a1e683..a7dfa4ee8813 100644
--- a/arch/x86/virt/vmx/tdx/tdx.c
+++ b/arch/x86/virt/vmx/tdx/tdx.c
@@ -61,7 +61,7 @@ static int sysinit_ret;
 /* All TDX-usable memory regions.  Protected by mem_hotplug_lock. */
 static LIST_HEAD(tdx_memlist);
 
-static struct tdx_sys_info tdx_sysinfo __ro_after_init;
+static struct tdx_sys_info tdx_sysinfo;
 static bool tdx_module_initialized;
 
 /*
@@ -1279,6 +1279,25 @@ int tdx_module_run_update(void)
 	return 0;
 }
 
+int tdx_module_refresh_version(void)
+{
+	struct tdx_sys_info_version *old, new;
+	int ret;
+
+	/* Shouldn't fail as the update has succeeded. */
+	ret = get_tdx_sys_info_version(&new);
+	WARN_ON_ONCE(ret);
+
+	old = &tdx_sysinfo.version;
+	pr_info("version " TDX_VERSION_FMT " -> " TDX_VERSION_FMT "\n",
+		old->major_version, old->minor_version, old->update_version,
+		new.major_version, new.minor_version, new.update_version);
+
+	/* Major/minor versions should not change across updates. */
+	tdx_sysinfo.version.update_version	= new.update_version;
+	return 0;
+}
+
 static bool is_pamt_page(unsigned long phys)
 {
 	struct tdmr_info_list *tdmr_list = &tdx_tdmr_list;
diff --git a/arch/x86/virt/vmx/tdx/tdx.h b/arch/x86/virt/vmx/tdx/tdx.h
index 5fef813002c2..d0e8cac9c1d5 100644
--- a/arch/x86/virt/vmx/tdx/tdx.h
+++ b/arch/x86/virt/vmx/tdx/tdx.h
@@ -114,5 +114,6 @@ struct tdmr_info_list {
 
 int tdx_module_shutdown(void);
 int tdx_module_run_update(void);
+int tdx_module_refresh_version(void);
 
 #endif
diff --git a/arch/x86/virt/vmx/tdx/tdx_global_metadata.c b/arch/x86/virt/vmx/tdx/tdx_global_metadata.c
index e793dec688ab..e49c300f23d4 100644
--- a/arch/x86/virt/vmx/tdx/tdx_global_metadata.c
+++ b/arch/x86/virt/vmx/tdx/tdx_global_metadata.c
@@ -7,7 +7,7 @@
  * Include this file to other C file instead.
  */
 
-static __init int get_tdx_sys_info_version(struct tdx_sys_info_version *sysinfo_version)
+static int get_tdx_sys_info_version(struct tdx_sys_info_version *sysinfo_version)
 {
 	int ret = 0;
 	u64 val;
-- 
2.47.1

