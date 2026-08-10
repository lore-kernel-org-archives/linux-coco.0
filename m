Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B96F3AE706
	for <linux-coco@lists.linux.dev>; Mon, 10 Aug 2026 21:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786395971; cv=pass; b=hckuZKb0VW3dv0NYSXq89sdv/wZ0w674hZSa7aLFlmdE9NBJs07tE8/pHbQH/jPvhl6phvYnF4j7Z5My1tTZYRrINaE8b2KBCYaKBSo6E7uWfw6sRvfgUIw6tqeNNaNW+2VJLWAb4zjxJe6pVgSqVMvH/zTBek6stMpKYgApvuM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786395971; c=relaxed/simple;
	bh=gI56oLo0KNbRow/rXskAuQ15iNl8L1CwTyWKdxDJ9vc=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Content-Type; b=KOk3NfJ4xSDs9cPSVqRgUuqMHMlXq+/SsXnOx2WCrX6Cyq6nq24fD4liguzi+fssOvQR2QxanF1KFwW/Fuih2Y3gM9tLEcuEbWe3MYPByn1A4+5GtlcOIs58Njl9vcIyxOsHcpsahRy2TTRcM0bInOWHJ1nMm/hAQzC7j1VjPXk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=IhhH6RPK; arc=pass smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="IhhH6RPK"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-38ec1402b05so1780490a91.2
        for <linux-coco@lists.linux.dev>; Mon, 10 Aug 2026 14:06:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786395969; cv=none;
        d=google.com; s=arc-20260327;
        b=gWwSZ815wxTdv77a2rCivSVtLpT3NensDj5llBC4Q3Fuqz8V0ALN8echuCTlrj0Q8q
         athVqmbejZ+K92dsAkRZT+2gu+Zd7kp3HmOb/CKQCHyVd/Kz2UV7vajTvpMteHP/Ewn5
         11WPmTl9p9CNEbZnbFLAqhiMcAe21yrV+bLjGlPSDpo3UYe6bCNvVFZ8xWDzDDkbbKPn
         APaX6LY5q8mZYbDkIVP9zxZlWJeafy5c43GIthKfbB7b0aNuRRDpEuEWwuIADsuoDdvi
         Kn/rZnyhhF7GIBBp52Y2RfFv9KjAaD91hnkyEWCfruWqnnWvuyNpn7F6RogDfuW5NQCz
         Sakw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:mime-version:references:in-reply-to:from
         :dkim-signature;
        bh=jBbGpsBOXqFYnTikH0FoZ8DdjoKWQr2k7+SRpWv9uL4=;
        fh=ta3n7r4BghQjlKaQQrk8Ju+HFWQ4YrkhlmK5n/wcrH8=;
        b=P9TqyE3dronM9GtL4WRxFE3p2bACxhwC8vd/8VEu1EqwmJ+/n/QvwDUWQVtNE4A1gE
         mdEbQpqE68qE2nxienDm08WjgCx6oMvMYCMIysEXDneJe4QI/1Mvu4EuuFbdWoXXQSml
         2+wveYsLcndiZbnzri6ZpvKq9falRtYDEz7t3EVZUDM8Qb2+F6AtrTyrhrEI9PTrft4e
         BJvOaqVmgJWEPzJzsxdt558+8TAQtlThVIz5yNORFQ2CXXELiZM5HyP5vLhk8dsAY8mZ
         rTk1PnZxelP1HJeMzEqzwj54gUzZX4v2P6/PA7CugEkABwCAxP5n6NaIlKsA0gL/IAgj
         b6Jg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786395969; x=1787000769; darn=lists.linux.dev;
        h=content-type:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jBbGpsBOXqFYnTikH0FoZ8DdjoKWQr2k7+SRpWv9uL4=;
        b=IhhH6RPKbux0EqMX3v1lqMpcc0fOSCa8Yn7fLImEcYGGjzcwlO5PcpyWUHBpY/SjVS
         RYKS7haENgpN18g8lBDG1JHTAnXfZu+zaMGJW6xQRIL+RMPaxPAaDbYtdW/2VyhvpsK2
         6XtW6G0bdrmYJERfgLz/Fx5FizSWc4cf9ebs+NOrM3zn1jEzgUfHsRnv63eLSxWU3R1g
         zAZxsI4nfp6V2bKDfBnBsuSSR8dw6MDwM9J31qV7/pL60LEMwUVnSUDsytc3mZg4lSvW
         QIWr/FS35TP2lJEu3y8TE3CdtyCW6Gkpo6uDbfwUv5YcE1Ka5LMubceTTIXLmNTCDkD4
         oLaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786395969; x=1787000769;
        h=content-type:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jBbGpsBOXqFYnTikH0FoZ8DdjoKWQr2k7+SRpWv9uL4=;
        b=hR0YbpzUyJGFlvq7RsRgh7ULh8PT4qsR0G6xdXkzIripnANWGB8S3GIetNKY1k8gt1
         OONq5t47dKU0BZ6GAyQy/S8hPVtbhH8G5IlCiMHtYMXo3HSTRuTW7CFIcXRLtEq3scg6
         6wXTq92Rf3bMOLT2Wbi6zlxpQgknpX2XnslwNfqc70LkoQkj7McsPqjFaL4+NBFMhChM
         CvF014sMFJMRdupEReLoQFl1G9+f/Gj3UPdZg3Zl5ihKWudkYXyg4AFq+vYG+cOJLk49
         xURJjLIZEv0WXOXw7ZQAogiPKvw6po/Up1Jo4KB32CwSFLjUSR4lHA7iaf177EUQsz6G
         +xfA==
