Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0F2033CEAC
	for <linux-coco@lists.linux.dev>; Fri,  6 Feb 2026 14:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770389179; cv=none; b=bKLloVMhMB3xMSlpSbuJk7wyNQXpih+cUyr2woW862jSIlc2L0O0wdOY29VNL+JxkFIz2Mkysr/Q2ZYN4L9MfTSrB+aExMJzi3qDiHo/Y2iqjldCQq5dSX7ClQovyTP2857XCemYLDp61Eu2TEPW6XCsfIu0gxWyj7cXMwsVlxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770389179; c=relaxed/simple;
	bh=Z+6pMsVne8koEollpw2BnyiblSLa1jaNRfnGAaiwAJE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=BNxdUlJiPWI78+uu06F57eP0FLNFkNLHmiE/JGsfFYKptEHyfh7kJcq4VQe1ClHBMKeiPOUB4MtzFM81FvRTbSl4lUjs+KX2yNIdL1hGWlYiEg3UK0W9U4KMyfEzB3QFCRUiEvB5GECMNSlniE1LEL7NUGLTUiKIZ1jLRubYD74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=b0qfibKU; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="b0qfibKU"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-354c0eb08ceso369670a91.1
        for <linux-coco@lists.linux.dev>; Fri, 06 Feb 2026 06:46:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770389178; x=1770993978; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=fWVMjsX7lzriNU4H/gh4s77Y7csX7rcHx58QQQuHKyI=;
        b=b0qfibKUZu/WtmHyIMf281Ierbg25Hol/qXuwKy/sQzvXmu0G9N6Nc5eRP3oFLZQ//
         mAjY4EuTsf9tIKRKBnHetG6njd+cKcQy5CJtVfI15i/leyNWMdjt6GDzw38x/S5e6Znv
         ZRYz5KdYvSbEDhG5cwm3HOG86t3XwfzJMCNXiD5BKZCe/f0JJXPl2t1EHDVC64Hz1jEb
         O8xcC4olrbk+4mK2V1/fz5OU3fHF++bJj4XMtbNJ/rVUjPZF8Tz7UP+mV/WC82FVyfX6
         fXmKdujMBoEuLSATa4qgjzsqfltosT3dZ1yyAiSWIlXdBos95hil5sFOy0t6xWs3X8xS
         V/tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770389178; x=1770993978;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fWVMjsX7lzriNU4H/gh4s77Y7csX7rcHx58QQQuHKyI=;
        b=WXsODu5Aa70+BNdSbflbSI4m4mBhqVienP1ObUyw1Swf7JnPJPx89L5l06eFN27hW5
         hu/rw2a9cPS9f6MF5GgpkETqzqnfbao9V/i53e84WYm1QI3DE4huJKdBPolumF+L8ZAk
         hF3T7x5eJgNzNBWVVifMbbjLWeGAsOY5p6w4wA6QzU6PS5+EGlvkhgp239fAwU9fieMD
         FR2wWdh9Q4QzeXm4T7t/loV+QUPzga+phs5EOYAlx/Kj/OeLMlZM7mjWiSDvUgePXDN1
         wEWBeiNVaknIJvOpVdVLbO0t5cTN0gP/U7QmzFb6ocZnZmuviGOX/gwayjb5+fGpqJTY
         z5/g==
X-Forwarded-Encrypted: i=1; AJvYcCWbnj3fCQJf/KT7mpUYvgJdo30wBYuQP8hYN3Y2i3qYSdYDCr2G9q94UH+E0o5JbexxYUF04qRH2zt/@lists.linux.dev
X-Gm-Message-State: AOJu0YyQDjZEU3dURd/Ei3AcrOmrQYoT2h1AtFaTQWA7SGgTGvhuRAsc
	X/1tH8T4YcqbY31kCYbMhFjLXPyEV2qt+r29t8HZyzUcia14ehcBjf6T6ygqqLKwtDJetSps+6w
	20b00Fg==
X-Received: from pgbcr4.prod.google.com ([2002:a05:6a02:4104:b0:c65:be00:c5c6])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:6e43:b0:38e:9e55:6dee
 with SMTP id adf61e73a8af0-393ad3a12c3mr3152790637.57.1770389178229; Fri, 06
 Feb 2026 06:46:18 -0800 (PST)
