Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00C82361DC3
	for <linux-coco@lists.linux.dev>; Wed,  2 Sep 2026 02:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788315686; cv=none; b=flb/jw/j5w1h7j3JAKPXdsPtkLlaSXmlPkQGYacMMwhtiNTk/naTWswQttQoqMIBCl1nZJ/AUIpr2NGV9xtMyqadxGw/2Fc1qK5MlreSgjBTRmTrZ5OnpzSSNrLedAjMOfG7q4MJwIdE+SlVRq7W1wGHdcuhhGHdDP5/yKRJupA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788315686; c=relaxed/simple;
	bh=dMv4nlHu8Y249mLMfP00bq7DYL6IzUHigBCjVTtONZg=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=PSpXQf5ck6E+y22mdu7P8sEqpO5Pn0Yuq2rDGIAYENsZooNeGgDbw6xe3nrM8jgJgUbEvqzvvgW9J5t/tZeLMQcwpVF32sagw0Vrd+XUhnx/psAY79G20f9Qn9af0mnjYBXvuiKts4SFFm97uLkRlmLmbMRLYqQC0riq3E9te9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TaOpbtqD; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TaOpbtqD"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-867a943b149so11920927b3.1
        for <linux-coco@lists.linux.dev>; Tue, 01 Sep 2026 19:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788315684; x=1788920484; darn=lists.linux.dev;
        h=content-type:mime-version:references:message-id:in-reply-to:subject
         :cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GP2nihoXTh44eq0onDqBGjACptMCLq276d/ZwwaKLtA=;
        b=TaOpbtqDcIItrhNQYB4kMcAumzzKWhvtRVRuP8z+a28ub7lnNYl7x6bNCZAj6Pe8Iy
         4NuaZhWOVe1mevBJ70wiTCYEhtgPd9KHeUKyxr7rXTZSK48vqjV9BxITXou+bQLojP30
         dj0TKuA1znFkIrD+qlnJiqyU+Rodu/62JmNba7JudUvYYIaqsQXbmWeB0rn5Me8CwtSz
         4EMuhOpCsaH1+xMDwmreUbWssygoJKFBaULWqerHArsaoDlnwM0WjgxSw/ZNrvpmwE6G
         X+3nohsGVxd78GkSK0UwdTS989Z9mTcMUpFPQYHdZuR75Di/sAKc1/BiT5hbTeC3YYDp
         3xxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788315684; x=1788920484;
        h=content-type:mime-version:references:message-id:in-reply-to:subject
         :cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GP2nihoXTh44eq0onDqBGjACptMCLq276d/ZwwaKLtA=;
        b=NPAAIfuKurAryKaJU0YJsxCV5EY3vS1TZxIx0DSd+01owp+aMLS9yFgusgbBk2QFjs
         d2FZ7xO+IzRESA41784saJE6btO90IoPRiWL+yEd7QTQc/JJT5wYmf4fE3DgfC4/yb+M
         H3Eog2dq7IegBhfselHYgng8vFYr42jiqvv2YCwFc0+HBH1zWGyPn++EOvsYzpBOpq5u
         rMVFpIAyXBHVGDsXQmkxOIiSiBNKZCo7LpQDM4chztKnoOCe9J+fKW8vE3is3Yhp1u6h
         9uHilIPXGETzGOY4r6EUHniRipXxg1Y46TJ+89Q02bEDea6W4QpSmw/cr2ypd2OPduAL
         g8tA==
X-Forwarded-Encrypted: i=1; AKwUvByklRwFr5+05DnCflo/YJ0qWD6aITqBx3xI4cdKoTkousGBqRkSiz3ndZSLYWIKipvmSkt+VT93G6pN@lists.linux.dev
X-Gm-Message-State: AFuF++nRO0Z5bz7W9EauxENZIMLJDDCdkWZ2lzNtPXUhsMmlzu2bjHL1
	Na3NbFsCR7J5gY3TN10NNk5BXr50LG/3ghuhWGCWKLpqDT0CAlWGG+KaZe/bqlhVyA==
