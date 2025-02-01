Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 349501BC3F
	for <linux-coco@lists.linux.dev>; Sat,  1 Feb 2025 02:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738376250; cv=none; b=BPmmmZLKUpXWwnJXuUouyhGfMZax9YMc60CRV5u0iK052MfqpI37WcqESzu2vy5nTXE9nYaLBh/JSkChCjPtQsY4p/n8NyYwu4t3N3lNo56T635f5evGZ4HNExNM2C08AxDzXH+9fsvWuPv75xZNCRExzQedZzJIV8zpNELeBnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738376250; c=relaxed/simple;
	bh=czE4vHieuE0f098+c8QgKQmkSyW9XE5v2cPcm44Mx3I=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=MlfZMfYzsYwd/NU6sG2xpDmmPq55iLEJ1Hggr5u5W3+F4zVV7mjpeNfEuYVSEtl81nTO0ioY1gPO7i7WGCN1l8DgKuoUbdkmS7H12M/LzKnViW4Uvj2sRq0xNg4xX94VZJFbB8IHkd8zgFXcFdUK/+CaUl4hfDew4pUPsLLOEs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MkTX1qGi; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MkTX1qGi"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-2efc3292021so7280887a91.1
        for <linux-coco@lists.linux.dev>; Fri, 31 Jan 2025 18:17:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738376247; x=1738981047; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cq2j2i7xKbEmxmaKlx5ycVjsc6NUu7PBqfSVX6ZfTN4=;
        b=MkTX1qGiITgTQRfTRFOdQHbqdbMtfGM11Y1PAPsAc+RsnWSXbJdZbDt6izNfdLHOSZ
         LFXWAFfLrXurls7NZX2cy/3scDMwm8BNhqI83UoM5DX28nYGXKwXETfBCdromMzckU23
         AVkoiO8Ry8LqjFFjDnn81TzBZTEBINgNdJLOHvFcqyMk4tavvQrMWlHrztfsFQZRGCvW
         1sdmb9D6KQbea1DGvAN5AFUzNap3cx6ROcubCwSxexuVcVzrPOiC4kgYkyVUBPfxuMcB
         x7D2G/9zVyZvWfoUS0aVoP8zxk1PZpVHZOiEHGONIYDR8XIR632l7sps4IbPJcMgAuuY
         eSow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738376247; x=1738981047;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Cq2j2i7xKbEmxmaKlx5ycVjsc6NUu7PBqfSVX6ZfTN4=;
        b=Ztym8MeNak0QK4Y+HDJM2EXVwzz5wQlxULMN7yp83y2P2u/ENpqQ66BySll7zALaQa
         KLnR8eyF1XCKOjXLRhayos/ybnJBhZ69dP3W/YiJWNgU1G+ZoWZf50XHAy5Vl3u5BexT
         4KG6zW/v7y9wnsafAl9BiL2hewWDFM3M6PbTw5+9ogs3ZUmFP4l1jwlG4R9oHuAmwy1v
         HBEmG4R9mQ7jzopNUJKKLwfAFu4mG5ZzIoe0WW56HP1nFdwlXd3EdNIDvpDGkscHptfy
         LWOYKj+ve4vkUdfa489h+e5wr9IMmsQ+RLzcNFx/5DDYrc5z97fpT9syP77HaZBbhABH
         Q1eg==
X-Forwarded-Encrypted: i=1; AJvYcCXNg2xuUOOFE5xVjPbkky4jno6MV3tLOb+WO0Zd+V07I+MnooLfcZN1vUSi+LuPoXj2lhTDAU/PRAZs@lists.linux.dev
X-Gm-Message-State: AOJu0Yysh5GobkaQXxhm9uOY398IAhllmObOGKwg9I9S0D4eqDwZHglO
	e9roz1du/eVkaiwBUkWzf5dXZTeSuQXOFuXq5t9N1oNyt6zDBKUyXHW3c8vQs/RMBzCflddXwQf
	ozw==
