Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9492C30E0E4
	for <linux-coco@lists.linux.dev>; Tue, 18 Nov 2025 22:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763504615; cv=none; b=YLobV2Ah14bpkvZz7k8Hh3P/TnkAh40Nc+ty1QVEtqUcyD+VZF+2wGyRMw5XpHJ4cCylyBTatt2qujMu+N2TJ78mY0otXvnlSqZieQ5Ivnw9GQITxQBYBiy2yG7noQCm6xYhFSPynwxFV43S8YWXXrH8Haf0roUBo0RExFeA8Ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763504615; c=relaxed/simple;
	bh=gkOFf1GrseR4lyx+m5A0i8MM9/uAsLY1WwIpa5M2Cos=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=BVFdB3e8JMbKgZMo05TKWkboEZ5ENJAfYQPntxGyMhMCfXW+sDvH5IVsbBF8ZG8/iz68/SwQNA+lBNtGpokfdV1HLcVepY99yd0pdfdk3Dai88XOFZOQMaWfAGccshyMphufEnl2MOcDkZC0tpFVyqHlWE9ifrQTP3CIMXnrCiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Y3tGMeYn; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Y3tGMeYn"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-299d221b749so7881145ad.3
        for <linux-coco@lists.linux.dev>; Tue, 18 Nov 2025 14:23:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763504613; x=1764109413; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=EoozWi2o0AP/cWaOLQLnk9g/zPkjhcGQ8ZSDyR31DRY=;
        b=Y3tGMeYnA6lM8p/J5ocENAqfKX3RFPDOt3HtssKPAcHIMh6nooL9mvjDxrb86Az2Zi
         HRyuzIk5MIxtL1JqLyjPf774qL9eWa3/AF7AW28egj+IUuNC6XsCfj4Bk/DcjenQVtGx
         Yel6ErfSxggBCmzWTCss1UOTHFJsIyqGVbTUGbi9i4yzWEB0EqWSVVL8EazrR6/Y4buf
         P8KKwvPyeN7WGKCZhqT8Faey19xfgp8/3b6he32k4+wBINJUnHJeUqyN/dnlqCjrXGTx
         QxIB+PWJWynIgs0VxPtkwAAHylM7lKmufYru6DL7XZ7tHH+AQ8IWe/k2Rdwu7E0TATPz
         uWSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763504613; x=1764109413;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EoozWi2o0AP/cWaOLQLnk9g/zPkjhcGQ8ZSDyR31DRY=;
        b=rkKJNYplhDW2ONLp9uo3r31+H+borHdWi91tkRW10Si1wqQGtwUCb+6wFurhfB6yCl
         F6QdAHsDTfZFzHGBNiwpyYzXnO5FaeSColCGbtJIpuewrotvEHczHLVY9Ak+XgXzFZEH
         3k/mAKyOD9Utd1ksCcVXQgeUHMlX6Dho8PhAxU9vT43SX7+qAZT1epQXR0ajLehOU12J
         w2di46K4eFxHyLi7Jmvk8sQv4vGIr9FJa25epKavN3m7h1wfARVwgHavVWrbOq/I5HKd
         LaUFAjkSUwWjeE25vR0V0JKN91IjOBJzU1pnmGp8vJO7bb2qiHH26La5hApfCSMYJ2UO
         Dt5w==
X-Forwarded-Encrypted: i=1; AJvYcCVf7LLjRyZAenIQMZM0r+FvaeG2xZtOkMCnXzNdbVFsXBN4W6yaRHbvTI0BLe357q7W60IlRX8w2FlC@lists.linux.dev
X-Gm-Message-State: AOJu0YyuQMV5OG5mNtB/b2BPFEu3D7ziV0+DgJ7knE1lZkwpbQee3hIT
	N6EqMuZ0M4VM6wOwLY/gHDUWLS1LS5uaE0QRcM07JCzowkGwJ+ousI6wBm4MEYac+M60lnR8PJK
	J3LsjZw==
