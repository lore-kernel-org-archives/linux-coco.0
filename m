Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EA4917BA6
	for <linux-coco@lists.linux.dev>; Sat, 14 Feb 2026 01:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771032428; cv=none; b=pVh6URyIob+J+I4Ke71sbt2Zfx7dy/kUFQWGQmFBNYJK2Ofnr+KEb9/8EX9bdS/SaRvVlN1SZNNt7fNG8df2QHmGhB7aUvFYfzS4WOsz35NQAqeD82E/dbJUmttqDs7YoUtOQcLjTfqull46Z2cxLfxLdh/G2rXTQwFmy/uJku0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771032428; c=relaxed/simple;
	bh=2t5N3FXJK+jxONHHD2OiC/FqtJtqZpNApYEKRxh3Fw4=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=U/rsgDrZn1UWUEoeS6KsWrB482xIMZOW76UHxhW0C2HZNtlO6cedKWFRTw0zjJ612n+8NQToLGxqoAEAHAzvRXHJzmMg4DvuGWrakQGDz0IUDWYAZxPyx2Bve/YyL0BJ9Ma0PVQ/7cl2hlRSn+MlhgBXMbiNc0qMvs4JGwwBZK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=I3gXmv+u; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="I3gXmv+u"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-c6e194ab2f7so4693588a12.2
        for <linux-coco@lists.linux.dev>; Fri, 13 Feb 2026 17:27:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771032426; x=1771637226; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lKhpZhRObYUhkhowIAV7Tkup63qCI6eIK5L/iRnu7eE=;
        b=I3gXmv+uueweTqZuUTA5l85Z59Zess/z/6N6MvhJTF2htgROpnYCALhqHtDH7NZJ9/
         9xoxALLdLbn5SxTEUl1IZKn5waX0OJFeEsjyfu5+r28BuIHrNAZA4EQnp+POMtyIdVTL
         A5RdkgAWV5GS7Zo88OW0D71bAQ5tbyXJDn5t9ACCestR5SKjilsm+HZuYlyjICbcmkur
         PClQ0tD+DQ9NxK3/uH3xkJzTib5Q9Dw87k+z7lyp1y+S7rKNhWeA3EbF84+fmCfPmLp9
         knFVibt7mGR+g/qQz7D0piWVWmJHP6i0G7GVyviycztFL0MPuknZk7mgEm5nOsI2Xz9p
         JViQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771032426; x=1771637226;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lKhpZhRObYUhkhowIAV7Tkup63qCI6eIK5L/iRnu7eE=;
        b=LovSI16v5ZS3pEIwYdbNEAUsJNHV4P5dypUgOcLnxhh5aDvbXUcAqfjvHToZKPn/pD
         WYlLGBb+TeweBsk+hr7mPG6AVA9IdUk8LAr/BLwnoGINTdZR2EIU/UO90I4aZrYg7i/C
         weTnKorzYjwfnsQxkvSmx8g6IZfz71Z6OeBtpuylVVFzlyaXSoxintw/Sm3qrdGH1aIy
         cmew/W+9sOIGz91E0gQGuZqZbZjJDQrzbre66yj9Uxz6l+OLsUiBOgJSqaA4BVjRn1G/
         ckw4cj8fcEGM639vIg+Y07exze5X6vQWu9AC0KNsS36WJeqBtg4vdOj7T9LrTpl730Fq
         f7Qw==
X-Forwarded-Encrypted: i=1; AJvYcCXm73HbowRnq9U5bJhHuWQRW+r/evsaTyFq7k2G/Cvoi5VP5jHPprSG5Kv/miw/MQ0hH2TY4yp7tje/@lists.linux.dev
X-Gm-Message-State: AOJu0Ywg7eU0tvFtC7NHp0tlQ+m9pdSJoa7pxCT2/ogPck+sVSrw6O3E
	Yj64OzIOVCfcn9t4r8rzEzQrBOVqArwa6Z8H+/s6cvfX4OXjPVQKpULvuqvbIBdwx7K2zxwnDPw
	MytkzwQ==
X-Received: from pfbls2.prod.google.com ([2002:a05:6a00:7402:b0:7ee:f5f6:a02f])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:138c:b0:81f:829d:6f77
 with SMTP id d2e1a72fcca58-824d965c356mr992803b3a.67.1771032425651; Fri, 13
 Feb 2026 17:27:05 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 13 Feb 2026 17:26:46 -0800
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.53.0.310.g728cabbaf7-goog
Message-ID: <20260214012702.2368778-1-seanjc@google.com>
Subject: [PATCH v3 00/16] KVM: x86/tdx: Have TDX handle VMXON during bringup
From: Sean Christopherson <seanjc@google.com>
To: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Kiryl Shutsemau <kas@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev, 
	kvm@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	Chao Gao <chao.gao@intel.com>, Xu Yilun <yilun.xu@linux.intel.com>, 
	Dan Williams <dan.j.williams@intel.com>
