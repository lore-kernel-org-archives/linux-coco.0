Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EA89397E77
	for <linux-coco@lists.linux.dev>; Thu,  9 Apr 2026 22:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775774574; cv=none; b=Ucq6udrCwJpK2MH4zVONXc+M/RbBpiCKT5wOR0HlamO/pA7fPqUkh/lO0LprPfPadY8TsL8AeM8omw02tBSlpEWzhF6LBUg+CX89LjdW8Lh+hkXprCKPAtf/H6xFfH6iPRKupO3EXC0VPwnjzaKMeOlCTrrj5X/Wi5XOqc/cBp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775774574; c=relaxed/simple;
	bh=Cfxa2UAE6j7eG3LqQr4Mhci8tHPj0OKBsNtcqmiHvgI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=LDeh3Xitlz/4/EzG0ZWoeEv3857aIUS4cLK5qjkzovRJcVFRQhYSfJUjuerVpZqZ3XSMgoyM6BH9PBUlt8yUQ+XvONny3xgdJikSkMWZpRCM/AkCkiwa5NU5ELT+SY9iLZU5/ndB2YIMj/oeg+ZS3Pd8Wbu+5cK4EBUnRl4SC6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TnNBfAhs; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TnNBfAhs"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-c76fdf996a1so830219a12.3
        for <linux-coco@lists.linux.dev>; Thu, 09 Apr 2026 15:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775774573; x=1776379373; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=dy1xR7/tBUVQ93pwLppnnl1roCB8CkMUcZoZrxWj4Ak=;
        b=TnNBfAhsBIJUTSRP7S2a4kiMF4g73/bWSjJCEfefCU72ujDKwEjlJtzdyoxRJqXXdF
         8gLXxNSW42ZQnhyEBax2iEEsT3AFoKHAXKBax7JgbGTxk9rYWEU/UR79TywP6mK4x7Gi
         5trliCF1iQ99XpkARf45kyFOuf1M7A3b39bD5wqTvLMt6HwzPggoRARgj5fE0y2YZB7k
         lMIT9y+3H8jPrN2zw8ZaVhCxWb+3czrZQqqFN65qm8uBVnFLXD65SbP86legZAmbScxp
         liEYUn2zEsK7LfS+cBfqk3cK6Un6nXGYjkcPvNWyisEQ1lioI9R8xiYG0AzyvYW5Lvsn
         CPmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775774573; x=1776379373;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dy1xR7/tBUVQ93pwLppnnl1roCB8CkMUcZoZrxWj4Ak=;
        b=BJVNF+VYRPpzMi1l6gntcasIRwrrrXKE0RQZe7xCDhkIzJiJ4pxCabcRjGAtROoysG
         HbK5NiQz0hsWQakNIBaigvzADLHCjNO2NpZWthj87O1iEfNddZuFJFSGyXNobUr9op+p
         dneNF9ws6T4nkohWwOgkSG0PS4I5TPPf6dMM4vEeECnixpcS7rHUjciFfns+IRgVrR6o
         1dsYotdRMZ1rUTsnritoJ0fVqpzg/e9fwN7V5x37l4tYnBt65JitajUPFTgE6gvpU0rO
         Wc4y1zTUWfU4UQpk8pjlT7m86A0u1CKu5pX6kL3WgzwDMcYwQVjUl+w1p9YweSPYoZGp
         VzKA==
X-Forwarded-Encrypted: i=1; AJvYcCUaQOThv6OGK52PGG/ysUYKnxagdcIuC69QHspztqOuEHLxKgshmABp5I+iOryaUbGFxzJ3TH9TxTXw@lists.linux.dev
X-Gm-Message-State: AOJu0YwgvFvRei/ZHGp24AbA3wnabcZgP3liIjxOy7x49WEBULHBLLB0
	6ofF1bSA/IYrz8fsVjsG3La+lmGMgBFl1poSxYdbwB9GMD2VbyP+nkBbZ6lpaqrtVOTCY+5mRvM
	U7SgqxQ==
X-Received: from pghv6.prod.google.com ([2002:a63:f206:0:b0:c73:7970:8223])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:9981:b0:39f:43c3:b8b9
 with SMTP id adf61e73a8af0-39fe40d7f36mr740699637.57.1775774572752; Thu, 09
 Apr 2026 15:42:52 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu,  9 Apr 2026 15:42:32 -0700
In-Reply-To: <20260409224236.2021562-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260409224236.2021562-1-seanjc@google.com>
X-Mailer: git-send-email 2.53.0.1213.gd9a14994de-goog
Message-ID: <20260409224236.2021562-4-seanjc@google.com>
Subject: [PATCH v2 3/6] KVM: nVMX: Do a bitwise-AND of regs_avail when
 switching active VMCS
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Kiryl Shutsemau <kas@kernel.org>
Cc: kvm@vger.kernel.org, x86@kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, "Chang S . Bae" <chang.seok.bae@intel.com>
Content-Type: text/plain; charset="UTF-8"

When switching between vmcs01 and vmcs02, do a bitwise-AND of regs_avail
to effectively reset the mask for the new VMCS, purely to be consistent
with all other "full" writes of regs_avail.  In practice, a straight write
versus a bitwise-AND will yield the same result, as kvm_arch_vcpu_create()
marks *all* registers available (and dirty), and KVM never marks registers
unavailable unless they're lazily loaded.

This will allow adding wrapper APIs to set regs_{avail,dirty} without
having to add special handling for a nVMX use case that doesn't exist in
practice.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/nested.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/kvm/vmx/nested.c b/arch/x86/kvm/vmx/nested.c
index 22b1f06a9d40..63c4ca8c97d5 100644
--- a/arch/x86/kvm/vmx/nested.c
+++ b/arch/x86/kvm/vmx/nested.c
@@ -310,7 +310,7 @@ static void vmx_switch_vmcs(struct kvm_vcpu *vcpu, struct loaded_vmcs *vmcs)
 	vmx_sync_vmcs_host_state(vmx, prev);
 	put_cpu();
 
-	vcpu->arch.regs_avail = ~VMX_REGS_LAZY_LOAD_SET;
+	vcpu->arch.regs_avail &= ~VMX_REGS_LAZY_LOAD_SET;
 
 	/*
 	 * All lazily updated registers will be reloaded from VMCS12 on both
-- 
2.53.0.1213.gd9a14994de-goog

