Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B16026AA98
	for <linux-coco@lists.linux.dev>; Fri, 10 Oct 2025 22:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760133856; cv=none; b=abFXcaMgqnw9ZNWkkJh6iZ4MQmWmbKEUinUZyZlf4dZs0rb02GaoAEoBY9n34a+QMx3/mp/ApYczkiHgN2u44xx6jBKtiR88HyWgakKi12ZNOPvmvJdXIQqLlNdiU0D9UqQ6XOLpcY8OHGdNpJpXJC2RoRsI4cApy3pBA3+/IaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760133856; c=relaxed/simple;
	bh=Qwp0vKBxcofJQSlpmHnot19xGPRqp7ng2EA2LF7B890=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=rXU0iqQKmucnVaEKntoBAHBEcnypHrt49pz8DfLbKZskQFh8IThVrntbXNap103VrAC9P/xFNMlz39LYKh57ESvTX6ROwRWgwvWUoRCVRKqEpJMFq5nq9zCsYAsBvMUZyYz73iuej/SiRTMXidyHTJfy1ronVT+cqgs1oP1l3rA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=euDQuu34; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="euDQuu34"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-330a4d5c4efso5752941a91.0
        for <linux-coco@lists.linux.dev>; Fri, 10 Oct 2025 15:04:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760133853; x=1760738653; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8kxsnh7Lf4PFce86sU0Kf6zmghZZp3Xzf73zLUbJitM=;
        b=euDQuu34VczC2DpHwOg7+P32xrwklQvn9XXmLD3A73R/Oq2KZAdsaCgUInQIw/Q6v3
         8iIr4VhO2XbIJhzfY0PePkewpQxYbhYLAP2q4Lf6H+/rpZ19b5rn61GQlm15R5oo9B1U
         KMYkK2H+Asi1gr67+a2jcMcE19eOFaUW8kY2SJ/JcsG3R+o/p4u4JJVa94OTF8qveapq
         HixDEplX5jboq9iZabbYnvEQmJda/960pziIx/U5C/xZtEb4dRjWY34lkeS3x0LbAXju
         wCgiIhfBMwGX4L1N+R7DoGz+4a40byjJeBD7Gx6kNNAUyi2xYop7NSryyaUeOvn6Fd6E
         kRmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760133853; x=1760738653;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8kxsnh7Lf4PFce86sU0Kf6zmghZZp3Xzf73zLUbJitM=;
        b=trEbQjD4+zLE80a4fkI3nrNDz69xIPooZv3Ef8RpLd6RLrFgFdOJqcTYexNidnz4Tb
         drhYPT0gI6S4T140W+2aMYF/ktVqUYOr086GMjiBjoO64fhNw91sldlXFRL+JPFOlYG2
         mtkeas3BU3Ed6YqtOogKhUMI7LptSJqxG417y9pv+cSomylnlyRKAraB8vuzhwfdD8S5
         wF9lNsyKkpXJetAO5vtHCOrukDbWcR1puMQzYFZSIng4/iX5FqEiC6GGfPNVw4BTxxpK
         YDaqVEXlpQEQ4pWoGdfz/nHfu/IcHoCImJbobkoDIFKwmy52Z6QXcj2rzTLM4z8Vyj4i
         uJUQ==
X-Forwarded-Encrypted: i=1; AJvYcCWj9FmgLP0Ww5sL6pyWAhWR2ERcxAoe/ssYriW+30kxtOYfPKGpfwbV9PNZCIrFI+oLyLjtrwCKNAZh@lists.linux.dev
X-Gm-Message-State: AOJu0YzLr92tEPt/vfb6fLJ34weaGtK7XOG+/xr3J9560KY4Pgrh4tAe
	HyEisqeGAnq+H9WZ5OM2SHTS+LTmJM/oAR2229CwIImZiS8dkF43YdePmYM/rmp8pBxlaOyVujT
	N1Ao3Rw==
X-Google-Smtp-Source: AGHT+IF8yU5hLVziWQu1locPXLw/zCrVsnEYJRRBaU69uVPaP6twy1QhZpURLIs5h6V1MrNtkzkKumU4R3U=
X-Received: from pjbga22.prod.google.com ([2002:a17:90b:396:b0:32f:46d:993b])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4a8e:b0:32b:dfdb:b27f
 with SMTP id 98e67ed59e1d1-33b5138e27emr19495508a91.17.1760133853177; Fri, 10
 Oct 2025 15:04:13 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 10 Oct 2025 15:03:58 -0700
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.51.0.740.g6adb054d12-goog
Message-ID: <20251010220403.987927-1-seanjc@google.com>
Subject: [RFC PATCH 0/4] KVM: x86/tdx: Have TDX handle VMXON during bringup
From: Sean Christopherson <seanjc@google.com>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"Kirill A. Shutemov" <kas@kernel.org>, Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev, 
	kvm@vger.kernel.org, Chao Gao <chao.gao@intel.com>, 
	Dan Williams <dan.j.williams@intel.com>, Xin Li <xin@zytor.com>, 
	Kai Huang <kai.huang@intel.com>, Adrian Hunter <adrian.hunter@intel.com>
