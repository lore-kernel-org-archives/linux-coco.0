Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A0D944AB97
	for <linux-coco@lists.linux.dev>; Wed, 19 Aug 2026 09:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787133288; cv=none; b=BxYAz/TOSVYb0P7dUsgvCcZErUZNaYYDAR8DhnU3TYBz2CxCeiPVsnr1DRM0IT+SK8zT7FF4e1xhACfS1JnKu7Oejs6fGTM4X7J+ugnu3tG5uHhP645/PDldqo+ber8+IKIHb24mpJCYdqykGLmDAMnXwhEm/Dpz8UQHZ5b677A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787133288; c=relaxed/simple;
	bh=H7NeiJ2egnfoOMilwZTkUIIYLGO/1E8OeCkopKoPm3s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BAe0Mm23jqNOlo9XWtUWq6v/I0kss2EZ9eqWUezvBARFfoYJjtMfWmbIY3f0dvvq8gs9olOUcY6mW+2TL5pU1TrD1NOJ0Y5BMDe5aMZmFvVLk1MiexJSCrmHF5NvOeGUyT+/MADcUVQCnlpQHbxEZ9RnrHWVHFPwiByQlAIJUPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LkPebMh+; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LkPebMh+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787133280; x=1818669280;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=H7NeiJ2egnfoOMilwZTkUIIYLGO/1E8OeCkopKoPm3s=;
  b=LkPebMh+WB0sTqn6UlUAB0YXW4G13i5qo0KCv+yC3rt4kpORcqRiCiRF
   5RzIRioFIQVv/1kWhxR6NzU4euj/Y74cKdoBX/PbF3HARh8DGr0xPDsb2
   FZhwNQIl4MAdXBT14p1mDvpuDfETpVue9PstTjZ+B0HiY6ucJvAUrpTOF
   a2utcMv480H1JNhdUfyPAcHqaosnvJX8xmjFxUZxFCYA3LFyVXh4kR4bX
   LDSKf2PYAosPkOS5xPwCX+KxOUASPuPiw6mdQ7iNsMGsMNTm/b0znVNfG
   89PJ5VNGBBef1w3GO1qF0kb4VsMkCZSByfNnCauVSKHAWXlI6Rj/DJFA+
   g==;
X-CSE-ConnectionGUID: 4tXny5U4Slibw+XtB4AeYw==
X-CSE-MsgGUID: PEm6Lm+vTPGqV7ej9FKUDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="87515025"
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; 
   d="scan'208";a="87515025"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2026 02:54:35 -0700
X-CSE-ConnectionGUID: Ogc31NEIR1OzIwBDdQCNGg==
X-CSE-MsgGUID: DEobpRBoTJWyQITWWb8gzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; 
   d="scan'208";a="303708903"
Received: from lxy-clx-4s.sh.intel.com ([10.239.48.33])
  by orviesa001.jf.intel.com with ESMTP; 19 Aug 2026 02:54:33 -0700
From: Xiaoyao Li <xiaoyao.li@intel.com>
To: Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Cc: Kiryl Shutsemau <kas@kernel.org>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Xiaoyao Li <xiaoyao.li@intel.com>,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-coco@lists.linux.dev,
	nik.borisov@suse.com
Subject: [PATCH v4 9/9] KVM: VMX: Consolidate the exit handler for VMX and TDX
Date: Wed, 19 Aug 2026 17:49:03 +0800
Message-ID: <20260819094903.3060020-10-xiaoyao.li@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260819094903.3060020-1-xiaoyao.li@intel.com>
References: <20260819094903.3060020-1-xiaoyao.li@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The exit handlers for VMX and TDX have the similar pattern. Consolidate
them into a single vt_handle_exit() helper.

Signed-off-by: Xiaoyao Li <xiaoyao.li@intel.com>
Changes in v4:
- new patch.
---
 arch/x86/kvm/vmx/main.c | 38 ++++++++++++++++++++++++++++----------
 arch/x86/kvm/vmx/tdx.c  | 18 +-----------------
 arch/x86/kvm/vmx/vmx.c  | 21 +--------------------
 3 files changed, 30 insertions(+), 47 deletions(-)

diff --git a/arch/x86/kvm/vmx/main.c b/arch/x86/kvm/vmx/main.c
index 6a813c49ca8a..10df9667d0c0 100644
--- a/arch/x86/kvm/vmx/main.c
+++ b/arch/x86/kvm/vmx/main.c
@@ -154,15 +154,6 @@ static fastpath_t vt_vcpu_run(struct kvm_vcpu *vcpu, u64 run_flags)
 	return vmx_vcpu_run(vcpu, run_flags);
 }
 
