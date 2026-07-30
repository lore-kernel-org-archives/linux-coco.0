Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D880C3AB26A
	for <linux-coco@lists.linux.dev>; Thu, 30 Jul 2026 22:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785450036; cv=pass; b=D1l+8qgBX1Kni5wAd3MnCVBYZO9yom8LK4C6lIgLthHue5h+06BH3A3lKylZU1wDA15vVWbUzh7ui7EatSXZQbH7ymvQ9Ro3pZK8lTfD6749Puih5FajN1AGEtjgPuKh3iLjL93rh8hTqARCYl3ADWXdZV6B5DMXyc5xjqnH8PQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785450036; c=relaxed/simple;
	bh=M6XA29EFp31CUqlzBnb1hBdVXpILX/0ncZmHh8uL1BA=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bvZ1fmi0XXt0EE0SwVTwOdATNhtONWqNJMxr+hfO1w6721ysqJUb70dqbvWTTKEZnRWXReLi7iWf5PEiK13POCgtnvPh9wWAfAzffitQ6hke7LiTHVUIaLDXUukgR7xDE3pFyJEg2P+V1hhOXAhTUg39f2fUohscaZXpjamTKgU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=i1KaA1f8; arc=pass smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="i1KaA1f8"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-38a0c7e841fso469392a91.2
        for <linux-coco@lists.linux.dev>; Thu, 30 Jul 2026 15:20:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785450031; cv=none;
        d=google.com; s=arc-20260327;
        b=gcPHmWRy7YnfNO/PELsjHe1EqnAmegN1rfgOCg38NPQ3SlCLVeVAE2MbOnt/3KsPVQ
         tALc6fv/JNCdhhlF7HCxwoOb3HjYxH0JciaWwcPESmAtQQxOHmChRAZ4GIcb/egDpybL
         00NskT2FJjRWa+f6MDoJLwsbk/TS4/9wMEJACKTTlIa+nw1/DbWZwX5vuWpvFLJ4fw+f
         fAWsiF/GCTwYGJvpXSmRyOVlBbyOosiYe4aQEyumxpnjc710hWjY+EpD/1iijrTvaU0o
         5D6+5Wz4M/inniNwX5eJjnqAyBmD9TKip4v5fk54a9z5pUh0EstgBlZbnVY4NipRieKz
         mhqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=lof6e1ot4kuBZAi+0NXUHy3Yo358hLoUkT/iaCauSXA=;
        fh=HWLRCB4JrIzuY7J4IVeLsEjMLsrN9AdrwhDkb+b1aSY=;
        b=TdGt5YA6l5gRLzK/9MmQDPaJPvmL6JKDh+BE+bLLbT2B+MrAVmnRY4e5OluAhMGuxz
         VzDDQ6eXbl+DsWz8/Qnyk+HAiF8Q+EgGcK+aXT3mFUPWLWEiB9c8CtL+AcFRlxwF7G8r
         Md27x89Mhjdx0/9zr5BWRSVgl6sz/Sct/4EgQoYwZm0rT4ndt87NFx9aDoEp3G6b02H/
         R2TgNmR0UhDS1D/ggf7lU6BR8twB0zLtSrBjADUHDIsZYXiHgBwVKO7n7wWuVHjaGFp5
         OidOD+zfh2C9XS73bUTfRidY8GbbXwuliukMY+wMqLstAZdmApShZ+rsAQzsf8lUDvtM
         tfvw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785450031; x=1786054831; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lof6e1ot4kuBZAi+0NXUHy3Yo358hLoUkT/iaCauSXA=;
        b=i1KaA1f8ODq7kGO0MqhIuKmQ02jT7n4dAkW6sf9j/6R3u8ac3fqFMBhZV/ZzAX+jfW
         X90PzTcdrsz80Q0YZg2zDIIYBRct3yAIAzD4PQxg/YkhVgntePIG3KJzDroUJOqlF1rl
         i7/pcs7oprl/lKlty46rR9BGQARFPnxYM6OKNKR4mb5DetX1n68JA00ERyZA8thteczh
         1bKzEdZeC2ye+LHMUY1QKk+44O26QHzhOIOXTY/PmkescMFSOQuhxQz3FFN67QsVN6EM
         yq6OzpFdBuVG0ZjFaaMMb2vOf85K8wBiu2maWd8+u7fGbbMclXf9hcIgSJdpRZfNRYnR
         SGew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785450031; x=1786054831;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lof6e1ot4kuBZAi+0NXUHy3Yo358hLoUkT/iaCauSXA=;
        b=I9BAug3txCb7JEb94Qsc8bExL58AFk++DGvkRpejL74NNgBGrUYM1xF4DVEX0AVCcZ
         wyMc5MHOwX9vwrAEeLFbYb8jYzR5WPxWbtmMpAblAaV8WM/7bdt6oxSL/k/VjPzpdo5L
         z5duQ0gKT5k+hjID6EyC1PKk3t07g9IJHZgoBw9ePEcQ03kIvlPBpe+1+b/s1Et+HfGQ
         CHSx8bU1+bwyy87He1E0d/7SYdEfsvcuf3aqM995c2cmN2+9+1ItXcveY57q8Z+zXwqW
         o6uvUf3fZ+cSdxHWdL5L9lTc6KGa4lghBK4X3ZmJAwJj6meE6OxVIM0AmHA4B1ikO4JN
         bL/g==
