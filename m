Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11F2C2EA48F
	for <linux-coco@lists.linux.dev>; Thu, 18 Sep 2025 07:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758181090; cv=none; b=nof3V8JESFsmOqRgD9lLt2KiSwNxPjQbLyT7XvEXzDbD4mbsaYyO4yVYaXh+6wBYNDXohmAFKFjajv1d5bgrizXxqLJdk8PrApikRcZD0bLn8eA/MWIjxfWezW2G9J1VmQWdTXMm9ZdQwLUnrHTNluyaUkllYXf8SBP0zUBAwDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758181090; c=relaxed/simple;
	bh=bgAmLiMhlZe8YpZ/L/rxaACzuljaK9Hn8eaaSBObElc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=rqcfAblPDPTCNxQp1yLYJfRfLsrdotAGyvIi428wCxAAxzncfdVad3F3FWbwlS9LLgw+KLKh1XKt55TXeq9xcnz7YmKkSK1rE7xWCf/0AD/FMestEUz7TiRCSCgzJ3fN/aZlttnVdOWHpJS8CJbYnOq0lBuC0hAn0q+W5bl4EYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pUTNMAWS; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pUTNMAWS"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-268141f759aso7199565ad.2
        for <linux-coco@lists.linux.dev>; Thu, 18 Sep 2025 00:38:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1758181088; x=1758785888; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=QlTsY5GbnDLA8PNX/Abx8RaC8EAugacckjHGVY6QHnc=;
        b=pUTNMAWSEE0fFVxokMsOvA8cW7vBt7TXl7EHNO4cR+CPZIsax8G4kcxvCP+C20IQx2
         Q6HKxT3heudWGq57QVj9rbjzPd1dGkUB+UnPnYD25pwBkILW6+cKyJX56N5XCeOj23Gv
         aw6hpf/BKCBECo7MNPrVynjySxdpLloZUa9XbSqiwdlvN4U5PDy452Qn1qRVfG6EwLSn
         aEbOHH5BRXVENuSG4ZTENjl93ZrFPPsZfYF5VYtoTy7qHM3NemfANV5dcd1La3u2iJD+
         iVATe7XXrrjkz6Oy8FmMhpkSRiSWKKKa6MIli8DB2GpFd6SYsJA/rb0E/SuQPT0Pw6tc
         6K8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758181088; x=1758785888;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QlTsY5GbnDLA8PNX/Abx8RaC8EAugacckjHGVY6QHnc=;
        b=SI4/7qhKo+edVU4emgDc1FNgHZcNE31FuTc12opW5kzsz8lMAfgKJkQKFuhuksll71
         hHNDqRLJ+yiSkfvgqixshaN39f5ruHDO61UsupVTrxK4gwjhsboEs1ZbUusNTLXk83jc
         dp0QCcdOAFCtC2bqH+0NmVKgd2tGknVWY5zyEnhO0rse4ifQKng8ysbxK7FFkj9tsuu4
         ZcehJaxXFaqDHvSaPsDLIeAKfFANZyGRP9DL0cmza2/lJywoESo9Y1sPvK+W7c8NhxWe
         CZhreMXff87NciOHQu45/ET9lh0lgh2mT921KFkXsuNUb0pi1ISiv9u+CClIUU6St74Q
         HLOA==
X-Forwarded-Encrypted: i=1; AJvYcCXrZYmVHw7cr7eSO0Yk11tS7oWEWh8g1IolLWyeoXoFPzrouh3Zi9MHYKFQdaZlG2He430x9alJzWui@lists.linux.dev
X-Gm-Message-State: AOJu0Yx9KRzuWx6/jM5pkAz0mgmrmv0t2QZo9VWKjqwKIgsrjrh2O5C8
	uCZDyaFDYx8adQtEKwpUTWD2+Z+cM6jeV/1G8S8KYC0ko3OUtBy9FVrSLVJK4PWvzOoP4tE4zeO
	QV7LM7HBrzhSpjh9nVTkcGCn8kw==
