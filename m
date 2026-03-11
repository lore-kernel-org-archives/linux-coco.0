Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0ED536C5AC
	for <linux-coco@lists.linux.dev>; Wed, 11 Mar 2026 00:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773189249; cv=none; b=XYaWiva5umt/UcNQZ8fBPttKDxjUnMa4FVOEZ9neLTt+x6NPa1Q1+9mS7rzKVpZspPkW1aTPrhZteI6oRulyX8krLBK0q/4+CI8CdgtTa0OAmgUkkHz1NlChdNJGWzZGIGaTdeBCHAp6Blbs3TiFy/uX7XqplcjfiqRGAjuce/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773189249; c=relaxed/simple;
	bh=W2LGyNZqQX/c9RYXmz11edzdl9owhvE9aNORh+BHn+A=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ROiw2TlM5c9TUMCRm33XmmwLMTpWEGKTbFiZf25ykK6bBkoJDfDWdkWfADkXvV/glz7IfrPdWSMnPEy0QsV91wU2voqB5aF9TQXuSUm5gWHi3F64Ng/+MfYzL+5qG29Lvuu+Cw22zFETRiF9ZeeX9qlclBTexzdwQRVYpoY5j60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PP4nU+HA; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PP4nU+HA"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-35984ef203bso10097812a91.3
        for <linux-coco@lists.linux.dev>; Tue, 10 Mar 2026 17:34:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773189245; x=1773794045; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=grOoDbAKPnsQ3mUYsQ7jw3YaC9t9ar7i6eOQ/Hn0Uzs=;
        b=PP4nU+HAUC/djSbrurQ1B2DW4dMDD3MDy9WC69/7qV8GY8jvkDb6glvV1imjaY3MSy
         4kyt53SKIjW7Xa49X23gdYNlTZbmnuKaTIfH7bF8Qkmd3VYRQ8S8zNWKUAxeMKRXN/gE
         Ypp96FClNRvVzz9JsWsuibnRxvE8q/VL49FpvQqUHD8eybf2N6PTKoCInCxQsuPS+bdU
         WI2BS0DkSfEKCr3+TWjGbYb+U6VBmXj6UY/SobGDBjjui5qFp+mVqIG93i3PIiG17Lxr
         MOEiWYZck8I857McPWj/Z73f6EVzeXv73t3RHIv43qjfSzHEUcGJ4aacpqv6w11FrBYo
         kPSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773189245; x=1773794045;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=grOoDbAKPnsQ3mUYsQ7jw3YaC9t9ar7i6eOQ/Hn0Uzs=;
        b=Z+7Y/vlew4CjxPYu9FfUlW6FQ2GNMd375Nszqcgl/VyBMre2pFfbNrfqIsDL8qA+OS
         m25nLjPEUr1oX4ziHKML69brpjeTy8AJhGIolN2183QJLu7V/Ii3DTJvqYk/gR53DBov
         XKdqP0UR2rixEBgUBBPtE/l3wVY6V8CklHYR9lm2s4q17qFiGec+R3r8E1jJkS4v1FNP
         mZ2BePvs250+YSX8QgEbhIuL0/pe+mj7+F0ojPWW5d66pBB6QePJAEz5dlYoiLkHg7Hx
         NzbIa6cHq1rL47mRI/TLKKuRb5yIzhw8dYTpyNEgf2NckoCqUmZLkEy6ejQOlm8Bxdkp
         uHlw==
X-Forwarded-Encrypted: i=1; AJvYcCWi2y4MwVNwujV7bgWEGrxX0StEr/WAw3DHNpwjx3hbcxYb6lVQvmi2sCI1uxBqahGupfT5YEGgmXJK@lists.linux.dev
X-Gm-Message-State: AOJu0YzzvADfUUH5tT2k0Tw4tINji38dLZFy/ltNh7Tm4w7Fhnnl4sn2
	6aF7EQMWST+58kuvKoTiV6fMF0P/r9QNcwm+xoC4PBCid0vwcD6n5cDchOWYuIQvU0jZVAJG2Nf
	pf6pf2g==
X-Received: from pjam23.prod.google.com ([2002:a17:90a:1597:b0:359:9051:f779])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1642:b0:359:94d8:34e7
 with SMTP id 98e67ed59e1d1-35a01367b6amr697319a91.32.1773189245076; Tue, 10
 Mar 2026 17:34:05 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Tue, 10 Mar 2026 17:33:45 -0700
In-Reply-To: <20260311003346.2626238-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260311003346.2626238-1-seanjc@google.com>
X-Mailer: git-send-email 2.53.0.473.g4a7958ca14-goog
Message-ID: <20260311003346.2626238-7-seanjc@google.com>
Subject: [PATCH 6/7] KVM: x86: Use a proper bitmap for tracking
 available/dirty registers
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Kiryl Shutsemau <kas@kernel.org>
Cc: kvm@vger.kernel.org, x86@kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, "Chang S . Bae" <chang.seok.bae@intel.com>
Content-Type: text/plain; charset="UTF-8"

Define regs_{avail,dirty} as bitmaps instead of U32s to harden against
overflow, and to allow for dynamically sizing the bitmaps when APX comes
along, which will add 16 more GPRs (R16-R31) and thus increase the total
number of registers beyond 32.

Open code writes in the "reset" APIs, as the writes are hot paths and
bitmap_write() is complete overkill for what KVM needs.  Even better,
hardcoding writes to entry '0' in the array is a perfect excuse to assert
that the array contains exactly one entry, e.g. to effectively add guard
against defining R16-R31 in 32-bit kernels.

