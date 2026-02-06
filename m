Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0734E2C11D6
	for <linux-coco@lists.linux.dev>; Fri,  6 Feb 2026 16:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770394149; cv=none; b=gnqogG6kjHnpbQmXUVASwzGkpqkBiD7hV+gn0QEa8ZynuZz1YV/IPDn+2MOD2XQhCAcOjlNV3lFnOjusYD99PTQJclpE+0Sa2VxvsELJbAjlAkwSb4Qq81mnTY/ziKCy7EWarJ4IlHiWK4aSGf2iaEUGLDLOLWLHK55M23jBZFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770394149; c=relaxed/simple;
	bh=GseGPSvDv+zf/F49UP6691uiDwDrrNtW3q4/gn+iXJw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=YQYMvGXqPsgY04k+z6CgZ7bRQUbxoVhWAfpy/99ffEuTy7v7GnRP7nwxBGlkKazGei6GwhvoRwajrhUXHiiPm0RJVfpbwRb0wxmXNs7r193wszfSI27C+97QDHKVjbLXozMqDL2O4/1pUI0mcHVUR7zHXRRfhEyw2t6txBxe3zQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UIKnKMmJ; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UIKnKMmJ"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-c636238ec57so1470588a12.1
        for <linux-coco@lists.linux.dev>; Fri, 06 Feb 2026 08:09:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770394148; x=1770998948; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=7WKadh95vzrgW3GhMS/EMpq8htzR/DIQBwQ8Oq5fFW0=;
        b=UIKnKMmJnGQbdBwo9n4MEv0abvh+vj8lA01D/y7r3Nh6aalpW2CeK788vfU5XPLuGI
         JerjZa/9ptRC5PKjCqoho3UkVPwhx7q90IzFLUB7GF+G1kBQMr1nhqJJB3rIkFwebeoU
         kyh8C948S3YRTVDBRxx5coVUj8jXuv7npxChujtN2f519wvhNB0UeQAP5GI4Da/9UG/3
         S0f4VEy5SWby1chjMze/O5dU8qNHKVEK+n3W2M/Fza4/3AsAH1+wmg/Gm0zSRxJb3HjM
         u7hmYYUN0iG99B3Di6JJW5zBZR0DlCKJQIy8Dod3VhCwDCpfeH0cRidxSujuc4KhoSp3
         6Kfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770394148; x=1770998948;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7WKadh95vzrgW3GhMS/EMpq8htzR/DIQBwQ8Oq5fFW0=;
        b=hkgmrCP33wwY7pHPIboGiEXj1Lo/lkjqm3zDvD4XwicobOUH+PeKa89muc9feCRwSN
         C0GYvZGp4f6MASv0PkdgXlv3VZGUQZNwwYf4JbaO1DkzGvfr742jWsqP1ALMOlfa2Poz
         gULbeXWzwGVmCxs1BPBkPg2QcfHgDQ/EMbdEjCPQ51sp1Bdu+WvhJcFAajRAaWp2aEQJ
         QRA8V02VyPioHTuE3pvZU9k4OlZ/xr9ptKwfAZWLLB3qzxnWfCB45Z7szDI9KgJNRQQn
         KYPNtUA5kZ5C5VrpsCYwvZwKATPkV97HJ915yQqm+nCs49qzKnuagd9PdD7bNOH/GkE9
         vBUA==
X-Forwarded-Encrypted: i=1; AJvYcCUTWMlAvFasfi8FYHO5h/Q8kj9XwbNsGHym187jCmD+lriGcsQMkmXxHoFw5wlxckSJPlg8pOdQE4Vq@lists.linux.dev
X-Gm-Message-State: AOJu0YzLfnDQSK8L/3xwWlvv/rknMZYkZKdQclghS3XYKHZYe6IHL3X9
	HWjw/BB8bd8poKz7EzUSojJF/EPeIWKnboWC5khvshNV0g7e0NWgT0xHVchcNSH+QiDyYFL8ZuO
	/liNaQg==
X-Received: from pgax34.prod.google.com ([2002:a05:6a02:2e62:b0:c65:c5fc:1707])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:7fa9:b0:366:14ac:e20a
 with SMTP id adf61e73a8af0-393af2a3f9amr3224489637.72.1770394148215; Fri, 06
 Feb 2026 08:09:08 -0800 (PST)
Date: Fri, 6 Feb 2026 08:09:06 -0800
In-Reply-To: <aYW9UaK7tePxDuyh@yzhao56-desk.sh.intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260129011517.3545883-1-seanjc@google.com> <20260129011517.3545883-38-seanjc@google.com>
 <aYW9UaK7tePxDuyh@yzhao56-desk.sh.intel.com>
