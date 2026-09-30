Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9DD170809
	for <linux-coco@lists.linux.dev>; Wed, 30 Sep 2026 00:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790727091; cv=none; b=MasqgKuuykBJBTEoOW6dXv6VEx4ZDoeOv0KersC5+DnDBmHkvDt5B4ynVX7xAMVqFTiREetQ+WyXPfodXbLgG6Jz7PnW8n2QrYgANl9dyVp7F7ruTsrIufuTOMf4zJ/tk55pQszZHuY62Y0zz07W0RXW2UgBGEdel/rnN1WP0j0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790727091; c=relaxed/simple;
	bh=sKu78DjCAmODtHCgPAWQiNR4dngtKwV0Ou54EIH4260=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=coo56vyrNkQrXp5hytWyJIYqGEW3dXoPTnDj2igsKinj4Io+fxu1ZTDY/V5wDZTiOmNfR0DTX8tRIJdn3Ng1ho56CYRvs0TrIhisQq08+KHQW/HAP1oteQ1CvBpTwdTl4Hrt0qI6nNAJXyg1eGTUjE6KDu7CyAAGNFbopLeapyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=u1gMaduT; arc=none smtp.client-ip=209.85.216.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="u1gMaduT"
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3968bb86fb7so4652566a91.2
        for <linux-coco@lists.linux.dev>; Tue, 29 Sep 2026 17:11:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790727089; x=1791331889; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :reply-to:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/6ZGHDCmf5a7XSgxL4bcU9VK02Sk8HaCmnaTNrb7Zr0=;
        b=u1gMaduT2YQjWNvl1Fy7Zd5WP0De1vZfLQQLSPBdHXnwpvHzdRsK8ikxwYCp/u2Jk1
         OOAsuIplf6VCwnWJgfbvaGEkzWwEHI36jPABONqWqfdY3cuFq7dJedHtTT2v5jGuMJJc
         N2hx3YtflFafcHDDxNVSD/Dy+SBH4OXeIvFrgfkm1mxty1st6JIDuA9QcY771CpprE1G
         rPXjCPbUjETZ/gk60vRI6VwFJeLvaPLl5kTxQAoFnL4mWjV0QoBRWX5e8kT1UeHreCzE
         gao6q2euvj3FTawBzMx8wBzx5FE0WhuOcIEswgE8AHNA+qhzBOvUgaNH5w//czQfyAi5
         D8Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790727089; x=1791331889;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/6ZGHDCmf5a7XSgxL4bcU9VK02Sk8HaCmnaTNrb7Zr0=;
        b=mKBzqRjsQ9Mx1o4esXj+go8z6RsEA7qjnbu9x5NF0cDkNA0Gl8UR9ov3whcPBLZrVS
         g1bwvVI58BrCGx/hqGVWk7Eos8BQUh6JaLQpmOa/uEUMeUmW3RyVqLGDYeKIUKGkaUMy
         qZrsgaw8aCPszTuDuBpB6TtJOTCAg+rTFdHHGMwHLD0Mk9YaYcyH+cbf7JvbAg5mhEoH
         dCSnOvCIvkgCXIgmwjwj+ybhOKMBc1/o79l0rLOEHLApP6rQ5NxGBA3WifroyRc2f7vj
         XloxO8p8W1vXBH8HYG9L+jc/v1TeJelCK0Fca/lX93D0LBQ8V6N6B8NwxqoRDZBioRiR
         zctw==
X-Forwarded-Encrypted: i=1; AKwUvBz4ACzdlvisi8c/hFjqHqi8k0AGO/B/78QHthnJVSOAMYdXg1I+oi6jsB2Vy8FgkT+XPbqpvB/E7rTU@lists.linux.dev
X-Gm-Message-State: AFq9FYIMbJ8YmQkDXI1ZnaLj7yqPUxAQIsQyxPt5+A1B2aQm4v0W9QXl
	N3f3ioDf9zR2/UC5eWBclIWE/sywbCvWG+cYPhnmeE88YgPQfijimnMQXFLnlF9DJXHvLzEzw5A
	YXCm/Ew==
X-Received: from pgbaz14.prod.google.com ([2002:a05:6a02:4e:b0:cc7:d698:697e])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:e7cf:b0:39e:6795:f7da
 with SMTP id 98e67ed59e1d1-3a4bfdd4f20mr819262a91.19.1790727088949; Tue, 29
 Sep 2026 17:11:28 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Tue, 29 Sep 2026 17:11:24 -0700
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260930001127.3170009-1-seanjc@google.com>
Subject: [PATCH v2 0/3] KVM: TDX: Syntehsize SHUTDOWN on unhandled EPT Violation
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Kiryl Shutsemau <kas@kernel.org>, Rick Edgecombe <rick.p.edgecombe@intel.com>
Cc: Dave Hansen <dave.hansen@linux.intel.com>, kvm@vger.kernel.org, x86@kernel.org, 
	linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, 
	James Houghton <jthoughton@google.com>, Xiaoyao Li <xiaoyao.li@intel.com>, 
	Yan Zhao <yan.y.zhao@intel.com>, Binbin Wu <binbin.wu@linux.intel.com>, 
	Ackerley Tng <ackerleytng@google.com>, Vishal Annapurve <vannapurve@google.com>, 
	Sashiko Bot <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Signal SHUTDOWN instead of -EIO if the guest accesses an unaccepted page and
has disabled EPT Violation #VEs on such accesses.  Returning -EIO is all but
guaranteed to mislead the VMM into thinking KVM (or the VMM) messed up, and
will likely result in the VM being terminated instead of rebooted.

v2: 
 - Return SHUTDOWN directly, via a new helper. [Rick]
 - Ratelimit the error message. [Sashiko, (and past me, amusingly)]

v1: https://lore.kernel.org/all/20260923163315.1580860-1-seanjc@google.com

Sean Christopherson (3):
  KVM: x86: Add a helper to prepare vcpu->run for a SHUTDOWN exit to
    userspace
  KVM: TDX: Synthesize SHUTDOWN instead of returning -EIO on unhandled
    EPT violation
  KVM: TDX: Ratelimit the "EPT Violation on pending acceptance page"
    warning

 arch/x86/kvm/svm/svm.c   |  3 +--
 arch/x86/kvm/vmx/tdx.c   | 11 +++++------
 arch/x86/kvm/vmx/vmx.c   |  3 +--
 arch/x86/kvm/x86.c       |  3 +--
 include/linux/kvm_host.h |  8 ++++++++
 5 files changed, 16 insertions(+), 12 deletions(-)


base-commit: a0bc8e1d7a82bb143b8f8f44ae3a01938f37c2ea
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

