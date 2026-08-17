Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A74A362153
	for <linux-coco@lists.linux.dev>; Mon, 17 Aug 2026 20:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786997765; cv=none; b=Y4oPAKE0evmk1G6tVeuCvjNiJabJugzUWHOnUIpIvJEpXwuoINY4sE7iAc4AAlb/Ah26fugylCGuRTHPE1BpexzRyeNTS+KAf7E61pX5m99tazRe4RVidaFmE9tdEUCX4qd9GmQAU7/cAwzmfg0XeRTXmJOgGU5YJlaVvTAN3gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786997765; c=relaxed/simple;
	bh=96dbgiVKcPgmawUI6sGTdHoa9bVbE5/KNwSLUHv2lOM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Za+x5O2v9NKuPcMFSIB8ENNpTWHzlOalZkNOLnC6G9mWwKsUFAU83GGjChWb3gfHBPXhRBQYxCjqGEIEEgpekiRhX6uIBGA2b1JTlVMiX8op546EG+cf6JGija3l1xDwD7ia12bm1C6jCXjiiNkI9I4MRvJSGn1sEFt0lfKfPMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HDGXGouo; arc=none smtp.client-ip=209.85.210.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HDGXGouo"
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8484b9fb055so8761187b3a.0
        for <linux-coco@lists.linux.dev>; Mon, 17 Aug 2026 13:16:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786997763; x=1787602563; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wIaLcIcx0/JCu0rIvBOyaVIEo2fmoa+vo14Zh85W4qc=;
        b=HDGXGouoh73UcPpmatI5lODusNkb++/yniZ1jDPNhUwTLVvjUAG0kjKovTdKq1Vt1W
         7Lk1b+606FRtBayZx8bleAzrxewYqQgWJqIDEAaWBSgIOcgsKzqr/tDoL8ByCct9ZQFs
         UGLaVrSIS53xHv1zWKQG1ARcWW2rHX80bD980LzQhnIrhw47e/V7JvlpvXFgFbTUZKMx
         waD9kPLBZOmPyd8+r07CXBTsEDCON15HA53q2Co4BoTNf2Z3CUDaQQhudJ4DTdgaBpJp
         GPPMtT13gnEQ36v3QzydL/ezZOUex+2rKPziSyzpzWZ24TnRHGgEugFuaaM39yKCLnuu
         QGpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786997763; x=1787602563;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wIaLcIcx0/JCu0rIvBOyaVIEo2fmoa+vo14Zh85W4qc=;
        b=VwBNlGQyozB/jtmTNwJ8NDX1fo3Vg0t3auSINPfw3ZT5AM5y8f8P5oRFe4BP9f7xKm
         I8wcTxV1LYdRy97FQ60ZvbVrQgvCKh1JmvhohJhXMabhB1bmUrSER1L0nCXDQsNf+4iX
         FKDyA+NsLW3Cu5K4yMnbxMg8rGB/cIdgu88b7KTYqK7FNGPTnuCwOIF5Dh9t4wqJRV34
         Nt8163AFlGUsa7Fxx4Qn53wHRGy6Qk8DISRVcQ8yltHRtR/IykKBRlL/p1lYxPtE2q+I
         exynhu3QdSK2RxgNY43CCqJuxxzHZVd8mKPEjh9oS4Dyd9aBEVmntbf9A+u2ZNkV/RxE
         pZ2A==
X-Forwarded-Encrypted: i=1; AHgh+RrZUBmQ/YXQJ91oMqoowIFeI9gAv2TzfCkMphwcQUz24zEpuS87G4vw/fVOwiB7BW8PzYfVwkZP3i0V@lists.linux.dev
X-Gm-Message-State: AOJu0Yxz5+A0x9Sj0t3jUbyzP28tAa099WVuVyXOOjr2NEhwvCpiXiaa
	LqrJzwDV7LH/3mZAHWnVJ+afEt9yIILmjHI/EvAgwIWwb93MO1mfx6LqoNmrDqGaNwkLT6lLb7X
	l3AFW6A==
X-Received: from pfh39.prod.google.com ([2002:a05:6a00:12e7:b0:84e:24a3:b91c])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:3016:b0:848:5540:2377
 with SMTP id d2e1a72fcca58-84fde13600amr27080475b3a.17.1786997762969; Mon, 17
 Aug 2026 13:16:02 -0700 (PDT)
Date: Mon, 17 Aug 2026 13:16:02 -0700
In-Reply-To: <aoNlZRb5SV7hyNuk@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260807-gmem-inplace-conversion-v10-0-2fc18ee6d3ba@google.com>
 <20260807-gmem-inplace-conversion-v10-12-2fc18ee6d3ba@google.com>
 <1ec08cd8-3072-4753-ad5e-cd34956647f8@linux.intel.com> <an3o4h-E8mj6CUaM@google.com>
 <CAEvNRgGpCVCGVjc9jCt9Yr+XypF=71h6eBahkXNkrXhfrtGY+g@mail.gmail.com>
 <an5AcEG9mqDgnBYk@google.com> <CAEvNRgE+05c9U8C=Zkm1S9hLw3Lw6YMmijZhEe7J4rYQAuNyEw@mail.gmail.com>
 <an8umm0qisEidt4n@google.com> <CAEvNRgFNCDDSeuvbwj7pD_d18o1TBXo4TNR2dXHxpm18KPfR5A@mail.gmail.com>
 <aoNlZRb5SV7hyNuk@google.com>
