Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AAB82BE63F
	for <linux-coco@lists.linux.dev>; Tue, 30 Jun 2026 21:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782855436; cv=none; b=QdN3wduS1PpKWGoduqIYwVf4RWeYK1G/mp6xD2NC7jt5stN0zQkMDIpR4q4OFZJlDjogIkSniY0Y3MyjF0ZsBLQE05Z5w0/SqoF+844jqzWpu2ffBnJ984lHlbbv57E5kFhZPseINzED/CIorY7VAsTbIWUAgbFS6Lwrf1+w1sI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782855436; c=relaxed/simple;
	bh=VEV764k+YjgSV8ElwdVW6Rpo38QFc1TTbPvkYXFjsh8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=eAstmwM33GVWNl5LnCgQTSeq3Noi5JmvSuPAv+EZMERU2nWzI8yyfXDku++Tls20FroA67LkK59u1+hyQmg62VwFZuCf/mc09qyfVi9mslyq9qjEsG2RyYlqErYDzxdU2KKomZ+BGO5L1izbSum2co5eccf7SCFxL3a0CP8luww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HbKLvDKY; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HbKLvDKY"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2c9ae1da340so57628595ad.3
        for <linux-coco@lists.linux.dev>; Tue, 30 Jun 2026 14:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782855434; x=1783460234; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=uJbwc1Qhi2ZE+Oi6hXPhS12AxXWHzXClhddjya3ipjo=;
        b=HbKLvDKYfnp9a5XVrVjiJAxFY8XA0xdIVQxfZ5h8zZGo8P10Wv6XVFA4BzDC1AWV9P
         5UpvDxEpanZHBan1dunl7NfqbuGwqPnlA0+5vjzWU5116h3BS7SIivPK6JJNoQ7i0bVT
         +oJOE4hoyWAM2/XNolwBNPxelTqDEa9tuAwA4cyJhIG564sg8HhRaQ2eb2miz/DUvLIZ
         6Xq+mWvWcwnQZb8x6l0xhp9Up/uYvQ4S+/ouJp90DDi3P+jQA15+yOhxZXxA9y0RR2aF
         Wpn8SR3bqZjNEpfbuve/Zx9g4fN3QnOy8wh08amZsu9vjmw9CXXPSlT9Nm1Cy/P8ICpy
         hh4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782855434; x=1783460234;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uJbwc1Qhi2ZE+Oi6hXPhS12AxXWHzXClhddjya3ipjo=;
        b=ZCVAllRgS4mgmclJniZ0oa5W1TQQpRVlt1W94KEWIUS9lNp2arUUIF3v4ztyEG7iP/
         MbovFvSbF6KuI2vZWgmggKIXTZ28nHw3/mKCxGkN/CSwmSqJhoKzbbtGK8M5hI1MHIGL
         nwNog8LZ4XntPv/Fi5Vm7XiamXV9O3tltVNkmBlGfFdIoVTCiQntvBBMPoS1ev4ShO5F
         9wjKMH4HCXqAjYy3QmTu691WjmsNHq4D2kZQssrHKsGQ7zSM13AOzI1h4lhWmtyMRnKS
         1SlfgsLA8CdPHARZJnEkagIUTLYm4kNqb+6Galm9VML5/PU+os3A8QEGvprJK8RJXKPV
         mlrw==
X-Forwarded-Encrypted: i=1; AHgh+RozVCe1c/SoOxmpUldBk526Hg071H2mkoiiyi4RmLokzLERtV77Ts9FG9vRjRolho4iUtoznyZChvXy@lists.linux.dev
X-Gm-Message-State: AOJu0Yx+dckJtHF6pA4HwWY5Z3GGC0fSMH2Q9UESigENcy1aYec17iOu
	4Jn5GtejG4JhvpR1p0BQuo4axJ7gKq6vrmovSYbKWwWQsyV4oU8lmiEYLq+CQpkpttKXl35lp9j
	rMgqUHA==
