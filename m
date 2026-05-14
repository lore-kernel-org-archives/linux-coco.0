Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60A083D171E
	for <linux-coco@lists.linux.dev>; Thu, 14 May 2026 21:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778795642; cv=none; b=TknGO/ykbDlWu1QFM3123N2gdR/yK+woC6VXfWl7YNqFMHBcs95p8V0eDqfqh+2dWrLth6fkWJt6MQj+Bg1tQ7wUEEGSCYuEicF+W7wUj/b1z833GS2Pr7Zq5s9vA67+/anAwbaYstyyNLA/ARECa7kVyektzztvTBGk9LRv9G8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778795642; c=relaxed/simple;
	bh=alOj0ulkorrTMebS435FX8VSWcJfgxZS2VP50saGg/c=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Cu3vkJsXP5hTJ4C+AVJP0zydgr8+mvF7Uclk91PBKdYStzUDznHdxVnRTXw9vFmMwYO7LLVBAh5c7D9vJVGRT7GNwIw647rGfmzRW+Cw26+84wdV0UIUCk6rrolKlRJoLEKMANq866Dn5acoXv5jofulkOyJH9GJyBPuShP0vqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZQ2c8bdN; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZQ2c8bdN"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-c709551ec08so10298118a12.3
        for <linux-coco@lists.linux.dev>; Thu, 14 May 2026 14:54:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778795640; x=1779400440; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=OSIIeDvi5cUuvLPtbPSIJ0wDOFHmUc0VllK+0XWeleY=;
        b=ZQ2c8bdN3RIsa/BBGRbKLWBHY+e4pIXCWHz0DipD6hRL1ClKUQ2nUe3AHlYmykxjuH
         Nv1RoIL7A8hYG6EYgYpULe20wJgjGZAVy8sghizsyJEMVOaOoDdl+R0cx2+l9TJF2Ng0
         asCaNngedfe3eyd/QJ3A6fNLU27SXUEi5dh7TfGnuOBvcr3xaccxAQ598YkGef7jZSdu
         svYx9/2OWntu7DP1g3FYnrYxVC7uTHrbRamsEtPUFWNLmf0QzKfb5GVWxMxAWsQLY0jh
         Sq580QzxIAbI4Raqbx5ZEzd8UyB5fEyq/a+XeW8qw/JUsqLmoXeelkko+MqVrAAZTZPD
         3FCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778795640; x=1779400440;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OSIIeDvi5cUuvLPtbPSIJ0wDOFHmUc0VllK+0XWeleY=;
        b=TjkTpHD1PQx3e+1/BLZDeqlOWVgqHwCL5hxTzMz2lK+n63vj1lI4JvuFUETwAup/XE
         Krk3kfLYmN17RHFLtA7pBjf18ejlUzA3nNqhIceuzxDWiaHIFlBJT5mnANJU1+bBx9Xx
         ZzsXtIKWg2SkNi1E8d+KRWiLcGWPbMwMu00thuqJK8KKSHfu/1m5evx8r7hPLlhnVd+9
         ZzGpwnofOyicRSlQMxt7WX/Vw8p6dYrx8cSDWf/bsezOkDE7bd2ev0nGXpTpdlBFQQ6J
         HkCDuzV6s02Cc9xohAE5dh9uCFDLEQ65lxKPyElFg1MooSqt37yLbeTzLBS+U43ozgY3
         tFfQ==
X-Forwarded-Encrypted: i=1; AFNElJ/dQ6gvjTbuxKnxoOK/ykHOyBK7nThuNwdqocn8FJJVVI5+yqgQdvhzhVfYucglLi5cRWy/ESAAASpG@lists.linux.dev
X-Gm-Message-State: AOJu0Yy70Ea7NC+Kr2cf/vJnsKxmpORKnFNKeZOc53Xy6zMNwlI2z+7N
	2R/47qKXLIP1JqFdkQesXvhjz8372xjexDBNH1i57/7FxtUG5rjTqAimW0A/mJftUeJLP/yLUVL
	XYNXShQ==
X-Received: from pflb19.prod.google.com ([2002:a05:6a00:a93:b0:835:4315:3453])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:3e22:b0:823:d2c:b156
 with SMTP id d2e1a72fcca58-83f33c4f71cmr1244822b3a.5.1778795640146; Thu, 14
 May 2026 14:54:00 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 14 May 2026 14:53:43 -0700
In-Reply-To: <20260514215355.1648463-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260514215355.1648463-1-seanjc@google.com>
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
Message-ID: <20260514215355.1648463-4-seanjc@google.com>
Subject: [PATCH v2 03/15] KVM: x86/xen: Don't truncate RAX when handling
 hypercall from protected guest
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

Don't truncate RAX when handling a Xen hypercall for a guest with protected
state, as KVM's ABI is to assume the guest is in 64-bit for such cases
(the guest leaving garbage in 63:32 after a transition to 32-bit mode is
far less likely than 63:32 being necessary to complete the hypercall).

Fixes: b5aead0064f3 ("KVM: x86: Assume a 64-bit hypercall for guests with protected state")
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/xen.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/x86/kvm/xen.c b/arch/x86/kvm/xen.c
index 6d9be74bb673..895095dc684e 100644
--- a/arch/x86/kvm/xen.c
+++ b/arch/x86/kvm/xen.c
@@ -1678,15 +1678,14 @@ int kvm_xen_hypercall(struct kvm_vcpu *vcpu)
 	bool handled = false;
 	u8 cpl;
 
-	input = (u64)kvm_register_read(vcpu, VCPU_REGS_RAX);
-
 	/* Hyper-V hypercalls get bit 31 set in EAX */
-	if ((input & 0x80000000) &&
+	if ((kvm_rax_read(vcpu) & 0x80000000) &&
 	    kvm_hv_hypercall_enabled(vcpu))
 		return kvm_hv_hypercall(vcpu);
 
 	longmode = is_64_bit_hypercall(vcpu);
 	if (!longmode) {
+		input = (u32)kvm_rax_read(vcpu);
 		params[0] = (u32)kvm_rbx_read(vcpu);
 		params[1] = (u32)kvm_rcx_read(vcpu);
 		params[2] = (u32)kvm_rdx_read(vcpu);
@@ -1696,6 +1695,7 @@ int kvm_xen_hypercall(struct kvm_vcpu *vcpu)
 	}
 	else {
 #ifdef CONFIG_X86_64
+		input = (u64)kvm_rax_read(vcpu);
 		params[0] = (u64)kvm_rdi_read(vcpu);
 		params[1] = (u64)kvm_rsi_read(vcpu);
 		params[2] = (u64)kvm_rdx_read(vcpu);
-- 
2.54.0.563.g4f69b47b94-goog

