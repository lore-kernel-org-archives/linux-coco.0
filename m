Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19F9E7E
	for <linux-coco@lists.linux.dev>; Wed,  1 Jun 2022 08:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1654073282;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jHxFnf4L5CJt+8ufyNoLjuaskOQrUFWwTAD2sEpLDBg=;
	b=G7jxuBfaMGGL5QcVmkgjdTtMbhRUb8y8lTm7jSuO6tpRPwDxOyHGy6jdh1s8M2+ITWedO8
	RMwfQBZH1O22Oor3HyvAMJH/jvfXANKX6x5yeJ6nj8H4LAoCnzbMZmsLSw5bEjzDKArqB+
	rM1AMqRZmwteBhlGjfXvsy82z2+O2hs=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-13-S2JlMCh2M_2MtxL5bshL_w-1; Wed, 01 Jun 2022 04:48:01 -0400
X-MC-Unique: S2JlMCh2M_2MtxL5bshL_w-1
Received: by mail-wr1-f69.google.com with SMTP id s16-20020adfeb10000000b0020cc4e5e683so139190wrn.6
        for <linux-coco@lists.linux.dev>; Wed, 01 Jun 2022 01:48:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent
         :content-language:to:cc:references:from:organization:subject
         :in-reply-to:content-transfer-encoding;
        bh=jHxFnf4L5CJt+8ufyNoLjuaskOQrUFWwTAD2sEpLDBg=;
        b=EthFOcS2r9aAEzntNiBleUezGGzZieTujpFomKj1drGSPjPcVKmEOQiR9zW9mGWSuD
         2jtooGNDHaQy8hpbLnMjzK1ofHYJghv2yCUbnOgk1iq0SJ/coRyzhwdl1kKANAmC912T
         KqmAcOzxedy6CEawEge5cVpiAoik4JqC5RcaK+Y7g+RTvnE4wHm1IOIBkwz7z/VX3c3z
         ws24oQmwy+HYqz29knHUf3PTbFz6M8Doq/yWYyh1fVd6rH9mawTiuTmCwWgTu7EZsSal
         jOFqW+KoD/+rNRJzOTdtOYGhICj8vC3eSPNXI+X5YJrQuTUC4zD1qKOK1/zjMxb6czRE
         8JEw==
X-Gm-Message-State: AOAM532qzE8LApSP2oEUaiiyeNffXIfbOrFAc9U+Og68PA/Ol+ebMxfQ
	o7VtQCIUcDRQSPNZTuSMDUPGkE3PG83tA7OQYXbMAZ5iAvbWSeBRHjPOhHS9+fB+ATofQMDLI7A
	NFUnkeB9HrewlbSjCtyCEpg==
X-Received: by 2002:adf:d1ea:0:b0:210:3e1f:3ea7 with SMTP id g10-20020adfd1ea000000b002103e1f3ea7mr1996169wrd.595.1654073280673;
        Wed, 01 Jun 2022 01:48:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzuUj4bh0uFZhtOrG4wLRNkxyLjBPGrhqN1jrHdUn8b5DqD5vqVBTnEyWA+4tqxWTRU2sCPCw==
X-Received: by 2002:adf:d1ea:0:b0:210:3e1f:3ea7 with SMTP id g10-20020adfd1ea000000b002103e1f3ea7mr1996126wrd.595.1654073280311;
        Wed, 01 Jun 2022 01:48:00 -0700 (PDT)
Received: from ?IPV6:2003:cb:c705:2600:951d:63df:c091:3b45? (p200300cbc7052600951d63dfc0913b45.dip0.t-ipconnect.de. [2003:cb:c705:2600:951d:63df:c091:3b45])
        by smtp.gmail.com with ESMTPSA id a13-20020a5d456d000000b0021024f82e01sm948294wrc.16.2022.06.01.01.47.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jun 2022 01:47:59 -0700 (PDT)
Message-ID: <f7e1d9e3-e4ba-8763-5db7-eca972c64fa4@redhat.com>
Date: Wed, 1 Jun 2022 10:47:57 +0200
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 Sean Christopherson <seanjc@google.com>,
 Andrew Morton <akpm@linux-foundation.org>, Joerg Roedel <jroedel@suse.de>,
 Ard Biesheuvel <ardb@kernel.org>
Cc: Andi Kleen <ak@linux.intel.com>,
 Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 David Rientjes <rientjes@google.com>, Vlastimil Babka <vbabka@suse.cz>,
 Tom Lendacky <thomas.lendacky@amd.com>, Thomas Gleixner
 <tglx@linutronix.de>, Peter Zijlstra <peterz@infradead.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Ingo Molnar <mingo@redhat.com>,
 Varad Gautam <varad.gautam@suse.com>, Dario Faggioli <dfaggioli@suse.com>,
 Dave Hansen <dave.hansen@intel.com>, Mike Rapoport <rppt@kernel.org>,
 marcelo.cerri@canonical.com, tim.gardner@canonical.com,
 khalid.elmously@canonical.com, philip.cox@canonical.com, x86@kernel.org,
 linux-mm@kvack.org, linux-coco@lists.linux.dev, linux-efi@vger.kernel.org,
 linux-kernel@vger.kernel.org, Mike Rapoport <rppt@linux.ibm.com>
References: <20220517153444.11195-1-kirill.shutemov@linux.intel.com>
 <20220517153444.11195-3-kirill.shutemov@linux.intel.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCHv6 02/15] mm: Add support for unaccepted memory
