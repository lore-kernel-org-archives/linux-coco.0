Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8BFA281369
	for <linux-coco@lists.linux.dev>; Sat,  7 Mar 2026 01:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772845452; cv=none; b=uzSmh/uh0Ho7R5SqP5hkMyXXrrTkN1rHi3AdfpSq0zZtruBzFZaX3GiQjRih0Xg4QTTbzlgXkoqpqUy+sTjkkDZe1zbK+qZhY5fkT9tDp/aB4SMS/AvDer14oGtXNdMXXpCiDP7O+asirRu8IgyvBUnqDJdu8oTgLyFv5B71Vkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772845452; c=relaxed/simple;
	bh=oTLfhSSlOmM92LJkqNFBzQ2K3fHxLneuG0MsPSGtmy0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bDIpvnS/7D2toasBoXgdmOLIZDC/QJLFyzYhYG3DSvi0HM9B2Cacpukd2S7t9rq+fpCFLUuMZwIpb2rrtvPAcZ/jmqMBrivRrJMch2zv0PlqMopufuGkZZGStb9ufRt8G881x6lGPK6n/MHaNobucX2XdVOwpsp0g9x9OE9y0tk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jCKrLwaW; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jCKrLwaW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772845450; x=1804381450;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=oTLfhSSlOmM92LJkqNFBzQ2K3fHxLneuG0MsPSGtmy0=;
  b=jCKrLwaW5TGp6d0vnwLyVM9f1Hs3gCIY3lwnEcCMqkIaTLNzbNXVWrhx
   BqCOa9EsyJZXqzn/+Ikt9J+tZDP8Fr1y+HhMjyqBOUROOK8NpKvTlcTQl
   EqZr7H7Dd3UFXDvb0KFSxxmQz6x7a1Ca3y5aiEagM629GVO8/gmA+1uuB
   BC9RnvP1jGxFSu015NPmHyS1ik0ImzjYDrFTlYxU0zCVViWEiLimzHV4H
   a628vbF2FByBXi3apVy/Ggxejtm59MTL3NfhnAT83BHB+lxnwysH5MtBw
   kJSOhRYhQnJ0sDUcKBDq+TUtucT6At4d9ZV10OP+lWAlJbVnLKqD7COgm
   g==;
X-CSE-ConnectionGUID: aAFUFXWrTg+Nu4kXZno7XQ==
X-CSE-MsgGUID: gnBLfZ/gQLaVHtZJTRwyrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11721"; a="76565943"
X-IronPort-AV: E=Sophos;i="6.23,105,1770624000"; 
   d="scan'208";a="76565943"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2026 17:04:08 -0800
X-CSE-ConnectionGUID: +yrCuu/GSI6QofSK7FcTIw==
X-CSE-MsgGUID: tmPMvj9KQfmWXtAEsa0ZTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,105,1770624000"; 
   d="scan'208";a="218329622"
Received: from rpedgeco-desk.jf.intel.com ([10.88.27.139])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2026 17:04:08 -0800
From: Rick Edgecombe <rick.p.edgecombe@intel.com>
To: bp@alien8.de,
	dave.hansen@intel.com,
	hpa@zytor.com,
	kas@kernel.org,
	kvm@vger.kernel.org,
	linux-coco@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	mingo@redhat.com,
	pbonzini@redhat.com,
	seanjc@google.com,
	tglx@kernel.org,
	x86@kernel.org,
	chao.gao@intel.com,
	kai.huang@intel.com,
	ackerleytng@google.com
Cc: rick.p.edgecombe@intel.com,
	vishal.l.verma@intel.com
Subject: [PATCH 2/4] x86/virt/tdx: Pull kexec cache flush logic into arch/x86
Date: Fri,  6 Mar 2026 17:03:56 -0800
Message-ID: <20260307010358.819645-3-rick.p.edgecombe@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260307010358.819645-1-rick.p.edgecombe@intel.com>
References: <20260307010358.819645-1-rick.p.edgecombe@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

KVM tries to take care of some required cache flushing earlier in the
kexec path in order to be kind to some long standing races that can occur
later in the operation. Until recently, VMXOFF was handled within KVM.
Since VMX being enabled is required to make a SEAMCALL, it had the best
per-cpu scoped operation to plug the flushing into.

This early kexec cache flushing in KVM happens via a syscore shutdown 
callback. Now that VMX enablement control has moved to arch/x86, which has 
grown its own syscore shutdown callback, it no longer make sense for it to 
live in KVM. It fits better with the TDX enablement managing code.

In addition, future changes will add a SEAMCALL that happens immediately
before VMXOFF, which means the cache flush in KVM will be too late to be
helpful. So move it to the newly added TDX arch/x86 syscore shutdown
handler.

