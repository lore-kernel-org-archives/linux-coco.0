Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0268424167D
	for <linux-coco@lists.linux.dev>; Fri, 23 May 2025 09:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747994038; cv=none; b=KnhFo3eG7ntgxirHU1KOfgNaT2XtnFHIFaNz+OGj0I6cIHa57oqehbNUiw/OsvBGisF4Vc56wzrvTVULZ1bq0RGr2eS8BOpCcidaALYr3vfaBYxYR0FsPhH62Ts0UFy6+qmhGVP3ITaetYJEChw/DFl3ZtZN3IDdFbxjdjx7rxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747994038; c=relaxed/simple;
	bh=PuirriKIku0f37Y1z7AzxJVhYOd56gcoD/kA14CytQQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m8AKSjfdQgFE3qpIKbKKbaMMyc6TA91zufnWasa/jNVFv4ai97gajPHNPtWXPa2F3IkCUxfkhpLvY5XY7rehfSSQnlO6Z3upXHo7xCYDH9zQcXP9xJWfCobUGj2wMp1x7LbvnP8XGKLjBA3krji6DzAx2zMVIhbHTqrCrdv0Kds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q1Vs1zvU; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q1Vs1zvU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747994037; x=1779530037;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PuirriKIku0f37Y1z7AzxJVhYOd56gcoD/kA14CytQQ=;
  b=Q1Vs1zvU+QBpFSLIRqWI+k9uXvzCKyKRNaYXKhDouUuyfP3HKw0uwXNO
   32fa704rCHcyvJSC97AzmomDThQze2MAdsWLiluPNn/VpCUwZGpjOYk60
   XsfH5GZAaslXw8XdiJTM7NN9fuwZuq4v25jvFe/E1nPmN0FI4lF9lea1J
   KG52Si6c4oen5ODTEiUT2bFIUVsDt7ibYjuM+N6a9Cehylqk/MEzz3vTc
   hXlc8gn9KAQbVHcaKAORs9f9ufumyvBW5Tn+txJJDePdPJYRBtCys1SoU
   TdOu/szhw1gwEOgfKWjcuzhkYxB52GS5fNoffZKSTV1Dx1n7t5lM5aYGl
   w==;
X-CSE-ConnectionGUID: 4M/aZagDT6a5P07Ldp9mIw==
X-CSE-MsgGUID: ev7UG6DhR9+vrCEGdv5FAg==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="75444228"
X-IronPort-AV: E=Sophos;i="6.15,308,1739865600"; 
   d="scan'208";a="75444228"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2025 02:53:55 -0700
X-CSE-ConnectionGUID: +//3taRjQD+Z0DCRSYG1ig==
X-CSE-MsgGUID: 5vL9xZxlQiywW2E/+v2/iA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,308,1739865600"; 
   d="scan'208";a="164315084"
Received: from 984fee019967.jf.intel.com ([10.165.54.94])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2025 02:53:54 -0700
From: Chao Gao <chao.gao@intel.com>
To: linux-coco@lists.linux.dev,
	x86@kernel.org,
	kvm@vger.kernel.org
Cc: seanjc@google.com,
	pbonzini@redhat.com,
	eddie.dong@intel.com,
	kirill.shutemov@intel.com,
	dave.hansen@intel.com,
	dan.j.williams@intel.com,
	kai.huang@intel.com,
	isaku.yamahata@intel.com,
	elena.reshetova@intel.com,
	rick.p.edgecombe@intel.com,
	Chao Gao <chao.gao@intel.com>,
	Farrah Chen <farrah.chen@intel.com>,
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	"H. Peter Anvin" <hpa@zytor.com>,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 15/20] x86/virt/seamldr: Handle TD-Preserving update failures
Date: Fri, 23 May 2025 02:52:38 -0700
Message-ID: <20250523095322.88774-16-chao.gao@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250523095322.88774-1-chao.gao@intel.com>
References: <20250523095322.88774-1-chao.gao@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Failure encounterred after the module shutdown are unrecoverable. All
subsequent SEAMCALLs will fail and TDs will be killed.

