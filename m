Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E278E177
	for <linux-coco@lists.linux.dev>; Tue, 10 Aug 2021 07:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1628581688;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qyiZQfgk3j2MX/M11JnnsZSFCKezwOSWW55OSmu9ncY=;
	b=WZf8WkUuIjZIkJrVlXCuL7mkeR/J3GwD+1LVyeZMU6qogn1BB5J6XAv0ktL+IrI0aZwda8
	h1/KfGnO6nLKCs7EyRR2uUsZFiC1FICxwlqnSJ8VTZcycmTZCYBDSX60mAnizXrjLboIHw
	a+0KbZ8YxToz02tH/D36ydoR1GSKiiA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-343-CfeT-EhANeqMK7jmQ6qHLA-1; Tue, 10 Aug 2021 03:48:07 -0400
X-MC-Unique: CfeT-EhANeqMK7jmQ6qHLA-1
Received: by mail-wm1-f72.google.com with SMTP id c2-20020a7bc8420000b0290238db573ab7so725909wml.5
        for <linux-coco@lists.linux.dev>; Tue, 10 Aug 2021 00:48:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:references:from:organization:subject
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=qyiZQfgk3j2MX/M11JnnsZSFCKezwOSWW55OSmu9ncY=;
        b=nrxYh6ybrq5lE5xVUFWUcjVpH/fF4UuXKp7GrubiwbuoHdzRVcaBMLCCEJkegJpVvn
         F7lAVPP2OwFFxXByMghdfMxKcXTZqFLjUibPB0Ri1QY5HF0fb+P0V117diPELiEe8gq9
         JfWCq2t5K/+lfNaYVbpSaH6o2pWxWnIb12C8RSezVi1agAmugdOMZECsmKI0HhnLnUxv
         rBRFkn6EhAUsTeVOJw1eZMxJNTqkwhTPiX2S1n5yYZ04RAHGqRxv7wNSDH42JC3bRKHn
         o+QJRvc3w/W2DTS8+k80OZQ3x2XbWgXdF+oKrm0bssGii5qo3WaSl5ssjJ+jew/b+pqO
         DQRw==
X-Gm-Message-State: AOAM530wo7mbWLSR8HPRD0J0l5SSqI46zJgibCEpf/oi6gWEaLYzgrtR
	nYdB0LVP4EpZOtQ02xGt5xy80H/3iBMvzwVBXY8Qo1Br9aoYDv6fda5u/f0aPnURTiXKNkT+6Sn
	EdgyXm/cJbOOfGKZxF0Ma/Q==
X-Received: by 2002:a1c:3847:: with SMTP id f68mr118830wma.27.1628581686198;
        Tue, 10 Aug 2021 00:48:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx3nGwLd7fpNoXzdy/z33L+jLJPlF/DBsrza1eqzfBVIcellVymHPn+c/mpsbj+CQSbYYkvpg==
X-Received: by 2002:a1c:3847:: with SMTP id f68mr118784wma.27.1628581685855;
        Tue, 10 Aug 2021 00:48:05 -0700 (PDT)
Received: from ?IPv6:2003:d8:2f0a:7f00:fad7:3bc9:69d:31f? (p200300d82f0a7f00fad73bc9069d031f.dip0.t-ipconnect.de. [2003:d8:2f0a:7f00:fad7:3bc9:69d:31f])
        by smtp.gmail.com with ESMTPSA id e11sm2137939wrm.80.2021.08.10.00.48.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Aug 2021 00:48:05 -0700 (PDT)
To: "Kirill A. Shutemov" <kirill@shutemov.name>,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 Sean Christopherson <seanjc@google.com>,
 Andrew Morton <akpm@linux-foundation.org>, Joerg Roedel <jroedel@suse.de>
