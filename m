Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEE123D0922
	for <linux-coco@lists.linux.dev>; Thu, 14 May 2026 21:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778795639; cv=none; b=njcNWMdtpisUPIsegxk9agpdlFHOyAub1Rq/YXu8IXqFbo3OzMJituuXJPIjEwGWHN9eyy0fvWC4gOw0V3Jhr/azJMYiV2G10eZ2udZXCOGqhBsFYuaZJ16Fmo7N+9tlkoEKWRKAzHbrAeXmWiWsSheimzjpIN3igWdWlJC9SYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778795639; c=relaxed/simple;
	bh=64K3oRMxaBkG9ZrZ1E7KoplLuri6sFfHtThItZ2oI6k=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=D6tD5NNWAaLwptaCeB1YeN8Pu2aalEfoUnGVNKBHVsRXJDO9FLbX4SwQlKN1oCJIK1m0DvXGcpjnoVOXrgooCg6uLB+C6XxcgykgWOaP8uL+EurSZg2y1ZbdXgLcNqt6U93euB2nnB8Y6KAyTl+fqgcFYb/FlajtTILqV20LlNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RMN01k/L; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RMN01k/L"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-83eefe4867eso2100593b3a.1
        for <linux-coco@lists.linux.dev>; Thu, 14 May 2026 14:53:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778795637; x=1779400437; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AKuImzjKjmAFxEZ8HSJ8nOeVF7RSRtGpWmY9jCIC1ak=;
        b=RMN01k/LhQdAyr2WGBA0Ieo+0V1wGAoZ7DjgkZKe9xsMQ2aC0Msja1YOueP62ApnX2
         3fxI/zmxsX9dcpvcNd+tUY7U67N8rWgxBtQ3LE2effcOtFl1DCZDv5LNuh5/NCD5sPL8
         63PKJc+zrOvh1uxzLTRUhNy40Ph/aAZJIar1/VxHjDY3JZI0ArjQct62Ipiuh+D/f/JN
         oDJxwjGzShYzIyCm54MFmbb99wGC6Lg1KwtxaVQ7qMcYr2uoixENP3W3K10ZU00NSLQM
         jJXUyngwFnFFVEUaNbDgPULYW5tv3/yvAGqrjJAVn7yp7fKfKF1HwotIdeWcOYCZjOdq
         5wRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778795637; x=1779400437;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AKuImzjKjmAFxEZ8HSJ8nOeVF7RSRtGpWmY9jCIC1ak=;
        b=QIP8UCB4zGHfalHQjOPv83shGyJgg8Dm/H/IhDygk5LblFYq9+GIS+cx93KTwmBrla
         tFXf2NeyXTuzYUsoOtRNS0w2mlaCTy6EC7gJQmrrI4J7Ub9VZCmWBBbL4PoPDMUVQD+2
         vvtJOQsHudTKAKL9cfGt7kljVD7ARD0JY9nV9ycED257xtLoWNtMR1pkcw11sa+sqGEc
         pKz2989cX+y9ywGHuOLbSrO5nP22ToPTB9B5oy6HJh2Wpkw4W5ArPUCUyEZNd6Onzqx4
         WfyLQNCL0E/iPQMUjKKygbSQsaxKPzFCNFWUxbipNvTSyAQQHSH+aW2RtSgLOPvWA5F0
         GR/g==
X-Forwarded-Encrypted: i=1; AFNElJ8VGGYofSQozUYTTAQswReFe4KnfaeVHV+S8TsU8DtD50EVRGuQnBpf/2Gl1pxZxb/ihlmKw4NhV/7f@lists.linux.dev
X-Gm-Message-State: AOJu0Yzw4wrhEzbwEmSZw+ooNZGT9wKOz6bHSXOheEV7LG/PKay5lryY
	cO6BSBmLzlgi3jbRx0muhzKe0nOfTTqWLXRya7TaWd558TyGeODNtycUfGQZQUcmiF1ShxBhS93
	KdvudFA==
X-Received: from pfbg4.prod.google.com ([2002:a05:6a00:ae04:b0:82f:c34b:9799])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:4b0b:b0:82f:316:3206
 with SMTP id d2e1a72fcca58-83f33dcc06cmr1257694b3a.34.1778795636893; Thu, 14
 May 2026 14:53:56 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 14 May 2026 14:53:40 -0700
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
Message-ID: <20260514215355.1648463-1-seanjc@google.com>
Subject: [PATCH v2 00/15] KVM: x86: Clean up kvm_<reg>_{read,write}() mess
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

Add proper, explicit "raw" versions of kvm_<reg>_{read,write}(), along
with "e" versions (for hardcoded 32-bit accesses), and convert the
existing kvm_<reg>_{read,write}() APIs into mode-aware variants.

