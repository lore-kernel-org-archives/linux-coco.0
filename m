Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DECDB332ECB
	for <linux-coco@lists.linux.dev>; Thu,  5 Feb 2026 22:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770331091; cv=none; b=k9tI+JPp1T/TZhJ/dEm9sw4tHT+QoJTYAxuqOPp7kSK8ugpRwQSpE8ASe+G+uVLNcjtn41PjGkPi/y7AhCUW5ecNdhTvTf6PEmXlPdW/GefYZ06ynjHPqnVbp5Ot2nYmlCsjRBUfdlxwIjwomsvptSnB4X7ozC8f2HWI+vild2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770331091; c=relaxed/simple;
	bh=YHuWLI7vqpaFUVgA48uLnmqh4lvi/ESzazpPvwDrPfI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=WBk6VOK/8wom4NOmgAZfCA4fpFK9FuL3r2be1wlQ4DQd3hP6geKvuiHX0nNbVz5n2QOOf59/1H1QG3QF+QQjucMGmYC9GyV/f1c4KMqGFb8pdWYAoql0/6GF0hL2416SBdvbK62ctTe7da1P9FxtN1JHJa8Rmx8dbtmjatLmLMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=s41cpsf9; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="s41cpsf9"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-2a07fa318fdso15032395ad.0
        for <linux-coco@lists.linux.dev>; Thu, 05 Feb 2026 14:38:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770331090; x=1770935890; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=l7Cxq1heXUBi49e9Wexr9Rtb/4PcjxqgXg/oc/Il7q8=;
        b=s41cpsf9VuUwqhlHTZfnEdD5qLH5msap41j9k7SV1OVZd4YLbdbrndCrahoyGONeo0
         7nPpptsWjNdxSupQ9qaYQ9M39kjyqYfscytmOi0ISlGJir+Eb+3para6YTFagPeQ3NoT
         LL2DXCln7vofgoJKkuliQXsJuZ3/IhILSQuVUKiz9Oy+cq8yN6bnHXrsVlULCaI4U3Rn
         cxe+2OZp6Gu5j/ldHLANN69CaEq8lmjKK+W4wDG/OewwOrQkU/xMEHzDdV0ptkKntySg
         weW8OLNjZy429RASd3a89opM49nD+5g3pYOFG4xorKW+Mb2df1wJ+vvXt/d9eMttjfVn
         AUmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770331090; x=1770935890;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l7Cxq1heXUBi49e9Wexr9Rtb/4PcjxqgXg/oc/Il7q8=;
        b=pW9SfVtS0j6KYhZnOJaGrvgizVSPlnTtf1YWrFzLelQ3AV56iVoZVX1L5zVRTBAK4I
         om2f960O/cSrAp2o+JUDHbA0hB+Ir5XvozNvFR+WiD6T7Xqe+03AQQ0w9gC+oUAMwR1S
         ru2puiqP0L3LnsJyWzSKRDSyBkK1BjzMS/MRKPDJtza5WgAbMjh8y3sBAyCQDSWtzNnl
         p7lF58hQ0/mevlWBkL9F3SjAWFKp6jL7P5EwyOjBsWQh8nZ+nPBP46q67aA4M7VXKPoq
         2de1I5s5g91i3gbR4LqGdTc7sHsmop3yW2yIIYewXrx9P/2fBtdKhy8wb2UdNWljWDYK
         To/A==
X-Forwarded-Encrypted: i=1; AJvYcCWF+0FscpPtZ1EHO2/4GEOVhNAgMHCgPgtwzrpM/P+0l8h4FcNfofPrFp4g6BTHurXy5ILEU9a+UcFL@lists.linux.dev
X-Gm-Message-State: AOJu0Yz5ed+MOZiN0a5Vz9LT9JVe/USMb0yRlSA/4a/Y5HKahAtdKGiK
	WnU+5ZjbvK962FTUgkG9S9tR5lCmnvh9d7tVrUggOfahXhYJUeZFMX0gnI3YAXpK13MyUCxBkIa
	OBQCplw==
X-Received: from plkn1.prod.google.com ([2002:a17:902:6a81:b0:2a9:2ce4:2399])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:2f08:b0:29b:e512:752e
 with SMTP id d9443c01a7336-2a952232dc0mr6704095ad.47.1770331090264; Thu, 05
 Feb 2026 14:38:10 -0800 (PST)
Date: Thu, 5 Feb 2026 14:38:08 -0800
In-Reply-To: <aYRBE1tICOiQ/RL0@yzhao56-desk.sh.intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260129011517.3545883-1-seanjc@google.com> <20260129011517.3545883-10-seanjc@google.com>
 <aYMVEX5OO22/Y72/@yzhao56-desk.sh.intel.com> <aYRBE1tICOiQ/RL0@yzhao56-desk.sh.intel.com>
Message-ID: <aYUb0KvJynvYjr3h@google.com>
Subject: Re: [RFC PATCH v5 09/45] KVM: x86: Rework .free_external_spt() into .reclaim_external_sp()
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

On Thu, Feb 05, 2026, Yan Zhao wrote:
> On Wed, Feb 04, 2026 at 05:45:39PM +0800, Yan Zhao wrote:
> > On Wed, Jan 28, 2026 at 05:14:41PM -0800, Sean Christopherson wrote:
> > > diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
> > > index d12ca0f8a348..b35a07ed11fb 100644
> > > --- a/arch/x86/include/asm/kvm_host.h
> > > +++ b/arch/x86/include/asm/kvm_host.h
> > > @@ -1858,8 +1858,8 @@ struct kvm_x86_ops {
> > >  				 u64 mirror_spte);
> > >  
> > >  	/* Update external page tables for page table about to be freed. */
> > > -	int (*free_external_spt)(struct kvm *kvm, gfn_t gfn, enum pg_level level,
> > > -				 void *external_spt);
> > > +	void (*reclaim_external_sp)(struct kvm *kvm, gfn_t gfn,
> > > +				    struct kvm_mmu_page *sp);
> > Do you think "free" is still better than "reclaim" though TDX actually
> > invokes tdx_reclaim_page() to reclaim it on the TDX side?
> > 
> > Naming it free_external_sp can be interpreted as freeing the sp->external_spt
> > externally (vs freeing it in tdp_mmu_free_sp_rcu_callback(). This naming also
> > allows for the future possibility of freeing sp->external_spt before the HKID is
> > freed (though this is unlikely).
> Oh. I found there's a free_external_sp() in patch 20.
> 
> So, maybe reclaim_external_sp() --> remove_external_spt() ?
> 
> Still think "sp" is not good :)

I think my vote would be for reclaim_external_spt().  I don't like "remove", because
similar to "free", I think most readers will assume success is guaranteed.
