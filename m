Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAC1D2D7397
	for <linux-coco@lists.linux.dev>; Sat, 14 Feb 2026 01:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771032452; cv=none; b=IlkAFSSFNrmx/OYDQE/hH1unIZtlJaQ/gljRi79FUUSCYncTmk3x16k67UsudeOSe6xTDksGOH1EUWBDZmDqKwoyMTooDL68DGfQHp0NfpMfJQsccCo0SkU2LQoruipX//X0nJuLOQ9rbp6PQo18iWqk+Yt8wx4S+vvVL37zxK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771032452; c=relaxed/simple;
	bh=E6Q5/+hh3nilZrpijZlxvvvkiid5ytZMA5bWglZIuIs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=cQbzhWE+T/FLpv407BSvTJczpiiArTCrgF5mN19S6r94KISsy9F9+3DR7iwkRB8Y+NdvbcyGhzMSL7UugNvsU0LU6Xbqwdiml9V0tzP4y83FaPz6GvKycygT+09B/7KF5UiSPSzqLozii7qFOLu2BCfA9DnvD4RRqJ+WcvyJ+UQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=EmD06Csy; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EmD06Csy"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-2aae146bab0so19379315ad.0
        for <linux-coco@lists.linux.dev>; Fri, 13 Feb 2026 17:27:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771032449; x=1771637249; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=f9/W8zXMCwCxOnxdB4EBaLa8j2TODn+O9pqKnu48UGU=;
        b=EmD06CsycoKUvXaODxSuTsyfB9wHJkC2CfRbUClem8JdKQLtaV9qa+oB8nbGj2YM3u
         t+3XE9FZMEzacRITO4Okwx/Xe4F1zXRphgfP0m65p3+cjkdAnH5SGEJArShMydCU9jxL
         Iv4Ztutd7oyOMVW7Jh2np44vyQQq+V77PRMBBMiwmAMJ+7nEKm4SQjj5VHFxLrMd+vCX
         QGeKU1kYmxZjcI5K1HuZySnh9gTtW9hNU+Jr9xUPxTxrOQGS/PinCCeKHINTfHLx3XHL
         VfFUA/bF3F01nkZ1jo9cyvrGtUoGVC7wmFuMkvrWxkN9/xGY1nR6L1Qfu7ciCFBcJ4II
         Bx+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771032449; x=1771637249;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f9/W8zXMCwCxOnxdB4EBaLa8j2TODn+O9pqKnu48UGU=;
        b=HqI6258FkgfR9p+PdFPor6KGfoZOnLnrPwy1ltlSnU1cZZLOd1Sut3/VP8S4LORpuG
         6SAw5T3Y/fZLnvgfLMQzp6pj4urOXNo1T0FNcyhAdyRl2/8tEFIZOiOzupO6FRbHqNG4
         s7v0uESsq2kGtbYmZTH+/G1gfKcUfm4XXHJbZUwaectvj+DuyNowxqAN5a5H+FbxfJSV
         2I5emboxEmRuEmriL8RzcbSIanapZ16u1YCYjo/Fm4RN+kY3e935nH5xSI7DniMt8T7w
         e44G560GktqjtEO9PMNLEPDX5X0x1QAjGMPbcl1jkKMfAiy5Wr+NTV4JeVx9Ko/hG/7a
         r3yQ==
X-Forwarded-Encrypted: i=1; AJvYcCUpjNTImmy0Hup5+FvzNRtCQ4zEJl493382BMS3MpTYL69KI2IuTN0jhdF8VW3awVumvN9E9my8qMMT@lists.linux.dev
X-Gm-Message-State: AOJu0YxSDv0gpz9tjlijlFuXS576gP+TC8KCOpCcaRxpqG/pLh+F/XCE
	x6QR18sndvjCUfY+/LDvvCcpANElU+wRg8QnX8hXBYC/GMaG2AMWccLv/mPuPTeN+upOkjn3KYQ
	Nzzm87w==
X-Received: from plmk2.prod.google.com ([2002:a17:903:1802:b0:2a4:2817:d023])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:cccd:b0:2a7:80bf:3131
 with SMTP id d9443c01a7336-2ab5062d628mr31972075ad.58.1771032449020; Fri, 13
 Feb 2026 17:27:29 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 13 Feb 2026 17:26:59 -0800
In-Reply-To: <20260214012702.2368778-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260214012702.2368778-1-seanjc@google.com>
X-Mailer: git-send-email 2.53.0.310.g728cabbaf7-goog
Message-ID: <20260214012702.2368778-14-seanjc@google.com>
Subject: [PATCH v3 13/16] x86/virt/tdx: KVM: Consolidate TDX CPU hotplug handling
From: Sean Christopherson <seanjc@google.com>
To: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Kiryl Shutsemau <kas@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev, 
	kvm@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	Chao Gao <chao.gao@intel.com>, Xu Yilun <yilun.xu@linux.intel.com>, 
	Dan Williams <dan.j.williams@intel.com>