Cc: Andi Kleen <ak@linux.intel.com>,
 Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 David Rientjes <rientjes@google.com>, Vlastimil Babka <vbabka@suse.cz>,
 Tom Lendacky <thomas.lendacky@amd.com>, Thomas Gleixner
 <tglx@linutronix.de>, Peter Zijlstra <peterz@infradead.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Ingo Molnar <mingo@redhat.com>,
 Varad Gautam <varad.gautam@suse.com>, Dario Faggioli <dfaggioli@suse.com>,
 x86@kernel.org, linux-mm@kvack.org, linux-coco@lists.linux.dev,
 linux-kernel@vger.kernel.org,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
References: <20210810062626.1012-1-kirill.shutemov@linux.intel.com>
 <20210810062626.1012-2-kirill.shutemov@linux.intel.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH 1/5] mm: Add support for unaccepted memory
Message-ID: <dd4b7aff-ccf3-24f6-3f6e-14c4b6aa8b64@redhat.com>
Date: Tue, 10 Aug 2021 09:48:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20210810062626.1012-2-kirill.shutemov@linux.intel.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 10.08.21 08:26, Kirill A. Shutemov wrote:
> UEFI Specification version 2.9 introduces concept of memory acceptance:
> Some Virtual Machine platforms, such as Intel TDX or AMD SEV-SNP,
> requiring memory to be accepted before it can be used by the guest.
> Accepting happens via a protocol specific for the Virtrual Machine
> platform.
> 
> Accepting memory is costly and it makes VMM allocate memory for the
> accepted guest physical address range. It's better to postpone memory
> acceptation until memory is needed. It lowers boot time and reduces
> memory overhead.
> 
> Support of such memory requires few changes in core-mm code:
> 
>    - memblock has to accept memory on allocation;
> 
>    - page allocator has to accept memory on the first allocation of the
>      page;
> 
> Memblock change is trivial.
> 
> Page allocator is modified to accept pages on the first allocation.
> PageOffline() is used to indicate that the page requires acceptance.
> The flag currently used by hotplug and balloon. Such pages are not
> available to page allocator.
> 
> An architecture has to provide three helpers if it wants to support
> unaccepted memory:
> 
>   - accept_memory() makes a range of physical addresses accepted.
> 
>   - maybe_set_page_offline() marks a page PageOffline() if it requires
>     acceptance. Used during boot to put pages on free lists.
> 
>   - clear_page_offline() clears makes a page accepted and clears
>     PageOffline().
> 
> Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
> ---
>   mm/internal.h   | 14 ++++++++++++++
>   mm/memblock.c   |  1 +
>   mm/page_alloc.c | 13 ++++++++++++-
>   3 files changed, 27 insertions(+), 1 deletion(-)
> 
> diff --git a/mm/internal.h b/mm/internal.h
> index 31ff935b2547..d2fc8a17fbe0 100644
> --- a/mm/internal.h
> +++ b/mm/internal.h
> @@ -662,4 +662,18 @@ void vunmap_range_noflush(unsigned long start, unsigned long end);
>   int numa_migrate_prep(struct page *page, struct vm_area_struct *vma,
>   		      unsigned long addr, int page_nid, int *flags);
>   
> +#ifndef CONFIG_UNACCEPTED_MEMORY
> +static inline void maybe_set_page_offline(struct page *page, unsigned int order)
> +{
> +}
> +
> +static inline void clear_page_offline(struct page *page, unsigned int order)
> +{
> +}
> +
> +static inline void accept_memory(phys_addr_t start, phys_addr_t end)
> +{
> +}

Can we find better fitting names for the first two? The function names 
are way too generic. For example:

accept_or_set_page_offline()

accept_and_clear_page_offline()

I thought for a second if
	PAGE_TYPE_OPS(Unaccepted, offline)
makes sense as well, not sure.


Also, please update the description of PageOffline in page-flags.h to 
include the additional usage with PageBuddy set at the same time.


I assume you don't have to worry about page_offline_freeze/thaw ... as 
we only set PageOffline initially, but not later at runtime when other 
subsystems (/proc/kcore) might stumble over it.

-- 
Thanks,

David / dhildenb

