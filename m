Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEE9A263C7F
	for <linux-coco@lists.linux.dev>; Wed, 25 Feb 2026 01:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771982458; cv=none; b=YlEYNcQzyeJ5+pzI+9S5xGBFYtD0jbsYQy4oNJFz4IyrvEuH+1DqBkKDYWOmnZI+xVbJyKMH0fnf/Eu9XDwerA/YCuYNjVdqnbF3Rvbbou9X9GjIddWMbPuP6tE6ia+T4HvqoAccWQJaq6Kg18asWIXdPO7Wr4uM/RVJ7MY3GUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771982458; c=relaxed/simple;
	bh=ueMQ7lNZG1mNPcnmXsV6s6mz7PApwRZnhIghYU/HyV0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=jCHY5dlzk5lC5++4dfWWV3jiAUPaNpZKgPnrz/ud9R1ryxN3mfi8LfMUwBflxkFGWMDQG+hSjFZI+8TJ2wnUBGCcmVAaOMxuRm9+O+NaVhIp+ZiWjindokrRNLrSu03xmZ3qn3NdsyoAMCgct+zHlbQKvbVtARUvtFgQCdegLKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=w0AcMZ9J; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="w0AcMZ9J"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-358e425c261so1340445a91.3
        for <linux-coco@lists.linux.dev>; Tue, 24 Feb 2026 17:20:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771982455; x=1772587255; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=ufrjZKfuPvWxhnZ9cZ27jbL/GsnZnbCcINCZtRWeedI=;
        b=w0AcMZ9Jdmb3VU+FFsMQzwBdYzyTllNfaRMZ2qs4pPFaHSz/kVnKYLFKNVr0t0Y+uy
         byKeC/fzEQJCR1Y5mOMu9y3TSUhHpF6fAUDrrdyTC6lZularKk9bw3swzkRx8WC3amP6
         2J6rEPYkB1N4FKeQVEekHPDQKjjJZ2a6CpUfwRNDC6PIvuhc0wiC8vX3cZBMYLDlxpfV
         tmLH9wsdo/4mF+3KF4RD8KvTUskOXtNvy/dBu3EcSJAATirbw3PANm2tM5n0itGK8NNP
         1AEofdLiF5QcPQ698xWIb/xi1omaglAkBH8V71n2b1H2TGEuVNtnrs1mNcWj/3PVaoLL
         e59g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771982455; x=1772587255;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ufrjZKfuPvWxhnZ9cZ27jbL/GsnZnbCcINCZtRWeedI=;
        b=FR4iOMezybmU2Wp/j+tpMUDH0VrCFgWYve4LyK/J0FC8ha3KN7NnUlxP0hmZzO2WJ+
         w9rySfVLPKYPHeW5kwkf2SxHM+76XSUzRCnikZziquT2LXgtH2pD3Jdr6x91I0d3fLTP
         sNVPyQ8LhVJWUbB3PtYW3+JJoihnTkehWPvizKF6qUTnUMr93DQC+RcvsP9z/QyafN5o
         ShGJ8Y+KHmRg2KSFkcn08068Dv6fYLt1PaYYlWZCTHt9JC57Nzk0JrJ6Vavb7wDxyfND
         f99OHKivOFTJdTFEeSSjIQxLfF8LZ20IWXusU1C/ABXeG3Odwvw8anvjWwVLdhJsWfPj
         jEiA==
X-Forwarded-Encrypted: i=1; AJvYcCVMK1jn6uSLC4zwZmNhw2j9mnmpCguY7bQJmddINjP4AsiVHvb1uYEoYfw8mWTuKWdPIDd9YGEAcaDj@lists.linux.dev
X-Gm-Message-State: AOJu0Yw7VoXpFs0cCYaxXmhs9gElhqHbMx7eB9F9j+9Vx5v1bsbXZXqI
	xwMUsbjZiEo/o3fNG5N3ZpjhnG2de15MV8OYbYj++/KyHzp4GKSmFW9F5KhI8s70knmiuMfmr0G
	NMr61iw==
X-Received: from pjyr11.prod.google.com ([2002:a17:90a:e18b:b0:355:76b7:bf7])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:d887:b0:359:120f:d3aa
 with SMTP id 98e67ed59e1d1-359120fd628mr174902a91.14.1771982455286; Tue, 24
 Feb 2026 17:20:55 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Tue, 24 Feb 2026 17:20:37 -0800
In-Reply-To: <20260225012049.920665-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260225012049.920665-1-seanjc@google.com>
X-Mailer: git-send-email 2.53.0.414.gf7e9f6c205-goog
Message-ID: <20260225012049.920665-3-seanjc@google.com>
Subject: [PATCH 02/14] KVM: x86: Open code handling of completed MMIO reads in emulator_read_write()
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Kiryl Shutsemau <kas@kernel.org>
Cc: kvm@vger.kernel.org, x86@kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Yashu Zhang <zhangjiaji1@huawei.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Binbin Wu <binbin.wu@linux.intel.com>, 
	Xiaoyao Li <xiaoyao.li@intel.com>, Tom Lendacky <thomas.lendacky@amd.com>, 
	Michael Roth <michael.roth@amd.com>