Content-Type: text/plain; charset="UTF-8"

Assuming I didn't break anything between v2 and v3, I think this is ready to
rip.  Given the scope of the KVM changes, and that they extend outside of x86,
my preference is to take this through the KVM tree.  But a stable topic branch
in tip would work too, though I think we'd want it sooner than later so that
it can be used as a base. 

Chao, I deliberately omitted your Tested-by, as I shuffled things around enough
while splitting up the main patch that I'm not 100% positive I didn't regress
anything relative to v2.


The idea here is to extract _only_ VMXON+VMXOFF and EFER.SVME toggling.  AFAIK
there's no second user of SVM, i.e. no equivalent to TDX, but I wanted to keep
things as symmetrical as possible.

TDX isn't a hypervisor, and isn't trying to be a hypervisor. Specifically, TDX
should _never_ have it's own VMCSes (that are visible to the host; the
TDX-Module has it's own VMCSes to do SEAMCALL/SEAMRET), and so there is simply
no reason to move that functionality out of KVM.

With that out of the way, dealing with VMXON/VMXOFF and EFER.SVME is a fairly
simple refcounting game.

v3:
 - https://lore.kernel.org/all/20251206011054.494190-1-seanjc@google.com
 - Split up the move from KVM => virt into smaller patches. [Dan]
 - Collect reviews. [Dan, Chao, Dave]
 - Update sample dmesg output and hotplug angle in docs. [Chao]
 - Add comments in kvm_arch_shutdown() to try and explain the madness. [Dave]
 - Add a largely superfluous smp_wmb() in kvm_arch_shutdown() to provide a
   convienent location for documenting the flow. [Dave]
 - Disable preemption in x86_virt_{get,put}_ref() so that changes in how
   KVM and/or TDX use the APIs doesn't result in bugs. [Xu]
 - Add a patch to drop the bogus "IRQs must be disabled" rule in
   tdx_cpu_enable().
 - Tag more TDX helpers as __init. [Chao]
 - Don't treat loading kvm-intel.ko with tdx=1 as fatal if the system doesn't
   have a TDX-Module available. [Chao]

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

Sean Christopherson (15):
  KVM: x86: Move kvm_rebooting to x86
  KVM: VMX: Move architectural "vmcs" and "vmcs_hdr" structures to
    public vmx.h
  KVM: x86: Move "kvm_rebooting" to kernel as "virt_rebooting"
  KVM: VMX: Unconditionally allocate root VMCSes during boot CPU bringup
  x86/virt: Force-clear X86_FEATURE_VMX if configuring root VMCS fails
  KVM: VMX: Move core VMXON enablement to kernel
  KVM: SVM: Move core EFER.SVME enablement to kernel
  KVM: x86: Move bulk of emergency virtualizaton logic to virt subsystem
  x86/virt: Add refcounting of VMX/SVM usage to support multiple
    in-kernel users
  x86/virt/tdx: Drop the outdated requirement that TDX be enabled in IRQ
    context
  KVM: x86/tdx: Do VMXON and TDX-Module initialization during subsys
    init
  x86/virt/tdx: Tag a pile of functions as __init, and globals as
    __ro_after_init
  x86/virt/tdx: Use ida_is_empty() to detect if any TDs may be running
  KVM: Bury kvm_{en,dis}able_virtualization() in kvm_main.c once more
  KVM: TDX: Fold tdx_bringup() into tdx_hardware_setup()

 Documentation/arch/x86/tdx.rst              |  36 +-
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
 arch/x86/kvm/vmx/main.c                     |  19 +-
 arch/x86/kvm/vmx/tdx.c                      | 210 ++----------
 arch/x86/kvm/vmx/tdx.h                      |   8 +-
 arch/x86/kvm/vmx/vmcs.h                     |  11 -
 arch/x86/kvm/vmx/vmenter.S                  |   2 +-
 arch/x86/kvm/vmx/vmx.c                      | 138 +-------
 arch/x86/kvm/x86.c                          |  29 +-
 arch/x86/virt/Makefile                      |   2 +
 arch/x86/virt/hw.c                          | 359 ++++++++++++++++++++
 arch/x86/virt/vmx/tdx/tdx.c                 | 321 +++++++++--------
 arch/x86/virt/vmx/tdx/tdx.h                 |   8 -
 arch/x86/virt/vmx/tdx/tdx_global_metadata.c |  10 +-
 include/linux/kvm_host.h                    |  16 +-
 virt/kvm/kvm_main.c                         |  31 +-
 27 files changed, 717 insertions(+), 656 deletions(-)
 create mode 100644 arch/x86/include/asm/virt.h
 create mode 100644 arch/x86/virt/hw.c


base-commit: 183bb0ce8c77b0fd1fb25874112bc8751a461e49
-- 
2.53.0.310.g728cabbaf7-goog

