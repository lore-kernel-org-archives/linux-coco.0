Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36237296BD3
	for <linux-coco@lists.linux.dev>; Mon, 17 Aug 2026 13:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786974776; cv=pass; b=OWyNEuj8sUTyqX2TM5KTWg/a9bBBwnvg8DvE953LmshlexcqGRbniTgTbKLectM2YNo0cTVMT9hUIOkwAG8oS0fmEVsT1ehaCCXe0VO5A4q68pO618mZanZoxmOq1IRP0BR7aDJCRh4uY8JLPXGmCErMVTQzRVpMjr0H9cG7zZQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786974776; c=relaxed/simple;
	bh=/NIweOu34CW2pFg29jrI6uvH5WNUNRSHaH/sZYONA68=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e6Q07AJNJNYLvIpnvMBWAyaU95gyQz635J0Jt7fwgotMaTXuUt86bVjNbHSgbF7g6avyPB/6GP94Dm+1Oy1iOZxg/saUq9GGYDuKRY8/DkUcGtBaNCxIqJcFqb2kQoY+KqQp1RJsLXeFZUCM/CEmp7eNH3swY+6i5rFCoxE0gMo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cL78+Wi/; arc=pass smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cL78+Wi/"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-38dcbade417so3442864a91.1
        for <linux-coco@lists.linux.dev>; Mon, 17 Aug 2026 06:52:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786974769; cv=none;
        d=google.com; s=arc-20260327;
        b=AO90avLo4LpZmEnGBTzxx+S/ptoQ8AZQhhjpKZCai2gZGfKY1vnQ/5L3eE38VY67kV
         IbNSP7sxfENpCrPLllj0mdxhKv1YRmLU3U3+zJi2s4OZyMUKjWpO8Ngem0ZZH3NNy2Nk
         UowXSrAkxgfTGXGgBAHID6b8Nwy1vc3S78DETnXZ49XNG37O3PhUW0AQNFTZ0DWouGiK
         hVmghnSdg5OTaNP/ZUNZP7uJyRGZs8zpZvlCkJ7rK5+P3XFqUIv47KMNsTGsRJruKiAT
         fZFh8entVsfF7r8HLut8rPec5Koc4FSbTIT1YaXVzLbMLOphvTYj7bjgJCyzyyOaHYgj
         dCEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=IX1KvI43fNPQ1XsnxDVHr/UZAXUksiAOakXpX5TJKNw=;
        fh=qIJAm/wgRO+ac5oZhSX6I0i94S8AWqU41G4zawIWkFU=;
        b=pUjImAA4Bl7KMT9njzdVUocxZaQMgUD5bupR8125mhhwwR79sG6V1EORyL5GX/HDWo
         Q6j4gshQazU0x81PaGvqV8kb8sHxVFLw9Pz/Y0m/BB3HppOoJNKmG9aOzd8SPumVUYu+
         TJtNn6feHaC/4nA2PniEy6DoIULPpo4QHnP67sXkkAr0+bHFnG+BkhvFh34oQOtOM+Ew
         F95On09CORvdgKj8ZmKQ3FFIOwXh7o08WEI+ZMtKY2CkVyQeQ1aZeapZU5PEEAC4gHJ4
         DDgRxtmnskW7Pa1b9zBmAoLmh2S9MPzh9J0oWz4Uv64GCH7GKDDt4hEpvlsH79I/a0rM
         j2TA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786974769; x=1787579569; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IX1KvI43fNPQ1XsnxDVHr/UZAXUksiAOakXpX5TJKNw=;
        b=cL78+Wi/wzSfVdFlo9UMKoPBG0kHOYVHTlMSnTUd25eUeLW8963G6NWBlh6JyLDDE3
         VmngWLO1u6K1b8JdyjdBynNLNkmmQl8kinVasyas/7LxOBc6q8bxOL3K0B/n/cQ54d5s
         LtlEQBjDedSDsoxmpA1hzqiLeqkeCPuuc5aFEesml9+dksMUaYn04QUOXxCF167gZ3X4
         S44O001X1jlp9/wZMR0KrB5/l1p7Qom/pE4o2DsGiEgy8VPzhH0XrLyYtIZVnuMH1BQU
         vKbnS+UyNzaXqYeFnYq3a1taQUTxuFZo7+tTagmxJNvYLsnqWLaol1jiUSJsXI2iFyOQ
         pgTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786974769; x=1787579569;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IX1KvI43fNPQ1XsnxDVHr/UZAXUksiAOakXpX5TJKNw=;
        b=C/OYncUK6BNKni3+NkVdHD/OFD3gDAKTTR6PauAwYovqRf6tR4k/tSPjyhrixrdPed
         6MgkjkPUMlH2AlDZDmdBLqZA0IbklV34Te/zodKHin7yrUwYmAHENJAlwHcehZTVJfuh
         C+L6qOtDeHmQ9tpRO53H7gPOgpR9zldyb13TPze+b3yZWsF/SZmPAz48mMYlmZHVuFcc
         eMomorVKgqu45TrplTfOREwj+RsRmslhyR4o53OS3/802xPuuJSmk48ZZ7QBauIgDIC4
         1LCA5L64KNVH3X+ahOdotl5Tgpb4NLxdKJkeeDaRZjzCaUMp0SghKjh3cD4pVvMi6x3u
         x4oA==
