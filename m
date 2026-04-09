Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E03BB395DB9
	for <linux-coco@lists.linux.dev>; Thu,  9 Apr 2026 22:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775774569; cv=none; b=LlSgbH836jWjFOoHcVLNy+wmcrakd2j/l12lDV2WiaxkMQaYgiSP4C+Q2sURSRGCgBSpK5RUh78cFzp4pg+DY+a7Lwi4LCNfKG78ppwvb6Gy98NwU1vlrCOVUhwR+1HcKCKXVvi6RVioXHgLaQAIL2EGqdPZghvvy3VDcGhJahc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775774569; c=relaxed/simple;
	bh=lGG123UZ3kfKMZt8jrFqzHp5bXJWmH2OP6Oz27zmQvg=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=S2TuntXf+WL19+x3edtTc9ERv2LoM6uzLyaCk4VaUWHXWB3go/d/yTU3ljcmsSp7ZKh69TO6+WLex7eBnzNADCWKrl68wexfElch1uOwLMou8DwNUQRNWh+TDMBM6ZqY9gszQzuXFUO6ubI6eAzNWzOBlm47OGKwj3JtYAw3g6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rA86JYJ4; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rA86JYJ4"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-82ce50e6e28so920077b3a.2
        for <linux-coco@lists.linux.dev>; Thu, 09 Apr 2026 15:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775774567; x=1776379367; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to:from:to:cc
         :subject:date:message-id:reply-to;
        bh=15sLIW3D0vI81woyhYAJLyhIBfYvreYNWS4YkFEu4As=;
        b=rA86JYJ4oKtHdM7BWBZIr5n9ZTcQEIkIO5dTyKALmoyRm6LqpL4iTxHzk4Qk/1DUac
         Sbu9uj5q3laQyqrlkKIm7ZqYP44+m1spFv5cNxZmMVVpnLejpgNBBIdTESHhbNfxvnD7
         sGesOe3R0p/JVZmF5uzPoMoHm1NHkwlMEMA8cdDyxJYIdD5DuorgZJocFWIGQJ4rPqz7
         iojLUpa3ZwX8gS2GgbOoqG19ckkfAke1hHF62kp9YsqTJpn7M8Vzsdwl5FtgVonVLeJk
         GB9Pq7ombL3zm9k76xCURptWFuAhI+I6YIiVNBFUa5vDrNg9QYgz5CTdkToNck5NvK5E
         OEeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775774567; x=1776379367;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=15sLIW3D0vI81woyhYAJLyhIBfYvreYNWS4YkFEu4As=;
        b=dnl8r+xrgcZJ5QAzKrc8A21mSgv1GVi1RlN1tc5A9BlWx1Au9TOcDXIH5/fjjnDDVc
         i6pa95SBuFh3l+QycwuZkt43A3yhS4NkqnNhzegz7DvW92Su/qZMCtjbYolAXbggJzlR
         EIy/6FIQGkS3BhX3V89LZsVGQIUtyQK73LbPr9xYFuS/0r0fpOmcm5TL9ab3p8j+27Fk
         0TJRH9bSgZ04DNemIUuvPkHThnzMt66cn32afnk/RFz6POaDtBFVUiCk8mkKN7Tbkrq5
         saiTmMprPxwbRhmuDwhX0OwZSkJG1VLikqJXnaxjRHhe9eswPy7bkd27D/tuSN3RtSAF
         6k6g==
X-Forwarded-Encrypted: i=1; AJvYcCVWA+GaOzBwUxAmDJrNDvwzolkVA9DLIfMPATzqFQLLAoWeaFhYf9jttvSAChSkBMeb1jSx1BT2OuwC@lists.linux.dev
X-Gm-Message-State: AOJu0YyaRLffvpy6FVLuiNTCev/lHDTFwhf0V3FdzZCYoyMC5JaCqPSb
	YZ411ZhetfKf/HhfSJMZUV+U92gjPvqr34GGO6Eabtu3bysuFvGQyJ/aWBAogWncAM2oZp2erjc
	eSBuFFg==
X-Received: from pfbfb10.prod.google.com ([2002:a05:6a00:2d8a:b0:829:9082:12ca])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:892:b0:82a:81b6:d8a6
 with SMTP id d2e1a72fcca58-82f0c302aafmr951868b3a.25.1775774567069; Thu, 09
 Apr 2026 15:42:47 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu,  9 Apr 2026 15:42:29 -0700
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.53.0.1213.gd9a14994de-goog
Message-ID: <20260409224236.2021562-1-seanjc@google.com>
Subject: [PATCH v2 0/6] KVM: x86: Reg cleanups / prep work for APX
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Kiryl Shutsemau <kas@kernel.org>
Cc: kvm@vger.kernel.org, x86@kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, "Chang S . Bae" <chang.seok.bae@intel.com>
Content-Type: text/plain; charset="UTF-8"

Clean up KVM's register tracking and storage, primarily to prepare for landing
APX, which expands the maximum number of GPRs from 16 to 32.

v2:
 - Call out the RIP is effectively an "EX" reg too (in patch 2). [Paolo]
 - Rework the available/dirty APIs to have an explicit "clear" operation
   for available, and only a full "reset" for dirty. [Yosry, Paolo]

v1: https://lore.kernel.org/all/20260311003346.2626238-1-seanjc@google.com

Sean Christopherson (6):
  KVM: x86: Add dedicated storage for guest RIP
  KVM: x86: Drop the "EX" part of "EXREG" to avoid collision with APX
  KVM: nVMX: Do a bitwise-AND of regs_avail when switching active VMCS
  KVM: x86: Add wrapper APIs to reset dirty/available register masks
  KVM: x86: Track available/dirty register masks as "unsigned long"
    values
  KVM: x86: Use a proper bitmap for tracking available/dirty registers

 arch/x86/include/asm/kvm_host.h | 32 +++++++++--------
 arch/x86/kvm/kvm_cache_regs.h   | 62 +++++++++++++++++++++++----------
 arch/x86/kvm/svm/sev.c          |  2 +-
 arch/x86/kvm/svm/svm.c          | 16 ++++-----
 arch/x86/kvm/svm/svm.h          |  2 +-
 arch/x86/kvm/vmx/nested.c       | 10 +++---
 arch/x86/kvm/vmx/tdx.c          | 36 +++++++++----------
 arch/x86/kvm/vmx/vmx.c          | 52 +++++++++++++--------------
 arch/x86/kvm/vmx/vmx.h          | 24 ++++++-------
 arch/x86/kvm/x86.c              | 20 +++++------
 10 files changed, 143 insertions(+), 113 deletions(-)


base-commit: b89df297a47e641581ee67793592e5c6ae0428f4
-- 
2.53.0.1213.gd9a14994de-goog

