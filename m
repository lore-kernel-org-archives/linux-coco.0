Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BA64DDAB
	for <linux-coco@lists.linux.dev>; Tue, 10 Oct 2023 08:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LAwxG/oN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696926938; x=1728462938;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ltSCu5LbcZQkZ8VDt/3RcMj+M7LqTSv2OY7y3BW7maY=;
  b=LAwxG/oNMVb0ymZuizbhVBATNuzjx00OKZAuTzldZlCVe2cMoiCVPyM5
   HzoEv0waFwq0bLaQB/VQ/qcrC4Fy1ssqrkMVV9Br2fuHyte0anRIBxadP
   0rZe2pboODrNQvygeB5X2ED7i2imfYPAOqiy7dDMQGUOjdFcylTwDruwt
   ZWZg3QoGmN5KHtI3tJSVtJFOmQtIAJQxMKeOfGgbYzwTgs9S40GGqbs+E
   vT7f9TQs+wiBlWOIoOw4Z/JpYAFxge2WZBP2zc8SnE8vbWUteoQY2PFuq
   xAgbiwwwA06YOEEeSGwsX3tan/cOw3alXlEjbhlKKHQQ4jelne/aitWAD
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="363689822"
X-IronPort-AV: E=Sophos;i="6.03,212,1694761200"; 
   d="scan'208";a="363689822"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2023 01:35:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="1084687197"
X-IronPort-AV: E=Sophos;i="6.03,212,1694761200"; 
   d="scan'208";a="1084687197"
Received: from ls.sc.intel.com (HELO localhost) ([172.25.112.31])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2023 01:35:34 -0700
From: isaku.yamahata@intel.com
To: kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: isaku.yamahata@intel.com,
	isaku.yamahata@gmail.com,
	Michael Roth <michael.roth@amd.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	linux-coco@lists.linux.dev,
	Chao Peng <chao.p.peng@linux.intel.com>
Subject: [PATCH 07/12] x86/mce/inject: Wire up the x86 MCE injector to FADV_MCE_INJECT
Date: Tue, 10 Oct 2023 01:35:15 -0700
Message-Id: <d78363e1419de5552ac527ac7a23189d6f960c10.1696926843.git.isaku.yamahata@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1696926843.git.isaku.yamahata@intel.com>
References: <cover.1696926843.git.isaku.yamahata@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Isaku Yamahata <isaku.yamahata@intel.com>

To inject machine check based on FADV_MCE_INJECT, wire up the x86 MCE
injector to register its handler to get notified physical address on
FADV_MCE_INJECT.

Signed-off-by: Isaku Yamahata <isaku.yamahata@intel.com>
---
 arch/x86/kernel/cpu/mce/inject.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/x86/kernel/cpu/mce/inject.c b/arch/x86/kernel/cpu/mce/inject.c
index ae3efbeb78bd..43d896a89648 100644
--- a/arch/x86/kernel/cpu/mce/inject.c
+++ b/arch/x86/kernel/cpu/mce/inject.c
@@ -294,6 +294,17 @@ static struct notifier_block inject_nb = {
 	.notifier_call  = mce_inject_raise,
 };
 
+static int fadvise_inject_addr(struct notifier_block *nb, unsigned long val,
+				void *data)
+{
+	inj_addr_set(&i_mce, val);
+	return NOTIFY_DONE;
+}
+
+static struct notifier_block fadvise_nb = {
+	.notifier_call	= fadvise_inject_addr,
+}
+
 /*
  * Caller needs to be make sure this cpu doesn't disappear
  * from under us, i.e.: get_cpu/put_cpu.
@@ -784,6 +795,7 @@ static int __init inject_init(void)
 
 	register_nmi_handler(NMI_LOCAL, mce_raise_notify, 0, "mce_notify");
 	mce_register_injector_chain(&inject_nb);
+	fadvise_register_mce_injector_chain(&fadvise_nb);
 
 	setup_inj_struct(&i_mce);
 
@@ -795,6 +807,7 @@ static int __init inject_init(void)
 static void __exit inject_exit(void)
 {
 
+	fadvise_unregister_mce_injector_chain(&fadvise_nb);
 	mce_unregister_injector_chain(&inject_nb);
 	unregister_nmi_handler(NMI_LOCAL, "mce_notify");
 
-- 
2.25.1

