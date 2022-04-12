Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D05B846AD
	for <linux-coco@lists.linux.dev>; Tue, 12 Apr 2022 08:15:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1649751315;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8HjmZzAIO50unb7pGZAQpRPqJO313RFErJC/+pOp/R0=;
	b=iKzXnDoLIcATeO1qukJjLuqfl4LeC0wGYWMGd7r97A4Pr6/bDqF91RyLBw9wC2eqK2K4pr
	Urc7gBRxbFp38F4UitrDv6yeUAIuwsfebezA0r/cdIWU9TwOVUTTwVtjQw2zAr9oF0C+3Z
	cEJlgy74N6/rtSlA9v0GlHLtqWcAUpc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-589-Q4Q77xJtOrWxjla6q4wTLA-1; Tue, 12 Apr 2022 04:15:11 -0400
X-MC-Unique: Q4Q77xJtOrWxjla6q4wTLA-1
Received: by mail-wm1-f69.google.com with SMTP id q25-20020a1ce919000000b0038ead791083so934649wmc.6
        for <linux-coco@lists.linux.dev>; Tue, 12 Apr 2022 01:15:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent
         :content-language:to:cc:references:from:organization:subject
         :in-reply-to:content-transfer-encoding;
        bh=8HjmZzAIO50unb7pGZAQpRPqJO313RFErJC/+pOp/R0=;
        b=KodgiKNkZ37I4KMj+47DUA9p1PJ34rTp34kUAyqq+heoSbCIE6/yVOFxcVaNq4Q/kK
         thvbqDMpcNmtVzwZHKcSSP9/44Xol1WrtT6StEVUTOmS05/rovqf9A5PFyDgfgRbwiOH
         tXxN3QfTyB574hSYkb7FxCo/DfLjCyPJt4lIdEd9SNqOlv4SuwY94jE5pZ6u3pi3xCoq
         xU1kVSn/Pfz0YrNrhO+ajmSpypcjxQIL1WT2DB6/ghMogdqUxwquptLIyDycshykZX8e
         CTgu2Dh4ITc/IydIp1wZpGhJooe/4BGDIGJF372Z/GoREqI/7nkYkS9iU5tktYPGn1yq
         b1fg==
X-Gm-Message-State: AOAM531nG8RM2AWic1Bcn6q8qR2UmYB0RwPKdgzQnOwRmP4u8EK7cm92
	qxPmYOUX/vDU4Z4OGVOhaxNexBxq5rma6cDjQcv6uG9HMYC6rABPAR0Sq0eruLKglFeCneXc32N
	Gjreli3BwhOXGkHhSgFkxlQ==
X-Received: by 2002:adf:ed8b:0:b0:206:1771:e373 with SMTP id c11-20020adfed8b000000b002061771e373mr28461581wro.84.1649751310602;
        Tue, 12 Apr 2022 01:15:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxZYmHGzijmWq4j1QgvJKMtTI4uehpfCeAgJZFkKQ0wTIJR1ucWkaH70j+SivEpEn8AXTnKWA==
X-Received: by 2002:adf:ed8b:0:b0:206:1771:e373 with SMTP id c11-20020adfed8b000000b002061771e373mr28461563wro.84.1649751310358;
        Tue, 12 Apr 2022 01:15:10 -0700 (PDT)
Received: from ?IPV6:2003:cb:c707:1800:7c14:16cc:5291:a9f3? (p200300cbc70718007c1416cc5291a9f3.dip0.t-ipconnect.de. [2003:cb:c707:1800:7c14:16cc:5291:a9f3])
        by smtp.gmail.com with ESMTPSA id b14-20020a7bc24e000000b003899c8053e1sm1814456wmj.41.2022.04.12.01.15.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Apr 2022 01:15:09 -0700 (PDT)
Message-ID: <ff9e0bad-be9a-97ac-ae88-d22bcfbe80d4@redhat.com>
Date: Tue, 12 Apr 2022 10:15:07 +0200
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
To: Dave Hansen <dave.hansen@intel.com>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
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
 Brijesh Singh <brijesh.singh@amd.com>, Mike Rapoport <rppt@kernel.org>,
 x86@kernel.org, linux-mm@kvack.org, linux-coco@lists.linux.dev,
 linux-efi@vger.kernel.org, linux-kernel@vger.kernel.org,
 Mike Rapoport <rppt@linux.ibm.com>
References: <20220405234343.74045-1-kirill.shutemov@linux.intel.com>
 <20220405234343.74045-2-kirill.shutemov@linux.intel.com>
 <93a7cfdf-02e6-6880-c563-76b01c9f41f5@intel.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCHv4 1/8] mm: Add support for unaccepted memory
In-Reply-To: <93a7cfdf-02e6-6880-c563-76b01c9f41f5@intel.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08.04.22 21:11, Dave Hansen wrote:
> On 4/5/22 16:43, Kirill A. Shutemov wrote:
>> Kernel only needs to accept memory once after boot, so during the boot
>> and warm up phase there will be a lot of memory acceptance. After things
>> are settled down the only price of the feature if couple of checks for
>> PageUnaccepted() in allocate and free paths. The check refers a hot
>> variable (that also encodes PageBuddy()), so it is cheap and not visible
>> on profiles.
> 
> Let's also not sugar-coat this.  Page acceptance is hideously slow.
> It's agonizingly slow.  To boot, it's done holding a global spinlock
> with interrupts disabled (see patch 6/8).  At the very, very least, each
> acceptance operation involves a couple of what are effectively ring
> transitions, a 2MB memset(), and a bunch of cache flushing.
> 
> The system is going to be downright unusable during this time, right?
> 
> Sure, it's *temporary* and only happens once at boot.  But, it's going
> to suck.
> 
> Am I over-stating this in any way?
> 
> The ACCEPT_MEMORY vmstat is good to have around.  Thanks for adding it.
>  But, I think we should also write down some guidance like:
> 
> 	If your TDX system seems as slow as snail after boot, look at
> 	the "accept_memory" counter in /proc/vmstat.  If it is
> 	incrementing, then TDX memory acceptance is likely to blame.
> 
> Do we need anything more discrete to tell users when acceptance is over?
>  For instance, maybe they run something and it goes really slow, they
> watch "accept_memory" until it stops.  They rejoice at their good
> fortune!  Then, memory allocation starts falling over to a new node and
> the agony beings anew.
> 
> I can think of dealing with this in two ways:
> 
> 	cat /sys/.../unaccepted_pages_left
> 
> which just walks the bitmap and counts the amount of pages remaining. or
> something like:
> 
> 	echo 1 > /sys/devices/system/node/node0/make_the_pain_stop
> 
> Which will, well, make the pain stop on node0.
> 

Either I'm missing something important or the random pain might just
take a really long time to stop?

I mean, we tend to reallocate the memory first that we freed last
(putting it to the head of the freelist when freeing and picking from
the head when allocating).

So unless your kernel goes crazy and allocates each and every page right
after boot, essentially accepting all memory, you might have random
unaccepted pages lurking at the tail of the freelists.

So if the VM is running for 355 days without significant memory
pressure, you can still run into unaccepted pages at day 356 that
results in a random delay due to acceptance of memory.


I think we most certainly want some way to make the random pain stop, or
to make the random pain go away after boot quickly. The
"unaccepted_pages_left" indicator would just be a "hey, there might be
random delays, but you cannot do anything about it". Magic toggles like
"make_the_pain_stop" are not so nice.

Can we simply automate this using a kthread or smth like that, which
just traverses the free page lists and accepts pages (similar, but
different to free page reporting)?

-- 
Thanks,

David / dhildenb

