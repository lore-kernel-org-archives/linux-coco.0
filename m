Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27CCF200C3
	for <linux-coco@lists.linux.dev>; Fri, 20 Oct 2023 17:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Wp4/bH7P"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-27d10ef87caso927126a91.0
        for <linux-coco@lists.linux.dev>; Fri, 20 Oct 2023 10:07:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1697821656; x=1698426456; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=x4BWurQpapK412rcDC+pUyHudLjLoftq7UvjlE0wpgY=;
        b=Wp4/bH7PUzFcZi2UlDCZRQ6tx+Ukp2wNGdy4h/0VNoXJVdhnCJRZEcdXYxNUqpKBOM
         yy4fFO89S7HjZtf0bUj9qO272w0Uks+NKTTQkq4AvRCOF+v8cdCGSYOMlGOgRZOifbvV
         AXHjb0/EuZ7gC3IUyjfMWqtMGWSqoVwqGcs6TimU6hN4R63cT1JFMrvd5moJ2O9kmzYe
         gI0e1UHVGzBqxBWK49I267kUEQGriO1wE5voGQ8CaRia98anu/6pFkmz80SXZENTHsnM
         gOA+BNkq4wlcd5y0575nqcfPAyqoS/XnGSFPpmSndqceYJWnlbXqn2A1GHX75ZiNZqal
         C6/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697821656; x=1698426456;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x4BWurQpapK412rcDC+pUyHudLjLoftq7UvjlE0wpgY=;
        b=Vd9pWIFL+CJsmVK6B+lZs2988kXq5KgIzW2lKoGWdrHADm9ypLc5cuJjpzk/QW3Yug
         ApY33dgR7XyIdqRWMDu1NTVSkoL+/lEmnIeX+uXc1h9OLiMZc5oOA6aGgKf0Fb1tqDmG
         QOw25W6TmqSyeQ3FulQlXNp15TIe2LVApp00Kmcx/HUDm2B2a29MpH4C3GML8cOrnBSO
         twutcAHm6u/56/7tX+kmpEt+toiuVLB7mkpjBXcnWtUvDU+2jVdU+m9tST7+zSrl8Acb
         WRqpjJ9Q4EJu5PbzR3Rvf3TEvKAK/F1r/H3eopPwQ/rgPnb5TISA1ogyUj+c7b1yZ3mv
         ytPQ==
X-Gm-Message-State: AOJu0Yw0LTV1Emqc4UUtxdOMjvlU1X2TbkQqnVQgSyMIkDIhuZpVZBrr
	y4KNMXWNxpUP70jJbDnppI2KGbaxqTM=
X-Google-Smtp-Source: AGHT+IFD7JzGLSjKGr2CZcLV495hcYva5IMtUI4k4GCi8eJrVOm0W02oUecMyWYmDKA2AFrypQyXMTC0gf8=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:90a:ab88:b0:277:3135:bc4f with SMTP id
 n8-20020a17090aab8800b002773135bc4fmr57158pjq.1.1697821656319; Fri, 20 Oct
 2023 10:07:36 -0700 (PDT)
Date: Fri, 20 Oct 2023 17:07:34 +0000
In-Reply-To: <87wmvh47zb.fsf@redhat.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20231020151242.1814-1-kirill.shutemov@linux.intel.com>
 <20231020151242.1814-5-kirill.shutemov@linux.intel.com> <87wmvh47zb.fsf@redhat.com>
Message-ID: <ZTKg9XMxeBQ36f5L@google.com>
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

On Fri, Oct 20, 2023, Vitaly Kuznetsov wrote:
> > ---
> >  arch/x86/kernel/kvmclock.c | 12 ++++++++----
> >  1 file changed, 8 insertions(+), 4 deletions(-)
> >
> > diff --git a/arch/x86/kernel/kvmclock.c b/arch/x86/kernel/kvmclock.c
> > index fb8f52149be9..f2fff625576d 100644
> > --- a/arch/x86/kernel/kvmclock.c
> > +++ b/arch/x86/kernel/kvmclock.c
> > @@ -24,8 +24,8 @@
> >  
> >  static int kvmclock __initdata = 1;
> >  static int kvmclock_vsyscall __initdata = 1;
> > -static int msr_kvm_system_time __ro_after_init = MSR_KVM_SYSTEM_TIME;
> > -static int msr_kvm_wall_clock __ro_after_init = MSR_KVM_WALL_CLOCK;
> > +static int msr_kvm_system_time __ro_after_init;
> > +static int msr_kvm_wall_clock __ro_after_init;
> >  static u64 kvm_sched_clock_offset __ro_after_init;
> >  
> >  static int __init parse_no_kvmclock(char *arg)
> > @@ -195,7 +195,8 @@ static void kvm_setup_secondary_clock(void)
> >  
> >  void kvmclock_disable(void)
> >  {
> > -	native_write_msr(msr_kvm_system_time, 0, 0);
> > +	if (msr_kvm_system_time)
> > +		native_write_msr(msr_kvm_system_time, 0, 0);
> >  }
> >  
> >  static void __init kvmclock_init_mem(void)
> > @@ -294,7 +295,10 @@ void __init kvmclock_init(void)
> >  	if (kvm_para_has_feature(KVM_FEATURE_CLOCKSOURCE2)) {
> >  		msr_kvm_system_time = MSR_KVM_SYSTEM_TIME_NEW;
> >  		msr_kvm_wall_clock = MSR_KVM_WALL_CLOCK_NEW;
> > -	} else if (!kvm_para_has_feature(KVM_FEATURE_CLOCKSOURCE)) {
> > +	} else if (kvm_para_has_feature(KVM_FEATURE_CLOCKSOURCE)) {
> > +		msr_kvm_system_time = MSR_KVM_SYSTEM_TIME;
> > +		msr_kvm_wall_clock = MSR_KVM_WALL_CLOCK;
> > +	} else {
> >  		return;
> >  	}
> 
> This should work, so
> 
> Reviewed-by: Vitaly Kuznetsov <vkuznets@redhat.com>
> 
> but my personal preference would be to change kvm_guest_cpu_offline()
> to check KVM features explicitly instead of checking MSRs against '0'
> at least becase it already does so for other features. Completely
> untested:
> 
> diff --git a/arch/x86/kernel/kvm.c b/arch/x86/kernel/kvm.c
> index b8ab9ee5896c..1ee49c98e70a 100644
> --- a/arch/x86/kernel/kvm.c
> +++ b/arch/x86/kernel/kvm.c
> @@ -454,7 +454,9 @@ static void kvm_guest_cpu_offline(bool shutdown)
>         kvm_pv_disable_apf();
>         if (!shutdown)
>                 apf_task_wake_all();
> -       kvmclock_disable();
> +       if (kvm_para_has_feature(KVM_FEATURE_CLOCKSOURCE2) ||
> +           kvm_para_has_feature(KVM_FEATURE_CLOCKSOURCE))
> +               kvmclock_disable();
>  }

That would result in an unnecessray WRMSR in the case where kvmclock is disabled
on the command line.  It _should_ be benign given how the code is written, but
it's not impossible to imagine a scenario where someone disabled kvmclock in the
guest because of a hypervisor bug.  And the WRMSR would become a bogus write to
MSR 0x0 if someone made a "cleanup" to set msr_kvm_system_time if and only if
kvmclock is actually used, e.g. if someone made Kirill's change sans the check in
kvmclock_disable().