This was prompted by commit 435741a4e766 ("KVM: SVM: Properly check RAX
on #GP intercept of SVM instructions"), where using kvm_rax_read() to
get EAX/RAX would have (*very* surprisingly) been wrong as it's actually
a "raw" variant that doesn't truncate accesses when the guest is in 32-bit
mode.

Aside from my dislike of inconsistent APIs, I really want to avoid carrying
code that's subtly relying on using kvm_register_read(...) when accessing a
hardcoded register.

Fix a handful of minor warts along the way.

Oh, and introduce regs.{c,h}, which just a "minor" addendum.  Yosry pointed
out that moving _more_ code into x86.h was rather gross (especially since the
code split was super arbitrary), and it turns out that create regs.{c,h} isn't
all that hard.  In the future, I think we can also add msr.{c,h}, so I very
deliberately didn't include that functionality in regs.{c,h}.

v2:
 - Collect tags. [Yosry, Kai
 - Fix some truly egregious goofs. [Binbin]
 - Rename kvm_cache_regs.h => regs.h, add regs.c. [Yosry, though he'll
   probably yell at me for saying this was his suggestion :-) ]
 - Drop superfluous casting/masking of e*x() usage. [Kai]

v1: https://lore.kernel.org/all/20260409235622.2052730-1-seanjc@google.com

Sean Christopherson (15):
  KVM: SVM: Truncate INVLPGA address in compatibility mode
  KVM: x86/xen: Bug the VM if 32-bit KVM observes a 64-bit mode
    hypercall
  KVM: x86/xen: Don't truncate RAX when handling hypercall from
    protected guest
  KVM: VMX: Read 32-bit GPR values for ENCLS instructions outside of
    64-bit mode
  KVM: x86: Trace hypercall register *after* truncating values for
    32-bit
  KVM: x86: Rename kvm_cache_regs.h => regs.h
  KVM: x86: Move inlined CR and DR helpers from x86.h to regs.h
  KVM: x86: Add mode-aware versions of kvm_<reg>_{read,write}() helpers
  KVM: x86: Drop non-raw kvm_<reg>_write() helpers
  KVM: nSVM: Use kvm_rax_read() now that it's mode-aware
  Revert "KVM: VMX: Read 32-bit GPR values for ENCLS instructions
    outside of 64-bit mode"
  KVM: x86: Harden is_64_bit_hypercall() against bugs on 32-bit kernels
  KVM: x86: Move update_cr8_intercept() to lapic.c
  KVM: x86: Move kvm_pv_async_pf_enabled() to x86.h (as an inline)
  KVM: x86: Move the bulk of register specific code from x86.c to regs.c

 arch/x86/include/asm/kvm_host.h           |   2 -
 arch/x86/kvm/Makefile                     |   4 +-
 arch/x86/kvm/cpuid.c                      |  12 +-
 arch/x86/kvm/emulate.c                    |   2 +-
 arch/x86/kvm/hyperv.c                     |  21 +-
 arch/x86/kvm/hyperv.h                     |   4 +-
 arch/x86/kvm/lapic.c                      |  28 +-
 arch/x86/kvm/lapic.h                      |   1 +
 arch/x86/kvm/mmu.h                        |   2 +-
 arch/x86/kvm/mmu/mmu.c                    |   2 +-
 arch/x86/kvm/regs.c                       | 829 +++++++++++++++++++
 arch/x86/kvm/{kvm_cache_regs.h => regs.h} | 203 ++++-
 arch/x86/kvm/smm.c                        |   2 +-
 arch/x86/kvm/svm/nested.c                 |   8 +-
 arch/x86/kvm/svm/svm.c                    |  19 +-
 arch/x86/kvm/svm/svm.h                    |   2 +-
 arch/x86/kvm/vmx/nested.c                 |   8 +-
 arch/x86/kvm/vmx/nested.h                 |   2 +-
 arch/x86/kvm/vmx/sgx.c                    |   6 +-
 arch/x86/kvm/vmx/tdx.c                    |  18 +-
 arch/x86/kvm/vmx/vmx.c                    |   2 +-
 arch/x86/kvm/vmx/vmx.h                    |   2 +-
 arch/x86/kvm/x86.c                        | 935 +---------------------
 arch/x86/kvm/x86.h                        | 116 +--
 arch/x86/kvm/xen.c                        |  39 +-
 25 files changed, 1162 insertions(+), 1107 deletions(-)
 create mode 100644 arch/x86/kvm/regs.c
 rename arch/x86/kvm/{kvm_cache_regs.h => regs.h} (58%)


base-commit: a9512a611bd030088f13477258d1f8103cceaa40
-- 
2.54.0.563.g4f69b47b94-goog

