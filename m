Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4378C436BE6
	for <linux-coco@lists.linux.dev>; Mon,  6 Jul 2026 18:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783361864; cv=pass; b=KZoxuLnmCA9eTN1jcNSoyau9RAi76mhGhNsoyO8YqUMiszBKdyDZ/WP+DcF3bg+LJ5457l4KpSPNz+JOCaXA10BiQXO8dmfrjsORraolgQ7uRkLp0p7Y+LszXpZjCY2GncX90sGLU1K+iCdjegJNM7aIlY01JLw9ggrYa/RI1RE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783361864; c=relaxed/simple;
	bh=qof4S+F17VBSSA1zaUR6umxTYpxJBd4EYxHTZo5RHIU=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lyUMHq77WO9XW7L334ZxiWNhogpz0FKXl6yZJeUlgILB74RBQy5ZQnpPPBucEijUfrAAik8pATw2SbXB7EeiwDPGdWrUEvyr56YLjmvglTadPR1gJl5q789P9qBCNpCyQyWvnHCexZ1H2jxCI7acI/y0P4W7WmsV5OXIoPMg7gw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VDtqCzK7; arc=pass smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VDtqCzK7"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-c9fe3c9bd5fso81832a12.0
        for <linux-coco@lists.linux.dev>; Mon, 06 Jul 2026 11:17:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783361862; cv=none;
        d=google.com; s=arc-20260327;
        b=MPJpvraUmLLANUssBLU7tuODJBYvaIGkSQU7dpLSmifOUuQgHRFVwO2lSuf7dFkAca
         uj3k+Skr234m/cEOnUD829YUXgOqO3iVfXGP22wwQQn5oVC1AuvURU6pe4OzAGgw4XOE
         iVtR2+DEnAHEUHD4s0nV+Ii79r1Wea9pCDGAuGDM12NJzCwLR49pdhrqppCIqQsz+tmZ
         OSTOg0Axm4NwHIovSPaHNmEzZVVLQ4/NjCVQEvfEGa3a0OX5OTaTWKHgxgRe6FjlDTMZ
         ue//CnX108PuUnbYUVGJ7sGQ1YhmOj3uzCOS1TPCmvIDirjGdDpRs/rzpLcknrm8WlN8
         +tfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=c+wxJ1Yd1HSbDSoQd0ZgV/xzQAnAHKSd8sgBz4R4ZFc=;
        fh=CpChrJsjiQgvuMymxs5NvlG+bZdtnoqafL8PmIKJHrQ=;
        b=n6t6NpwM2bSlH70iHSFkEQiqPK6nk7kinUp59WUOJKte31iJEnX2+0JvQzxfL+vmiJ
         bTGa9ZmBYYu/RRZ8rEmuTadKWLkQZ5vTsjlF1yjFvWr8kb84eL1WMt0MMcZtD9sbVv5W
         XWnqEFwbIqIPTxFL2WQ8p9QyjClNLOt5tu8cxuZXzooDqLgOm9mnbnx4OdI2v+1w8qGG
         3hCDTq91IKGQv994vXnrIsNl1VHXuoJIKPtnGpkGzKRST4r9WdbvTnwxUXlJmQTB3N/E
         tlObQsLkkjIGFbYAZy5UAM1LTqTF4jSUmjNU3LVn8XIPGWZXsMDiPJ9UQHgwf9WBItKa
         1VGA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783361862; x=1783966662; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=c+wxJ1Yd1HSbDSoQd0ZgV/xzQAnAHKSd8sgBz4R4ZFc=;
        b=VDtqCzK7nAunYLaq/qrA5gaYxs7HRxLpalWY6ipBzbYt0iAkQgWfEPil4tj3zhkx8b
         5gHRgaVjptj/yGJrFjDiEs/kLRY9g55fLrggEibPrx4NliRVXJ4QJrUbLiIPF7+SWEcB
         WKnhnwr9x8CDl22vjVqZiZu+mBUelfKJSu7MPAMAK7DCfrkhqfdF5hSwA88kt0yClbfk
         7NNj8nQK+S0T0gireigUlOPAneqGUAO0rLXqy8KXIt7N5YUKM4b64MLsn1HiB2EbLL1U
         nRoII8CQu81SJieIssIDvSyg71egGpUw7oDYz4aNP4Y61JYT8in5/lQycU4atOYkR0a/
         QHbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783361862; x=1783966662;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c+wxJ1Yd1HSbDSoQd0ZgV/xzQAnAHKSd8sgBz4R4ZFc=;
        b=KXtn3PxXi/UcMNHa69liEHHzkzuldmhjxbfe2Zz0/Bd3aPCv+KUHZ6gTKA+8m4HV4w
         rBVJkRFr6XXvuYArS4eyKe5c1NyOgTuV/s+SyT+2cIO6K8YQiNLfPCH8vvghBG0On7zN
         jFJBEr0DrecQb4M9Ww6R3uISg/tGENuxz+vFZvYTLTjsJ100uvZBtgW3yxrd8D9ysWHh
         doWNaCfHuZQNQ12LjywJ1aJvf6ZFne9bMWr5/wBROcAzWlZOS8NGKvLC6D/dmh53hJhY
         g68fp3AHwEOw9wJMXu0+Xs6yTdrP8vvn2LW/COEtMOfxhxedFV31EANVYHlduTW6ddfJ
         2ntA==
X-Forwarded-Encrypted: i=1; AHgh+Rp6iaVyXyJcmwZ8fRpbEbR0+pttmnf0R/A1+mHC7ZDzC6ox+6BV+j35L/8NSgbh0KBBk007aPffmARc@lists.linux.dev
X-Gm-Message-State: AOJu0YxCehqz6CSsU6fD73j0wSadZrmrkYOK/qYniFRFg8Tmdv6SDNxH
	oHIC3tDnPxg1rNwQy50Sr3hyCHg+SrdMpYI3TlnXMtuUE7v58chi9ClgDMmqj4CN2pV0gAo6pxO
	E7OS/MIiABKuZLX04Sd6dLC/ZsarTY7cJhKhj8BNU
X-Gm-Gg: AfdE7cmni/MJk4z+ojG9KwAi3/Dt53Vg+ROgNbLWJnmn6SnB87/XNXC2WLLYUh4Dlfu
	oYrdlobymlPRqm6WP1V2mWlA0XRbge6rnjzSAAJf8tkbk6i6pxVsKsVQbnxCezoWRvSZjA4O378
	m3Sex8Dc+FmC7AWLmj3uSqu70vWzxduXOHiW9RAsSvEsKVanXYn7NP3hgpS8MoHTZgkjrZP3W+e
	cnZ+FurGlC9YWgIVNqGBLmdFXJjPM7X/xqKbJVF1RgaNuw9X7VlJBctPdtJfTry7JeHrGIZ+H4o
	AuVH9aBX1yfje6fr44pUC8ocmtAPoIBw5/aV0KcS2hE5QGLMYU1GoAWQqL00QfGxSKKsKA==
X-Received: by 2002:a05:6a21:6906:b0:3bf:79b5:ebdb with SMTP id
 adf61e73a8af0-3c01caab306mr16907533637.21.1783361861894; Mon, 06 Jul 2026
 11:17:41 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 6 Jul 2026 11:17:40 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 6 Jul 2026 11:17:40 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <114e2488-97ed-4740-a8e8-1edd991f26c5@arm.com>
References: <20260618-gmem-inplace-conversion-v8-0-9d2959357853@google.com>
 <20260618-gmem-inplace-conversion-v8-13-9d2959357853@google.com> <114e2488-97ed-4740-a8e8-1edd991f26c5@arm.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Mon, 6 Jul 2026 11:17:40 -0700
X-Gm-Features: AVVi8CeLpju1khujHSRbueqIxtdXRIsffiKvTI6S-exNvUblyDgAMTgWeujtT7w
Message-ID: <CAEvNRgFKbKfTMkqh_XF-igm07qYWfRwYJ5SH7wHcLZnqesCzTw@mail.gmail.com>
Subject: Re: [PATCH v8 13/46] KVM: guest_memfd: Add base support for KVM_SET_MEMORY_ATTRIBUTES2
To: Suzuki K Poulose <suzuki.poulose@arm.com>, aik@amd.com, andrew.jones@linux.dev, 
	binbin.wu@linux.intel.com, brauner@kernel.org, chao.p.peng@linux.intel.com, 
	david@kernel.org, jmattson@google.com, jthoughton@google.com, 
	michael.roth@amd.com, oupton@kernel.org, pankaj.gupta@amd.com, 
	qperret@google.com, rick.p.edgecombe@intel.com, rientjes@google.com, 
	shivankg@amd.com, steven.price@arm.com, tabba@google.com, willy@infradead.org, 
	wyihan@google.com, yan.y.zhao@intel.com, forkloop@google.com, 
	pratyush@kernel.org, aneesh.kumar@kernel.org, liam@infradead.org, 
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
	Vlastimil Babka <vbabka@kernel.org>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Suzuki K Poulose <suzuki.poulose@arm.com> writes:

>
> [...snip...]
>
>> +static int __kvm_gmem_set_attributes(struct inode *inode, pgoff_t start,
>> +				     size_t nr_pages, uint64_t attrs)
>> +{
>> +	struct address_space *mapping = inode->i_mapping;
>> +	struct gmem_inode *gi = GMEM_I(inode);
>> +	pgoff_t end = start + nr_pages;
>> +	struct maple_tree *mt;
>> +	struct ma_state mas;
>> +	int r;
>> +
>> +	mt = &gi->attributes;
>> +
>> +	filemap_invalidate_lock(mapping);
>> +
>> +	mas_init(&mas, mt, start);
>> +	r = kvm_gmem_mas_preallocate(&mas, attrs, start, nr_pages);
>> +	if (r)
>> +		goto out;
>> +
>> +	/*
>> +	 * From this point on guest_memfd has performed necessary
>> +	 * checks and can proceed to do guest-breaking changes.
>> +	 */
>> +
>> +	kvm_gmem_invalidate_start(inode, start, end);
>
> I added support for Arm CCA KVM patches with the inplace conversion and
> I am hitting the following issue.
>
> 1. I am supporting INIT_SHARED + MMAP flags.
> 2. VMM creates the Gmem_fd with both the flags above.
> 3. Uses the shared gmem-mmap to load the initial payloads (kernel, dtb).
> 4. At the VM finalization time, Populate the loaded regions one by one
>     by
>      a) copying the images to a temparory buffer - Since CCA can't really
>         load the contents in-place.

