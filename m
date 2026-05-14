Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C4643D1711
	for <linux-coco@lists.linux.dev>; Thu, 14 May 2026 21:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778795650; cv=none; b=l9GLByCTbzAAZ+cOqoZlzrbcRQ/+VQemS3SN++lyTZT4EP64VnKIjfAxOJwuHjBfIeYNdIYykxIVwPIcP5EsMHl94uQ5EB+TFsGHw7KKg5PDGW21Zc++W626wOPVl0vyr06BceG3U/Hg5yEJ+BAGtiausWgIKJNHZZXXev3InR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778795650; c=relaxed/simple;
	bh=N92fSgTbRoFdGmTmYT2jdWK5Axf4rwJn0qavUPuZUdQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ioWXQTp5Wu8oEDQoABbdaZ0652E/LKZE5wXCYR5+lmZnublKhom4lq8elOLJE//Y/NtgFe8GR+2l3NAkIA2vOnMLthM/GWxTQ9J+JxFGIxqtXuG5gBgVBjr7c4IXRI5DOWv64lYR85k8X6UHrjfQjaX7nehGe9Ys5WX8oKodgt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=IyqZQfPo; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="IyqZQfPo"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-c82c935e048so145200a12.0
        for <linux-coco@lists.linux.dev>; Thu, 14 May 2026 14:54:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778795647; x=1779400447; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=0lOseohsrh45pecTnMcOmR3eyEgHoLMULb1l21GrEmk=;
        b=IyqZQfPopFOwWE5hQs0k+0LlIsX+bbTpt0Q+zckTmo8K0uMcvKlmWDu5xZOYMN1W00
         FlCRENxbYyoeL0SZ1EEDV5ovs/dW6LT+O/LGBnZ60pk8v2lD4s5fObJUlBCVCLtfosy0
         VfeEpDM4l2+RDtJ+6kg33iKfHK6bs7fPKrfchfZQgx9h2y3hGs1ZRD3X26nvJAZEyteR
         pKX2oqZ+dRT0Mt9qVqx8NJTWXeFTLemyjj4GFLYouhfbJZTAjQ2qPQPRD43qtB6iSeYJ
         zmXN49ZmqFjQHfk2e49EmPeMHxrW/SsSCXmfAhOEefGKfIUuzI3qWoWaDmou6aR1Up7y
         qFEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778795647; x=1779400447;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0lOseohsrh45pecTnMcOmR3eyEgHoLMULb1l21GrEmk=;
        b=NDMSgs9+ATCaLc5aZ7NKIc9cZmauXr0UKsKRwHUiBAd8SrSU7VTbLNn4dJLkU3jrAF
         60AVTVCfKGK8KD9g26Vt8lNo63LkPxIM9y4mflpDWiYj5smAq6T5Z5+6FHyjZrwgPDo3
         cj/h6eMOvo6FMR8IocliP2H5cf/WOZwK4e5j0+tXm8g9+m8o3mw4gNfIL4GPtah8xQPr
         qzycHS1/pO3xTC4+b7LAS/85Mz4kkAs2jL0498JHF2gEaGMKZgRkmqnw3KOEKnwsm/dM
         nAdkl5hKmDIZokemOungWR783KqG+T1qAdxed6VE9qDH22a8AjQhlc1TJcx7KytRoKAB
         IY7g==
X-Forwarded-Encrypted: i=1; AFNElJ8V9aN70s9KZBngD7Sn/FGb3mivmX6j6iP4hP9lRxu0AXLgyFxCx7XvKat3xlZYyabdq5whlI3Qaul6@lists.linux.dev
X-Gm-Message-State: AOJu0YzecwDySDYYAzkOeFDoDdDGUtsEcJh9Sdirqbh6eUzVbCrmFCVq
	sFUm4Fhaiwxr+1nvehrkVrEgpU3ppaPB0YC3GQctcPaERmvXyiNhfQYhqDXQP/6joRWu4SwYFhT
	76lQ70Q==
X-Received: from pgna27.prod.google.com ([2002:a63:705b:0:b0:c82:7a7f:9bf6])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:7349:b0:39f:3559:750d
 with SMTP id adf61e73a8af0-3b0c0abccb2mr4934624637.31.1778795647024; Thu, 14
 May 2026 14:54:07 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 14 May 2026 14:53:49 -0700
In-Reply-To: <20260514215355.1648463-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260514215355.1648463-1-seanjc@google.com>
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
Message-ID: <20260514215355.1648463-10-seanjc@google.com>
Subject: [PATCH v2 09/15] KVM: x86: Drop non-raw kvm_<reg>_write() helpers
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

Drop the non-raw, mode-aware kvm_<reg>_write() helpers as there is no
usage in KVM, and in all likelihood there will never be usage in KVM as
use of hardcoded registers in instructions is uncommon, and *modifying*
hardcoded registers is practically unheard of.  While there are a few
instructions that modify registers in mode-aware ways, e.g. REP string
and some ENCLS varieties, the odds of KVM needing to emulate such
instructions (outside of the fully emulator) are vanishingly small.

Drop kvm_<reg>_write() to prevent incorrect usage; _if_ a new instruction
comes along that needs to modify a hardcoded register, this can be
reverted.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/regs.h | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/arch/x86/kvm/regs.h b/arch/x86/kvm/regs.h
index b28e71caed25..52bed14f43e3 100644
--- a/arch/x86/kvm/regs.h
+++ b/arch/x86/kvm/regs.h
@@ -61,11 +61,6 @@ static __always_inline unsigned long kvm_##lname##_read(struct kvm_vcpu *vcpu)
 {											\
 	return vcpu->arch.regs[VCPU_REGS_##uname] & kvm_reg_mode_mask(vcpu);		\
 }											\
-static __always_inline void kvm_##lname##_write(struct kvm_vcpu *vcpu,			\
-						unsigned long val)			\
-{											\
-	vcpu->arch.regs[VCPU_REGS_##uname] = val & kvm_reg_mode_mask(vcpu);		\
-}											\
 static __always_inline unsigned long kvm_##lname##_read_raw(struct kvm_vcpu *vcpu)	\
 {											\
 	return vcpu->arch.regs[VCPU_REGS_##uname];					\
-- 
2.54.0.563.g4f69b47b94-goog

