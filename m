Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1E5044160B
	for <linux-coco@lists.linux.dev>; Mon, 10 Aug 2026 21:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786398073; cv=pass; b=lsOV1vQ1H3bCEMkCdHClqZGCqflibfBoUAKPo/dCM0KZooDPkqbf5i9/ULwC4ftvtLdWPki7eoS+fXxvwQ5TQ6/hhzVEjO9GYrtLTEeVyej0RMF404BksHKj1ffJaGG1WigBaSORXgI1ZFHYsOlZlihrYbpsrBQP7QX7kpW2PS0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786398073; c=relaxed/simple;
	bh=jt7XEvC/fGsYaH886r+jXkuI8QPm4SfTg4myb0QbgN4=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V9DK+E7fB9BlF2akv7Y/Z4nkvFiogUMRPnWpGCdUhyoO8kqvUYaoqTipenRZpvYn35F+wBdRiBguaA5/hyPu5zyojG3IEat7Y1Nhfc5xLRSkbvAFzVb6jjdhehztQXVe87vx4N/MXBCJzJV+I2/1J7e+FD6Dmi7KWfXhsKE3J1k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=EcnrOebE; arc=pass smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EcnrOebE"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cbe3fed2f58so1860269a12.3
        for <linux-coco@lists.linux.dev>; Mon, 10 Aug 2026 14:41:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786398071; cv=none;
        d=google.com; s=arc-20260327;
        b=IbonPUlK0SnJOSuMob5KPQSudRzTAgSLYpAv+zyenoG9NaV0t4jXsU/Pr49o2Rev0z
         U/NhrV2oipW9iLg4hIlr+LUfvbRoqdWmFjv1xQDIW14ou5bY7VoiV/rOFRicdyfUTKgc
         m7ukCZmQT/Yzz4Nb45Oy/doiJtjS5qaGNdemeFy7yoMpUXmtAje/dh3jEsPEPVqqfwc6
         hvNxgRjy9RLPSYaN987NBh9VMB6oUzU1+8M1mVPdWbl7zvxdNe0b/mCgnLpKAwP8qgzn
         Fj5g5hMnQQy+QFMDG8F8PyUnajcyuS9S1GpBzwU8d9bd/wneTHZAyukyazTXUjc9eRSx
         VGqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=8crpjggh9sIrGYI26ZMJ/PrD9iP41/J2cmh4fS1aC8Y=;
        fh=nVKtOpEYtZBywrdBrEQ4yotHAUE/a113D0Z46Q0+fGc=;
        b=Gosg0F9nMHi5uUj7HfS3OQooca3PWmyVekLke5n93X8uVY/GcxsMRi4YtHwlDgo8M1
         3SxtQJU1VdkmMRRqQ7drdoLdQIAiI8NJxvwC8IgpfDpNsVTUnuy/ewEyu5Jdhra0gS/L
         ZZB3dkubwI85rXpBEjBx7SujInUgXt4GBnlHXYHFp7LIn0teYxynbqErmFo8EvbVvv9o
         CnWtIc052i3hhZI8Kfu7WLcC0Vd1kw0YUDLOOjdL3TXoC7VSFJiP9jdmXthaeDdIPuKJ
         OIqPj55nKT0cQhsBT+6OwMK+3GGUKcySNU3UuWJJmQgpY6nf5N+Jni6/CV3+6IXw5W1/
         3iag==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786398071; x=1787002871; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8crpjggh9sIrGYI26ZMJ/PrD9iP41/J2cmh4fS1aC8Y=;
        b=EcnrOebEhWlP/DXA8r4hHqVsaPVGL8kSUh1/yDR8sfvmBiJMdiyXKgd82f2PcCa/MI
         QQcaEXvkgQclTi+xpiO1zaLviSo73KMhTH/qRI2KsSZwgl/vYWvvFrDbIQS5HTbcL8aV
         WwgI2MTuvXrVKZffg3sMZHF9kXhEW/HLSBsJWh5NpuC7hV92nRyVu2RTIY99Y8IGRuj2
         IeB5frVPylRyAVpQtcoySzxLIMM/8wXWCBawHFJWQvvZzS7JnFAkMNQpa5mjJbBxQlNZ
         1WTRNSZGdsyYreQ6AzYGJHmTmUv8h4cce7q6AIkW4xF8HtSglFjNkrWxVvVKpuj8cbLy
         5+QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786398071; x=1787002871;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8crpjggh9sIrGYI26ZMJ/PrD9iP41/J2cmh4fS1aC8Y=;
        b=nNbe7h3rGRLk8DilS6HDLe0UIyKSpNNYKT14ywBWQMCqDgbqxXNvNKhzcBtksTUPV7
         knWfxSYS+ezwf0WoeE0SI+NeT/bgWibuRardSa75WBUF8XLARRQTvINeP98qY9rLo+v3
         klnhHrjPkG02YqdGvPKTLE9cGkg8UDhBDEjgCcSSdaAY4sFlBa2dqF95PrTM2+uRnQUa
         rnARN4r3VkxrOpw6iqRC7ExxNJ9LkhAfUdtVh7llXolvPJMW4oaipv5rAMtVcpMH/Hrs
         DtOiM8I94q5gvkLccewHYNiG6NMFM6hkAtKZmePthLeDRZaehGY2QS+ec58crPmfQpzh
         Ec9g==
