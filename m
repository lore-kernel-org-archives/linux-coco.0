Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCFA32135B9
	for <linux-coco@lists.linux.dev>; Thu, 30 Oct 2025 19:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761851736; cv=none; b=nsjcx9LKT25AFOjIP1InJjVMm0U4BEepQgz52IZPqmZao+ChFIwbQ0tZI1TBsWwwCuZ0hMbfcoq78EjVWyp6QiA/+5k9bI+1Me6rs2pPcaH1vnvDO6sS1F7bVomp8GxLIq1vKt2htVTN28/5zfRG7dSnE0FrKI9JsNOlU9ibmXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761851736; c=relaxed/simple;
	bh=j2T7DW3Qe5yMXkG86FZZbGazbRBbfYmr7MKMMdilO1k=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=aCufCgb50LU5rFJuCXWds3mOX3Ql90pc4dfL+aNniSaquZNxPYWeaTBtDVcHM7P1raK8qfYLTPmRRTLIgSffxA4TkPTnJhtvmHAuNOJ3/9IRAEdXZX3v44fy8t01OdrhTgUBIjMhAUD0WYbuQkqMUWiKGQvJs4O3uHJMFFkqoIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GH4xeV8x; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GH4xeV8x"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-3408686190eso381614a91.3
        for <linux-coco@lists.linux.dev>; Thu, 30 Oct 2025 12:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761851734; x=1762456534; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=Dq1vYL3NSNsi6Qw9Ae5vBXSHkezMLdaWd5VgrpqK1Lg=;
        b=GH4xeV8xegZur7ToVvWNr6sADIhSlXYKvbx24F8nJXo8uFk+uZ1z8MafJyGeD0UFuH
         Mi0R4tgCytfiQvthXGiO1CF5alMY3183tdmuL93v656FUhouPK9cMDw9jsD8TBdoFVvL
         7VU1VK5e1QnOgB229g6RdYPDmQX8nOrVES3xRfeIC4g4zS08jQFD9w7HqN32sz+chDu3
         B9uNbEFYK1R/CaymwEd+hpe/GdYRbFtnDoSFCCO7CRdQiUfLlp3LNjDvFlLyMZrQQawW
         lu0cF6CnbwgZmreUg2kPqAZ41j9mx7zP4UrR1ew2C0OTdZMbweedrBhfwPqQQ7V86ml2
         ueIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761851734; x=1762456534;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dq1vYL3NSNsi6Qw9Ae5vBXSHkezMLdaWd5VgrpqK1Lg=;
        b=H3pYByrtoA2ck9ETV3JgeVtVvlJX9BH5s08tUHJ0aEzhwWYcjs2b/QHQ1QGMV9DWby
         m/+LYleLDuMdlWlFmzOXm2pv82rXgLfVi66U8wLckmJQb0V5RJSMI727XP++G1YA0m+P
         9tc+iXHCCIhHM/2zF7LcPZnpvCZWkiNMXm+ksuuPGJh8o98cRpalfHwN5VlkuQbBm9Ga
         dxf/faFM72huxPjMO9QGGKmbwWhDgmMCNYvT8NXn6GuXyS86/7YVzrtGNekpwxOjGDpa
         GkCdjSobGinvWyeTNDcaqaW1HxgGxsThLV7dXdHoOJ4m+uEo8gtIlRo9O3QKgQDEK5a/
         4yZQ==
X-Forwarded-Encrypted: i=1; AJvYcCUMosjSZ/JalEUbXa+cUVOT5+dYVbP3iMnAdL61BSAlHOR/Mjjxmqkyka7UablC652ueIJd3+3fugLX@lists.linux.dev
X-Gm-Message-State: AOJu0YxowkF9gpfrFPZ1e/SeGY0CaBatzT+oKGNtQi7Hz5obcgJBqCuz
	XqZJ953tqjEugC0NFfudvxoqGpuPcS2R1Qfgvf5O39QTwMftPU54gExMxqsdB00HVGsZrgQHkh5
	MH13g6g==
X-Google-Smtp-Source: AGHT+IFMS6wWJi/5fPuAa9ahYFcHZMTgc+dfquVEQJl3MCn69erLyEpCcqPdCsRbIozxN4rCkrsm4Ku7EUw=
X-Received: from pjbli2.prod.google.com ([2002:a17:90b:48c2:b0:340:5f48:d8ff])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:5628:b0:32e:a54a:be4a
 with SMTP id 98e67ed59e1d1-34082fc6369mr1032761a91.2.1761851734140; Thu, 30
 Oct 2025 12:15:34 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 30 Oct 2025 12:15:25 -0700
