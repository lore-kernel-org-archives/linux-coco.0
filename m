Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49C15455183
	for <linux-coco@lists.linux.dev>; Tue,  4 Aug 2026 15:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785857220; cv=pass; b=rOl3WeU8itKF9ocJeHI0bDcTANoeI7CakQsXh6/Zg327SrtQUlDnLPyN7JuPCN9T+AHoE8n4uJtwgnG/rdFg1FwOONCaHgZDkFSTGrb6Hdp90zQJKZVZvRofjDDjEK1sr9J6rvi9iMsguDpB5GnDVAi1cn83eGjODaLpntKUUCA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785857220; c=relaxed/simple;
	bh=PGOfUIjmK2sLYUpnc50+oNliPpC3bMJvepqZe67VyTY=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i5MVLBVE6mhe+cJecza3teGFjv2EbSkNateq5e30CfJFHfQBwgfhkD10+dX+A8l8cfwZMrI2PHWCFQpXSb3BtK2boTJah/ndsAUhsEKsyJ+4M57+m2qlzGw6fX4fCMFJwIbbq6Jhkjppo9j3xyMhj6OIoLq3Lqp2TgAQDgw83hE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lfJ2bSjr; arc=pass smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lfJ2bSjr"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-c9e0b89e228so2603806a12.1
        for <linux-coco@lists.linux.dev>; Tue, 04 Aug 2026 08:26:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785857217; cv=none;
        d=google.com; s=arc-20260327;
        b=JhQgQpkP4QDAd/KZPX7bxeBXS+TZvEtUyWP1bQT6YrBQ7JZ1Vd83MHGFhp49nIs9a9
         Bts8CgvczIBMwaF7p4E3f0tbeX2QqQgcMSRXN2YX3z3nmR171ju4MALp2KW9QaudyVYU
         xvjAhTMr03fpVQ1Iii/DmNdZx/BTSeyLpMx82JhgE/ezT5dWJb2Z0foJ5byLkw1tm+m9
         jM+rmRUoxWlI9s4PjmdOeWEJaQ3hOsgEDVJXdhf5xn0g879Yu08CswfuOzukmu4UqlY4
         Yy2O2zI8fA80lZ2IJI5ugpzSrbvU3KUVu+3YXN0JrQgJQ81Q75ENitAI3ch//Bgg+1uU
         71JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=xHMbjbISSQ14Q5mScQWUAkMvgB0AbxoRu++R0znInKM=;
        fh=9pL0PqiYtDmBA7KDjPoCZ9pWzqmPriUafO6XCxBXlRM=;
        b=YF6LJgQG1V6WDK8FWtWQoSJEaXzJOma5uUvihxRWicuE9WsE0Q/PKWdLDj3UPzP9Ex
         UjlHVgp0MsvoB152+mGFjPspqEGEqnf90OFvslFcqaEyURKoxL9cMEAoeLCvLWr/pStv
         yFKyy+5DaPE7CAaRqrhiw/wvB3/ebgGCsAXbduFbB22vSM28oMXF1S6eJdpN3OAUtIZh
         T/0XXPWnjkrB+FdwQVFMNiiS2CwdCrkQpXmYYJ/3mR9tHShegchj7dsUDTMtUV+DrazO
         6mJ/MDxvFD7RSJx6g3Y1OCr9dXDNQNvu+PJKYere2tYHff2J5zSkWUa8fgApJ6XA1Sk4
         KsHQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785857217; x=1786462017; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xHMbjbISSQ14Q5mScQWUAkMvgB0AbxoRu++R0znInKM=;
        b=lfJ2bSjrAK0B3tPpTsqdUIGNZSJyZ0xPQeVMtUf9+MWGmDBWDuW1dyi2MnacqQc7ty
         1cdgu8Q2UZWR5y0IqgtfNPU1N7eK4zXUSKBHWXNZo91M3dKWzoNqMbEeLKlwnaUltBsB
         DaSYq6rwlAtEL/9cFh2MqPNUyTXpMSpdMhPPcDj283pVXUjBPKZ8bDWYaxk51uTf0nyb
         aUDE6AXXXjhr88wgJvc/BVOEDqVzmsiR2FdWVq3+kVpCxT2v41Urrweus68/AngCZo4g
         YBTH1pke0lQiolAfTLKBHhDQhCFQ3OqFJwgvSBjQOghUtC1GIKQsqyydgcRk7j6lHBId
         J5zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785857217; x=1786462017;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xHMbjbISSQ14Q5mScQWUAkMvgB0AbxoRu++R0znInKM=;
        b=IIhvAIRSpZ+BCpZsrj1lA9NH+CKN687mdyedIwxCdemHBn1XamXl4FAPH84AP8vjNh
         2QYXvFYAUtkXLJVvvNSWn/sT5AA5bOd2ep6t/FHfS9ZN89I5tpaTOHo9OBHu9bBUiIcZ
         uhQoLJnjHhxfmgWgs1vXeQBhuVx1k1fb522VtyCIX2uv7PUiPQQsGEyDES7puo1ba2Sy
         MvInq4y1ShkLdjeecpW1wOeH/2TtMcxtcx/IcySvJ8gNxcQ+vLYRrj8HgSiMvi+J0Wag
         2HBZ7ctkwY/2q9kkLSUwLRIkbGNKoXudSgy+EyUaZMgPxJ+qhWJ6gjn/ybbd9KMqLW0w
         LsNA==
