Received: from mail-ot1-f74.google.com (mail-ot1-f74.google.com [209.85.210.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32FAA1A0BF1
	for <linux-coco@lists.linux.dev>; Wed, 14 Jan 2026 00:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768350622; cv=none; b=D2kKA4dm9QpJzHVeSCLGPzdHkUomA+lHocvJkgcQw37h5kSPP1p3E7z64EtIoIxiXn1d8OLO1FeYeI/l5HHrfB95xfT2FoAKGFRuP97SE9cmHTiz5euaIWiwt0JIfb1rtpih8Cb8bq52SKEstefJGjBUz8Qwm8+6g7ek/bAtQW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768350622; c=relaxed/simple;
	bh=Sww1KhC26DhzRX8vj6+jeZjMA0ohksUqS7ewJwBUchw=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=SvDLNdaqcZie+0664K1D+BFjrL947UFgN//W6DocAAKzVnA23YLCMldUf0MAh+jsQsylG8KHnouRFBhKSbThGXlr4RDh0oe17zHsRU8ZJ8eRanL50ByqA3zl5fQYX3VZzanLxMav3RL80EHMEfj1P6d1JMzK6qR1m+KFAU2ezbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--sagis.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=x90jna5w; arc=none smtp.client-ip=209.85.210.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--sagis.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="x90jna5w"
Received: by mail-ot1-f74.google.com with SMTP id 46e09a7af769-7c7046514a2so13541023a34.0
        for <linux-coco@lists.linux.dev>; Tue, 13 Jan 2026 16:30:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768350619; x=1768955419; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=mDqQzZpBqG5DC4HlLuHkP1lRxnE+ttALMGnQiFNcgcU=;
        b=x90jna5wX0K5X++LLCofVsc7C3iK8u2kyd4ICAN70m95Ymlze8cobAoPROssAnegWw
         TGMMG4ndnevPN+vYfDYl8mry7949KN6TN5pj+ep56tDCHZiysgefhKbFg+UX3lud7Nga
         TEWXRxyVzHmFoNwcEyX6jo+H+6dUNW2y/cTdKEGN3QiCVIEKJTwVuzc9MuO1xGCMap1c
         a0+HquiULn1cIyeoVOrU/xTMM+VQUa6jWfIh71H7O7mqjqMhRHr6bny/y+ubtY/GJ+Xu
         WSK4tiWZpLrTovBOCS7jveASBYC2CLsOu/0IKjdlg84QRh/rTGgFVZdrHYKfD08hQ2Nq
         +2UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768350619; x=1768955419;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mDqQzZpBqG5DC4HlLuHkP1lRxnE+ttALMGnQiFNcgcU=;
        b=L28JhRWDeuY/soQIKynLan8NV8umIFdWfTZAwbunTWTN06GhkG6ZwIoibhduLIYsI9
         2W4eRNcYm9fYvxtzwRWtoNnc2Rc3IT1KCgosviOKtriF+2kll7an31m1K8iT2RGq3WYt
         rypBd7G7TuFWn2eB+nqYGZOLJ2lN/7BXraaIC8oFOMXdP1zfAn4xmSf6KS/hQPdmvR2p
         Z2ZVem+wjTr4sFGoSt2c/aslIEzr1hQfgbavHoFWwAL6Qxcft8JgB2L3X+mQW3CEMrdh
         cjBleAXzVVA0jIMqIBMOU4ma1p1d0rEsFwHavCNWGkpqCJXO/HCBvrelxR2qv3Z2yoGw
         flAg==
X-Forwarded-Encrypted: i=1; AJvYcCXjUSEmsr9Xno+ae9vmtbEY40Od++VgF3+eGfVrCdACPuJ+0eLOQdLS6TQje7hxaipwhTUKGUQmhzkZ@lists.linux.dev
X-Gm-Message-State: AOJu0Yx9Bzto9X3ScezpACr91gfWtTQZwm/DXaO7GjqwYZjCAUU9GZzo
	IJvowZnbfIJaOwEM1kxj8c7WMIk5DFtbUfQNAp3Ubn5qUwHI88huSjAP6qTaubwLl+mKW9TvmEu
	KXQ==
X-Received: from jajn1.prod.google.com ([2002:a05:6638:2101:b0:5ca:5a1e:2501])
 (user=sagis job=prod-delivery.src-stubby-dispatcher) by 2002:a4a:d858:0:b0:65f:cda0:ed8f
 with SMTP id 006d021491bc7-6610064cecbmr551777eaf.35.1768350619122; Tue, 13
 Jan 2026 16:30:19 -0800 (PST)
Date: Wed, 14 Jan 2026 00:30:15 +0000
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
Message-ID: <20260114003015.1386066-1-sagis@google.com>
Subject: [PATCH] KVM: TDX: Allow userspace to return errors to guest for MAPGPA
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
migrration is completed.

Allow userspace to signal to TDX guests that the MAPGPA operation should
be retried the next time the guest is scheduled.

Signed-off-by: Vishal Annapurve <vannapurve@google.com>
Co-developed-by: Sagi Shahar <sagis@google.com>
Signed-off-by: Sagi Shahar <sagis@google.com>
---
 arch/x86/kvm/vmx/tdx.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
index 2d7a4d52ccfb..3244064b1a04 100644
--- a/arch/x86/kvm/vmx/tdx.c
+++ b/arch/x86/kvm/vmx/tdx.c
@@ -1189,7 +1189,13 @@ static int tdx_complete_vmcall_map_gpa(struct kvm_vcpu *vcpu)
 	struct vcpu_tdx *tdx = to_tdx(vcpu);
 
 	if (vcpu->run->hypercall.ret) {
-		tdvmcall_set_return_code(vcpu, TDVMCALL_STATUS_INVALID_OPERAND);
+		if (vcpu->run->hypercall.ret == -EBUSY)
+			tdvmcall_set_return_code(vcpu, TDVMCALL_STATUS_RETRY);
+		else if (vcpu->run->hypercall.ret == -EINVAL)
+			tdvmcall_set_return_code(vcpu, TDVMCALL_STATUS_INVALID_OPERAND);
+		else
+			return -EINVAL;
+
 		tdx->vp_enter_args.r11 = tdx->map_gpa_next;
 		return 1;
 	}
-- 
2.52.0.457.g6b5491de43-goog

