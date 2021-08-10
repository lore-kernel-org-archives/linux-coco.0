Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7A6A177
	for <linux-coco@lists.linux.dev>; Tue, 10 Aug 2021 15:21:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1628608913;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hyIW1Dsj80BNyB5Ez6rsRZ4nA63bgzsrvBHJJMAzsHw=;
	b=WGURRqrEOxtPzoMgh6uy8MRINKwt4n6SamJb1FezNukKZEYpT6/sOn1iuLFZQlfbU0L5Sh
	gM0t5R0YBnmu96r7x4zNO4RDlLkti05uaDYmU0/fa6gGTVXUN6DSabSqGNiWOfgbCXpyik
	3WrlOV5wvdKjdR3ELJwmugSlXSii5Wo=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-372-Vgxqsap2N9yQZicDzX_gTA-1; Tue, 10 Aug 2021 11:21:51 -0400
X-MC-Unique: Vgxqsap2N9yQZicDzX_gTA-1
Received: by mail-wm1-f71.google.com with SMTP id 21-20020a05600c0255b02902571fa93802so687756wmj.1
        for <linux-coco@lists.linux.dev>; Tue, 10 Aug 2021 08:21:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:references:from:organization:subject
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=hyIW1Dsj80BNyB5Ez6rsRZ4nA63bgzsrvBHJJMAzsHw=;
        b=EcKRwdCwy9ZZcnHKHW6DavDrly6gLJqJywP84rT0C61A6tJQ6Zx2D/r6kvOk1M4Yjb
         L742mPoyTdxf+l/zCVgYJ2WkPvsxtZfIvE/YbREwi5Ze9Gd7dBU5561mbqnT3Gf6ulen
         Fyxc9dQIfZGQ0GrsCJLcTO18XB2B7yfzgSbkclP5JpHkfBsm69A0YwvUXunj1CoQ+VuF
         MJOj3jJydTYrRYmLoeFe1YYKv8LIqoB5OJFVljEkFohV7BEN3v1F72XPbaBCCd7gYOyi
         +k9mA0e0+1v58qzrKAjYkJN06uIeFWBLdPuz04hp5jQRCK8oJ8dHEDxBGcU+cUXIvpK8
         +m4Q==
X-Gm-Message-State: AOAM532hNioQZl6phiaJB7pAOCiGu4xUwh8AncR/b2oA0LogQVHZWdq9
	bhvxbTUhVluzkAOJrTIDcD3Q6/JybuqqFqCMH4H4khMdUcfMI1NaKd4hcJiheRKC7dNJjPXhIud
	O+PlVBhglDpTBDmXffDOvFQ==
X-Received: by 2002:a05:600c:a41:: with SMTP id c1mr22407124wmq.109.1628608910337;
        Tue, 10 Aug 2021 08:21:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz03IKHIRAmztBUt6G7hOjfqYECPVuLCftxaXW1EHq3wL9Jce0hR3y5svOifsUZdEMPqRHSYg==
X-Received: by 2002:a05:600c:a41:: with SMTP id c1mr22407098wmq.109.1628608910064;
        Tue, 10 Aug 2021 08:21:50 -0700 (PDT)
Received: from ?IPv6:2003:d8:2f0a:7f00:fad7:3bc9:69d:31f? (p200300d82f0a7f00fad73bc9069d031f.dip0.t-ipconnect.de. [2003:d8:2f0a:7f00:fad7:3bc9:69d:31f])
        by smtp.gmail.com with ESMTPSA id n8sm2931132wms.11.2021.08.10.08.21.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Aug 2021 08:21:49 -0700 (PDT)
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Cc: "Kirill A. Shutemov" <kirill@shutemov.name>,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 Sean Christopherson <seanjc@google.com>,
 Andrew Morton <akpm@linux-foundation.org>, Joerg Roedel <jroedel@suse.de>,
 Andi Kleen <ak@linux.intel.com>,
 Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 David Rientjes <rientjes@google.com>, Vlastimil Babka <vbabka@suse.cz>,
 Tom Lendacky <thomas.lendacky@amd.com>, Thomas Gleixner
 <tglx@linutronix.de>, Peter Zijlstra <peterz@infradead.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Ingo Molnar <mingo@redhat.com>,
 Varad Gautam <varad.gautam@suse.com>, Dario Faggioli <dfaggioli@suse.com>,
 x86@kernel.org, linux-mm@kvack.org, linux-coco@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20210810062626.1012-1-kirill.shutemov@linux.intel.com>
 <20210810062626.1012-2-kirill.shutemov@linux.intel.com>
 <dd4b7aff-ccf3-24f6-3f6e-14c4b6aa8b64@redhat.com>
 <20210810150216.dwn2rylcpzxx6b6l@black.fi.intel.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH 1/5] mm: Add support for unaccepted memory
