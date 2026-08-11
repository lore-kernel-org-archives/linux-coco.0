Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23A2C3AE187
	for <linux-coco@lists.linux.dev>; Tue, 11 Aug 2026 17:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786469746; cv=pass; b=djvQp7pUHqjaeTsfO1B61jbo1nyfgQYy9VfL6DhUxKa9gBIWAvOP13dGS/sKVcNEj6D6hhVlPAnwU7yjrRW0q2mJMJ0UvU1gxLRdZmqMhvssjoq7I4XkPP41oux0bboOP/qG2BX/M48ie42TjHlAjeat7G2GekBanNErPhYnIQs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786469746; c=relaxed/simple;
	bh=HFEKR1KyXmrTm3F9xUOu47SOoPRZkqoHDZ+hl5bPILM=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LafjD0KUbjI2BF611F0s33MV8oH1Pgs9Eu3uNLR4ltIW23tFiuu0dv8HTOSLqq14hI3XxptHEmDg1b8kGd3MOazAe+R9ZGp/jcH1QWPRZ/mlCl3+NIqBEmrvB54Tqz4h6ubmIJPblq7tu69eDOocgddF2YkJ35uYCA9NBB8BsNM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VJWlYlVf; arc=pass smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VJWlYlVf"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-caf45fc5202so5801a12.1
        for <linux-coco@lists.linux.dev>; Tue, 11 Aug 2026 10:35:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786469744; cv=none;
        d=google.com; s=arc-20260327;
        b=pG6A4i2fSU1QllAkxiULD4YDNzqf9cbywLH1zMsbg9wMaliIK8crQbqjKV+1cGkFvW
         4DJbFDBmYYoeIM4Gc8R1dXETYpSSQBwo6M/9B2b6r95JGGF05yhmYg6GFXYxeY2XhWu7
         KUnWK4eN639wIp15RMkng8MPP0PYY+N2xZWW93C7tvWnxfhEeXTU1jPdIECFQyVhM4VP
         SLxRPUUQ7Q5K2P0iYiL0S/5OjhzGGqzTGZemW4j2Dpa1GsQpEYbOoDQuFZfXSRN7uv+a
         XYRITJXw7Z3P/29MspwmVcJrB8IYWE3kRUWnvKD/OS0QGnDmLZ0dNpIdi7DwdeLzfSD5
         7GlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=gwkanNiJJOt3W9zGrZeGCByYdRnaM6Axwx+xtbIB3o4=;
        fh=5p1tur2ldrLI/7sY+JwlskhlLFWcAZ6QbsUC6xXE7lM=;
        b=eRZSTdVrgrZVrojzKGbWF0g7gv5eSe2+3hF6Mj+fAdmXaP5ZvOR//+Lx/mcv+lAH4j
         TvpYBgqOrn8XrIADN6fhL3ubB96nuBCqDbEdEoIJTCRW9v/GD7AH8HWBQ4hpP/mI8Dx7
         rzS+FQD4r8HQ94PnCt40xsw7a+0kFKE9uplYD8uBkLYqWuCfPnit4u0SHZRrwuwCPRP2
         WBp05y0EER2ep5oBk/xL/QLgWsNDurmYCKI2z/HCjdYWmms/rkgjlGCDGMMcXa81fAxC
         YBP209MYmyksw2TZvVJ8ioEZNZiLQnY1N4x582ci0oRt7XKPztfLNfdHhOr1JEvSofLT
         Kykg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786469744; x=1787074544; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gwkanNiJJOt3W9zGrZeGCByYdRnaM6Axwx+xtbIB3o4=;
        b=VJWlYlVfmu90pacjLb/ladKIOLRXCrgjp27em6TF2257XhqgAMYeO9L7KsSCijY/u4
         aFHoMeNjUsnAkzTowhPhtUDS30EG/1i17K4s4lUQMFD6VjrTWs5U7EzGoolfwEZzJc1B
         SjLJM+2QJtiNNFCVbC9SQ1aBWtAoP2NjBFjchg8NavW+t0yytQ+MSOLIQwNs65CjT6/d
         9a1XnW6Q7sdJW9DtIFUGuHu35z79G4YJyiHSNuchF8S4H0hw0E+5nabglp1RDw++K1Q8
         cCiFAg1K14ExnSZ2VlkkrK7nC4B2KeBVFV6h7GY4FyplOr82ZqTLKXHtV92hhxhAikR4
         etew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786469744; x=1787074544;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gwkanNiJJOt3W9zGrZeGCByYdRnaM6Axwx+xtbIB3o4=;
        b=Reu6q+0TAbaZ4aVVcWhL8/mjHKoCFpeLkqZW9W0oMKfcPz2NUCTlIPasyfWkIdfZ9t
         DNs7coJtpWd29nSVXgV8ly6HT5CzBFeCPoE4BB46GxwTkGRJH9VVEogOGpJdsjmvxl07
         OeDun/8EDVYgt0q215XyHHD/IbvDRvgZNF0LSmZnqFAewcgM4sM19BWSz4sZNTwXT5jZ
         cPvzLM6EgO8C8CuIL1CdNlI4DHaOqz0I/cEo0cTahXH26Ke3yN9oRbOOx3REn2QoDIxX
         OH01qxqVKRW4D5J1C7cxPGrHcl3eo3z/qo19wOJDj2Do83YjSEQ6ddAFu4LzeJ/2pWIX
         p4TQ==
