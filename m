Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 481D235C6B4
	for <linux-coco@lists.linux.dev>; Wed, 12 Aug 2026 13:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786541884; cv=pass; b=hsgZeLkjOpm/2KI8MhC8JmvJTASmQ+rBOyotxOTsLswNrkRdXdEsMXIjwIOD+1r6aHCpLr0xOVo1Sqo29KEDs9RSsMbKfyi9j8wNx6zZEsDU/tHFDAqWFGk/gUO0rZUkSM3eHi8J5ocEkvI4Rktpy/+Xc3W2oGRSHtSyhPvcGoU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786541884; c=relaxed/simple;
	bh=ogjpgBBuRJDVsJoOgismEb1l1STFPRdqrmOGMgUrh1M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kILjdaJrK1QIZa1/Z1ogZnFcmSPygTO9JSjnDaV0vjQoAOKJ8ktSoWaU0jVxix2jnULPuSQsHLGa6F8mYf0IwIJFSR/HgRNZ0Av3JtHSM3aoj+TfBnIOCEHB/JEX9pqPaTwlrmQPzl1Mg3sMY7BmYz6pVEkzPyVoAfZooXCvf6A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FySIVHR/; arc=pass smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FySIVHR/"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-51c15a5b265so229761cf.0
        for <linux-coco@lists.linux.dev>; Wed, 12 Aug 2026 06:37:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786541865; cv=none;
        d=google.com; s=arc-20260327;
        b=hp5VIWeHI15lEB6BmtmtudkqznrXHpQOREFcbtYt6wzt0/GSLcEGwsxPhsUWThK8Gm
         m287rMszK9c+9jTY7aaFKQ87lNhE5aKDMp/nOjGFWF0TYnpDy3oFpGuqgHuQQNWEpG/U
         nKhMkABQKbfyHTVWxSkAhkvOa/g6+amft0HA07bY/qvI7R8u5blE+O+/JchvweAf7bIJ
         JoEp5f/VcKRiQGPz7RAOncSmtDfMMenONQLxzmKBxwHkBrdDOC19KlCU18WXpLIQ4JvE
         2lDFlBqc8ODeA8vsN2jtDEqPCQUhiV1VuarnEEMuC8aF0sYMuoN3CDTsQcSN7ZliHfTY
         RVgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=S2/eW8js8WPIEzN4muuCXfZ23ENIccFKrP1Pa44pPgE=;
        fh=W21sXsJ0Wu/izTmyEYUvWBwpI7MJQ+w8iAp3Gl7xdWY=;
        b=kMzRJIxd3QarJoalVb4fjvyO+J0J3u5/OdvgFApl9+Kh3/EYN1Tmich8LfPxZyxg7U
         VV8+NHFcuq7vmPwZ2zwW0QNzVDGFgyLhejDdZnybjw6ssnrBvoSJd7WupRH3HHARnNHb
         eq2A0CgWJ1IPBqLFiqpt8nV7EQF56KNKN293ukyp6OBlexQe4S/3Q7WCp7XidCjD1XWQ
         xKsI4yeXOTo++MS+oN0DwF5gG0F1TVplZze3C4rDpI98kl69XVAmxJf5hMHvqtp/+dxS
         xZo/xpaxYb53Cgu6RsEh+0RelGQDC3wUSAgDgbxDIKigyEKVmEZSk/M8KTM/ALpIoSSk
         7FPw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786541865; x=1787146665; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S2/eW8js8WPIEzN4muuCXfZ23ENIccFKrP1Pa44pPgE=;
        b=FySIVHR/ngX5Nf3MbAekN2NMG+ylAzjwF+OhFFhyVlqugvKu4t1NrQSxFxkn8QaJ1B
         H1pJ6Tkz8bzzBZ3LwIrSq08e/KkcxhjX0itak774OHhbDR0BjZzQ5ic/2A/Xi9fBqRph
         vIftt/pPyjpmq7qtsFb24QgdA//sXwNhC2KZVAyX7qKUiznRmOCBo1aM2fJPnofXeFMq
         1drGzKR0iC7qzcHqyk6hbA1ZCw6pqShpJsqWGyz7BORp00fsZNUx+LQNaiK3ljOC3r9s
         2KEywOUgC+tWwSms5U7DTTKaVEy2MtF+dDetYsILDq3WuVNUxqolTk4wSAkimuh1K+lZ
         eoaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786541865; x=1787146665;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=S2/eW8js8WPIEzN4muuCXfZ23ENIccFKrP1Pa44pPgE=;
        b=rdAn9Fi0Y6WXvYQP/5iK4VjPFfiFDNj5aKS8ax5VCMZYpP7grJkdK4++SU/vSQgkLc
         UtEMpsw2OCWb4qRIUxYp+EIsp8CWBmsdBnL208FMnZlqeXGUQMHXnKGUhZw9yOm44yVM
         o2IFudUhkDHuhBw7oXzBnzHnv3O6kWygcdilCrjpd7ryGtvEgMiyQwg+mEsqCFbKQ5Fi
         v+B/qxaqriUVV+unM0YRYJevPXBV31Q7vVPH0S8woqr11Ht1zMX/p9qXbhou6FCAWMfw
         V7RJikb362U+T8X3zMlX217hAIgqhTaM/cy+5jQii6/cSzLSc8RoG42iy8oaf1j4VRas
         xTVA==
