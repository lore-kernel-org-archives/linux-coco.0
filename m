Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 146302DA744
	for <linux-coco@lists.linux.dev>; Thu, 16 Oct 2025 22:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760653703; cv=none; b=rRU5bHhMnG/WRMqMU+pNLElnHhldc/ElOuFJ7b5dkZz6J+1jHcsWSvVxltVWQFgUeA9mlQ7hFURgFo414i4bInRBbnAjrwofFYwaH0wYuLO2xv5wIE0bSZWf9Llzizvki3+i3+qwDzkVqRKV5UdygM/STaJYNnkO6bHlfs1HdpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760653703; c=relaxed/simple;
	bh=yw51Q166Lc381x4Xu3XmbBkTFmjBPCZNcIy/n1Tj+/Q=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=PxYbh0X9ND8iiU/M4NrgWeh1vp/YWbjrRfWuj7UjaHl2K/MpdHHFsPS4xkipAgJwvv2uqRFrS/vUhcuAf/bMuuw7QFfnwR2I49ZjtYtjc9XltY7o1Or2KplUdcRb8Ntlk43QBgCRLz8InYhS+MNBiL5jiFERbp5zV0QSTB/AMkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jgwOJ4uC; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jgwOJ4uC"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-32ee62ed6beso1892821a91.2
        for <linux-coco@lists.linux.dev>; Thu, 16 Oct 2025 15:28:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760653701; x=1761258501; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=40vdtZU/KoPpmX9suWkabYPY075MZ6BH4jE7OVELxWw=;
        b=jgwOJ4uC5hUnMjjn4tAr8NOYtoV56s8MoarJczA1tf1vuDIKR9x7miZimGrNQDoKPS
         QoNGrSzhktu6zWy2LZtVzQK7FlpxaTfnEONHcx3rTDdV0v6Gy0MJnaYf6ShncDsOhFZS
         xvu+RVN1IG4ko91W6FQAuU78hw+IjXai9N0wxlSDm9+vjRJt3eeGG4vFdgJV0f5/iDak
         dPxMS98KYpbYFptkENreQ764HO7JXqNxM5EzQP33NH7q8LhhIq/UMA7KjCA8iV8Xlmws
         oLP8/GydncDlljx8N+58Wfn0382HTFleWiso+UqDsT2qfPUxqSo8k5pf1Izb5G99mEaE
         2tnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760653701; x=1761258501;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=40vdtZU/KoPpmX9suWkabYPY075MZ6BH4jE7OVELxWw=;
        b=nsL/2eBr2ma/vHiXa+ucLKq7sOZ/Ru0stybM20zZhDrELUe66uj5S5Z/35kbtbsiUe
         r8uDoeaY/o/EgBggbbDvmrWBA1O5CoMTXHONw/AyZ83Bqa1tyyOjgKQ7CLInGCy5v2m7
         BqjhW3WdJ2PvIu7Q+kY/26SYlSekJYuo5MmP1nHt/qhEwvnFRZEyELKcKNffQCBEF3jQ
         sUBwTBLkcG99N5kQtJrYl8LzI6jfaxI3RaYGGaeVEX8OTKU/71bmBVJxhPIjL7A+Az4w
         hNk5WHkswR9fd4wCjsa9ssR0MeVCFKdO0sEbkoYINvVpHDzvhMTkKeY3h6Jqzb/fCaCI
         hyUw==
X-Forwarded-Encrypted: i=1; AJvYcCVd0H+/UYhHO0N/HR5zMYLbL+XHUCHimH8pCvPGpMBFW1lMGqFEDNh5pwIJab4O//AQLgJTZqAJc7N3@lists.linux.dev
X-Gm-Message-State: AOJu0YyW2wEfXHvAFpdwtOEOkCL9d4aDEGHr+EpNbTk8ITXtCfprMxsr
	LUvD05wEFfs3b+GcjjcNKnLTrzC47ht1WHGfMtS33we0S2MORmcOCwrSjb63ZPLchTnPGeTx8LJ
	OYWC4UQ==
X-Google-Smtp-Source: AGHT+IH6Vt5HCZ4OsiTtySVHgnNCPAx3kKlqIVZQcPIWh1JDleJgFcxQ9QlzXiMEeW/9zOz/TZlBnAw47FY=
X-Received: from pjbos7.prod.google.com ([2002:a17:90b:1cc7:b0:33b:52d6:e13e])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:54cc:b0:33b:dbdc:65f2
 with SMTP id 98e67ed59e1d1-33bdbdc660bmr324878a91.22.1760653701294; Thu, 16
 Oct 2025 15:28:21 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 16 Oct 2025 15:28:13 -0700