X-Forwarded-Encrypted: i=1; AHgh+RpLQ9HnyWmovPNQ3666v4FPozLaOGorrfTzslzQFmriEZLJkTBCBkhMaFGg8guOCwMBWtDRQxkpUMhE@lists.linux.dev
X-Gm-Message-State: AOJu0Yw/uIHeX7oHVdFPx8vwe61k2rMIS+0sJPmuDPnDt/gQA51zJjbS
	AiZJflAlOqeO5NaJTYnm8+cXnXUIs4NVepH4n/1CQBYSq+11MVZSMaG3EXmsT941B1exjWWAIYC
	yJVDNHomo+8zkjBBaHWWPVfWP1sWUIRukjBYcJAUs
X-Gm-Gg: AR+sD117IM73OxfZNDEKPUrsPYpOR3QvfZ678OZEf/r6/IPsP8neAvGPDCEWfQtrFsB
	oDRpREhd7FQCZZttpHc4Oe3+LJmVUNpD/cUpPR8GeCO66lu46InywIK9X3SzpNP+LWOAQoAAmWt
	9UIe0ua2BkxzLlkvMBnRXPdy/bcK5s2hPh87OSdd279oXgp1USkxbJtRsK0u1ip995fyAj+cNrI
	frihTwVicPjW6hmkhlytMtB/5uVKbi1hhi4ujc93czeuRUS+5WZ+j1OdwU1WG7P0IHcV8LeZkBZ
	gO0F2AZazB13YiRg1TgPHpTut5x+cuG9PTUhFmeC+53FO1YNgHJ4JYE6EK/TXykvy9CmfFAiEYl
	8t70NX749BaljSglyyuhH7LY0PKMdNLmqrNJD4OpWvQn9pQ==
X-Received: by 2002:a05:6a20:9146:b0:3b4:9171:2573 with SMTP id
 adf61e73a8af0-3cc37e9e740mr1534763637.37.1786469743361; Tue, 11 Aug 2026
 10:35:43 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 11 Aug 2026 10:35:42 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 11 Aug 2026 10:35:42 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <anqqKH6kuwpvuwp9@yzhao56-desk.sh.intel.com>
References: <20260807-gmem-inplace-conversion-v10-0-2fc18ee6d3ba@google.com>
 <20260807-gmem-inplace-conversion-v10-11-2fc18ee6d3ba@google.com>
 <anZ4W9o5pTWIEgMY@yzhao56-desk.sh.intel.com> <anj2bPrGqzZgZWMF@yzhao56-desk.sh.intel.com>
 <CAEvNRgFzRj_=GVy8T4P8ehhQjYomYxkngzwtKBF0iEL0Cv6fuQ@mail.gmail.com>
 <anp1I64K0KeyQuyo@yzhao56-desk.sh.intel.com> <CAEvNRgFWcndQKJE_q+ZATFZEMYd=6uRLygozLvg7L77bPX0cEQ@mail.gmail.com>
 <anqqKH6kuwpvuwp9@yzhao56-desk.sh.intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Tue, 11 Aug 2026 10:35:42 -0700