X-Forwarded-Encrypted: i=1; AHgh+Rpg19RZqZML0n3jhFXTY7CtBzxqERgND3J7vSAODWKLmcUvek07NcaeiscG5mXlw9AAmQvR94wRuzv2@lists.linux.dev
X-Gm-Message-State: AOJu0Yx2Q8L5w+0oSgVgxv5f7VjI5S5jcHoxBN3py8g3YdkGuVu+aga8
	pqb5+1oot0hsrzpwFb1B+qkuIfLt2WCKaRWO4+NJ2UtHuAqF/FJ1CdgYhPE2Kj77AEvKSNDEWQD
	vorsDO2wGLOoKOPNJZmJZjLkIK12XVn/Qx63C+qcW
X-Gm-Gg: AR+sD11br85I0DZ/3L8JdYI1tmCzXy5gxpqvl1I+vkW6ifQaop8WpK95vAnkLOtSBi5
	SUT4amuJ1R2d/RIQH10ZRhVXs9lmqFcJg0RIGbvIL1vtYadug5SLCN9JSC4+Ioi841y34X8rDDO
	3kf/gfdISGw/xUJ+vwP7lvZ9sPeknz/ph2bohJQLF+xmK3MPkv0/UWk2CcOZ0NCyRfKKMJKse3t
	8C6RrsPN4Mb7nIl8lqGXknBWxOQImYo6G+yWSSfj2QLc6s6uyTLJ9BddnNwEM5re6818bd9o1Qz
	6avqys8kL4RnGWUJGDzbOF8WdsLrsaJT1sixmvbztsmFouUV+8W+f8b3NDdPMcwWXCOSwRl4m/O
	oNCnfpCpmxvMIjNBFw9NAMqup7Ag9orm/8UY=
X-Received: by 2002:a17:90b:442f:b0:38e:70d5:b12d with SMTP id
 98e67ed59e1d1-38f9bd74015mr2426440a91.6.1785450030314; Thu, 30 Jul 2026
 15:20:30 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 30 Jul 2026 15:20:29 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 30 Jul 2026 15:20:29 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <4460e252-b6de-4df3-bea8-0368a9d0f4ff@kernel.org>
References: <20260728-gmem-inplace-conversion-v9-0-35f9aec2aed2@google.com>
 <20260728-gmem-inplace-conversion-v9-14-35f9aec2aed2@google.com> <4460e252-b6de-4df3-bea8-0368a9d0f4ff@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Thu, 30 Jul 2026 15:20:29 -0700
