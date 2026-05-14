Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 231173D348E
	for <linux-coco@lists.linux.dev>; Thu, 14 May 2026 21:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778795651; cv=none; b=BU5aVz8b3l2QW077fVsmVC8CQweVxDoKFSMj8tuc7goKu3snOpg7I+uUp3UBV7m2K+WdyUxR2AInb+gI0oPAQ7+8sLkxHgM1MzXnbiPJc2aafGfDwtKYTuQN0sVhyhPT+PJfjIRqAQYGt1HWCeu6/+6xgyJ54kFsIQ1Fj2+p1gA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778795651; c=relaxed/simple;
	bh=FsAq7KEuatX1Pn52xDkKa5S9Ii59O/tYrQdckY5bUaw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=l0aT06RbKsPk8BBGycc3uI4irN2DgA8vBAAYWwbaQptY/S6l0RUZr8WG1RMMgia9AgkztRnPAISjXIYRCI+9W0ywmdk+IKbPlY4is102mvIzvWIFgwbimm/479ku2z9Ee2dJxLWNCGpGQuNLxvp/9McNx1VehZK694OLx13LfvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kJGmWwXx; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kJGmWwXx"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-c82894155ceso6518702a12.1
        for <linux-coco@lists.linux.dev>; Thu, 14 May 2026 14:54:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778795648; x=1779400448; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=g9vonHXs6r1LN2kGlbzZfFmfFgWCjNXLKuYTABKAIiY=;
        b=kJGmWwXxPeJL2lCETIlxaLmvKvX1bQ9tvTEl82MTJddBvcbXIW8yslup7Oj4UpeC/g
         iE8HFgcNq8kQt7ilIl3Z+ADeL/i8fZ+PNVAzPGiQWnxKZ+npYpvht4cLrfLsaYB1rvyc
         5eEQwvAyutFcI5g3zw1vphDuCmnJn92nYITjyGD65hKnjFSiKH2GPP0rlljJZ60xBBMO
         arSKys8gGuBW5BI599WE92BnfUUk93iNUo55O+iZZ3Sc6Wz7GSiu7fQhV9oALhA+pEdB
         eKaMiYG6YwQJVr4f9wzDpA01/BdblWwaCAMbM1OsrV5Tg/xS2kminAamkaaJw36gNvxB
         ecxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778795648; x=1779400448;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g9vonHXs6r1LN2kGlbzZfFmfFgWCjNXLKuYTABKAIiY=;
        b=OPhujQo1hsbJ0p8l9x2/n6S5InWnCf/5G4tSzh64TyKqPXMFOoBgO3O+awHcjcIyAM
         p+5LOd46imj2/yn88JmDAiuvu7s+XfIBcMArxTkL8d9bot/zlP9B1xtfEP98FOevxyvt
         jQeQVi2PBpGeuhy3/erOnQmtCyIZZboKmKza64WcOP6N87FiNh7WK4c3ovMxWXfWa1BO
         rHQ4C372Jahbvti8okmmi/aqzINzp3vsVFu9V41wS/hf+aD+pugXazJnSa+0J35ma25U
         8oeC9Pnk5RUyRG0qc+rB0nw9J5eT7IHkDYmdOpHmXtAi9A5TKCHNWEWDnqaOTFSJaU+y
         KWyQ==
X-Forwarded-Encrypted: i=1; AFNElJ94n1RyvZXKef4rjFD7edgfiZTD/w+N2JnrEdpNWDmU0TzpDJiluKMXD2oucrx5sg3r8zE5GBmydMJc@lists.linux.dev
X-Gm-Message-State: AOJu0YyBl+s+vxdDQwY6ROkCPkkIZXlx9upLIjz1wWDj+uLPeebe3Itq
	BUGnWli4PnXi8B9s6pacmLpDs8l8UhcjZENUnTUbr1srfbLEpnhpjxtd1thxGm7Ib8mjZ6vFLSw
	axhFulQ==
