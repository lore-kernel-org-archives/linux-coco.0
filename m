Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BC4D33E34F
	for <linux-coco@lists.linux.dev>; Thu, 30 Oct 2025 20:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761855064; cv=none; b=ah7C0SNr3y3Tu3MUJbru5VYauIGeh2zKSonOo2GhRT2lIkUxc7ZeXq1Qowl/qmFki02TkvT551lgLX6deNRvZuYMoVppg6iAyuxKJecd54y7XXYwYYClB32Q/vaAgSHZnJQDKjSQ498nEWfXO04YTfRtOKVp1WgVja2bvBB4z2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761855064; c=relaxed/simple;
	bh=dmFGy64Opu9Mkjf3vfnnmQEC763oF8Lj2ACAU4D9x+8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=aWbvxk/BET74ni8xkw35ZxyoppizfQusu9bQ5F/q2lV8CwgkdpyLtbJf//DXOcotlM4UpdL6gRL23OUqb+L79lhatHnzF3t7pZ7W69JEPpzJ281XUtN7ZLuLeh8CeGgupLWgKjVt/Ohfb/YVQYtaY93ovy6CKJQh/hWpXEzzqdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=x2QGnhZ+; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="x2QGnhZ+"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-b6ceba8968dso1138901a12.2
        for <linux-coco@lists.linux.dev>; Thu, 30 Oct 2025 13:11:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761855061; x=1762459861; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=pcGBUMDBt4QrK3gZ63mWxwFVf8xhoPzw9YjzqkGrLic=;
        b=x2QGnhZ+3hEip5gh83eXLmnpHCA2ZU9+rJmVSMfKKBN1Kf7/ELkuvVTdEriY+GDfAD
         NZMM52GlCKyhjeih9VDtPrlJvOwh6kFtyFcDHPTDHUKUmKheJiFaDPZsM3PewzOKwmMO
         7LCpmNLI3YfaUy+usJl89D8/qWqnTCc4W4UN+ztfemS8Cn43rLo2VyohdKm6iDD+TZ7/
         3te3sk+gMfTPNQDolZzndDAmxqT00z7dtsv6knQ/X8kvEnOa29HpnmFjTgS2t+Moq0Et
         9LaLRloU4+vJjPlYLYNuQ4F9gURIvxjvp2rf7req8wPxeMjYVnUCHLJ06oDlL0lpRasl
         nS9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761855061; x=1762459861;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pcGBUMDBt4QrK3gZ63mWxwFVf8xhoPzw9YjzqkGrLic=;
        b=RGi8t+fdHbRt1z4k5nvHHBDfZqoIcHqOhINigGUNvhqTgErK67Pz077aHLjnk7fsGA
         JPR9T9QVbLx2uA0LDk6AaBDtWH8uE8K1B9qaEzYBx8JVxLJFgXP+gDQLorEvsd7sFWE4
         iw/hl4EcDKPS1YmhjqwbdJ97A51Kz9/xOMUtHHYciimYab4cjNz9wB5MMY3GnS5l6rn4
         BhCHNbV9LhecPcg6+dAM+PdyB3emSTPYdwjZKUpqhNFH08WZN6XXrqy0ST4ylyZqTN+q
         f21iN+QSswYjsf2WX9bO34jAXEKAXiTprjeLgidObYmczgiy+E/j4qU7XmYDtotXUp6p
         081w==
X-Forwarded-Encrypted: i=1; AJvYcCWvQgmZpNfJICiLZl+3jyWC5j/tTamsSMmtzNk7wXA4FKacaqCqu9kRVPg3/dk4cRlNydaB5/bUVtzV@lists.linux.dev
X-Gm-Message-State: AOJu0YwBRYsZTJO8Kj5yQ2bU5PkxrK9kXVMpHGwhmlIV98sQtDPM3Pjq
	qvDaUU9sCQSs4lG4fVF8mn1Ofg1/eqCtCHVftru20mAsX+GDQQz2pH1Vw3iokjsN2NZ8HNXPKMg
	T+4W4MQ==
X-Google-Smtp-Source: AGHT+IE/OfQCQRYqXElzN+OeKvwnTKdqn8Aa5qkU15JwMNXReTeV5Yh/81ZcfUEIC9p/s1OTRodzv1oDE/0=
X-Received: from pjbms9.prod.google.com ([2002:a17:90b:2349:b0:33d:69cf:1f82])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:c401:b0:295:21ac:3540
 with SMTP id d9443c01a7336-29521ac3a29mr3509295ad.33.1761855061339; Thu, 30
 Oct 2025 13:11:01 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 30 Oct 2025 13:09:48 -0700
In-Reply-To: <20251030200951.3402865-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20251030200951.3402865-1-seanjc@google.com>
X-Mailer: git-send-email 2.51.1.930.gacf6e81ea2-goog
Message-ID: <20251030200951.3402865-26-seanjc@google.com>
Subject: [PATCH v4 25/28] KVM: TDX: Don't copy "cmd" back to userspace for KVM_TDX_CAPABILITIES
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, "Kirill A. Shutemov" <kas@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, x86@kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>, 
	Kai Huang <kai.huang@intel.com>, Binbin Wu <binbin.wu@linux.intel.com>, 
	Michael Roth <michael.roth@amd.com>, Yan Zhao <yan.y.zhao@intel.com>, 
	Vishal Annapurve <vannapurve@google.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	Ackerley Tng <ackerleytng@google.com>
Content-Type: text/plain; charset="UTF-8"

Don't copy the kvm_tdx_cmd structure back to userspace when handling
KVM_TDX_CAPABILITIES, as tdx_get_capabilities() doesn't modify hw_error or
any other fields.

Opportunistically hoist the call to tdx_get_capabilities() outside of the
kvm->lock critical section, as getting the capabilities doesn't touch the
VM in any way, e.g. doesn't even take @kvm.

Suggested-by: Kai Huang <kai.huang@intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/tdx.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
index 037429964fd7..57dfddd2a6cf 100644
--- a/arch/x86/kvm/vmx/tdx.c
+++ b/arch/x86/kvm/vmx/tdx.c
@@ -2806,12 +2806,12 @@ int tdx_vm_ioctl(struct kvm *kvm, void __user *argp)
 	if (r)
 		return r;
 
+	if (tdx_cmd.id == KVM_TDX_CAPABILITIES)
+		return tdx_get_capabilities(&tdx_cmd);
+
 	guard(mutex)(&kvm->lock);
 
 	switch (tdx_cmd.id) {
-	case KVM_TDX_CAPABILITIES:
-		r = tdx_get_capabilities(&tdx_cmd);
-		break;
 	case KVM_TDX_INIT_VM:
 		r = tdx_td_init(kvm, &tdx_cmd);
 		break;
-- 
2.51.1.930.gacf6e81ea2-goog