X-Google-Smtp-Source: AGHT+IFWHyiMZiyuig5xhyHRANmmixX2X7Nu3qdKOzaiOgRWeSBFWgY0P+tpsX/S7el9mJRQJfrg8QP8Wiu7wsmEUw==
X-Received: from plsl15.prod.google.com ([2002:a17:903:244f:b0:267:d4d1:98df])
 (user=ackerleytng job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:144f:b0:269:874c:4e48 with SMTP id d9443c01a7336-269874c541emr20143955ad.47.1758181088219;
 Thu, 18 Sep 2025 00:38:08 -0700 (PDT)
Date: Thu, 18 Sep 2025 07:38:07 +0000
In-Reply-To: <diqzo6r8p90a.fsf@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250613005400.3694904-1-michael.roth@amd.com>
 <20250613005400.3694904-2-michael.roth@amd.com> <diqztt1vf198.fsf@google.com>
 <20250916233335.wv2lf4fiejlw53o2@amd.com> <diqzo6r8p90a.fsf@google.com>
Message-ID: <diqzcy7op5wg.fsf@google.com>
Subject: Re: [PATCH RFC v1 1/5] KVM: guest_memfd: Remove preparation tracking
From: Ackerley Tng <ackerleytng@google.com>
To: Michael Roth <michael.roth@amd.com>
Cc: kvm@vger.kernel.org, linux-coco@lists.linux.dev, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, david@redhat.com, tabba@google.com, 
	vannapurve@google.com, ira.weiny@intel.com, thomas.lendacky@amd.com, 
	pbonzini@redhat.com, seanjc@google.com, vbabka@suse.cz, joro@8bytes.org, 
	pratikrajesh.sampat@amd.com, liam.merwick@oracle.com, yan.y.zhao@intel.com, 
	aik@amd.com
Content-Type: text/plain; charset="UTF-8"

Ackerley Tng <ackerleytng@google.com> writes:

> Michael Roth <michael.roth@amd.com> writes:
>
>> On Mon, Aug 25, 2025 at 04:08:19PM -0700, Ackerley Tng wrote:
>>> Michael Roth <michael.roth@amd.com> writes:
>>> 
>>> 
>>> [...snip...]
>>> 
>>> > @@ -435,13 +430,7 @@ static inline void kvm_gmem_mark_prepared(struct folio *folio)
>>> >  static int kvm_gmem_prepare_folio(struct kvm *kvm, struct kvm_memory_slot *slot,
>>> >  				  gfn_t gfn, struct folio *folio)
>>> >  {
>>> > -	unsigned long nr_pages, i;
>>> >  	pgoff_t index;
>>> > -	int r;
>>> > -
>>> > -	nr_pages = folio_nr_pages(folio);
>>> > -	for (i = 0; i < nr_pages; i++)
>>> > -		clear_highpage(folio_page(folio, i));
>>> >  
>>> >  	/*
>>> >  	 * Preparing huge folios should always be safe, since it should
>>> > @@ -459,11 +448,8 @@ static int kvm_gmem_prepare_folio(struct kvm *kvm, struct kvm_memory_slot *slot,
>>> 
>>> While working on HugeTLB support for guest_memfd, I added a test that
>>> tries to map a non-huge-page-aligned gmem.pgoff to a huge-page aligned
>>> gfn.
>>> 
>>> I understand that config would destroy the performance advantages of
>>> huge pages, but I think the test is necessary since Yan brought up the
>>> use case here [1].
>>> 
>>> The conclusion in that thread, I believe, was to allow binding of
>>> unaligned GFNs to offsets, but disallow large pages in that case. The
>>> next series for guest_memfd HugeTLB support will include a fix similar
>>> to this [2].
>>> 
>>> While testing, I hit this WARN_ON with a non-huge-page-aligned
>>> gmem.pgoff.
>>> 
>>> >  	WARN_ON(!IS_ALIGNED(slot->gmem.pgoff, 1 << folio_order(folio)));
>>> 
>>> Do you all think this WARN_ON can be removed?
>>
>> I think so.. I actually ended up dropping this WARN_ON() for a similar
>> reason:
>>
>
> Thanks for confirming!
>

Dropping this WARN_ON() actually further highlights the importance of
separating preparedness from folio flags (and the folio).

With huge pages being supported in guest_memfd, it's possible for just
part of a folio to be mapped into the stage 2 page tables. One example
of this is if userspace were to request populating just 2M in a 1G
page. If preparedness were recorded in folio flags, then the entire 1G
would be considered prepared even though only 2M of that page was
prepared (updated in RMP tables).

So I do support making the uptodate flag only mean zeroed, and taking
preparedness out of the picture.

With this change, kvm_gmem_prepare_folio() and
__kvm_gmem_prepare_folio() seems to be a misnomer, since conceptually
we're not preparing a folio, we can't assume that we're always preparing
a whole folio once huge pages are in the picture.

What do you all think of taking this even further? Instead of keeping
kvm_gmem_prepare_folio() within guest_memfd, what if we

1. Focus on preparing pfn ranges (retaining kvm_arch_gmem_prepare() is
   good) and not folios
   
2. More clearly and directly associate preparing pfns with mapping
   (rather than with getting a folio to be mapped) into stage 2 page
   tables

What I have in mind for (2) is to update kvm_tdp_mmu_map() to do an
arch-specific call, when fault->is_private, to call
kvm_arch_gmem_prepare() just before mapping the pfns and when the
mapping level is known.

The cleanup counterpart would then be to call kvm_arch_gmem_invalidate()
somewhere in tdp_mmu_zap_leafs().

kvm_arch_gmem_prepare() and kvm_arch_gmem_invalidate() would then drop
out of guest_memfd and be moved back into the core of KVM.

Technically these two functions don't even need to have gmem in the name
since any memory can be prepared in the SNP sense, though for the
foreseeable future gmem is the only memory supported for private memory
in CoCo VMs.

Also, to push this along a little, I feel that this series does a few
things. What do you all think of re-focusing this series (or a part of
this series) as "Separating SNP preparation from guest_memfd" or
"Separating arch-specific preparation from guest_memfd"?

>> 
>> [...snip...]
>> 