X-Forwarded-Encrypted: i=1; AHgh+Rrj+shn7njB2av4kikxMfPVNdRsFkXb9ychNEUE28WHdi0b48MdjDknG10nv+OQqkIMLoMJU/RrbePa@lists.linux.dev
X-Gm-Message-State: AOJu0YwayHiNXQrCOG1nCFdBoqAfdOVacmqnu1sr3Mn8UGhNP2hw7IOt
	OutuZBPR3GpBrmcdhi6KOXGZ+lbnHsgOuvn80WKB1TuM+cd6RpHVVqqjXsysxbVbbjgyFrwVLaA
	f05+H4e+mHcScGYbH1O90neLp2jcz1RYPQ3WMAbNA
X-Gm-Gg: AR+sD12NO9+sazEC4domt5xoNAwI0q79rzRJzuytNzSFsclXDW/umaAi8rJ2yU407oW
	IIjrX+BLxtYbi/1k7fDCcfzr28TQgFe9VQwXj2K1s7d6i0Q9LjR918o5OWgIcDpGvu7fo8MJYJG
	1m8aWdvCm53dg2+4XcsG++GL7ym0Xo6Sf/h2LuE6H+Zpa6nIM4eezh8UjPyTSgt1PjQyjBTKz4f
	a1uqiD4xun3fDL+gTfulLxybEejF8VDV3S31bmj3uWbhygyEK6Ft9ssnZ34qbNTHA4H5QGUq5c9
	pLdIdYQyij+XMULhMI6o+oZOc83iFBMhoDrj8BxXpLF7oJoHQXK3b6s32brd9qWucXM+/XkdrK0
	H
X-Received: by 2002:a05:6a21:10d:b0:3c3:fb32:a004 with SMTP id
 adf61e73a8af0-3c92a7b762fmr14007551637.34.1785857216492; Tue, 04 Aug 2026
 08:26:56 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 4 Aug 2026 08:26:55 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 4 Aug 2026 08:26:55 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <99037993-ee13-4160-8c87-b6642faea554@kernel.org>
References: <20260728-gmem-inplace-conversion-v9-0-35f9aec2aed2@google.com>
 <20260728-gmem-inplace-conversion-v9-14-35f9aec2aed2@google.com>
 <4460e252-b6de-4df3-bea8-0368a9d0f4ff@kernel.org> <CAEvNRgEUQSju2tW_1zMk2=QmveZNtmkjjCZdqVBgBD2JPh0k4Q@mail.gmail.com>
 <a823e3d2-8acf-49d9-a812-ac1bb2136d7f@kernel.org> <edc3566b-370c-41a0-a71d-2e4a0e1a94f7@kernel.org>
 <CAEvNRgEas_9BEV-cNxXu4_wQx8sR2M4_OaW6DEd4=fszALMV0w@mail.gmail.com>
 <60552bee-3326-4917-b00f-5fb7ba3b8adb@kernel.org> <be77c2cb-6e41-4382-9d2f-cd299f634196@kernel.org>
 <anCtzQrUkFSSq8De@google.com> <99037993-ee13-4160-8c87-b6642faea554@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Tue, 4 Aug 2026 08:26:55 -0700
