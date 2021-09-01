Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 010313FD5
	for <linux-coco@lists.linux.dev>; Wed,  1 Sep 2021 17:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1630516141;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ppU0WSH8L8u52xOzHa0kdyUHC+mfjhjRB8vBl5001vI=;
	b=ATQOyzCCR/UmRXn5npMZRFaMpXiDdVI90e1bVeJzxvxj279t5CXfMpktHJYbFehdC7RgD6
	ZGnCAfwrXINByaHb5+pBo7aNcez8iBH/0xnwrETJZT9hyDQkFkzg/JG/dK8AKadO90v2dt
	UlH+V1pr3K9vSXmYthhyYDUtHV8C7Vk=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-512-fAYxt7HlNR2A3T0ty2F5-g-1; Wed, 01 Sep 2021 13:08:59 -0400
X-MC-Unique: fAYxt7HlNR2A3T0ty2F5-g-1
Received: by mail-wr1-f72.google.com with SMTP id h1-20020adffd41000000b0015931e17ccfso114863wrs.18
        for <linux-coco@lists.linux.dev>; Wed, 01 Sep 2021 10:08:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:references:from:organization:subject
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=ppU0WSH8L8u52xOzHa0kdyUHC+mfjhjRB8vBl5001vI=;
        b=fiH1o/A5UgZul0oufU3RqUX1jDV8FwbkPwuRyp0unodQ8Es2JnxZ5tlJUhc4yNDlid
         YKZbbwX2mr6rvzRU+CD+O2Yg6IMMVLJp84xgKCips+ikSbe2CYyqTAFlcczSF1F6yE4A
         s8N+ylTv14+9Bc0hsecEYrOYyRH76gVZCSzzy1QZgzQ87kmqf2vjT3uAXFXnior5/Xfr
         T7cBzduZ1mqJ2cEQBXtILkjkR6+sSCJAvjKrGXigmOPmug0VvIu35NqauUqZ5UOoHs36
         +5fOOIMMonQJVIIs3f8nIxWzmbKmOPCfyikmq57madmyGaTWcMAHeLFNEeTEFLRVlVC0
         aT7g==
X-Gm-Message-State: AOAM530A3TXyUhcz1NQxsLDvblBMq9C94rQR9EAjMsjVfDmTyRTipfv6
	D3gxYCwTyRNWJBulSwfDnySEYGhdFLNdVzsDAi/EsiYW6v3O9widdYRzOS2g5bFZw3PHCF6DyYt
	+aazx0a7sXb7oU9NK8gyELw==
X-Received: by 2002:a1c:7e8a:: with SMTP id z132mr436995wmc.75.1630516138294;
        Wed, 01 Sep 2021 10:08:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwtTx+lCLKYPuP/eNNEgNo/a72ut1zmit05cmxtndTEGk43A0rPKYZ+5URztN5SHWb3pXiUrA==
X-Received: by 2002:a1c:7e8a:: with SMTP id z132mr436955wmc.75.1630516138034;
        Wed, 01 Sep 2021 10:08:58 -0700 (PDT)
Received: from [192.168.3.132] (p4ff23f71.dip0.t-ipconnect.de. [79.242.63.113])
        by smtp.gmail.com with ESMTPSA id t14sm133532wmi.12.2021.09.01.10.08.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Sep 2021 10:08:57 -0700 (PDT)
To: jejb@linux.ibm.com, Andy Lutomirski <luto@kernel.org>,
 Sean Christopherson <seanjc@google.com>
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
 <YSlkzLblHfiiPyVM@google.com>
 <61ea53ce-2ba7-70cc-950d-ca128bcb29c5@redhat.com>
 <YS6lIg6kjNPI1EgF@google.com>
 <f413cc20-66fc-cf1e-47ab-b8f099c89583@redhat.com>
 <9ec3636a-6434-4c98-9d8d-addc82858c41@www.fastmail.com>
 <bd22ef54224d15ee89130728c408f70da0516eaa.camel@linux.ibm.com>
 <a259e10d-39c9-c4a5-0ab4-f42a1b9bfaee@redhat.com>
 <0d6b2a7e22f5e27e03abc21795124ccd66655966.camel@linux.ibm.com>
 <1a4a1548-7e14-c2b4-e210-cc60a2895acd@redhat.com>
 <4b863492fd33dce28a3a61662d649987b7d5066d.camel@linux.ibm.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [RFC] KVM: mm: fd-based approach for supporting KVM guest private
 memory
