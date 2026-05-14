Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86D083D47D4
	for <linux-coco@lists.linux.dev>; Thu, 14 May 2026 21:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778795653; cv=none; b=BbZz74C4fZPCqkECM8VpsmmempJwNmpbNl6DDcx+gbU72idoYd60jx6R7Ob6PCwF5V3SrGNLI6QtwBr2CL8LRbYMcnNbBXkas4dsTBvciQKnnBbVAauu+olntiiCG77uCDL62mBNcz/4eDji91ycU5VxcRkTagX2lIw8TTguhOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778795653; c=relaxed/simple;
	bh=ASa0qONy08n1jZW2D9s2UlvBL3Zl9eZuoZRjbijA0sY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=m7vQ7Ub8fggrnNclZcF6ibRDnW+2wwQhg5eSaofjcXUj5LxkBJVBI3LuT/1oyrLdVJVP96a4Wri2z3nK4BKybWyMXDyhNT1Leg8EWwtCIvM8YBjN+4l0FmLPq1x89TjbB/F5eJvNL173jZj5luNMJgYWu7ZIaQUf6/BVbmaGs2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=W182q4vb; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="W182q4vb"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-83cecc22d5fso4430966b3a.2
        for <linux-coco@lists.linux.dev>; Thu, 14 May 2026 14:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778795651; x=1779400451; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=AMywqrk2MGSBbKp3e1jShOoo/2aA5jpTeXkhhSsyu/E=;
        b=W182q4vbD4Sc9z0gEiFcAkyoMUByFeNA7cgiJ2wwa/xq/m0DEMJUSeGrysmYRe4K5b
         MWYogC+BA3A/h+nKeoEwVC9z31hKbutFdS+61TC6X0pafMKnH1sQ9vVZh213dXAbSgyT
         r4V6bzBDF8n8N/8B26nl2OSBtSv2cEz4OuLBYFc1cjaAZdw93zUAzJbwrbEPzGdrsUyS
         1zaETZ30ijo+e1YbhwOGt9q7G+wwmjNTSOjAJPK1AdLmTGkiByv2XNSoF0aFAX7OJ8US
         hDNgUQXYphCBXcCb1/biXWdKUsunWgBOeXeSz07Fqge5umqZQO/IhazR6LLuGwTxbv4z
         Bfvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778795651; x=1779400451;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AMywqrk2MGSBbKp3e1jShOoo/2aA5jpTeXkhhSsyu/E=;
        b=oyyVW0bxCI2JXsKrMnMf6w4cLiAX1t9+cDx0wfxKXISMdHxnBK/JnbJAf67hf4sGrB
         XZAoyaCuuvegpXkZ9FDXsC6+LLLgr6AYYmcLhg09vgaMRfzDfkfTwEs5xsyTr0V3DKKI
         4BX+YVBXTC5YE1FkxzgHgNdw8PLLFQsHQf0mDrEgQIv2dpAY+3AT3T8p9TCB96VJPwGV
         GZIjywEzM/1sBWqT8YtQuPeqR05aydtaaqTzPoWW+CExanxFYrWSJHf6yU7abc8mlggu
         uEpIXoprSfso8YfNSATkX+DlkjBjwKW2ymA8RMd+IHmcL2q6TCqabyW1M8/Gz6i5/QF5
         jM4g==
X-Forwarded-Encrypted: i=1; AFNElJ/BYL2c9T3ay+htHGTemNcR6jZ/6GNaeSlP80RyAlD2vX9TvICv+O/b8APb/zF1XClLmqfYnDqI3o9h@lists.linux.dev
X-Gm-Message-State: AOJu0Yx8Wr7nyXYu7UELDC7sQUN1QRs85FX0Bv4280Ac2ZsEmoPrCb9X
	7NT6hiRkhsdUmva7WxYQiOL13SaIic4yIWx02ohL7rZakILYf/QpFKTG8JCWu6h0n/2OnEL+wWL
	/OLRsQA==
X-Received: from pfnj26.prod.google.com ([2002:aa7:83da:0:b0:838:ec6d:449c])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:12c2:b0:82c:225e:63c5
 with SMTP id d2e1a72fcca58-83f33b34c12mr1218784b3a.18.1778795650326; Thu, 14
 May 2026 14:54:10 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 14 May 2026 14:53:52 -0700
In-Reply-To: <20260514215355.1648463-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260514215355.1648463-1-seanjc@google.com>
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
Message-ID: <20260514215355.1648463-13-seanjc@google.com>
Subject: [PATCH v2 12/15] KVM: x86: Harden is_64_bit_hypercall() against bugs
 on 32-bit kernels
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

Unconditionally return %false for is_64_bit_hypercall() on 32-bit kernels
to guard against incorrectly setting guest_state_protected, and because
in a (very) hypothetical world where 32-bit KVM supports protected guests,
assuming a hypercall was made in 64-bit mode is flat out wrong.

Reviewed-by: Kai Huang <kai.huang@intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/regs.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/x86/kvm/regs.h b/arch/x86/kvm/regs.h
index 52bed14f43e3..d4d2a47a4968 100644
--- a/arch/x86/kvm/regs.h
+++ b/arch/x86/kvm/regs.h
@@ -39,12 +39,16 @@ static inline bool is_64_bit_mode(struct kvm_vcpu *vcpu)
 
 static inline bool is_64_bit_hypercall(struct kvm_vcpu *vcpu)
 {
+#ifdef CONFIG_X86_64
 	/*
 	 * If running with protected guest state, the CS register is not
 	 * accessible. The hypercall register values will have had to been
 	 * provided in 64-bit mode, so assume the guest is in 64-bit.
 	 */
 	return vcpu->arch.guest_state_protected || is_64_bit_mode(vcpu);
+#else
+	return false;
+#endif
 }
 
 static __always_inline unsigned long kvm_reg_mode_mask(struct kvm_vcpu *vcpu)
-- 
2.54.0.563.g4f69b47b94-goog