X-Forwarded-Encrypted: i=1; AHgh+Rq7f5fU7yvUB1L3Rg5bUkxE12aDVdynLAB8LpbqKrEChl1345STZ6yqcp6dtQfpLXQPTHyP0s70zwAd@lists.linux.dev
X-Gm-Message-State: AOJu0YzPtsX95gNdYwfuKNNVarmKmK0HSQHY0wr6qTLRiBH/7dUKhlBX
	6a14NWMlODy09XWiB7tvXdOmMgIx3AjMSzubLUYuT8KN2Ip33eqRCvLq6rHSvEDh7QmFqWlqD68
	Mhljw476Ax1XXBkqQntaD5DALBpO/7D3S15Izadis
X-Gm-Gg: AR+sD12qDSHcjJO2frvgtg9l44wlMgNHvhKTNPaoZ0wfTi2XN81bZ/iPf/gUi5IYGFL
	7RINl5tGWeTotd4gXImomtYhZC4kyO91FAHV+dzMRKnduUdZe1dm3ilCoUeiFqZzGsHXQ8wO2xZ
	pD1w0l8ul2X9MaUtgNHslOJ31lIRdcON+hC+CvOKksFftzqmUyrVU8ycUpMO5U91u6bEPi3aPZb
	G3TeNtb28RTmzjekMBXvYmdpmbaCh7d3VfhwjwW2vbYeDOFOPHpyzfsSKq2rFcvurIDi06LdJc1
	j24w9kWf3eKjEnPFBwGT4gXZ0dnHRWeteS7lfX+esJJSuvD1nz5Q3JQErTYiTLc+cZ5bVFcbErU
	=
X-Received: by 2002:a17:90b:274e:b0:38d:dfd1:7c1 with SMTP id
 98e67ed59e1d1-3955a3dd549mr974362a91.2.1786974768174; Mon, 17 Aug 2026
 06:52:48 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 17 Aug 2026 06:52:47 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 17 Aug 2026 06:52:47 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <befe73e1-3287-440e-90de-6c62f6c19d47@intel.com>
References: <20260722-tdx-selftests-v14-0-15ad654a50db@google.com>
 <20260722-tdx-selftests-v14-18-15ad654a50db@google.com> <befe73e1-3287-440e-90de-6c62f6c19d47@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Mon, 17 Aug 2026 06:52:47 -0700
X-Gm-Features: AcwNN1UHGhzK4sYy5HwqSRuK05tzBOG6iD052SVLEabdQ5BbvTOapBvBVGicZOU
Message-ID: <CAEvNRgH00s3NWUH8EGUZq3WWweboBcUaTZs_0Cye5D=3o0OALQ@mail.gmail.com>
Subject: Re: [PATCH v14 18/22] KVM: selftests: Add helpers to init TDX memory
 and finalize VM
