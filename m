Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 927FB27E074
	for <linux-coco@lists.linux.dev>; Fri, 19 Dec 2025 18:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766169334; cv=none; b=H6OJN9bPYo6XYqPCmmpDoayHJW5rms0rD+Nbu5moAhHEdK1JI7P6fX6qkAio3zNIyTkpE1sS4sp0bMBnQhiOLW7WIPUGpVwKkP4SYyLONqYlovxM67CnEaLxrklPlNP+YQr8DsY/1aNFRulsbJ7opqI6YzoOz7E8FcQItTXBXnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766169334; c=relaxed/simple;
	bh=iG8mGeVNEvXsd1t76CZqu0+1NQVejONyUMDBb2xBiKA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=YAa1SDo9yp663lR4BFDXNaF9iLgiCzpkoAF3qff/dVTwZmJEEfEAwsYXhSmLHRFEUWHKSR9SkmgPqS+4UxeuJpkVmDQz7jN/qdnW1cXprPNKtc6we4qpj8gjrhb8+v1KCS58zZ0TqkygOetiKh07RRhMF3AT6RdELaIcmFIMQdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kjKSL5YR; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kjKSL5YR"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-34c43f8ef9bso2963586a91.1
        for <linux-coco@lists.linux.dev>; Fri, 19 Dec 2025 10:35:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1766169331; x=1766774131; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=E7j42xcc07Siwvvg0leIJ0Z0gl7G5h1m94yUilkbF8k=;
        b=kjKSL5YRXab12Vqq5OsrmzaMbrgweEDvgkrmhARfDAEsg3v4m50hX2iyHI1q9Y6PnY
         E2LUXXh4a7BoFu1hqSonQaPx9ylQj0lQ/HqLUDq/fYjOqlCG2GqAC5rzcG6/8eesbHe3
         8uhv1kgkoeJf19M42M9Ac+zATL4VV1qjDxa4IiDYUVfWZhTLc2syBadLDI7JyWhOSj2d
         RP2hpnGoAqXMaWU9TC0HlxBR6RjnaGsjlareNIyohDk0s8hMnIrkP+gFhflfIDDy8Gc8
         8LqAexi1/pmbrKmCVxkuAyRCIBYGPiKAaK7HkDDGuClMqsZDvRx4oP8e7DLXKZqR4t+c
         bR3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766169331; x=1766774131;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E7j42xcc07Siwvvg0leIJ0Z0gl7G5h1m94yUilkbF8k=;
        b=X2UffMVyuR5LcTDMOLfxBsmSfQ+4Bpd+h2POvz1bd5weaU/lqyTH94SXw99kXTOKRI
         DYdKGnPdaprP2W32zj2EYfeKHb9m7xd6D707PVNXj6SRT9zC5nLwW4QNh6l/Ls74L0UN
         rARPb+ngK5Ka+ct6ved4H/mfdwgKEh082+KiGPqYGmJrikr/ldd0BT33qgVhStXRv4kP
         Db6vAPxlf4FX88yjqIWTHwQFfoznQkopW4kaE8xYrYtHh1/Hgi8i0ATrWWnhUlnhKAE0
         6H8ETrXcAWODWmOAmzmTMRknmBD35J4EvSp59U8Ko0q4g50fKoFWtqfr/G8QahVazLjF
         5Kvg==
X-Forwarded-Encrypted: i=1; AJvYcCXD1Prw7kolOSZjhJ594zucTFGoymgzuUShm8rqspYyqrVAtc472VRSxV1Y0P8tRRb9cfUlotDPPYiN@lists.linux.dev
X-Gm-Message-State: AOJu0Yywr3ghWEdZ3fCPHRkFEc8giouqFEwXqHboIk7YAXEhu3V/WI+B
	JrpV6gIkr0wmIFN9IIgpCNKsCbFZXSfSMPv5rn698SK2ea7TILnLb4A9oRmrkWDdcwYznBSQYKN
	8rYzkTQ==
X-Google-Smtp-Source: AGHT+IGvd+XfHbhthTzkZFT+g/Baf1kbE8bktfWBbuaDWMKWgA1wLhpc2ZL5cUoEo9s4pLMCpJWmqB/MBhg=
X-Received: from pjqv1.prod.google.com ([2002:a17:90a:af01:b0:349:8a6d:dfd1])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2d50:b0:343:43bf:bcd7
 with SMTP id 98e67ed59e1d1-34e90de0291mr3447619a91.13.1766169330430; Fri, 19
 Dec 2025 10:35:30 -0800 (PST)
Date: Fri, 19 Dec 2025 10:35:28 -0800
In-Reply-To: <90837ad5-c9a6-42da-a5a8-fcd2d870dac8@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20251206011054.494190-1-seanjc@google.com> <20251206011054.494190-3-seanjc@google.com>
 <90837ad5-c9a6-42da-a5a8-fcd2d870dac8@intel.com>