In-Reply-To: <20251030191528.3380553-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20251030191528.3380553-1-seanjc@google.com>
X-Mailer: git-send-email 2.51.1.930.gacf6e81ea2-goog
Message-ID: <20251030191528.3380553-2-seanjc@google.com>
Subject: [PATCH v5 1/4] KVM: TDX: Explicitly set user-return MSRs that *may*
 be clobbered by the TDX-Module
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	"Kirill A. Shutemov" <kas@kernel.org>
Cc: kvm@vger.kernel.org, x86@kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Yan Zhao <yan.y.zhao@intel.com>, 
	Xiaoyao Li <xiaoyao.li@intel.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	Hou Wenlong <houwenlong.hwl@antgroup.com>
Content-Type: text/plain; charset="UTF-8"

Set all user-return MSRs to their post-TD-exit value when preparing to run
a TDX vCPU to ensure the value that KVM expects to be loaded after running
the vCPU is indeed the value that's loaded in hardware.  If the TDX-Module
doesn't actually enter the guest, i.e. doesn't do VM-Enter, then it won't
"restore" VMM state, i.e. won't clobber user-return MSRs to their expected
post-run values, in which case simply updating KVM's "cached" value will
effectively corrupt the cache due to hardware still holding the original
value.

In theory, KVM could conditionally update the current user-return value if
and only if tdh_vp_enter() succeeds, but in practice "success" doesn't
guarantee the TDX-Module actually entered the guest, e.g. if the TDX-Module
synthesizes an EPT Violation because it suspects a zero-step attack.

Force-load the expected values instead of trying to decipher whether or
not the TDX-Module restored/clobbered MSRs, as the risk doesn't justify
the benefits.  Effectively avoiding four WRMSRs once per run loop (even if
the vCPU is scheduled out, user-return MSRs only need to be reloaded if
the CPU exits to userspace or runs a non-TDX vCPU) is likely in the noise
when amortized over all entries, given the cost of running a TDX vCPU.
E.g. the cost of the WRMSRs is somewhere between ~300 and ~500 cycles,
whereas the cost of a _single_ roundtrip to/from a TDX guest is thousands
of cycles.

Fixes: e0b4f31a3c65 ("KVM: TDX: restore user ret MSRs")
Cc: stable@vger.kernel.org
Cc: Yan Zhao <yan.y.zhao@intel.com>
Cc: Xiaoyao Li <xiaoyao.li@intel.com>
Cc: Rick Edgecombe <rick.p.edgecombe@intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/include/asm/kvm_host.h |  1 -
 arch/x86/kvm/vmx/tdx.c          | 52 +++++++++++++++------------------
 arch/x86/kvm/vmx/tdx.h          |  1 -
 arch/x86/kvm/x86.c              |  9 ------
 4 files changed, 23 insertions(+), 40 deletions(-)

diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index 48598d017d6f..d158dfd1842e 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -2378,7 +2378,6 @@ int kvm_pv_send_ipi(struct kvm *kvm, unsigned long ipi_bitmap_low,
 int kvm_add_user_return_msr(u32 msr);
 int kvm_find_user_return_msr(u32 msr);
 int kvm_set_user_return_msr(unsigned index, u64 val, u64 mask);
-void kvm_user_return_msr_update_cache(unsigned int index, u64 val);
 u64 kvm_get_user_return_msr(unsigned int slot);
 
 static inline bool kvm_is_supported_user_return_msr(u32 msr)
diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
index 326db9b9c567..cde91a995076 100644
--- a/arch/x86/kvm/vmx/tdx.c
+++ b/arch/x86/kvm/vmx/tdx.c
@@ -763,25 +763,6 @@ static bool tdx_protected_apic_has_interrupt(struct kvm_vcpu *vcpu)
 	return tdx_vcpu_state_details_intr_pending(vcpu_state_details);
 }
 
