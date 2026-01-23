Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1C693570B2
	for <linux-coco@lists.linux.dev>; Fri, 23 Jan 2026 15:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769180435; cv=none; b=CSWVkk4yGtBnvEzi7kdvhu8Z5qOYA0TKMlW3DLWTkXgieFQ+xuzczsGAL3l6OJgEpik9pAXJBBRnlw9HVa3zd67A5qaKdG30c7U7hk/9WW3zM0i7I9pf7gkqzaJdlogGTXj8QTzbMuBofCtHxoOVsyjPl+WiESfXWUXIOmCZ36M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769180435; c=relaxed/simple;
	bh=c+YcofYlDsoQPUldf/eodN31yd/szVEY6FullhsT+/4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iN/tlVR/+7Q5DGJ0pgL2+WpwL/wMncni5DGhcF0hTbhGFb6GCo9DKOZT3adAnF79E/9sWfAeeTDadNNPvG0JEZ2zFFZu+Wid21HRP0HwavpfiXuvENkGddC0SzuY9mXiHpgSlhtblLkelmQnmrDpURwhIX9BqZXrpE23g9tV1kQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FtghIUML; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FtghIUML"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769180433; x=1800716433;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=c+YcofYlDsoQPUldf/eodN31yd/szVEY6FullhsT+/4=;
  b=FtghIUMLyuq+WLSKg309pYV7U9MqLXS03znMRp56CH4A4yvLccU6FDHq
   QDVqbiT22f0l8uMwQ/KjRLqV7ivBQc6vJ+sR9uLkq93e+u2vCgYdfyLCg
   qnmMrhoGDvbfZY6ZQlH7Ysrwbq6MXCC1YS0kGAInXrCZvpVBoNnyOB+9l
   Or0MqmBWHL8LH1O0m5C3LxUXkpuJhhOsV3ZU5q2Qq62+iYlNQEqCcUIu4
   96xj1sJZ6hXAPVTdxFVueI2rrH7Whe379uUu3e3YY08vtXyuPG1eyrv1/
   y6cgFuLKR1wB03hkzbhGPuTOaqjImTxYPIpqu7SFdZeVWGKJxiUTg4Ep5
   Q==;
X-CSE-ConnectionGUID: xwDYSKflR0memWaN0n+/Bg==
X-CSE-MsgGUID: s3YylK+2T36ZlO/k3U/4Fw==
X-IronPort-AV: E=McAfee;i="6800,10657,11680"; a="70334476"
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; 
   d="scan'208";a="70334476"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2026 07:00:18 -0800
X-CSE-ConnectionGUID: J7kqfZNRTNajWQNCmyj28w==
X-CSE-MsgGUID: CyYboKZqSRi0wY6y+7izcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; 
   d="scan'208";a="237697180"
Received: from 984fee019967.jf.intel.com ([10.23.153.244])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2026 07:00:17 -0800
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
	Chao Gao <chao.gao@intel.com>,
	Farrah Chen <farrah.chen@intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH v3 18/26] x86/virt/seamldr: Log TDX Module update failures
Date: Fri, 23 Jan 2026 06:55:26 -0800
Message-ID: <20260123145645.90444-19-chao.gao@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260123145645.90444-1-chao.gao@intel.com>
References: <20260123145645.90444-1-chao.gao@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If failures occur after the TDX Module has been successfully shut down,
they are unrecoverable. The kernel cannot restore the previous TDX
Module to a running state. All subsequent SEAMCALLs to the TDX Module
will fail, so TDs cannot continue to run.

Log a message to clarify that SEAMCALL errors are expected in this case.

To prevent TDX Module update failures, admins are encouraged to use the
user space tool [1] that will perform compatibility and integrity checks
that guarantee TDX Module update success.

Signed-off-by: Chao Gao <chao.gao@intel.com>
Tested-by: Farrah Chen <farrah.chen@intel.com>
Link: https://github.com/intel/tdx-module-binaries/blob/main/version_select_and_load.py # [1]
---
v3:
 - Rephrase the changelog to eliminate the confusing uses of 'i.e.' and 'e.g.'
   [Dave/Yilun]
---
 arch/x86/virt/vmx/tdx/seamldr.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/arch/x86/virt/vmx/tdx/seamldr.c b/arch/x86/virt/vmx/tdx/seamldr.c
index 76f404d1115c..b497fa72ebb6 100644
--- a/arch/x86/virt/vmx/tdx/seamldr.c
+++ b/arch/x86/virt/vmx/tdx/seamldr.c
@@ -260,6 +260,14 @@ static void ack_state(void)
 		set_target_state(tdp_data.state + 1);
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
@@ -289,10 +297,13 @@ static int do_seamldr_install_module(void *params)
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