Since tdx_cpu_flush_cache_for_kexec() is no longer needed by KVM, make it 
static and remove the export. Since it is also not part of an operation 
spread across disparate components, remove the redundant comments and 
verbose naming.

Signed-off-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
---
 arch/x86/include/asm/tdx.h  |  6 ------
 arch/x86/kvm/vmx/tdx.c      | 10 ----------
 arch/x86/virt/vmx/tdx/tdx.c | 39 +++++++++++++++++++------------------
 3 files changed, 20 insertions(+), 35 deletions(-)

diff --git a/arch/x86/include/asm/tdx.h b/arch/x86/include/asm/tdx.h
index 0c1ae4954f17..f0826b0a512a 100644
--- a/arch/x86/include/asm/tdx.h
+++ b/arch/x86/include/asm/tdx.h
@@ -206,11 +206,5 @@ static inline const char *tdx_dump_mce_info(struct mce *m) { return NULL; }
 static inline const struct tdx_sys_info *tdx_get_sysinfo(void) { return NULL; }
 #endif	/* CONFIG_INTEL_TDX_HOST */
 
-#ifdef CONFIG_KEXEC_CORE
-void tdx_cpu_flush_cache_for_kexec(void);
-#else
-static inline void tdx_cpu_flush_cache_for_kexec(void) { }
-#endif
-
 #endif /* !__ASSEMBLER__ */
 #endif /* _ASM_X86_TDX_H */
diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
index b7264b533feb..50a5cfdbd33e 100644
--- a/arch/x86/kvm/vmx/tdx.c
+++ b/arch/x86/kvm/vmx/tdx.c
@@ -440,16 +440,6 @@ void tdx_disable_virtualization_cpu(void)
 		tdx_flush_vp(&arg);
 	}
 	local_irq_restore(flags);
-
-	/*
-	 * Flush cache now if kexec is possible: this is necessary to avoid
-	 * having dirty private memory cachelines when the new kernel boots,
-	 * but WBINVD is a relatively expensive operation and doing it during
-	 * kexec can exacerbate races in native_stop_other_cpus().  Do it
-	 * now, since this is a safe moment and there is going to be no more
-	 * TDX activity on this CPU from this point on.
-	 */
-	tdx_cpu_flush_cache_for_kexec();
 }
 
 #define TDX_SEAMCALL_RETRIES 10000
diff --git a/arch/x86/virt/vmx/tdx/tdx.c b/arch/x86/virt/vmx/tdx/tdx.c
index cb9b3210ab71..0802d0fd18a4 100644
--- a/arch/x86/virt/vmx/tdx/tdx.c
+++ b/arch/x86/virt/vmx/tdx/tdx.c
@@ -224,8 +224,28 @@ static int tdx_offline_cpu(unsigned int cpu)
 	return 0;
 }
 
+static void tdx_cpu_flush_cache(void)
+{
+	lockdep_assert_preemption_disabled();
+
+	if (!this_cpu_read(cache_state_incoherent))
+		return;
+
+	wbinvd();
+	this_cpu_write(cache_state_incoherent, false);
+}
+
 static void tdx_shutdown_cpu(void *ign)
 {
+	/*
+	 * Flush cache now if kexec is possible: this is necessary to avoid
+	 * having dirty private memory cachelines when the new kernel boots,
+	 * but WBINVD is a relatively expensive operation and doing it during
+	 * kexec can exacerbate races in native_stop_other_cpus().  Do it
+	 * now, since this is a safe moment and there is going to be no more
+	 * TDX activity on this CPU from this point on.
+	 */
+	tdx_cpu_flush_cache();
 	x86_virt_put_ref(X86_FEATURE_VMX);
 }
 
@@ -1920,22 +1940,3 @@ u64 tdh_phymem_page_wbinvd_hkid(u64 hkid, struct page *page)
 	return seamcall(TDH_PHYMEM_PAGE_WBINVD, &args);
 }
 EXPORT_SYMBOL_FOR_KVM(tdh_phymem_page_wbinvd_hkid);
-
-#ifdef CONFIG_KEXEC_CORE
-void tdx_cpu_flush_cache_for_kexec(void)
-{
-	lockdep_assert_preemption_disabled();
-
-	if (!this_cpu_read(cache_state_incoherent))
-		return;
-
-	/*
-	 * Private memory cachelines need to be clean at the time of
-	 * kexec.  Write them back now, as the caller promises that
-	 * there should be no more SEAMCALLs on this CPU.
-	 */
-	wbinvd();
-	this_cpu_write(cache_state_incoherent, false);
-}
-EXPORT_SYMBOL_FOR_KVM(tdx_cpu_flush_cache_for_kexec);
-#endif
-- 
2.53.0

