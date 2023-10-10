Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 135C115ADF
	for <linux-coco@lists.linux.dev>; Tue, 10 Oct 2023 08:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GxcEhBkb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696926935; x=1728462935;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=m7pCDbhKS6+u2jcznAubfaRxlAgJtSYbB0zCkXhtCcE=;
  b=GxcEhBkbqGbHT9xbRc34CJgn/Fh3UesMDX/ITs1klVPyVHu0bfQtnhbs
   /gAYKLsbfUch9qiWYO3olrjAqGu6Qkb1ZTuplTxE3VYYowIuNKHfT5Wkn
   oI67ufdFUad0h9eViZBthlnf2FhdtaB0C+EEswmy31kHZIL2GaBapEEdP
   Ez3MsIcuO4w1Mr+KkE7aXySiVdrMEBKXdePFuY7Qer2UYHl5SVo5JS+y4
   QCT6bBjYWq9WJP+0BWBrX9Gf7VlyGgPl3hmCzXq7v/vVe0HkLVarBNqY2
   spj5SomoIfXV3KYWeBcY+2wknkrFHniTz/EqTWH3FryS2m5mXC7ZhsXJH
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="363689795"
X-IronPort-AV: E=Sophos;i="6.03,212,1694761200"; 
   d="scan'208";a="363689795"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2023 01:35:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="1084687182"
X-IronPort-AV: E=Sophos;i="6.03,212,1694761200"; 
   d="scan'208";a="1084687182"
Received: from ls.sc.intel.com (HELO localhost) ([172.25.112.31])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2023 01:35:33 -0700
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
Subject: [PATCH 03/12] x86/mce/inject: Add notrigger entry to suppress MCE injection
Date: Tue, 10 Oct 2023 01:35:11 -0700
Message-Id: <97809b68e427922948044e33599c2fc7c9f6134c.1696926843.git.isaku.yamahata@intel.com>
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

The current x86 MCE injection framework injects MCE when writing to
/sys/kernel/debug/mce-inject/bank.  KVM wants to inject machine check on
behalf of vcpu context instead of the context of writing to the bank file.

Because ACPI APEI has a similar requirement and it adds
/sys/kernel/debug/apei/notrigger to suppress immediate injection.
By Following it, add /sys/kernel/debug/mce-inject/notrigger to suppress
MCE injection.

The alternative is add new value "notrigger" to
/sys/kernel/debug/mce-inject/flags in addition to "sw", "hw", "df", and
"th".  Because it may break user space ABI, this option follow ACPI APEI
error injection.

Supposed usage flow:
$ echo 1 > notrigger
  ... setup MCE values
$ echo 0 > bank
  The last step to setup mce value to inject with MC bank 0.
  Originally this step injects mce.  With noijnect=1, don't inject.

$ echo 1 > /sys/kernel/debug/kvm/<pid>-<fd>/vcpu<N>/mce-inject
  tell KVM to inject MCE in the context of vcpu.

Signed-off-by: Isaku Yamahata <isaku.yamahata@intel.com>
---
 arch/x86/kernel/cpu/mce/inject.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/x86/kernel/cpu/mce/inject.c b/arch/x86/kernel/cpu/mce/inject.c
index 461858ae18f9..88603a6c0afe 100644
--- a/arch/x86/kernel/cpu/mce/inject.c
+++ b/arch/x86/kernel/cpu/mce/inject.c
@@ -34,6 +34,7 @@
 #include "internal.h"
 
 static bool hw_injection_possible;
+static u64 notrigger;
 
 /*
  * Collect all the MCi_XXX settings
@@ -598,6 +599,8 @@ static int inj_bank_set(void *data, u64 val)
 	}
 
 	m->bank = val;
+	if (notrigger)
+		return 0;
 
 	/*
 	 * sw-only injection allows to write arbitrary values into the MCA
@@ -637,6 +640,21 @@ MCE_INJECT_GET(bank);
 
 DEFINE_SIMPLE_ATTRIBUTE(bank_fops, inj_bank_get, inj_bank_set, "%llu\n");
 
+static int inj_notrigger_get(void *data, u64 *val)
+{
+	*val = notrigger;
+	return 0;
+}
+
+static int inj_notrigger_set(void *data, u64 val)
+{
+	notrigger = val;
+	return 0;
+}
+
+DEFINE_SIMPLE_ATTRIBUTE(notrigger_fops, inj_notrigger_get, inj_notrigger_set,
+			"%llx\n");
+
 static const char readme_msg[] =
 "Description of the files and their usages:\n"
 "\n"
@@ -685,6 +703,9 @@ static const char readme_msg[] =
 "\n"
 "mcgstatus:\t Set MCG_STATUS: the bits in that MSR describes the current state\n"
 "\t of the processor after the MCE.\n"
+"\n"
+"notrigger:\t Suppress triggering the injection when set to non-zero\n"
+"\t The injection is triggered by other way.\n"
 "\n";
 
 static ssize_t
@@ -714,6 +735,8 @@ static struct dfs_node {
 	{ .name = "cpu",	.fops = &extcpu_fops, .perm = S_IRUSR | S_IWUSR },
 	{ .name = "mcgstatus",	.fops = &mcgstatus_fops,
 						      .perm = S_IRUSR | S_IWUSR },
+	{ .name = "notrigger",	.fops = &notrigger_fops,
+						      .perm = S_IRUSR | S_IWUSR },
 	{ .name = "README",	.fops = &readme_fops, .perm = S_IRUSR | S_IRGRP | S_IROTH },
 };
 
-- 
2.25.1

