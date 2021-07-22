Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1439A72
	for <linux-coco@lists.linux.dev>; Thu, 22 Jul 2021 15:46:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1626968778;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/cmXFlDlqSmkzfOyxNp0urDFPKs8U6XmmiWK4vem5uw=;
	b=hEg3uNuRjy/xJJnM6inMDwPMC+oVu1ayqgY52npLzByuYJVbAU/QJCBmzGUNhOtefAXifB
	y6qXmSmV1GHmTx5l3KVJkhpiuqripHHEp9wAO3Xoauc8gIu7APNVDQlC9LHJunmsO7kZbT
	C0Gy2cwdRgtqGJgEKy4Y/rSxwljvQDk=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-396-mtyAPevVO3CZk-nctRMZcQ-1; Thu, 22 Jul 2021 11:46:17 -0400
X-MC-Unique: mtyAPevVO3CZk-nctRMZcQ-1
Received: by mail-wm1-f71.google.com with SMTP id 15-20020a05600c230fb0290218ad9a8d4aso843105wmo.1
        for <linux-coco@lists.linux.dev>; Thu, 22 Jul 2021 08:46:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:references:from:organization:subject
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=/cmXFlDlqSmkzfOyxNp0urDFPKs8U6XmmiWK4vem5uw=;
        b=eeHB0cpKTLh+kSKBG29t9mabmXif4n5T7SDs9Bucy8DKKBUeVEAt8SHpVC8tnCKfvp
         8SCOmv9f6F4zIIE6wlUIOxCvX0fL4e4FkyZDZsRnu8tAZAWOBtaV8QeinwSbCFS2MO4Z
         MSXFLlCyBnGFbrq0WKRg4SG29z3XIph1BUvtd/8yuAgnExLOZ5S3F2obSWEbF+EGC5yv
         V9HCosWq/j4hW2CMvXxJGL8Kd4KPNf6k4Q4EvNtAY0CfhYO/pMCAkXjYH3iMnQtWPGcK
         QvTFWCSnAsnRgqklhZJBE/q2ne4YFaHnXeuQCsycgeF7OweWuu1C/uBvpguh49dI2P0/
         wooQ==
X-Gm-Message-State: AOAM531XFlwa0EFNJQ4M1dqePI0LpspUlzMHwK/QAAg1FLLslcb2BBnP
	53ZBr4HG0Ac50a3wYe1gM5UKDPvDeTfINZHUEqxACa6EL1Q24cZqBxNXUicsb38ptC81fWc9oS3
	5i6OCS6985e/RDxqkjY0kBhYjNkchc9spzYUip1Y6ZTN3PbF0wqZXEuLZVH3aWr5JdbcG2g==
X-Received: by 2002:a05:600c:2204:: with SMTP id z4mr9757434wml.169.1626968776306;
        Thu, 22 Jul 2021 08:46:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxttz4hBNMk/EDY1HbYQQraoKY211HWUJYBfbPJ8AoMza6fYaw1JmLlYcy1Ak66QiSeXBfNZA==
X-Received: by 2002:a05:600c:2204:: with SMTP id z4mr9757395wml.169.1626968776049;
        Thu, 22 Jul 2021 08:46:16 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c6970.dip0.t-ipconnect.de. [91.12.105.112])
        by smtp.gmail.com with ESMTPSA id f2sm30154717wrq.69.2021.07.22.08.46.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Jul 2021 08:46:15 -0700 (PDT)
To: "Kirill A. Shutemov" <kirill@shutemov.name>,
 Joerg Roedel <jroedel@suse.de>
Cc: David Rientjes <rientjes@google.com>, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Sean Christopherson <seanjc@google.com>,
 Andrew Morton <akpm@linux-foundation.org>, Vlastimil Babka <vbabka@suse.cz>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 Andi Kleen <ak@linux.intel.com>, Brijesh Singh <brijesh.singh@amd.com>,
 Tom Lendacky <thomas.lendacky@amd.com>, Jon Grimm <jon.grimm@amd.com>,
 Thomas Gleixner <tglx@linutronix.de>, Peter Zijlstra <peterz@infradead.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Ingo Molnar <mingo@redhat.com>,
 "Kaplan, David" <David.Kaplan@amd.com>, Varad Gautam
 <varad.gautam@suse.com>, Dario Faggioli <dfaggioli@suse.com>,
 x86@kernel.org, linux-mm@kvack.org, linux-coco@lists.linux.dev
References: <YPV27hDPZUoVsIZt@suse.de>
 <20210720173004.ucrliup5o7l3jfq3@box.shutemov.name>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: Runtime Memory Validation in Intel-TDX and AMD-SNP
Message-ID: <fa38e74e-e7ca-39f3-f2db-f0a0de152edb@redhat.com>
Date: Thu, 22 Jul 2021 17:46:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20210720173004.ucrliup5o7l3jfq3@box.shutemov.name>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit


>>
>> 	8. When memory is returned to the memblock or page allocators,
>> 	   it is _not_ invalidated. In fact, all memory which is freed
>> 	   need to be valid. If it was marked invalid in the meantime
>> 	   (e.g. if it the memory was used for DMA buffers), the code
>> 	   owning the memory needs to validate it again before freeing
>> 	   it.
>>
>> 	   The benefit of doing memory validation at allocation time is
>> 	   that it keeps the exception handler for invalid memory
>> 	   simple, because no exceptions of this kind are expected under
>> 	   normal operation.
> 
> During early boot I treat unaccepted memory as a usable RAM. It only
> requires special treatment on memblock_reserve(), which used for early
> memory allocation: unaccepted usable RAM has to be accepted, before
> reserving.
> 
> For fine-grained accepting/validation tracking I use PageOffline() flags
> (it's encoded into mapcount): before adding an unaccepted page to free
> list I set the PageOffline() to indicate that the page has to be accepted
> before returning from the page allocator. Currently, we never have
> PageOffline() set for pages on free lists, so we won't have confusion with
> ballooning or memory hotplug.

I was just about to propose something similar. Something like that 
sounds like the best approach to me

1. Sync e820 to memblock
2. Sync memblock to memmap
3. Let the page allocator deal with validation once initializing/handing 
out memory

PageOffline() does exactly what you want, just be aware that 
PageBuddy()+PageOffline() won't be recognized by crash anymore, as it 
tests for a single memmap value. Can be fixed with makedumpfile updates 
once that applies.

Alternatively, you could use any other page flag that is yet unsued 
combined with PageBuddy.

Sure, there might be obstacles, but it certainly sounds like a clean 
approach to me.

> 
> I try to keep pages accepted in 2M or 4M chunks (pageblock_order or
> MAX_ORDER). It is reasonable compromise on speed/latency.
> 
> I still debugging the code, but hopefully will get working PoC this week.
> 

[...]

> 
> I'm not sure a bitmap is needed. I hope we can use E820 for early
> tracking. But let's see if it works.

+1, this smells like an anti-patter. I'm absolutely not in favor of a 
bitmap, we have the sparse memory model for a reason.

Also, I am not convinced that kexec/kdump is actually easy to realize 
with the bitmap? Who will forward that bitmap? Where will it reside? Who 
says it's not corrupted? Just take a look at how we don't even have 
access to memmap of the oldkernel in the newkernel -- and have to locate 
and decipher it in constantly-to-be-updated user space makedumpfile. Any 
time you'd change anything about the bitmap ("hey, let's use larger 
chunks", "hey, let's split it up") you'd break the old_kernel <-> 
new_kernel agreement.

-- 
Thanks,

David / dhildenb