Content-Type: text/plain; charset="UTF-8"

This is a sort of middle ground between fully yanking core virtualization
support out of KVM, and unconditionally doing VMXON during boot[0].

I got quite far long on rebasing some internal patches we have to extract the
core virtualization bits out of KVM x86, but as I paged back in all of the
things we had punted on (because they were waaay out of scope for our needs),
I realized more and more that providing truly generic virtualization
instrastructure is vastly different than providing infrastructure that can be
shared by multiple instances of KVM (or things very similar to KVM)[1].

So while I still don't want to blindly do VMXON, I also think that trying to
actually support another in-tree hypervisor, without an imminent user to drive
the development, is a waste of resources, and would saddle KVM with a pile of
pointless complexity.

The idea here is to extract _only_ VMXON+VMXOFF and EFER.SVME toggling.  AFAIK
there's no second user of SVM, i.e. no equivalent to TDX, but I wanted to keep
things as symmetrical as possible.

Emphasis on "only", because leaving VMCS tracking and clearing in KVM is
another key difference from Xin's series.  The "light bulb" moment on that
front is that TDX isn't a hypervisor, and isn't trying to be a hypervisor.
Specifically, TDX should _never_ have it's own VMCSes (that are visible to the
host; the TDX-Module has it's own VMCSes to do SEAMCALL/SEAMRET), and so there
is simply no reason to move that functionality out of KVM.

With that out of the way, dealing with VMXON/VMXOFF and EFER.SVME is a fairly
simple refcounting game.

Oh, and I didn't bother looking to see if it would work, but if TDX only needs
VMXON during boot, then the TDX use of VMXON could be transient.  I.e. TDX
could simply blast on_each_cpu() and forego the cpuhp and syscore hooks (a
non-emergency reboot during init isn't possible).  I don't particuarly care
what TDX does, as it's a fairly minor detail all things concerned.  I went with
the "harder" approach, e.g. to validate keeping the VMXON users count elevated
would do the right thing with respect to CPU offlining, etc.

Lightly tested (see the hacks below to verify the TDX side appears to do what
it's supposed to do), but it seems to work?  Heavily RFC, e.g. the third patch
in particular needs to be chunked up, I'm sure there's polishing to be done,
etc.

[0] https://lore.kernel.org/all/20250909182828.1542362-1-xin@zytor.com
[1] https://lore.kernel.org/all/aOl5EutrdL_OlVOO@google.com

Sean Christopherson (4):
  KVM: x86: Move kvm_rebooting to x86
  KVM: x86: Extract VMXON and EFER.SVME enablement to kernel
  KVM: x86/tdx: Do VMXON and TDX-Module initialization during tdx_init()
  KVM: Bury kvm_{en,dis}able_virtualization() in kvm_main.c once more

 Documentation/arch/x86/tdx.rst              |  26 --
 arch/x86/events/intel/pt.c                  |   1 -
 arch/x86/include/asm/reboot.h               |   3 -
 arch/x86/include/asm/tdx.h                  |   4 -
 arch/x86/include/asm/virt.h                 |  21 ++
 arch/x86/include/asm/vmx.h                  |  11 +
 arch/x86/kernel/cpu/common.c                |   2 +
 arch/x86/kernel/reboot.c                    |  11 -
 arch/x86/kvm/svm/svm.c                      |  34 +-
 arch/x86/kvm/svm/vmenter.S                  |  10 +-
 arch/x86/kvm/vmx/tdx.c                      | 190 +++---------
 arch/x86/kvm/vmx/vmcs.h                     |  11 -
 arch/x86/kvm/vmx/vmenter.S                  |   2 +-
 arch/x86/kvm/vmx/vmx.c                      | 128 +-------
 arch/x86/kvm/x86.c                          |  18 +-
 arch/x86/virt/Makefile                      |   2 +
 arch/x86/virt/hw.c                          | 327 ++++++++++++++++++++
 arch/x86/virt/vmx/tdx/tdx.c                 | 292 +++++++++--------
 arch/x86/virt/vmx/tdx/tdx.h                 |   8 -
 arch/x86/virt/vmx/tdx/tdx_global_metadata.c |  10 +-
 include/linux/kvm_host.h                    |  10 +-
 virt/kvm/kvm_main.c                         |  31 +-
 22 files changed, 622 insertions(+), 530 deletions(-)
 create mode 100644 arch/x86/include/asm/virt.h
 create mode 100644 arch/x86/virt/hw.c


base-commit: efcebc8f7aeeba15feb1a5bde70af74d96bf1a76
-- 
2.51.0.740.g6adb054d12-goog