Sounds good :). I see that you blocked this in the kernel by returning
-EOPNOTSUPP if (!src_page) [0].

>      b) Set the "region" to Private in the gmem_fd (via
> SET_MEMORY_ATTRIBUTES2)
>      c) Invoke CCA backend to populate the private memory via
>         ioctl(KVM_ARM_RMI_POPULATE,..) [0]
>

This flow sounds right.

> [0]
> https://lore.kernel.org/all/20260513131757.116630-27-steven.price@arm.com/
>
>
> 5. Additionally, VMM can mark the entire RAM to be private before the VM
>     starts running, again via SET_MEMORY_ATTRIBUTES2. On CCA, this
> action is measured and doesn't require the Host to "commit" memory to
> the VM.
> Instead the host can lazily donate memory on a fault.
>

For both TDX and SNP, the host can also lazily donate memory,
guest_memfd supports this.

> But step (5) triggers the invalidation of both private and shared
> mappings of the gmem area, from the kvm_gmem_invalidate_start()
> above.
>
> This is because, the entire DRAM now has, some portions PRIVATE (the
> loaded regions) and the rest are SHARED (from the Gmem_fd creation).
>   Thus, kvm_gmem_get_invalidate_filter(Dram_start, Dram_end) causes the
> invalidation of both "PRIVATE" and "SHARED" regions, which results
> in the destruction of the already loaded data and things go south.
>

This destruction will happen for TDX as well. I think we managed to get
around this because we didn't apply conversion on the already-private
ranges.

IIUC on SNP, zapping pages in the stage 2 page tables doesn't destroy
the data, so that's probably why it has been fine for SNP.

> When we know that the kvm_gmem_invalidate_xx is triggered by a
> conversion, we don't need to invalidate the existing pages that
> are in the requested state. i.e., the following patch on top of
> this series does the trick for me :
>
>
> diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
> index a97fcac34a0e..62e0427a49f4 100644
> --- a/virt/kvm/guest_memfd.c
> +++ b/virt/kvm/guest_memfd.c
> @@ -250,16 +250,23 @@ static void __kvm_gmem_invalidate_start(struct
> gmem_file *f, pgoff_t start,
>                  KVM_MMU_UNLOCK(kvm);
>   }
>
> +static void kvm_gmem_invalidate_start_filter(struct inode *inode,
> pgoff_t start,
> +                                            pgoff_t end,
> +                                            enum kvm_gfn_range_filter
> attr_filter)
> +{
> +       struct gmem_file *f;
> +
> +       kvm_gmem_for_each_file(f, inode)
> +               __kvm_gmem_invalidate_start(f, start, end, attr_filter);
> +}
> +
>   static void kvm_gmem_invalidate_start(struct inode *inode, pgoff_t start,
>                                        pgoff_t end)
>   {
>          enum kvm_gfn_range_filter attr_filter;
> -       struct gmem_file *f;
> -
>          attr_filter = kvm_gmem_get_invalidate_filter(inode, start, end);
>
> -       kvm_gmem_for_each_file(f, inode)
> -               __kvm_gmem_invalidate_start(f, start, end, attr_filter);
> +       kvm_gmem_invalidate_start_filter(inode, start, end, attr_filter);
>   }
>
>   static void __kvm_gmem_invalidate_end(struct gmem_file *f, pgoff_t start,
> @@ -724,9 +731,14 @@ static int __kvm_gmem_set_attributes(struct inode
> *inode, pgoff_t start,
>          /*
>           * From this point on guest_memfd has performed necessary
>           * checks and can proceed to do guest-breaking changes.
> +        * Also, we don't have to invalidate the regions that
> +        * may already be in the requested state. Hence, we could
> +        * explicitly filter the invalidations to the opposite
> +        * state.
>           */
>
> -       kvm_gmem_invalidate_start(inode, start, end);
> +       kvm_gmem_invalidate_start_filter(inode, start, end,
> +                                       to_private ? KVM_FILTER_SHARED :
> KVM_FILTER_PRIVATE);
>

I think this makes sense. Thanks for catching this.

>          if (!to_private)
>                  kvm_gmem_invalidate(inode, start, end);
>
>
> Thoughts ?
>
> Suzuki
>
>
>>
>> [...snip...]
>>
