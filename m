Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEC717C
	for <linux-coco@lists.linux.dev>; Fri,  5 Aug 2022 12:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1659701375;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tfAY0OctIFwhY2dxc6t3vPJmdx9dX9vR5e4NaQbcGUc=;
	b=euVzfWL/WArGDNUzhyV1+9rMnq1huRbuWclQxooJaZeQ7mlSUCEIoiy2NMGQA8O8L/LiYJ
	a3cr7oRzDVdis1LMJAA55idA87Rh+iNVVTMyGLd2XidZANXDzIjZcRQ6sTOKOKgc1CB51K
	HKOvaghewWFl2mVAg8DA8B5Qy81j9vo=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-588-l16aQbWwPrWerbXathLsMg-1; Fri, 05 Aug 2022 08:09:34 -0400
X-MC-Unique: l16aQbWwPrWerbXathLsMg-1
Received: by mail-wm1-f69.google.com with SMTP id v64-20020a1cac43000000b003a4bea31b4dso4120721wme.3
        for <linux-coco@lists.linux.dev>; Fri, 05 Aug 2022 05:09:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc;
        bh=tfAY0OctIFwhY2dxc6t3vPJmdx9dX9vR5e4NaQbcGUc=;
        b=AjXhBs52fji/4sqkrlgORpmWS1fg3PIFFJtbzgC7r0XrpqswelmOvzwWj/E7v50DBo
         fuQuShMyIQqjmdcquL1KXCrBoyfyZXhXasnmcGG7E8tRcMd671Fy+FQLljgLaBk1OH6+
         rOQs3coaWSjUjRta//M5S00YplNqahnIQXFjM045NoBI94AIrQsv5xVTfddeHUrl1hiI
         6f7+l0rV+EpjSnfq9Y0SkjT17fZHF6B6KVZbZzHNi+hXWjbTA/Owa8kuA4YvmIEtSpgf
         oz+4TI3g3RB6MV+k+YNCtNzhfA6Ic9+3WLzyUxJIna1Cli/QgruI8ByShJfR8bqGAmA5
         /2Iw==
X-Gm-Message-State: ACgBeo0SXSU7BPfSvAKCIXyz1gWV0haap+4dGWNZzbFNx8cNreaz0eZC
	J+iYyA5I+TjtqkMKCzCLeA/CYWTLKpGrO72I9S3AiAOrh9ofYacqOllXyhY8+IfnOfp5aB9VJJz
	Dke2isoEgw12wBIh/ukwO2w==
X-Received: by 2002:a05:6000:1379:b0:21f:c4d:957a with SMTP id q25-20020a056000137900b0021f0c4d957amr4235774wrz.210.1659701373608;
        Fri, 05 Aug 2022 05:09:33 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4KIyeyf2kV1/U5HQgcYIKESpAYnB5Rpy18WHdGgXasfneZBXhzdedc2vFgJWSbeAMW30V03w==
X-Received: by 2002:a05:6000:1379:b0:21f:c4d:957a with SMTP id q25-20020a056000137900b0021f0c4d957amr4235739wrz.210.1659701373283;
        Fri, 05 Aug 2022 05:09:33 -0700 (PDT)
Received: from ?IPV6:2003:cb:c706:fb00:f5c3:24b2:3d03:9d52? (p200300cbc706fb00f5c324b23d039d52.dip0.t-ipconnect.de. [2003:cb:c706:fb00:f5c3:24b2:3d03:9d52])
        by smtp.gmail.com with ESMTPSA id bh19-20020a05600c3d1300b003a2f6367049sm4449097wmb.48.2022.08.05.05.09.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Aug 2022 05:09:32 -0700 (PDT)
Message-ID: <cb9d3310-3bc0-8ecf-5e71-becce980235f@redhat.com>
Date: Fri, 5 Aug 2022 14:09:31 +0200
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCHv7 02/14] mm: Add support for unaccepted memory
To: Vlastimil Babka <vbabka@suse.cz>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 Sean Christopherson <seanjc@google.com>,
 Andrew Morton <akpm@linux-foundation.org>, Joerg Roedel <jroedel@suse.de>,
 Ard Biesheuvel <ardb@kernel.org>
Cc: Andi Kleen <ak@linux.intel.com>,
 Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 David Rientjes <rientjes@google.com>, Tom Lendacky
 <thomas.lendacky@amd.com>, Thomas Gleixner <tglx@linutronix.de>,
 Peter Zijlstra <peterz@infradead.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Ingo Molnar <mingo@redhat.com>, Dario Faggioli <dfaggioli@suse.com>,
 Dave Hansen <dave.hansen@intel.com>, Mike Rapoport <rppt@kernel.org>,
 marcelo.cerri@canonical.com, tim.gardner@canonical.com,
 khalid.elmously@canonical.com, philip.cox@canonical.com, x86@kernel.org,
 linux-mm@kvack.org, linux-coco@lists.linux.dev, linux-efi@vger.kernel.org,
 linux-kernel@vger.kernel.org, Mike Rapoport <rppt@linux.ibm.com>,
 Mel Gorman <mgorman@techsingularity.net>
