Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E024B3612E6
	for <linux-coco@lists.linux.dev>; Thu, 12 Feb 2026 14:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770906988; cv=none; b=X5UaGEx0f13KPfuLKAs33d2k8O5tWj0xXCalrmrKaXtdQ7S9YfZPqZK8bf0hYAHdWu20dnigXK6eRl7X+aOP4ewXYJlZZ17oqb5rMId9zpKbch42pYraoXDTLKXWLz8elnokoCCmdOC8AEzt8jha0fhKGgc6mny9v9ouSVRKtDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770906988; c=relaxed/simple;
	bh=IfQzPX1cJba+4g91Qbi6v8rNBx4++Vy8ZWVsMap6Vm4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f8EWgrkCUh4WhSIGLVw3Z4TMjtzB8O/eXJWA++CJdcvlT4Jv7EjknYhWEbjLqZ3tRUw/a/q7jf5Kqi1qEQaVSDDnchN0AX0Twbrsy+Ik1YW1CzoprC3X6G5xP14S6b4zuQF9B4Sres4hHbkeCo6Jy8MPfcBgEw+Z5jEFaSTQzBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J5UDf6M7; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J5UDf6M7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770906986; x=1802442986;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=IfQzPX1cJba+4g91Qbi6v8rNBx4++Vy8ZWVsMap6Vm4=;
  b=J5UDf6M7SRg9JDTt/6bWTWK0T4jS2Eu0inQTrYwE7aWt6HuOeIy+VB8O
   sEpQqGVHW/bZUJ3gRsYHRsm+Qcdh/0JB2MMiH5uk6BybdrE2W65Ij3kA7
   m4J+muMWJUy8avyEwvbowQ2mOmJWiC04zR9lMHuX8sp+PrtjtgC1nLVuc
   bEwHP+BcKsI1kldaahlwlPaWbvQLiER4VEAAhHbR/fQE5dBKLR9G5jFdk
   KCvDopvQ/5q7JTavvOHMfTZGfvzgSOlYqRZo312T3+6Uek3Sahbth/f53
   q8Q9Rg7m9wJXmLkSF96gp7E9/tbPo9I6TYYPHkt8LfY0fEjqZbKoxBE7I
   A==;
X-CSE-ConnectionGUID: PNs3p3oMRk+zeanjtZQfxQ==
X-CSE-MsgGUID: HZ/P8Mz4QFyAsJmczvtKOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11699"; a="89662861"
X-IronPort-AV: E=Sophos;i="6.21,286,1763452800"; 
   d="scan'208";a="89662861"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 06:36:25 -0800
X-CSE-ConnectionGUID: rTzU3R0URjK+k3EPQV3rDA==
X-CSE-MsgGUID: 8JAweDGHRIa9GhudxWrKNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,286,1763452800"; 
   d="scan'208";a="211428276"
Received: from 984fee019967.jf.intel.com ([10.23.153.244])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 06:36:24 -0800
From: Chao Gao <chao.gao@intel.com>
To: linux-coco@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	x86@kernel.org
Cc: reinette.chatre@intel.com,
	ira.weiny@intel.com,
	kai.huang@intel.com,
	dan.j.williams@intel.com,
	yilun.xu@linux.intel.com,
	sagis@google.com,
	vannapurve@google.com,
	paulmck@kernel.org,
	nik.borisov@suse.com,
	zhenzhong.duan@intel.com,
	seanjc@google.com,
	rick.p.edgecombe@intel.com,
	kas@kernel.org,
	dave.hansen@linux.intel.com,
	vishal.l.verma@intel.com,
	binbin.wu@linux.intel.com,
	tony.lindgren@linux.intel.com,
	Chao Gao <chao.gao@intel.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH v4 15/24] x86/virt/seamldr: Log TDX Module update failures
Date: Thu, 12 Feb 2026 06:35:18 -0800
Message-ID: <20260212143606.534586-16-chao.gao@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260212143606.534586-1-chao.gao@intel.com>
References: <20260212143606.534586-1-chao.gao@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, there is no way to restore a TDX Module from shutdown state to
running state. This means if errors occur after a successful module
shutdown, they are unrecoverable since the old module is gone but the new
module isn't installed. All subsequent SEAMCALLs to the TDX Module will
fail, so TDs will be killed due to SEAMCALL failures.

Log a message to clarify that SEAMCALL errors are expected in this
scenario. This ensures that after update failures, the first message in
dmesg explains the situation rather than showing confusing call traces from
various code paths.

Signed-off-by: Chao Gao <chao.gao@intel.com>
Reviewed-by: Tony Lindgren <tony.lindgren@linux.intel.com>
---
v4:
 - Use pr_warn_once() instead of reinventing it [Yilun]
v3:
 - Rephrase the changelog to eliminate the confusing uses of 'i.e.' and 'e.g.'
   [Dave/Yilun]
---
 arch/x86/virt/vmx/tdx/seamldr.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/x86/virt/vmx/tdx/seamldr.c b/arch/x86/virt/vmx/tdx/seamldr.c
index c59cdd5b1fe4..4e0a98404c7f 100644
--- a/arch/x86/virt/vmx/tdx/seamldr.c
+++ b/arch/x86/virt/vmx/tdx/seamldr.c
@@ -223,6 +223,11 @@ static void ack_state(void)
 		set_target_state(tdp_data.state + 1);
 }
 
+static void print_update_failure_message(void)
+{
+	pr_err_once("update failed, SEAMCALLs will report failure until TDs killed\n");
+}
+
 /*
  * See multi_cpu_stop() from where this multi-cpu state-machine was
  * adopted, and the rationale for touch_nmi_watchdog()
@@ -252,10 +257,13 @@ static int do_seamldr_install_module(void *params)
 				break;
 			}
 
-			if (ret)
+			if (ret) {
 				atomic_inc(&tdp_data.failed);
-			else
+				if (curstate > TDP_SHUTDOWN)
+					print_update_failure_message();
+			} else {
 				ack_state();
+			}
 		} else {
 			touch_nmi_watchdog();
 			rcu_momentary_eqs();
-- 
2.47.3

