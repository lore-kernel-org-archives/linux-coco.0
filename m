Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFA331A280
	for <linux-coco@lists.linux.dev>; Thu,  5 Oct 2023 13:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FtdyuowD"
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696511827; x=1728047827;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dQGt0n5D7SP1i4kXyMIPUS/joI3SOgsexxI/o9/iCB0=;
  b=FtdyuowDVol7ZF7K34VNSvSBVtubEXr6Ui7DLbnijP/khAtX3wyKv8df
   4VSHIcEO58kOrCgG3HFkwtDHo1ST3wipn3N8IvwVkTbSYQKFBZ2wuOyEi
   0se6wtk67O5icNe1n9Y/IbGBznzDj796QNjNqh7vW8HbKCXGiEHVQENy4
   KXB17eyhAsZ2iaHSRv21K0VfuRlF1QKmJaoPBua8nA/hcDAd1ArxQWVYC
   8apR4IpML+Fb0qZchKs3NXYZVS+lx5J+1msH1g0AIkNA0P5d29IcyGvb9
   wwDIYyoC2v05oH8yfEqIuI0gv/LysMBjvQ0M+qAT0qqigagtgSpEew6su
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="382357596"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; 
   d="scan'208";a="382357596"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2023 06:14:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="817564325"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; 
   d="scan'208";a="817564325"
Received: from skwasnia-mobl.ger.corp.intel.com (HELO box.shutemov.name) ([10.251.222.71])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2023 06:14:23 -0700
Received: by box.shutemov.name (Postfix, from userid 1000)
	id 5CDA710A152; Thu,  5 Oct 2023 16:14:14 +0300 (+03)
From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
	Elena Reshetova <elena.reshetova@intel.com>,
	Jun Nakajima <jun.nakajima@intel.com>,
	Rick Edgecombe  <rick.p.edgecombe@intel.com>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	kexec@lists.infradead.org,
	linux-coco@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Subject: [PATCH 08/13] KVM: x86: Add config option to gate emergency virt callback support
Date: Thu,  5 Oct 2023 16:13:57 +0300
Message-ID: <20231005131402.14611-9-kirill.shutemov@linux.intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231005131402.14611-1-kirill.shutemov@linux.intel.com>
References: <20231005131402.14611-1-kirill.shutemov@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

KVM uses emergency virt call back to shutdown virtualization extension
during crash, so the crash kernel can work correctly.

So far the virt callback is only supported if KVM_INTEL or KVM_AMD is
enabled. TDX guest has similar needs.

Add a config option to gate virt emergency callback support.

Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
---
 arch/x86/include/asm/reboot.h | 4 ++--
 arch/x86/kernel/reboot.c      | 4 ++--
 arch/x86/kvm/Kconfig          | 5 +++++
 3 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/arch/x86/include/asm/reboot.h b/arch/x86/include/asm/reboot.h
index 6536873f8fc0..f72bdd4abbe8 100644
--- a/arch/x86/include/asm/reboot.h
+++ b/arch/x86/include/asm/reboot.h
@@ -25,14 +25,14 @@ void __noreturn machine_real_restart(unsigned int type);
 #define MRR_BIOS	0
 #define MRR_APM		1
 
-#if IS_ENABLED(CONFIG_KVM_INTEL) || IS_ENABLED(CONFIG_KVM_AMD)
+#ifdef CONFIG_EMERGENCY_VIRT_CALLBACK
 typedef void (cpu_emergency_virt_cb)(void);
 void cpu_emergency_register_virt_callback(cpu_emergency_virt_cb *callback);
 void cpu_emergency_unregister_virt_callback(cpu_emergency_virt_cb *callback);
 void cpu_emergency_disable_virtualization(void);
 #else
 static inline void cpu_emergency_disable_virtualization(void) {}
-#endif /* CONFIG_KVM_INTEL || CONFIG_KVM_AMD */
+#endif /* CONFIG_EMERGENCY_VIRT_CALLBACK */
 
 typedef void (*nmi_shootdown_cb)(int, struct pt_regs*);
 void nmi_shootdown_cpus(nmi_shootdown_cb callback);
diff --git a/arch/x86/kernel/reboot.c b/arch/x86/kernel/reboot.c
index 830425e6d38e..6a781f2f11c8 100644
--- a/arch/x86/kernel/reboot.c
+++ b/arch/x86/kernel/reboot.c
@@ -529,7 +529,7 @@ static inline void kb_wait(void)
 
 static inline void nmi_shootdown_cpus_on_restart(void);
 
-#if IS_ENABLED(CONFIG_KVM_INTEL) || IS_ENABLED(CONFIG_KVM_AMD)
+#ifdef CONFIG_EMERGENCY_VIRT_CALLBACK
 /* RCU-protected callback to disable virtualization prior to reboot. */
 static cpu_emergency_virt_cb __rcu *cpu_emergency_virt_callback;
 
@@ -599,7 +599,7 @@ static void emergency_reboot_disable_virtualization(void)
 }
 #else
 static void emergency_reboot_disable_virtualization(void) { }
-#endif /* CONFIG_KVM_INTEL || CONFIG_KVM_AMD */
+#endif /* CONFIG_EMERGENCY_VIRT_CALLBACK */
 
 void __attribute__((weak)) mach_reboot_fixups(void)
 {
diff --git a/arch/x86/kvm/Kconfig b/arch/x86/kvm/Kconfig
index ed90f148140d..7df3f0c45cfe 100644
--- a/arch/x86/kvm/Kconfig
+++ b/arch/x86/kvm/Kconfig
@@ -80,6 +80,7 @@ config KVM_WERROR
 config KVM_INTEL
 	tristate "KVM for Intel (and compatible) processors support"
 	depends on KVM && IA32_FEAT_CTL
+	select EMERGENCY_VIRT_CALLBACK
 	help
 	  Provides support for KVM on processors equipped with Intel's VT
 	  extensions, a.k.a. Virtual Machine Extensions (VMX).
@@ -102,6 +103,7 @@ config X86_SGX_KVM
 config KVM_AMD
 	tristate "KVM for AMD processors support"
 	depends on KVM && (CPU_SUP_AMD || CPU_SUP_HYGON)
+	select EMERGENCY_VIRT_CALLBACK
 	help
 	  Provides support for KVM on AMD processors equipped with the AMD-V
 	  (SVM) extensions.
@@ -155,3 +157,6 @@ config KVM_EXTERNAL_WRITE_TRACKING
 	bool
 
 endif # VIRTUALIZATION
+
+config EMERGENCY_VIRT_CALLBACK
+	bool
-- 
2.41.0

