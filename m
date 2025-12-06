Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F4EB1B6527
	for <linux-coco@lists.linux.dev>; Sat,  6 Dec 2025 01:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764983468; cv=none; b=fFHuGSlEYMyGxwlZDtAeuYn6gh7pu0YOyTim1Hhu+xo5GqCc5Ri7N+5O3hwak6ifNRuG4xV5Q5YjJ6oo+V3mMRFnMxcFWOpX6UR4og2x2YllsCJ57KQvmKsGH2c5a9xxOZR27PJYdspizC0BRHehtofSaljZ6tiXt2WmG0QnkHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764983468; c=relaxed/simple;
	bh=ahpjv/o9LrVp9tjCTCe6MlNPXkZFpq6fmTPCM0Tk8Bc=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=aDy4CezMc7JrtPKYcFEA5AZZU1KpYF8ALGPJhVtF4M17v6Fr6gjxqf3tCgj8pVGNZ/fDkbFUQEgL0hIZVfwVPtERwt4WuUCVX3omFHw5WP98QMaevp+vS81IyaYWLTc9jd05hT7/UBpub0u/9E0gvAZ/Z8BsS2i0g0PDNmdsSbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mkWxIRx+; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mkWxIRx+"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-342701608e2so2964712a91.1
        for <linux-coco@lists.linux.dev>; Fri, 05 Dec 2025 17:11:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764983466; x=1765588266; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V7l6e5405bVH1DspNVosbrsco7TeBvKPRawRHDQ4cDw=;
        b=mkWxIRx++l7FQGMpCl3ktlaeZOvFaMgDfav+fPMQDCNLusYy58cb8AtqS3Hs3qiZ2O
         bq/vVvM7nr6CPuu4B+ShLoUcT2ydtNtPQwaFw8qXpzaDViZ18EifOmMQ27rtNl5+qMmb
         /bBn2uscLC7HtF4mjFmeVMtyaI2G8gZJENvoiSycSKvdhwa2GzP/ooCE/7xtltng/psf
         XfzF1WbfqQO52ZjVNllCiKtEihKuvYgmZXSrSjiDp0qp0J07stwBuuiS0Cu4Fg+VCg5C
         dvGOJW6AYNGIHG/XbcJwCR2BfjokEFyeP3VoKszKgSnVJr88txUakCMP/A5Pemopd+DU
         2UzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764983466; x=1765588266;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V7l6e5405bVH1DspNVosbrsco7TeBvKPRawRHDQ4cDw=;
        b=dgnEnbBD+2I1f+g34KKrNMg4oQSgkJ6VwSuKO12jC6XA60zaKXsJN5dSjBvijoZJps
         yHCsVvRkDVZgl43xqqCCA0BXB0SqTjUsM3w4tbYvCQQzTQZ/s3q7F/gzrM6W+MUJQoy1
         NlKAUDSzU8tmxmgwgRyzZ0ScTKoRerDFku2BYlKzWWqzwrT1qshs0gng85BZlCh7phtk
         QExWFl0Dl5iGmq66kF26CdyqFko/mduNM7TKfG/KRsKGqvdOijH0l1dxuDr05G6NA5sR
         9lkLzCCF7wutreA4u+OdFef+htn/s1zXkqb9GnOwmwpt2t1aBwD50Kqi+f6LuQffWmDl
         X4Jg==
X-Forwarded-Encrypted: i=1; AJvYcCUQLvWHlfj7cAv9y92YqpDhkBz53+OzTNs8Q42PohgBQjiZ6jgmpX2xVWKptcSHSz8k38GFeSLb5wjN@lists.linux.dev
X-Gm-Message-State: AOJu0Yw80iBnlW+sJsUNjfkWs4sVBss1jPmDi8eXO5OHyp0P1uRyhGCg
	bJ7gJtbfvQWWwhFymSmsfVG8OmPOr+e95qfVOyiLJsN1uuGsfsztfs4TNkq9v53U+ELD63cwDH4
	AKNUosQ==
X-Google-Smtp-Source: AGHT+IFC7xAn4XWvDZa+DWts2bu6U/q9MiuD8NVhGGMYnj7mARmR4s5Pdj0x5XwVYr8qoFGThh9Rt5tHVUE=
X-Received: from pjuw7.prod.google.com ([2002:a17:90a:d607:b0:32d:e4c6:7410])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:164d:b0:343:684c:f8ad
 with SMTP id 98e67ed59e1d1-349a24dd178mr797804a91.4.1764983466486; Fri, 05
 Dec 2025 17:11:06 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri,  5 Dec 2025 17:10:47 -0800
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.52.0.223.gf5cc29aaa4-goog
Message-ID: <20251206011054.494190-1-seanjc@google.com>
Subject: [PATCH v2 0/7] KVM: x86/tdx: Have TDX handle VMXON during bringup
From: Sean Christopherson <seanjc@google.com>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Kiryl Shutsemau <kas@kernel.org>, Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev, 
	kvm@vger.kernel.org, Chao Gao <chao.gao@intel.com>, 
	Dan Williams <dan.j.williams@intel.com>