X-Gm-Features: AUfX_mw3K43XW2l_796XUZJmj5MHabkxfpPYa5bbOl_mkX2g5tRDzjfPiVyB1Lg
Message-ID: <CAEvNRgHYhKACDfx9ZZy4a-TTS4yWzEJt=Jc92=eXxS15LPnTYg@mail.gmail.com>
Subject: Re: [PATCH v9 14/41] mm: swap: Introduce lru_add_drain_progressive()
To: "David Hildenbrand (Arm)" <david@kernel.org>, Sean Christopherson <seanjc@google.com>
Cc: aik@amd.com, andrew.jones@linux.dev, binbin.wu@linux.intel.com, 
	brauner@kernel.org, chao.p.peng@linux.intel.com, jmattson@google.com, 
	jthoughton@google.com, michael.roth@amd.com, oupton@kernel.org, 
	pankaj.gupta@amd.com, qperret@google.com, rick.p.edgecombe@intel.com, 
	rientjes@google.com, shivankg@amd.com, steven.price@arm.com, tabba@google.com, 
	willy@infradead.org, wyihan@google.com, yan.y.zhao@intel.com, 
	forkloop@google.com, pratyush@kernel.org, suzuki.poulose@arm.com, 
	aneesh.kumar@kernel.org, liam@infradead.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
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
	Vlastimil Babka <vbabka@kernel.org>, "hughd@google.com" <hughd@google.com>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-mm@kvack.org, linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

"David Hildenbrand (Arm)" <david@kernel.org> writes:

> On 8/3/26 17:03, Sean Christopherson wrote:
>> On Fri, Jul 31, 2026, David Hildenbrand (Arm) wrote:
>>> I sent a fix for the GUP code that always makes us drain right now:
>>>
>>> https://lore.kernel.org/r/20260731-check_and_migrate_movable_folios-v1-1-e0002d7b791e@kernel.org
>>>
>>> Would the following (agains mm-unstable + fix) work for you?
>>>
>>>
>>> I assume that you'd have to call it as
>>>
>>> 	lru_cache_drain_for_folio(folio, 0, NULL);
>>>
>>> But maybe there are indeed extra references that are not reflected in
>>> folio_expected_ref_count() that you would have to consider? I doubt it, but please check if
>>> there would be a problem.
>>>
>>> There is a small problem for merging:
>>>
>>> (1) The patch depends on the fix.
>>>
>>> (2) mm/swap.c was moved to mm/folio.c in the mm tree.
>>>
>>> We could write what I have below against Linus' tree and have the conflict be
>>> resolved when merging. Topic branches are unfortunately not yet a thing in MM
>>> land.
>>
>> Are you expecting the aforementioned fix to land in 7.2, 7.3, or 7.4?  If it's
>
> Andrew wants to give it some more time in -next, so I'm expecting it to land for 7.3.
>
>> 7.2 or 7.3, then I would strongly prefer to base v10 on linux-next (where the fix
>> will presumably land soonish), and target 7.4 for in-place conversion. Then v10> can be applied against an early 7.3-rcN and we don't need to juggle branches
>> (assuming Andrew is ok taking the proposed patch through the KVM tree).
>
> Agreed. We'd also have to get the actual preparation patch into 7.3. I can send it out
> and coordinate with Andrew.
>

Thank you!

When we were discussing this earlier at guest_memfd biweekly, before
deciding to refactor out a function like lru_cache_drain_for_folio(), we
did say that the likelihood of actually draining in practice is low,
especially on a machine with heavy load making allocations all the time.

I think the threads with Xiaoyao have resolved, I can put v10 out
tomorrow. Would it be okay to go with the following from v8, and then
clean up later when lru_cache_drain_for_folio() is available?

I added in David's suggestions to check for dma pinning and mapping
before draining to trim cases where draining happens in the version
below:

static bool kvm_gmem_is_safe_for_conversion(struct inode *inode, pgoff_t start,
					    size_t nr_pages, pgoff_t *err_index)
{
	struct address_space *mapping = inode->i_mapping;
	const int filemap_get_folios_refcount = 1;
	pgoff_t last = start + nr_pages - 1;
	struct folio_batch fbatch;
	bool lru_drained = false;
	bool safe = true;
	pgoff_t next;
	int i;

	folio_batch_init(&fbatch);

	next = start;
	while (safe && filemap_get_folios(mapping, &next, last, &fbatch)) {

		for (i = 0; i < folio_batch_count(&fbatch);) {
			struct folio *folio = fbatch.folios[i];

			safe = (folio_ref_count(folio) ==
				folio_nr_pages(folio) +
				filemap_get_folios_refcount);

			if (safe) {
				++i;
			} else if (!lru_drained &&
				   folio_may_be_lru_cached(folio) &&
				   !folio_maybe_dma_pinned(folio) &&
				   !folio_mapped(folio)) {
				lru_add_drain_all();
				lru_drained = true;
			} else {
				*err_index = max(start, folio->index);
				break;
			}
		}

		folio_batch_release(&fbatch);
		cond_resched();
	}

	return safe;
}

I'm hoping not to push this back by a full cycle to 7.4, and also hold
back other series dependent on this one.

> --
> Cheers,
>
> David
