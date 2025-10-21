Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0014334C159
	for <linux-coco@lists.linux.dev>; Tue, 21 Oct 2025 17:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761069074; cv=none; b=BbrKRCyW+KPfPr9FrprP/1f56Yjp8XgdOh8vFyCCNfLtTYg3IbzTAtqgV5EWs4WqFmene9n+IayQY7blX37TTiOsrBOQslWTSI0lS4RYC7IX+2KQkhqkbXmnFW8IC9F0M9zvsvJb4IZUeKuxJX2AaBsQpv6tIuw4/yfOzy2WN0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761069074; c=relaxed/simple;
	bh=IvjvTfof1NX7f0a6Mj/sydhqvdCdvq4pVhC8YJjU2Nc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=OlFTs0anp7AFxm/FGPMKzV/Q4mWv6Cm70H37hn8Q9MC9Ksk8xDY2wXltL9np0Zq6UIObY1no+XnQxWoQaGNaF3aB44+bxW4iwsaXjkP+epNTVK283yR5kjo/cEbIWp42Q3EywUNCWnwHFLL//5CT3X7a872K09y9ho+VCC4HXpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=t8hLj+Y9; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="t8hLj+Y9"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-33c6140336eso9520914a91.3
        for <linux-coco@lists.linux.dev>; Tue, 21 Oct 2025 10:51:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761069072; x=1761673872; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=7Mbuo7BVKgUb8P9fXKLxWi8r7pdvvGC3+QWIjFuJjuE=;
        b=t8hLj+Y90w2Ze33+KS3PFV/bt8BL3JMyb0VB5NkhwNa1+tx/HxWESnBGlKi06SM8E6
         BFOSH5OiK4cK9olab44MzQDINdEJiipfJJFQsMtXFPdhRhIiBJGPuXewiuV969m8MBnE
         UhazoecS+p6orhYTJK2mj9fdZ849qJYHXzE6VqXrXu0PIGJawJCqSrwdRlz/kDoI40jR
         BQzdSYvDGzzypOCqHUsvmb9yTmPRhqpxJ4liQ+yZrKARNRjEuP1YtHXrglQqjq2yIAwR
         1IGfrN9xDDu/kNRCKkkeNw4WQgiKHbl7kwC3UmsSXtsw3GWrjKL1qJkkdEGFPRWFP16J
         +nxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761069072; x=1761673872;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7Mbuo7BVKgUb8P9fXKLxWi8r7pdvvGC3+QWIjFuJjuE=;
        b=NbjDv72prLBpWwnIRDa/SsuZ8Id87GPO0oOYWFAzNJYNGeohP58SAQmvaujffqmBM+
         qDmqyuUtR0vJsdI9v+6PgIVttwA5v+1WEONJNpsqWpMd0R8g2STWcQjVKK1+QtzFB2F3
         SY1yHh0W2qknzTgWT6TZT+8rEkS8Kkg1Mg9csYbV5iw19+naDd7dEhY5IptPRR307zmH
         FXxt28QmKctXtdbVkJ85NkgUP3oj14tLS8+qc8kgbcyWfwKhxigT5wxizojnnCzpgrsi
         +yHqtRh04fTVjn7RtybRcn6mIAJWtZIX4SI+M1eoyw7f2QpeE1MyCASTj0mVJfke3S2b
         jLYw==
X-Forwarded-Encrypted: i=1; AJvYcCWcYInRAwhGFJyc2ZgV2Kkwnf5qQL4ZfzB8VD05YTI7p2VDH6LIDPKducG4bq5dT7wpX2YvccKMGfpN@lists.linux.dev
X-Gm-Message-State: AOJu0YzJ5hvSU/fRpOu8fJMlpq8zLJLNvmldbd2uC7fwfUc8VJLRxao+
	u8mIpnXNzMCUwsN/m/ZVvX5eHdPp+khBKpDIiBOLD6PISOntLkrhdziTlsfCWloTTEHIJuvo42f
	RtfeuAw==
X-Google-Smtp-Source: AGHT+IGX3APteug86Z/yM6rsjQlQapXW6AnpEVut4Vor4TAnyP5V7CP03xYzW1CnKx74JWZadXlmwf6StGE=
X-Received: from pjbnl2.prod.google.com ([2002:a17:90b:3842:b0:33b:51fe:1a73])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3e43:b0:334:2a38:2a05
 with SMTP id 98e67ed59e1d1-33bcf86b628mr24656863a91.8.1761069072343; Tue, 21
 Oct 2025 10:51:12 -0700 (PDT)