Message-ID: <aUWa8LOEJ6JeczJz@google.com>
Subject: Re: [PATCH v2 2/7] KVM: x86: Extract VMXON and EFER.SVME enablement
 to kernel
From: Sean Christopherson <seanjc@google.com>
To: Dave Hansen <dave.hansen@intel.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Kiryl Shutsemau <kas@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, linux-kernel@vger.kernel.org, 
	linux-coco@lists.linux.dev, kvm@vger.kernel.org, 
	Chao Gao <chao.gao@intel.com>, Dan Williams <dan.j.williams@intel.com>
Content-Type: text/plain; charset="us-ascii"

On Fri, Dec 19, 2025, Dave Hansen wrote:
> On 12/5/25 17:10, Sean Christopherson wrote:
> > +static int x86_vmx_get_cpu(void)
> > +{
> > +	int r;
> > +
> > +	if (cr4_read_shadow() & X86_CR4_VMXE)
> > +		return -EBUSY;
> > +
> > +	intel_pt_handle_vmx(1);
> > +
> > +	r = x86_virt_cpu_vmxon();
> > +	if (r) {
> > +		intel_pt_handle_vmx(0);
> > +		return r;
> > +	}
> > +
> > +	return 0;
> > +}
> ...> +#define x86_virt_call(fn)				\
> > +({							\
> > +	int __r;					\
> > +							\
> > +	if (IS_ENABLED(CONFIG_KVM_INTEL) &&		\
> > +	    cpu_feature_enabled(X86_FEATURE_VMX))	\
> > +		__r = x86_vmx_##fn();			\
> > +	else if (IS_ENABLED(CONFIG_KVM_AMD) &&		\
> > +		 cpu_feature_enabled(X86_FEATURE_SVM))	\
> > +		__r = x86_svm_##fn();			\
> > +	else						\
> > +		__r = -EOPNOTSUPP;			\
> > +							\
> > +	__r;						\
> > +})
> 
> I'm not a super big fan of this. I know you KVM folks love your macros
> and wrapping function calls in them because you hate grep. ;)

Heh, kvm_x86_call() exists _because_ I like grep and search functionality.  The
number of times I couldn't find something because I was searching for full words
and forgot about the kvm_x86_ prefix...

> I don't like a foo_get_cpu() call having such fundamentally different
> semantics than good old get_cpu() itself. *Especially* when the calls
> look like:
> 
> 	r = x86_virt_call(get_cpu);
> 
> and get_cpu() itself it not invovled one bit. This 100% looks like it's
> some kind of virt-specific call for get_cpu().
> 
> I think it's probably OK to make this get_hw_ref() or inc_hw_ref() or
> something to get it away from getting confused with get_cpu().

Oof, yeah, didn't think about a collision with {get,put}_cpu().  How about 
x86_virt_{get,put}_ref()?  I like how the callers read, e.g. "get a reference to
VMX or SVM":

  x86_virt_get_ref(X86_FEATURE_VMX);
  x86_virt_put_ref(X86_FEATURE_VMX);

  x86_virt_get_ref(X86_FEATURE_SVM);
  x86_virt_put_ref(X86_FEATURE_SVM);

> IMNHO, the macro magic is overkill. A couple of global function pointers
> would probably be fine because none of this code is even remotely
> performance sensitive. A couple static_call()s would be fine too because
> those at least make it blatantly obvious that the thing being called is
> variable. A good ol' ops structure would also make things obvious, but
> are probably also overkill-adjecent for this.

Agreed.  I'm not even entirely sure why I took this approach.  I suspect I carried
over the basic concept from code that wanted to run before wiring up function
pointers, and never revisited the implementation once the dust settled.

I haven't tested yet, but I've got this:

  struct x86_virt_ops {
	int feature;
	int (*enable_virtualization_cpu)(void);
	int (*disable_virtualization_cpu)(void);
	void (*emergency_disable_virtualization_cpu)(void);
  };
  static struct x86_virt_ops virt_ops __ro_after_init;

and then usage like:

  int x86_virt_get_ref(int feat)
  {
	int r;

	if (!virt_ops.feature || virt_ops.feature != feat)
		return -EOPNOTSUPP;

	if (this_cpu_inc_return(virtualization_nr_users) > 1)
		return 0;

	r = virt_ops.enable_virtualization_cpu();
	if (r)
		WARN_ON_ONCE(this_cpu_dec_return(virtualization_nr_users));

	return r;
  }
  EXPORT_SYMBOL_GPL(x86_virt_get_ref);

  void x86_virt_put_ref(int feat)
  {
	if (WARN_ON_ONCE(!this_cpu_read(virtualization_nr_users)) ||
	    this_cpu_dec_return(virtualization_nr_users))
		return;

	BUG_ON(virt_ops.disable_virtualization_cpu() && !virt_rebooting);
  }
  EXPORT_SYMBOL_GPL(x86_virt_put_ref);

> P.S. In a perfect world, the renames would also be in their own patches,
> but I think I can live with it as-is.

Ya, I'll chunk the patch up.