Message-ID: <2e45209d-6a99-9496-6cb0-111291bd481a@redhat.com>
Date: Tue, 10 Aug 2021 17:21:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20210810150216.dwn2rylcpzxx6b6l@black.fi.intel.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 10.08.21 17:02, Kirill A. Shutemov wrote:
> On Tue, Aug 10, 2021 at 09:48:04AM +0200, David Hildenbrand wrote:
>> On 10.08.21 08:26, Kirill A. Shutemov wrote:
>>> UEFI Specification version 2.9 introduces concept of memory acceptance:
>>> Some Virtual Machine platforms, such as Intel TDX or AMD SEV-SNP,
>>> requiring memory to be accepted before it can be used by the guest.
>>> Accepting happens via a protocol specific for the Virtrual Machine
>>> platform.
>>>
>>> Accepting memory is costly and it makes VMM allocate memory for the
>>> accepted guest physical address range. It's better to postpone memory
>>> acceptation until memory is needed. It lowers boot time and reduces
>>> memory overhead.
>>>
>>> Support of such memory requires few changes in core-mm code:
>>>
>>>     - memblock has to accept memory on allocation;
>>>
>>>     - page allocator has to accept memory on the first allocation of the
>>>       page;
>>>
>>> Memblock change is trivial.
>>>
>>> Page allocator is modified to accept pages on the first allocation.
>>> PageOffline() is used to indicate that the page requires acceptance.
>>> The flag currently used by hotplug and balloon. Such pages are not
>>> available to page allocator.
>>>
>>> An architecture has to provide three helpers if it wants to support
>>> unaccepted memory:
>>>
>>>    - accept_memory() makes a range of physical addresses accepted.
>>>
>>>    - maybe_set_page_offline() marks a page PageOffline() if it requires
>>>      acceptance. Used during boot to put pages on free lists.
>>>
>>>    - clear_page_offline() clears makes a page accepted and clears
>>>      PageOffline().
>>>
>>> Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
>>> ---
>>>    mm/internal.h   | 14 ++++++++++++++
>>>    mm/memblock.c   |  1 +
>>>    mm/page_alloc.c | 13 ++++++++++++-
>>>    3 files changed, 27 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/mm/internal.h b/mm/internal.h
>>> index 31ff935b2547..d2fc8a17fbe0 100644
>>> --- a/mm/internal.h
>>> +++ b/mm/internal.h
>>> @@ -662,4 +662,18 @@ void vunmap_range_noflush(unsigned long start, unsigned long end);
>>>    int numa_migrate_prep(struct page *page, struct vm_area_struct *vma,
>>>    		      unsigned long addr, int page_nid, int *flags);
>>> +#ifndef CONFIG_UNACCEPTED_MEMORY
>>> +static inline void maybe_set_page_offline(struct page *page, unsigned int order)
>>> +{
>>> +}
>>> +
>>> +static inline void clear_page_offline(struct page *page, unsigned int order)
>>> +{
>>> +}
>>> +
>>> +static inline void accept_memory(phys_addr_t start, phys_addr_t end)
>>> +{
>>> +}
>>
>> Can we find better fitting names for the first two? The function names are
>> way too generic. For example:
>>
>> accept_or_set_page_offline()
>>
>> accept_and_clear_page_offline()
> 
> Sounds good.
> 
>> I thought for a second if
>> 	PAGE_TYPE_OPS(Unaccepted, offline)
>> makes sense as well, not sure.
> 
> I find Offline fitting the situation. Don't see a reason to add more
> terminology here.
> 
>> Also, please update the description of PageOffline in page-flags.h to
>> include the additional usage with PageBuddy set at the same time.
> 
> Okay.
> 
>> I assume you don't have to worry about page_offline_freeze/thaw ... as we
>> only set PageOffline initially, but not later at runtime when other
>> subsystems (/proc/kcore) might stumble over it.
> 
> I think so, but I would need to look at this code once again.
> 

Another thing to look into would be teaching makedumpfile via vmcoreinfo 
about these special buddy pages:

makedumpfile will naturally skip all PageOffline pages and skip 
PageBuddy pages if requested to skip free pages. It detects these pages 
via the mapcount value. You will want makedumpfile to treat them like 
PageOffline pages: kernel/crash_core.c

#define PAGE_BUDDY_MAPCOUNT_VALUE	(~PG_buddy)
VMCOREINFO_NUMBER(PAGE_BUDDY_MAPCOUNT_VALUE);

#define PAGE_OFFLINE_MAPCOUNT_VALUE	(~PG_offline)
VMCOREINFO_NUMBER(PAGE_OFFLINE_MAPCOUNT_VALUE);

We could export PAGE_BUDDY_OFFLINE_MAPCOUNT_VALUE or just compute it 
inside makedumpfile from the other two values.

-- 
Thanks,

David / dhildenb