X-Google-Smtp-Source: AGHT+IEXms2W7h6OPbgfhbPe+T0bjO3rPyG4kBeOBL1XLya2FJ/dryX9qDtrHv/AVlJBJdJ2J5PBFLJRbi4=
X-Received: from pjbsw11.prod.google.com ([2002:a17:90b:2c8b:b0:2ef:a732:f48d])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:258c:b0:2ee:f687:6acb
 with SMTP id 98e67ed59e1d1-2f83abd9998mr19471173a91.13.1738376247517; Fri, 31
 Jan 2025 18:17:27 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 31 Jan 2025 18:17:02 -0800
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.48.1.362.g079036d154-goog
Message-ID: <20250201021718.699411-1-seanjc@google.com>
Subject: [PATCH 00/16] x86/tsc: Try to wrangle PV clocks vs. TSC
From: Sean Christopherson <seanjc@google.com>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Juergen Gross <jgross@suse.com>, 
	"K. Y. Srinivasan" <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Dexuan Cui <decui@microsoft.com>, Ajay Kaher <ajay.kaher@broadcom.com>, 
	Alexey Makhalov <alexey.amakhalov@broadcom.com>, Jan Kiszka <jan.kiszka@siemens.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Andy Lutomirski <luto@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>
Cc: linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev, 
	virtualization@lists.linux.dev, linux-hyperv@vger.kernel.org, 
	jailhouse-dev@googlegroups.com, kvm@vger.kernel.org, 
	xen-devel@lists.xenproject.org, Sean Christopherson <seanjc@google.com>, 
	Nikunj A Dadhania <nikunj@amd.com>, Tom Lendacky <thomas.lendacky@amd.com>
Content-Type: text/plain; charset="UTF-8"

Attempt to bring some amount of order to the PV clocks vs. TSC madness in
the kernel.  The primary goal of this series is to fix flaws with SNP
and TDX guests where a PV clock provided by the untrusted hypervisor is
used instead of the secure/trusted TSC that is controlled by trusted
firmware.

The secondary goal (last few patches) is to draft off of the SNP and TDX
changes to slightly modernize running under KVM.  Currently, KVM guests
will use TSC for clocksource, but not sched_clock.  And they ignore Intel's
CPUID-based TSC and CPU frequency enumeration, even when using the TSC
instead of kvmclock.  And if the host provides the core crystal frequency
in CPUID.0x15, then KVM guests can use that for the APIC timer period
instead of manually calibrating the frequency.

Lots more background: https://lore.kernel.org/all/20250106124633.1418972-13-nikunj@amd.com

This is all *very* lightly tested (borderline RFC).

Sean Christopherson (16):
  x86/tsc: Add a standalone helpers for getting TSC info from CPUID.0x15
  x86/tsc: Add standalone helper for getting CPU frequency from CPUID
  x86/tsc: Add helper to register CPU and TSC freq calibration routines
  x86/sev: Mark TSC as reliable when configuring Secure TSC
  x86/sev: Move check for SNP Secure TSC support to tsc_early_init()
  x86/tdx: Override PV calibration routines with CPUID-based calibration
  x86/acrn: Mark TSC frequency as known when using ACRN for calibration
  x86/tsc: Pass KNOWN_FREQ and RELIABLE as params to registration
  x86/tsc: Rejects attempts to override TSC calibration with lesser
    routine
  x86/paravirt: Move handling of unstable PV clocks into
    paravirt_set_sched_clock()
  x86/paravirt: Don't use a PV sched_clock in CoCo guests with trusted
    TSC
  x86/kvmclock: Mark TSC as reliable when it's constant and nonstop
  x86/kvmclock: Get CPU base frequency from CPUID when it's available
  x86/kvmclock: Get TSC frequency from CPUID when its available
  x86/kvmclock: Stuff local APIC bus period when core crystal freq comes
    from CPUID
  x86/kvmclock: Use TSC for sched_clock if it's constant and non-stop

 arch/x86/coco/sev/core.c        |  9 ++--
 arch/x86/coco/tdx/tdx.c         | 27 ++++++++--
 arch/x86/include/asm/paravirt.h |  7 ++-
 arch/x86/include/asm/tdx.h      |  2 +
 arch/x86/include/asm/tsc.h      | 67 +++++++++++++++++++++++++
 arch/x86/kernel/cpu/acrn.c      |  5 +-
 arch/x86/kernel/cpu/mshyperv.c  | 11 +++--
 arch/x86/kernel/cpu/vmware.c    |  9 ++--
 arch/x86/kernel/jailhouse.c     |  6 +--
 arch/x86/kernel/kvmclock.c      | 88 +++++++++++++++++++++++----------
 arch/x86/kernel/paravirt.c      | 15 +++++-
 arch/x86/kernel/tsc.c           | 74 ++++++++++++++++-----------
 arch/x86/mm/mem_encrypt_amd.c   |  3 --
 arch/x86/xen/time.c             |  4 +-
 14 files changed, 243 insertions(+), 84 deletions(-)


base-commit: ebbb8be421eefbe2d47b99c2e1a6dd840d7930f9
-- 
2.48.1.362.g079036d154-goog

