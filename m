Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B90D63D16FD
	for <linux-coco@lists.linux.dev>; Thu, 14 May 2026 21:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778795648; cv=none; b=kJX5mz/xzdz7/4M0NiUHu2Oy1Yn9idCwOh71iV28ycjHQ23USpxrdvdAveYzQnrynvJUNUCbl6qS1hNMMKKluB7VpFK7lC38qS2iiaR0eVvjtDr0e82LSzmudbD1GOCZzZyiMldppCIrowZiM/dj8YhEZsBmBhYb+FsrxNa8Q3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778795648; c=relaxed/simple;
	bh=dTA/3VR9EH1sMFnfWIiA6Io9L1zUxuNockTCKHiOFxY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Cz3lQiYOZtw/mCx59fLQrSszqcj7wbp7SUjnAgNwYQCL8EDgb1yE2a/GHlDEt2EFS2QDcLgFy6vPMQ9ZRPI+Bld9bUcZCApSeS+fjcEPkoJD8JrI/Dc+VyoNoCAfuQlncSGYshvQtCgembfHBTXjSmGXF+8UD9EwvUyK7AznNug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=I/LnPRNb; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="I/LnPRNb"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2bd5b20aaa6so13346595ad.2
        for <linux-coco@lists.linux.dev>; Thu, 14 May 2026 14:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778795643; x=1779400443; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=9oYhOatBSTmYuzHR8azx31RA/Ba7pTesr7fCEDkJz5c=;
        b=I/LnPRNbDkk83yG+7foOc18D3eG81M8QtxRKbW1Tu9C1R913UO5E0f6ylr++kdUYH6
         r0QHXhqf5ig0gaNpRcgr3VkD4W+Uoju5/MQgTTjKJ2U9JzeEV4QExJ3Cz9E/1Ldt6iNW
         +pg3RtT+7/ODbqKlSJG9LMIPgptul9J75LIfBlChJKXczIK7SJoRQtrC3h7con7kuEYH
         Uu4VkdoWgBSIIROQqGuZ9eXKHcsK+Y1/5P90C8DVUrRki1pxVhN2A1neJ7aojodtfOGg
         nMZZ4CkBE/5vTxOVet1Z144KNjL3ywS/UfFc/ugE55R8UEbCHsMWYKVHWSiXu7e90lB4
         /57w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778795643; x=1779400443;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9oYhOatBSTmYuzHR8azx31RA/Ba7pTesr7fCEDkJz5c=;
        b=ZDE+1yZCYVfNyp0aopSRWYA5W1sWwQMQ43vzLKamv84bY8Sq1lbxLVuQcvQeCSO4ib
         UCc7ltfagQoSIR9uNco/i5xZF07DokOSoD86SWRrb0kpX4sHptRiNWDZHzqs5WI3P1kl
         0uNauqzeGhl2blyYDzTecYxJCY7FdeQ8Q2dlqv3Xv+iMrzyu5kgaeBr0N3M2oegKI3hD
         QIVkE98QCGkVbMtaC0WtdESQG9XtNCe0Sv6Be+c43bfyPoaUSr/vFXS8xjeYQHbteUsw
         bx0qbqQjNhmEOtg3qR3JwFF0jh2ofHMzj7iOvKDbdI1Ozk7CJEg2lQ1Rh5hf66AQYRWk
         RZ8A==
X-Forwarded-Encrypted: i=1; AFNElJ9uw3FKRe1iT9nCQccxXdLUvyU16vxYLvoCSMAGXcCFtVngp91u80/ME1HE3Mu77/c1LiegJO6jYE0z@lists.linux.dev
X-Gm-Message-State: AOJu0Yw4gIQ2x6Y4c7WE6leh6AC0KEr2LzvkKxzEcQJTjV0kvIxk3nG0
	Iz3ckWLbxmI/s8AJzrM8/WHI89OjM9tMs7hNh1Wu6rmsR7FMzZ50WOZF7NshmmC5aM3eeZy71uf
	uUw8/AQ==
X-Received: from pgbdn13.prod.google.com ([2002:a05:6a02:e0d:b0:c82:7498:e3b5])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:244d:b0:3b1:884a:c3d5
 with SMTP id adf61e73a8af0-3b22ebd8ce1mr963273637.24.1778795642494; Thu, 14
 May 2026 14:54:02 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 14 May 2026 14:53:45 -0700
In-Reply-To: <20260514215355.1648463-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260514215355.1648463-1-seanjc@google.com>
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
Message-ID: <20260514215355.1648463-6-seanjc@google.com>
Subject: [PATCH v2 05/15] KVM: x86: Trace hypercall register *after*
 truncating values for 32-bit
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

When tracing hypercalls, invoke the tracepoint *after* truncating the
register values for 32-bit guests so as not to record unused garbage (in
the extremely unlikely scenario that the guest left garbage in a register
after transitioning from 64-bit mode to 32-bit mode).

Fixes: 229456fc34b1 ("KVM: convert custom marker based tracing to event traces")
Reviewed-by: Yosry Ahmed <yosry@kernel.org>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/x86.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 209eae67ab18..23b3957b9ae0 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -10430,8 +10430,6 @@ int ____kvm_emulate_hypercall(struct kvm_vcpu *vcpu, int cpl,
 
 	++vcpu->stat.hypercalls;
 
-	trace_kvm_hypercall(nr, a0, a1, a2, a3);
-
 	if (!op_64_bit) {
 		nr &= 0xFFFFFFFF;
 		a0 &= 0xFFFFFFFF;
@@ -10440,6 +10438,8 @@ int ____kvm_emulate_hypercall(struct kvm_vcpu *vcpu, int cpl,
 		a3 &= 0xFFFFFFFF;
 	}
 
+	trace_kvm_hypercall(nr, a0, a1, a2, a3);
+
 	if (cpl) {
 		ret = -KVM_EPERM;
 		goto out;
-- 
2.54.0.563.g4f69b47b94-goog

