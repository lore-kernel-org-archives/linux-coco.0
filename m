Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17B31233933
	for <linux-coco@lists.linux.dev>; Tue, 30 Jun 2026 21:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782855435; cv=none; b=H8nmOLQK0A4p25pRfyc+XoCNZWGtCskqlTkcmn9DVT+BMrI9nvtY0On0CB6BFETaqU7BTkrvTZHqXGJZJ7tIIeDtYlMJ0CUwu1/PXXm/J9TRQMy3OMgBqqYHU/302qfLBDXmoCS6VuexS453aiDqGAe0Db8BO5i3FO2URe4prCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782855435; c=relaxed/simple;
	bh=nIZGKje8UwhYBZ9kwvCNQ5q2oYFunQ9OO5lUc8brH/I=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=eq0hnd2DAT7Yq9MDA4Dyg2edQUfaid9M4vcTBWBI6p5wWYXOYRDiNkQHo1jtUIFDTr3AwvKGdVzykwjfnBDKuu9+f4IhTmgW2vDKVxlKdOWpDhf0/6fVVAz4Ql2/umWLtzSArouALt0l7BYpExVjCNxdJbS+p5l1akyazUjzI8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lOFn6a4t; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lOFn6a4t"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-36d97a4e08fso19587a91.0
        for <linux-coco@lists.linux.dev>; Tue, 30 Jun 2026 14:37:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782855433; x=1783460233; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SJUsAy2mnvXDwvwqEHFWU0D1eamvTWzS2kE4hxz8/r0=;
        b=lOFn6a4tivglWg/lNkEJ/TUIEKfKOz2TsRxk0F2CYAgK/WnuGMhhi9SIB8xFSvg07H
         bLBxA6HyXAhaUaTC8vIqgA+CWYh4tvwJ6OrnXpwHx569Mu3bq++F4dfFV+MlUSWoA2Dk
         UXCdtFg6r0jpa1a3D/RLN5XeAxK7dhZkJBgLg79MA+IF5sFWGgjy5Y1IuMO4Q+rKtIRq
         6PIUzzJXd1/wBmSh6YQoaYYhhciO2LuIQTbtMWq32HiffmXqtfNHpK7hDzMiSJUT38p8
         h3hSEO4yrnQnbGp74izLzxCl1mK3pXtXUMVYhusJw/1Pfrq5x/6C3P8RJzUj0NhIVFYc
         dgmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782855433; x=1783460233;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SJUsAy2mnvXDwvwqEHFWU0D1eamvTWzS2kE4hxz8/r0=;
        b=OeG03YW1q3/zstrcjQfeR7zi86K27Hs8Z5jJ5f9mvFpF7zbwoTtSMMSe6CYGftJUQz
         qorQfuLQ8LsfsSU8rtkRa0tP6CH4L1viyLoTaI4edPXxQLPt6Q/EcJLzyxIfldge0MZL
         Bz8G+C1UDshQZwOlX3i33Bqjyrwx7M0YNyjIDWuGnW2tJ3K9wYugK/CGKnCgpTI8gLKV
         jfVrA/+nCxS+OTbjPvNqMy2hRgle/03BIt49QnCeDqvMVYn7kNfrjmcFFHYoPeANmId8
         4YK41Kad664To0gPRI7tYbmnrE6nM7rowkrSHrFUuIueCBofJ/z54LhgRAjNaJgklqZi
         RdHQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrx78ud653PmmuMiLMPUMDyUaE1ZPukEeRfDN4XdtEYZtul+XgyTG+76N5Ad0D5M9IxRfCOTks+IwWY@lists.linux.dev
X-Gm-Message-State: AOJu0Yz+ru663+OMv9DGKT6Tf+j6Czaf+tTQITi47BmU4CmglBwjyJ+D
	xxMVaGYhvaKS+zFEUIH7I5X1nrMP2qWLHcthYutUGTN3HFWYLGuh+4M8/5xRfwzRfJHTbJBLrYU
	FjqZzpQ==
X-Received: from pjvc8.prod.google.com ([2002:a17:90a:d908:b0:380:64e0:790e])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3810:b0:36d:ae6a:22fe
 with SMTP id 98e67ed59e1d1-3808bfce9f7mr1673537a91.16.1782855433058; Tue, 30
 Jun 2026 14:37:13 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Tue, 30 Jun 2026 14:37:09 -0700
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
Message-ID: <20260630213711.479692-1-seanjc@google.com>
Subject: [PATCH v2 0/2] KVM: x86: gmem populate fix and cleanups
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Kiryl Shutsemau <kas@kernel.org>
Cc: Dave Hansen <dave.hansen@linux.intel.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, kvm@vger.kernel.org, x86@kernel.org, 
	linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Sashiko Bot <sashiko-bot@kernel.org>, Joerg Roedel <joerg.roedel@amd.com>, 
	Yan Zhao <yan.y.zhao@intel.com>, Ackerley Tng <ackerleytng@google.com>
Content-Type: text/plain; charset="UTF-8"

Fix a user-triggerable WARN due to KVM not pre-checking that userspace
provided a source page for non-ZERO pages for SNP_LAUNCH_UPDATE, and then
clean up the equivalent TDX code to also explicitly check the incoming
source page *before* calling into guest_memfd, and to return -EINVAL, not
-EOPNOTSUPP.

v2:
 - Rewrite the SNP patch changelog.
 - Tweak the code to avoid checking KVM_SEV_SNP_PAGE_TYPE_ZERO twice.
 - Drop what is now effectively a sanity check in sev_gmem_post_populate(),
   so that we don't have to duplicate the logic when in-place conversion comes
   along.
 - Tack on the TDX change.

v1: https://lore.kernel.org/all/20260623091556.1500930-2-joro@8bytes.org

Joerg Roedel (1):
  KVM: SEV: Explicitly disallow NULL user address for SNP_LAUNCH_UPDATE

Sean Christopherson (1):
  KVM: TDX: Return EINVAL, not EOPNOTSUPP, for NULL INIT_MEM_REGION
    source

 arch/x86/kvm/svm/sev.c | 11 +++++------
 arch/x86/kvm/vmx/tdx.c |  7 ++-----
 2 files changed, 7 insertions(+), 11 deletions(-)


base-commit: a204badd8432f93b7e862e7dac6db0fe3d65f370
-- 
2.55.0.rc0.799.gd6f94ed593-goog

