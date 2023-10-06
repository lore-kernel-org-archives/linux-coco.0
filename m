Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E74A326E05
	for <linux-coco@lists.linux.dev>; Fri,  6 Oct 2023 14:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sNvJwlHS"
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-59c0dd156e5so33552307b3.3
        for <linux-coco@lists.linux.dev>; Fri, 06 Oct 2023 07:36:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696603016; x=1697207816; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=i58l4QdfZN6X+tVl9sXUSU5MssTQt5gV2xYo4Yk/tro=;
        b=sNvJwlHS0Br69jE4FPbBN4bnNGfYMnJ2FSwVn2uhGsrUFcgBgevb0EBKbDaxWrOMrh
         kfbIReqlncQS5dBPEGdtrSgnl11fwFcrP00tFEP+EU7sY+cSuwmQyrQSeLvaFoOdecZB
         96uzRtiIRcEg9OQ0OCOJPtMmgyUhTPC2wHdM+cqNRottsWf9ms752926ZlmIC301R9Xf
         cpSyzTdvKFpXbLetnefubKajDP3qs5dWg+pRRqCo2PgSWeLoUNMppHX7FrRSYxPwkpHL
         4LtC/JNxdH2Md6f3Td5/cNsw9QDZAR+JNBqmJ/5j1YTqOqo8sHWaeZjMaB4/BCpByZLX
         iM+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696603016; x=1697207816;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i58l4QdfZN6X+tVl9sXUSU5MssTQt5gV2xYo4Yk/tro=;
        b=OiZYtEhTV6XC64MFHhw+MnXTJcykmXrACxqCguJz1YI0JwXnHsfHHw3zaB724jy90J
         t+LpFGLcARza2loAX/yuXAni/ug6qYpGD8BaCoBcRn3LQF1dyL8rXhaNRVqKbjEW3GYe
         5GyZZWf4Bno5auAbi/jZWL7GS/5LCnQXB+j2oCgKLpsXpwFk9hAYTgSXcQ63rTACgaJ1
         CAm7Jza3uzkas0/4SFCCcZG3Q2KY+83nC7zRMcW5U930E2ftsovU+emBAY8ZqWL/YQ5F
         tAYI6dL018Mfhv0wZOBZfSea5oqNiaQmmlCdPDP4/NLRkec8cXQcBxu6ReeJY67gBpGh
         vATg==
X-Gm-Message-State: AOJu0YwmVUw2Hx7Psk0D8n9ehcQPbCDh1auY23hs7kho8uPs+2Qx36sz
	bJ0C7wZob2ZBmaKVhNSaCe9xdKGChJY=
X-Google-Smtp-Source: AGHT+IFQPwuq8dktatytMOhE25UzyzqCNlQC2UUPVzg1lqdTu+UMho1qRpPPz4wW/QHlMjyqJHF5XE+bNrg=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:ae59:0:b0:d7e:752f:baee with SMTP id
 g25-20020a25ae59000000b00d7e752fbaeemr117773ybe.10.1696603015772; Fri, 06 Oct
 2023 07:36:55 -0700 (PDT)
Date: Fri, 6 Oct 2023 07:36:54 -0700
In-Reply-To: <20231005131402.14611-5-kirill.shutemov@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20231005131402.14611-1-kirill.shutemov@linux.intel.com> <20231005131402.14611-5-kirill.shutemov@linux.intel.com>
Message-ID: <ZSAbhk7fu_w3ClOv@google.com>
Subject: Re: [PATCH 04/13] x86/kvm: Do not try to disable kvmclock if it was
 not enabled
From: Sean Christopherson <seanjc@google.com>
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, 
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, 
	Elena Reshetova <elena.reshetova@intel.com>, Jun Nakajima <jun.nakajima@intel.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Tom Lendacky <thomas.lendacky@amd.com>, 
	kexec@lists.infradead.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="us-ascii"

+Paolo

Please use get_maintainers...

