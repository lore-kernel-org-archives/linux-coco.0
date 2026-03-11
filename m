Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A37B22126C
	for <linux-coco@lists.linux.dev>; Wed, 11 Mar 2026 00:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773189236; cv=none; b=uCJpAytNIfe5RgXNPpDJdDx1ymv0M/47cEZf+d4Bmdlz2hjC/Nz8sNelrKu+rMLz1NHpOBm1e38ipDt2sqJbdo+f7bnwdRUNLklLRLvK/cGvFMLmN7cLJNfVIXAtx0IznBml/4DWVR3vatkdwDGbQZiqXaNxBrkIwRhHvGPHvos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773189236; c=relaxed/simple;
	bh=pkeFz4pHI1qOD1pZsBkP4yqTDQt6pCmcAwnlYpu37+c=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=uHsqOlWBFIokN00wjiERCrsrB9oPx8HY0fs910lP6b8yu2EuH38/7p/7GOaoXbDD8OHQwK9speuR/hSaE5uGN4AcKhHx0+2aMTKPFYV5JxP1b+9y4hJVK0TM9nwp7SrJXxnjf73sJ5c5Fk4JPL/I14JrzVCbcDulKSH4kXJf9SY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=IgBmeTLp; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="IgBmeTLp"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-82992206d20so3129695b3a.3
        for <linux-coco@lists.linux.dev>; Tue, 10 Mar 2026 17:33:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773189233; x=1773794033; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y8ZVaqYViHeyZ+pNLWaCA3L4wzmUu/H59FOP4fIvB28=;
        b=IgBmeTLpgOar6oD3l3TzydfH3hovJ82g8o0K+mRKDY8+kdgm9EaYEH7bcZrbUgbGDf
         0VMyfVdxpJ82ac95Jwfqb2tq4t96qcqfGHOjm1J1QquQpVbN/czhSUCH0VD3dHMNvOka
         vg3nvLaTb+VDzQG3xxCuSEESAJBlAOWBZDM8h9b4GLkxPzZf+PrTjJKcIRkufJEsLFMG
         brobtUPQ6rXa/cHJlngUiPDRlSC5AKivIxWTvGrz7D1Y2verWNaL8kGQ6bhVXKwPT/eQ
         CbVt6UZl8KnFc9QEeYUgjrns7NOax1it9PSd4otBQHHZu4YDvQObMLY1rM2jUHf6CK1C
         PKLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773189233; x=1773794033;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y8ZVaqYViHeyZ+pNLWaCA3L4wzmUu/H59FOP4fIvB28=;
        b=UWzLn8dFUVzhm5vHjeXE9bPSt1a23UAmv73Ey+LMEV2NssZgs36mgSbhugH0qlzSBS
         a4eDMtArSX1XtVqdwqZ34j+l3bFCEPNWP3pM9nOW3Abc24XSLVBs52nvDpDMeNf3h29D
         5+la0jU+FDutJxFWdidcFkmOUu+yLXvq7yv5hHvQQS/aYASS4khNnJ1AtTcKf7d4dtPD
         dlmd1owjj+MrNKkFKhMBuZoiWcjzuqN1p3qw0DKpQHFQCf+YijwnCyb37hleiYfV0HZX
         3Sa2ZUyZImNZLo2kFQ3HwN133DYT3HzV1mZoPrfTt+7U2TGk7C5vNZPnTIpxzPqM3cE5
         Wm9Q==
X-Forwarded-Encrypted: i=1; AJvYcCXsMWqRg6wgfrXOOE/gKT3nTFFBV00/nRxYqlC46KG5vGI6TsXbLto+nVOdeNPMX/22w9MNZep3KYF+@lists.linux.dev
X-Gm-Message-State: AOJu0YwmPf/tfU32pq0bsoTu2OkLtn1u0LMu7N8WSRNIR1zVnXhBThc/
	NBEG38BkEGRWR6EPqPKzKpmO0UW1Nn/dElp3Z1qPJQDolriiuFx6saQ7We21UfJPBsM/hAaryuH
	aeBkiyA==
X-Received: from pfbde20.prod.google.com ([2002:a05:6a00:4694:b0:829:9167:6d5b])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:8017:b0:829:8c23:f70e
 with SMTP id d2e1a72fcca58-829f70ac57amr636536b3a.45.1773189233364; Tue, 10
 Mar 2026 17:33:53 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Tue, 10 Mar 2026 17:33:39 -0700
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.53.0.473.g4a7958ca14-goog
Message-ID: <20260311003346.2626238-1-seanjc@google.com>
Subject: [PATCH 0/7] KVM: x86: APX reg prep work
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Kiryl Shutsemau <kas@kernel.org>
Cc: kvm@vger.kernel.org, x86@kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, "Chang S . Bae" <chang.seok.bae@intel.com>
Content-Type: text/plain; charset="UTF-8"

Clean up KVM's register tracking and storage in preparation for landing APX,
which expands the maximum number of GPRs from 16 to 32.

This is kinda sorta an RFC, as there are some very opinionated changes.  I.e.
if you dislike something, please speak up.

My thought is to treat R16-R31 as much like other GPRs as possible (though
maybe we don't need to expand regs[] as sketched out in the last patch?).

Sean Christopherson (7):
  KVM: x86: Add dedicated storage for guest RIP
  KVM: x86: Drop the "EX" part of "EXREG" to avoid collision with APX
  KVM: nVMX: Do a bitwise-AND of regs_avail when switching active VMCS
  KVM: x86: Add wrapper APIs to reset dirty/available register masks
  KVM: x86: Track available/dirty register masks as "unsigned long"
    values
  KVM: x86: Use a proper bitmap for tracking available/dirty registers
  *** DO NOT MERGE *** KVM: x86: Pretend that APX is supported on 64-bit
    kernels

 arch/x86/include/asm/kvm_host.h | 53 +++++++++++++++++++--------
 arch/x86/kvm/kvm_cache_regs.h   | 64 +++++++++++++++++++++++----------
 arch/x86/kvm/svm/sev.c          |  2 +-
 arch/x86/kvm/svm/svm.c          | 16 ++++-----
 arch/x86/kvm/svm/svm.h          |  2 +-
 arch/x86/kvm/vmx/nested.c       | 10 +++---
 arch/x86/kvm/vmx/tdx.c          | 36 +++++++++----------
 arch/x86/kvm/vmx/vmx.c          | 52 +++++++++++++--------------
 arch/x86/kvm/vmx/vmx.h          | 24 ++++++-------
 arch/x86/kvm/x86.c              | 20 +++++------
 10 files changed, 166 insertions(+), 113 deletions(-)


base-commit: 5128b972fb2801ad9aca54d990a75611ab5283a9
-- 
2.53.0.473.g4a7958ca14-goog