X-Gm-Features: AUfX_mzVH_IxH_llFqF_n5qSatkkY6boTgbwv62Y4hoT6hGdHCS9TGJ6hA5mdxs
Message-ID: <CAEvNRgGWDY_fxbyBM-5sMdYMevMe0HzVP9kbC1cCGLE_dV=_Gw@mail.gmail.com>
Subject: Re: [PATCH v10 11/41] KVM: guest_memfd: Ensure pages are not in use
 before conversion
To: Yan Zhao <yan.y.zhao@intel.com>
Cc: aik@amd.com, andrew.jones@linux.dev, binbin.wu@linux.intel.com, 
	brauner@kernel.org, chao.p.peng@linux.intel.com, david@kernel.org, 
	jmattson@google.com, jthoughton@google.com, michael.roth@amd.com, 
	oupton@kernel.org, pankaj.gupta@amd.com, qperret@google.com, 
	rick.p.edgecombe@intel.com, rientjes@google.com, shivankg@amd.com, 
	steven.price@arm.com, tabba@google.com, willy@infradead.org, 
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

> On Mon, Aug 10, 2026 at 07:17:11PM -0700, Ackerley Tng wrote:
>> Yan Zhao <yan.y.zhao@intel.com> writes:
>>
>> > On Mon, Aug 10, 2026 at 02:06:06PM -0700, Ackerley Tng wrote:
>> >> Yan Zhao <yan.y.zhao@intel.com> writes:
>> >>
>> >> >
>> >> > [...snip...]
>> >> >
>> >> >> > @@ -542,8 +576,21 @@ static int __kvm_gmem_set_attributes(struct inode *inode, pgoff_t start,
>> >> >> >
>> >> >> >  	mas_init(&mas, mt, start);
>> >> >> >  	r = kvm_gmem_mas_preallocate(&mas, attrs, start, nr_pages);
>> >> >> > -	if (r)
>> >> >> > +	if (r) {
>> >> >> > +		*err_index = start;
>> >> >> >  		goto out;
>> >> >> > +	}
>> >> >> > +
>> >> >> > +	if (to_private) {
>> >> >> > +		unmap_mapping_pages(mapping, start, nr_pages, false);
>> >> >> > +
>> >> >> > +		if (!kvm_gmem_is_safe_for_conversion(inode, start, nr_pages,
>> >> >> > +						     err_index)) {
>> >> >> Note: conversion failures could occur if another vCPU is attempting to map a GFN
>> >> >> within this range.
>> >> >>
>> >> >> CPU 0 (setting attributes)          CPU 1 (attempting to map)
>> >> >> --------------------------          --------------------
>> >> >>                                  A: mmu_invalidate_retry_gfn_unsafe
>> >> >>                                     filemap_invalidate_lock_shared
>> >> >>                                     __kvm_gmem_get_pfn ==> folio refcount++
>> >> >>                                     filemap_invalidate_unlock_shared
>> >> >>
>> >> >> filemap_invalidate_lock
>> >> >> filemap_get_folios
>> >> >> check folio_ref_count(folio) ==> Not match !!
>> >> >> filemap_invalidate_unlock
>> >> >>
>> >> >>                                  B: read_lock(&vcpu->kvm->mmu_lock);
>> >> >>                                     is_page_fault_stale
>> >> >>                                     kvm_mmu_finish_page_fault ==>folio recount--
>> >> >> 				    read_unlock(&vcpu->kvm->mmu_lock);
>> >> >>
>> >> >>
>> >>
>> >> Thanks for reporting this!
>> >>
>> >> >> Retrying in kvm_gmem_is_safe_for_conversion() or moving the invocation of
>> >> >> kvm_mmu_invalidate_start() + kvm_mmu_invalidate_range_add() to an earlier
>> >> >> position does not help as long as CPU 1 stays at stage A.
>> >> >>
>> >>
>> >> IIUC CPU 1 isn't blocked by a conversion so stages A and B should
>> >> complete fine, and CPU 0 would already be retrying for other reasons
>> >> anyway, like speculative refcounts from elsewhere in the kernel, so the
>> >> conversion would take longer but it'd work out.
>> >>
>> >> Is that understanding right, that this doesn't completely break
>> >> conversions?
>> > It depends on the timing. The max retry count cannot be expected under unlucky
>> > conditions.
>> >
>> >> >> So, should we avoid this failure?
>> >> >> e.g., by moving filemap_invalidate_unlock_shared() from stage A to after
>> >> >> stage B?
>> >>
>> >> Not really sure about this, how will control go back to guest_memfd
>> >> after the fault finishes for guest_memfd to unlock the filemap?
>> > I don't understand your question. But I find this solution is less ideal than my
>> > below proposal.
>> >
>>
>> When kvm_gmem_get_pfn() is called from kvm_mmu_faultin_pfn_gmem(), KVM
>> MMU takes over from there, there isn't another call when KVM MMU
>> finishes mapping the page into the stage 2 page tables back into
>> guest_memfd.
>>
>> After stage B, how is filemap_invalidate_unlock_shared() going to be
>> called? Do you mean filemap_invalidate_unlock_shared(folio->mapping)?
> Something like this. However, since this would cause the shared filemap
> invalidate lock to be held longer, conversions may have to wait for any on-going
> faults regardless of the GFN range, which I don't quite like.
>
>> I think filemap_invalidate_unlock_shared(folio->mapping) is a little
>> asymmetric...
>>
>> >> > Or what about having KVM always treat gmem page as non-refcounted, and have
>> >> > kvm_gmem_get_pfn() put folio refcount before releasing the filemap invalidate
>> >> > lock?
>> >> > Below patch is applied and tested at the end of this series.
>> >> >
>> >> > From 8c2f29bc15bceb6a8fa103cf2585ec11354fd74e Mon Sep 17 00:00:00 2001
>> >> > From: Yan Zhao <yan.y.zhao@intel.com>
>> >> > Date: Mon, 10 Aug 2026 06:24:52 +0800
>> >> > Subject: [PATCH] KVM: guest_memfd: Return gmem page as non-refcounted
>> >> >
>> >> > Have kvm_gmem_get_pfn() put gmem page refcount before releasing filemap
>> >> > invalidate lock and return the gmem page as non-refcounted. This avoids
>> >> > gmem memory attribute conversion failure caused by temporarily holding gmem
>> >> > page after faulting and before completing mapping.
>> >> >
>> >> > guest_memfd always holds gmem page in filemap cache. TDX does not increment
>> >> > gmem page refcount when having gmem pages mapped in S-EPT. Additionally,
>> >> > as gmem pages are not swappable, setting dirty or accessed bit is not
>> >> > necessary. Therefore, there's no need to treat gmem pages as refcounted
>> >> > pages.
>> >> >
>> >> > Signed-off-by: Yan Zhao <yan.y.zhao@intel.com>
>> >> > ---
>> >> >  virt/kvm/guest_memfd.c | 5 ++---
>> >> >  1 file changed, 2 insertions(+), 3 deletions(-)
>> >> >
>> >> > diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
>> >> > index 2115e73e455a..e357b4ffa777 100644
>> >> > --- a/virt/kvm/guest_memfd.c
>> >> > +++ b/virt/kvm/guest_memfd.c
>> >> > @@ -1332,11 +1332,10 @@ int kvm_gmem_get_pfn(struct kvm *kvm, struct kvm_memory_slot *slot,
>> >> >  #endif
>> >> >
>> >> >  	folio_unlock(folio);
>> >> > +	folio_put(folio);
>> >> >
>> >> >  	if (!r)
>> >> > -		*page = folio_file_page(folio, index);
>> >> > -	else
>> >> > -		folio_put(folio);
>> >> > +		*page = NULL;
>> >> >
>> >> >  out:
>> >> >  	filemap_invalidate_unlock_shared(file_inode(file)->i_mapping);
>> >> > --
>> >> > 2.43.2
>> >>
>> >> Hmm going with the above CPU 0 and 1 illustration, if instead CPU 0
>> >> truncates the folio and the folio ends up being freed, then KVM's MMU
>> >> has a pointer to a page that is already
>> >> freed. kvm_release_faultin_page() is passed the pointer to this page and
>> >> will dereference the page.
>> > Not really. It's just like KVM mapping non-refcounted pages.
>> > kvm_release_faultin_page() does not access the non-refcounted pages.
>> > The invalidate protocol also ensures no mapping of stale pfn.
>> >
>> > As below, if CPU 0 truncates the folio, it needs to hold filemap invalidate lock,
>> > add KVM mmu invalidate range, hold mmu_lock, zap KVM mappings before the
>> > truncation.
>> >
>> >
>> > CPU 0                                      CPU 1
>> > -----                                    --------
>> >                                          Save fault->mmu_seq
>> >
>> >                                      B1. filemap_invalidate_lock_shared
>> >                                          __kvm_gmem_get_pfn
>> >                                          folio_put
>> >                                          filemap_invalidate_unlock_shared
>> >
>> > 				     B2. read_lock
>> >                                          is_page_fault_stale
>> >
>> >                                      B3. kvm_tdp_mmu_map
>> >                                      B4. kvm_mmu_finish_page_fault
>> >                                          read_unlock
>> > A1. filemap_invalidate_lock
>> >     kvm_gmem_invalidate_start
>> >
>> > A2. write_lock
>> >     zap KVM MMU
>> >     write_unlock
>> >     truncate
>> >
>> > A3. kvm_gmem_invalidate_end
>> >     filemap_invalidate_unlock
>> >
>> >
>> > A1 occurs either before or after B1.
>> > 1) If A1 occurs before B1, B1 will find the correct pfn.
>> > 2) If A1 occurs after B1 and before B2,
>> >    a. if A2 is before B2, B2 must find the fault is stale, so it's fine.
>> >    b. if A2 is after B2, A2 must be after B4 as well. So, accessing stale pfn
>> >       in CPU 1 is fine.
>> > 3) If A1 occurs after B2 and before B3,
>> > 4) If A1 occurs after B3 and before B4,
>> > 5) If A1 occurs after B4,
>> >    A2 must be after B4 (for 3-5 conditions).
>> >    So, accessing stale pfn in CPU 1 is fine.
>>
>> It's not about the stale PFN, if there's no refcount on the page
>> returned from B1, then after A3, the page can be freed.
>>
>> Contractually, I think KVM is allowed to reference the page?
>> kvm_release_page_clean() calls kvm_set_page_accessed() on the page
> In my patch, "*page = NULL;" is returned in kvm_gmem_get_pfn(). So,
> fault->refcounted_page is NULL. With it, kvm_release_faultin_page() does
> not access the faultin PFN or the page.
> So, no worry about UAF.
>