Date: Fri, 6 Feb 2026 06:46:16 -0800
In-Reply-To: <aYW+6WzOmCAvNRIH@yzhao56-desk.sh.intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260129011517.3545883-1-seanjc@google.com> <20260129011517.3545883-45-seanjc@google.com>
 <aYW+6WzOmCAvNRIH@yzhao56-desk.sh.intel.com>
Message-ID: <aYX-RpxDYrI65XRC@google.com>
Subject: Re: [RFC PATCH v5 44/45] KVM: x86/mmu: Add support for splitting
 S-EPT hugepages on conversion
From: Sean Christopherson <seanjc@google.com>
To: Yan Zhao <yan.y.zhao@intel.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Kiryl Shutsemau <kas@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, linux-kernel@vger.kernel.org, 
	linux-coco@lists.linux.dev, kvm@vger.kernel.org, 
	Kai Huang <kai.huang@intel.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	Vishal Annapurve <vannapurve@google.com>, Ackerley Tng <ackerleytng@google.com>, 
	Sagi Shahar <sagis@google.com>, Binbin Wu <binbin.wu@linux.intel.com>, 
	Xiaoyao Li <xiaoyao.li@intel.com>, Isaku Yamahata <isaku.yamahata@intel.com>
Content-Type: text/plain; charset="us-ascii"

On Fri, Feb 06, 2026, Yan Zhao wrote:
> On Wed, Jan 28, 2026 at 05:15:16PM -0800, Sean Christopherson wrote:
> > Add support for splitting S-EPT hugepages in preparation for converting a
> > subset of a hugepage to be shared, as KVM must precisely zap/remove S-EPT
> > entries to avoid clobbering guest memory (the lifetime of guest private
> > memory is tied to the S-EPT).  I.e. KVM needs to first split a hugepage so
> > that only the to-be-converted small pages can be zapped.
> > 
> > To avoid unnecessary work, e.g. if only the tail/end page of massive region
> > isn't aligned to the conversion, explicitly detect unaligned head and tail
> > pages relative to the max page size support by KVM, i.e. head/tail pages
> > that will undergo partial conversion.
> > 
> > To support splitting an S-EPT hugepage without a vCPU, add a per-VM PAMT
> > cache, along with a mutex to guard the cache.  Using a mutex, e.g. versus
> > a spinlock, is important at it allows KVM to allocate memory *without*
> > dropping the lock, i.e. so that the PAMT cache can be topped-up as needed
> > without needed to juggle arch.tdp_mmu_external_cache_lock.
> > 
> > Signed-off-by: Sean Christopherson <seanjc@google.com>
> > ---
> >  arch/x86/include/asm/kvm_host.h |  8 +++-
> >  arch/x86/kvm/mmu/mmu.c          |  2 +-
> >  arch/x86/kvm/mmu/tdp_mmu.c      | 72 +++++++++++++++++++++++++++++++--
> >  arch/x86/kvm/vmx/tdx.c          | 34 +++++++++++++---
> >  arch/x86/kvm/vmx/tdx.h          |  2 +
> >  5 files changed, 107 insertions(+), 11 deletions(-)
> > 
> > diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
> > index 385f1cf32d70..54dea90a53dc 100644
> > --- a/arch/x86/include/asm/kvm_host.h
> > +++ b/arch/x86/include/asm/kvm_host.h
> > @@ -1563,6 +1563,12 @@ struct kvm_arch {
> >  	 * the code to do so.
> >  	 */
> >  	spinlock_t tdp_mmu_pages_lock;
> > +
> > +	/*
> > +	 * Protect the per-VM cache of pre-allocate pages used to populate the
> > +	 * Dynamic PAMT when splitting S-EPT huge pages without a vCPU.
> > +	 */
> > +	struct mutex tdp_mmu_external_cache_lock;
> Missing "spin_lock_init(&kvm->arch.tdp_mmu_external_cache_lock);" in
> kvm_mmu_init_tdp_mmu().
> 
> Will check the patch you replied next week.

It has the same bug.  FWIW, I found and fixed the bug on our internal branch, but I
either missed the fixup when synchronizing back to the upstream branch, or I found
the issue after posting.

@@ -634,6 +642,7 @@ int tdx_vm_init(struct kvm *kvm)
        struct kvm_tdx *kvm_tdx = to_kvm_tdx(kvm);
 
        tdx_init_pamt_cache(&kvm_tdx->pamt_cache);
+       mutex_init(&kvm_tdx->pamt_cache_lock);
 
        kvm->arch.has_protected_state = true;
        /*
