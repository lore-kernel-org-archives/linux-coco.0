Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D74B925A655
	for <linux-coco@lists.linux.dev>; Wed, 25 Feb 2026 01:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771982471; cv=none; b=OC14nYJkQ/4Td0rgRqnCHfktJ4qBFpwwAO5ohjUO4JgPVK/Jl/2e6PQ/SQ+/msG2j911m8pfk5hX4WOkqbopovi+czgqtSsREM8BXOK/PIBJjy1HcavgeIOkSh2vzmge+/0QqrHeUqlRF5npRB6XllXEcVcR9t0rvvzVoSHfkEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771982471; c=relaxed/simple;
	bh=YugX2YLyYIqesMyLVhe1vuRLpba0vyw2iEWUNwc9aeU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=mIUVa1gvB6Hy9EFa85oCJW8JRfo08zrN1eQ6jadUX5YXlzVeLqCoz5/MMgtj4fpg06TKwd06//xmjKp5REm1vGMiXRNAVIJdkSZ4SQxF58djrnvipHjeE3mDTuYGHMZZo4WVfLdhN/s/H8P7vY2dl9bNsypmaxU9viA4hA9fEUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=yRWWKMNT; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="yRWWKMNT"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-3561f5bd22eso5144330a91.2
        for <linux-coco@lists.linux.dev>; Tue, 24 Feb 2026 17:21:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771982466; x=1772587266; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=U5hmNv02IBvGPnO8Neh+XMn/il3YSxAkvHfsbK9B4L0=;
        b=yRWWKMNTdGb687L6fwdb4EBuFlrZKzt2E/CSJTuZzKL1Je380FiF3FbkIqun7tvNji
         eSse7KGPjGAzJt/5BJLmRBbYh9/e4iJp0PzwzQGDJx29JfrUuX5nqW0LepWHc6mpYxwV
         C4fbhSfkj0m3o3EYQf45zlu0K/UVlUfN08lBm7/Gf14IASu1P5no73l+oJGxeWrgLZP3
         CmTyyEQbkkZZavJsMewnPtlO9xMeyesK6zDDJQAXYbAv+18f71TxHyslXhn9clDbqCtG
         4TcxGSXoJl6WYMYzA2P+iVnB9lv713S4ZHWmojp5d1iK+VKxdmrRLWraNc4/S4fw7jPR
         xfHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771982466; x=1772587266;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U5hmNv02IBvGPnO8Neh+XMn/il3YSxAkvHfsbK9B4L0=;
        b=nqg083sf6+EalYosRaYSWlsXSvcBK+XQ+/ybfV48hrCyjQFZOC9ypT6S9zl9xEXF0g
         NUGfj6pOfeYOPGXsI0LRdLYHN3k5CMVkyNiYZUrcBtnAmQJVb6Uw6fLhbFyC7ltpOeU5
         NWx8JlJsrBZEcM/AXPkRLyInbil6T8EveJr8SGuk5UjyhaVrFf8jHt872u+QZh8PEnCc
         FGvnHJ/rVIjMYQm6cUzHNSerTbrnxUSyAJvj7QA6YHkuZD56hbMxZjcfsCUQ5iqVxbgO
         XjnlWsLtKSjp7Ym5VGL2YTsmRcN4iJ2YZj5WoedKMWy9hMPZtgxx67Izh9ZGtG9Qgr9y
         RfiQ==
X-Forwarded-Encrypted: i=1; AJvYcCXbn4noWv3UpesTAsR8jpKEdE9rTwVQPOy+1uHL2T76DFGH9tDhByKgucr9wj7EEXFueVWKtGwh5cU2@lists.linux.dev
X-Gm-Message-State: AOJu0YxgWWiA08n0orNvBHCKIxgIzzt8hniI9RZ4u1nzUQAmxx3hA6Eb
	OM2NV6Tfsr77k+frxlhGoGNqpMlIDSeTQVN7eDXXxnLuSaNJn+AbeLb+vbCv0QLYYFQ+7Wawck1
	6MFM5Pg==
X-Received: from pjee13.prod.google.com ([2002:a17:90b:578d:b0:358:f01f:25f3])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:248f:b0:359:79e:39bb
 with SMTP id 98e67ed59e1d1-359079e3faemr996889a91.24.1771982465502; Tue, 24
 Feb 2026 17:21:05 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Tue, 24 Feb 2026 17:20:42 -0800
In-Reply-To: <20260225012049.920665-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260225012049.920665-1-seanjc@google.com>
X-Mailer: git-send-email 2.53.0.414.gf7e9f6c205-goog
Message-ID: <20260225012049.920665-8-seanjc@google.com>
Subject: [PATCH 07/14] KVM: x86: Harden SEV-ES MMIO against on-stack use-after-free
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Kiryl Shutsemau <kas@kernel.org>
Cc: kvm@vger.kernel.org, x86@kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Yashu Zhang <zhangjiaji1@huawei.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Binbin Wu <binbin.wu@linux.intel.com>, 
	Xiaoyao Li <xiaoyao.li@intel.com>, Tom Lendacky <thomas.lendacky@amd.com>, 
	Michael Roth <michael.roth@amd.com>
Content-Type: text/plain; charset="UTF-8"

Add a sanity check to ensure KVM doesn't use an on-stack variable when
handling an MMIO request for an SEV-ES guest.  The source/destination
for SEV-ES MMIO should _always_ be the #VMGEXIT scratch area.

Opportunistically update the comment in the completion side of things
to clarify that frag->data doesn't need to be copied anywhere, and the
VMEGEXIT is trap-like (the current comment doesn't clarify *how* RIP is
advanced).

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/x86.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 7abd6f93c386..2db0bf738d2d 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -14273,8 +14273,10 @@ static int complete_sev_es_emulated_mmio(struct kvm_vcpu *vcpu)
 	if (vcpu->mmio_cur_fragment >= vcpu->mmio_nr_fragments) {
 		vcpu->mmio_needed = 0;
 
-		// VMG change, at this point, we're always done
-		// RIP has already been advanced
+		/*
+		 * All done, as frag->data always points at the GHCB scratch
+		 * area and VMGEXIT is trap-like (RIP is advanced by hardware).
+		 */
 		return 1;
 	}
 
@@ -14297,7 +14299,7 @@ int kvm_sev_es_mmio_write(struct kvm_vcpu *vcpu, gpa_t gpa, unsigned int bytes,
 	int handled;
 	struct kvm_mmio_fragment *frag;
 
-	if (!data)
+	if (!data || WARN_ON_ONCE(object_is_on_stack(data)))
 		return -EINVAL;
 
 	handled = write_emultor.read_write_mmio(vcpu, gpa, bytes, data);
@@ -14336,7 +14338,7 @@ int kvm_sev_es_mmio_read(struct kvm_vcpu *vcpu, gpa_t gpa, unsigned int bytes,
 	int handled;
 	struct kvm_mmio_fragment *frag;
 
-	if (!data)
+	if (!data || WARN_ON_ONCE(object_is_on_stack(data)))
 		return -EINVAL;
 
 	handled = read_emultor.read_write_mmio(vcpu, gpa, bytes, data);
-- 
2.53.0.414.gf7e9f6c205-goog

