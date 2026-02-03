Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 569FB368294
	for <linux-coco@lists.linux.dev>; Tue,  3 Feb 2026 20:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770149858; cv=none; b=gx44piPCbFRBAbtRggTs9yP6uidOWR2d5f+pV3WW89elpfLoHPjLbw33wMEw8OF6KLT3mcwdVB2MXkjdvqOEUT68akPFErJKsRpyw8Xaq5s+XlDXlUmj9avU+asMYyYVUh+7FlgeaKsT+KFAojbHxHRQ4/5tOTUKbFNu/3tkO4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770149858; c=relaxed/simple;
	bh=FkCJM6ueNs7FqOzKfJS3PcbT/ZLZ/g8y/UzMew7y1Rw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=JsXN87xCn/lePz/oJEUAutKwJXKRlWWnuljvg15+I8OW+jCZxykdNth4Uy6GVrUt4E8DRlDD2k18F2pNZ1TTkLo9oHZF6vwKmC5KxiwxehIO8iFBcb61lnjkNJrPl+/SUWq7wHcTRJWHRpnXryX1aiDJcIHh+u86OVv5pMp8k3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hImfxKvx; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hImfxKvx"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-352e6fcd72dso10604280a91.3
        for <linux-coco@lists.linux.dev>; Tue, 03 Feb 2026 12:17:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770149856; x=1770754656; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=o4mt8h2gjWj7DXhBKRKL7wFsuvXhNdmeJu1raWnSkac=;
        b=hImfxKvxv387jwzEPE4akwDBX21uhlX07CbuQsioAqB9VBmYszimvWBqr2ChXWqgls
         nzuksXGM9QIFHSfYA06tvhvT2b0FJK/RgGoaE7h3sNR/LRuWX2yE3l+esoMDbN3B6ktp
         S9n5b5nSwIJxjU5phjFsvpVmbIYzQiXlbLrJKTPWVj0Kkj5fwEeUaif7DkN5ca6W+PKT
         hpzGKRhwyJ6sNGTSzqnD3KMDc1eWkWWlQYJ3CqClqY9aVP1O6DIErjuKVFg6WbHUeXPr
         SoIly4eOMewj42DUYVE94hVnh39W6P+k87kYBboYKCpuZwzJ9ZTcLVjTSHa6Oo6xcXOw
         5FPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770149856; x=1770754656;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o4mt8h2gjWj7DXhBKRKL7wFsuvXhNdmeJu1raWnSkac=;
        b=GPxa/buIBdsTZkYXOc6PAGZUxTOqqZP/8Qd6yU9r3DqadiggB1PNz3iuMv5UaUri8J
         kQE1bgKbOE10Hw4ON/9Qu+9f4Tw7AI2dhEriqbCGfXA6JTdQ6GxQMnynd9ET+fOPR88d
         I/wJHNKdNSvHUUxEFa1TjyfGLgIF43Cwd2QQJQWaXlZHmOj4IMcmDpZM2BTTIr2FDclR
         X/E+kQ58W8+KjlGOoGDuyWFlwhS4cH4pKjmWcDEmX7hCiWJ6Wa228KrFwkLmlPw1H450
         BPVwCQIdAz2Vv0UXEoz+pQwgCSUoULuysITBDHlwzvp7u9XN7imfF7TaGBfKO6hPkb1i
         ZmEw==
X-Forwarded-Encrypted: i=1; AJvYcCVDJXl0+DFMrnvI49DKo79Vy/p5dSjOlvMLv6i6rSXgh1gi2ZriK8WxGhX5OP0ty3LEebAyKiM0FEn9@lists.linux.dev
X-Gm-Message-State: AOJu0YyXcEnlGRBvZomg+T05yzc0R2SxPPJNJqche+H60pOaIA2/r19N
	0zKvP0PLhNiV2eGCYpyv3zKlmGnb9Dw55XkUl1RYExBuUSajitv5QHsWRHmHD9U91mcWKw7l2qX
	I8w2TDA==
X-Received: from pjqf2.prod.google.com ([2002:a17:90a:a782:b0:351:b6a:a36b])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4b45:b0:352:ccae:fe65
 with SMTP id 98e67ed59e1d1-354870ab6aamr390303a91.4.1770149856475; Tue, 03
 Feb 2026 12:17:36 -0800 (PST)