X-Received: from plbkq4.prod.google.com ([2002:a17:903:2844:b0:2c7:f3c5:4bc6])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:1a0e:b0:2c0:af09:f3c7
 with SMTP id d9443c01a7336-2ca2ea17914mr38760775ad.30.1782855434158; Tue, 30
 Jun 2026 14:37:14 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Tue, 30 Jun 2026 14:37:10 -0700
In-Reply-To: <20260630213711.479692-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260630213711.479692-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
Message-ID: <20260630213711.479692-2-seanjc@google.com>
Subject: [PATCH v2 1/2] KVM: SEV: Explicitly disallow NULL user address for SNP_LAUNCH_UPDATE
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Kiryl Shutsemau <kas@kernel.org>
Cc: Dave Hansen <dave.hansen@linux.intel.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, kvm@vger.kernel.org, x86@kernel.org, 
	linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Sashiko Bot <sashiko-bot@kernel.org>, Joerg Roedel <joerg.roedel@amd.com>, 
	Yan Zhao <yan.y.zhao@intel.com>, Ackerley Tng <ackerleytng@google.com>
Content-Type: text/plain; charset="UTF-8"

From: Joerg Roedel <joerg.roedel@amd.com>

Explicitly reject a NULL userspace virtual address for the source page of
SNP_LAUNCH_UPDATE instead of relying on the post-populate callback to do
the check, and don't WARN on failure, as the scenario is blatantly user-
triggerable, as reported by Sashiko.  Waiting until post-populate to check
the address "works", but makes it unnecessarily difficult to see that KVM's
ABI is to disallow a NULL source page for non-ZERO pages.

Note, several existing VMMs pass a valid userspace address for the ZERO
case, i.e. KVM can't *require* the userspace address to be NULL for ZERO
pages, at least not without breaking userspace.

Fixes: dee5a47cc7a4 ("KVM: SEV: Add KVM_SEV_SNP_LAUNCH_UPDATE command")
Reported-by: Sashiko Bot <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/20260611125849.9ED631F00893@smtp.kernel.org
Signed-off-by: Joerg Roedel <joerg.roedel@amd.com>
Co-developed-by: Sean Christopherson <seanjc@google.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/svm/sev.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/arch/x86/kvm/svm/sev.c b/arch/x86/kvm/svm/sev.c
index 74fb15551e83..621a2eaa58f2 100644
--- a/arch/x86/kvm/svm/sev.c
+++ b/arch/x86/kvm/svm/sev.c
@@ -2330,9 +2330,6 @@ static int sev_gmem_post_populate(struct kvm *kvm, gfn_t gfn, kvm_pfn_t pfn,
 	int level;
 	int ret;
 
-	if (WARN_ON_ONCE(sev_populate_args->type != KVM_SEV_SNP_PAGE_TYPE_ZERO && !src_page))
-		return -EINVAL;
-
 	ret = snp_lookup_rmpentry((u64)pfn, &assigned, &level);
 	if (ret || assigned) {
 		pr_debug("%s: Failed to ensure GFN 0x%llx RMP entry is initial shared state, ret: %d assigned: %d\n",
@@ -2421,10 +2418,12 @@ static int snp_launch_update(struct kvm *kvm, struct kvm_sev_cmd *argp)
 	     params.type != KVM_SEV_SNP_PAGE_TYPE_CPUID))
 		return -EINVAL;
 
-	src = params.type == KVM_SEV_SNP_PAGE_TYPE_ZERO ? NULL : u64_to_user_ptr(params.uaddr);
-
-	if (!PAGE_ALIGNED(src))
+	if (params.type == KVM_SEV_SNP_PAGE_TYPE_ZERO)
+		src = NULL;
+	else if (!params.uaddr || !PAGE_ALIGNED(params.uaddr))
 		return -EINVAL;
+	else
+		src = u64_to_user_ptr(params.uaddr);
 
 	npages = params.len / PAGE_SIZE;
 
-- 
2.55.0.rc0.799.gd6f94ed593-goog