Date: Tue, 21 Oct 2025 10:51:11 -0700
In-Reply-To: <ad9b3b96-324a-4661-b43e-0b31cb7a7b51@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250910144453.1389652-1-dave.hansen@linux.intel.com>
 <aPY_yC45suT8sn8F@google.com> <872c17f3-9ded-46b2-a036-65fc2abaf2e6@intel.com>
 <aPZKVaUT9GZbPHBI@google.com> <033f56f9-fb66-4bf5-b25a-f2f8b964cd4e@intel.com>
 <aPZUY90M0B3Tu3no@google.com> <ad9b3b96-324a-4661-b43e-0b31cb7a7b51@intel.com>
Message-ID: <aPfID-MxqHleKTz0@google.com>
Subject: Re: [PATCH] x86/virt/tdx: Use precalculated TDVPR page physical address
From: Sean Christopherson <seanjc@google.com>
To: Dave Hansen <dave.hansen@intel.com>
Cc: Dave Hansen <dave.hansen@linux.intel.com>, linux-kernel@vger.kernel.org, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, "Kirill A. Shutemov" <kas@kernel.org>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Kai Huang <kai.huang@intel.com>, Isaku Yamahata <isaku.yamahata@intel.com>, 
	Vishal Annapurve <vannapurve@google.com>, Thomas Huth <thuth@redhat.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, linux-coco@lists.linux.dev, kvm@vger.kernel.org, 
	Farrah Chen <farrah.chen@intel.com>
Content-Type: text/plain; charset="us-ascii"

On Mon, Oct 20, 2025, Dave Hansen wrote:
> On 10/20/25 08:25, Sean Christopherson wrote:
> >>> @@ -1583,7 +1578,7 @@ u64 tdh_vp_addcx(struct tdx_vp *vp, struct page *tdcx_page)
> >>>  {
> >>>         struct tdx_module_args args = {
> >>>                 .rcx = page_to_phys(tdcx_page),
> >>> -               .rdx = tdx_tdvpr_pa(vp),
> >>> +               .rdx = vp->tdvpr_pa,
> >>>         };
> >> I'm kinda dense normally and my coffee hasn't kicked in yet. What
> >> clearly does not work there?
> > Relying on struct page to provide type safety.
> > 
> >> Yeah, vp->tdvpr_pa is storing a physical address as a raw u64 and not a
> >> 'struct page'. That's not ideal. But it's also for a pretty good reason.
> > Right, but my point is that regradless of the justification, every exception to
> > passing a struct page diminishes the benefits of using struct page in the first
> > place.
> 
> Yeah, I'm in total agreement with you there.
> 
> But I don't think there's any type scheme that won't have exceptions or
> other downsides.
> 
> u64's are really nice for prototyping because you can just pass those
> suckers around anywhere and the compiler will never say a thing. But we
> know the downsides of too many plain integer types getting passed around.
> 
> Sparse-enforced address spaces are pretty nifty, but they can get messy
> around the edges of the subsystem where the type is used. You end up
> with lots of ugly force casts there to bend the compiler to your will.
> 
> 'struct page *' isn't perfect either. As we saw, you can't get from it
> to a physical address easily in noinstr code. It doesn't work everywhere
> either.
> 
> So I dunno. Sounds like there is no shortage of imperfect ways skin this
> cat. Yay, engineering!
> 
> But, seriously, if you're super confident that a sparse-enforced address

Heh, I dunno about "super confident", but I do think it will be the most robust
overall, and will be helpful for readers by documenting which pages/assets are
effectively opaque handles things that are owned by the TDX-Module.

KVM uses the sparse approach in KVM's TDP MMU implementation to typedef PTE
pointers, which are RCU-protected.

  typedef u64 __rcu *tdp_ptep_t;

There are handful of one open-coded rcu_dereference() calls, but the vast majority
of dereferences get routed through helpers that deal with the gory details.  And
of the open-coded calls, I distinctly remember two being interesting cases where
the __rcu enforcement forced us to slow down and think about exactly the lifetime
of the PTE.  I.e. even the mildly painful "overhead" has been a net positive.

> space is the way to go, it's not *that* hard to go look at it. TDX isn't
> that big. I can go poke at it for a bit.