X-Forwarded-Encrypted: i=1; AHgh+RrFGuqKJEaehQslxQLc+XLGuG8YK0xveAPDsv9EUb5egjRQ6/Cky0EppaBX8bxb5bbdxXWfYjsocGxk@lists.linux.dev
X-Gm-Message-State: AOJu0YwJRbUaIvHy9QzqlxR9I4pqjPXVHiNNvDOAtL/w3+VzTRLT0D0d
	IV5D4wTBcms6C++7l/qkJitQxRDa2tMV50j4opuRr/eTybHZyiWA8t4VcpgJtLtuuZF+UHkgak9
	pNwAuXWsX7wQjX+GmjmZViigTET32xutStfchwOV8
X-Gm-Gg: AR+sD12tcuxgS+Hjv7eJfLgUvyHi/UXNuNoBWNu+zaTzEomNYA9CX7qHnTNNkYoF67Q
	dbVjSqlKy9bYv6gdrDsEgVxuZCb3qj/3+kN5pfDGMAbEpGm4fS0FfYVW+/kHQHxUQxq4aIZMby0
	UhoYofChM5Rt3P0WIj2igXuP3sawa+APsBplSmqWl2V1t4icfIYiZdih9BuGEGmRU9O55BAXTCd
	wt1wHPpXiMXhb472rr3bGM9njjenAOzdYqyokOoFj3PDcXuTXWX1f767juZLH9XEEDt0/iVtm4Z
	ldpDZC4Dk47nEXhZh+45WCLZw8Qid9QswMuEpZzhY0kmz7jXU/rT0uqwvR+/knNg4/O9/ls1gIY
	vcAFd/M/nNVd+IPa2ksfRCEi2yOkcPqUuseI=
X-Received: by 2002:a17:90b:3847:b0:383:f52b:d616 with SMTP id
 98e67ed59e1d1-3909d89bd69mr24868036a91.10.1786395967805; Mon, 10 Aug 2026
 14:06:07 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 10 Aug 2026 14:06:06 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 10 Aug 2026 14:06:06 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <anj2bPrGqzZgZWMF@yzhao56-desk.sh.intel.com>
References: <20260807-gmem-inplace-conversion-v10-0-2fc18ee6d3ba@google.com>
 <20260807-gmem-inplace-conversion-v10-11-2fc18ee6d3ba@google.com>
 <anZ4W9o5pTWIEgMY@yzhao56-desk.sh.intel.com> <anj2bPrGqzZgZWMF@yzhao56-desk.sh.intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Mon, 10 Aug 2026 14:06:06 -0700
X-Gm-Features: AUfX_myPYbMVlta00ya1-5ZhE7lDWW0LOnyJR-gHZaPeDATx5xIvNNK-iJcLcsY
Message-ID: <CAEvNRgFzRj_=GVy8T4P8ehhQjYomYxkngzwtKBF0iEL0Cv6fuQ@mail.gmail.com>
Subject: Re: [PATCH v10 11/41] KVM: guest_memfd: Ensure pages are not in use
 before conversion
To: Yan Zhao <yan.y.zhao@intel.com>, aik@amd.com, andrew.jones@linux.dev, 
	binbin.wu@linux.intel.com, brauner@kernel.org, chao.p.peng@linux.intel.com, 
	david@kernel.org, jmattson@google.com, jthoughton@google.com, 
	michael.roth@amd.com, oupton@kernel.org, pankaj.gupta@amd.com, 
	qperret@google.com, rick.p.edgecombe@intel.com, rientjes@google.com, 
	shivankg@amd.com, steven.price@arm.com, tabba@google.com, willy@infradead.org, 
	wyihan@google.com, forkloop@google.com, pratyush@kernel.org, 
	suzuki.poulose@arm.com, aneesh.kumar@kernel.org, liam@infradead.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Shuah Khan <shuah@kernel.org>, Vishal Annapurve <vannapurve@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>, 
	Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Nhat Pham <nphamcs@gmail.com>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Youngjun Park <youngjun.park@lge.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Kiryl Shutsemau <kas@kernel.org>, Baoquan He <baoquan.he@linux.dev>, Jason Gunthorpe <jgg@ziepe.ca>, 
	John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, tarunsahu@google.com, 
	Vlastimil Babka <vbabka@kernel.org>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Yan Zhao <yan.y.zhao@intel.com> writes:

>
> [...snip...]
>
>> > @@ -542,8 +576,21 @@ static int __kvm_gmem_set_attributes(struct inode *inode, pgoff_t start,
>> >
>> >  	mas_init(&mas, mt, start);
>> >  	r = kvm_gmem_mas_preallocate(&mas, attrs, start, nr_pages);
>> > -	if (r)
>> > +	if (r) {
>> > +		*err_index = start;
>> >  		goto out;
>> > +	}
>> > +
>> > +	if (to_private) {
>> > +		unmap_mapping_pages(mapping, start, nr_pages, false);
>> > +
>> > +		if (!kvm_gmem_is_safe_for_conversion(inode, start, nr_pages,
>> > +						     err_index)) {
>> Note: conversion failures could occur if another vCPU is attempting to map a GFN
>> within this range.
>>
>> CPU 0 (setting attributes)          CPU 1 (attempting to map)
>> --------------------------          --------------------
>>                                  A: mmu_invalidate_retry_gfn_unsafe
>>                                     filemap_invalidate_lock_shared
>>                                     __kvm_gmem_get_pfn ==> folio refcount++
>>                                     filemap_invalidate_unlock_shared
>>
>> filemap_invalidate_lock
>> filemap_get_folios
>> check folio_ref_count(folio) ==> Not match !!
>> filemap_invalidate_unlock
>>
>>                                  B: read_lock(&vcpu->kvm->mmu_lock);
>>                                     is_page_fault_stale
>>                                     kvm_mmu_finish_page_fault ==>folio recount--
>> 				    read_unlock(&vcpu->kvm->mmu_lock);
>>
>>

Thanks for reporting this!

>> Retrying in kvm_gmem_is_safe_for_conversion() or moving the invocation of
>> kvm_mmu_invalidate_start() + kvm_mmu_invalidate_range_add() to an earlier
>> position does not help as long as CPU 1 stays at stage A.
>>

IIUC CPU 1 isn't blocked by a conversion so stages A and B should
complete fine, and CPU 0 would already be retrying for other reasons
anyway, like speculative refcounts from elsewhere in the kernel, so the
conversion would take longer but it'd work out.

Is that understanding right, that this doesn't completely break
conversions?

>> So, should we avoid this failure?
>> e.g., by moving filemap_invalidate_unlock_shared() from stage A to after
>> stage B?

Not really sure about this, how will control go back to guest_memfd
after the fault finishes for guest_memfd to unlock the filemap?

>
> Or what about having KVM always treat gmem page as non-refcounted, and have
> kvm_gmem_get_pfn() put folio refcount before releasing the filemap invalidate
> lock?
> Below patch is applied and tested at the end of this series.
>
> From 8c2f29bc15bceb6a8fa103cf2585ec11354fd74e Mon Sep 17 00:00:00 2001
> From: Yan Zhao <yan.y.zhao@intel.com>
> Date: Mon, 10 Aug 2026 06:24:52 +0800
> Subject: [PATCH] KVM: guest_memfd: Return gmem page as non-refcounted
>
> Have kvm_gmem_get_pfn() put gmem page refcount before releasing filemap
> invalidate lock and return the gmem page as non-refcounted. This avoids
> gmem memory attribute conversion failure caused by temporarily holding gmem
> page after faulting and before completing mapping.
>
> guest_memfd always holds gmem page in filemap cache. TDX does not increment
> gmem page refcount when having gmem pages mapped in S-EPT. Additionally,
> as gmem pages are not swappable, setting dirty or accessed bit is not
> necessary. Therefore, there's no need to treat gmem pages as refcounted
> pages.
>
> Signed-off-by: Yan Zhao <yan.y.zhao@intel.com>
> ---
>  virt/kvm/guest_memfd.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
> index 2115e73e455a..e357b4ffa777 100644
> --- a/virt/kvm/guest_memfd.c
> +++ b/virt/kvm/guest_memfd.c
> @@ -1332,11 +1332,10 @@ int kvm_gmem_get_pfn(struct kvm *kvm, struct kvm_memory_slot *slot,
>  #endif
>
>  	folio_unlock(folio);
> +	folio_put(folio);
>
>  	if (!r)
> -		*page = folio_file_page(folio, index);
> -	else
> -		folio_put(folio);
> +		*page = NULL;
>
>  out:
>  	filemap_invalidate_unlock_shared(file_inode(file)->i_mapping);
> --
> 2.43.2

Hmm going with the above CPU 0 and 1 illustration, if instead CPU 0
truncates the folio and the folio ends up being freed, then KVM's MMU
has a pointer to a page that is already
freed. kvm_release_faultin_page() is passed the pointer to this page and
will dereference the page.