In-Reply-To: <20251016222816.141523-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20251016222816.141523-1-seanjc@google.com>
X-Mailer: git-send-email 2.51.0.858.gf9c4a03a3a-goog
Message-ID: <20251016222816.141523-2-seanjc@google.com>
Subject: [PATCH v4 1/4] KVM: TDX: Synchronize user-return MSRs immediately
 after VP.ENTER
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	"Kirill A. Shutemov" <kas@kernel.org>
Cc: kvm@vger.kernel.org, x86@kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Yan Zhao <yan.y.zhao@intel.com>, 
	Xiaoyao Li <xiaoyao.li@intel.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	Hou Wenlong <houwenlong.hwl@antgroup.com>
Content-Type: text/plain; charset="UTF-8"

Immediately synchronize the user-return MSR values after a successful
VP.ENTER to minimize the window where KVM is tracking stale values in the
"curr" field, and so that the tracked value is synchronized before IRQs
are enabled.

This is *very* technically a bug fix, as a forced shutdown/reboot will
invoke kvm_shutdown() without waiting for tasks to be frozen, and so the
on_each_cpu() calls to kvm_disable_virtualization_cpu() will call
kvm_on_user_return() from IRQ context and thus could consume a stale
values->curr if the IRQ hits while KVM is active.  That said, the real
motivation is to minimize the window where "curr" is stale, as the same
forced shutdown/reboot flaw has effectively existed for all of non-TDX
for years, as kvm_set_user_return_msr() runs with IRQs enabled.  Not to
mention that a stale MSR is the least of the kernel's concerns if a reboot
is forced while KVM is active.

Fixes: e0b4f31a3c65 ("KVM: TDX: restore user ret MSRs")
Cc: Yan Zhao <yan.y.zhao@intel.com>
Cc: Xiaoyao Li <xiaoyao.li@intel.com>
Cc: Rick Edgecombe <rick.p.edgecombe@intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/tdx.c | 20 +++++++++++++-------
 arch/x86/kvm/vmx/tdx.h |  2 +-
 2 files changed, 14 insertions(+), 8 deletions(-)

diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
index 326db9b9c567..2f3dfe9804b5 100644
--- a/arch/x86/kvm/vmx/tdx.c
+++ b/arch/x86/kvm/vmx/tdx.c
@@ -780,6 +780,14 @@ void tdx_prepare_switch_to_guest(struct kvm_vcpu *vcpu)
 		vt->msr_host_kernel_gs_base = read_msr(MSR_KERNEL_GS_BASE);
 
 	vt->guest_state_loaded = true;
+
+	/*
+	 * Several of KVM's user-return MSRs are clobbered by the TDX-Module if
+	 * VP.ENTER succeeds, i.e. on TD-Exit.  Mark those MSRs as needing an
+	 * update to synchronize the "current" value in KVM's cache with the
+	 * value in hardware (loaded by the TDX-Module).
+	 */
+	to_tdx(vcpu)->need_user_return_msr_sync = true;
 }
 
 struct tdx_uret_msr {
@@ -807,7 +815,6 @@ static void tdx_user_return_msr_update_cache(void)
 static void tdx_prepare_switch_to_host(struct kvm_vcpu *vcpu)
 {
 	struct vcpu_vt *vt = to_vt(vcpu);
-	struct vcpu_tdx *tdx = to_tdx(vcpu);
 
 	if (!vt->guest_state_loaded)
 		return;
@@ -815,11 +822,6 @@ static void tdx_prepare_switch_to_host(struct kvm_vcpu *vcpu)
 	++vcpu->stat.host_state_reload;
 	wrmsrl(MSR_KERNEL_GS_BASE, vt->msr_host_kernel_gs_base);
 
-	if (tdx->guest_entered) {
-		tdx_user_return_msr_update_cache();
-		tdx->guest_entered = false;
-	}
-
 	vt->guest_state_loaded = false;
 }
 
@@ -1059,7 +1061,11 @@ fastpath_t tdx_vcpu_run(struct kvm_vcpu *vcpu, u64 run_flags)
 		update_debugctlmsr(vcpu->arch.host_debugctl);
 
 	tdx_load_host_xsave_state(vcpu);
-	tdx->guest_entered = true;
+
+	if (tdx->need_user_return_msr_sync) {
+		tdx_user_return_msr_update_cache();
+		tdx->need_user_return_msr_sync = false;
+	}
 
 	vcpu->arch.regs_avail &= TDX_REGS_AVAIL_SET;
 
diff --git a/arch/x86/kvm/vmx/tdx.h b/arch/x86/kvm/vmx/tdx.h
index ca39a9391db1..9434a6371d67 100644
--- a/arch/x86/kvm/vmx/tdx.h
+++ b/arch/x86/kvm/vmx/tdx.h
@@ -67,7 +67,7 @@ struct vcpu_tdx {
 	u64 vp_enter_ret;
 
 	enum vcpu_tdx_state state;
-	bool guest_entered;
+	bool need_user_return_msr_sync;
 
 	u64 map_gpa_next;
 	u64 map_gpa_end;
-- 
2.51.0.858.gf9c4a03a3a-goog