References: <20220614120231.48165-1-kirill.shutemov@linux.intel.com>
 <20220614120231.48165-3-kirill.shutemov@linux.intel.com>
 <8cf143e7-2b62-1a1e-de84-e3dcc6c027a4@suse.cz>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <8cf143e7-2b62-1a1e-de84-e3dcc6c027a4@suse.cz>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05.08.22 13:49, Vlastimil Babka wrote:
> On 6/14/22 14:02, Kirill A. Shutemov wrote:
>> UEFI Specification version 2.9 introduces the concept of memory
>> acceptance. Some Virtual Machine platforms, such as Intel TDX or AMD
>> SEV-SNP, require memory to be accepted before it can be used by the
>> guest. Accepting happens via a protocol specific to the Virtual Machine
>> platform.
>>
>> There are several ways kernel can deal with unaccepted memory:
>>
>>  1. Accept all the memory during the boot. It is easy to implement and
>>     it doesn't have runtime cost once the system is booted. The downside
>>     is very long boot time.
>>
>>     Accept can be parallelized to multiple CPUs to keep it manageable
>>     (i.e. via DEFERRED_STRUCT_PAGE_INIT), but it tends to saturate
>>     memory bandwidth and does not scale beyond the point.
>>
>>  2. Accept a block of memory on the first use. It requires more
>>     infrastructure and changes in page allocator to make it work, but
>>     it provides good boot time.
>>
>>     On-demand memory accept means latency spikes every time kernel steps
>>     onto a new memory block. The spikes will go away once workload data
>>     set size gets stabilized or all memory gets accepted.
>>
>>  3. Accept all memory in background. Introduce a thread (or multiple)
>>     that gets memory accepted proactively. It will minimize time the
>>     system experience latency spikes on memory allocation while keeping
>>     low boot time.
>>
>>     This approach cannot function on its own. It is an extension of #2:
>>     background memory acceptance requires functional scheduler, but the
>>     page allocator may need to tap into unaccepted memory before that.
>>
>>     The downside of the approach is that these threads also steal CPU
>>     cycles and memory bandwidth from the user's workload and may hurt
>>     user experience.
>>
>> Implement #2 for now. It is a reasonable default. Some workloads may
>> want to use #1 or #3 and they can be implemented later based on user's
>> demands.
>>
>> Support of unaccepted memory requires a few changes in core-mm code:
>>
>>   - memblock has to accept memory on allocation;
>>
>>   - page allocator has to accept memory on the first allocation of the
>>     page;
>>
>> Memblock change is trivial.
>>
>> The page allocator is modified to accept pages on the first allocation.
>> The new page type (encoded in the _mapcount) -- PageUnaccepted() -- is
>> used to indicate that the page requires acceptance.
>>
>> Architecture has to provide two helpers if it wants to support
>> unaccepted memory:
>>
>>  - accept_memory() makes a range of physical addresses accepted.
>>
>>  - range_contains_unaccepted_memory() checks anything within the range
>>    of physical addresses requires acceptance.
>>
>> Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
>> Acked-by: Mike Rapoport <rppt@linux.ibm.com>	# memblock
>> Reviewed-by: David Hildenbrand <david@redhat.com>
> 
> Hmm I realize it's not ideal to raise this at v7, and maybe it was discussed
> before, but it's really not great how this affects the core page allocator
> paths. Wouldn't it be possible to only release pages to page allocator when
> accepted, and otherwise use some new per-zone variables together with the
> bitmap to track how much exactly is where to accept? Then it could be hooked
> in get_page_from_freelist() similarly to CONFIG_DEFERRED_STRUCT_PAGE_INIT -
> if we fail zone_watermark_fast() and there are unaccepted pages in the zone,
> accept them and continue. With a static key to flip in case we eventually
> accept everything. Because this is really similar scenario to the deferred
> init and that one was solved in a way that adds minimal overhead.

I kind of like just having the memory stats being correct (e.g., free
memory) and acceptance being an internal detail to be triggered when
allocating pages -- just like the arch_alloc_page() callback.

I'm sure we could optimize for the !unaccepted memory via static keys
also in this version with some checks at the right places if we find
this to hurt performance?

-- 
Thanks,

David / dhildenb

