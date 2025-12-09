Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C64121F4634
	for <linux-coco@lists.linux.dev>; Tue,  9 Dec 2025 20:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765310508; cv=none; b=C/ToSMPu8PWJDezHUC2mQqwwYFITGSJNI/5KfzxLNfOMsB0TIX7MOZjdgRl5nD0fZBXojHacVt2BXesZOAXHJVh2YwXv5u2FptcV39HbI9RYiuSbyeMAWZmdQr0fLf89FVzemtYzEvhnF1F5xgli3E5a4eUwTkMywy65fyYDDUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765310508; c=relaxed/simple;
	bh=Qxi1j/RcHKxFAzWkNO39rmWa1j/5Kyprr7BXnY/6Tzg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Fu1E8psuYrXai+gWNdxYeZbLJKVqP3wvL1HRPgO9B8juXlD2nLb47W9UPhN3T3V1u8pMrY6OLWqVZ/NF1LDZuCBl02NWBzblodV9eXXIgD9VzQCRshTRm/GQgld8shXDFsBaWNU1IQd3/STepkxdwZ1ysGyoT1gXVG+jp6wozNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=A2pVVnaQ; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="A2pVVnaQ"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-3436e9e3569so11402984a91.2
        for <linux-coco@lists.linux.dev>; Tue, 09 Dec 2025 12:01:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765310506; x=1765915306; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=oAzgke8OztFL10s6gpyKViwU0Rh1AgMRSlbFbta1tHI=;
        b=A2pVVnaQsiB/SfYHK6ncsJY5N3qQvGfPNIX6EbLB0ZG8Rm8gpunZcvaup+l9iVmeBp
         TE3qolP8+bf+okjlIjzOz3z5ZU+t7p9/riVg0mZzaalp/eB4TXhSPUV2YJquS+Bg7Hm+
         xK0odHTqVQrdzbq/aGmjjHNLwLorNZjoa0tNytq1Vc50Il58sQz8qMVOO8zCO3Ct6Dp7
         +ipiFi4Y7tbAVdt8egeBDT/BDnUOK9ZLxP8+WH/STitDkK/lUL07z791YOPevVI3mtEM
         Ei1RScZWB5xEfijwAtGO8oZUP3I8G0yIydmUGVGaeAWmX2wKxKQ0sJ76lCkLBgvwC03O
         2KVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765310506; x=1765915306;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oAzgke8OztFL10s6gpyKViwU0Rh1AgMRSlbFbta1tHI=;
        b=AaZEGl2WZFqAcT5Mb8J+pnn6H0UOKNaVGlztcFcvUjSDVmdFzuga+w6qG3t8lKFw3/
         aoNgjtvxsZ8lj8TbxFtwgj2I9XuQZmdjzvD3iKKxXHNC84qfdz39aBzJSPAdBl+haWMX
         +9hri/ZmKyz8UK1VLqpx6Zt0vl/msf9FfL2Kh0WRi1MmmBGBd7lWff+ZH3UY7Ktsnc/F
         2KkEG//tOY5c3bpYDgIVSI7SfrzKXfMdNTt8FzjDXVVNr3q8QYmno6iL/h/jN2Eop0my
         9dugrSdfWL2+pzTRosSYSo8oZJ19OcIgGn82eSKEVPLQpIYhcUSfZajzNv6O57LILz3d
         IjiQ==
X-Forwarded-Encrypted: i=1; AJvYcCWCj3lcYaj/mGTkjSUs1oI48Km5SrATRfu9L7vrJi68DlfHQWSNaBgzTX5QH0ilqZrWPJ4hrXLid1vH@lists.linux.dev
X-Gm-Message-State: AOJu0YwUbVLOZs+WJzho+g1B3bBshmV+tlNcfJwkPL9fYbtXBH7D+nzT
	00aEeB5M547YUze0paXqsOdWecmKNgAQx6psUZF1TI12iOhf/Y5+YOyZNe3AfHr7Q823pX0G2lm
	bPSMocg==
X-Google-Smtp-Source: AGHT+IHJ5+IunYdkLmIlmxzrML57BpWM+OKCGDR1imNOGZGgDjiyH1eeQy1f5I13znoJ9RsrIHFYxpfirkY=
X-Received: from pjup12.prod.google.com ([2002:a17:90a:d30c:b0:349:a1a3:75f8])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:5905:b0:341:761c:3330
 with SMTP id 98e67ed59e1d1-349a25bd8e0mr10531817a91.23.1765310505789; Tue, 09
 Dec 2025 12:01:45 -0800 (PST)
