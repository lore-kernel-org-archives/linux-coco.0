Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0D0F28EE
	for <linux-coco@lists.linux.dev>; Wed, 13 Apr 2022 11:32:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1649849545;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cw+3SgfZDxAhFDomQUYr7roHFhrC3wRHLqsz1pX4r4U=;
	b=ZONQ+fl4TgyeXnI3KWBUrxGjhAem7g/aPmUqHGswnah1K3fiq4q+vF6vyhPQjyyFJTEvDS
	U8Dvx3tom4Mtyu+VCW2gbxtkhsRopjMQksx6QaPveX8i9kOcU6KdFLN5j0HuIMccs802o8
	yNdOaBc8uMM6N2kotvhnAoypew9WK1A=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-563-RBvZ9bXUNT2fqy5I-i9AVQ-1; Wed, 13 Apr 2022 07:32:24 -0400
X-MC-Unique: RBvZ9bXUNT2fqy5I-i9AVQ-1
Received: by mail-wm1-f72.google.com with SMTP id n21-20020a05600c4f9500b0038e3b0aa367so1824098wmq.1
        for <linux-coco@lists.linux.dev>; Wed, 13 Apr 2022 04:32:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=cw+3SgfZDxAhFDomQUYr7roHFhrC3wRHLqsz1pX4r4U=;
        b=S/bR6+sRPswgcnkWSoi/9av8GF38dtmaZi5XQ5UwTE84wbDlDKkk+UriLx8hrwq4pJ
         ktgNwE2PN/DP7AR0VHR/qINpRbIAhjHgd8m2yiBzqx7QrqxPEXFFgmXpiWSlw+xqZmwB
         tNNNM9UfevuMWk4ILYBBw8HiuKhgbLAzNG7wU7FrurB76wpgIuCPb+EPAwTnGbi6DHZK
         otlmac3bvfWVtutICDSWG+x6oeWDWkWKsqJ4L57r/n3Cqhvp4kbjZT7THhkti3K+mVXj
         mBcdj0uP/IBkNFrc1bxksY/BFY2inRW+a3RcpC5jGSYiih1JlXmXN3IEp/R6ymDnheiH
         wCZg==
X-Gm-Message-State: AOAM533G9igYCkdr4SHeC98BNtqFHr3wrKHO3H9/LokVCSUgdeW2iw1S
	ErpIIk+gcbQqQSJZsQ8gz7Qx6RB63squ/MARAUDx1E3OwYOTIFHp/PknQgdeb4FSnUKJxRWNcO6
	W5/kpTiUO8skVM+wHD6Pc+Q==
X-Received: by 2002:adf:dd10:0:b0:207:a8ce:c152 with SMTP id a16-20020adfdd10000000b00207a8cec152mr9888712wrm.714.1649849543294;
        Wed, 13 Apr 2022 04:32:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwpw+J1XKXzR0hCFUlh7TDtDEB5sanD73+NCToQFB1rqBDGGXxpw/7OeMjq4vgU34cwcTjz7Q==
X-Received: by 2002:adf:dd10:0:b0:207:a8ce:c152 with SMTP id a16-20020adfdd10000000b00207a8cec152mr9888690wrm.714.1649849543000;
        Wed, 13 Apr 2022 04:32:23 -0700 (PDT)
Received: from ?IPV6:2003:cb:c704:5800:1078:ebb9:e2c3:ea8c? (p200300cbc70458001078ebb9e2c3ea8c.dip0.t-ipconnect.de. [2003:cb:c704:5800:1078:ebb9:e2c3:ea8c])
        by smtp.gmail.com with ESMTPSA id p125-20020a1c2983000000b0038e6c62f527sm2554558wmp.14.2022.04.13.04.32.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Apr 2022 04:32:22 -0700 (PDT)
Message-ID: <f79814f4-1597-41b0-27e7-af4a6459c179@redhat.com>
Date: Wed, 13 Apr 2022 13:32:21 +0200
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCHv4 1/8] mm: Add support for unaccepted memory
To: "Kirill A. Shutemov" <kirill@shutemov.name>
Cc: Dave Hansen <dave.hansen@intel.com>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 Sean Christopherson <seanjc@google.com>,
 Andrew Morton <akpm@linux-foundation.org>, Joerg Roedel <jroedel@suse.de>,
 Ard Biesheuvel <ardb@kernel.org>, Andi Kleen <ak@linux.intel.com>,
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
 <ff9e0bad-be9a-97ac-ae88-d22bcfbe80d4@redhat.com>
 <ebf3ccef-e6fe-62d5-74e8-91e30e7c2642@intel.com>
 <a458c13f-9994-b227-ff61-bfdfec10bc27@redhat.com>
 <20220413113024.ycvocn6ynerl3b7m@box.shutemov.name>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20220413113024.ycvocn6ynerl3b7m@box.shutemov.name>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.04.22 13:30, Kirill A. Shutemov wrote:
> On Wed, Apr 13, 2022 at 12:36:11PM +0200, David Hildenbrand wrote:
>> On 12.04.22 18:08, Dave Hansen wrote:
>>> On 4/12/22 01:15, David Hildenbrand wrote:
>>>> Can we simply automate this using a kthread or smth like that, which
>>>> just traverses the free page lists and accepts pages (similar, but
>>>> different to free page reporting)?
>>>
>>> That's definitely doable.
>>>
>>> The downside is that this will force premature consumption of physical
>>> memory resources that the guest may never use.  That's a particular
>>> problem on TDX systems since there is no way for a VMM to reclaim guest
>>> memory short of killing the guest.
>>
>> IIRC, the hypervisor will usually effectively populate all guest RAM
>> either way right now.
> 
> No, it is not usual. By default QEMU/KVM uses anonymous mapping and
> fault-in memory on demand.
> 
> Yes, there's an option to pre-populate guest memory, but it is not the
> default.

Let me be clearer: I'm talking about the TDX/SEV world, not ordinary
unencrypted VMs. For ordinary encrypted VMs we do have populate on
demand frequently.

For SEV we currently pin all guest memory and consequently don't have
populate on demand. For TDX, again, I did not follow how fd-based
private guest memory will behave. I thought I remembered that we will
similarly not have populate-on-demand.

Preallocation is usually used with huge pages, but I guess that's out of
scope right now for encrypted VMs.


-- 
Thanks,

David / dhildenb