Content-Type: text/plain; charset="UTF-8"

From: Chao Gao <chao.gao@intel.com>

The core kernel registers a CPU hotplug callback to do VMX and TDX init
and deinit while KVM registers a separate CPU offline callback to block
offlining the last online CPU in a socket.

Splitting TDX-related CPU hotplug handling across two components is odd
and adds unnecessary complexity.

Consolidate TDX-related CPU hotplug handling by integrating KVM's
tdx_offline_cpu() to the one in the core kernel.

Also move nr_configured_hkid to the core kernel because tdx_offline_cpu()
references it. Since HKID allocation and free are handled in the core
kernel, it's more natural to track used HKIDs there.

Reviewed-by: Dan Williams <dan.j.williams@intel.com>
Signed-off-by: Chao Gao <chao.gao@intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/tdx.c      | 67 +------------------------------------
 arch/x86/virt/vmx/tdx/tdx.c | 49 +++++++++++++++++++++++++--
 2 files changed, 47 insertions(+), 69 deletions(-)

diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
index 0ac01c119336..fea3dfc7ac8b 100644
--- a/arch/x86/kvm/vmx/tdx.c
+++ b/arch/x86/kvm/vmx/tdx.c
@@ -59,8 +59,6 @@ module_param_named(tdx, enable_tdx, bool, 0444);
 #define TDX_SHARED_BIT_PWL_5 gpa_to_gfn(BIT_ULL(51))
 #define TDX_SHARED_BIT_PWL_4 gpa_to_gfn(BIT_ULL(47))
 
-static enum cpuhp_state tdx_cpuhp_state __ro_after_init;
-
 static const struct tdx_sys_info *tdx_sysinfo;
 
 void tdh_vp_rd_failed(struct vcpu_tdx *tdx, char *uclass, u32 field, u64 err)
