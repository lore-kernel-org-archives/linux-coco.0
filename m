Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FDDA31AF36
	for <linux-coco@lists.linux.dev>; Tue,  3 Feb 2026 20:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770149108; cv=none; b=BpntOkCEuq903MWQyQaVnGLCDoYnxfuCIsJ6Q1RZcDucUg77YqZlFWx2hi5aPUkf9t9U0DvtZxB1s3E7HOKP4qwdy88R40TFYBC8H6VUeVf7Dpy9EygL3dETY/X/GCgLPFqLGoZBe68BC3bD8UEmFOaHUVBDBsITc8lQYHqpf14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770149108; c=relaxed/simple;
	bh=27o1wKuHEcNlANVMdC7x0Trddiu/F8hRGySQRl5se5c=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=bJUIhvre7MWDUOcJXg/KdkYJyhdpC6OU/jv3SJE8ANhdd6r3ly/SH3C6zAPL0uIUxD8YTdhnb8G6c4/05LaI3NdfzrP3k4KBI3SOa4zYkqfYazbvPG8rB2KwWkTxcxqjn+Q4cIjypgWNc/VoarFDSckrCLV0hVOB9MbBTofnol4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VUlv8DCn; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VUlv8DCn"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-34c5d6193daso13998792a91.1
        for <linux-coco@lists.linux.dev>; Tue, 03 Feb 2026 12:05:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770149106; x=1770753906; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=MTkxDSMkaltlyd44nQIL0k0Ugq+OLZ5pVW5UzVf+elM=;
        b=VUlv8DCn7LZAxkARlOd+GqwqdHVJna4cHQB+6Wach68dM2iME7XZUyS7+eYIxkayRQ
         Y4jRrIp3X6jWgC9SvwmfWRExAIDQgWJwWAFXv76GJ3KwQtllmVUqm7DZeGV+4XHSnexj
         uR3Ewjiw2EbANKGrJycBPN1H45QTd+CPtwZ4hikD5M1ofjAaCUfsTG2QaqsHHwZFPuOJ
         grZ3TKetA/u8J9T7R7TuA4McLr7kuNXqHvxdCzcpLrBqMDaJG6MpuxL8mN9f0tUHDh18
         epSHLRfebMoHXb65qVdCAl5qQEieMl155bynrEfvz8CB9aUjy9EHuOApydhLN1HGbnEo
         KyvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770149106; x=1770753906;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MTkxDSMkaltlyd44nQIL0k0Ugq+OLZ5pVW5UzVf+elM=;
        b=SvOH1TgqljFqTxzQM8DzjBypwBb/C9xBBUzZNYnkGyiiB9Om9I+6dOSwXN01OUBfAv
         MLW36HK4Y5GUPpw3PI2STjCyxuj31aE0Q4cjqUYbBfr9RgRYks3y92PqDuFdRC2lMeBP
         z219Nejj4tAmxt2NBzdR7PO1u6wGbVJ8Pon2gekBaU9jdB0kKYNaSZWIVotT+hkx23n/
         gCD5SbZNmXwp+rhzPNER5J2/8PF3Qd7zuVpk2Zu0C0BoFT3IEyTw5LZbj7+nkOcY+r3E
         IWw8/JkxZPsOd/HT3P1841CpJUraWffz+AhIUDQqC35OPT41wVsX5YwSFShMNKH0M6bb
         fT7w==
X-Forwarded-Encrypted: i=1; AJvYcCUkVwJKO1FgKJSyojMzYg8vlgIDWFYHKX3EAyMZtzTDQwREKk7cg3iHTvs3/l/VJXOI0ZL/TKG1CBZP@lists.linux.dev
X-Gm-Message-State: AOJu0YxTNvKkdNhhtQkrW+sbtdyzn7w+5IQhmS2jhzPzQcEpcQ5uDbiW
	lAQMNjb0a5hfiZ0az00+rWdQWGKwstbduKhLwYM2t1owDqFrY2jX57fhaSWHUeDB29n1cu72u07
	CiQpVmQ==
X-Received: from pjsg5.prod.google.com ([2002:a17:90a:7145:b0:352:d19a:6739])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2242:b0:338:3d07:5174
 with SMTP id 98e67ed59e1d1-354870aad4dmr367163a91.5.1770149106374; Tue, 03
 Feb 2026 12:05:06 -0800 (PST)