X-Forwarded-Encrypted: i=1; AHgh+RptNH27bH4q2E168K0KIU/t0Q0wYBzTpcdMIl+dsnTx8kzryMxqF/6LSG7VFr0W0tz/1fsJC+l7wcOV@lists.linux.dev
X-Gm-Message-State: AOJu0YxIm76o2Kwahh5xqG3kdQODRIxdajoTY1OOr6D8BX5ktwjmRUXA
	XFssVm4rmhmk5o9m0jIkmsv/HNnSSzGKYAAZN3wQus0n2RbUr0gKWfi0498At1bqJ9xlfcBRqeV
	i1ZgqwiJ2ueqMN4xVM13NyYxRCTV3NFDdXThl1/Vk
X-Gm-Gg: AR+sD12iNsiQUeWEInDoZn8jesorMxd2MaeA07mfTaO+xfjYoOEWgtq0nXc3hSPEtj+
	mVDK43rJLIXw3xo1oablswILbhfX3nKIqoVCh8Sw3Je6i1OmiMq8Fh+dPOM+yWr2Wr5LIQNXXGl
	si21OTjo/9G09SEIElIKVs+yCnOVy/M5qLatJFB89EdNkzEXc4PigjN+Z2PvDNzynfCZHdmVRg0
	vqkIO7Qt9ilIkmg5KvWlvic0ioEvhS3Ehrqzv7tKIxheu+J4DKFCvKHzWMtkJdY7mBdd5kHMjZ1
	55u7hUsLzYCMWZAcBAJ9DgK4pCkBYpJzV/g1KuUnUFwKkA==
X-Received: by 2002:ac8:5716:0:b0:51c:ca9:3d17 with SMTP id
 d75a77b69052e-52d61f7a0e7mr18935971cf.12.1786541863881; Wed, 12 Aug 2026
 06:37:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260807-gmem-inplace-conversion-v10-0-2fc18ee6d3ba@google.com> <20260807-gmem-inplace-conversion-v10-14-2fc18ee6d3ba@google.com>
In-Reply-To: <20260807-gmem-inplace-conversion-v10-14-2fc18ee6d3ba@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Wed, 12 Aug 2026 15:37:06 +0200
X-Gm-Features: AUfX_mzUD6PeEtmKkDfteoyWkYyMiizOHZtVOuf49kBLBevxhRMZd8gNAqxz5ac
Message-ID: <CA+EHjTy83rq0m5=QyPKmxPfFkc+kHzzuY4mV9nThdguW41Ws6A@mail.gmail.com>
Subject: Re: [PATCH v10 14/41] mm/gup: factor out LRU cache draining for folio
 into lru_cache_drain_for_folio()
