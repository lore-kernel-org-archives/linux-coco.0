Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F4D93D1711
	for <linux-coco@lists.linux.dev>; Thu, 14 May 2026 21:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778795652; cv=none; b=hrA3BqjD0C4Tjcsx3F+yIfFDmkjmCx06eHHffDLeThgmH7khSl8vG08/v79DviFe3lvgPo/S46WwT7CKWxnh4a6LRS9T6LpBKSQb7jLRtfYJt5dpmSIQ4sG9mVB+BSpwY96Z6klbtuN166XNBqOIWB/ko4DYqK4/3VvkKdlhEy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778795652; c=relaxed/simple;
	bh=kPzayqgTX4AYKj05HSSQLjERNpIEzXUE+TYLElLBau0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=s8L10ToJzO4lm49mtPzRMUvFIWN0C8swKSg8JdoHH3hKlEvCV40tEVkYQpXaoHoEyEPId5MCTy4jT4pQrQCI0hEmTmMaG79A6CukknPh7RbkmH/Xldt0dvAHkaeTZ7SeUVzogA6PIvzbNAdwz6ElONIo3oUHaEI384oaxBv4Oh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=plHH/Or4; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="plHH/Or4"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-c82c84be9c3so341476a12.0
        for <linux-coco@lists.linux.dev>; Thu, 14 May 2026 14:54:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778795650; x=1779400450; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=LhpTli2hbTyfQzA9vyBgyGyJFOk8w+Rac8Zy54UhAOk=;
        b=plHH/Or4oolcvoMcYO0aqqG2WyyTBrfFJUChtA8CcqGZc7OUXixU6ZLI4YWQkxQ2hl
         eJsO7C3eKsMPaXzgH9uy0pa6mimRBvbtGYv0fMePYZ11HJexn9iws/fDl+7TyG+idhN5
         XmMTpg5Xx5azxdwWoxrdrm18/jDYuyfyDH71/zKqKqST9on/wRvKvbrpwIn6u+m7c9oE
         Rb1g3/A8q3T4ek7Rp84rTikc1ah46TD8Yf07qvu/QSY5FAT9DIUJ0J2wJdRQHfcmCi3M
         xo6vQRONQPZtK85MQGdNTIryQNUXyO+e+4wqhMnqywnRpZk0HPB3+itWVbdodx3zUSsN
         EIGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778795650; x=1779400450;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LhpTli2hbTyfQzA9vyBgyGyJFOk8w+Rac8Zy54UhAOk=;
        b=K4wDBazhennIzat/IdM/DvGLUyYuck4L+sZAdyGr+VXSuy3ubuJoKUqRUEKjGXsdRJ
         AXdsZO7nrPKXm0dUu+4uwJIrm6r1Vg0WBE3enRG/fkJnPNEbossvTGfQuMFGjlYBtQd4
         GZOGOPcIa21cFU4t9Ae2wwvmldFODpGEMNiNhfkuQBkuS4Z6zW16WEz0l1ib6VRmHWBa
         tqZIjAHxvFXy0yV2F1HKfm/2+xZScrJRYm5YlG2MPiNcqkyKmNtu+vCCEC1eNDmOIYMB
         M/t1iuFeipjEKbUpW5YT2jy4a7nX8wIOqq8O/5jCG0K7PXpjtf19n6RROV7CNjH8ceTB
         mmWw==
X-Forwarded-Encrypted: i=1; AFNElJ+xsh9pxlU2gz5BRja1Pd0VEAC1GHl5usTJwaXt4pI51hLLklsgKIaZBFh7PmyiOeXJCyxFWE9vuLaR@lists.linux.dev
X-Gm-Message-State: AOJu0YwgneuTgNPRKHAWisqNrcBfh1wsTb5xsHvN0A4OQ9S8r+IngT3S
	lnNR3KKGdhbgr8sdg8OvrYRIKZGQ91neX9Cpl/XLnexawjIzM81tLWvEykw9fyBIoXq10TlAoc+
	eB1JOgQ==
X-Received: from pfmy21.prod.google.com ([2002:aa7:8055:0:b0:83f:2ce7:48ce])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:1954:b0:835:366f:5da2
 with SMTP id d2e1a72fcca58-83f33d80937mr1240198b3a.37.1778795649298; Thu, 14
 May 2026 14:54:09 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 14 May 2026 14:53:51 -0700
In-Reply-To: <20260514215355.1648463-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260514215355.1648463-1-seanjc@google.com>
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
Message-ID: <20260514215355.1648463-12-seanjc@google.com>
Subject: [PATCH v2 11/15] Revert "KVM: VMX: Read 32-bit GPR values for ENCLS
 instructions outside of 64-bit mode"
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

Now that kvm_<reg>_read() are mode aware, i.e. are functionally equivalent
to kvm_register_read(), revert aback to the less verbose versions.

No functional change intended.

This reverts commit 60919eccf6764c71cef31a1afeaa1a36b8e5ab85.

Acked-by: Kai Huang <kai.huang@intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/sgx.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/x86/kvm/vmx/sgx.c b/arch/x86/kvm/vmx/sgx.c
index 2f5a1c58f3c5..876dc2814108 100644
--- a/arch/x86/kvm/vmx/sgx.c
+++ b/arch/x86/kvm/vmx/sgx.c
@@ -225,8 +225,8 @@ static int handle_encls_ecreate(struct kvm_vcpu *vcpu)
 	struct x86_exception ex;
 	int r;
 
-	if (sgx_get_encls_gva(vcpu, kvm_register_read(vcpu, VCPU_REGS_RBX), 32, 32, &pageinfo_gva) ||
-	    sgx_get_encls_gva(vcpu, kvm_register_read(vcpu, VCPU_REGS_RCX), 4096, 4096, &secs_gva))
+	if (sgx_get_encls_gva(vcpu, kvm_rbx_read(vcpu), 32, 32, &pageinfo_gva) ||
+	    sgx_get_encls_gva(vcpu, kvm_rcx_read(vcpu), 4096, 4096, &secs_gva))
 		return 1;
 
 	/*
@@ -302,9 +302,9 @@ static int handle_encls_einit(struct kvm_vcpu *vcpu)
 	gpa_t sig_gpa, secs_gpa, token_gpa;
 	int ret, trapnr;
 
-	if (sgx_get_encls_gva(vcpu, kvm_register_read(vcpu, VCPU_REGS_RBX), 1808, 4096, &sig_gva) ||
-	    sgx_get_encls_gva(vcpu, kvm_register_read(vcpu, VCPU_REGS_RCX), 4096, 4096, &secs_gva) ||
-	    sgx_get_encls_gva(vcpu, kvm_register_read(vcpu, VCPU_REGS_RDX), 304, 512, &token_gva))
+	if (sgx_get_encls_gva(vcpu, kvm_rbx_read(vcpu), 1808, 4096, &sig_gva) ||
+	    sgx_get_encls_gva(vcpu, kvm_rcx_read(vcpu), 4096, 4096, &secs_gva) ||
+	    sgx_get_encls_gva(vcpu, kvm_rdx_read(vcpu), 304, 512, &token_gva))
 		return 1;
 
 	/*
-- 
2.54.0.563.g4f69b47b94-goog

