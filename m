Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2CC233AD87
	for <linux-coco@lists.linux.dev>; Thu,  5 Feb 2026 23:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770333271; cv=none; b=p921DAUDhPvo7dDXekJ/rk5SmCw93YlVWoBNbOCesHkDcvRldtvkdRTrmOi/lObKBf2JfhYkwZFvOIe6Nc+xLXLoW7SiRuWqR52AxBdt7vty62JVBvJhQDEozg0H7sdD61ZHGEw5kLHz9Dv+xkhVFe6UZ9QXH7U3Ggrfo4+xhd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770333271; c=relaxed/simple;
	bh=MB9cFztH4tXwlZPY6Vm1wb8szVNgUXQWKPfhBfZqWcI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=WD0qO+HBfeCrG/SQAS5oxpiffvKrN+gj5e9uPf2b4ZyjmN6yeky77jZvMvYA8mQzTjjfmR0BiWZnKW1sbWe1qM/Up04K9mhTO577AK9EfnTSZuikKgX3YBJ79xGPyvv0JHVgQCT1W4rWr0Q5fqYTU57mMXzANSmlnwAGLNRBxXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vg8u2bXk; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vg8u2bXk"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-c52d37d346dso878354a12.3
        for <linux-coco@lists.linux.dev>; Thu, 05 Feb 2026 15:14:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770333271; x=1770938071; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=cz1wGDR7P66u5Gzy7fs495/TW9uNtgSB7cp6FfFekc4=;
        b=vg8u2bXkwsGpQdem3MgTtT84ZArMSDL8vzT1fYkRTQDpvxysRFNmPf5QvUClfxHrhd
         U28i1528yuOQ1mPBxxZyqpy9IkOZa/SW+EdVeqVH4VTDODuofCBxtCzL8IMtWjqJX15M
         C+DHJ224MUptVTf2m0DOug4xdbA2Oh8R80itiU4kYY43OQNk6tAMyuL3UEDkPn9wSuK3
         o1zunEnrWUHQLG2qs1hUQ0rYfAUv05JpCpX8pXGyEyLPPJ0wzmKOxP4GBXyfsiohxuqm
         rXZFSzDsLR8eC80xWSYv6Ob1B0CTUmAAZ4x7K2Y2oRS2oovV6Map2BXYQILWk5cZgcZC
         Mgxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770333271; x=1770938071;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cz1wGDR7P66u5Gzy7fs495/TW9uNtgSB7cp6FfFekc4=;
        b=Mr9RHrvTjMFTlm+U8xXK6BJHkhQb5KW72JEyMpZ5HXuiMOz13I6Tok8RmP2MlSv9NX
         QCPKsz3E6/gdiOA6wRSP9mLB+wpR7tMhES9v3f5dP0yHyA3+ciGZfqDa9NeudmQf177e
         vN5qfht3VcdGexwToHVPHPjnu/h+6jVI3vMaDoSw5MZVYJRiLlvHtOWkfk5yM47gpZVE
         VHJ0TI4tvGYbbVNYcZO/xUxLXOX2MWNSElOwG4ipVCS4IsRmVvA0VhcVYUY1r4A0KGec
         6tC7ot7kqEhTY+2hPRyzceStSIACoPB+m+8iOAV+jW6v5Yrhf2uLwl+Zin2VYoUSxIu1
         e06w==
X-Forwarded-Encrypted: i=1; AJvYcCXOJbOn/sQOd9Ed2Ll3q5ygc9ezVYaE2e/S+aXyg061WopXbjZyt4TYS/wppWfwXAyr8WQDlAw9o9zV@lists.linux.dev
X-Gm-Message-State: AOJu0YwvpL5m7ujnG1oboCCIJDFUX3X3IcDgonlDGxGkmR6y8B3V3kI/
	zdUytjxj2/kxqB1xVB+EV7olGYdLR+8PkTfA6zbu+BJTt0Q5a9AGABZcqGxF8cS6GBH7pRVM/B1
	8qWHpDg==
X-Received: from pgbcr9.prod.google.com ([2002:a05:6a02:4109:b0:c08:3dd8:1e39])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:d12f:b0:38b:d95e:69a9
 with SMTP id adf61e73a8af0-393acf898b1mr720567637.16.1770333270970; Thu, 05
 Feb 2026 15:14:30 -0800 (PST)
Date: Thu, 5 Feb 2026 15:14:29 -0800
In-Reply-To: <aYLqESiqkADxMGf9@yzhao56-desk.sh.intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260129011517.3545883-1-seanjc@google.com> <20260129011517.3545883-6-seanjc@google.com>
 <aYHLlTPeo2fzh02y@yzhao56-desk.sh.intel.com> <aYJU8Som706YkIEO@google.com> <aYLqESiqkADxMGf9@yzhao56-desk.sh.intel.com>
Message-ID: <aYUkVRedz9ngwu_1@google.com>
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

On Wed, Feb 04, 2026, Yan Zhao wrote:
> On Tue, Feb 03, 2026 at 08:05:05PM +0000, Sean Christopherson wrote:
> > On Tue, Feb 03, 2026, Yan Zhao wrote:
> > > On Wed, Jan 28, 2026 at 05:14:37PM -0800, Sean Christopherson wrote:
> > > >  static int __must_check set_external_spte_present(struct kvm *kvm, tdp_ptep_t sptep,
> > > >  						 gfn_t gfn, u64 *old_spte,
> > > >  						 u64 new_spte, int level)
> > > >  {
> > > > -	bool was_present = is_shadow_present_pte(*old_spte);
> > > > -	bool is_present = is_shadow_present_pte(new_spte);
> > > > -	bool is_leaf = is_present && is_last_spte(new_spte, level);
> > > > -	int ret = 0;
> > > > -
> > > > -	KVM_BUG_ON(was_present, kvm);
> > > > +	int ret;
> > > >  
> > > >  	lockdep_assert_held(&kvm->mmu_lock);
> > > > +
> > > > +	if (KVM_BUG_ON(is_shadow_present_pte(*old_spte), kvm))
> > > > +		return -EIO;
> > > Why not move this check of is_shadow_present_pte() to tdx_sept_set_private_spte()
> > > as well? 
> > 
> > The series gets there eventually, but as of this commit, @old_spte isn't plumbed
> > into tdx_sept_set_private_spte().
> > 
> > > Or also check !is_shadow_present_pte(new_spte) in TDP MMU?
> > 
> > Not sure I understand this suggestion.
> Sorry. The accurate expression should be 
> "what about moving !is_shadow_present_pte(new_spte) to TDP MMU as well?".

It's already there, in __tdp_mmu_set_spte_atomic():

		/*
		 * KVM doesn't currently support zapping or splitting mirror
		 * SPTEs while holding mmu_lock for read.
		 */
		if (KVM_BUG_ON(is_shadow_present_pte(iter->old_spte), kvm) ||
		    KVM_BUG_ON(!is_shadow_present_pte(new_spte), kvm))
			return -EBUSY;


> > > And as Rick also mentioned, better to remove external in external_spt, e.g.
> > > something like pt_page.
> > 
> > Yeah, maybe sept_spt?
> Hmm, here sept_spt is of type struct page, while sp->spt and sp->external_spt
> represents VA. Not sure if it will cause confusion.

How about sept_pt?