-/*
- * Compared to vmx_prepare_switch_to_guest(), there is not much to do
- * as SEAMCALL/SEAMRET calls take care of most of save and restore.
- */
-void tdx_prepare_switch_to_guest(struct kvm_vcpu *vcpu)
-{
-	struct vcpu_vt *vt = to_vt(vcpu);
-
-	if (vt->guest_state_loaded)
-		return;
-
-	if (likely(is_64bit_mm(current->mm)))
-		vt->msr_host_kernel_gs_base = current->thread.gsbase;
-	else
-		vt->msr_host_kernel_gs_base = read_msr(MSR_KERNEL_GS_BASE);
-
-	vt->guest_state_loaded = true;
-}
-
 struct tdx_uret_msr {
 	u32 msr;
 	unsigned int slot;
@@ -795,19 +776,38 @@ static struct tdx_uret_msr tdx_uret_msrs[] = {
 	{.msr = MSR_TSC_AUX,},
 };
 
-static void tdx_user_return_msr_update_cache(void)
+void tdx_prepare_switch_to_guest(struct kvm_vcpu *vcpu)
 {
+	struct vcpu_vt *vt = to_vt(vcpu);
 	int i;
 
+	if (vt->guest_state_loaded)
+		return;
+
+	if (likely(is_64bit_mm(current->mm)))
+		vt->msr_host_kernel_gs_base = current->thread.gsbase;
+	else
+		vt->msr_host_kernel_gs_base = read_msr(MSR_KERNEL_GS_BASE);
+
+	vt->guest_state_loaded = true;
+
+	/*
+	 * Explicitly set user-return MSRs that are clobbered by the TDX-Module
+	 * if VP.ENTER succeeds, i.e. on TD-Exit, with the values that would be
+	 * written by the TDX-Module.  Don't rely on the TDX-Module to actually
+	 * clobber the MSRs, as the contract is poorly defined and not upheld.
+	 * E.g. the TDX-Module will synthesize an EPT Violation without doing
+	 * VM-Enter if it suspects a zero-step attack, and never "restore" VMM
+	 * state.
+	 */
 	for (i = 0; i < ARRAY_SIZE(tdx_uret_msrs); i++)
-		kvm_user_return_msr_update_cache(tdx_uret_msrs[i].slot,
-						 tdx_uret_msrs[i].defval);
+		kvm_set_user_return_msr(tdx_uret_msrs[i].slot,
+					tdx_uret_msrs[i].defval, -1ull);
 }
 
 static void tdx_prepare_switch_to_host(struct kvm_vcpu *vcpu)
 {
 	struct vcpu_vt *vt = to_vt(vcpu);
-	struct vcpu_tdx *tdx = to_tdx(vcpu);
 
 	if (!vt->guest_state_loaded)
 		return;
@@ -815,11 +815,6 @@ static void tdx_prepare_switch_to_host(struct kvm_vcpu *vcpu)
 	++vcpu->stat.host_state_reload;
 	wrmsrl(MSR_KERNEL_GS_BASE, vt->msr_host_kernel_gs_base);
 
-	if (tdx->guest_entered) {
-		tdx_user_return_msr_update_cache();
-		tdx->guest_entered = false;
-	}
-
 	vt->guest_state_loaded = false;
 }
 
@@ -1059,7 +1054,6 @@ fastpath_t tdx_vcpu_run(struct kvm_vcpu *vcpu, u64 run_flags)
 		update_debugctlmsr(vcpu->arch.host_debugctl);
 
 	tdx_load_host_xsave_state(vcpu);
-	tdx->guest_entered = true;
 
 	vcpu->arch.regs_avail &= TDX_REGS_AVAIL_SET;
 
diff --git a/arch/x86/kvm/vmx/tdx.h b/arch/x86/kvm/vmx/tdx.h
index ca39a9391db1..7f258870dc41 100644
--- a/arch/x86/kvm/vmx/tdx.h
+++ b/arch/x86/kvm/vmx/tdx.h
@@ -67,7 +67,6 @@ struct vcpu_tdx {
 	u64 vp_enter_ret;
 
 	enum vcpu_tdx_state state;
-	bool guest_entered;
 
 	u64 map_gpa_next;
 	u64 map_gpa_end;
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index b4b5d2d09634..639589af7cbe 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -681,15 +681,6 @@ int kvm_set_user_return_msr(unsigned slot, u64 value, u64 mask)
 }
 EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_set_user_return_msr);
 
-void kvm_user_return_msr_update_cache(unsigned int slot, u64 value)
-{
-	struct kvm_user_return_msrs *msrs = this_cpu_ptr(user_return_msrs);
-
-	msrs->values[slot].curr = value;
-	kvm_user_return_register_notifier(msrs);
-}
-EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_user_return_msr_update_cache);
-
 u64 kvm_get_user_return_msr(unsigned int slot)
 {
 	return this_cpu_ptr(user_return_msrs)->values[slot].curr;
-- 
2.51.1.930.gacf6e81ea2-goog

