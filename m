Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B98E275B05
	for <linux-coco@lists.linux.dev>; Sat,  8 Nov 2025 01:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762565835; cv=none; b=puFza1s4axYwkZyehObdn+jINurdLenB7ylFRaCsp/jPIDe+p20k5IjUQ/vWxsg7xMEDBO4BeTsNOqcQBQfM7lD+B14Sgc8DwROC9Kka3SMUd+mq16GSHoRz5yNznuqdvB3NPLwNf/33Ipp4b0vQQkdGI9Cu3IUYR1lYSD8CzYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762565835; c=relaxed/simple;
	bh=SJSMeQUFpCo/kA2WHCwtApgStS9KZ0/zaRiqLaMztIg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=fkSDQ3tKcAV2iudDoWAz17ipYOGgzKNLoU9susc8TNXBnB5X/VaOrtjmAqzYBHzbh1jIkAgO71ONU3IZLN06d7qKp2e6vOV3ybfN4uN6eYoQZWJXKj+iYCzeQxrQMYIwGylj7AB5EIhfbUYKTQtujYrNYYFj5DZ7ta+zQTwupx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=xxZentTv; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xxZentTv"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-32eb18b5500so2301565a91.2
        for <linux-coco@lists.linux.dev>; Fri, 07 Nov 2025 17:37:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762565833; x=1763170633; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=xRnY5SJkO9h64mX0v92qoTuQodID73X2Y9ZfRGvcdjo=;
        b=xxZentTvgzVZKqpv2gR09K3twOdhjukKVsHFgH4/ChNfqDuq6FL/FmHMKYh6MBgHH4
         zl9sRCUXoSPjcwzTjrRxX6TNnhBvb4waZQFUuhF2J2gfGrqOKPZbVPe16ot9Dug2LNCe
         ASta7RcBaFVhnrSg4MyUsfIUU5LB8qoU3bOSnoUpWx0zCQneypaWbic5SqYMuMzMWW6e
         mFPP+3oN4I77imtzkVKyLexee8USrWD2FNcA3K6if2v03Sk+dAMgiLKCLnDOGUzvddJe
         nEAne4B9cNuxPNS806BOLaknWE+3Mv962pufvalg12+QPaEO+AlrdPTLTZ0Ds5m6FyPi
         0IJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762565833; x=1763170633;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xRnY5SJkO9h64mX0v92qoTuQodID73X2Y9ZfRGvcdjo=;
        b=D9JVktgd9ssGPlwhUzzPDedSDvZDRYclzesLmAkAMf69aBtF/0gdGL6UfbT9kx5FC7
         rl9ndoy6IKuKtPVV+OJ20SaQ7Dbcw0w+cPDdMj05eqBTPrf7G6opg9GTkm8iQ59ww0vn
         lQwLGTmRhxGT66VmWMtElg5nJZ2QmRnHMC+d5VMNHEKHzM9PWIQu368BUhpN2K0lXuAR
         9vQtNq9cx5qeABbxxC5o5VO9lR6XkzmBV9QxF+ah0sVTV7GlhsDCJzzu7+SF8C8oHi7G
         YlZXdzv5uo4f6gUHImDPzfn5PJLzIHiI44Ms2tcZOayRguXOrvOHk+L0AjT1LQRF3psF
         nMzw==
X-Forwarded-Encrypted: i=1; AJvYcCXfLDaHwdtCKsYtYwf/8p6LGSCCvgVhfFbhpItiuFk7P1LUGhWk/Xv95qmnPTsF3z5O7zN95kga+V6N@lists.linux.dev
X-Gm-Message-State: AOJu0Yw3LpV0XihpO7Mk+sIFd32MSHdOihb5BNdjX8e0+Fm/ufOfT8AZ
	3wjQLqar3EDGfFpmF4VHYKZa6HYGym8R5fHdoJdbmW3Du9acEZBrImFbVcyjHGUeJWJzf243cHN
	jSGeEGg==
X-Google-Smtp-Source: AGHT+IEbCnwUgr/Z7lukguR8IbmbSGbo7BssGdcfDCd1/WphprWEu5jq8gZggwd2EpYcWtXIDi96CNhVrVc=
X-Received: from pjaf2.prod.google.com ([2002:a17:90a:1202:b0:33b:51fe:1a89])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:28cd:b0:340:c179:3657
 with SMTP id 98e67ed59e1d1-3436cbd88e1mr1283355a91.33.1762565832980; Fri, 07
 Nov 2025 17:37:12 -0800 (PST)
Date: Fri, 7 Nov 2025 17:37:11 -0800
In-Reply-To: <aQ2rTgWwqWvoqnIL@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20251030191528.3380553-1-seanjc@google.com> <20251030191528.3380553-4-seanjc@google.com>
 <aQ2rTgWwqWvoqnIL@intel.com>
Message-ID: <aQ6ex5rKZU-bEDiX@google.com>
Subject: Re: [PATCH v5 3/4] KVM: x86: Leave user-return notifier registered on reboot/shutdown
From: Sean Christopherson <seanjc@google.com>
To: Chao Gao <chao.gao@intel.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, "Kirill A. Shutemov" <kas@kernel.org>, kvm@vger.kernel.org, 
	x86@kernel.org, linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Yan Zhao <yan.y.zhao@intel.com>, Xiaoyao Li <xiaoyao.li@intel.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Hou Wenlong <houwenlong.hwl@antgroup.com>
Content-Type: text/plain; charset="us-ascii"

