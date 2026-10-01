Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1DE453978B
	for <linux-coco@lists.linux.dev>; Thu,  1 Oct 2026 19:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790883541; cv=none; b=u8h9ORb0i77AEZabiqPZF8D6GfIeWRHVGoWwe6SldAwzQmTjp4H2S1FvvH71BloqCX73wOfHiwZMQ37s5z2EU6QEWlIacvIRrySKEUZqHcRB6zpleLiC+NipIDtV8lrXx2TE1Y7Kv2ZARRExr7lBb/WC89kI1nxsTy1pipX+yqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790883541; c=relaxed/simple;
	bh=KvNwxbyCNTfqcwvIEbMM/Vd9BRr9IMnSFsJD1t/9KfM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=cH4fT2E8VWVNggdb/XI3M4rPIhxlC8UuFudhIQ25NczWx7uQn5a9m1ZxZ4rRJRJ8BKhOMXJYpOlUNURQCIy7NHKoc45BCA6t5Rew11KPNUfnLmOEnQs1DnX/wBHG6kutYRcJi+3GghmDsXNZw00lCeebLDhL3W1nP12z1+28hoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--wyihan.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZgXk0o5z; arc=none smtp.client-ip=209.85.210.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wyihan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZgXk0o5z"
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-88a46301d92so410940b3a.3
        for <linux-coco@lists.linux.dev>; Thu, 01 Oct 2026 12:38:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790883537; x=1791488337; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CHBql5y8ETtJ8wyQH03C6EhJ/BrwkerEDfeUC6+NPDk=;
        b=ZgXk0o5z3mn6UhOOdXjdvFszjbAoFOx9obRkRZNmiXXXWaADIyBRFWGl40JkrhsL9F
         p8e5VfiMuTkJCTh7gM5E1i+DqZjdJaWp4IYfStV3fQJbU1L7Z2ihsQfEWT+EdapQ6Z/O
         UOTnzkizgiGqEDlOFV+JHbhWq2oV/cTn6IStcUTRm23i111k5+iwrBZUq0dJzg/awazZ
         spHkKoX7Hvy1Dl/ItAkyWYBOJl2plgBCLwZ7wsZI/MNb6K0mwnA3irPTQ/2WSh64yAOX
         Z6pcy2lWK3bzhNEjLj3/aCGp+H2DX+KyWrxxr42wObeNM5l/oj8eju+60HXEt/2XWoP0
         SC+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790883537; x=1791488337;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CHBql5y8ETtJ8wyQH03C6EhJ/BrwkerEDfeUC6+NPDk=;
        b=OD+Bd0qi8dseRc3/Gib0xymKwOA6kxpDlZx7tAYiDwRkqCu7JOBQNQ414Bn679I+Y/
         Z+vialXDd+4IfTHdN0/hQf1HNuGcvkkJ5DwZFQuk9oF2SNlB1F50BkzdkNi/yQleiiWn
         cHixrs8BnZDCT+mgngWcpq9Z8dyMEm+WgO77QFkQZlAduU8G0QJLvS++RdnGlsNDbex4
         xtd60v0eWmb7V2LKFEqYWJQdz9n0Sl+14br2s+QC76Z8QEKdSfDl49Car5prjprjOEfK
         ZTe/MK094Cgsl0AL9iLlPH83kLBsF+WSamLyhElQGxhGEGmpUwpIKTqFkMpiybiOKV8S
         M6EQ==
X-Forwarded-Encrypted: i=1; AKwUvBz2PSOR6/jL2eLedcYMMAAaGit+GDLDQQb9jqiPlhOuTcrt8GgKEjQKyaHKpq6usW8URgZYUlOfQe/6@lists.linux.dev
X-Gm-Message-State: AFuF++mHqWetxMQ7e0wOBD2p0Mtp0s9b3ulAkLxK9ijsKE1cYUy8J/Fb
	3DsZPBrMM0lLSPJRs/DERnzaXrJALsYZpeZ7xaOk8MhuempDBHCGcACfBJxvsYV7Y4KUHi6kArF
	7PSpLKg==