Message-ID: <aYYSIndbqLdFkaM-@google.com>
Subject: Re: [RFC PATCH v5 37/45] KVM: x86/tdp_mmu: Alloc external_spt page
 for mirror page table splitting
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
> On Wed, Jan 28, 2026 at 05:15:09PM -0800, Sean Christopherson wrote:
> > From: Isaku Yamahata <isaku.yamahata@intel.com>
> > 
> > Enhance tdp_mmu_alloc_sp_for_split() to allocate a page table page for the
> > external page table for splitting the mirror page table.
> > 
> > Signed-off-by: Isaku Yamahata <isaku.yamahata@intel.com>
> > Co-developed-by: Yan Zhao <yan.y.zhao@intel.com>
> > Signed-off-by: Yan Zhao <yan.y.zhao@intel.com>
> > [sean: use kvm_x86_ops.alloc_external_sp()]
> > Signed-off-by: Sean Christopherson <seanjc@google.com>
> > ---
> >  arch/x86/kvm/mmu/tdp_mmu.c | 13 +++++++++++--
> >  1 file changed, 11 insertions(+), 2 deletions(-)
> > 
> > diff --git a/arch/x86/kvm/mmu/tdp_mmu.c b/arch/x86/kvm/mmu/tdp_mmu.c
> > index 3b0da898824a..4f5b80f0ca03 100644
> > --- a/arch/x86/kvm/mmu/tdp_mmu.c
> > +++ b/arch/x86/kvm/mmu/tdp_mmu.c
> > @@ -1447,7 +1447,7 @@ bool kvm_tdp_mmu_wrprot_slot(struct kvm *kvm,
> >  	return spte_set;
> >  }
> >  
> > -static struct kvm_mmu_page *tdp_mmu_alloc_sp_for_split(void)
> > +static struct kvm_mmu_page *tdp_mmu_alloc_sp_for_split(struct tdp_iter *iter)
> >  {
> >  	struct kvm_mmu_page *sp;
> >  
> > @@ -1461,6 +1461,15 @@ static struct kvm_mmu_page *tdp_mmu_alloc_sp_for_split(void)
> >  		return NULL;
> >  	}
> >  
> > +	if (is_mirror_sptep(iter->sptep)) {
> tdp_mmu_alloc_sp_for_split() is invoked in tdp_mmu_split_huge_pages_root() after
> rcu_read_unlock() is called.
> 
> So, it's incorrect to invoke is_mirror_sptep() which internally contains
> rcu_dereference(), resulting in "WARNING: suspicious RCU usage".

Ah, now I see why the previous code pass in a bool.  I don't love passing a bool,
but passing @iter is outright dangerous, so I guess this?

diff --git a/arch/x86/kvm/mmu/tdp_mmu.c b/arch/x86/kvm/mmu/tdp_mmu.c
index a32192c35099..4d92c0d19d7c 100644
--- a/arch/x86/kvm/mmu/tdp_mmu.c
+++ b/arch/x86/kvm/mmu/tdp_mmu.c
@@ -1448,7 +1448,7 @@ bool kvm_tdp_mmu_wrprot_slot(struct kvm *kvm,
 }
 
 static struct kvm_mmu_page *tdp_mmu_alloc_sp_for_split(struct kvm *kvm,
-                                                      struct tdp_iter *iter)
+                                                      bool is_mirror_sp)
 {
        struct kvm_mmu_page *sp;
 
@@ -1460,7 +1460,7 @@ static struct kvm_mmu_page *tdp_mmu_alloc_sp_for_split(struct kvm *kvm,
        if (!sp->spt)
                goto err_spt;
 
-       if (is_mirror_sptep(iter->sptep)) {
+       if (is_mirror_sp) {
                sp->external_spt = (void *)kvm_x86_call(alloc_external_sp)(GFP_KERNEL_ACCOUNT);
                if (!sp->external_spt)
                        goto err_external_spt;
@@ -1525,6 +1525,7 @@ static int tdp_mmu_split_huge_pages_root(struct kvm *kvm,
                                         gfn_t start, gfn_t end,
                                         int target_level, bool shared)
 {
+       const bool is_mirror_root = is_mirror_sp(root);
        struct kvm_mmu_page *sp = NULL;
        struct tdp_iter iter;
 
@@ -1557,7 +1558,7 @@ static int tdp_mmu_split_huge_pages_root(struct kvm *kvm,
                        else
                                write_unlock(&kvm->mmu_lock);
 
-                       sp = tdp_mmu_alloc_sp_for_split(kvm, &iter);
+                       sp = tdp_mmu_alloc_sp_for_split(kvm, is_mirror_root);
 
                        if (shared)
                                read_lock(&kvm->mmu_lock);
