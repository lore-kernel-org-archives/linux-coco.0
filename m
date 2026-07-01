Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F28E5349CC1
	for <linux-coco@lists.linux.dev>; Wed,  1 Jul 2026 21:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782940960; cv=none; b=Sv2OUqGpBVfHSojz7ugVBJaJY8OefwObnjpwH+ySV8OsxYoTfznQsDOBC9VNo7LZEWcLLMjSYWOvymKPEUoLY6SaXbI08vcAhbIb60j0at8vQUVQmOP3gG//Z4vS8+Y2G1/LXyzeIYcMolnwcZXlc6iUOWJesom9eeVxVJpL4BE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782940960; c=relaxed/simple;
	bh=kip77Md7PwYITJnOOQMo7p3iswnskWypncJ5FdSTB1Y=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=nBj2KAORocpv8Q3DFWazSf8qSCKvs8AzyZmgREVUtgLsnsBjxpgpB/NnTyd0sj71RE5v1c++Pz8c0lTyghfyCFhI6Dj/naBxul23dm5w7H2bYNe4gWo0miXq5iygKfjZV6RkBpWIC8/pTcjN9elX3eWFoOTdErfsjJhYdV7MTGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rbd6TIdt; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rbd6TIdt"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-2c8284701c2so13167095ad.1
        for <linux-coco@lists.linux.dev>; Wed, 01 Jul 2026 14:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782940958; x=1783545758; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=haHjTZYd6eldytH5GfA3G4FAjy8Nb18IhisBBKGE6LY=;
        b=rbd6TIdtbkVL2TJVz2cMdeI5Axl6gonn2jILBhy+ImcKY9wmLSXVCtsmLoGbGKrt7b
         qMC4715Mp2nuWokGxFBitx0eIVawSEKbJAGI1ah/8tmOUQYLhBWDC+96tpkcV4oELMoP
         pHKlEiN8/ofeWafoXE4evMwLHgR1+SromPl6cik5o/elimk/NYZt2J1F+JTTZV/16auT
         TIGfSclPujMUXzno+ipwyXijtLin6NmQAlgUOC42Kv7AU04yl7AvqrRPb7fM23hE8rFs
         9W47Wwr8hoVAvXhxAEntxp2oyYZeiAh4uqxTAiYnPe9r8x3k9iUuQ8ugBfCI79C/sZjP
         ZwHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782940958; x=1783545758;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=haHjTZYd6eldytH5GfA3G4FAjy8Nb18IhisBBKGE6LY=;
        b=YM9vlAYRkqG5X+sypaLojoftc9pOkHNrQT6x5vF4pKJBK30iQ2dAEnSpXuoe6qpmY9
         qzFUhw/vpkmWiaz5oRv1dCrbNYF/BJH8ZbCN3/SIT5NDY0UfVA5YdeGcPpsJosPEf/GX
         8SYAgx5OnKyuG4dwaYJGFM/0VTjZ6IcKJ7Yk//i1eDW4DaFlUsVcV77bqdiOj3QrUGxH
         IeDd3FtXxRqpyNoFWGpwh1xqwNoqXm0ne5Mt+d34rf88ynTu6dXSGZWMuu+fvsfB5MTh
         qZSNZTbQcUWvkF8e9IDf3LhxNpvZbOUikDT+31bkKX9AOxlPERXBs0oLPm8jYguWban1
         ZaOQ==
X-Forwarded-Encrypted: i=1; AHgh+RrC/WeiBvzbgWZzjmkaym3NCk+KumNsaUsowiVbrfzrfAVVGjNhhhuws97mT2WoMFIgnRJkxhiztbKl@lists.linux.dev
X-Gm-Message-State: AOJu0YxvG2/hM1chQ0m3BFxO0DnPs0OKfF8dgpoQGJAPLiflQEu922b8
	G3AfWU6RpzdZrgdRpd50d55buoBp2fKjsD5os5EtRxdqRlm8i7SKJYJtenmc1x93eQaQ3YuqTYP
	2S7/QNA==
X-Received: from plnx15.prod.google.com ([2002:a17:902:820f:b0:2c9:9db6:88e])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:2ec6:b0:2c9:e846:a57e
 with SMTP id d9443c01a7336-2ca90c2d830mr24586315ad.0.1782940958029; Wed, 01
 Jul 2026 14:22:38 -0700 (PDT)
