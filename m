Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5457B5650F4
	for <linux-coco@lists.linux.dev>; Wed,  9 Sep 2026 15:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788967522; cv=pass; b=YiDAuyMe7UNO4KYv2Ll1SgLCjvf7qGvty0AXQ8SakVS6Xlw8eRRPfuh7a1O3eH8TBieLHgdA97vqeHFGThxcSfCkih/OGPyf3smCvJBgKecDpBrQUENfkbTjaisoDLcxZhGYlyRS7SuWTP9UjKIVXYdlJ960WWUvo7CBRgms4wk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788967522; c=relaxed/simple;
	bh=uTvLvNOiD2VaPyg22uQpYQwhoB6nWQlo6kn+/rYg9tw=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WdHob9cktfrtf4ye5BHiux7nzxqmyhxrBguzglWsqE681O6/0UD+zBMpUxQPTt+Sry/+AIoMhGwiZ9Nt0hU1PZVH8T2o5YK9VPg1YQeWhMH7V9B7p2bPs2jaF67dbsCTE5KzLZTS8XO4tbT+iV/bDoentQizs6/o7VExWAqGpAY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RiSbt1Em; arc=pass smtp.client-ip=74.125.224.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RiSbt1Em"
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-671061b015eso1218454d50.1
        for <linux-coco@lists.linux.dev>; Wed, 09 Sep 2026 08:25:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788967520; cv=none;
        d=google.com; s=arc-20260327;
        b=F2w1DGzQUByAK6w3VjL5UDT6pXsYUEqdOt88V1a3w+DC1ImAZSWKfFZ5sqFgfxK9Kp
         D6h5gUNVnnJ16MvfXa6pGq0m5uWJpAONrWXh7CsDhbg/V1T49+GYIUMqgfwaMYFvYcPS
         eBuk/+GSYxwCaATr8AOjV0EslOYJSkLPMmQwXjXxjZA+E/bFGpVpc22fhZ9K/G5VU4d0
         kVg8EnE60uILNsnsErx6YhcIYPpjV614uqMSt9HQ+arENYl0WZsDoEJwT9hdUT/pINvO
         JJFZoa9N4Am30KCOAlIwsi8Sy/zis8Bwc2v9JTY3DyMsz9xTbhOjNR3T0bm2yejYwZVA
         /K1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=m4jJh3TX4gx98qaUfn3Q4oVt1KTvxUkS7IflLLQjx2I=;
        fh=uHA1qjIHnyWe7d73L6ZT74NtfRtf83R+Cce8njXeF2k=;
        b=EAneQaYX8W3JIKSqCzPnuqkXqscz2Qj6ueaHoVuc+KurWK2rtdzpJkVgmG4nA39RMx
         GtYH1XuYjEM+aREQiGoC3IsA+BIsTpshFAwBwvs3ImZYgulXwldloLGWUSYtYl34ZbTU
         +Kmg1iJl87qC6xn75eagUN/bH59yLFwdLKZEAn65/NRTwv6jis997OV3zxQDY3N24fwU
         3haMR5jK/neA690zciSH5TT8VZ0NdNDly/jKn7anh5NseRLSlliHdpWuwFUgwUM6iVpq
         2nLOPAGX3aVDBfGW2tswhqe07NLMWBfkXn/ZN7OosayffW9RHviKL2K+w5Hu16Ftq005
         aMFA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788967520; x=1789572320; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m4jJh3TX4gx98qaUfn3Q4oVt1KTvxUkS7IflLLQjx2I=;
        b=RiSbt1Em+cRBlEYq2UH55uY5Nd2+EjUsLPvDqCSKIpA0mFc3XjKxnSXpTQCEYmljDj
         gMXQC0alUXN4ynOgwZ0QHLm+FmYuAGn8W0vLCI1p0D0CP/W4R/q0iHSAFpsQH502XDeI
         7JqYlKzvil3RiijOAM7d5PERa7amQJLO1hTV/mMXXPUPdyU/okX7Xww0Mcc234UP8EDd
         AfooDubLRL8As8R4UhQBmJcUeYBVXf+6EKwTiAFU/ex7/11mCy6shs7wsV5ch3Nn/fJh
         /aBNXeAjiZVKR8WUapnjTIzyjWdhhg8XzyHDU7uO5YY87TzuWReHsyOtomPDsr2GjbJT
         U3xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788967520; x=1789572320;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m4jJh3TX4gx98qaUfn3Q4oVt1KTvxUkS7IflLLQjx2I=;
        b=rGcRI9lg43G+w1fQqpjo+rtFQY2ZLJU4t4IDhuUyTd5svQ85GQ40MppkM/P5A3Klwm
         bA8KOzzHkEUSjOtV4U08BHYNOFdfLAose0gPxp3I/QIvcTq8Bhb70re5QXR15Cg0mVPi
         oxOWlihHdS5nqcAM/jKhxEpQ41Tzmqfc6mzVeoDuT6tkiwKzZt6VNx60LSYkmta7doB0
         HCguwOEleiF/X/oke5k7ek56yXQgIW1Mzo05Y4ijJtRu4FzcDpQ2NR8WTlRUm1fxK9Hg
         /6kOhZS9rRSCYGqzbfBElifcD4jhSHkEamYNKCc15OXHeMDvXplvaV+9nILTkiCiJEX5
         2zOQ==
