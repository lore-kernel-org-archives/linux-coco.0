Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F61A12B60
	for <linux-coco@lists.linux.dev>; Mon, 23 Oct 2023 14:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SQmTT8K4"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-5b8ae483459so681230a12.1
        for <linux-coco@lists.linux.dev>; Mon, 23 Oct 2023 07:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698072052; x=1698676852; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=TOIO+H7vBCJRfyqao5vTRDK/ZnUXqp5753SeNzy629c=;
        b=SQmTT8K4BcJy0LfZxbcH4hVbz3sLrWBV3x0wUWyAVIvPQXlb0fHUBRN/16EcZ5fcW9
         PjYOKd1dgOJ1zFpJMQqaI0wpIRsHhBOCD0tZ/FwkbvTMdencz5GYX84nS/Td0vGG6S2t
         mwbXQAeRDlAFFnfk8CgxWz/A6lvkcxjYo+787m6y5XZbMzfbUE7WwoAUjJkUzwiNh3A0
         5gAiZ/Oxd05vNQrwtpP7YQouX/XHZvvliX+ZIXEu3ixDJ/zYKcaqPh6bL9kaWbwqaHXo
         /K2ZaUTzt1uKu3g1w8mmYp2tA78IQA2pJ5KIyXf9SnOP21/fx7XesvOzpClaHg7baHHo
         FdCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698072052; x=1698676852;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TOIO+H7vBCJRfyqao5vTRDK/ZnUXqp5753SeNzy629c=;
        b=f9Ak3e0N7k1njudTop/nhGFA4k//9egW33neD9wQOgEn20XEcCvPWxAObhFYJ+tIBz
         Zg4XCghPOSMVc8iIHUFSNsqkNQ7P0Ze+0yR9UwzFGMdyJEmVJzHLjHUlT6pw48mlW1PK
         +uVBFlkc3VI0Jj9aCuUQ/uTCRfNTh9rosiRWZOEySRBUiRrB/xpc1ItkJQq01lNSSs9e
         pjKJPU8UFXHuHUE71mxrxnOKkj8yZ2wog61qGg3XfVcqcpqExMPNQt1EKt05FCWSW74f
         3pcRi7EJgsImDsEGW+m3iU+DjDIUreHqMZVX1mgKyBsoBDtKol05jmXl/q2b9l5kuZ4e
         ktgQ==
X-Gm-Message-State: AOJu0YxX1D7vNkTlKiPxe+3yuBOPf9/cup9Clb6KNkH2UvXu5bVVHpWm
	ZQQWS83lvnjLgJQCfd2+UDBr6PEl46A=
X-Google-Smtp-Source: AGHT+IExAuTTDvPv+uDKpzbze6eiqwdc7PLWiowzJWFsT1Fls/h45TIz/DhVhP8uEFt0TqXIZLj2MgO8bn8=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a63:e551:0:b0:584:dd94:24c1 with SMTP id
 z17-20020a63e551000000b00584dd9424c1mr155269pgj.11.1698072052492; Mon, 23 Oct
 2023 07:40:52 -0700 (PDT)
Date: Mon, 23 Oct 2023 07:40:50 -0700
In-Reply-To: <87r0ll4thx.fsf@redhat.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20231020151242.1814-1-kirill.shutemov@linux.intel.com>
 <20231020151242.1814-5-kirill.shutemov@linux.intel.com> <87wmvh47zb.fsf@redhat.com>
 <ZTKg9XMxeBQ36f5L@google.com> <87r0ll4thx.fsf@redhat.com>
Message-ID: <ZTaF8n9WM5BQ3rYS@google.com>
Subject: Re: [PATCHv2 04/13] x86/kvm: Do not try to disable kvmclock if it was
 not enabled
From: Sean Christopherson <seanjc@google.com>
To: Vitaly Kuznetsov <vkuznets@redhat.com>
Cc: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, 
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, 
	Elena Reshetova <elena.reshetova@intel.com>, Jun Nakajima <jun.nakajima@intel.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Tom Lendacky <thomas.lendacky@amd.com>, 
	Ashish Kalra <ashish.kalra@amd.com>, Kai Huang <kai.huang@intel.com>, Baoquan He <bhe@redhat.com>, 
	kexec@lists.infradead.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, 
	Wanpeng Li <wanpengli@tencent.com>
Content-Type: text/plain; charset="us-ascii"

On Mon, Oct 23, 2023, Vitaly Kuznetsov wrote:
> Sean Christopherson <seanjc@google.com> writes:
> 
> > On Fri, Oct 20, 2023, Vitaly Kuznetsov wrote:
> >> diff --git a/arch/x86/kernel/kvm.c b/arch/x86/kernel/kvm.c
> >> index b8ab9ee5896c..1ee49c98e70a 100644
> >> --- a/arch/x86/kernel/kvm.c
> >> +++ b/arch/x86/kernel/kvm.c
> >> @@ -454,7 +454,9 @@ static void kvm_guest_cpu_offline(bool shutdown)
> >>         kvm_pv_disable_apf();
> >>         if (!shutdown)
> >>                 apf_task_wake_all();
> >> -       kvmclock_disable();
> >> +       if (kvm_para_has_feature(KVM_FEATURE_CLOCKSOURCE2) ||
> >> +           kvm_para_has_feature(KVM_FEATURE_CLOCKSOURCE))
> >> +               kvmclock_disable();
> >>  }
> >
> > That would result in an unnecessray WRMSR in the case where kvmclock is disabled
> > on the command line.  It _should_ be benign given how the code is written, but
> > it's not impossible to imagine a scenario where someone disabled kvmclock in the
> > guest because of a hypervisor bug.  And the WRMSR would become a bogus write to
> > MSR 0x0 if someone made a "cleanup" to set msr_kvm_system_time if and only if
> > kvmclock is actually used, e.g. if someone made Kirill's change sans the check in
> > kvmclock_disable().
> 
> True but we don't have such module params to disable other PV features so
> e.g. KVM_FEATURE_PV_EOI/KVM_FEATURE_MIGRATION_CONTROL are written to
> unconditionally. Wouldn't it be better to handle parameters like
> 'no-kvmclock' by clearing the feature bit in kvm_arch_para_features()'s
> return value so all kvm_para_has_feature() calls for it just return
> 'false'? We can even do an umbreall "no-kvm-features=<mask>" to cover
> all possible debug cases.

I don't know that it's worth the effort, or that it'd even be a net positive.

Today, kvm_para_has_feature() goes through to CPUID every time, e.g. we'd have
to add a small bit of infrastructure to snapshot and clear bits, or rework things
to let kvm_para_has_feature peek at kvmclock.

And things like KVM_FEATURE_PV_TLB_FLUSH would be quite weird, e.g. we either end
up leaving the feature bit set while returning "false" for pv_tlb_flush_supported(),
or we'd clear the feature bit for a rather large number of conditions that don't
really have anything to do with KVM_FEATURE_PV_TLB_FLUSH being available.

  static bool pv_tlb_flush_supported(void)
  {
	return (kvm_para_has_feature(KVM_FEATURE_PV_TLB_FLUSH) &&
		!kvm_para_has_hint(KVM_HINTS_REALTIME) &&
		kvm_para_has_feature(KVM_FEATURE_STEAL_TIME) &&
		!boot_cpu_has(X86_FEATURE_MWAIT) &&
		(num_possible_cpus() != 1));
  }