X-Gm-Features: AUfX_mzZQIbuyAIVKKa3Fs3idyVFYyPQCyW2ArgeeJkIMtuFBmetts4tKaZtmNo
Message-ID: <CAEvNRgEUQSju2tW_1zMk2=QmveZNtmkjjCZdqVBgBD2JPh0k4Q@mail.gmail.com>
Subject: Re: [PATCH v9 14/41] mm: swap: Introduce lru_add_drain_progressive()
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
	John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, 
	Vlastimil Babka <vbabka@kernel.org>, "hughd@google.com" <hughd@google.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

"David Hildenbrand (Arm)" <david@kernel.org> writes:

> On 7/29/26 02:35, Ackerley Tng via B4 Relay wrote:
>> From: Ackerley Tng <ackerleytng@google.com>
>>
>> Extract the progressive LRU drain retry logic from
>> collect_longterm_unpinnable_folios() into a reusable helper,
>> lru_add_drain_progressive().
>>
>> When attempting to isolate folios that may still reside in per-CPU folio
>> batches, draining is escalated progressively:
>>
>> 1. State 0: Call lru_add_drain() to flush local CPU batches.
>> 2. State 1: Call lru_add_drain_all() to flush all CPU batches.
>> 3. State >= 2: Return false to stop retrying.
>>
>> Refactor collect_longterm_unpinnable_folios() to use this new helper.
>>
>> The helper will be used by KVM's guest_memfd in a later patch.
>>
>> Signed-off-by: Ackerley Tng <ackerleytng@google.com>
>> ---
>>  include/linux/swap.h |  2 ++
>>  mm/gup.c             | 19 ++++++-------------
>>  mm/swap.c            | 15 +++++++++++++++
>>  3 files changed, 23 insertions(+), 13 deletions(-)
>>
>> diff --git a/include/linux/swap.h b/include/linux/swap.h
>> index 8f0f68e245baa..cd54f73f34f39 100644
>> --- a/include/linux/swap.h
>> +++ b/include/linux/swap.h
>> @@ -344,6 +344,8 @@ extern void lru_add_drain(void);
>>  extern void lru_add_drain_cpu(int cpu);
>>  extern void lru_add_drain_cpu_zone(struct zone *zone);
>>  extern void lru_add_drain_all(void);
>> +bool lru_add_drain_progressive(int *drain_state);
>> +
>>  void folio_deactivate(struct folio *folio);
>>  void folio_mark_lazyfree(struct folio *folio);
>>  extern void swap_setup(void);
>> diff --git a/mm/gup.c b/mm/gup.c
>> index 0692119b79043..5f00435e2c635 100644
>> --- a/mm/gup.c
>> +++ b/mm/gup.c
>> @@ -2268,7 +2268,7 @@ static unsigned long collect_longterm_unpinnable_folios(
>>  {
>>  	unsigned long collected = 0;
>>  	struct folio *folio;
>> -	int drained = 0;
>> +	int drain_state = 0;
>>  	long i = 0;
>>
>>  	for (folio = pofs_get_folio(pofs, i); folio;
>> @@ -2287,18 +2287,11 @@ static unsigned long collect_longterm_unpinnable_folios(
>>  			continue;
>>  		}
>>
>> -		if (drained == 0 && folio_may_be_lru_cached(folio) &&
>> -				folio_ref_count(folio) !=
>> -				folio_expected_ref_count(folio) + 1) {
>> -			lru_add_drain();
>> -			drained = 1;
>> -		}
>> -		if (drained == 1 && folio_may_be_lru_cached(folio) &&
>> -				folio_ref_count(folio) !=
>> -				folio_expected_ref_count(folio) + 1) {
>> -			lru_add_drain_all();
>> -			drained = 2;
>> -		}
>> +		while (folio_may_be_lru_cached(folio) &&
>> +		       folio_ref_count(folio) !=
>> +		       folio_expected_ref_count(folio) + 1 &&
>> +		       lru_add_drain_progressive(&drain_state))
>> +			;
>
> That's rather nasty.
>

I didn't really like this either, the drain_state thing is really
awkward, but in both usages (collect_longterm_unpinnable_folios() and
guest_memfd), there's an outer loop where if the draining happened on
the local CPU before it should skip straight to just draining on all the
other CPUs.

> I was hoping that we could embed more logic in a helper. The history [1] of the
> refcount check is rather sad:
>
> https://lore.kernel.org/all/c5bac539-fd8a-4db7-c21c-cd3e457eee91@google.com/
>
> ... primarily because of mlock() handling.
>

In the original code in collect_longterm_unpinnable_folios(), I couldn't
find anything that handles folio_test_mlock(), so I was lost for a while
until I realized mlock() doesn't add a refcount to the folio.

Are you kind of proposing an optimization to
collect_longterm_unpinnable_folios() by adding a check for
!folio_test_mlock()? I hope we can put that in a separate patch series,
I'm still hoping to get this series in for 7.3!!

> For guest_memfd(), would mlock() ever apply on a path where you need that check?
>

For guest_memfd, if a folio were mlocked, unmapping it would fail, and
so the refcount on the folio would be elevated. The
kvm_gmem_is_safe_for_conversion() check in the patch after this one
would fail, correctly.

I really wanted the caller of the lru_add_drain_progressive() function
to control whether to do the drain (see below), which would solve the
mlock problem by not assuming the use of folio_expected_ref_count() to
determine whether to do draining.

> Conceptually, I wonder whether we can do the following, and rely on the refcount
> check only on the mlock path.
>
>
> From ae30f7594692b0c47b44922c26b6480dd9584872 Mon Sep 17 00:00:00 2001
> From: "David Hildenbrand (Arm)" <david@kernel.org>
> Date: Thu, 30 Jul 2026 12:20:14 +0200
> Subject: [PATCH] tmp
>
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
> ---
>  mm/gup.c | 66 ++++++++++++++++++++++++++++++++++++++++++++------------
>  1 file changed, 52 insertions(+), 14 deletions(-)
>
> diff --git a/mm/gup.c b/mm/gup.c
> index 99902c15703b0..ec43071bd035a 100644
> --- a/mm/gup.c
> +++ b/mm/gup.c
> @@ -2259,6 +2259,56 @@ static struct folio *pofs_next_folio(struct folio *folio,
>  	return pofs_get_folio(pofs, i);
>  }
>
> +enum lru_cache_drained {
> +	LRU_CACHE_NOT_DRAINED,
> +	LRU_CACHE_DRAINED,
> +	LRU_CACHE_DRAINED_ALL,
> +};
> +
> +static inline void folio_likely_lru_cached(const struct folio *folio)
> +{
> +	if (!folio_may_be_lru_cached(folio))
> +		return false;
> +	/*
> +	 * Having the LRU flag clear either indicates LRU cache references
> +	 * or LRU isolation.
> +	 */
> +	if (!folio_test_lru(folio))
> +		return true;
> +	/*
> +	 * For mlocked folios, we don't have a real indication: we can only
> +	 * take a guess based on the refcount.
> +	 */
> +	if (!folio_test_mlock(folio))
> +		return false;
> +	return folio_expected_ref_count(folio) == folio_ref_count(folio) = 1;
> +}
> +
> +/**
> + * lru_cache_drain_for_folio() - progressively try draining the lru cache
> + * @folio: The folio.
> + * @drained: Status initialized to LRU_CACHE_NOT_DRAINED by the caller.
> + *
> + * TODO
> + */
> +static void lru_cache_drain_for_folio(const struct folio *folio,
> +		enum lru_cache_drained *drained)

The main thing I wanted in the proposed version
(lru_add_drain_progressive()), was to let the caller determine whether
to try or to continue draining.

I wanted the caller to have full control over whether to drain or not,
so I didn't want to pass folio into the function. I thought the caller
should first determine whether to drain, then call the function.

This version assumes that the caller wants to continue draining based on
something to do with a folio, and the folio may or may not be on the
lru_add fbatch at all, which is a little strange to me.

Also, this version enforces a certain definition of "expected" number of
refcounts on the folio. I guess in this case this definition works with
guest_memfd, but guest_memfd doesn't support swap so the swapcache check
in folio_expected_ref_count() isn't necessary. Also, if the definition
folio_expected_ref_count() changes, then guest_memfd is implicitly
affected. Not sure if the "expected" definition is the same for all
callers?

I guess if there was a function named
folio_ref_counts_indicate_presence_only_in_the_filemap() instead of
folio_expected_ref_count(), then it'd be the perfect function for
guest_memfd to use. The current definition of folio_expected_ref_count()
also includes page table mappings, but in this check guest_memfd really
wants to make sure that there are no page table mappings.

This version folds folio_likely_lru_cached() into the check, and I
adopted the check for guest_memfd because it'd help with huge pages,
though technically guest_memfd is always 4K now so the check is also
pointless.

I tried a macro version of this where the macro caller can pass in a
full condition, which would look like this:

  lru_add_drain_while(folio_may_be_lru_cached(folio) &&
                      folio_ref_count(folio) != expected_refcount,
                      drain_state);

but I thought that just created something people have to jump to, to
first understand how the macro works, so I left it as an explicit while
loop instead.

> +{
> +	if (!folio_likely_lru_cached(folio))
> +		return false;
> +
> +	/* Try local draining first, if not already done previously. */
> +	if (*drained == LRU_CACHE_NOT_DRAINED) {
> +		lru_add_drain();
> +		*drained = LRU_CACHE_DRAINED;
> +	}
> +	/* Try draining all CPUs next if still not an LRU folio. */
> +	if (folio_likely_lru_cached(folio) && *drained == LRU_CACHE_DRAINED) {
> +		lru_add_drain_all();
> +		*drained = LRU_CACHE_DRAINED_ALL;
> +	}
> +}
> +
>  /*
>   * Returns the number of collected folios. Return value is always >= 0.
>   */
> @@ -2266,9 +2316,9 @@ static unsigned long collect_longterm_unpinnable_folios(
>  		struct list_head *movable_folio_list,
>  		struct pages_or_folios *pofs)
>  {
> +	enum lru_cache_drained drained = LRU_CACHE_NOT_DRAINED;

I also considered an enum, but it would be another thing to export. I
was thinking to have drain_state just be opaque to the caller and the
only thing the caller needs to know is to initialize it to 0.

Perhaps there's a better way to "make it opaque"?

>  	unsigned long collected = 0;
>  	struct folio *folio;
> -	int drained = 0;
>  	long i = 0;
>
>  	for (folio = pofs_get_folio(pofs, i); folio;
> @@ -2287,19 +2337,7 @@ static unsigned long collect_longterm_unpinnable_folios(
>  			continue;
>  		}
>
> -		if (drained == 0 && folio_may_be_lru_cached(folio) &&
> -				folio_ref_count(folio) !=
> -				folio_expected_ref_count(folio) + 1) {
> -			lru_add_drain();
> -			drained = 1;
> -		}
> -		if (drained == 1 && folio_may_be_lru_cached(folio) &&
> -				folio_ref_count(folio) !=
> -				folio_expected_ref_count(folio) + 1) {
> -			lru_add_drain_all();
> -			drained = 2;
> -		}
> -
> +		lru_cache_drain_for_folio(folio, &drained);
>  		if (!folio_isolate_lru(folio))
>  			continue;
>
> --
> 2.43.0
>
>
> --
> Cheers,
>
> David