Content-Type: text/plain; charset="UTF-8"

Open code the handling of completed MMIO reads instead of using an ops
hook, as burying the logic behind a (likely RETPOLINE'd) indirect call,
and with an unintuitive name, makes relatively straightforward code hard
to comprehend.

Opportunistically add comments to explain the dependencies between the
emulator's mem_read cache and the MMIO read completion logic, as it's very
easy to overlook the cache's role in getting the read data into the
correct destination.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/emulate.c | 13 +++++++++++++
 arch/x86/kvm/x86.c     | 33 ++++++++++++++++-----------------
 2 files changed, 29 insertions(+), 17 deletions(-)

diff --git a/arch/x86/kvm/emulate.c b/arch/x86/kvm/emulate.c
index c8e292e9a24d..70850e591350 100644
--- a/arch/x86/kvm/emulate.c
+++ b/arch/x86/kvm/emulate.c
@@ -1297,12 +1297,25 @@ static int read_emulated(struct x86_emulate_ctxt *ctxt,
 	int rc;
 	struct read_cache *mc = &ctxt->mem_read;
 
+	/*
+	 * If the read gets a cache hit, simply copy the value from the cache.
+	 * A "hit" here means that there is unused data in the cache, i.e. when
+	 * re-emulating an instruction to complete a userspace exit, KVM relies
+	 * on "no decode" to ensure the instruction is re-emulated in the same
+	 * sequence, so that multiple reads are fulfilled in the correct order.
+	 */
 	if (mc->pos < mc->end)
 		goto read_cached;
 
 	if (KVM_EMULATOR_BUG_ON((mc->end + size) >= sizeof(mc->data), ctxt))
 		return X86EMUL_UNHANDLEABLE;
 
+	/*
+	 * Route all reads to the cache.  This allows @dest to be an on-stack
+	 * variable without triggering use-after-free if KVM needs to exit to
+	 * userspace to handle an MMIO read (the MMIO fragment will point at
+	 * the current location in the cache).
+	 */
 	rc = ctxt->ops->read_emulated(ctxt, addr, mc->data + mc->end, size,
 				      &ctxt->exception);
 	if (rc != X86EMUL_CONTINUE)
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index ff3a6f86973f..8b1f02cc8196 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -8109,8 +8109,6 @@ int emulator_write_phys(struct kvm_vcpu *vcpu, gpa_t gpa,
 }
 
 struct read_write_emulator_ops {
-	int (*read_write_prepare)(struct kvm_vcpu *vcpu, void *val,
-				  int bytes);
 	int (*read_write_emulate)(struct kvm_vcpu *vcpu, gpa_t gpa,
 				  void *val, int bytes);
 	int (*read_write_mmio)(struct kvm_vcpu *vcpu, gpa_t gpa,
@@ -8120,18 +8118,6 @@ struct read_write_emulator_ops {
 	bool write;
 };
 
-static int read_prepare(struct kvm_vcpu *vcpu, void *val, int bytes)
-{
-	if (vcpu->mmio_read_completed) {
-		trace_kvm_mmio(KVM_TRACE_MMIO_READ, bytes,
-			       vcpu->mmio_fragments[0].gpa, val);
-		vcpu->mmio_read_completed = 0;
-		return 1;
-	}
-
-	return 0;
-}
-
 static int read_emulate(struct kvm_vcpu *vcpu, gpa_t gpa,
 			void *val, int bytes)
 {
@@ -8167,7 +8153,6 @@ static int write_exit_mmio(struct kvm_vcpu *vcpu, gpa_t gpa,
 }
 
 static const struct read_write_emulator_ops read_emultor = {
-	.read_write_prepare = read_prepare,
 	.read_write_emulate = read_emulate,
 	.read_write_mmio = vcpu_mmio_read,
 	.read_write_exit_mmio = read_exit_mmio,
@@ -8250,9 +8235,23 @@ static int emulator_read_write(struct x86_emulate_ctxt *ctxt,
 	if (WARN_ON_ONCE((bytes > 8u || !ops->write) && object_is_on_stack(val)))
 		return X86EMUL_UNHANDLEABLE;
 
-	if (ops->read_write_prepare &&
-		  ops->read_write_prepare(vcpu, val, bytes))
+	/*
+	 * If the read was already completed via a userspace MMIO exit, there's
+	 * nothing left to do except trace the MMIO read.  When completing MMIO
+	 * reads, KVM re-emulates the instruction to propagate the value into
+	 * the correct destination, e.g. into the correct register, but the
+	 * value itself has already been copied to the read cache.
+	 *
+	 * Note!  This is *tightly* coupled to read_emulated() satisfying reads
+	 * from the emulator's mem_read cache, so that the MMIO fragment data
+	 * is copied to the correct chunk of the correct operand.
+	 */
+	if (!ops->write && vcpu->mmio_read_completed) {
+		trace_kvm_mmio(KVM_TRACE_MMIO_READ, bytes,
+			       vcpu->mmio_fragments[0].gpa, val);
+		vcpu->mmio_read_completed = 0;
 		return X86EMUL_CONTINUE;
+	}
 
 	vcpu->mmio_nr_fragments = 0;
 
-- 
2.53.0.414.gf7e9f6c205-goog