X-Received: from pfbem25.prod.google.com ([2002:a05:6a00:3759:b0:835:2a09:221c])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:3a25:b0:82f:1b42:11d0
 with SMTP id d2e1a72fcca58-83f33c9bdc4mr1362504b3a.15.1778795648217; Thu, 14
 May 2026 14:54:08 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 14 May 2026 14:53:50 -0700
In-Reply-To: <20260514215355.1648463-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260514215355.1648463-1-seanjc@google.com>
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
Message-ID: <20260514215355.1648463-11-seanjc@google.com>
Subject: [PATCH v2 10/15] KVM: nSVM: Use kvm_rax_read() now that it's mode-aware
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Vitaly Kuznetsov <vkuznets@redhat.com>, Kiryl Shutsemau <kas@kernel.org>, 
	David Woodhouse <dwmw2@infradead.org>, Paul Durrant <paul@xen.org>
Cc: Dave Hansen <dave.hansen@linux.intel.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, kvm@vger.kernel.org, x86@kernel.org, 
	linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Yosry Ahmed <yosry@kernel.org>, Kai Huang <kai.huang@intel.com>, 
	Binbin Wu <binbin.wu@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"

Now that kvm_rax_read() truncates the output value to 32 bits if the
vCPU isn't in 64-bit mode, use it instead of the more verbose (and very
technically slower) kvm_register_read().

Note!  VMLOAD, VMSAVE, and VMRUN emulation are still technically buggy,
as they can use EAX (versus RAX) in 64-bit mode via an operand size
prefix.  Don't bother trying to handle that case, as it would require
decoding the code stream, which would open an entirely different can of
worms, and in practice no sane guest would shove garbage into RAX[63:32]
and then execute VMLOAD/VMSAVE/VMRUN with just EAX.

No functional change intended.

Cc: Yosry Ahmed <yosry@kernel.org>
Reviewed-by: Yosry Ahmed <yosry@kernel.org>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/svm/nested.c | 2 +-
 arch/x86/kvm/svm/svm.c    | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/x86/kvm/svm/nested.c b/arch/x86/kvm/svm/nested.c
index 7b2d804ef2b0..4b1259eecec5 100644
--- a/arch/x86/kvm/svm/nested.c
+++ b/arch/x86/kvm/svm/nested.c
@@ -1119,7 +1119,7 @@ int nested_svm_vmrun(struct kvm_vcpu *vcpu)
 	if (WARN_ON_ONCE(!svm->nested.initialized))
 		return -EINVAL;
 
-	vmcb12_gpa = kvm_register_read(vcpu, VCPU_REGS_RAX);
+	vmcb12_gpa = kvm_rax_read(vcpu);
 	if (!page_address_valid(vcpu, vmcb12_gpa)) {
 		kvm_inject_gp(vcpu, 0);
 		return 1;
diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
index 02fb9560c26e..6379c389d811 100644
--- a/arch/x86/kvm/svm/svm.c
+++ b/arch/x86/kvm/svm/svm.c
@@ -2217,7 +2217,7 @@ static int intr_interception(struct kvm_vcpu *vcpu)
 
 static int vmload_vmsave_interception(struct kvm_vcpu *vcpu, bool vmload)
 {
-	u64 vmcb12_gpa = kvm_register_read(vcpu, VCPU_REGS_RAX);
+	u64 vmcb12_gpa = kvm_rax_read(vcpu);
 	struct vcpu_svm *svm = to_svm(vcpu);
 	struct vmcb *vmcb12;
 	struct kvm_host_map map;
@@ -2325,7 +2325,7 @@ static int gp_interception(struct kvm_vcpu *vcpu)
 		if (nested_svm_check_permissions(vcpu))
 			return 1;
 
-		if (!page_address_valid(vcpu, kvm_register_read(vcpu, VCPU_REGS_RAX)))
+		if (!page_address_valid(vcpu, kvm_rax_read(vcpu)))
 			goto reinject;
 
 		/*
-- 
2.54.0.563.g4f69b47b94-goog

