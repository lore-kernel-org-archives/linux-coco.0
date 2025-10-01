Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6F8F27F010
	for <linux-coco@lists.linux.dev>; Wed,  1 Oct 2025 02:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759287314; cv=none; b=pfhjm5TgeopVZxvM5rc53+hac9xYIOJ1c3Wg0f39O8XaUZXmtHEGxGnMdzpUUXofnltpHr2V81d4o1BfJNAZ96Yj2slhoYiMKe8fnK71iW4KVVm2UOFQpxkqaMoYeiRnxe+CavdNfU1s6YGb5yiosXsPGV3iIsIOSK8r73/qh44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759287314; c=relaxed/simple;
	bh=fpi5/RPbm05HDWO4cAa6H+2kjOpG/E/N/ORvroo4F8Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HxFZxnOt91j+uiLJHQFRzmkwmkKuFFb2vAgLDy8ejrEbBUY0yXZpBGy6NxeFaNYFR0aRszKOmhVeJczv0+TLmlLq8zCN0B6eizvdagzR4ACjLpMXrk8GwoIrwMqAsZHqCBefCs7P2URDJAKcFvq9xuzB1ZThyrRS/rGtvVTeRjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ev1oMK76; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ev1oMK76"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759287313; x=1790823313;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fpi5/RPbm05HDWO4cAa6H+2kjOpG/E/N/ORvroo4F8Q=;
  b=Ev1oMK76HVpovUE0MsuKcmPSCLykO2R1ltTmha8PxVdVylTH06hdwd8u
   zhadwrgvljjUCevMonREdB2sW8Z3kbZaIarlMoDpp8KlKR+jWhOqk5gw4
   U8+kcWMZXCAhZQ3nasx8SQV5Oj/oZPKTafyS8CzZ0N4hl1XBBX/TTljpG
   oK3GyGTTKSnFuWsrwWi0p64ZcwmBjOGLfKOjzhKd2+zzwZuMsySVAx3CE
   YH+MMeWKgIzQfoYL7Do3R6jXWLl7s2gYWrzeB4n3bIMELyUxlxhQgyVXD
   zfqeltgtandqXrY/HhA88OPyyKzJhcABUytBUPgEYRF7wUj6sk2Hqfftc
   A==;
X-CSE-ConnectionGUID: fHk1asxSR765l4siy+42nQ==
X-CSE-MsgGUID: lltRbZ7PRNuN35eq7qF1eQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="61662301"
X-IronPort-AV: E=Sophos;i="6.18,305,1751266800"; 
   d="scan'208";a="61662301"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2025 19:55:12 -0700
X-CSE-ConnectionGUID: lb3XwFedSMG2rJH2iztJLg==
X-CSE-MsgGUID: iYEM/Dp8RSOFpX5bUNUltw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,305,1751266800"; 
   d="scan'208";a="178629166"
Received: from 984fee019967.jf.intel.com ([10.165.54.94])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2025 19:55:11 -0700
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
	"Kirill A. Shutemov" <kas@kernel.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH v2 09/21] x86/virt/seamldr: Block TDX Module updates if any CPU is offline
Date: Tue, 30 Sep 2025 19:52:53 -0700
Message-ID: <20251001025442.427697-10-chao.gao@intel.com>
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

P-SEAMLDR requires every CPU to call the SEAMLDR.INSTALL SEAMCALL during
updates.  So, every CPU should be online.

Check if all CPUs are online and abort the update if any CPU is offline at
the very beginning. Without this check, P-SEAMLDR will report failure at a
later phase where the old TDX module is gone and TDs have to be killed.

Signed-off-by: Chao Gao <chao.gao@intel.com>
---
 arch/x86/virt/vmx/tdx/seamldr.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/x86/virt/vmx/tdx/seamldr.c b/arch/x86/virt/vmx/tdx/seamldr.c
index 69c059194c61..b9e025d0f0bc 100644
--- a/arch/x86/virt/vmx/tdx/seamldr.c
+++ b/arch/x86/virt/vmx/tdx/seamldr.c
@@ -6,6 +6,8 @@
  */
 #define pr_fmt(fmt)	"seamldr: " fmt
 
+#include <linux/cpuhplock.h>
+#include <linux/cpumask.h>
 #include <linux/irqflags.h>
 #include <linux/types.h>
 
@@ -72,6 +74,12 @@ EXPORT_SYMBOL_GPL_FOR_MODULES(seamldr_get_info, "tdx-host");
 
 int seamldr_install_module(const u8 *data, u32 size)
 {
+	guard(cpus_read_lock)();
+	if (!cpumask_equal(cpu_online_mask, cpu_present_mask)) {
+		pr_err("Cannot update TDX module if any CPU is offline\n");
+		return -EBUSY;
+	}
+
 	/* TODO: Update TDX Module here */
 	return 0;
 }
-- 
2.47.3