To: ackerleytng@google.com
Cc: aik@amd.com, andrew.jones@linux.dev, binbin.wu@linux.intel.com, 
	brauner@kernel.org, chao.p.peng@linux.intel.com, david@kernel.org, 
	jmattson@google.com, jthoughton@google.com, michael.roth@amd.com, 
	oupton@kernel.org, pankaj.gupta@amd.com, qperret@google.com, 
	rick.p.edgecombe@intel.com, rientjes@google.com, shivankg@amd.com, 
	steven.price@arm.com, willy@infradead.org, wyihan@google.com, 
	yan.y.zhao@intel.com, forkloop@google.com, pratyush@kernel.org, 
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

On Fri, 7 Aug 2026 at 23:52, Ackerley Tng via B4 Relay
<devnull+ackerleytng.google.com@kernel.org> wrote:
>
> From: "David Hildenbrand (Arm)" <david@kernel.org>
>
> KVM with guest_memfd wants to remove any folio references due to LRU
> caches, as it really must only allow to convert folios from shared to
> private when there are no unexpected folio references (e.g., from GUP
> references).
>
> So, to drive the refcount down, it needs a way to flush the LRU caches.
> Let's factor out what we have in lru_cache_drain_for_folio(). Document
> it, and also mention that concurrent folio (un)mapping might, in theory,
> miss detecting LRU cache references. Keep obtaining the expected refcount
> twice to minimize the possibility. For the current and future user that
> should work, and we don't really have a better alternative: we could
> detect if the mapcount changed, but it would still be racy and add more
> complexity with questionable benefit.
>
> Maybe there is a chance to avoid the draining entirely in the future,
> by avoiding extra references from the LRU cache: Hugh thinks there might
> be a way. But for the time being, this handling is unfortunately
> required.
>
> Make folio_may_be_lru_cached() accept a const pointer so
> lru_cache_drain_for_folio() can accept a const pointer as well.
>
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
> Signed-off-by: Ackerley Tng <ackerleytng@google.com>

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>

Cheers,
/fuad

