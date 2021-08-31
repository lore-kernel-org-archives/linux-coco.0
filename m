Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9B802FAF
	for <linux-coco@lists.linux.dev>; Tue, 31 Aug 2021 19:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1630437171;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=B3R8+9xCMOWLuSi664S67yIHwiGeNUaH36y7wRqkQk8=;
	b=FUZ/rXlQvZM75rOFydFPmME0oFtv5gGfsohVbJt6+t0S3qkB/FgcDZwuwAXC+2h3TsIPAH
	z+b3KXbrK2gx4K4mxjJaTqTzavOuyFAMmFGMqBQfuVJbZNHvhGPcrMc3Ew9z+9RmOmUrbu
	EnXrqXD6ymZoJO2ygWNZgnbINka5P5Y=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-260-8EaKS20zP2ylq8fH3Su8KA-1; Tue, 31 Aug 2021 15:12:47 -0400
X-MC-Unique: 8EaKS20zP2ylq8fH3Su8KA-1
Received: by mail-wr1-f69.google.com with SMTP id h14-20020a056000000e00b001575b00eb08so144946wrx.13
        for <linux-coco@lists.linux.dev>; Tue, 31 Aug 2021 12:12:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=B3R8+9xCMOWLuSi664S67yIHwiGeNUaH36y7wRqkQk8=;
        b=LDbZ8OnRQYvcDLjscNun8knJE+SRiS1evbinjg8uI4YOD29PNVhviIyIkBImED9mkZ
         d7I0k0Ub9PH2QX+bR5OF9OSjS5J+FcuveZzWNmQ8QsULo6wERf1mz8+k9JoqlV7FIHvf
         ip4yCj75jvBkzgPPesNu0+CIXxLo1FJN/d88tTciv5PwSfJVCVFkjMe6n6Ba4amTMS6E
         OyYZPPajLFNoc8XNn08mOIyv9eUEwahUwtNq/lGeYylMtS7cMpzDZ30WVuJFwQWTQB8U
         /P1Jqo/xoX9VhMbUtnZIkDylS4sdNBUGTe1ndYk7L3fR7A7h7e863RE54l0UmVH8wiLl
         xh/Q==
X-Gm-Message-State: AOAM533WufK85riHDJWCasbJUTE1pHHejrgwo6NPxmjVVHxib3Pw82RD
	cbCaYGZY7yKULJ6LG1zPtrS0BIot9WBENV7zPuRRpk2YABrQAsRJwQ6oeFS90mIoPS+I1PbVfAa
	FSiHUNoHZwqjDUWnUfy70+w==
X-Received: by 2002:a1c:f315:: with SMTP id q21mr5819457wmq.76.1630437166298;
        Tue, 31 Aug 2021 12:12:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxiLNTwKQMvs3colTkzHCAECIzU7cGUrdshsPwDbRyk3ubr6ahQwvcGeQbVyq70Sw5+SV5+fA==
X-Received: by 2002:a1c:f315:: with SMTP id q21mr5819425wmq.76.1630437166118;
        Tue, 31 Aug 2021 12:12:46 -0700 (PDT)
Received: from [192.168.3.132] (p4ff23bf5.dip0.t-ipconnect.de. [79.242.59.245])
        by smtp.gmail.com with ESMTPSA id f5sm3231993wmb.47.2021.08.31.12.12.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Aug 2021 12:12:45 -0700 (PDT)
Subject: Re: [RFC] KVM: mm: fd-based approach for supporting KVM guest private
 memory
To: Sean Christopherson <seanjc@google.com>, Andy Lutomirski <luto@kernel.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>,
 Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>,
 kvm list <kvm@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Borislav Petkov <bp@alien8.de>, Andrew Morton <akpm@linux-foundation.org>,
 Joerg Roedel <jroedel@suse.de>, Andi Kleen <ak@linux.intel.com>,
 David Rientjes <rientjes@google.com>, Vlastimil Babka <vbabka@suse.cz>,
 Tom Lendacky <thomas.lendacky@amd.com>, Thomas Gleixner
 <tglx@linutronix.de>, "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Varad Gautam <varad.gautam@suse.com>,
 Dario Faggioli <dfaggioli@suse.com>,
 the arch/x86 maintainers <x86@kernel.org>, linux-mm@kvack.org,
 linux-coco@lists.linux.dev,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 "Kirill A . Shutemov" <kirill@shutemov.name>,
 Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>,
 Dave Hansen <dave.hansen@intel.com>, Yu Zhang <yu.c.zhang@linux.intel.com>
References: <20210824005248.200037-1-seanjc@google.com>
 <307d385a-a263-276f-28eb-4bc8dd287e32@redhat.com>
 <40af9d25-c854-8846-fdab-13fe70b3b279@kernel.org>
 <cfe75e39-5927-c02a-b8bc-4de026bb7b3b@redhat.com>
 <73319f3c-6f5e-4f39-a678-7be5fddd55f2@www.fastmail.com>
 <YSlnJpWh8fdpddTA@google.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <949e6d95-266d-0234-3b86-6bd3c5267333@redhat.com>
Date: Tue, 31 Aug 2021 21:12:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <YSlnJpWh8fdpddTA@google.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 28.08.21 00:28, Sean Christopherson wrote:
> On Fri, Aug 27, 2021, Andy Lutomirski wrote:
>>
>> On Thu, Aug 26, 2021, at 2:26 PM, David Hildenbrand wrote:
>>> On 26.08.21 19:05, Andy Lutomirski wrote:
>>
>>>> Oof.  That's quite a requirement.  What's the point of the VMA once all
>>>> this is done?
>>>
>>> You can keep using things like mbind(), madvise(), ... and the GUP code
>>> with a special flag might mostly just do what you want. You won't have
>>> to reinvent too many wheels on the page fault logic side at least.
> 
> Ya, Kirill's RFC more or less proved a special GUP flag would indeed Just Work.
> However, the KVM page fault side of things would require only a handful of small
> changes to send private memslots down a different path.  Compared to the rest of
> the enabling, it's quite minor.
> 
> The counter to that is other KVM architectures would need to learn how to use the
> new APIs, though I suspect that there will be a fair bit of arch enabling regardless
> of what route we take.
> 
>> You can keep calling the functions.  The implementations working is a
>> different story: you can't just unmap (pte_numa-style or otherwise) a private
>> guest page to quiesce it, move it with memcpy(), and then fault it back in.
> 
> Ya, I brought this up in my earlier reply.  Even the initial implementation (without
> real NUMA support) would likely be painful, e.g. the KVM TDX RFC/PoC adds dedicated
> logic in KVM to handle the case where NUMA balancing zaps a _pinned_ page and then
> KVM fault in the same pfn.  It's not thaaat ugly, but it's arguably more invasive
> to KVM's page fault flows than a new fd-based private memslot scheme.

I might have a different mindset, but less code churn doesn't 
necessarily translate to "better approach".

I'm certainly not pushing for what I proposed (it's a rough, broken 
sketch). I'm much rather trying to come up with alternatives that try 
solving the same issue, handling the identified requirements.

I have a gut feeling that the list of requirements might not be complete 
yet. For example, I wonder if we have to protect against user space 
replacing private pages by shared pages or punishing random holes into 
the encrypted memory fd.

-- 
Thanks,

David / dhildenb

