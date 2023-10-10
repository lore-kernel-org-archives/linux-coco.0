Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D70ECD2F2
	for <linux-coco@lists.linux.dev>; Tue, 10 Oct 2023 08:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bZFB8iUf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696926936; x=1728462936;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=P/4mWGyVldhGd+8X9JavsKnqWkSdr5BRdzY15fml+QM=;
  b=bZFB8iUflxcBgAATZNPCk5MO7zvZMUuJiSKOpCYYUqVDETHUEnH3qX8y
   Gp0nqbyLn0AdfDH8h6IhfcgWVYaSE2jPn1rd8Ut6Z2ds1Mtx+AvTD5uJf
   CaqUGNaJNPUdcXgy2Bhr+5zRUzJY27He5Zw1NOKKX31EwOp4Q8NTzru8J
   P4WdMJ0nmN1rpAmQDqAefBNo5umpcY2XayAhDCQ7M+grhlU/IzsoS/FnY
   iOQPEIneck3JoVdBsGkjOlf46nmcdQ19UtAJrHr/O2woh98y4VXMC9z0Z
   e+Sbn5Owdm9Cqmc1syp8W482f0bcsGleGgFhHeSUCAm4TRpNu7poWLBsx
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="387176603"
X-IronPort-AV: E=Sophos;i="6.03,212,1694761200"; 
   d="scan'208";a="387176603"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2023 01:35:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="730001332"
X-IronPort-AV: E=Sophos;i="6.03,212,1694761200"; 
   d="scan'208";a="730001332"
Received: from ls.sc.intel.com (HELO localhost) ([172.25.112.31])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2023 01:35:32 -0700
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
Subject: [PATCH 02/12] X86/mce/inject: Add mcgstatus for mce-inject debugfs
Date: Tue, 10 Oct 2023 01:35:10 -0700
Message-Id: <062049a8ebfaa7bf14fe22ddb5e48f5b660e3332.1696926843.git.isaku.yamahata@intel.com>
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

To test KVM x86 to inject machine check with memory failure, it wants to
to set LMCE_S (local machine check exception signaled) for memory failure
injection test.  The current code sets mcgstatus based on the other values
and can't set LMCE_S flag.

Add mcgstatus entry to allow to set mcgstatus value.

Signed-off-by: Isaku Yamahata <isaku.yamahata@intel.com>
---
 arch/x86/kernel/cpu/mce/inject.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/x86/kernel/cpu/mce/inject.c b/arch/x86/kernel/cpu/mce/inject.c
index 881898a1d2f4..461858ae18f9 100644
--- a/arch/x86/kernel/cpu/mce/inject.c
+++ b/arch/x86/kernel/cpu/mce/inject.c
@@ -72,6 +72,7 @@ static int inj_##reg##_set(void *data, u64 val)				\
 	return 0;							\
 }
 
+MCE_INJECT_SET(mcgstatus);
 MCE_INJECT_SET(status);
 MCE_INJECT_SET(misc);
 MCE_INJECT_SET(addr);
@@ -86,12 +87,14 @@ static int inj_##reg##_get(void *data, u64 *val)			\
 	return 0;							\
 }
 
+MCE_INJECT_GET(mcgstatus);
 MCE_INJECT_GET(status);
 MCE_INJECT_GET(misc);
 MCE_INJECT_GET(addr);
 MCE_INJECT_GET(synd);
 MCE_INJECT_GET(ipid);
 
+DEFINE_SIMPLE_ATTRIBUTE(mcgstatus_fops, inj_mcgstatus_get, inj_mcgstatus_set, "%llx\n");
 DEFINE_SIMPLE_ATTRIBUTE(status_fops, inj_status_get, inj_status_set, "%llx\n");
 DEFINE_SIMPLE_ATTRIBUTE(misc_fops, inj_misc_get, inj_misc_set, "%llx\n");
 DEFINE_SIMPLE_ATTRIBUTE(addr_fops, inj_addr_get, inj_addr_set, "%llx\n");
@@ -679,6 +682,9 @@ static const char readme_msg[] =
 "\t    APIC interrupt handler to handle the error. \n"
 "\n"
 "ipid:\t IPID (AMD-specific)\n"
+"\n"
+"mcgstatus:\t Set MCG_STATUS: the bits in that MSR describes the current state\n"
+"\t of the processor after the MCE.\n"
 "\n";
 
 static ssize_t
@@ -706,6 +712,8 @@ static struct dfs_node {
 	{ .name = "bank",	.fops = &bank_fops,   .perm = S_IRUSR | S_IWUSR },
 	{ .name = "flags",	.fops = &flags_fops,  .perm = S_IRUSR | S_IWUSR },
 	{ .name = "cpu",	.fops = &extcpu_fops, .perm = S_IRUSR | S_IWUSR },
+	{ .name = "mcgstatus",	.fops = &mcgstatus_fops,
+						      .perm = S_IRUSR | S_IWUSR },
 	{ .name = "README",	.fops = &readme_fops, .perm = S_IRUSR | S_IRGRP | S_IROTH },
 };
 
-- 
2.25.1