-static int vt_handle_exit(struct kvm_vcpu *vcpu,
-			  enum exit_fastpath_completion fastpath)
-{
-	if (is_td_vcpu(vcpu))
-		return tdx_handle_exit(vcpu, fastpath);
-
-	return vmx_handle_exit(vcpu, fastpath);
-}
-
 static bool vt_unhandleable_emulation_required(struct kvm_vcpu *vcpu)
 {
 	if (is_td_vcpu(vcpu)) {
@@ -887,6 +878,33 @@ int vt_handle_bus_lock_vmexit(struct kvm_vcpu *vcpu)
 	return 1;
 }
 
+static int vt_handle_exit(struct kvm_vcpu *vcpu,
+			  enum exit_fastpath_completion fastpath)
+{
+	int ret;
+
+#ifdef CONFIG_KVM_INTEL_TDX
+	if (is_td_vcpu(vcpu))
+		ret = tdx_handle_exit(vcpu, fastpath);
+	else
+#endif
+		ret = vmx_handle_exit(vcpu, fastpath);
+
+	/*
+	 * Exit to user space when bus lock detected to inform that there is
+	 * a bus lock in guest.
+	 */
+	if (vmx_get_exit_reason(vcpu).bus_lock_detected) {
+		if (ret > 0) {
+			vcpu->run->exit_reason = KVM_EXIT_X86_BUS_LOCK;
+			ret = 0;
+		}
+
+		vcpu->run->flags |= KVM_RUN_X86_BUS_LOCK;
+	}
+	return ret;
+}
+
 #define VMX_REQUIRED_APICV_INHIBITS				\
 	(BIT(APICV_INHIBIT_REASON_DISABLED) |			\
 	 BIT(APICV_INHIBIT_REASON_ABSENT) |			\
@@ -960,7 +978,7 @@ struct kvm_x86_ops vt_x86_ops __initdata = {
 
 	.vcpu_needs_initialization = vt_op_tdx_only(vcpu_needs_initialization),
 	.vcpu_run = vt_op(vcpu_run),
-	.handle_exit = vt_op(handle_exit),
+	.handle_exit = vt_handle_exit,
 	.skip_emulated_instruction = vmx_skip_emulated_instruction,
 	.update_emulated_instruction = vmx_update_emulated_instruction,
 	.unhandleable_emulation_required = vt_op(unhandleable_emulation_required),
diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
index 8db0c67aaadc..364a2322a9f5 100644
--- a/arch/x86/kvm/vmx/tdx.c
+++ b/arch/x86/kvm/vmx/tdx.c
@@ -2058,7 +2058,7 @@ int tdx_complete_emulated_msr(struct kvm_vcpu *vcpu, int err)
 }
 
 
-static int __tdx_handle_exit(struct kvm_vcpu *vcpu, fastpath_t fastpath)
+int tdx_handle_exit(struct kvm_vcpu *vcpu, fastpath_t fastpath)
 {
 	struct vcpu_tdx *tdx = to_tdx(vcpu);
 	u64 vp_enter_ret = tdx->vp_enter_ret;
@@ -2170,22 +2170,6 @@ static int __tdx_handle_exit(struct kvm_vcpu *vcpu, fastpath_t fastpath)
 	return 0;
 }
 
-int tdx_handle_exit(struct kvm_vcpu *vcpu, fastpath_t fastpath)
-{
-	int ret = __tdx_handle_exit(vcpu, fastpath);
-
-	/* Exit to user space when bus lock was detected */
-	if (vmx_get_exit_reason(vcpu).bus_lock_detected) {
-		if (ret > 0) {
-			vcpu->run->exit_reason = KVM_EXIT_X86_BUS_LOCK;
-			ret = 0;
-		}
-
-		vcpu->run->flags |= KVM_RUN_X86_BUS_LOCK;
-	}
-	return ret;
-}
-
 void tdx_get_exit_info(struct kvm_vcpu *vcpu, u32 *reason,
 		u64 *info1, u64 *info2, u32 *intr_info, u32 *error_code)
 {
diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index 58c001b6cbc5..490baae56cf1 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -6681,7 +6681,7 @@ void dump_vmcs(struct kvm_vcpu *vcpu)
  * The guest has exited.  See if we can fix it or if we need userspace
  * assistance.
  */
-static int __vmx_handle_exit(struct kvm_vcpu *vcpu, fastpath_t exit_fastpath)
+int vmx_handle_exit(struct kvm_vcpu *vcpu, fastpath_t exit_fastpath)
 {
 	struct vcpu_vmx *vmx = to_vmx(vcpu);
 	union vmx_exit_reason exit_reason = vmx_get_exit_reason(vcpu);
@@ -6840,25 +6840,6 @@ static int __vmx_handle_exit(struct kvm_vcpu *vcpu, fastpath_t exit_fastpath)
 	return 0;
 }
 
-int vmx_handle_exit(struct kvm_vcpu *vcpu, fastpath_t exit_fastpath)
-{
-	int ret = __vmx_handle_exit(vcpu, exit_fastpath);
-
-	/*
-	 * Exit to user space when bus lock detected to inform that there is
-	 * a bus lock in guest.
-	 */
-	if (vmx_get_exit_reason(vcpu).bus_lock_detected) {
-		if (ret > 0) {
-			vcpu->run->exit_reason = KVM_EXIT_X86_BUS_LOCK;
-			ret = 0;
-		}
-
-		vcpu->run->flags |= KVM_RUN_X86_BUS_LOCK;
-	}
-	return ret;
-}
-
 void vmx_update_cr8_intercept(struct kvm_vcpu *vcpu, int tpr, int irr)
 {
 	int tpr_threshold;
-- 
2.43.0