X-Forwarded-Encrypted: i=1; AHgh+Rp+svrBwbTOcZ9IV2dhqSqYXyZTsdyJia3bDX0ow2LLwSVE+OPYtWdKAcOCKeRkHqtzQ565Mb7zUhaO@lists.linux.dev
X-Gm-Message-State: AOJu0YxSpqXnm2ejgSjf51HvH4V8Odst+/cksHfqhDvZWBPD1hEWGqBZ
	Zqqb7ymdwWsP8nQUVy1nnHNOT7yUea4DAm7UH0D3M3zsRgPM6XCUwhy/2olXvF1P+NOOUQfDZBc
	YR3W9ZzjmAy72gGFIXLjQCfw5E/ixhBT3CUeGICr7
X-Gm-Gg: AR+sD12PIou0+a4mOsc3IYWdjdJn0PQSUuL73YNhCTYS3MYr1Rvxf+U9IiMjeQNE3eB
	Ucv0ApdzsEsBvt6cUZv3ZiK/tBoFn+vSIBfk2XY7mFSMTJKXzjDObzyYR2tJe+ES3EBqiBnbhy1
	t/OJgQBLiir137oAL4lgRJUZXBGWPwNZ936yzzSuG/8Ur6t0dqGky+qIslb7Mh1AvF4qkHCDgLC
	mFJYVjY+ygZWtsqGxjrlEf9N6pVnztWb26VV4rpRvEYfqjp95McmsAtx96/wjmLmGtwCzFazHMh
	XFrOmh4H7OI4rmVp8EHt6nT6zxeAhH9vNrjvWn0jMXxPkNHqzR+8CAnMtE9mlqbl8hHm+DHkQhY
	8/qixRTWIPXlC4ScreFty1BbmpRwEfo6pLNo=
X-Received: by 2002:a05:6a21:6e8e:b0:3bf:7c02:c46f with SMTP id
 adf61e73a8af0-3cc1a1be7a1mr5874285637.14.1786398070269; Mon, 10 Aug 2026
 14:41:10 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 10 Aug 2026 14:41:08 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 10 Aug 2026 14:41:08 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <eb1b5763-37bc-4cb3-890c-1e619e5a8ae4@kernel.org>
References: <20260807-gmem-inplace-conversion-v10-0-2fc18ee6d3ba@google.com>
 <20260807-gmem-inplace-conversion-v10-11-2fc18ee6d3ba@google.com> <eb1b5763-37bc-4cb3-890c-1e619e5a8ae4@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Mon, 10 Aug 2026 14:41:08 -0700
X-Gm-Features: AUfX_mzgTn4rWAG2ncU9fSNARUBhUErwbxwxxfyCmQfQUmSlzmOMXp1B7HqwTck
Message-ID: <CAEvNRgHyRdt7rp=5e5FMbTT=fXNfB=np7VWd_GdmJcPOQgps4g@mail.gmail.com>
Subject: Re: [PATCH v10 11/41] KVM: guest_memfd: Ensure pages are not in use
 before conversion
To: "David Hildenbrand (Arm)" <david@kernel.org>, aik@amd.com, andrew.jones@linux.dev, 
	binbin.wu@linux.intel.com, brauner@kernel.org, chao.p.peng@linux.intel.com, 
	jmattson@google.com, jthoughton@google.com, michael.roth@amd.com, 
	oupton@kernel.org, pankaj.gupta@amd.com, qperret@google.com, 
	rick.p.edgecombe@intel.com, rientjes@google.com, shivankg@amd.com, 
	steven.price@arm.com, tabba@google.com, willy@infradead.org, 
	wyihan@google.com, yan.y.zhao@intel.com, forkloop@google.com, 
	pratyush@kernel.org, suzuki.poulose@arm.com, aneesh.kumar@kernel.org, 
	liam@infradead.org, Paolo Bonzini <pbonzini@redhat.com>, 
	Sean Christopherson <seanjc@google.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
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
	Vlastimil Babka <vbabka@kernel.org>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

"David Hildenbrand (Arm)" <david@kernel.org> writes:

> On 8/7/26 23:52, Ackerley Tng via B4 Relay wrote:
>> From: Ackerley Tng <ackerleytng@google.com>
>>
>> When converting memory to private in guest_memfd, it is necessary to ensure
>> that the pages are not currently being accessed by any other part of the
>> kernel or userspace to avoid any current user writing to guest private
>> memory.
>>
>> guest_memfd checks for unexpected refcounts to determine whether a page is
>> still in use. The only expected refcounts after unmapping the range
>> requested for conversion are those that are held by guest_memfd itself.
>>
>> Update the kvm_memory_attributes2 structure to include an error_offset
>> field. This allows KVM to report the exact offset where a conversion
>> failed to userspace. If the safety check fails, return -EAGAIN and copy
>> the error_offset back to userspace so that it can potentially retry the
>> operation or handle the failure gracefully.
>>
>> Update documentation to document the error_offset field and the possible
>> -EAGAIN error.
>>
>> Suggested-by: David Hildenbrand <david@kernel.org>
>> Co-developed-by: Vishal Annapurve <vannapurve@google.com>
>> Signed-off-by: Vishal Annapurve <vannapurve@google.com>
>> Reviewed-by: Fuad Tabba <tabba@google.com>
>> Tested-by: Shivank Garg <shivankg@amd.com>
>> Signed-off-by: Ackerley Tng <ackerleytng@google.com>
>> ---
>
> [...]
>
>>  #define KVM_MEMORY_ATTRIBUTE_PRIVATE           (1ULL << 3)
>> diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
>> index 3783e63476569..13c3989136f67 100644
>> --- a/virt/kvm/guest_memfd.c
>> +++ b/virt/kvm/guest_memfd.c
>> @@ -524,8 +524,42 @@ static int kvm_gmem_mas_preallocate(struct ma_state *mas, u64 attributes,
>>  	return mas_preallocate(mas, xa_mk_value(attributes), GFP_KERNEL);
>>  }
>>
>> +static bool kvm_gmem_is_safe_for_conversion(struct inode *inode, pgoff_t start,
>> +					    size_t nr_pages, pgoff_t *err_index)
>
> I would focus on the "to_private" aspect or abstract it to
> "kvm_gmem_mem_has_unexpected_refs" or sth like that.
>

Do you mean something like kvm_gmem_is_safe_for_to_private_conversion,
as in that you want to emphasise that "safe" here refers to a to_private
and not a to_shared conversion?

Perhaps a little ahead of its time, but later with restructuring for
huge pages, we also need no additional refcounts other than gmem's own
so that restructuring is safe, hence this function name was meant to
extend there as well.

In this case "unexpected" (especially since the next patch adds checks
for maybe dma pinned and unmapping), begs the question "unexpected in
what way"?

>> +{
>> +	struct address_space *mapping = inode->i_mapping;
>> +	const int filemap_get_folios_refcount = 1;
>> +	pgoff_t last = start + nr_pages - 1;
>> +	struct folio_batch fbatch;
>> +	bool safe = true;
>> +	pgoff_t next;
>> +	int i;
>> +
>> +	folio_batch_init(&fbatch);
>> +
>> +	next = start;
>> +	while (safe && filemap_get_folios(mapping, &next, last, &fbatch)) {
>> +		for (i = 0; i < folio_batch_count(&fbatch); ++i) {
>> +			struct folio *folio = fbatch.folios[i];
>> +
>> +			if (folio_ref_count(folio) !=
>> +			    folio_nr_pages(folio) + filemap_get_folios_refcount) {
>
> I'd rather add a comment than have this filemap_get_folios_refcount.
>
> /*
>  * We expect one reference per folio-page in the pagecache and one
>  * reference from filemap_get_folios().
>  */
> if (folio_ref_count(folio) != folio_nr_pages(folio) + 1)
>

This comment explains what's "unexpected". I can do this and switch it
to kvm_gmem_mem_has_unexpected_refs() unless people have other
suggestions.

I wish there was a folio_pagecache_refs(folio) that
folio_expected_ref_count() can share with this, and also
folio_swapcache_refs(), to solidify the definition of refcounts taken by
the pagecache.

>> +				safe = false;
>> +				*err_index = max(start, folio->index);
>> +				break;
>> +			}
>> +		}
>> +
>> +		folio_batch_release(&fbatch);
>> +		cond_resched();
>> +	}
>> +
>> +	return safe;
>> +}
>> +
>>  static int __kvm_gmem_set_attributes(struct inode *inode, pgoff_t start,
>> -				     size_t nr_pages, uint64_t attrs)
>> +				     size_t nr_pages, uint64_t attrs,
>> +				     pgoff_t *err_index)
>>  {
>>  	bool to_private = attrs & KVM_MEMORY_ATTRIBUTE_PRIVATE;
>>  	struct address_space *mapping = inode->i_mapping;
>> @@ -542,8 +576,21 @@ static int __kvm_gmem_set_attributes(struct inode *inode, pgoff_t start,
>>
>>  	mas_init(&mas, mt, start);
>>  	r = kvm_gmem_mas_preallocate(&mas, attrs, start, nr_pages);
>> -	if (r)
>> +	if (r) {
>> +		*err_index = start;
>>  		goto out;
>> +	}
>> +
>> +	if (to_private) {
>
> I'd add a comment here for the "why are we unmapping".
>

Does this sound right:

Unmap here to ensure that userspace page tables have no mappings, which
also ensures refcounts from those mappings are dropped.

> --
> Cheers,
>
> David