Message-ID: <214ca837-3102-d6d1-764e-6b4cd1bab368@redhat.com>
Date: Wed, 1 Sep 2021 19:08:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <4b863492fd33dce28a3a61662d649987b7d5066d.camel@linux.ibm.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

>>> Well not necessarily, but it depends how clever we want to get.  If
>>> you look over on the OVMF/edk2 list, there's a proposal to do guest
>>> migration via a mirror VM that invokes a co-routine embedded in the
>>> OVMF binary:
>>
>> Yes, I heard of that. "Interesting" design.
> 
> Heh, well what other suggestion do you have?  The problem is there
> needs to be code somewhere to perform some operations that's trusted by
> both the guest and the host.  The only element for a confidential VM
> that has this shared trust is the OVMF firmware, so it seems logical to
> use it.

<offtopic>

Let me put it this way: I worked with another architecture that doesn't 
fault on access of a secure page, but instead automatically 
exports/encrypts it so it can be swapped. It doesn't send a MCE and 
kills the host. It doesn't require fancy code in the guest firmware to 
export a page.

The code runs in the ultravisor -- yes, I'm talking about s390x. Now, I 
am not an expert on all of the glory details of TDX, SEV, ... to say 
which attack surface they introduced with that design, and if it can't 
be mitigated. I can only assume that there are real reasons (e.g., 
supporting an ultravisor is problematic, patents? ;) ) why x86-64 is 
different.

So whenever I see something really complicated to work around such 
issues, it feels to me like a hardware/platform limitation is making our 
life hard and forces us to come up with such "interesting" designs.

Sure, it's logical in this context, but it feels like "The house doesn't 
have a door, so I'll have to climb through the window.". It gets the job 
done but isn't ideally what you'd want to have. If you understand what I 
am trying to say :)

</offtopic>

> 
>>
>>> https://patchew.org/EDK2/20210818212048.162626-1-tobin@linux.ibm.com/
>>>
>>> This gives us a page encryption mechanism that's provided by the
>>> host but accepted via the guest using attestation, meaning we have
>>> a mutually trusted piece of code that can use to extract encrypted
>>> pages. It does seem it could be enhanced to do swapping for us as
>>> well if that's a road we want to go down?
>>
>> Right, but that's than no longer ballooning, unless I am missing
>> something important. You'd ask the guest to export/import, and you
>> can trust it. But do we want to call something like that out of
>> random kernel context when swapping/writeback, ...? Hard to tell.
>> Feels like it won't win in a beauty contest.
> 
> What I was thinking is that OVMF can emulate devices in this trusted
> code ... another potential use for it is a trusted vTPM for SEV-SNP so
> we can do measured boot.  To use it we'd give the guest kernel some
> type of virtual swap driver that attaches to this OVMF device.  I
> suppose by the time we've done this, it really does look like a
> balloon, but I'd like to think of it more as a paravirt memory
> controller since it might be used to make a guest more co-operative in
> a host overcommit situation.
> 
> That's not to say we *should* do this, merely that it doesn't have to
> look like a pig with lipstick.

It's an interesting approach: it would essentially mean that the OVMF 
would swap pages out to some virtual device and then essentially 
"inflate" the pages like a balloon. Still, it doesn't sound like 
something you want to trigger from actual kernel context when actually 
swapping in the kernel. It would much rather be something like other 
balloon implementations: completely controlled by user space.

So yes, "doesn't look like a pig with lipstick", but still compared to 
proper in-kernel swapping, looks like a workaround.

-- 
Thanks,

David / dhildenb

