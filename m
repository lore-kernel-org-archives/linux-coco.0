Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8C3125FA0E
	for <linux-coco@lists.linux.dev>; Sat,  6 Dec 2025 01:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764983478; cv=none; b=c4wJo/x9d8yhlUkrOvrih8LG4zqYUh8vs42PM8GjE/p/8WPXLVKxxYuFaKopUhZYOUT+xH3HKHYp63w8s5pmNVi9RXfSfcNbjQnhAIcHyGkrt+HgSwvMICy5KI8WxHLit4ITZRF/Noi9qs5rKU9yiTYxue4ITjfdArivvCvsZ5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764983478; c=relaxed/simple;
	bh=KQpJgpfMzgTc3IeJzO8g2QU2GWsQrVFHCetE2jQYut8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=XQCIA2fdTmzvVoP0ivaiH8uw5CDVH93usEokyDfH9z6p7NRenIe1mVHvVLS9gzvsSuEGqsBM9rkokntnireuiO8RLto5nCoh9JOWVSnjHkR7ih7EJxujqFE4rsfzr2K4dtjHQfoy3PIE+AwrBTUnQJrAnAhqlDr+QZpOIXrunhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=geO8tMsC; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="geO8tMsC"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-7ba92341f38so2753774b3a.0
        for <linux-coco@lists.linux.dev>; Fri, 05 Dec 2025 17:11:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764983476; x=1765588276; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=JojZY3uhd5k3hZOQJMhjmwW30PBC8/7wDoPAbDrCEls=;
        b=geO8tMsCsFanpRpQxYDfxLF7SmVi13q6ZF/uS8RsgrOEnmMsPEKgmxieFu165UO/me
         dfgYxVrwwNn7U87bBWDQr0RlGgu+i5zf0YkEQbjlwpx3yTiMy73p++Efz9b64QrBJjfc
         mK2BabSHVBGHXU9bKIDzmc7bKomuvw+fKR5JHcBuiH3QrbR1ZLdp79rDnrrUd3RcYQc2
         YN0Noe8b45/Gzoz2HXzzrZXW6VTJRy7h3QVZbTsSBWaEMT7kYC57KpsTCaHs9JaY6z72
         6BGM8UxWez+KM/ZWi9vc/DY3ewKKSVT5IyWAnVoa4pne9eVcTqgfzKzdZxKo3h5U+sf9
         OV1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764983476; x=1765588276;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JojZY3uhd5k3hZOQJMhjmwW30PBC8/7wDoPAbDrCEls=;
        b=LxWA/2ZfKUK6IgkuuQVuP8MFXzlgmttCAQ0Sa5UlCNLHTsOyVencq9v9fOi509kv/Y
         MZS+yj8PHNFNQUuwltpo1lWBzddtrBNdJpULONd7A0vJsewU/VPiq1QDCYaIxu4cTQqy
         taawOyz8EFQwbmgFpEKvOe5hGeF+V+WDd2Lkjk5TefyytpktizTAJXIDzHAP6g5iQZMv
         5C+MPdCxHrD8mOYoiqlBvzpNSftvx1PrrYXx+YyZeGQAnSJxqIphv30bcSadt9kc1y9Y
         4e19RWzrpdD+35OW323cbuPhthf9tzov2ZnEmmJIGeOkWIJf+wYIxzdMhMTufMze6JnJ
         1+iQ==
X-Forwarded-Encrypted: i=1; AJvYcCVySN215bizBI+nAZABhFZo/JkKVFR6owInhbfnHpjISlmF3rLCMD4DSQnmAJpCiHWMdcZ38YX48tad@lists.linux.dev
X-Gm-Message-State: AOJu0Yx2hVA1GOvEoaGpg2e4amq+lsJT/mFc5aaVeqK8O+j8nNO8s2hk
	YURuRgUzhCcYQ+CINHZJfwt3nmFL3iuVFi9yIE7D90IOxbzHwobj+gKT7laawwEkt2ARmacpn4f
	QPqcPqQ==
X-Google-Smtp-Source: AGHT+IEiragae11BDcwJ25pWhkPQUadOVyTO8WpDoz2naWj0OyOQpfwATE9mA9Trjd4vlWLzMj3ulCcvo0M=
X-Received: from pfmm5.prod.google.com ([2002:a05:6a00:2485:b0:7cf:2dad:ff87])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:94f1:b0:7e8:43f5:bd54
 with SMTP id d2e1a72fcca58-7e8c5048a31mr914583b3a.64.1764983476061; Fri, 05
 Dec 2025 17:11:16 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri,  5 Dec 2025 17:10:52 -0800
In-Reply-To: <20251206011054.494190-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20251206011054.494190-1-seanjc@google.com>
X-Mailer: git-send-email 2.52.0.223.gf5cc29aaa4-goog
Message-ID: <20251206011054.494190-6-seanjc@google.com>
Subject: [PATCH v2 5/7] x86/virt/tdx: KVM: Consolidate TDX CPU hotplug handling
From: Sean Christopherson <seanjc@google.com>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Kiryl Shutsemau <kas@kernel.org>, Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev, 
	kvm@vger.kernel.org, Chao Gao <chao.gao@intel.com>, 
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

Signed-off-by: Chao Gao <chao.gao@intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/tdx.c      | 67 +------------------------------------
 arch/x86/virt/vmx/tdx/tdx.c | 49 +++++++++++++++++++++++++--
 2 files changed, 47 insertions(+), 69 deletions(-)

diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
index d0161dc3d184..d9dd6070baa0 100644
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
@@ -3302,51 +3295,10 @@ int tdx_gmem_max_mapping_level(struct kvm *kvm, kvm_pfn_t pfn, bool is_private)
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
@@ -3414,23 +3366,7 @@ static int __init __tdx_bringup(void)
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
@@ -3486,7 +3422,6 @@ void tdx_cleanup(void)
 		return;
 
 	misc_cg_set_capacity(MISC_CG_RES_TDX, 0);
-	cpuhp_remove_state(tdx_cpuhp_state);
 }
 
 void __init tdx_hardware_setup(void)
diff --git a/arch/x86/virt/vmx/tdx/tdx.c b/arch/x86/virt/vmx/tdx/tdx.c
index d49645797fe4..5cf008bffa94 100644
--- a/arch/x86/virt/vmx/tdx/tdx.c
+++ b/arch/x86/virt/vmx/tdx/tdx.c
@@ -58,6 +58,8 @@ static LIST_HEAD(tdx_memlist);
 static struct tdx_sys_info tdx_sysinfo __ro_after_init;
 static bool tdx_module_initialized __ro_after_init;
 
+static atomic_t nr_configured_hkid;
+
 typedef void (*sc_err_func_t)(u64 fn, u64 err, struct tdx_module_args *args);
 
 static inline void seamcall_err(u64 fn, u64 err, struct tdx_module_args *args)
@@ -190,6 +192,40 @@ static int tdx_online_cpu(unsigned int cpu)
 
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
 	x86_virt_put_cpu(X86_FEATURE_VMX);
 	return 0;
 }
@@ -1506,15 +1542,22 @@ EXPORT_SYMBOL_GPL(tdx_get_nr_guest_keyids);
 
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
 EXPORT_SYMBOL_GPL(tdx_guest_keyid_alloc);
 
 void tdx_guest_keyid_free(unsigned int keyid)
 {
 	ida_free(&tdx_guest_keyid_pool, keyid);
+	atomic_dec(&nr_configured_hkid);
 }
 EXPORT_SYMBOL_GPL(tdx_guest_keyid_free);
 
-- 
2.52.0.223.gf5cc29aaa4-goog