X-Received: from pgfu10.prod.google.com ([2002:a65:670a:0:b0:cc7:e738:5b23])
 (user=wyihan job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:3d1f:b0:3da:f32e:b3bf
 with SMTP id adf61e73a8af0-3e0bcefb957mr383150637.17.1790883537092; Thu, 01
 Oct 2026 12:38:57 -0700 (PDT)
Date: Thu, 01 Oct 2026 19:37:44 +0000
In-Reply-To: <20261001-tdx-selftests-v15-0-7c62a5d8a992@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20261001-tdx-selftests-v15-0-7c62a5d8a992@google.com>
X-Developer-Key: i=wyihan@google.com; a=ed25519; pk=cRi0fKzS5BMxlHyHY2pJv3w/1zcgfYKr6EYGYppdMYc=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790883521; l=3134;
 i=wyihan@google.com; s=20260319; h=from:subject:message-id;
 bh=b+1NLAF26hCfEEdCty3EECayK7690hjQ4YhxNbwDlbg=; b=MS9HJHZVdGDDilcJsyY8v/u6OfJ224odOxzaC3QZymCSH0+DAqznPbZ4ocCN5cuHxIyd7B7dI
 Rr90Joq91L/AeTEjzRVzNv0sH9LrFgilkkrxAx7wvnSqS2wUMJJT4GJ
X-Mailer: b4 0.14.3
Message-ID: <20261001-tdx-selftests-v15-17-7c62a5d8a992@google.com>
Subject: [PATCH v15 17/23] KVM: selftests: Set entry point for TDX guest code
From: Lisa Wang <wyihan@google.com>
To: Andrew Jones <ajones@ventanamicro.com>, Ackerley Tng <ackerleytng@google.com>, 
	Binbin Wu <binbin.wu@linux.intel.com>, Chao Gao <chao.gao@intel.com>, 
	Chenyi Qiang <chenyi.qiang@intel.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Erdem Aktas <erdemaktas@google.com>, Ira Weiny <iweiny@kernel.org>, 
	Isaku Yamahata <isaku.yamahata@intel.com>, Kiryl Shutsemau <kas@kernel.org>, 
	linux-kselftest@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, 
	"Pratik R. Sampat" <pratikrajesh.sampat@amd.com>, Reinette Chatre <reinette.chatre@intel.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Roger Wang <runanwang@google.com>, 
	Ryan Afranji <afranji@google.com>, Sagi Shahar <sagis@google.com>, 
	Sean Christopherson <seanjc@google.com>, Shuah Khan <shuah@kernel.org>, Xiaoyao Li <xiaoyao.li@intel.com>, 
	Oliver Upton <oupton@kernel.org>
Cc: Jeremiah McReynolds <jmcrey@google.com>, kvm@vger.kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, x86@kernel.org, Lisa Wang <wyihan@google.com>
Content-Type: text/plain; charset="utf-8"

From: Sagi Shahar <sagis@google.com>

Since the rip register is inaccessible for TDX VMs, we need a different
way to set the guest entry point for TDX VMs. This is done by writing
the guest code address to a predefined location in the guest memory and
loading it into rip as part of the TDX boot code.

Signed-off-by: Sagi Shahar <sagis@google.com>
Signed-off-by: Lisa Wang <wyihan@google.com>
Reviewed-by: Xiaoyao Li <xiaoyao.li@intel.com>
Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
---
 tools/testing/selftests/kvm/include/x86/tdx/tdx_util.h |  1 +
 tools/testing/selftests/kvm/lib/x86/processor.c        | 10 +++++++---
 tools/testing/selftests/kvm/lib/x86/tdx/tdx_util.c     | 10 ++++++++++
 3 files changed, 18 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/kvm/include/x86/tdx/tdx_util.h b/tools/testing/selftests/kvm/include/x86/tdx/tdx_util.h
index 72497724a2ee..f36cddbd045c 100644
--- a/tools/testing/selftests/kvm/include/x86/tdx/tdx_util.h
+++ b/tools/testing/selftests/kvm/include/x86/tdx/tdx_util.h
@@ -71,5 +71,6 @@ void tdx_vm_setup_boot_code_region(struct kvm_vm *vm);
 void tdx_vm_setup_boot_parameters_region(struct kvm_vm *vm, u32 nr_runnable_vcpus);
 void tdx_vm_load_common_boot_parameters(struct kvm_vm *vm);
 void tdx_vcpu_load_boot_parameters(struct kvm_vm *vm, struct kvm_vcpu *vcpu);
+void tdx_vcpu_set_entry_point(struct kvm_vcpu *vcpu, void *guest_code);
 
 #endif /* SELFTESTS_TDX_TDX_UTIL_H */
diff --git a/tools/testing/selftests/kvm/lib/x86/processor.c b/tools/testing/selftests/kvm/lib/x86/processor.c
index 2d2160d68b9b..b4b76dc505ae 100644
--- a/tools/testing/selftests/kvm/lib/x86/processor.c
+++ b/tools/testing/selftests/kvm/lib/x86/processor.c
@@ -846,9 +846,13 @@ void vcpu_arch_set_entry_point(struct kvm_vcpu *vcpu, void *guest_code)
 {
 	struct kvm_regs regs;
 
-	vcpu_regs_get(vcpu, &regs);
-	regs.rip = (unsigned long) guest_code;
-	vcpu_regs_set(vcpu, &regs);
+	if (is_tdx_vm(vcpu->vm)) {
+		tdx_vcpu_set_entry_point(vcpu, guest_code);
+	} else {
+		vcpu_regs_get(vcpu, &regs);
+		regs.rip = (unsigned long)guest_code;
+		vcpu_regs_set(vcpu, &regs);
+	}
 }
 
 gva_t kvm_allocate_vcpu_stack(struct kvm_vm *vm)
diff --git a/tools/testing/selftests/kvm/lib/x86/tdx/tdx_util.c b/tools/testing/selftests/kvm/lib/x86/tdx/tdx_util.c
index 270a4ee1b7eb..5f10a7c1455d 100644
--- a/tools/testing/selftests/kvm/lib/x86/tdx/tdx_util.c
+++ b/tools/testing/selftests/kvm/lib/x86/tdx/tdx_util.c
@@ -102,6 +102,16 @@ void tdx_vcpu_load_boot_parameters(struct kvm_vm *vm, struct kvm_vcpu *vcpu)
 		    "ESP GVA must be within 32-bit address space for 32-bit boot code");
 }
 
+void tdx_vcpu_set_entry_point(struct kvm_vcpu *vcpu, void *guest_code)
+{
+	struct td_boot_parameters *params =
+		addr_gpa2hva(vcpu->vm, TD_BOOT_PARAMETERS_GPA);
+	struct td_per_vcpu_parameters *vcpu_params =
+		&params->per_vcpu[vcpu->id];
+
+	vcpu_params->guest_code = (u64)guest_code;
+}
+
 static const struct kvm_tdx_capabilities *tdx_read_capabilities(struct kvm_vm *vm)
 {
 	static struct kvm_tdx_capabilities *tdx_cap;

-- 
2.56.0.rc1.315.gc6ed9934b7-goog