Message-ID: <aoNsAmLSKCuc4v4A@google.com>
Subject: Re: [PATCH v10 12/41] KVM: guest_memfd: Call arch make_shared
 callback for to-shared conversion
From: Sean Christopherson <seanjc@google.com>
To: Ackerley Tng <ackerleytng@google.com>
Cc: Binbin Wu <binbin.wu@linux.intel.com>, aik@amd.com, andrew.jones@linux.dev, 
	brauner@kernel.org, chao.p.peng@linux.intel.com, david@kernel.org, 
	jmattson@google.com, jthoughton@google.com, michael.roth@amd.com, 
	oupton@kernel.org, pankaj.gupta@amd.com, qperret@google.com, 
	rick.p.edgecombe@intel.com, rientjes@google.com, shivankg@amd.com, 
	steven.price@arm.com, tabba@google.com, willy@infradead.org, 
	wyihan@google.com, yan.y.zhao@intel.com, forkloop@google.com, 
	pratyush@kernel.org, suzuki.poulose@arm.com, aneesh.kumar@kernel.org, 
	liam@infradead.org, Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
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
	linux-coco@lists.linux.dev, Fuad Tabba <fuad.tabba@linux.dev>
Content-Type: text/plain; charset="us-ascii"

On Mon, Aug 17, 2026, Sean Christopherson wrote:
> On Sun, Aug 16, 2026, Ackerley Tng wrote:
> > Sean Christopherson <seanjc@google.com> writes:
> > 
> > > On Thu, Aug 13, 2026, Ackerley Tng wrote:
> > >> Sean Christopherson <seanjc@google.com> writes:
> > >> > That's why I think it's worth analyzing the cost: if it's in the
> > >> > noise, leave it alone.  If it's meaningful, figure out a not-too-gross way to skip
> > >> > the entire thing if kvm_arch_gmem_make_shared() is a glorified nop in the end.
> > >>
> > >> Is noise defined relative to the entire conversion process? Would this
> > >> benchmark look like
> > >>
> > >> 1. Convert 4G to shared on TDX with CONFIG_AMD_SEV defined
> > >> 2. Convert 4G to shared on TDX without CONFIG_AMD_SEV defined
> > >>
> > >> and then compare the difference in time taken?
> > >
> > > That'd work, though I was envisioning something even simpler: use rdtsc() to
> > > count the cycles it takes to iterate over various ranges of memory.  Do whatever
> > > is easiest for you though.
> > 
> > I made some changes to add rdtsc() for the conversion process as Sean
> > suggested [1], and exercised conversion like this [2]:
> > 
> > 1. Initialize some memory as private
> > 2. Get the guest to fault them into Secure EPTs
> > 3. Converts the memory to shared <<== this is being benchmarked
> > 4. Converts memory back to private
> > 
> > I made it build the VM once and convert 5 times:
> > 
> > ./gmem_benchmark_tdx_convert --iterations=5 --size=1g
> 
> ...
> 
> > And here's the above, tabulated:
> > 
> >   nr_pages      make_shared            total    percentage
> > ----------  ---------------  ---------------  ------------
> >          1              930            39278       2.3677%
> >          1              252            28060       0.8981%
> >          1              176            26952       0.6530%
> >          1              176            27038       0.6509%
> >          1              176            26980       0.6523%
> >          1             1072            37236       2.8789%
> >          1              316            28338       1.1151%
> >          1              176            27182       0.6475%
> >          1              176            26972       0.6525%
> >          1              176            26886       0.6546%
> >     262144         15041018       6616067680       0.2273%
> >     262144         14937462       6608542680       0.2260%
> >     262144         15138858       6599494898       0.2294%
> >     262144         15721972       6610219850       0.2378%
> >     262144         15000406       6615114540       0.2268%
> >    1048576         61902982      26400884028       0.2345%
> >    1048576         61746114      26401170984       0.2339%
> >    1048576         61096794      26404409058       0.2314%
> >    1048576         61446290      26447461896       0.2323%
> >    1048576         61774646      26444608360       0.2336%
> > 
> > Looks to me it is within noise.
> > 
> > I also actually tried measuring the conversion time from userspace with
> > CONFIG_AMD_SEV enabled and disabled. Converting a 1G-sized TD was faster
> > by 0.2%, which is in line with the above table. Interestingly, when
> > converting a 4G-sized TD, skipping kvm_gmem_make_shared() was _slower_
> > over 2 runs. I don't have an explanation for that.
> 
> Might be some cache/memory locality benefits?  Though with a conversion that big,
> it could also be nothing more than bad luck.
> 
> > I think the code was correct. (If it makes a difference, I skipped
> > kvm_gmem_make_shared() using a custom guest_memfd creation time flag and
> > skipped make_shared if the flag was set on the inode.)
> > 
> > I thought adding a kvm_arch_has_gmem_make_shared(), defaulting it to
> 
> I would do kvm_arch_has_gmem_convert() for consistency with the Kconfigs, and
> because the cost of the reclaim invocation is a non-issue.

Forgot to say "why" I think it's worth adding kvm_arch_has_gmem_convert(): it's
a trivial change in the grand scheme, and I can see the ~1000 cycles of overhead
being problematic in use cases that do many one-off conversions, e.g. for guests
whose shared memory is scattered all over.