On Thu, Oct 05, 2023, Kirill A. Shutemov wrote:
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
> Do not disable kvmclock if it was not enumerated or disabled by user
> from kernel command line.
> 
> Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
> Fixes: c02027b5742b ("x86/kvm: Disable kvmclock on all CPUs on shutdown")
> ---
>  arch/x86/kernel/kvmclock.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/x86/kernel/kvmclock.c b/arch/x86/kernel/kvmclock.c
> index fb8f52149be9..cba2e732e53f 100644
> --- a/arch/x86/kernel/kvmclock.c
> +++ b/arch/x86/kernel/kvmclock.c
> @@ -22,7 +22,7 @@
>  #include <asm/x86_init.h>
>  #include <asm/kvmclock.h>
>  
> -static int kvmclock __initdata = 1;
> +static int kvmclock __ro_after_init = 1;
>  static int kvmclock_vsyscall __initdata = 1;
>  static int msr_kvm_system_time __ro_after_init = MSR_KVM_SYSTEM_TIME;
>  static int msr_kvm_wall_clock __ro_after_init = MSR_KVM_WALL_CLOCK;
> @@ -195,7 +195,12 @@ static void kvm_setup_secondary_clock(void)
>  
>  void kvmclock_disable(void)
>  {
> -	native_write_msr(msr_kvm_system_time, 0, 0);
> +	if (!kvm_para_available() || !kvmclock)
> +		return;
> +
> +	if (kvm_para_has_feature(KVM_FEATURE_CLOCKSOURCE) ||
> +	    kvm_para_has_feature(KVM_FEATURE_CLOCKSOURCE2))
> +		native_write_msr(msr_kvm_system_time, 0, 0);

Rather than recheck everything and preserve kvmclock, what about leaving the MSR
indices '0' by default and then disable msr_kvm_system_time iff it's non-zero.
That way the disable path won't become stale if the conditions for enabling
kvmclock change.

diff --git a/arch/x86/kernel/kvmclock.c b/arch/x86/kernel/kvmclock.c
index fb8f52149be9..f2fff625576d 100644
--- a/arch/x86/kernel/kvmclock.c
+++ b/arch/x86/kernel/kvmclock.c
@@ -24,8 +24,8 @@
 
 static int kvmclock __initdata = 1;
 static int kvmclock_vsyscall __initdata = 1;
-static int msr_kvm_system_time __ro_after_init = MSR_KVM_SYSTEM_TIME;
-static int msr_kvm_wall_clock __ro_after_init = MSR_KVM_WALL_CLOCK;
+static int msr_kvm_system_time __ro_after_init;
+static int msr_kvm_wall_clock __ro_after_init;
 static u64 kvm_sched_clock_offset __ro_after_init;
 
 static int __init parse_no_kvmclock(char *arg)
@@ -195,7 +195,8 @@ static void kvm_setup_secondary_clock(void)
 
 void kvmclock_disable(void)
 {
-       native_write_msr(msr_kvm_system_time, 0, 0);
+       if (msr_kvm_system_time)
+               native_write_msr(msr_kvm_system_time, 0, 0);
 }
 
 static void __init kvmclock_init_mem(void)
@@ -294,7 +295,10 @@ void __init kvmclock_init(void)
        if (kvm_para_has_feature(KVM_FEATURE_CLOCKSOURCE2)) {
                msr_kvm_system_time = MSR_KVM_SYSTEM_TIME_NEW;
                msr_kvm_wall_clock = MSR_KVM_WALL_CLOCK_NEW;
-       } else if (!kvm_para_has_feature(KVM_FEATURE_CLOCKSOURCE)) {
+       } else if (kvm_para_has_feature(KVM_FEATURE_CLOCKSOURCE)) {
+               msr_kvm_system_time = MSR_KVM_SYSTEM_TIME;
+               msr_kvm_wall_clock = MSR_KVM_WALL_CLOCK;
+       } else {
                return;
        }