Date: Tue, 9 Dec 2025 12:01:44 -0800
In-Reply-To: <69352b2239a33_1b2e100d2@dwillia2-mobl4.notmuch>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20251206011054.494190-1-seanjc@google.com> <20251206011054.494190-3-seanjc@google.com>
 <69352b2239a33_1b2e100d2@dwillia2-mobl4.notmuch>
Message-ID: <aTiAKG4TlKcZnJnn@google.com>
Subject: Re: [PATCH v2 2/7] KVM: x86: Extract VMXON and EFER.SVME enablement
 to kernel
From: Sean Christopherson <seanjc@google.com>
To: dan.j.williams@intel.com
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Kiryl Shutsemau <kas@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, linux-kernel@vger.kernel.org, 
	linux-coco@lists.linux.dev, kvm@vger.kernel.org, 
	Chao Gao <chao.gao@intel.com>
Content-Type: text/plain; charset="us-ascii"

On Sat, Dec 06, 2025, dan.j.williams@intel.com wrote:
> Sean Christopherson wrote:
> > @@ -694,9 +696,6 @@ static void drop_user_return_notifiers(void)
> >  		kvm_on_user_return(&msrs->urn);
> >  }
> >  
> > -__visible bool kvm_rebooting;
> > -EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_rebooting);
> 
> ...a short stay for this symbol in kvm/x86.c? It raises my curiosity why
> patch1 is separate.

Because it affects non-x86 architectures.  It should be a complete nop, but I
wanted to isolate what I could.

> Patch1 looked like the start of a series of incremental conversions, patch2
> is a combo move. I am ok either way, just questioning consistency. I.e. if
> combo move then patch1 folds in here, if incremental, perhaps split out other
> combo conversions like emergency_disable_virtualization_cpu()? The aspect of
> "this got moved twice in the same patchset" is what poked me.

Yeah, I got lazy to a large extent.  I'm not super optimistic that we won't end
up with one big "move all this stuff" patch, but I agree it doesn't need to be
_this_ big.

> [..]
> > diff --git a/arch/x86/virt/hw.c b/arch/x86/virt/hw.c
> > new file mode 100644
> > index 000000000000..986e780cf438
> > --- /dev/null
> > +++ b/arch/x86/virt/hw.c
> > @@ -0,0 +1,340 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +#include <linux/cpu.h>
> > +#include <linux/cpumask.h>
> > +#include <linux/errno.h>
> > +#include <linux/kvm_types.h>
> > +#include <linux/list.h>
> > +#include <linux/percpu.h>
> > +
> > +#include <asm/perf_event.h>
> > +#include <asm/processor.h>
> > +#include <asm/virt.h>
> > +#include <asm/vmx.h>
> > +
> > +static int x86_virt_feature __ro_after_init;
> > +
> > +__visible bool virt_rebooting;
> > +EXPORT_SYMBOL_GPL(virt_rebooting);
> > +
> > +static DEFINE_PER_CPU(int, virtualization_nr_users);
> > +
> > +static cpu_emergency_virt_cb __rcu *kvm_emergency_callback;
> 
> Hmm, why kvm_ and not virt_?

I was trying to capture that this callback can _only_ be used by KVM, because
KVM is the only in-tree hypervisor.  That's also why the exports are only for
KVM (and will use EXPORT_SYMBOL_FOR_KVM() when I post the next version).

> [..]
> > +#if IS_ENABLED(CONFIG_KVM_INTEL)
> > +static DEFINE_PER_CPU(struct vmcs *, root_vmcs);
> 
> Perhaps introduce a CONFIG_INTEL_VMX for this? For example, KVM need not
> be enabled if all one wants to do is use TDX to setup PCIe Link
> Encryption. ...or were you expecting?
> 
> #if IS_ENABLED(CONFIG_KVM_INTEL) || IS_ENABLED(...<other VMX users>...)

I don't think we need anything at this time.  INTEL_TDX_HOST depends on KVM_INTEL,
and so without a user that needs VMXON without KVM_INTEL, I think we're good as-is.

 config INTEL_TDX_HOST
	bool "Intel Trust Domain Extensions (TDX) host support"
	depends on CPU_SUP_INTEL
	depends on X86_64
	depends on KVM_INTEL
