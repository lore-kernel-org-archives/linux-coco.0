Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0FEA1DFD96
	for <linux-coco@lists.linux.dev>; Thu,  5 Feb 2026 23:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770332816; cv=none; b=Jl6PwlWPe+YCpJ/bD7tPvKfswSRgDA78mlF5/MwUPOH4qGKVdKr2eqTH8o36OZCyuIfpwnfVXtNeqS4eboh5coXoooZLZUNRuF4PjXQVmpQJ500P18+ObU0LR0Lu5mSldTii7uh8TMC2Ug9KC3wcrzf0lOcHPukzaXi3v+hCqOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770332816; c=relaxed/simple;
	bh=aihXvScW7k3bgdhqYtkiUVksAxCiMXO+pCvT8/8TTSc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=nkdlgq11zNdoE7HWZKgtp9g/XxtK6Hfslha9YJdnxnsQEoXFc7zCSZXjbaM9G+zSmMpg6Yd0Io3gd6cmVM720Y/Io61jnHR1BJCkBUaJ4Fh//7pOZ+nnmB35YALUEy7zXXSe2jfv0WPkwXRO4kzDhrlbpr/nPwB0nL7SLl/wgr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=0M1kR9jw; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="0M1kR9jw"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-b630753cc38so3088083a12.1
        for <linux-coco@lists.linux.dev>; Thu, 05 Feb 2026 15:06:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770332816; x=1770937616; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=L8LUQCh61biJeu6NLvqdju68dTm4Qnz97N7lSr/nZdA=;
        b=0M1kR9jwDLn7G2Xky+WtWTYdshq40yfLMwmVTCHmKOlKwwKOugYgdMZNE1Yo11UrTm
         lDFnpM1s1OZWbuiQiASL5HdcwCs7gn9FPT8n8rRWnJhaVDY4ea4IzBRlpGt2fw0hI5vz
         1dG3sqJWXmY6NQPWaNbrihL2BLaHfRMaJn/C3wX9TV3DpUgJT8KjiUOXajH1HoOjRGjq
         FYRCkd9Eks03Hs5nP7kSwFgSAgamXFSVj/T6e9XsdLl59gToCOpC3DswmY1qYL+sez/g
         4knkq7mA7kXmGaM0NUFSJTNlgMn5vjN8cYO7oZkAJIU04zfyDU1UyYJY91jAM0AP58Qx
         jH7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770332816; x=1770937616;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L8LUQCh61biJeu6NLvqdju68dTm4Qnz97N7lSr/nZdA=;
        b=bLpGaVf/IZy/YebRW+u1KcVZF+cRzF2OUMjqEbQiY2G0HnSQJgoVkM0zs+KwLLMUm9
         aRu5bcuEuWVRlxvUhTaYZ4RWx0t6uU1CgAEMvPaK2ycGrcCTC6FVxiKtFaTU87SZXvvI
         kqK6XPyVoih4LMA1naRPq5sd2BdHR7FFm4K70C0q4QOcNMjkt3P3h5avuKnACqUx99Kq
         SAYgFVOKVCUqDbHQyFqVZfGGjOhZsRj3tdmm9CaRTyFhfZxzSfAD0gygTvt09c4bLy5O
         WsuLXm2wnMDnpg0Z1wAvO6cuTtfZ/XAzmKsX0ahCt2VPN/3oQBYJY5hF7mWL3n1rHih4
         1f/w==
X-Forwarded-Encrypted: i=1; AJvYcCVnMZukA4rvU6sHSrj/HQaFx92Stwtv/BXt6X88HUVNvBk30L5YHcJsyVAJ91UJSSzF4v4un9/04G2/@lists.linux.dev
X-Gm-Message-State: AOJu0Yx2C06EG0ieb3QRNuoXMHQPKtzm2ucJEMkXZLTXIvJt9sXzCu+a
	ViqEeNHwrVhhdkkIHus3kUDK8IKGqQ6VYAyk0T6RSt0tPaAQU249u2qtXV3JpAYZsCvFkPn3iEE
	1g41nGg==
X-Received: from pjok9.prod.google.com ([2002:a17:90a:9109:b0:353:e172:1e2c])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:497:b0:38d:fde5:249e
 with SMTP id adf61e73a8af0-393ad3ae21amr850191637.68.1770332815986; Thu, 05
 Feb 2026 15:06:55 -0800 (PST)
Date: Thu, 5 Feb 2026 15:06:53 -0800
In-Reply-To: <aYL3izez+eZ34G/3@yzhao56-desk.sh.intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260129011517.3545883-1-seanjc@google.com> <20260129011517.3545883-7-seanjc@google.com>
 <aYL3izez+eZ34G/3@yzhao56-desk.sh.intel.com>
Message-ID: <aYUijQwl2Q6Q81DL@google.com>
Subject: Re: [RFC PATCH v5 06/45] KVM: x86/mmu: Fold set_external_spte_present()
 into its sole caller
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
> On Wed, Jan 28, 2026 at 05:14:38PM -0800, Sean Christopherson wrote:
> > @@ -626,6 +599,8 @@ static inline int __must_check __tdp_mmu_set_spte_atomic(struct kvm *kvm,
> >  							 struct tdp_iter *iter,
> >  							 u64 new_spte)
> >  {
> > +	u64 *raw_sptep = rcu_dereference(iter->sptep);
> > +
> >  	/*
> >  	 * The caller is responsible for ensuring the old SPTE is not a FROZEN
> >  	 * SPTE.  KVM should never attempt to zap or manipulate a FROZEN SPTE,
> > @@ -638,31 +613,46 @@ static inline int __must_check __tdp_mmu_set_spte_atomic(struct kvm *kvm,
> >  		int ret;
> >  
> >  		/*
> > -		 * Users of atomic zapping don't operate on mirror roots,
> > -		 * so don't handle it and bug the VM if it's seen.
> > +		 * KVM doesn't currently support zapping or splitting mirror
> > +		 * SPTEs while holding mmu_lock for read.
> >  		 */
> > -		if (KVM_BUG_ON(!is_shadow_present_pte(new_spte), kvm))
> > +		if (KVM_BUG_ON(is_shadow_present_pte(iter->old_spte), kvm) ||
> > +		    KVM_BUG_ON(!is_shadow_present_pte(new_spte), kvm))
> >  			return -EBUSY;
> Should this be -EIO instead?

Yeah, probably.

> Though -EBUSY was introduced by commit 94faba8999b9 ('KVM: x86/tdp_mmu:
> Propagate tearing down mirror page tables')
> 
> > -		ret = set_external_spte_present(kvm, iter->sptep, iter->gfn,
> > -						&iter->old_spte, new_spte, iter->level);
> Add "lockdep_assert_held(&kvm->mmu_lock)" for this case?

No, because I don't want to unnecessarily bleed TDX details into common MMU.  Ah,
but there was a pre-existing lockdep in set_external_spte_present().  So I guess
that's arguably a functional change and should be called out in the changelog.

But I still want to drop the assertion (or maybe move it to TDX in a prep patch),
because ultimately the requirements around locking come from TDX, not from the
TDP MMU.
