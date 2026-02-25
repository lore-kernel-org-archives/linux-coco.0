Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA8FF284884
	for <linux-coco@lists.linux.dev>; Wed, 25 Feb 2026 01:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771982479; cv=none; b=ebu5siIC7HpZhmvkm3a+Y5j2cxRlE6O1FnfuNrRQYX4mooomwQwQTqnG+j+C7rvDB2GkSMbp5Fh1vLkgx2ntiLlR6aQxJCSdGhcNf3e1DYt/vKdSJsZN4TgyL5A/A43p12kdV6BfxCD8Sg5pUrytWHPm6wmy0Ge+vWeHc2jtvk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771982479; c=relaxed/simple;
	bh=Qy31+uRAyXc552YjYjFbiMoMOXbW3e9UP2BZgteKHMs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=jPqymI8tv3vH9lc2SP80DX1vLl4LhawaN/FBHLmFbpW9AH6M8tjMWZ4AiTu1FL4xuiq0Y/FzoKmHEzAIk3auLb8XRAnRmf2vlWANOAoPJ5iYj2KTkN3GntRJoz28dRCjp8Pm477+JAgyjQXrFYUYdyvp51jDjvuYCQjFyQYptbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SFUvF7lI; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SFUvF7lI"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-c6e78c4aa50so3920775a12.0
        for <linux-coco@lists.linux.dev>; Tue, 24 Feb 2026 17:21:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771982477; x=1772587277; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=LC9/uqgNjMKR3Pk2VQH/jaz/lG7goMkRYlbLKdqdUyY=;
        b=SFUvF7lIPaAmO4WlYO9+ohR0Nt9Oev+lWA9hnD6dgeYhARolaMYQi6goEBj5pPVNXH
         f0yI/aX3rqFZ246hLDzPftD7n8FeATPlV2tYnJetMxIlSg63/NxtQNiimLXAO69agb2K
         DEOMC8jIgnJsuuvCb0LhiFPuw2g66SKCQz4+X2ghQJZYwhadNyicoDtr55/6UaQlM+ii
         UWV8R5blvScX3tvQj0FKKk6PO5axhIVh5X9Lw+EkcVUlb8VYljYbO6MF5/07a5fqLuOb
         zhjnKNHqXa8nWcu7hbpwJtx6F4FH83zOcdQi07Il2EyjKQHu4qucNe00N3dc05U30jQx
         l5kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771982477; x=1772587277;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LC9/uqgNjMKR3Pk2VQH/jaz/lG7goMkRYlbLKdqdUyY=;
        b=U7FssfK10hDZYS4Q1j7Hw0ug2xkvT6wCll8RNMUMxAwBh/FKU9+izI4gD7teiszVS2
         FYPWmuZ3ZW3VrN1apDgedu+xj0aLdZgegM0RUy8SUQIppJ9PQIZ5gvKO4nIYe5t3/3yS
         vsredJw8BWWjHnOoLL9ikoZBOrev+MB6130pIIxygxCrbnn5NZRJrn+gp8BPPk+qdbKw
         oe+P/hnSR4a+4mFFVt0w5qaE0tFr3VS3DsLIVo9IFJQ9EoF0zQ6Su4vTsRFbVoxem1hD
         HUeb4vq+l2lagUlwdau9T3zus61YJ2amp9BZdGUUlA417yQlpfDb4lElfpi6NgePffdO
         NeRg==
X-Forwarded-Encrypted: i=1; AJvYcCUIECLekbJKtL18C/Vy+YU1WFHuuvqzwH3O8GxBCwhiXUB/AGknWfO0kvq9KLBAgWKM8RiV3em14G0k@lists.linux.dev
X-Gm-Message-State: AOJu0Ywv3KESylka1zxsw5KeAeMA8AptrgjMlSii24b8+7Y17/MSy7ek
	nRwP5ZAMT3GomXGqq2EAGXsJfXZtS1B9E9+u2ujaQkxO5PNdIf9EQ+1OQho4P5FT+T4bBVxcIuz
	lj8A4pA==
X-Received: from pgbcz10.prod.google.com ([2002:a05:6a02:230a:b0:c6d:cb1b:286e])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:6a04:b0:394:8455:d1a9
 with SMTP id adf61e73a8af0-39545e5081dmr10146147637.2.1771982476785; Tue, 24
 Feb 2026 17:21:16 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Tue, 24 Feb 2026 17:20:48 -0800
In-Reply-To: <20260225012049.920665-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260225012049.920665-1-seanjc@google.com>
X-Mailer: git-send-email 2.53.0.414.gf7e9f6c205-goog
Message-ID: <20260225012049.920665-14-seanjc@google.com>
Subject: [PATCH 13/14] KVM: x86: Don't panic the kernel if completing
 userspace I/O / MMIO goes sideways
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Kiryl Shutsemau <kas@kernel.org>
Cc: kvm@vger.kernel.org, x86@kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Yashu Zhang <zhangjiaji1@huawei.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Binbin Wu <binbin.wu@linux.intel.com>, 
	Xiaoyao Li <xiaoyao.li@intel.com>, Tom Lendacky <thomas.lendacky@amd.com>, 
	Michael Roth <michael.roth@amd.com>
Content-Type: text/plain; charset="UTF-8"

Kill the VM instead of the host kernel if KVM botches I/O and/or MMIO
handling.  There is zero danger to the host or guest, i.e. panicking the
host isn't remotely justified.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/x86.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index f3e2ec7e1828..5376b370b4db 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -9710,7 +9710,8 @@ static int complete_fast_pio_in(struct kvm_vcpu *vcpu)
 	unsigned long val;
 
 	/* We should only ever be called with arch.pio.count equal to 1 */
-	BUG_ON(vcpu->arch.pio.count != 1);
+	if (KVM_BUG_ON(vcpu->arch.pio.count != 1, vcpu->kvm))
+		return -EIO;
 
 	if (unlikely(!kvm_is_linear_rip(vcpu, vcpu->arch.cui_linear_rip))) {
 		vcpu->arch.pio.count = 0;
@@ -11820,7 +11821,8 @@ static inline int complete_emulated_io(struct kvm_vcpu *vcpu)
 
 static int complete_emulated_pio(struct kvm_vcpu *vcpu)
 {
-	BUG_ON(!vcpu->arch.pio.count);
+	if (KVM_BUG_ON(!vcpu->arch.pio.count, vcpu->kvm))
+		return -EIO;
 
 	return complete_emulated_io(vcpu);
 }
@@ -11849,7 +11851,8 @@ static int complete_emulated_mmio(struct kvm_vcpu *vcpu)
 	struct kvm_mmio_fragment *frag;
 	unsigned len;
 
-	BUG_ON(!vcpu->mmio_needed);
+	if (KVM_BUG_ON(!vcpu->mmio_needed, vcpu->kvm))
+		return -EIO;
 
 	/* Complete previous fragment */
 	frag = &vcpu->mmio_fragments[vcpu->mmio_cur_fragment];
@@ -14262,7 +14265,8 @@ static int complete_sev_es_emulated_mmio(struct kvm_vcpu *vcpu)
 	struct kvm_mmio_fragment *frag;
 	unsigned int len;
 
-	BUG_ON(!vcpu->mmio_needed);
+	if (KVM_BUG_ON(!vcpu->mmio_needed, vcpu->kvm))
+		return -EIO;
 
 	/* Complete previous fragment */
 	frag = &vcpu->mmio_fragments[vcpu->mmio_cur_fragment];
-- 
2.53.0.414.gf7e9f6c205-goog

