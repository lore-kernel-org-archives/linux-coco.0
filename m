Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F388727F72C
	for <linux-coco@lists.linux.dev>; Wed,  1 Oct 2025 02:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759287317; cv=none; b=sgYjmT7a9ia6KblcSSd9u7FgLCU1bhbSBt502Uku+EEXG89Fovr5Gn3IVvlbg0muPIl5rFwG3/ClFynvJ47vXI7DP+HyhfBYPFJG2StoSJYF9Nxk5sP3Fitr4ogEqQNhmNgmzHPRu00GxRS5jqh/qbINamU4rmSi7R+xJpHFh80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759287317; c=relaxed/simple;
	bh=KUKjUzwVQn2FgmlvQBDS9HFLYMgv+qW5UWoLhq+xTz0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QyoFxJORE/GwGJxSV/Hhxoym5gWrrPI6tis5kg79ZQwlE5ld4+3kRCTVe9KUfgpMcCb7GztFoSLFwAXt/P+nnmtow/7JVv8lTObrmT17efi1k+GrMXEX3lFChzJB8nmS+D81yiPxwKOQdiWGITmb3PCNLyhxLk5Z55Fc7b25NwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GUcjNePd; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GUcjNePd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759287316; x=1790823316;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KUKjUzwVQn2FgmlvQBDS9HFLYMgv+qW5UWoLhq+xTz0=;
  b=GUcjNePdQ7eyvwNlZGchn2lG/u4Ki+KR9guX4I3XP4NM9U39YljcYKZF
   epydTuJzIhSjzsgNvj/TJyL26aNyZ4ercyGhloK0ddY0FOUKuWwZvoRUB
   pHDmjAtsBVpe8alwvZnDR2oix0KRxyifGxJ21xrHM7Z/pBIfJG/3x/BrD
   VHbt3OEHu5+hfzxoX3QOT9Q93S5GucNmxibtM3rZt10F6fqgQoZ5yhy7/
   +yRAQEkWw62Ku3hWGOseVZtrouJUsjkB9watj3oym9Gkt6VJ8w+CG1U9H
   u71IeBEJu01XUBHN2ojj4cK5Tjg8/Ep39mSaRSNsyfAeZLxCgyEZ5eVTi
   w==;
X-CSE-ConnectionGUID: ndOIZtL/SvWYrJ9YgJCu+g==
X-CSE-MsgGUID: 8y34CYFJSV64A6HNLqBjfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="61662340"
X-IronPort-AV: E=Sophos;i="6.18,305,1751266800"; 
   d="scan'208";a="61662340"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2025 19:55:16 -0700
X-CSE-ConnectionGUID: Ry9PZvyUToG1F1n0ZVqUpQ==
X-CSE-MsgGUID: 8ue/SW9gT/+WMvlpFYZweQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,305,1751266800"; 
   d="scan'208";a="178629190"
Received: from 984fee019967.jf.intel.com ([10.165.54.94])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2025 19:55:15 -0700
From: Chao Gao <chao.gao@intel.com>
To: linux-coco@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	x86@kernel.org,
	reinette.chatre@intel.com,
	ira.weiny@intel.com,
	kai.huang@intel.com,
	dan.j.williams@intel.com,
	yilun.xu@linux.intel.com,
	sagis@google.com,
	vannapurve@google.com,
	paulmck@kernel.org,
	nik.borisov@suse.com
Cc: Chao Gao <chao.gao@intel.com>,
	Farrah Chen <farrah.chen@intel.com>,
	"Kirill A. Shutemov" <kas@kernel.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH v2 13/21] x86/virt/seamldr: Abort updates if errors occurred midway
Date: Tue, 30 Sep 2025 19:52:57 -0700
Message-ID: <20251001025442.427697-14-chao.gao@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251001025442.427697-1-chao.gao@intel.com>
References: <20251001025442.427697-1-chao.gao@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The TDX Module update process has multiple stages, each of which may
encounter failures.

The current state machine of updates proceeds to the next stage
regardless of errors. But continuing updates when errors occur midway
is pointless.

Add support of transitioning directly to the final stage on errors,
effectively aborting the update and skipping all remaining stages.

Signed-off-by: Chao Gao <chao.gao@intel.com>
Tested-by: Farrah Chen <farrah.chen@intel.com>
---
 arch/x86/virt/vmx/tdx/seamldr.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/arch/x86/virt/vmx/tdx/seamldr.c b/arch/x86/virt/vmx/tdx/seamldr.c
index b074630d42e3..fca558b90f72 100644
--- a/arch/x86/virt/vmx/tdx/seamldr.c
+++ b/arch/x86/virt/vmx/tdx/seamldr.c
@@ -235,6 +235,7 @@ enum tdp_state {
 static struct {
 	enum tdp_state state;
 	atomic_t thread_ack;
+	atomic_t failed;
 } tdp_data;
 
 static void set_target_state(enum tdp_state state)
@@ -249,8 +250,16 @@ static void set_target_state(enum tdp_state state)
 /* Last one to ack a state moves to the next state. */
 static void ack_state(void)
 {
-	if (atomic_dec_and_test(&tdp_data.thread_ack))
-		set_target_state(tdp_data.state + 1);
+	if (atomic_dec_and_test(&tdp_data.thread_ack)) {
+		/*
+		 * If an error occurred, abort the update by skipping to
+		 * the final state
+		 */
+		if (atomic_read(&tdp_data.failed))
+			set_target_state(TDP_DONE);
+		else
+			set_target_state(tdp_data.state + 1);
+	}
 }
 
 /*
@@ -273,6 +282,9 @@ static int do_seamldr_install_module(void *params)
 			default:
 				break;
 			}
+
+			if (ret)
+				atomic_inc(&tdp_data.failed);
 			ack_state();
 		} else {
 			touch_nmi_watchdog();
@@ -308,6 +320,7 @@ int seamldr_install_module(const u8 *data, u32 size)
 		return -EBUSY;
 	}
 
+	atomic_set(&tdp_data.failed, 0);
 	set_target_state(TDP_START + 1);
 	ret = stop_machine_cpuslocked(do_seamldr_install_module, params, cpu_online_mask);
 	if (ret)
-- 
2.47.3