> ---
>  include/linux/swap.h | 11 ++++++++++-
>  mm/gup.c             | 15 ++-------------
>  mm/swap.c            | 46 ++++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 58 insertions(+), 14 deletions(-)
>
> diff --git a/include/linux/swap.h b/include/linux/swap.h
> index 8f0f68e245baa..e625d64c9e13d 100644
> --- a/include/linux/swap.h
> +++ b/include/linux/swap.h
> @@ -317,7 +317,7 @@ void folio_add_lru_vma(struct folio *, struct vm_area_struct *);
>  void mark_page_accessed(struct page *);
>  void folio_mark_accessed(struct folio *);
>
> -static inline bool folio_may_be_lru_cached(struct folio *folio)
> +static inline bool folio_may_be_lru_cached(const struct folio *folio)
>  {
>         /*
>          * Holding PMD-sized folios in per-CPU LRU cache unbalances accounting.
> @@ -344,6 +344,15 @@ extern void lru_add_drain(void);
>  extern void lru_add_drain_cpu(int cpu);
>  extern void lru_add_drain_cpu_zone(struct zone *zone);
>  extern void lru_add_drain_all(void);
> +
> +enum lru_cache_drained {
> +       LRU_CACHE_NOT_DRAINED,
> +       LRU_CACHE_DRAINED,
> +       LRU_CACHE_DRAINED_ALL,
> +};
> +void lru_cache_drain_for_folio(const struct folio *folio,
> +               unsigned int extra_refs, enum lru_cache_drained *drained);
> +
>  void folio_deactivate(struct folio *folio);
>  void folio_mark_lazyfree(struct folio *folio);
>  extern void swap_setup(void);
> diff --git a/mm/gup.c b/mm/gup.c
> index bde05664fe9a9..1bd8915517196 100644
> --- a/mm/gup.c
> +++ b/mm/gup.c
> @@ -2266,9 +2266,9 @@ static unsigned long collect_longterm_unpinnable_folios(
>                 struct list_head *movable_folio_list,
>                 struct pages_or_folios *pofs)
>  {
> +       enum lru_cache_drained drained = LRU_CACHE_NOT_DRAINED;
>         unsigned long collected = 0;
>         struct folio *folio;
> -       int drained = 0;
>         long i = 0;
>
>         for (folio = pofs_get_folio(pofs, i); folio;
> @@ -2293,18 +2293,7 @@ static unsigned long collect_longterm_unpinnable_folios(
>                  * but also to remove any other folio references from LRU
>                  * caches.
>                  */
> -               if (drained == 0 && folio_may_be_lru_cached(folio) &&
> -                               folio_ref_count(folio) !=
> -                               folio_expected_ref_count(folio) + pin_refs) {
> -                       lru_add_drain();
> -                       drained = 1;
> -               }
> -               if (drained == 1 && folio_may_be_lru_cached(folio) &&
> -                               folio_ref_count(folio) !=
> -                               folio_expected_ref_count(folio) + pin_refs) {
> -                       lru_add_drain_all();
> -                       drained = 2;
> -               }
> +               lru_cache_drain_for_folio(folio, pin_refs, &drained);
>
>                 if (!folio_isolate_lru(folio))
>                         continue;
> diff --git a/mm/swap.c b/mm/swap.c
> index 588f50d8f1a8c..8e965c8ce9aa9 100644
> --- a/mm/swap.c
> +++ b/mm/swap.c
> @@ -950,6 +950,52 @@ void lru_add_drain_all(void)
>  }
>  #endif /* CONFIG_SMP */
>
> +/**
> + * lru_cache_drain_for_folio() - drain LRU caches if the caches might hold
> + *                              folio references
> + * @folio: The folio.
> + * @extra_refs: Extra folio references held by the caller.
> + * @drained: Drain status for batch folio processing.
> + *
> + * Drain LRU caches if the caches might hold folio references. Start
> + * with a local LRU cache drain, to then drain LRU caches on all CPUs if
> + * local draining was insufficient.
> + *
> + * This function detects LRU cache references by comparing the folio refcount
> + * with the sum of the expected folio refcount + extra references held by the
> + * caller. Note that we cannot rely on PG_lru to reliably detect all LRU
> + * cache references, and there are rare scenarios (concurrent folio (un)mapping)
> + * where this function might miss detecting LRU cache references.
> + *
> + * If @drained is not NULL, the function will avoid re-draining LRU caches
> + * when processing multiple folios in a row. In that case, the variable
> + * @drained points at must be initialized to LRU_CACHE_NOT_DRAINED before
> + * the first invocation by the caller.
> + */
> +void lru_cache_drain_for_folio(const struct folio *folio,
> +               unsigned int extra_refs, enum lru_cache_drained *drained)
> +{
> +       if (!folio_may_be_lru_cached(folio))
> +               return;
> +
> +       if (!drained || *drained == LRU_CACHE_NOT_DRAINED) {
> +               if (folio_ref_count(folio) ==
> +                   folio_expected_ref_count(folio) + extra_refs)
> +                       return;
> +               lru_add_drain();
> +               if (drained)
> +                       *drained = LRU_CACHE_DRAINED;
> +       }
> +       if (!drained || *drained == LRU_CACHE_DRAINED) {
> +               if (folio_ref_count(folio) ==
> +                   folio_expected_ref_count(folio) + extra_refs)
> +                       return;
> +               lru_add_drain_all();
> +               if (drained)
> +                       *drained = LRU_CACHE_DRAINED_ALL;
> +       }
> +}
> +
>  atomic_t lru_disable_count = ATOMIC_INIT(0);
>
>  /*
>
> --
> 2.55.0.654.g21b8a5bc05-goog
>
>
