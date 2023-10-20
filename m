Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B9B61DA49
	for <linux-coco@lists.linux.dev>; Fri, 20 Oct 2023 15:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Wf5IhMV9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1697816477;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aa4iee+yZHK+8BBdXmj4PGqXcZj5CIosrDU7qDGuMQQ=;
	b=Wf5IhMV9IdAjdLBTh7R8XMfMQgf/nVlzo6nANo8AA/KAC1cjI/PqgN3EEfattX6HYCrfNh
	dFJf3NgU8urXVv28Go7tKhHTdCz34E2h2I8dR6YymR5SJ/1Unc8GaGtrnTUaLb7/iZxBR5
	F/tYzIfm0klVcZATyYTylrUic0VVFIg=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-653-fdrYLPNjOh-xOBFeKhlNQA-1; Fri, 20 Oct 2023 11:41:16 -0400
X-MC-Unique: fdrYLPNjOh-xOBFeKhlNQA-1
Received: by mail-lf1-f69.google.com with SMTP id 2adb3069b0e04-5079f6c127cso924011e87.3
        for <linux-coco@lists.linux.dev>; Fri, 20 Oct 2023 08:41:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697816475; x=1698421275;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aa4iee+yZHK+8BBdXmj4PGqXcZj5CIosrDU7qDGuMQQ=;
        b=EC2RyxNH1tl6o4vRaSM6GTZOiwjYKQ/1mpueaU/4xQiNBD1VyKZhDtvaLJd7FApxmM
         Qn/Bi/g/CGfXEfUMh80tLgmtAQV3u/A8zL1Hnx8bhjXS7d3C7aIJWpnjFjOf7WNwVljk
         eF3BMXhwXODOzihtps0NXRVK61mhCnPxT0geucxR2zL9OI9XaeHVxhleVlExt8RQhQcZ
         /96oh9liPenxIKTmr4hY7vBophvy+EI2gs7TbD7oxSRVW2wrvFVxKvzOky2eSCYN/gjS
         BVulSPdtWdW5Ipe3g/SOkgZFeMCt9lL4q4bsjVUZsF/tFp9O9qaU0LbG6MXg78b2nQdr
         uAaw==
X-Gm-Message-State: AOJu0YyELgvI5VORU3p6vLTlBejOZBEVTd22ouYWhVllyee1dpIE6cS6
	RZQcQLV3nJKw77SstbppVCH1yDvFEhoB8MO1uz3LbkrUQq80EWPriZiDbtRDM9HSjb4wk+MffIs
	4Db5SLw/SIllQPJJv/OtlRA==
X-Received: by 2002:a19:500c:0:b0:502:cc8d:f20a with SMTP id e12-20020a19500c000000b00502cc8df20amr1641012lfb.27.1697816474863;
        Fri, 20 Oct 2023 08:41:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEx40VYFF8tpxC5v03dVRu4wq4nsq5G+AfVDRR5o1snolIVICfC2CekJy5f8SCZ1z4mgxc/Og==
X-Received: by 2002:a19:500c:0:b0:502:cc8d:f20a with SMTP id e12-20020a19500c000000b00502cc8df20amr1640982lfb.27.1697816474535;
        Fri, 20 Oct 2023 08:41:14 -0700 (PDT)
Received: from fedora (g2.ign.cz. [91.219.240.8])
        by smtp.gmail.com with ESMTPSA id k13-20020a50c8cd000000b0053443c8fd90sm1642437edh.24.2023.10.20.08.41.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Oct 2023 08:41:14 -0700 (PDT)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Thomas Gleixner
 <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov
 <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Peter Zijlstra
 <peterz@infradead.org>, Adrian Hunter <adrian.hunter@intel.com>,
 Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 Elena Reshetova <elena.reshetova@intel.com>, Jun Nakajima
 <jun.nakajima@intel.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>, Tom
 Lendacky <thomas.lendacky@amd.com>, "Kalra, Ashish"
 <ashish.kalra@amd.com>, Sean Christopherson <seanjc@google.com>, "Huang,
 Kai" <kai.huang@intel.com>, Baoquan He <bhe@redhat.com>,
 kexec@lists.infradead.org, linux-coco@lists.linux.dev,
 linux-kernel@vger.kernel.org, "Kirill A. Shutemov"
 <kirill.shutemov@linux.intel.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Wanpeng Li <wanpengli@tencent.com>
Subject: Re: [PATCHv2 04/13] x86/kvm: Do not try to disable kvmclock if it
 was not enabled