For all intents and purposes, no functional change intended even though
using bitmap_fill() will mean "undefined" registers are no longer marked
available and dirty (KVM should never be querying those bits).

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/include/asm/kvm_host.h |  6 ++++--
 arch/x86/kvm/kvm_cache_regs.h   | 21 +++++++++++++--------
 arch/x86/kvm/x86.c              |  4 ++--
 3 files changed, 19 insertions(+), 12 deletions(-)

diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index 734c2eee58e0..cff9023f12c7 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -211,6 +211,8 @@ enum kvm_reg {
 	VCPU_REG_SEGMENTS,
 	VCPU_REG_EXIT_INFO_1,
 	VCPU_REG_EXIT_INFO_2,
+
+	NR_VCPU_TOTAL_REGS,
 };
 
 enum {
@@ -802,8 +804,8 @@ struct kvm_vcpu_arch {
 	 */
 	unsigned long regs[NR_VCPU_GENERAL_PURPOSE_REGS];
 	unsigned long rip;
-	unsigned long regs_avail;
-	unsigned long regs_dirty;
+	DECLARE_BITMAP(regs_avail, NR_VCPU_TOTAL_REGS);
+	DECLARE_BITMAP(regs_dirty, NR_VCPU_TOTAL_REGS);
 
 	unsigned long cr0;
 	unsigned long cr0_guest_owned_bits;
diff --git a/arch/x86/kvm/kvm_cache_regs.h b/arch/x86/kvm/kvm_cache_regs.h
index 5de6c7dfd63b..782710829608 100644
--- a/arch/x86/kvm/kvm_cache_regs.h
+++ b/arch/x86/kvm/kvm_cache_regs.h
@@ -67,29 +67,29 @@ static inline bool kvm_register_is_available(struct kvm_vcpu *vcpu,
 					     enum kvm_reg reg)
 {
 	kvm_assert_register_caching_allowed(vcpu);
-	return test_bit(reg, (unsigned long *)&vcpu->arch.regs_avail);
+	return test_bit(reg, vcpu->arch.regs_avail);
 }
 
 static inline bool kvm_register_is_dirty(struct kvm_vcpu *vcpu,
 					 enum kvm_reg reg)
 {
 	kvm_assert_register_caching_allowed(vcpu);
-	return test_bit(reg, (unsigned long *)&vcpu->arch.regs_dirty);
+	return test_bit(reg, vcpu->arch.regs_dirty);
 }
 
 static inline void kvm_register_mark_available(struct kvm_vcpu *vcpu,
 					       enum kvm_reg reg)
 {
 	kvm_assert_register_caching_allowed(vcpu);
-	__set_bit(reg, (unsigned long *)&vcpu->arch.regs_avail);
+	__set_bit(reg, vcpu->arch.regs_avail);
 }
 
 static inline void kvm_register_mark_dirty(struct kvm_vcpu *vcpu,
 					   enum kvm_reg reg)
 {
 	kvm_assert_register_caching_allowed(vcpu);
-	__set_bit(reg, (unsigned long *)&vcpu->arch.regs_avail);
-	__set_bit(reg, (unsigned long *)&vcpu->arch.regs_dirty);
+	__set_bit(reg, vcpu->arch.regs_avail);
+	__set_bit(reg, vcpu->arch.regs_dirty);
 }
 
 /*
@@ -102,12 +102,15 @@ static __always_inline bool kvm_register_test_and_mark_available(struct kvm_vcpu
 								 enum kvm_reg reg)
 {
 	kvm_assert_register_caching_allowed(vcpu);
-	return arch___test_and_set_bit(reg, (unsigned long *)&vcpu->arch.regs_avail);
+	return arch___test_and_set_bit(reg, vcpu->arch.regs_avail);
 }
 
 static __always_inline void kvm_reset_available_registers(struct kvm_vcpu *vcpu,
 							  unsigned long available_mask)
 {
+	BUILD_BUG_ON(sizeof(available_mask) != sizeof(vcpu->arch.regs_avail[0]));
+	BUILD_BUG_ON(ARRAY_SIZE(vcpu->arch.regs_avail) != 1);
+
 	/*
 	 * Note the bitwise-AND!  In practice, a straight write would also work
 	 * as KVM initializes the mask to all ones and never clears registers
@@ -115,13 +118,15 @@ static __always_inline void kvm_reset_available_registers(struct kvm_vcpu *vcpu,
 	 * sanity checking as incorrectly marking an eagerly sync'd register
 	 * unavailable will generate a WARN due to an unexpected cache request.
 	 */
-	vcpu->arch.regs_avail &= available_mask;
+	vcpu->arch.regs_avail[0] &= available_mask;
 }
 
 static __always_inline void kvm_reset_dirty_registers(struct kvm_vcpu *vcpu,
 						      unsigned long dirty_mask)
 {
-	vcpu->arch.regs_dirty = dirty_mask;
+	BUILD_BUG_ON(sizeof(dirty_mask) != sizeof(vcpu->arch.regs_dirty[0]));
+	BUILD_BUG_ON(ARRAY_SIZE(vcpu->arch.regs_dirty) != 1);
+	vcpu->arch.regs_dirty[0] = dirty_mask;
 }
 
 /*
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index dd39ccbff0d6..c1e1b3030786 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -12809,8 +12809,8 @@ int kvm_arch_vcpu_create(struct kvm_vcpu *vcpu)
 	int r;
 
 	vcpu->arch.last_vmentry_cpu = -1;
-	vcpu->arch.regs_avail = ~0;
-	vcpu->arch.regs_dirty = ~0;
+	bitmap_fill(vcpu->arch.regs_avail, NR_VCPU_TOTAL_REGS);
+	bitmap_fill(vcpu->arch.regs_dirty, NR_VCPU_TOTAL_REGS);
 
 	kvm_gpc_init(&vcpu->arch.pv_time, vcpu->kvm);
 
-- 
2.53.0.473.g4a7958ca14-goog