On Fri, Nov 07, 2025, Chao Gao wrote:
> On Thu, Oct 30, 2025 at 12:15:27PM -0700, Sean Christopherson wrote:
> >diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
> >index bb7a7515f280..c927326344b1 100644
> >--- a/arch/x86/kvm/x86.c
> >+++ b/arch/x86/kvm/x86.c
> >@@ -13086,7 +13086,21 @@ int kvm_arch_enable_virtualization_cpu(void)
> > void kvm_arch_disable_virtualization_cpu(void)
> > {
> > 	kvm_x86_call(disable_virtualization_cpu)();
> >-	drop_user_return_notifiers();
> >+
> >+	/*
> >+	 * Leave the user-return notifiers as-is when disabling virtualization
> >+	 * for reboot, i.e. when disabling via IPI function call, and instead
> >+	 * pin kvm.ko (if it's a module) to defend against use-after-free (in
> >+	 * the *very* unlikely scenario module unload is racing with reboot).
> >+	 * On a forced reboot, tasks aren't frozen before shutdown, and so KVM
> >+	 * could be actively modifying user-return MSR state when the IPI to
> >+	 * disable virtualization arrives.  Handle the extreme edge case here
> >+	 * instead of trying to account for it in the normal flows.
> >+	 */
> >+	if (in_task() || WARN_ON_ONCE(!kvm_rebooting))
> >+		drop_user_return_notifiers();
> >+	else
> >+		__module_get(THIS_MODULE);
> 
> This doesn't pin kvm-{intel,amd}.ko, right? if so, there is still a potential
> user-after-free if the CPU returns to userspace after the per-CPU
> user_return_msrs is freed on kvm-{intel,amd}.ko unloading.
> 
> I think we need to either move __module_get() into
> kvm_x86_call(disable_virtualization_cpu)() or allocate/free the per-CPU
> user_return_msrs when loading/unloading kvm.ko. e.g.,

Gah, you're right.  I considered the complications with vendor modules, but missed
the kvm_x86_vendor_exit() angle.

> >From 0269f0ee839528e8a9616738d615a096901d6185 Mon Sep 17 00:00:00 2001
> From: Chao Gao <chao.gao@intel.com>
> Date: Fri, 7 Nov 2025 00:10:28 -0800
> Subject: [PATCH] KVM: x86: Allocate/free user_return_msrs at kvm.ko
>  (un)loading time
> 
> Move user_return_msrs allocation/free from vendor modules (kvm-intel.ko and
> kvm-amd.ko) (un)loading time to kvm.ko's to make it less risky to access
> user_return_msrs in kvm.ko. Tying the lifetime of user_return_msrs to
> vendor modules makes every access to user_return_msrs prone to
> use-after-free issues as vendor modules may be unloaded at any time.
> 
> kvm_nr_uret_msrs is still reset to 0 when vendor modules are loaded to
> clear out the user return MSR list configured by the previous vendor
> module.

Hmm, the other idea would to stash the owner in kvm_x86_ops, and then do:

		__module_get(kvm_x86_ops.owner);

LOL, but that's even more flawed from a certain perspective, because
kvm_x86_ops.owner could be completely stale, especially if this races with
kvm_x86_vendor_exit().

> +static void __exit kvm_free_user_return_msrs(void)
>  {
> 	int cpu;
>  
> @@ -10044,13 +10043,11 @@ int kvm_x86_vendor_init(struct kvm_x86_init_ops
> *ops)
> 		return -ENOMEM;
> 	}
>  
> -	r = kvm_init_user_return_msrs();
> -	if (r)
> -		goto out_free_x86_emulator_cache;
> +	kvm_nr_uret_msrs = 0;

For maximum paranoia, we should zero at exit() and WARN at init().

> 	r = kvm_mmu_vendor_module_init();
> 	if (r)
> -		goto out_free_percpu;
> +		goto out_free_x86_emulator_cache;
>  
> 	kvm_caps.supported_vm_types = BIT(KVM_X86_DEFAULT_VM);
> 	kvm_caps.supported_mce_cap = MCG_CTL_P | MCG_SER_P;
> @@ -10148,8 +10145,6 @@ int kvm_x86_vendor_init(struct kvm_x86_init_ops
> *ops)
> 	kvm_x86_call(hardware_unsetup)();
>  out_mmu_exit:
> 	kvm_mmu_vendor_module_exit();
> -out_free_percpu:
> -	kvm_free_user_return_msrs();
>  out_free_x86_emulator_cache:
> 	kmem_cache_destroy(x86_emulator_cache);
> 	return r;
> @@ -10178,7 +10173,6 @@ void kvm_x86_vendor_exit(void)
>  #endif
> 	kvm_x86_call(hardware_unsetup)();
> 	kvm_mmu_vendor_module_exit();
> -	kvm_free_user_return_msrs();
> 	kmem_cache_destroy(x86_emulator_cache);
>  #ifdef CONFIG_KVM_XEN
> 	static_key_deferred_flush(&kvm_xen_enabled);
> @@ -14361,8 +14355,14 @@ EXPORT_TRACEPOINT_SYMBOL_GPL(kvm_rmp_fault);
>  
>  static int __init kvm_x86_init(void)
>  {
> +	int r;
> +
> 	kvm_init_xstate_sizes();
>  
> +	r = kvm_init_user_return_msrs();
> +	if (r)

Rather than dynamically allocate the array of structures, we can "statically"
allocate it when the module is loaded.

I'll post this as a proper patch (with my massages) once I've tested.

Thanks much!

(and I forgot to hit "send", so this is going to show up after the patch, sorry)