Date: Tue, 3 Feb 2026 12:17:34 -0800
In-Reply-To: <4fae16cdcc368d33f128c3a79c788b905b83ffe7.camel@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260129011517.3545883-1-seanjc@google.com> <20260129011517.3545883-21-seanjc@google.com>
 <4fae16cdcc368d33f128c3a79c788b905b83ffe7.camel@intel.com>
Message-ID: <aYJX3usu7FzPrFWa@google.com>
Subject: Re: [RFC PATCH v5 20/45] KVM: x86/mmu: Allocate/free S-EPT pages
 using tdx_{alloc,free}_control_page()
From: Sean Christopherson <seanjc@google.com>
To: Kai Huang <kai.huang@intel.com>
Cc: "x86@kernel.org" <x86@kernel.org>, 
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "kas@kernel.org" <kas@kernel.org>, 
	"bp@alien8.de" <bp@alien8.de>, "mingo@redhat.com" <mingo@redhat.com>, 
	"pbonzini@redhat.com" <pbonzini@redhat.com>, "tglx@kernel.org" <tglx@kernel.org>, 
	Rick P Edgecombe <rick.p.edgecombe@intel.com>, 
	"ackerleytng@google.com" <ackerleytng@google.com>, "sagis@google.com" <sagis@google.com>, 
	Vishal Annapurve <vannapurve@google.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Yan Y Zhao <yan.y.zhao@intel.com>, 
	Xiaoyao Li <xiaoyao.li@intel.com>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, Isaku Yamahata <isaku.yamahata@intel.com>, 
	"binbin.wu@linux.intel.com" <binbin.wu@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"

On Tue, Feb 03, 2026, Kai Huang wrote:
> On Wed, 2026-01-28 at 17:14 -0800, Sean Christopherson wrote:
> >  	int (*set_external_spte)(struct kvm *kvm, gfn_t gfn, enum pg_level level,
> >  				 u64 mirror_spte);
> > -
> > -	/* Update external page tables for page table about to be freed. */
> >  	void (*reclaim_external_sp)(struct kvm *kvm, gfn_t gfn,
> >  				    struct kvm_mmu_page *sp);
> > -
> > -	/* Update external page table from spte getting removed, and flush TLB. */
> 
> The above two comments are still useful to me.
> 
> Not sure why do you want to remove them, especially in _this_ patch?

My intent was to replace the individual comments with a more generic comment for
all of the "external" hooks.  For things like "and flush TLB", IMO those comments
belong at the call sites, not at this point.  E.g. _KVM_ doesn't require a TLB
flush in all cases.  And so for the definition of the hooks, I would prefer a more
generic comment, so that if there are details that matter to the usage, they are
documented there.

> >  	void (*remove_external_spte)(struct kvm *kvm, gfn_t gfn, enum pg_level level,
> >  				     u64 mirror_spte);
> >  
> > +
> 
> Unintentional change?

Ya.

> 
> >  	bool (*has_wbinvd_exit)(void);
> >  
> >  	u64 (*get_l2_tsc_offset)(struct kvm_vcpu *vcpu);
> > diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
> > index 3911ac9bddfd..9b5a6861e2a4 100644
> > --- a/arch/x86/kvm/mmu/mmu.c
> > +++ b/arch/x86/kvm/mmu/mmu.c
> > @@ -6690,11 +6690,13 @@ int kvm_mmu_create(struct kvm_vcpu *vcpu)
> >  	vcpu->arch.mmu_page_header_cache.kmem_cache = mmu_page_header_cache;
> >  	vcpu->arch.mmu_page_header_cache.gfp_zero = __GFP_ZERO;
> >  
> > -	vcpu->arch.mmu_shadow_page_cache.init_value =
> > -		SHADOW_NONPRESENT_VALUE;
> > +	vcpu->arch.mmu_shadow_page_cache.init_value = SHADOW_NONPRESENT_VALUE;
> >  	if (!vcpu->arch.mmu_shadow_page_cache.init_value)
> >  		vcpu->arch.mmu_shadow_page_cache.gfp_zero = __GFP_ZERO;
> 
> Ditto.  Not sure this adjustment is intentional?

Heh, I'm pretty sure it was intentional, but yeah, doesn't belong here.