X-Gm-Gg: AYBFou28GAaCdZt7oaiX0iLllAIbEakVmsvkd2eJPXGMjIjXPQYdmjA24vz585H1Bt5
	eLXRBGwJclTgOVSl68rtKw5ejHSbJCRgeu6NoWzkarkymQzMQz8bfvDY2Vq0Kb5U6MS9iePvQ7U
	smoI2wOBSdawIwwsbDm/TemTniJ9SLiKp7psvPMygMorRSTiQMZO3EdngSGR7gt8Ux0fynIy5v0
	4AU428QocVDnAXgQAhnhCLTEOhASuJ3gp+hf17dVk7ecH/UDBBW9NnjoHhm+D6ndQP3F/qylv4R
	dKn/OhS+AfzIQIN3vZGhkob2niWA3kpH1A4Qa3Dnbz+TbgoMIF1gOdunAzqpYqbw4/iEZkpZmdz
	cKR9/R+V4fvNOarQwje+wEaeo5SrEWJF1oIVS42OJeruhLkJUtSLDu+zcj/kVvZd+Hb6efaEbMV
	saTofpG2+WH0hG9Ot42IPu0fNm4+wlSR3tpihqA1jATm6hcYddiZdL4KC7gbAoPQ3y3RkPCkvsB
	45733NAD4QlP15wfSHSV5sVo5TFNQt6p/HNkfGd6KyVThJz
X-Received: by 2002:a05:690e:4419:b0:66f:7d51:b5ef with SMTP id 956f58d0204a3-66f9b90a9d6mr365005d50.3.1788315681539;
        Tue, 01 Sep 2026 19:21:21 -0700 (PDT)
Received: from darker.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66f986b612esm893663d50.21.2026.09.01.19.21.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 19:21:20 -0700 (PDT)
Date: Tue, 1 Sep 2026 19:21:05 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
To: Ackerley Tng <ackerleytng@google.com>, 
    Andrew Morton <akpm@linux-foundation.org>
cc: aik@amd.com, andrew.jones@linux.dev, binbin.wu@linux.intel.com, 
    brauner@kernel.org, chao.p.peng@linux.intel.com, david@kernel.org, 
    jmattson@google.com, jthoughton@google.com, michael.roth@amd.com, 
    oupton@kernel.org, pankaj.gupta@amd.com, qperret@google.com, 
    rick.p.edgecombe@intel.com, rientjes@google.com, shivankg@amd.com, 
    steven.price@arm.com, willy@infradead.org, wyihan@google.com, 
    yan.y.zhao@intel.com, forkloop@google.com, pratyush@kernel.org, 
    suzuki.poulose@arm.com, aneesh.kumar@kernel.org, liam@infradead.org, 
    Paolo Bonzini <pbonzini@redhat.com>, 
    Sean Christopherson <seanjc@google.com>, Thomas Gleixner <tglx@kernel.org>, 
    Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
    Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
    "H. Peter Anvin" <hpa@zytor.com>, Steven Rostedt <rostedt@goodmis.org>, 
    Masami Hiramatsu <mhiramat@kernel.org>, 
    Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
    Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
    Shuah Khan <shuah@kernel.org>, Vishal Annapurve <vannapurve@google.com>, 
    Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>, 
    Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
    Nhat Pham <nphamcs@gmail.com>, Barry Song <baohua@kernel.org>, 
    Axel Rasmussen <axelrasmussen@google.com>, 
    Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, 
    Youngjun Park <youngjun.park@lge.com>, Qi Zheng <qi.zheng@linux.dev>, 
    Shakeel Butt <shakeel.butt@linux.dev>, Kiryl Shutsemau <kas@kernel.org>, 
    Baoquan He <baoquan.he@linux.dev>, Jason Gunthorpe <jgg@ziepe.ca>, 
    John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, 
    tarunsahu@google.com, Randy Dunlap <rdunlap@infradead.org>, 
    Lorenzo Stoakes <ljs@kernel.org>, Vlastimil Babka <vbabka@kernel.org>, 
    Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
    Michal Hocko <mhocko@suse.com>, Fuad Tabba <fuad.tabba@linux.dev>, 
    kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
    linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
    linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
    linux-coco@lists.linux.dev
Subject: Re: [PATCH v12 18/45] KVM: guest_memfd: Handle lru_add fbatch
 refcounts during conversion safety check
In-Reply-To: <20260830-gmem-inplace-conversion-v12-18-85e5fd25252a@google.com>
Message-ID: <bd6c9c74-e374-a9d3-ba1f-8b6f430894fc@google.com>
References: <20260830-gmem-inplace-conversion-v12-0-85e5fd25252a@google.com> <20260830-gmem-inplace-conversion-v12-18-85e5fd25252a@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sun, 30 Aug 2026, Ackerley Tng via B4 Relay wrote:

> From: Ackerley Tng <ackerleytng@google.com>
> 
> A guest_memfd folio has no outstanding references if guest_memfd holds the
> only references on it. Any other references on the folio may indicate
> another user, and guest_memfd cannot convert it to private if there may be
> an existing host user.
> 
> A folio will have outstanding references if it is present in a per-CPU
> lru_add fbatch. guest_memfd does not actually participate in LRU, but
> freshly-allocated folios are still added to the lru_add fbatch for batch
> LRU statistics processing.
> 
> A folio may also have extra refcounts if it is on the mlock fbatch.
> 
> These two known "usages" of the folio are handled by calling
> lru_cache_drain_for_folio, which drains both the lru_add and mlock
> fbatches. After draining, if the refcount is still elevated, then there are
> truly outstanding references.
> 
> If the page may be dma pinned, DMA is using it and hence there are
> outstanding references. folio_maybe_dma_pinned() can have false positives,
> but that's only with a significant number of refcounts, at which point
> draining LRU is not going to move the needle - it can still be concluded
> that the folio has outstanding references.
> 
> If the page is still mapped after guest_memfd tried to unmap it earlier in
> the conversion process, it also has outstanding references.
> 
> Return true and exit early to avoid unnecessary draining in these 2 cases.
> 
> Provide a drain status to only drain once ever while processing a batch of
> folios.
> 
> Acked-by: Vlastimil Babka (SUSE) <vbabka@kernel.org>
> Suggested-by: David Hildenbrand <david@kernel.org>
> Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
> Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
> Signed-off-by: Ackerley Tng <ackerleytng@google.com>
> ---
>  mm/folio.c             |  2 ++
>  virt/kvm/guest_memfd.c | 30 ++++++++++++++++++++++--------
>  2 files changed, 24 insertions(+), 8 deletions(-)
> 
> diff --git a/mm/folio.c b/mm/folio.c
> index c02dcea9c03c2..50a6dbe55998e 100644
> --- a/mm/folio.c
> +++ b/mm/folio.c
> @@ -33,6 +33,7 @@
>  #include <linux/page_idle.h>
>  #include <linux/local_lock.h>
>  #include <linux/buffer_head.h>
> +#include <linux/kvm_types.h>
>  
>  #include "internal.h"
>  #include "page_alloc.h"
> @@ -926,6 +927,7 @@ void lru_cache_drain_for_folio(const struct folio *folio,
>  			*drained = LRU_CACHE_DRAINED_ALL;
>  	}
>  }
> +EXPORT_SYMBOL_FOR_KVM(lru_cache_drain_for_folio);
>  
>  atomic_t lru_disable_count = ATOMIC_INIT(0);
>  

I don't mind about the virt/kvm/guest_memfd.c part of it, but I'm finding
a KVM patchset modifying mm/folio.c there hard to deal with: and notice
Sean also suggesting to separate this part out.

As you know, I've worked up a patchset "mm/fbatch: drain lru_add_drain()
and _all()" which finally removes the problem lru_cache_drain_for_folio()
works around. In the initial version posted a week ago, there was no
lru_cache_drain_for_folio() in the tree. Now 7.3-rc1 has it, so I
intended a replacement 13/25 in my series, giving you just an empty
inline lru_cache_drain_for_folio() stub (and enum lru_cache_drained)
in linux/swap.h.

But that won't work for you, if you're adding an EXPORT_SYMBOL_FOR_KVM()
in mm/folio.c, and of course conflicts with my removals (in context both
above and below your EXPORT line). It's easy for me to remove what's in
mm/gup.c and mm/folio.c, but I cannot remove what is not yet there.

I've wasted hours on this, hoping not to trouble either of you; but
seeing now that I shall have to rebase anyway (an unrelated mlock fix),
I'm electing to take the only clean way out: I'm going to submit this
mm/folio.c part of your patch to Andrew tonight (with a shorter Cc list!),
in the hope that it can be accelerated into 7.3-rc2 (or at least get an
mm-stable stable base-commit id) which we can both work off independently.

Whether that's acceptable to Ackerley and to Andrew, I don't know
(just as we don't know when either of our patchsets will go further),
but let me try.

Thanks,
Hugh
