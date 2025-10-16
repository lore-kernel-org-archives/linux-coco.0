Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D49872E7197
	for <linux-coco@lists.linux.dev>; Thu, 16 Oct 2025 22:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760653708; cv=none; b=rvMIlRS/aLoH01wNmYKcay7kU0EzRyLMMlPtDpFNT6JxqDjCdEvOMoatvBIz5gHk+g25obJKDBdM1cKfVPbqgC3A+h7SeVM6uBEaX51LlWhUADFO9UO9E0Pq/dAJW1JVzP8M9pqzsUZuDS4kNpxj6w78yLs/6+d31hYsXmG+ogU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760653708; c=relaxed/simple;
	bh=CiIKDZ3tD54lm+dMIg58E0d1ZctLY3/7BjNtbiYBFp8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=gHOQbD13OP3H7a+yQyPm0F2NnwhlhsXg/L6sxnXqKIhy5X5doJk5YOCQAFEcagkVFGAX0EZrv+J9StMxO9DklJjnAUYnsF5LRsJn/8U20o5zGGy+/ksYgCxI52fKtsjWbxN9Wj4GBsldPBrdSVSDXuZPup3Dr6ki40HqMVuinp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RDLK0/c7; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RDLK0/c7"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-33428befc08so2943004a91.2
        for <linux-coco@lists.linux.dev>; Thu, 16 Oct 2025 15:28:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760653706; x=1761258506; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=C7RYKj2bkYamtj/tpY96rNXOI7drHoDq8hs/glpL7oY=;
        b=RDLK0/c7RRCqI0M9BYWglW4s+9ionDclxEyw/88Xs0Iwcaj8r9xZOkv7E+VGMjX3FU
         AMaigboma904iyn6ILZ+iawoqItKZxfXK96yooh9WsDN/d8OLVMwa4xqlO/UPgy5caYN
         XdZNKCIh4/NsSPm19iT4ykXn/FSwfLSU0UvAYAnV8HELVQKoh/N3CRl6sE/LT4vZ+Iy0
         mbjsfTjPLgnjl/echQ7aMtQ4GNzU1HAjrqQ8O2f/6zO+6BoKL7zv6HjPmkwIJib6Zznc
         e/2rPaKCsTwUPGhTrEurnVYCi81dr+xUrfCGci+CgxUPXwyWHBPTJyz7eVJdsBqdCgk5
         APlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760653706; x=1761258506;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C7RYKj2bkYamtj/tpY96rNXOI7drHoDq8hs/glpL7oY=;
        b=KEi52Sp+NFMjpYfwVc/LZ5ONmvKb6He2HxoH++hypQ52ZypPKl3EjNnHATgH9KiInQ
         zUTOuHyw9+9P2K7TLIo69RRg2Y3EhlWYvlZTsd7zQbZYNbB5oerf6gVjCV1ldJT78gDt
         gpHHNmKG99x83nRD/tP8Z16cJ7GnAI9ULeKVJeWnaRWnkevuWDIhBLCrFq7yU7eGC/1A
         yBGqqJ0XTtvYSZ9Q+CGi/Egu62M84b2BhOm5GlWudeGaTwXSMCyRKhKmHq3Zp6BB7vVW
         YXe8iyjG0XLzUxhGZPApPwpQsZnSZLs+Ou0587Qz+yeqicqQktgDiOBE2lJ7pBZUZeUc
         o9jQ==
X-Forwarded-Encrypted: i=1; AJvYcCUcP/jsYxEPyHcAguSvvltkNlwKYzKtGc6euNgQ/ftv2kfuSh8LiZA7IBg8hnteSFvFHjLJQEpeQ6X0@lists.linux.dev
X-Gm-Message-State: AOJu0YzIGM8HOU5134T32LBOVHe6oC4ldcn7oI3M+Dw8YsGPW2bWEHOe
	9q7ZhMFx27uOGaK4I4Zgd/pf+iA9hhmQv9wSL6KLNlbwKSjnL9L55rbdh0B/b53DL4wDpPf2qya
	nTN8jMQ==
X-Google-Smtp-Source: AGHT+IHr7rgfcDHrp89GOkrAJeRqbJYehFtjyPEFfaSBcGteYS74wj9nr9cTOyxVow6+nxcyA3NcfEsIUQE=
X-Received: from pjbpa17.prod.google.com ([2002:a17:90b:2651:b0:33b:51fe:1a8c])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4d12:b0:33b:cfaa:d01a
 with SMTP id 98e67ed59e1d1-33bcfaad01dmr1276533a91.25.1760653706135; Thu, 16
 Oct 2025 15:28:26 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 16 Oct 2025 15:28:15 -0700
In-Reply-To: <20251016222816.141523-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20251016222816.141523-1-seanjc@google.com>
X-Mailer: git-send-email 2.51.0.858.gf9c4a03a3a-goog
Message-ID: <20251016222816.141523-4-seanjc@google.com>
Subject: [PATCH v4 3/4] KVM: x86: Don't disable IRQs when unregistering
 user-return notifier
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	"Kirill A. Shutemov" <kas@kernel.org>
Cc: kvm@vger.kernel.org, x86@kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Yan Zhao <yan.y.zhao@intel.com>, 
	Xiaoyao Li <xiaoyao.li@intel.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	Hou Wenlong <houwenlong.hwl@antgroup.com>
Content-Type: text/plain; charset="UTF-8"

From: Hou Wenlong <houwenlong.hwl@antgroup.com>

Remove the code to disable IRQs when unregistering KVM's user-return
notifier now that KVM doesn't invoke kvm_on_user_return() when disabling
virtualization via IPI function call, i.e. now that there's no need to
guard against re-entrancy via IPI callback.

Note, disabling IRQs has largely been unnecessary since commit
a377ac1cd9d7b ("x86/entry: Move user return notifier out of loop") moved
fire_user_return_notifiers() into the section with IRQs disabled.  In doing
so, the commit somewhat inadvertently fixed the underlying issue that
was papered over by commit 1650b4ebc99d ("KVM: Disable irq while
unregistering user notifier").  I.e. in practice, the code and comment
has been stale since commit a377ac1cd9d7b.

Signed-off-by: Hou Wenlong <houwenlong.hwl@antgroup.com>
[sean: rewrite changelog after rebasing, drop lockdep assert]
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/x86.c | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 386dc2401f58..394a30bb33da 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -581,18 +581,10 @@ static void kvm_on_user_return(struct user_return_notifier *urn)
 	struct kvm_user_return_msrs *msrs
 		= container_of(urn, struct kvm_user_return_msrs, urn);
 	struct kvm_user_return_msr_values *values;
-	unsigned long flags;
 
-	/*
-	 * Disabling irqs at this point since the following code could be
-	 * interrupted and executed through kvm_arch_disable_virtualization_cpu()
-	 */
-	local_irq_save(flags);
-	if (msrs->registered) {
-		msrs->registered = false;
-		user_return_notifier_unregister(urn);
-	}
-	local_irq_restore(flags);
+	msrs->registered = false;
+	user_return_notifier_unregister(urn);
+
 	for (slot = 0; slot < kvm_nr_uret_msrs; ++slot) {
 		values = &msrs->values[slot];
 		if (values->host != values->curr) {
-- 
2.51.0.858.gf9c4a03a3a-goog