Date: Tue, 3 Feb 2026 20:05:05 +0000
In-Reply-To: <aYHLlTPeo2fzh02y@yzhao56-desk.sh.intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260129011517.3545883-1-seanjc@google.com> <20260129011517.3545883-6-seanjc@google.com>
 <aYHLlTPeo2fzh02y@yzhao56-desk.sh.intel.com>
Message-ID: <aYJU8Som706YkIEO@google.com>
Subject: Re: [RFC PATCH v5 05/45] KVM: TDX: Drop kvm_x86_ops.link_external_spt(),
 use .set_external_spte() for all
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

On Tue, Feb 03, 2026, Yan Zhao wrote:
> On Wed, Jan 28, 2026 at 05:14:37PM -0800, Sean Christopherson wrote:
> >  static int __must_check set_external_spte_present(struct kvm *kvm, tdp_ptep_t sptep,
> >  						 gfn_t gfn, u64 *old_spte,
> >  						 u64 new_spte, int level)
> >  {
> > -	bool was_present = is_shadow_present_pte(*old_spte);
> > -	bool is_present = is_shadow_present_pte(new_spte);
> > -	bool is_leaf = is_present && is_last_spte(new_spte, level);
> > -	int ret = 0;
> > -
> > -	KVM_BUG_ON(was_present, kvm);
> > +	int ret;
> >  
> >  	lockdep_assert_held(&kvm->mmu_lock);
> > +
> > +	if (KVM_BUG_ON(is_shadow_present_pte(*old_spte), kvm))
> > +		return -EIO;
> Why not move this check of is_shadow_present_pte() to tdx_sept_set_private_spte()
> as well? 

The series gets there eventually, but as of this commit, @old_spte isn't plumbed
into tdx_sept_set_private_spte().

> Or also check !is_shadow_present_pte(new_spte) in TDP MMU?

Not sure I understand this suggestion.
   	
> > diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
> > index 5688c77616e3..30494f9ceb31 100644
> > --- a/arch/x86/kvm/vmx/tdx.c
> > +++ b/arch/x86/kvm/vmx/tdx.c
> > @@ -1664,18 +1664,58 @@ static int tdx_mem_page_aug(struct kvm *kvm, gfn_t gfn,
> >  	return 0;
> >  }
> >  
> > +static struct page *tdx_spte_to_external_spt(struct kvm *kvm, gfn_t gfn,
> > +					     u64 new_spte, enum pg_level level)
> > +{
> > +	struct kvm_mmu_page *sp = spte_to_child_sp(new_spte);
> > +
> > +	if (KVM_BUG_ON(!sp->external_spt, kvm) ||
> > +	    KVM_BUG_ON(sp->role.level + 1 != level, kvm) ||
> > +	    KVM_BUG_ON(sp->gfn != gfn, kvm))
> > +		return NULL;
> Could we remove the KVM_BUG_ON()s, and ...
> 
> > +	return virt_to_page(sp->external_spt);
> > +}
> > +
> > +static int tdx_sept_link_private_spt(struct kvm *kvm, gfn_t gfn,
> > +				     enum pg_level level, u64 mirror_spte)
> > +{
> > +	gpa_t gpa = gfn_to_gpa(gfn);
> > +	u64 err, entry, level_state;
> > +	struct page *external_spt;
> > +
> > +	external_spt = tdx_spte_to_external_spt(kvm, gfn, mirror_spte, level);
> > +	if (!external_spt)
> add a KVM_BUG_ON() here?
> It could save KVM_BUG_ON()s and have KVM_BUG_ON() match -EIO :)

We could, but I don't want to, because if we're going to bother with sanity checks,
I want the resulting WARNs to be precise.  I.e. I want the WARN to capture *why*
tdx_spte_to_external_spt() failed, to make debug/triage easier.

> And as Rick also mentioned, better to remove external in external_spt, e.g.
> something like pt_page.

Yeah, maybe sept_spt?

> And mirror_spte --> new_spte?

Hmm, ya, I made that change later, but it can probably be shifted here.

> > -	WARN_ON_ONCE(!is_shadow_present_pte(mirror_spte) ||
> > -		     (mirror_spte & VMX_EPT_RWX_MASK) != VMX_EPT_RWX_MASK);
> > +	WARN_ON_ONCE((mirror_spte & VMX_EPT_RWX_MASK) != VMX_EPT_RWX_MASK);
> Also check this for tdx_sept_link_private_spt()?

Eh, we could, but I don't think it's necessary.  make_nonleaf_spte() is hardcoded
to set full permissions (and I don't see that changing any time soon), whereas
leaf SPTE protections are much more dynamic.
