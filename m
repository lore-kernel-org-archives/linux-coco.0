Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB4873D0914
	for <linux-coco@lists.linux.dev>; Thu, 14 May 2026 21:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778795640; cv=none; b=EE6x7tfvscscbGmzCXn9gXvdHJ3GklvOjyuB4x8YhjBRdxA+vshE+M/bkSm2tsL4tzG/f3JlgDWOaNiY2LE4rhWyrG1XEJDTV1bKRQZPZhwJPUkDGNizE1n0xBXoxc1MT/rWgU36p16KosITqaxmf5NapGuZm8iQbBg5V6B1NG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778795640; c=relaxed/simple;
	bh=h1qTMfKuEFDk+2bv6Vhwh7IxdwliAQW7/9Hv05WYO48=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=jMHGkRUNe5ppYgTTwetGOR4csA8SuoS+YeSr4+9qFCYAdHiYTRNf+NcJvYimbIX6+Xsk960YnWx7WdtiHZ0tvNh37bgc2aGoozoCLcWtIgtY0+6Sk4JEbU/9Jxc97FSLIUAJm0WkdVDG1Z8h3ugRBbBQwM6XnnRccECQ81fHaKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VOAw0gJR; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VOAw0gJR"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-82f74bcfb86so8824563b3a.0
        for <linux-coco@lists.linux.dev>; Thu, 14 May 2026 14:53:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778795638; x=1779400438; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=6BsK2zhxiwWVCIABmK0YYfn1Tg3z/0TREkGbcHGBLTQ=;
        b=VOAw0gJRvpE9UObFn7kOo0BrUKtfZlBH6CxVFR/vURtoUORMs/eil8aZVZV0kfAjvU
         DPHxmwzdrGqeVjwTvMFtpaddG/DoXr+a8KK1P7Y2HVSuSC2AYyw2LzyJ0LYKeaT5qzc0
         572qWPTg9xAr2C3czCuhisD4q7R34nsbdOv3JLviX0NQqDo1Dyc6G6zCLCn088PI065y
         dvsNrry3P4UckPSgKoDqwgSDVplPeL3aP1bm4uWhlB5S6eLFQx4vBlfjSTHTSj6Ffy/B
         m6xSInuDzJAgtSfx4J6wu4BRJxel7FkEhCJNCYY4Tq/r+VNgn3lgT+lIQuJXkfIu8XUN
         hiXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778795638; x=1779400438;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6BsK2zhxiwWVCIABmK0YYfn1Tg3z/0TREkGbcHGBLTQ=;
        b=ch5PalXLSG6w8yLDXJiPaW2aQvDaWkmna/G5T4GGbSsSOhqzYvYy3XaXzR45J+sdgF
         3rZYFqJJTGsyVOwFxoNZ1R43ZYi/ossuSWNXSRE5G05DKt4vECnCSJV1BYKCnbzQ6UOs
         oKGD4PJlEr3/rgO7JO4rDxV8ojTYBOWbfMzVY6lyfw6jL8G4deZioR1ExX5AMKFA72Ei
         VM0zgko7BFkCqWnqsGQxXvlncR+iT2iSek1zr7Qv8CEZa4FJKkgWrpqg1vhAiTbUJwr6
         qQVo3CfbbiwSZiEQh6EaKHoifSIrDL5uI3wQfE+t6f3nZTDU68Ype4tFt8FJrVSefC1z
         uenw==
X-Forwarded-Encrypted: i=1; AFNElJ+a30ZHwWjiBe+/6EeebHKzEey0Pw5HPnfQoc6O6YzC2F51s8Ekap85OG7LM9vK8z7BeKhJ2wt2t0q2@lists.linux.dev
X-Gm-Message-State: AOJu0YzX/olq7G+zAOwWmUmLu2fH3SfxJpg2D6DW2XzNVXfB/OCT7mUM
	wPCiDZTvx8zBDh0XLhcR17FSWK7sxDHf06pLc3of8NfrldRK+OHOiUtYbQAdi/DLHhKwRPmX+2h
	72kF4HQ==
X-Received: from pfbly26.prod.google.com ([2002:a05:6a00:759a:b0:82f:a4cc:2fb3])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:2308:b0:827:447f:7dbd
 with SMTP id d2e1a72fcca58-83f33f28f4dmr1261393b3a.46.1778795638008; Thu, 14
 May 2026 14:53:58 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 14 May 2026 14:53:41 -0700
In-Reply-To: <20260514215355.1648463-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260514215355.1648463-1-seanjc@google.com>
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
Message-ID: <20260514215355.1648463-2-seanjc@google.com>
Subject: [PATCH v2 01/15] KVM: SVM: Truncate INVLPGA address in compatibility mode
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

Check for full 64-bit mode, not just long mode, when truncating the
virtual address as part of INVLPGA emulation.  Compatibility mode doesn't
support 64-bit addressing.

Note, the FIXME still applies, e.g. if the guest deliberately targeted
EAX while in 64-bit via an address size override.  That flaw isn't worth
fixing as it would require decoding the code stream, which would open a
an entirely different can of worms, and in practice no sane guest would
shove garbage into RAX[63:32] and execute INVLPGA.

Note #2, VMSAVE, VMLOAD, and VMRUN all suffer from the same architectural
flaw of not providing the full linear address in a VMCB exit information
field, because, quoting the APM verbatim:

  the linear address is available directly from the guest rAX register

(VMSAVE, VMLOAD, and VMRUN take a physical address, but they're behavior
with respect to rAX is otherwise identical).

Fixes: bc9eff67fc35 ("KVM: SVM: Use default rAX size for INVLPGA emulation")
Reviewed-by: Yosry Ahmed <yosry@kernel.org>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/svm/svm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
index e74fcde6155e..4ad87f8df392 100644
--- a/arch/x86/kvm/svm/svm.c
+++ b/arch/x86/kvm/svm/svm.c
@@ -2415,7 +2415,7 @@ static int invlpga_interception(struct kvm_vcpu *vcpu)
 		return 1;
 
 	/* FIXME: Handle an address size prefix. */
-	if (!is_long_mode(vcpu))
+	if (!is_64_bit_mode(vcpu))
 		gva = (u32)gva;
 
 	trace_kvm_invlpga(to_svm(vcpu)->vmcb->save.rip, asid, gva);
-- 
2.54.0.563.g4f69b47b94-goog