In-Reply-To: <20231020151242.1814-5-kirill.shutemov@linux.intel.com>
References: <20231020151242.1814-1-kirill.shutemov@linux.intel.com>
 <20231020151242.1814-5-kirill.shutemov@linux.intel.com>
Date: Fri, 20 Oct 2023 17:41:12 +0200
Message-ID: <87wmvh47zb.fsf@redhat.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com> writes:

> kvm_guest_cpu_offline() tries to disable kvmclock regardless if it is
> present in the VM. It leads to write to a MSR that doesn't exist on some
> configurations, namely in TDX guest:
>
> 	unchecked MSR access error: WRMSR to 0x12 (tried to write 0x0000000000000000)
> 	at rIP: 0xffffffff8110687c (kvmclock_disable+0x1c/0x30)
>
> kvmclock enabling is gated by CLOCKSOURCE and CLOCKSOURCE2 KVM paravirt
> features.
>
> Do not disable kvmclock if it was not enabled.
>
> Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
> Fixes: c02027b5742b ("x86/kvm: Disable kvmclock on all CPUs on shutdown")
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Wanpeng Li <wanpengli@tencent.com>
> Cc: Vitaly Kuznetsov <vkuznets@redhat.com>
> Cc: Sean Christopherson <seanjc@google.com>
> ---
>  arch/x86/kernel/kvmclock.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
>
> diff --git a/arch/x86/kernel/kvmclock.c b/arch/x86/kernel/kvmclock.c
> index fb8f52149be9..f2fff625576d 100644
> --- a/arch/x86/kernel/kvmclock.c
> +++ b/arch/x86/kernel/kvmclock.c
> @@ -24,8 +24,8 @@
>  
>  static int kvmclock __initdata = 1;
>  static int kvmclock_vsyscall __initdata = 1;
> -static int msr_kvm_system_time __ro_after_init = MSR_KVM_SYSTEM_TIME;
> -static int msr_kvm_wall_clock __ro_after_init = MSR_KVM_WALL_CLOCK;
> +static int msr_kvm_system_time __ro_after_init;
> +static int msr_kvm_wall_clock __ro_after_init;
>  static u64 kvm_sched_clock_offset __ro_after_init;
>  
>  static int __init parse_no_kvmclock(char *arg)
> @@ -195,7 +195,8 @@ static void kvm_setup_secondary_clock(void)
>  
>  void kvmclock_disable(void)
>  {
> -	native_write_msr(msr_kvm_system_time, 0, 0);
> +	if (msr_kvm_system_time)
> +		native_write_msr(msr_kvm_system_time, 0, 0);
>  }
>  
>  static void __init kvmclock_init_mem(void)
> @@ -294,7 +295,10 @@ void __init kvmclock_init(void)
>  	if (kvm_para_has_feature(KVM_FEATURE_CLOCKSOURCE2)) {
>  		msr_kvm_system_time = MSR_KVM_SYSTEM_TIME_NEW;
>  		msr_kvm_wall_clock = MSR_KVM_WALL_CLOCK_NEW;
> -	} else if (!kvm_para_has_feature(KVM_FEATURE_CLOCKSOURCE)) {
> +	} else if (kvm_para_has_feature(KVM_FEATURE_CLOCKSOURCE)) {
> +		msr_kvm_system_time = MSR_KVM_SYSTEM_TIME;
> +		msr_kvm_wall_clock = MSR_KVM_WALL_CLOCK;
> +	} else {
>  		return;
>  	}

This should work, so

Reviewed-by: Vitaly Kuznetsov <vkuznets@redhat.com>

but my personal preference would be to change kvm_guest_cpu_offline()
to check KVM features explicitly instead of checking MSRs against '0'
at least becase it already does so for other features. Completely
untested:

diff --git a/arch/x86/kernel/kvm.c b/arch/x86/kernel/kvm.c
index b8ab9ee5896c..1ee49c98e70a 100644
--- a/arch/x86/kernel/kvm.c
+++ b/arch/x86/kernel/kvm.c
@@ -454,7 +454,9 @@ static void kvm_guest_cpu_offline(bool shutdown)
        kvm_pv_disable_apf();
        if (!shutdown)
                apf_task_wake_all();
-       kvmclock_disable();
+       if (kvm_para_has_feature(KVM_FEATURE_CLOCKSOURCE2) ||
+           kvm_para_has_feature(KVM_FEATURE_CLOCKSOURCE))
+               kvmclock_disable();
 }

-- 
Vitaly

