Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4231C1CA9A
	for <linux-coco@lists.linux.dev>; Fri,  6 Oct 2023 14:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="2FogVlV5"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-2777d237229so1904303a91.2
        for <linux-coco@lists.linux.dev>; Fri, 06 Oct 2023 07:58:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696604285; x=1697209085; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=L8SLlOsSBiXlVOZqd3MNbcaSevZs0Zf6iCkneXB+UYM=;
        b=2FogVlV5hKnDTO12lDRF9pfkrra54zPjUaTfk5diNrLpIQQoax3+n6yW6TzvKhe4Lj
         4dxiO2lj0zYQMjqh/O9Dg4YnBA10cLUWYoSXLbdVTddOER13Cu8tQlY+Q76G6uQYbsLh
         iig44BQBkd48tKMqVkJ1WLF5IanR0aCAqo5NHeXfN0ryq0Y+WHWiPPHVxToKgzwQdJDI
         ruyCl6cNAApZT+jLZUlrDQsG03p06cTfuDChtK3XjfuHJ7xQWNt/b6cvbuE9NXLjjCiz
         FMOBtcjjPI4tfhIBnXte2/etUwiPC2+aA2cHDSLRLQOQiyCLxnNkdLbue9WMy/71Yros
         vPFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696604285; x=1697209085;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L8SLlOsSBiXlVOZqd3MNbcaSevZs0Zf6iCkneXB+UYM=;
        b=Tg/Au/ysFqYu+BT++RiUUCWUB0nbPtvDoZxjufL77esvnzu45yWKEh4wwxzizkofxX
         Y10l/9SZuDqBsqomO+DtJQYkqhWmut1Xo9u8bYXTKcK+U+5mjV+zZJa0ocTPwssnNJyV
         niuHNtVV+voh6EgI/G3T3CxIoEMOoXsr73u2MKoT9T8Ioj4rYPD6eysrz/X5k7FDtRrg
         IFAhNIUdW2lB+SzDNIejctwz2uH7TIO8WTbOIpPiruT/SqJQKKxoujby9Jd911C/wu5m
         h9p8g5iRX5HJg92ynA8dKFmscSiBbrAJGlx86H00v3hiN8rht4t5YfnjgJYI6J06B2r0
         pncw==
X-Gm-Message-State: AOJu0Yzsa7bv37aD9xR3KKj57O4fFlBwBcWy7DZeTrid+m22DFlRERqC
	Iu9kkoO7P/XtglDBv77Yskv8rzvGQeQ=
X-Google-Smtp-Source: AGHT+IGL88XAlpSBeihjb4Zfc5p6KDRf131bGYiWj2fWKD8BEJyproZ8L08qkjar6AMU++MXIPvMqBYldjM=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:90a:e548:b0:277:5c9b:14dd with SMTP id
 ei8-20020a17090ae54800b002775c9b14ddmr137737pjb.2.1696604285539; Fri, 06 Oct
 2023 07:58:05 -0700 (PDT)
Date: Fri, 6 Oct 2023 07:58:03 -0700
In-Reply-To: <20231005131402.14611-11-kirill.shutemov@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20231005131402.14611-1-kirill.shutemov@linux.intel.com> <20231005131402.14611-11-kirill.shutemov@linux.intel.com>
Message-ID: <ZSAge6W4vF6ePudw@google.com>
Subject: Re: [PATCH 10/13] x86/tdx: Convert shared memory back to private on kexec
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
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Thu, Oct 05, 2023, Kirill A. Shutemov wrote:
> diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
> index 7368d254d01f..b5acf9fb4c70 100644
> --- a/arch/x86/Kconfig
> +++ b/arch/x86/Kconfig
> @@ -884,6 +884,7 @@ config INTEL_TDX_GUEST
>  	select X86_MEM_ENCRYPT
>  	select X86_MCE
>  	select UNACCEPTED_MEMORY
> +	select EMERGENCY_VIRT_CALLBACK
>  	help
>  	  Support running as a guest under Intel TDX.  Without this support,
>  	  the guest kernel can not boot or run under TDX.

...

>  void __init tdx_early_init(void)
>  {
>  	struct tdx_module_args args = {
> @@ -882,6 +1007,14 @@ void __init tdx_early_init(void)
>  	 */
>  	x86_cpuinit.parallel_bringup = false;
>  
> +	machine_ops.shutdown = tdx_shutdown;
> +
> +	/*
> +	 * KVM overrides machine_ops.crash_shutdown, use emergency

This is going to be super confusing.  KVM utilizes the emergency virt callback.
The KVM paravirt guest code uses .crash_shutdown().  People that are passingly
familiar with virt and know what KVM is, but don't already know the difference
between the two are going to be all kinds of confused.

I also feel like you're playing with fire, e.g. what's to stop the hypervisor
specific paravirt guest support from using .shutdown() in the future?

And the callback is invoked for far more than just kexec().  I don't see how the
host can emulate a reboot without destroying and rebuilding the VM, e.g. it can't
stuff register state to emulate INIT or RESET.  Unless I'm missing something,
converting shared memory back to private for a shutdown or reboot is undesirable
as adds one more thing that can go wrong and prevent the system from cleanly
shutting down ASAP (for some definitions of "cleanly").

Lastly, doesn't SEV need similar behavior?  This seems like core functionality
for any guest with cc_platform_has(CC_ATTR_GUEST_MEM_ENCRYPT).  Why not make the
"unshare on kexec" code common and gate it with CC_ATTR_GUEST_MEM_ENCRYPT?