Oh sorry, I missed that. I did see *page = NULL but I didn't connect the
dots.

Wait but in the above trace, if CPU 1 got the page correctly, wouldnt it
take the !r branch where page is not set to NULL? It's only later that
CPU 0 truncates the page, but by that time KVM MMU already holds a
non-NULL page pointer?

Unless on both branches guest_memfd just doesn't provide the page to KVM
MMU?

>> (UAF?). Not sure which other KVM architectures reference the struct page
>> itself. Are we going to teach the rest of KVM to not reference and not
>> do kvm_release_page_*?
> It's just like how KVM maps non-refcounted pages.
> And guest_memfd actually asks consumers (like TDX) not to take page refcount.
> __kvm_gmem_populate() also puts the folio refcount before invoking
> filemap_invalidate_unlock().
>

I guess long term this is what guest_memfd would like, that KVM should
just be getting PFNs from guest_memfd.

>> Would like to see what Sean thinks of this. Either way, is it okay to
>> follow up after conversions lands?
> Let's see what Sean thinks of this :)
> I raised this because the issue was encountered by one TDX's stress selftest.

Which stress selftest is this? I can try running this on my side too.

> I have no strong opinion on whether it should be fixed after this series lands.
> But the fix I proposed is quite small :)

Small code change, big implications! Might be nice to have this for the
future where guest_memfd no longer hands out pages.
