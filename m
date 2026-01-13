Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 499A0350D62
	for <linux-coco@lists.linux.dev>; Tue, 13 Jan 2026 22:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768342016; cv=none; b=asSkH5ubCVvW2lgFEtadxEGdYFdsdQTLnKgwhn1xYYmxZrDbOz9XLn644Gdsd6f3KQsQps7+4mgGX729mUV9iLwpG3j1sXF/Edohopb97X/GQ8ecJAd/5tFRuLC5/0SPD/7i8Tg3+1whNUrSO1oj03bBXJwVEgWlf189WC/FZa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768342016; c=relaxed/simple;
	bh=iW37PkhVimeAsRI9+U1iwDmo+G0sNY16lfYsThWb4ME=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=KSjfjhLsB5hvzoLM+gmWdYP9zxMsdqdsUPNIk5dLnC0zPNi67ufSdoyWYpvyDLhg7G8njLbIl31q3ppoI2LBJiNEABRCejmlzTQRq7ZgHI9Govt+Dc5yEowlf9fei9A8ShP7fM+bv4Sgzq0ce3lVYNU4IB/2mJSmIKt5JDbWXCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=xSZ9UprE; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xSZ9UprE"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-c5859a38213so1812756a12.3
        for <linux-coco@lists.linux.dev>; Tue, 13 Jan 2026 14:06:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768342015; x=1768946815; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=H47TubffnoB3LJi9WbWx6JWYlmT0g/2zrK7ql8Qwt/s=;
        b=xSZ9UprEdmpSWWqv2R892vjLQroSYXOU4USUjS6m9AgcQsAUpJRk2/HyQ3HAhN3nvA
         r7zYaoNjbbE4KPqQUCaT+5qY82SSrkB0FolurgGVy0eOpGjYT9vgAy7ahi9Nor2yjiHi
         dKHhc5gC6IupuqjRNi0ptfKTq5YdxrmexJTRNp0yQOl6Hv3qLkoVZWWxmgtH9HnQkn2h
         BvNx/wc5Qz+DOPbz6s5aFt+YvCMEuodanSDTfoqRMOwA9ewH+GCp+icqCcXpxD2g/drC
         dGXLIc2rgFbsSwXSFY58H0nx5+VzKGWsNqkNUEQ0zxLymtacuEhAKOep7dV+17wB3dBN
         x9YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768342015; x=1768946815;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H47TubffnoB3LJi9WbWx6JWYlmT0g/2zrK7ql8Qwt/s=;
        b=bTIwX2nIJth6BQKsy0OoG2whQ5E1MU2Q0ywcvTKCM4xcRzrTtGEHuom6p9pruUsODa
         56DehaU3VgCMCPG6MqYVijNgTjV6gIPCnWLMYd0Win60jQCDob3/l7GHLh9xYFykT6zj
         S2bmFgH+ddS04d9Z9PTWHCr72C//NxjwnxiorqwmXjEMGzMPj6yiIfYtGYc9LTOBtoDu
         0ZP/9jRyJfTvtba0K0VLtUHG9yQmre2+BKkNx0s6jJIEGX2Hx4P9jJLKndj31TldBoXa
         3UkXrLUS3ElhD0q5s5k9PBpauvjIkSgzcuBjWalan9gge7JmxZM8OgoAxR2cTMELtF1v
         bbZA==
X-Forwarded-Encrypted: i=1; AJvYcCUhAjWaoLlQYT4FdPOjp9rbWxcmZlYibbYNd1s+C/YdlKZ+PZCp7toJIDrD4QkVWb+BXbsB1UA1IYeo@lists.linux.dev
X-Gm-Message-State: AOJu0YwdQ8kcPY7gqwfoA8XO1qwSNHV1PpGWTUAUqveqMStGXZq8T5C3
	FdnTqEK62ryGEs+QQ8Tpd/YWhVDmzQad1uW2ZG5Tnhqt1VaKWF8yKMFX5GZv4uUiEd7/CJ+5o1L
	THCvNsQ==
X-Received: from pllj12.prod.google.com ([2002:a17:902:758c:b0:29f:22e:147c])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:1c2:b0:2a0:b461:c883
 with SMTP id d9443c01a7336-2a599e2ed67mr4408825ad.45.1768342014462; Tue, 13
 Jan 2026 14:06:54 -0800 (PST)
Date: Tue, 13 Jan 2026 14:06:52 -0800
In-Reply-To: <20260113213556.rwihf3v3ek3c5kwl@amd.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260108214622.1084057-1-michael.roth@amd.com>
 <20260108214622.1084057-7-michael.roth@amd.com> <aWabORpkzEJygYNQ@google.com> <20260113213556.rwihf3v3ek3c5kwl@amd.com>
Message-ID: <aWbB_Dd94rngPfgm@google.com>
Subject: Re: [PATCH v3 6/6] KVM: guest_memfd: GUP source pages prior to
 populating guest memory
From: Sean Christopherson <seanjc@google.com>
To: Michael Roth <michael.roth@amd.com>
Cc: kvm@vger.kernel.org, linux-coco@lists.linux.dev, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, thomas.lendacky@amd.com, pbonzini@redhat.com, 
	vbabka@suse.cz, ashish.kalra@amd.com, liam.merwick@oracle.com, 
	david@redhat.com, vannapurve@google.com, ackerleytng@google.com, aik@amd.com, 
	ira.weiny@intel.com, yan.y.zhao@intel.com, pankaj.gupta@amd.com, 
	Kai Huang <kai.huang@intel.com>
Content-Type: text/plain; charset="us-ascii"

On Tue, Jan 13, 2026, Michael Roth wrote:
> On Tue, Jan 13, 2026 at 11:21:29AM -0800, Sean Christopherson wrote:
> > On Thu, Jan 08, 2026, Michael Roth wrote:
> > > @@ -842,47 +881,38 @@ long kvm_gmem_populate(struct kvm *kvm, gfn_t start_gfn, void __user *src, long
> > >  	if (!file)
> > >  		return -EFAULT;
> > >  
> > > -	filemap_invalidate_lock(file->f_mapping);
> > > -
> > >  	npages = min_t(ulong, slot->npages - (start_gfn - slot->base_gfn), npages);
> > >  	for (i = 0; i < npages; i++) {
> > > -		struct folio *folio;
> > > -		gfn_t gfn = start_gfn + i;
> > > -		pgoff_t index = kvm_gmem_get_index(slot, gfn);
> > > -		kvm_pfn_t pfn;
> > > +		struct page *src_page = NULL;
> > > +		void __user *p;
> > >  
> > >  		if (signal_pending(current)) {
> > >  			ret = -EINTR;
> > >  			break;
> > >  		}
> > >  
> > > -		folio = __kvm_gmem_get_pfn(file, slot, index, &pfn, NULL);
> > > -		if (IS_ERR(folio)) {
> > > -			ret = PTR_ERR(folio);
> > > -			break;
> > > -		}
> > > +		p = src ? src + i * PAGE_SIZE : NULL;
> > >  
> > > -		folio_unlock(folio);
> > > +		if (p) {
> > 
> > Computing 'p' when src==NULL is unnecessary and makes it hard to see that gup()
> > is done if and only if src!=NULL.
> > 
> > Anyone object to this fixup?
> 
> No objections here, and it does seem a bit more readable. Will include
> this if a new version is needed.

No need, I'll fixup when applying (already have, actually).  If you want to double
check that I didn't fat finger anything, the patches are in kvm-x86/gmem.

Thanks!