To: Xiaoyao Li <xiaoyao.li@intel.com>, Lisa Wang <wyihan@google.com>, 
	Andrew Jones <ajones@ventanamicro.com>, Binbin Wu <binbin.wu@linux.intel.com>, 
	Chao Gao <chao.gao@intel.com>, Chenyi Qiang <chenyi.qiang@intel.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Erdem Aktas <erdemaktas@google.com>, 
	Ira Weiny <ira.weiny@intel.com>, Isaku Yamahata <isaku.yamahata@intel.com>, 
	Kiryl Shutsemau <kas@kernel.org>, linux-kselftest@vger.kernel.org, 
	Paolo Bonzini <pbonzini@redhat.com>, "Pratik R. Sampat" <pratikrajesh.sampat@amd.com>, 
	Reinette Chatre <reinette.chatre@intel.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	Roger Wang <runanwang@google.com>, Ryan Afranji <afranji@google.com>, 
	Sagi Shahar <sagis@google.com>, Sean Christopherson <seanjc@google.com>, Shuah Khan <shuah@kernel.org>, 
	Oliver Upton <oupton@kernel.org>
Cc: Jeremiah McReynolds <jmcrey@google.com>, kvm@vger.kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"

Xiaoyao Li <xiaoyao.li@intel.com> writes:

>
> [...snip...]
>
>> +static void tdx_load_private_memory(struct kvm_vm *vm)
>> +{
>> +	struct userspace_mem_region *region;
>> +	int ctr;
>> +
>> +	hash_for_each(vm->regions.slot_hash, ctr, region, slot_node) {
>> +		const struct sparsebit *protected_pages = region->protected_phy_pages;
>> +		const gpa_t gpa_base = region->region.guest_phys_addr;
>> +		const u64 hva_base = region->region.userspace_addr;
>> +		const sparsebit_idx_t lowest_page_in_region = gpa_base >> vm->page_shift;
>> +		void *source_pages = NULL;
>> +		sparsebit_idx_t i, j;
>> +
>> +		if (!sparsebit_any_set(protected_pages))
>
> sparebit_any_set() doens't check if the input is NULL. So we need to
> check it here.
>
>> +			continue;
>> +
>> +		TEST_ASSERT(region->region.guest_memfd != -1,
>> +			    "TD private memory must be backed by guest_memfd");
>> +
>> +		sparsebit_for_each_set_range(protected_pages, i, j) {
>> +			const u64 size_to_load = (j - i + 1) * vm->page_size;
>> +			const u64 offset =
>> +				(i - lowest_page_in_region) * vm->page_size;
>> +			const u64 hva = hva_base + offset;
>> +			const u64 gpa = gpa_base + offset;
>> +
>> +			if (!kvm_has_gmem_attributes)
>> +				source_pages = (void *)hva;
>> +
>
>> +			vm_mem_set_private(vm, gpa, size_to_load);
>
> So vm_mem_set_private() has to be called at this late stage when run
> with in-place gmem. But for non in-place gmem, we can actually call
> vm_mem_set_private() in __vm_phy_pages_alloc().
>
> Calling vm_mem_set_private() here instead of in __vm_phy_pages_alloc()
> looks like a trick to me.

I thought this is fine because __vm_phy_pages_alloc() seems to be a
rather low-level function, where the responsibility of the function is
just to allocate (for find some physical pages). Calling
vm_mem_set_private() in there seems to be doing too much.

> That is, we cannot set the page as private
> when allocating a guest physical page as protected because if doing so,
> we cannot write the initial content to it.
>

I think calling it here isn't a trick, it's a good way to reuse all the
existing code that builds up the guest image in place. In-place
conversion allows you to set stuff up in shared memory and then convert
everything when you're done and also populate the memory.

> This is the topic about how to implement the infras for in-place gmem,
> not the issue of this series. Let me go read the selftest patches of
> gmem in-place series and we can discuss there.
>
>> +			tdx_init_mem_region(vm, source_pages, gpa, size_to_load);
>> +		}
>> +	}
>> +}
>> +
>> +void tdx_vm_finalize(struct kvm_vm *vm)
>> +{
>> +	tdx_load_private_memory(vm);
>> +	tdx_vm_ioctl(vm, KVM_TDX_FINALIZE_VM, 0, NULL);
>> +}
>>