Date: Wed, 1 Jul 2026 14:22:37 -0700
In-Reply-To: <CAEvNRgEK+LH+M32LrxFSbN3Nf9sYtAVkr2c2vYq5FHzJmJqL7g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260630213711.479692-1-seanjc@google.com> <20260630213711.479692-2-seanjc@google.com>
 <CAEvNRgEK+LH+M32LrxFSbN3Nf9sYtAVkr2c2vYq5FHzJmJqL7g@mail.gmail.com>
Message-ID: <akWFHf8_ovEEPBWi@google.com>
Subject: Re: [PATCH v2 1/2] KVM: SEV: Explicitly disallow NULL user address
 for SNP_LAUNCH_UPDATE
From: Sean Christopherson <seanjc@google.com>
To: Ackerley Tng <ackerleytng@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Kiryl Shutsemau <kas@kernel.org>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	kvm@vger.kernel.org, x86@kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Sashiko Bot <sashiko-bot@kernel.org>, 
	Joerg Roedel <joerg.roedel@amd.com>, Yan Zhao <yan.y.zhao@intel.com>
Content-Type: text/plain; charset="us-ascii"

On Wed, Jul 01, 2026, Ackerley Tng wrote:
> Sean Christopherson <seanjc@google.com> writes:
> > diff --git a/arch/x86/kvm/svm/sev.c b/arch/x86/kvm/svm/sev.c
> > index 74fb15551e83..621a2eaa58f2 100644
> > --- a/arch/x86/kvm/svm/sev.c
> > +++ b/arch/x86/kvm/svm/sev.c
> > @@ -2330,9 +2330,6 @@ static int sev_gmem_post_populate(struct kvm *kvm, gfn_t gfn, kvm_pfn_t pfn,
> >  	int level;
> >  	int ret;
> >
> > -	if (WARN_ON_ONCE(sev_populate_args->type != KVM_SEV_SNP_PAGE_TYPE_ZERO && !src_page))
> > -		return -EINVAL;
> > -
> >  	ret = snp_lookup_rmpentry((u64)pfn, &assigned, &level);
> >  	if (ret || assigned) {
> >  		pr_debug("%s: Failed to ensure GFN 0x%llx RMP entry is initial shared state, ret: %d assigned: %d\n",
> > @@ -2421,10 +2418,12 @@ static int snp_launch_update(struct kvm *kvm, struct kvm_sev_cmd *argp)
> >  	     params.type != KVM_SEV_SNP_PAGE_TYPE_CPUID))
> >  		return -EINVAL;
> >
> > -	src = params.type == KVM_SEV_SNP_PAGE_TYPE_ZERO ? NULL : u64_to_user_ptr(params.uaddr);
> > -
> > -	if (!PAGE_ALIGNED(src))
> > +	if (params.type == KVM_SEV_SNP_PAGE_TYPE_ZERO)
> > +		src = NULL;
> > +	else if (!params.uaddr || !PAGE_ALIGNED(params.uaddr))
> >  		return -EINVAL;
> > +	else
> > +		src = u64_to_user_ptr(params.uaddr);
> >
> 
> I think separating validation from src assignment logic is better, like
> 
>     if (!PAGE_ALIGNED(params.uaddr))
> 	return -EINVAL;
> 
>     if (!params.uaddr && params.type != KVM_SEV_SNP_PAGE_TYPE_ZERO)
>         return -EINVAL;
> 
>     src = params.type == KVM_SEV_SNP_PAGE_TYPE_ZERO ? NULL :
> u64_to_user_ptr(params.uaddr);
>
> This version is also slightly stricter, since it enforces that
> params.uaddr is aligned even if params.type is ZERO. 

That's technically an ABI change since KVM fully ignored params.uaddr before
this, i.e. is a potentially breaking change.  As noted in the changelog, KVM
should have required the address to be '0', but unfortunately we can't do that
without breaking userspace.

I highly doubt requiring the address to be page-aligned would break userspace,
but KVM also gains nothing from such a requirement, and from an ABI perspective,
placing restrictions on a value that is completely ignored is rather bizarre.

> (unless the intention is to really not care about uaddr and permit an
> unaligned uaddr?)

I don't think there was any intention (which is the whole problem).