X-Google-Smtp-Source: AGHT+IGBpr2o1tN68nNDCesi9FJp0PssJ7eoZdkj6lok22m/Q8r6RJE+NAbbob2Q0BzsFgmO0oAokh9ajl8=
X-Received: from plbjc5.prod.google.com ([2002:a17:903:25c5:b0:295:68e0:66ed])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:11c6:b0:297:e1f5:191b
 with SMTP id d9443c01a7336-2986a6abf3cmr224167275ad.11.1763504612758; Tue, 18
 Nov 2025 14:23:32 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Tue, 18 Nov 2025 14:23:25 -0800
In-Reply-To: <20251118222328.2265758-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20251118222328.2265758-1-seanjc@google.com>
X-Mailer: git-send-email 2.52.0.rc1.455.g30608eb744-goog
Message-ID: <20251118222328.2265758-2-seanjc@google.com>
Subject: [PATCH v2 1/4] KVM: SVM: Handle #MCs in guest outside of fastpath
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	"Kirill A. Shutemov" <kas@kernel.org>
Cc: kvm@vger.kernel.org, x86@kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	Jon Kohler <jon@nutanix.com>, Tony Lindgren <tony.lindgren@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"

Handle Machine Checks (#MC) that happen in the guest (by forwarding them
to the host) outside of KVM's fastpath so that as much host state as
possible is re-loaded before invoking the kernel's #MC handler.  The only
requirement is that KVM invokes the #MC handler before enabling IRQs (and
even that could _probably_ be relaxed to handling #MCs before enabling
preemption).

Waiting to handle #MCs until "more" host state is loaded hardens KVM
against flaws in the #MC handler, which has historically been quite
brittle. E.g. prior to commit 5567d11c21a1 ("x86/mce: Send #MC singal from
task work"), the #MC code could trigger a schedule() with IRQs and
preemption disabled.  That led to a KVM hack-a-fix in commit 1811d979c716
("x86/kvm: move kvm_load/put_guest_xcr0 into atomic context").

Note, except for #MCs on VM-Enter, VMX already handles #MCs outside of the
fastpath.

Reviewed-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
Reviewed-by: Jon Kohler <jon@nutanix.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/svm/svm.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
index 9aac0eb3a490..bf34378ebe2d 100644
--- a/arch/x86/kvm/svm/svm.c
+++ b/arch/x86/kvm/svm/svm.c
@@ -4321,14 +4321,6 @@ static __no_kcsan fastpath_t svm_vcpu_run(struct kvm_vcpu *vcpu, u64 run_flags)
 
 	vcpu->arch.regs_avail &= ~SVM_REGS_LAZY_LOAD_SET;
 
-	/*
-	 * We need to handle MC intercepts here before the vcpu has a chance to
-	 * change the physical cpu
-	 */
-	if (unlikely(svm->vmcb->control.exit_code ==
-		     SVM_EXIT_EXCP_BASE + MC_VECTOR))
-		svm_handle_mce(vcpu);
-
 	trace_kvm_exit(vcpu, KVM_ISA_SVM);
 
 	svm_complete_interrupts(vcpu);
@@ -4631,8 +4623,16 @@ static int svm_check_intercept(struct kvm_vcpu *vcpu,
 
 static void svm_handle_exit_irqoff(struct kvm_vcpu *vcpu)
 {
-	if (to_svm(vcpu)->vmcb->control.exit_code == SVM_EXIT_INTR)
+	switch (to_svm(vcpu)->vmcb->control.exit_code) {
+	case SVM_EXIT_EXCP_BASE + MC_VECTOR:
+		svm_handle_mce(vcpu);
+		break;
+	case SVM_EXIT_INTR:
 		vcpu->arch.at_instruction_boundary = true;
+		break;
+	default:
+		break;
+	}
 }
 
 static void svm_setup_mce(struct kvm_vcpu *vcpu)
-- 
2.52.0.rc1.455.g30608eb744-goog

