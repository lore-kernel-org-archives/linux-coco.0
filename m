Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A470E8F54
	for <linux-coco@lists.linux.dev>; Tue, 10 Oct 2023 08:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mMfHk0r+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696926939; x=1728462939;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=TulaiyUaTkWindo/LLjGvgcL1lDIYfNLfoQuJ8JmFgY=;
  b=mMfHk0r+xoy1+3lGtCE2jknstMlg8bQWRbhdesVMHJ52okNUIUs4ofEE
   8ndal9PJCsaQJezGKJmh5g7ggV3Y9pK5Lkkt9khWDqdNrkWCph0MWrhY8
   4D79z0rpWKhxt86t/SXOX5Zvuv3IprurKtgu9KKCnTIpLwhqazyynJbZR
   wcLnj431PsFqsX9TNKOPB20N3ScTcxJZCHBnlknZKz3yLshybDMZAUGQN
   ttbwCBm3w1plaxR3mRAOnFrxf7WdkyFTBurnoEWJFLpsjVI6k6MLIjELE
   PCNl4OCD+FautsoIZZE2VoQRbrV+9f8r023kiAEDqHsrkqI5r8tqjQcqA
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="363689832"
X-IronPort-AV: E=Sophos;i="6.03,212,1694761200"; 
   d="scan'208";a="363689832"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2023 01:35:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="1084687200"
X-IronPort-AV: E=Sophos;i="6.03,212,1694761200"; 
   d="scan'208";a="1084687200"
Received: from ls.sc.intel.com (HELO localhost) ([172.25.112.31])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2023 01:35:35 -0700
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
Subject: [PATCH 08/12] x86/mce: Define a notifier chain for mce injector
Date: Tue, 10 Oct 2023 01:35:16 -0700
Message-Id: <0fd1649eb24b9757c299a89e34444630924bd2e0.1696926843.git.isaku.yamahata@intel.com>
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

To test KVM mechine check injection path, KVM wants to trigger machine
check on its own.  Not on writing to debugfs bank file of x86 mce injector.

Because KVM doesn't want to depend on x86 MCE injector, define notifier
chain in the x86 MCE core and make the x86 MCE injector to register the
notifier chain to decouple the MCE injector and its user.  This follows how
dev-mcelog does.

Signed-off-by: Isaku Yamahata <isaku.yamahata@intel.com>
---
 arch/x86/include/asm/mce.h       |  6 ++++++
 arch/x86/kernel/cpu/mce/core.c   | 20 ++++++++++++++++++++
 arch/x86/kernel/cpu/mce/inject.c | 18 ++++++++++++++++++
 3 files changed, 44 insertions(+)

diff --git a/arch/x86/include/asm/mce.h b/arch/x86/include/asm/mce.h
index 459066ecd922..1a832a207b6a 100644
--- a/arch/x86/include/asm/mce.h
+++ b/arch/x86/include/asm/mce.h
@@ -269,10 +269,16 @@ DECLARE_PER_CPU(struct mce, injectm);
 void mce_inject_lock(void);
 void mce_inject_unlock(void);
 void mce_inject(struct mce *m);
+void mce_register_atomic_injector_chain(struct notifier_block *nb);
+void mce_unregister_atomic_injector_chain(struct notifier_block *nb);
+void mce_call_atomic_injector_chain(unsigned long cpu);
 #else
 static inline void mce_inject_lock(void) {}
 static inline void mce_inject_unlock(void) {}
 static inline void mce_inject(struct mce *m) {}
+static inline void mce_register_atomic_injector_chain(struct notifier_block *nb) {}
+static inline void mce_unregister_atomic_injector_chain(struct notifier_block *nb) {}
+static inline void mce_call_atomic_injector_chain(unsigned long cpu) {}
 #endif
 
 /* Disable CMCI/polling for MCA bank claimed by firmware */
diff --git a/arch/x86/kernel/cpu/mce/core.c b/arch/x86/kernel/cpu/mce/core.c
index 6929c3cad278..9a6b04be7404 100644
--- a/arch/x86/kernel/cpu/mce/core.c
+++ b/arch/x86/kernel/cpu/mce/core.c
@@ -169,6 +169,26 @@ void mce_inject(struct mce *m)
 }
 EXPORT_SYMBOL_GPL(mce_inject);
 
+static ATOMIC_NOTIFIER_HEAD(mce_atomic_injector_chain);
+
+void mce_register_atomic_injector_chain(struct notifier_block *nb)
+{
+	atomic_notifier_chain_register(&mce_atomic_injector_chain, nb);
+}
+EXPORT_SYMBOL_GPL(mce_register_atomic_injector_chain);
+
+void mce_unregister_atomic_injector_chain(struct notifier_block *nb)
+{
+	atomic_notifier_chain_unregister(&mce_atomic_injector_chain, nb);
+}
+EXPORT_SYMBOL_GPL(mce_unregister_atomic_injector_chain);
+
+void mce_call_atomic_injector_chain(unsigned long cpu)
+{
+	atomic_notifier_call_chain(&mce_atomic_injector_chain, cpu, NULL);
+}
+EXPORT_SYMBOL_GPL(mce_call_atomic_injector_chain);
+
 void mce_log(struct mce *m)
 {
 	if (!mce_gen_pool_add(m))
diff --git a/arch/x86/kernel/cpu/mce/inject.c b/arch/x86/kernel/cpu/mce/inject.c
index 43d896a89648..5dac4dcb25aa 100644
--- a/arch/x86/kernel/cpu/mce/inject.c
+++ b/arch/x86/kernel/cpu/mce/inject.c
@@ -303,8 +303,24 @@ static int fadvise_inject_addr(struct notifier_block *nb, unsigned long val,
 
 static struct notifier_block fadvise_nb = {
 	.notifier_call	= fadvise_inject_addr,
+};
+
+static int mce_atomic_injector(struct notifier_block *nb, unsigned long val,
+			       void *data)
+{
+	lockdep_assert_preemption_disabled();
+
+	i_mce.extcpu = val;
+	mce_inject(&i_mce);
+	setup_inj_struct(&i_mce);
+
+	return NOTIFY_DONE;
 }
 
+static struct notifier_block atomic_injector_nb = {
+	.notifier_call = mce_atomic_injector,
+};
+
 /*
  * Caller needs to be make sure this cpu doesn't disappear
  * from under us, i.e.: get_cpu/put_cpu.
@@ -796,6 +812,7 @@ static int __init inject_init(void)
 	register_nmi_handler(NMI_LOCAL, mce_raise_notify, 0, "mce_notify");
 	mce_register_injector_chain(&inject_nb);
 	fadvise_register_mce_injector_chain(&fadvise_nb);
+	mce_register_atomic_injector_chain(&atomic_injector_nb);
 
 	setup_inj_struct(&i_mce);
 
@@ -807,6 +824,7 @@ static int __init inject_init(void)
 static void __exit inject_exit(void)
 {
 
+	mce_unregister_atomic_injector_chain(&atomic_injector_nb);
 	fadvise_unregister_mce_injector_chain(&fadvise_nb);
 	mce_unregister_injector_chain(&inject_nb);
 	unregister_nmi_handler(NMI_LOCAL, "mce_notify");
-- 
2.25.1

