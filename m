Received: from mail-oi1-f201.google.com (mail-oi1-f201.google.com [209.85.167.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB05017A2EA
	for <linux-coco@lists.linux.dev>; Thu, 15 Jan 2026 22:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768517564; cv=none; b=WMDsT51Bh+uo2Gc+nlRxbCEMUbK+rLZeFpsg0DrlCU9MEgDUa60oo6uZGFLQFVfrMD/+c4NCYQP7iGtby0Nk4stuRYA51Ec66HkP1kmomd8GVyZKlwkXnhkR/BXKbiJuIQ9uqs1ss8ApVFPf9Hgena8Cz0W35IwVeoSsCipPVp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768517564; c=relaxed/simple;
	bh=E+D/xWOr1s8GCE/Wqb9NdzI/sxSTWm/3fxHESTDH6c8=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=kz4BT2Z0u3XaX27j9QMXCXo2toKHxwdYyCPqkT6oXiXvLNPJ5a5obbixc4T5c7K+TigBc8qyW60r8+lxgscA9kXiJPYIi8ObjsBup1qGQUKR/FG5vh6lraLYcu9GQeg2VduDLOEBDmLde4I1XioHKv+v1qxDIwuT57t6wOCjtGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--sagis.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nwO9/z8D; arc=none smtp.client-ip=209.85.167.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--sagis.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nwO9/z8D"
Received: by mail-oi1-f201.google.com with SMTP id 5614622812f47-4557c1e9e54so3528681b6e.1
        for <linux-coco@lists.linux.dev>; Thu, 15 Jan 2026 14:52:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768517561; x=1769122361; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=TRmKjaBXNK+AvtD0p9RP9J8FQ82ubxpDWL/utJgxLnI=;
        b=nwO9/z8Dm7BT5HQLKHHlMHl7x9TzvKlCaZ5UO09FKVEK6KiYKD03Ow/WfcODS12rcw
         ijBS3uNbAU5ofIud9ujiE2Zf3g74FY6cvZvUr5qIX+cTZq7oiMdaqf1hzNIxEfPdkWVU
         wSr1q8orzDd8kPJnEtKtSw17TmnCsPy1YEU/bVmuTj/9whEXvOdgHwltRKlZavkUlwe0
         ti6zhUvjnWf+d4CfoB1hdaR1h5pLqJlFcJyIGt2WpX+KOdWGVA4OjIVX+RK9ovm2YcEW
         TrDqpAkL2FABJBdUCbBuHsZBPeKihpSxx8SVzdSqTIGVFP2s2Qn1Uil9XNfMzAqlFIGU
         FXpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768517561; x=1769122361;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TRmKjaBXNK+AvtD0p9RP9J8FQ82ubxpDWL/utJgxLnI=;
        b=lWFCLBpZdABOo4cFozlPo023UlwXUDXCjKeHPPk9PAmpuf3Sy7F4R8/6pqDeiRjTUH
         1YqTKrnbIqPp6hzYBwS3JNsFbfP22vEBUTJe4pL0LzuCjLs/y5Z7EfklO7X2FXhUwU8H
         SfOzjePXghB8F4ksj0uuOSZtm3DYZMyI7Phd79Oan5RRBoAmA39DYWnZjHOUGaEPDbI5
         jRT4Pd7/TYczMpBAmr9fmoLjqaUKj0WhHgGBV35snPcR0+PGRABNH8p2azlTu26CqWpA
         SCTXieogqxgyRuDD4abU77PpS+7aSHjweWREe6yzKww0qTDn+UZGC8oh1ZeS/BBEKhcR
         EJ7A==
X-Forwarded-Encrypted: i=1; AJvYcCVijaJ2HcSY1OQWzHexKwpfoIHMIXw8IM4MQBnl4/ncDUPqohXggm+xm3fkQM2pnbJsW929V7a8haXp@lists.linux.dev
X-Gm-Message-State: AOJu0YwIi4/UcFn146WjNcIdZWaXd+QL328OSz8pjnksyn+UMfyjdOBA
	2ulbHaou5p/u1qZH/GHWRMx6s1G7CTohhhbggQfYDKiWW2PmXBsuo+bTmrd0NEsaVkf4EysW2yY
	vRQ==
X-Received: from oijr5.prod.google.com ([2002:a05:6808:aa5:b0:45c:7cc1:5636])
 (user=sagis job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6808:1b1f:b0:45a:4189:d2cf
 with SMTP id 5614622812f47-45c9d70a437mr379132b6e.8.1768517560722; Thu, 15
 Jan 2026 14:52:40 -0800 (PST)
Date: Thu, 15 Jan 2026 22:52:37 +0000
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
Message-ID: <20260115225238.2837449-1-sagis@google.com>
Subject: [PATCH v2] KVM: TDX: Allow userspace to return errors to guest for MAPGPA
From: Sagi Shahar <sagis@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Kiryl Shutsemau <kas@kernel.org>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev, 
	Vishal Annapurve <vannapurve@google.com>, Sagi Shahar <sagis@google.com>
Content-Type: text/plain; charset="UTF-8"

From: Vishal Annapurve <vannapurve@google.com>

MAPGPA request from TDX VMs gets split into chunks by KVM using a loop
of userspace exits until the complete range is handled.

In some cases userspace VMM might decide to break the MAPGPA operation
and continue it later. For example: in the case of intrahost migration
userspace might decide to continue the MAPGPA operation after the
migration is completed.

Allow userspace to signal to TDX guests that the MAPGPA operation should
be retried the next time the guest is scheduled.

This is potentially a breaking change since if userspace sets
hypercall.ret to a value other than EBUSY or EINVAL an EINVAL error code
will be returned to userspace. As of now QEMU never sets hypercall.ret
to a non-zero value after handling KVM_EXIT_HYPERCALL so this change
should be safe.

Signed-off-by: Vishal Annapurve <vannapurve@google.com>
Co-developed-by: Sagi Shahar <sagis@google.com>
Signed-off-by: Sagi Shahar <sagis@google.com>
---
 arch/x86/kvm/vmx/tdx.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
index 2d7a4d52ccfb..9bd4ffbdfecf 100644
--- a/arch/x86/kvm/vmx/tdx.c
+++ b/arch/x86/kvm/vmx/tdx.c
@@ -1189,7 +1189,13 @@ static int tdx_complete_vmcall_map_gpa(struct kvm_vcpu *vcpu)
 	struct vcpu_tdx *tdx = to_tdx(vcpu);
 
 	if (vcpu->run->hypercall.ret) {
-		tdvmcall_set_return_code(vcpu, TDVMCALL_STATUS_INVALID_OPERAND);
+		if (vcpu->run->hypercall.ret == EAGAIN)
+			tdvmcall_set_return_code(vcpu, TDVMCALL_STATUS_RETRY);
+		else if (vcpu->run->hypercall.ret == EINVAL)
+			tdvmcall_set_return_code(vcpu, TDVMCALL_STATUS_INVALID_OPERAND);
+		else
+			return -EINVAL;
+
 		tdx->vp_enter_args.r11 = tdx->map_gpa_next;
 		return 1;
 	}
-- 
2.52.0.457.g6b5491de43-goog