X-Forwarded-Encrypted: i=1; AKwUvBwoo0QPYeRE6zkRPHd7DqCSFEO8LZ6aLpnzBDZi6w6d7HMjUKQqYowWnmhiRu33oWLsze1fCLSPX2wM@lists.linux.dev
X-Gm-Message-State: AFuF++mPW6gQ9PvHOFStvARWutpTuYf5zR5vVBIYzu7JLMGBhBy5/xxh
	lCfs8zNFb8278z41p3RaYk4vbBqywMMrobwHCGMZEDqfgvJ1uB6+YpgNJKC1JlfdCCQDupXC8H1
	z2/QoEUqYgyh17w5Gi2YDsc+BrE+X52T1Q9mEVlWA
X-Gm-Gg: AYBFou2bTvMyDMf/qq8PHxgwupn8xY5kx5aoexmVKLeVr2qt7KnH0q0S9Wx0SbmnPTk
	TDy4SmP7RFpypxe2VrkxL/guHVzPXDv6F5vkb/uKd/kInZD5fQgV5aAOjxrCtu/2r8ZPmQb2hWz
	4rcAC0WGq+eyb+PABf8QNc+/+HS8UtQaMigVIYTAk4sPQ5j47de/PduLZOC+BmJ+Syyr6kFIH55
	2TzvBALaowoH0rmciLw5F0p26IbvrSpvtqF0jnuKQwN4H36vwcseNHqD+x+MGt+HJy5fMYPCCNR
	rE8kjvwkVkbvIvoqYBV4+6zCtW74pGrr27V+GbOrl9jhhy5ZtFT6DxGZF9qpX5IRWh80IsWkR5v
	ogMbcWiKdw/nP
X-Received: by 2002:a05:690e:d0c:b0:66c:c7e4:2ff1 with SMTP id
 956f58d0204a3-66fb59519a7mr10665340d50.15.1788967513698; Wed, 09 Sep 2026
 08:25:13 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 9 Sep 2026 08:25:12 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 9 Sep 2026 08:25:12 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <bd6c9c74-e374-a9d3-ba1f-8b6f430894fc@google.com>
References: <20260830-gmem-inplace-conversion-v12-0-85e5fd25252a@google.com>
 <20260830-gmem-inplace-conversion-v12-18-85e5fd25252a@google.com> <bd6c9c74-e374-a9d3-ba1f-8b6f430894fc@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Wed, 9 Sep 2026 08:25:12 -0700
X-Gm-Features: AcwNN1XO0ky4otDKucsugFRBan2HEERm69mRZ8ScY2_txSdjnOuds0rILhuqOBo
Message-ID: <CAEvNRgEkkvk11_atVj9=+OBym-7SbSMB7MpHcoN6-Q5KS3Lb_A@mail.gmail.com>
Subject: Re: [PATCH v12 18/45] KVM: guest_memfd: Handle lru_add fbatch
 refcounts during conversion safety check
To: Hugh Dickins <hughd@google.com>, Andrew Morton <akpm@linux-foundation.org>
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
	Shuah Khan <shuah@kernel.org>, Vishal Annapurve <vannapurve@google.com>, Chris Li <chrisl@kernel.org>, 
	Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Nhat Pham <nphamcs@gmail.com>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Youngjun Park <youngjun.park@lge.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Kiryl Shutsemau <kas@kernel.org>, Baoquan He <baoquan.he@linux.dev>, Jason Gunthorpe <jgg@ziepe.ca>, 
	John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, tarunsahu@google.com, 
	Randy Dunlap <rdunlap@infradead.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Fuad Tabba <fuad.tabba@linux.dev>, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hugh Dickins <hughd@google.com> writes:

>
> [...snip...]
>
>> @@ -926,6 +927,7 @@ void lru_cache_drain_for_folio(const struct folio *folio,
>>  			*drained = LRU_CACHE_DRAINED_ALL;
>>  	}
>>  }
>> +EXPORT_SYMBOL_FOR_KVM(lru_cache_drain_for_folio);
>>
>>  atomic_t lru_disable_count = ATOMIC_INIT(0);
>>
>
> I don't mind about the virt/kvm/guest_memfd.c part of it, but I'm finding
> a KVM patchset modifying mm/folio.c there hard to deal with: and notice
> Sean also suggesting to separate this part out.
>
> As you know, I've worked up a patchset "mm/fbatch: drain lru_add_drain()
> and _all()" which finally removes the problem lru_cache_drain_for_folio()
> works around. In the initial version posted a week ago, there was no
> lru_cache_drain_for_folio() in the tree. Now 7.3-rc1 has it, so I
> intended a replacement 13/25 in my series, giving you just an empty
> inline lru_cache_drain_for_folio() stub (and enum lru_cache_drained)
> in linux/swap.h.
>
> But that won't work for you, if you're adding an EXPORT_SYMBOL_FOR_KVM()
> in mm/folio.c, and of course conflicts with my removals (in context both
> above and below your EXPORT line). It's easy for me to remove what's in
> mm/gup.c and mm/folio.c, but I cannot remove what is not yet there.
>
> I've wasted hours on this, hoping not to trouble either of you; but
> seeing now that I shall have to rebase anyway (an unrelated mlock fix),
> I'm electing to take the only clean way out: I'm going to submit this
> mm/folio.c part of your patch to Andrew tonight (with a shorter Cc list!),
> in the hope that it can be accelerated into 7.3-rc2 (or at least get an
> mm-stable stable base-commit id) which we can both work off independently.
>

Thank you! Will use this in the next revision of this series.

> Whether that's acceptable to Ackerley and to Andrew, I don't know
> (just as we don't know when either of our patchsets will go further),
> but let me try.
>
> Thanks,
> Hugh