Content-Type: text/plain; charset="UTF-8"

The idea here is to extract _only_ VMXON+VMXOFF and EFER.SVME toggling.  AFAIK
there's no second user of SVM, i.e. no equivalent to TDX, but I wanted to keep
things as symmetrical as possible.

TDX isn't a hypervisor, and isn't trying to be a hypervisor. Specifically, TDX
should _never_ have it's own VMCSes (that are visible to the host; the
TDX-Module has it's own VMCSes to do SEAMCALL/SEAMRET), and so there is simply
no reason to move that functionality out of KVM.

With that out of the way, dealing with VMXON/VMXOFF and EFER.SVME is a fairly
simple refcounting game.

Decently tested, and it seems like the core idea is sound, so I dropped the
RFC.  But the side of things definitely needs testing.

Note, this is based on kvm-x86/next, which doesn't have
EXPORT_SYMBOL_FOR_KVM(), and so the virt/hw.c exports need to be fixed up.
I'm sending now instead of waiting for -rc1 because I'm assuming I'll need to
spin at least v3 anyways :-)

v2:
 - Initialize the TDX-Module via subsys initcall instead of during
   tdx_init(). [Rick]
 - Isolate the __init and __ro_after_init changes. [Rick]
 - Use ida_is_empty() instead of manually tracking HKID usage. [Dan]
 - Don't do weird things with the refcounts when virt_rebooting is
   true. [Chao]
 - Drop unnecessary setting of virt_rebooting in KVM code. [Chao]
 - Rework things to have less X86_FEATURE_FOO code. [Rick]
 - Consolidate the CPU hotplug callbacks. [Chao]

v1 (RFC):
 - https://lore.kernel.org/all/20251010220403.987927-1-seanjc@google.com

Chao Gao (1):
  x86/virt/tdx: KVM: Consolidate TDX CPU hotplug handling

Sean Christopherson (6):
  KVM: x86: Move kvm_rebooting to x86
  KVM: x86: Extract VMXON and EFER.SVME enablement to kernel
  KVM: x86/tdx: Do VMXON and TDX-Module initialization during subsys
    init
  x86/virt/tdx: Tag a pile of functions as __init, and globals as
    __ro_after_init
  x86/virt/tdx: Use ida_is_empty() to detect if any TDs may be running
  KVM: Bury kvm_{en,dis}able_virtualization() in kvm_main.c once more

 Documentation/arch/x86/tdx.rst              |  26 --
 arch/x86/events/intel/pt.c                  |   1 -
 arch/x86/include/asm/kvm_host.h             |   3 +-
 arch/x86/include/asm/reboot.h               |  11 -
 arch/x86/include/asm/tdx.h                  |   4 -
 arch/x86/include/asm/virt.h                 |  26 ++
 arch/x86/include/asm/vmx.h                  |  11 +
 arch/x86/kernel/cpu/common.c                |   2 +
 arch/x86/kernel/crash.c                     |   3 +-
 arch/x86/kernel/reboot.c                    |  63 +---
 arch/x86/kernel/smp.c                       |   5 +-
 arch/x86/kvm/svm/svm.c                      |  34 +-
 arch/x86/kvm/svm/vmenter.S                  |  10 +-
 arch/x86/kvm/vmx/tdx.c                      | 209 ++----------
 arch/x86/kvm/vmx/vmcs.h                     |  11 -
 arch/x86/kvm/vmx/vmenter.S                  |   2 +-
 arch/x86/kvm/vmx/vmx.c                      | 127 +-------
 arch/x86/kvm/x86.c                          |  20 +-
 arch/x86/virt/Makefile                      |   2 +
 arch/x86/virt/hw.c                          | 340 ++++++++++++++++++++
 arch/x86/virt/vmx/tdx/tdx.c                 | 315 ++++++++++--------
 arch/x86/virt/vmx/tdx/tdx.h                 |   8 -
 arch/x86/virt/vmx/tdx/tdx_global_metadata.c |  10 +-
 include/linux/kvm_host.h                    |  10 +-
 virt/kvm/kvm_main.c                         |  31 +-
 25 files changed, 657 insertions(+), 627 deletions(-)
 create mode 100644 arch/x86/include/asm/virt.h
 create mode 100644 arch/x86/virt/hw.c


base-commit: 5d3e2d9ba9ed68576c70c127e4f7446d896f2af2
-- 
2.52.0.223.gf5cc29aaa4-goog