@@ -219,8 +217,6 @@ static int init_kvm_tdx_caps(const struct tdx_sys_info_td_conf *td_conf,
  */
 static DEFINE_MUTEX(tdx_lock);
 
-static atomic_t nr_configured_hkid;
-
 static bool tdx_operand_busy(u64 err)
 {
 	return (err & TDX_SEAMCALL_STATUS_MASK) == TDX_OPERAND_BUSY;
@@ -268,7 +264,6 @@ static inline void tdx_hkid_free(struct kvm_tdx *kvm_tdx)
 {
 	tdx_guest_keyid_free(kvm_tdx->hkid);
 	kvm_tdx->hkid = -1;
-	atomic_dec(&nr_configured_hkid);
 	misc_cg_uncharge(MISC_CG_RES_TDX, kvm_tdx->misc_cg, 1);
 	put_misc_cg(kvm_tdx->misc_cg);
 	kvm_tdx->misc_cg = NULL;
@@ -2399,8 +2394,6 @@ static int __tdx_td_init(struct kvm *kvm, struct td_params *td_params,
 
 	ret = -ENOMEM;
 
-	atomic_inc(&nr_configured_hkid);
-
 	tdr_page = alloc_page(GFP_KERNEL);
 	if (!tdr_page)
 		goto free_hkid;
@@ -3292,51 +3285,10 @@ int tdx_gmem_max_mapping_level(struct kvm *kvm, kvm_pfn_t pfn, bool is_private)
 	return PG_LEVEL_4K;
 }
 
-static int tdx_online_cpu(unsigned int cpu)
-{
-	return 0;
-}
-
-static int tdx_offline_cpu(unsigned int cpu)
-{
-	int i;
-
-	/* No TD is running.  Allow any cpu to be offline. */
-	if (!atomic_read(&nr_configured_hkid))
-		return 0;
-
-	/*
-	 * In order to reclaim TDX HKID, (i.e. when deleting guest TD), need to
-	 * call TDH.PHYMEM.PAGE.WBINVD on all packages to program all memory
-	 * controller with pconfig.  If we have active TDX HKID, refuse to
-	 * offline the last online cpu.
-	 */
-	for_each_online_cpu(i) {
-		/*
-		 * Found another online cpu on the same package.
-		 * Allow to offline.
-		 */
-		if (i != cpu && topology_physical_package_id(i) ==
-				topology_physical_package_id(cpu))
-			return 0;
-	}
-
-	/*
-	 * This is the last cpu of this package.  Don't offline it.
-	 *
-	 * Because it's hard for human operator to understand the
-	 * reason, warn it.
-	 */
-#define MSG_ALLPKG_ONLINE \
-	"TDX requires all packages to have an online CPU. Delete all TDs in order to offline all CPUs of a package.\n"
-	pr_warn_ratelimited(MSG_ALLPKG_ONLINE);
-	return -EBUSY;
-}
-
 static int __init __tdx_bringup(void)
 {
 	const struct tdx_sys_info_td_conf *td_conf;
-	int r, i;
+	int i;
 
 	for (i = 0; i < ARRAY_SIZE(tdx_uret_msrs); i++) {
 		/*
@@ -3404,23 +3356,7 @@ static int __init __tdx_bringup(void)
 	if (misc_cg_set_capacity(MISC_CG_RES_TDX, tdx_get_nr_guest_keyids()))
 		return -EINVAL;
 
-	/*
-	 * TDX-specific cpuhp callback to disallow offlining the last CPU in a
-	 * packing while KVM is running one or more TDs.  Reclaiming HKIDs
-	 * requires doing PAGE.WBINVD on every package, i.e. offlining all CPUs
-	 * of a package would prevent reclaiming the HKID.
-	 */
-	r = cpuhp_setup_state(CPUHP_AP_ONLINE_DYN, "kvm/cpu/tdx:online",
-			      tdx_online_cpu, tdx_offline_cpu);
-	if (r < 0)
-		goto err_cpuhup;
-
-	tdx_cpuhp_state = r;
 	return 0;
-
-err_cpuhup:
-	misc_cg_set_capacity(MISC_CG_RES_TDX, 0);
-	return r;
 }
 
 int __init tdx_bringup(void)
@@ -3488,7 +3424,6 @@ void tdx_cleanup(void)
 		return;
 
 	misc_cg_set_capacity(MISC_CG_RES_TDX, 0);
-	cpuhp_remove_state(tdx_cpuhp_state);
 }
 
 void __init tdx_hardware_setup(void)
diff --git a/arch/x86/virt/vmx/tdx/tdx.c b/arch/x86/virt/vmx/tdx/tdx.c
index 05d634caa4e8..ddbab87d2467 100644
--- a/arch/x86/virt/vmx/tdx/tdx.c
+++ b/arch/x86/virt/vmx/tdx/tdx.c
@@ -59,6 +59,8 @@ static LIST_HEAD(tdx_memlist);
 static struct tdx_sys_info tdx_sysinfo __ro_after_init;
 static bool tdx_module_initialized __ro_after_init;
 
+static atomic_t nr_configured_hkid;
+
 typedef void (*sc_err_func_t)(u64 fn, u64 err, struct tdx_module_args *args);
 
 static inline void seamcall_err(u64 fn, u64 err, struct tdx_module_args *args)
@@ -189,6 +191,40 @@ static int tdx_online_cpu(unsigned int cpu)
 
 static int tdx_offline_cpu(unsigned int cpu)
 {
+	int i;
+
+	/* No TD is running.  Allow any cpu to be offline. */
+	if (!atomic_read(&nr_configured_hkid))
+		goto done;
+
+	/*
+	 * In order to reclaim TDX HKID, (i.e. when deleting guest TD), need to
+	 * call TDH.PHYMEM.PAGE.WBINVD on all packages to program all memory
+	 * controller with pconfig.  If we have active TDX HKID, refuse to
+	 * offline the last online cpu.
+	 */
+	for_each_online_cpu(i) {
+		/*
+		 * Found another online cpu on the same package.
+		 * Allow to offline.
+		 */
+		if (i != cpu && topology_physical_package_id(i) ==
+				topology_physical_package_id(cpu))
+			goto done;
+	}
+
+	/*
+	 * This is the last cpu of this package.  Don't offline it.
+	 *
+	 * Because it's hard for human operator to understand the
+	 * reason, warn it.
+	 */
+#define MSG_ALLPKG_ONLINE \
+	"TDX requires all packages to have an online CPU. Delete all TDs in order to offline all CPUs of a package.\n"
+	pr_warn_ratelimited(MSG_ALLPKG_ONLINE);
+	return -EBUSY;
+
+done:
 	x86_virt_put_ref(X86_FEATURE_VMX);
 	return 0;
 }
@@ -1509,15 +1545,22 @@ EXPORT_SYMBOL_FOR_KVM(tdx_get_nr_guest_keyids);
 
 int tdx_guest_keyid_alloc(void)
 {
-	return ida_alloc_range(&tdx_guest_keyid_pool, tdx_guest_keyid_start,
-			       tdx_guest_keyid_start + tdx_nr_guest_keyids - 1,
-			       GFP_KERNEL);
+	int ret;
+
+	ret = ida_alloc_range(&tdx_guest_keyid_pool, tdx_guest_keyid_start,
+			      tdx_guest_keyid_start + tdx_nr_guest_keyids - 1,
+			      GFP_KERNEL);
+	if (ret >= 0)
+		atomic_inc(&nr_configured_hkid);
+
+	return ret;
 }
 EXPORT_SYMBOL_FOR_KVM(tdx_guest_keyid_alloc);
 
 void tdx_guest_keyid_free(unsigned int keyid)
 {
 	ida_free(&tdx_guest_keyid_pool, keyid);
+	atomic_dec(&nr_configured_hkid);
 }
 EXPORT_SYMBOL_FOR_KVM(tdx_guest_keyid_free);
 
-- 
2.53.0.310.g728cabbaf7-goog