Report the error through sysfs attributes and log a message to clarify that
SEAMCALL errors are expected in this situation.

Signed-off-by: Chao Gao <chao.gao@intel.com>
Tested-by: Farrah Chen <farrah.chen@intel.com>
---
 arch/x86/virt/vmx/tdx/seamldr.c | 15 ++++++++++++++-
 arch/x86/virt/vmx/tdx/tdx.c     | 13 +++++++++++++
 arch/x86/virt/vmx/tdx/tdx.h     |  1 +
 3 files changed, 28 insertions(+), 1 deletion(-)

diff --git a/arch/x86/virt/vmx/tdx/seamldr.c b/arch/x86/virt/vmx/tdx/seamldr.c
index 1ecb5d3088af..a18df08a5528 100644
--- a/arch/x86/virt/vmx/tdx/seamldr.c
+++ b/arch/x86/virt/vmx/tdx/seamldr.c
@@ -278,6 +278,14 @@ static void ack_state(void)
 	}
 }
 
+static void print_update_failure_message(void)
+{
+	static atomic_t printed = ATOMIC_INIT(0);
+
+	if (atomic_inc_return(&printed) == 1)
+		pr_err("update failed, SEAMCALLs will report failure until TDs killed\n");
+}
+
 /*
  * See multi_cpu_stop() from where this multi-cpu state-machine was
  * adopted, and the rationale for touch_nmi_watchdog()
@@ -314,8 +322,13 @@ static int do_seamldr_install_module(void *params)
 				break;
 			}
 
-			if (ret)
+			if (ret) {
 				atomic_inc(&tdp_data.failed);
+				if (curstate >= TDP_CPU_INSTALL) {
+					tdx_module_set_error();
+					print_update_failure_message();
+				}
+			}
 			ack_state();
 		} else {
 			touch_nmi_watchdog();
diff --git a/arch/x86/virt/vmx/tdx/tdx.c b/arch/x86/virt/vmx/tdx/tdx.c
index 4cdeec0a4128..331c86eeddcf 100644
--- a/arch/x86/virt/vmx/tdx/tdx.c
+++ b/arch/x86/virt/vmx/tdx/tdx.c
@@ -1102,6 +1102,13 @@ static ssize_t version_show(struct device *dev, struct device_attribute *attr,
 {
 	const struct tdx_sys_info_versions *v = &tdx_sysinfo.versions;
 
+	/*
+	 * Inform userspace that the TDX module isn't in a usable state,
+	 * possibly due to a failed update.
+	 */
+	if (tdx_module_status != TDX_MODULE_INITIALIZED)
+		return -ENXIO;
+
 	return sysfs_emit(buf, "%u.%u.%u\n", v->major_version,
 					     v->minor_version,
 					     v->update_version);
@@ -1377,6 +1384,12 @@ int tdx_module_shutdown(void)
 	return ret;
 }
 
+void tdx_module_set_error(void)
+{
+	/* Called from stop_machine(). no need to hold tdx_module_lock */
+	tdx_module_status = TDX_MODULE_ERROR;
+}
+
 static bool is_pamt_page(unsigned long phys)
 {
 	struct tdmr_info_list *tdmr_list = &tdx_tdmr_list;
diff --git a/arch/x86/virt/vmx/tdx/tdx.h b/arch/x86/virt/vmx/tdx/tdx.h
index 3830dee4da91..ed3d74c991f6 100644
--- a/arch/x86/virt/vmx/tdx/tdx.h
+++ b/arch/x86/virt/vmx/tdx/tdx.h
@@ -125,5 +125,6 @@ struct tdmr_info_list {
 int seamldr_prerr(u64 fn, struct tdx_module_args *args);
 
 int tdx_module_shutdown(void);
+void tdx_module_set_error(void);
 
 #endif
-- 
2.47.1