In-Reply-To: <20220517153444.11195-3-kirill.shutemov@linux.intel.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17.05.22 17:34, Kirill A. Shutemov wrote:
> UEFI Specification version 2.9 introduces the concept of memory
> acceptance. Some Virtual Machine platforms, such as Intel TDX or AMD
> SEV-SNP, require memory to be accepted before it can be used by the
> guest. Accepting happens via a protocol specific to the Virtual Machine
> platform.
> 
> There are several ways kernel can deal with unaccepted memory:
> 
>  1. Accept all the memory during the boot. It is easy to implement and
>     it doesn't have runtime cost once the system is booted. The downside
>     is very long boot time.
> 
>     Accept can be parallelized to multiple CPUs to keep it manageable
>     (i.e. via DEFERRED_STRUCT_PAGE_INIT), but it tends to saturate
>     memory bandwidth and does not scale beyond the point.
> 
>  2. Accept a block of memory on the first use. It requires more
>     infrastructure and changes in page allocator to make it work, but
>     it provides good boot time.
> 
>     On-demand memory accept means latency spikes every time kernel steps
>     onto a new memory block. The spikes will go away once workload data
>     set size gets stabilized or all memory gets accepted.
> 
>  3. Accept all memory in background. Introduce a thread (or multiple)
>     that gets memory accepted proactively. It will minimize time the
>     system experience latency spikes on memory allocation while keeping
>     low boot time.
> 
>     This approach cannot function on its own. It is an extension of #2:
>     background memory acceptance requires functional scheduler, but the
>     page allocator may need to tap into unaccepted memory before that.
> 
>     The downside of the approach is that these threads also steal CPU
>     cycles and memory bandwidth from the user's workload and may hurt
>     user experience.
> 
> Implement #2 for now. It is a reasonable default. Some workloads may
> want to use #1 or #3 and they can be implemented later based on user's
> demands.
> 
> Support of unaccepted memory requires a few changes in core-mm code:
> 
>   - memblock has to accept memory on allocation;
> 
>   - page allocator has to accept memory on the first allocation of the
>     page;
> 
> Memblock change is trivial.
> 
> The page allocator is modified to accept pages on the first allocation.
> The new page type (encoded in the _mapcount) -- PageUnaccepted() -- is
> used to indicate that the page requires acceptance.
> 
> Architecture has to provide two helpers if it wants to support
> unaccepted memory:
> 
>  - accept_memory() makes a range of physical addresses accepted.
> 
>  - memory_is_unaccepted() checks anything within the range of physical
>    addresses requires acceptance.
> 
> Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
> Acked-by: Mike Rapoport <rppt@linux.ibm.com>	# memblock


[...]

> +/*
> + * Page acceptance can be very slow. Do not call under critical locks.
> + */
> +static void accept_page(struct page *page, unsigned int order)
> +{
> +	phys_addr_t start = page_to_phys(page);
> +	int i;
> +
> +	accept_memory(start, start + (PAGE_SIZE << order));
> +	__ClearPageUnaccepted(page);
> +
> +	/* Assert that there is no PageUnaccepted() on tail pages */
> +	if (IS_ENABLED(CONFIG_DEBUG_VM)) {
> +		for (i = 1; i < (1 << order); i++)
> +			VM_BUG_ON_PAGE(PageUnaccepted(page + i), page + i);
> +	}
> +}
> +
> +static bool page_is_unaccepted(struct page *page, unsigned int order)

Nit: I'd call this page_contains_unaccepted(), otherwise it sounds like
we're just testing the flag.

> +{
> +	phys_addr_t start = page_to_phys(page);
> +	phys_addr_t end = start + (PAGE_SIZE << order);
> +
> +	return range_contains_unaccepted_memory(start, end);
> +}
> +


[...]

>  
>  #ifdef CONFIG_NUMA
> @@ -1807,6 +1877,9 @@ static void __init deferred_free_range(unsigned long pfn,
>  		return;
>  	}
>  
> +	/* Accept chunks smaller than page-block upfront */
> +	accept_memory(pfn << PAGE_SHIFT, (pfn + nr_pages) << PAGE_SHIFT);

PFN_PHYS()

> +
>  	for (i = 0; i < nr_pages; i++, page++, pfn++) {
>  		if ((pfn & (pageblock_nr_pages - 1)) == 0)
>  			set_pageblock_migratetype(page, MIGRATE_MOVABLE);
> @@ -2266,6 +2339,13 @@ static inline void expand(struct zone *zone, struct page *page,
>  		if (set_page_guard(zone, &page[size], high, migratetype))
>  			continue;
>  
> +		/*
> +		 * Transfer PageUnaccepted() to the newly split pages so
> +		 * they can be accepted after dropping the zone lock.
> +		 */
> +		if (PageUnaccepted(page))
> +			__SetPageUnaccepted(&page[size]);
> +
>  		add_to_free_list(&page[size], zone, high, migratetype);
>  		set_buddy_order(&page[size], high);
>  	}
> @@ -2396,6 +2476,9 @@ inline void post_alloc_hook(struct page *page, unsigned int order,
>  	 */
>  	kernel_unpoison_pages(page, 1 << order);
>  
> +	if (PageUnaccepted(page))
> +		accept_page(page, order);

Nit: Just move the PageUnaccepted() call into accept_page(), so all type
testing and clearing code is in a single location.

> +
>  	/*
>  	 * As memory initialization might be integrated into KASAN,
>  	 * KASAN unpoisoning and memory initializion code must be


Apart from that, LGTM. If the temporary clearing of the unaccepted type
is ever an issue (e.g., when we want to exclude reading them in
/proc/kcore), we can think of ways to avoid that race.

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb

