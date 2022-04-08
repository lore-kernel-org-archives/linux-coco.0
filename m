Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B480E29AE
	for <linux-coco@lists.linux.dev>; Fri,  8 Apr 2022 19:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1649444661;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sI+CKaqjeLSRPAY+LGQfv54eFjnOUGa/yEw/6x76vKY=;
	b=b0U6WOeo0aU0PDAPIuGmyGLW7kFX6CvC4Rc5Bgv+0xBs9UFa9z/G3if/0FNGTOV/JzR53K
	Ngo1oDpwOuQLrMp4np+bJu28LkNtKSrltYDCRE9LG7wQjp+8FEEYHjU+SQarn9Vq0c9kk5
	IeDascBapYORfN3SwIRx56PFy4owsT4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-255-PteT6E4AOP6RpirWqCfOMQ-1; Fri, 08 Apr 2022 15:04:20 -0400
X-MC-Unique: PteT6E4AOP6RpirWqCfOMQ-1
Received: by mail-wm1-f71.google.com with SMTP id r64-20020a1c2b43000000b0038b59eb1940so4575907wmr.0
        for <linux-coco@lists.linux.dev>; Fri, 08 Apr 2022 12:04:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=sI+CKaqjeLSRPAY+LGQfv54eFjnOUGa/yEw/6x76vKY=;
        b=sU2QhBrKtPxHhS5VFKlLKkxnudc1d2C9bg8nMjDnaaYGH8tnG3qi68WlfvFX+JvWcw
         o+op66W2UtnogBvHQAsN21MHT8KV1WhBkkuOuR1QyrI26XRyzO9le8GC6X55f0GlH4u1
         4kQHY5zSUo/6nqJweGLmVp9plOWaBV/fxg50aYzEZGgg5dX4RO8SfqR65/uDqoH3BmM9
         vzCRHjl+GBFfayaK8/0lOnNbLVP+G3jKa6zsQveDnOtNKYsmQXgzakgbE41MbjIGd6d9
         ihM8vWRqka+1YmWWr/ufwn4ftYLzGxIAbXgAk5cpbpqEH+qhRURE+zmh1PhWyZmrvxma
         yIVg==
X-Gm-Message-State: AOAM533r5gPSul2VhKT20BGv2ZZLJAH4xu0iXkYyBJ+iTvWscVjnfhYA
	+ELJPeqZafJoAK+x4cf7K0tAakwCoD3+36Frv+A1eMLNSImo88JQQmC8a5ybhfoob9Slj3YBclz
	2H1HXMGBFZqwwgQ6qLyRyEg==
X-Received: by 2002:adf:9f03:0:b0:207:9071:1766 with SMTP id l3-20020adf9f03000000b0020790711766mr4743636wrf.331.1649444659294;
        Fri, 08 Apr 2022 12:04:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxwyaFoxo2wRi67tJhuDxDonRbQNSmnOVJ6SXAc1V3MXq6++aK0JF36Ux0bYx5kIK0LPTcQEw==
X-Received: by 2002:adf:9f03:0:b0:207:9071:1766 with SMTP id l3-20020adf9f03000000b0020790711766mr4743612wrf.331.1649444658934;
        Fri, 08 Apr 2022 12:04:18 -0700 (PDT)
Received: from ?IPV6:2003:cb:c704:fd00:612:f12b:a4a2:26b0? (p200300cbc704fd000612f12ba4a226b0.dip0.t-ipconnect.de. [2003:cb:c704:fd00:612:f12b:a4a2:26b0])
        by smtp.gmail.com with ESMTPSA id u23-20020a7bcb17000000b0037bdfa1665asm14481015wmj.18.2022.04.08.12.04.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Apr 2022 12:04:18 -0700 (PDT)
Message-ID: <0cbee9cc-f89a-81f2-f24a-784b0fd33bab@redhat.com>
Date: Fri, 8 Apr 2022 21:04:16 +0200
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCHv4 1/8] mm: Add support for unaccepted memory
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
 Dave Hansen <dave.hansen@intel.com>, Brijesh Singh <brijesh.singh@amd.com>,
 Mike Rapoport <rppt@kernel.org>, x86@kernel.org, linux-mm@kvack.org,
 linux-coco@lists.linux.dev, linux-efi@vger.kernel.org,
 linux-kernel@vger.kernel.org, Mike Rapoport <rppt@linux.ibm.com>
References: <20220405234343.74045-1-kirill.shutemov@linux.intel.com>
 <20220405234343.74045-2-kirill.shutemov@linux.intel.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20220405234343.74045-2-kirill.shutemov@linux.intel.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.04.22 01:43, Kirill A. Shutemov wrote:
> UEFI Specification version 2.9 introduces the concept of memory
> acceptance. Some Virtual Machine platforms, such as Intel TDX or AMD
> SEV-SNP, requiring memory to be accepted before it can be used by the
> guest. Accepting happens via a protocol specific for the Virtual Machine
> platform.
> 
> Accepting memory is costly and it makes VMM allocate memory for the
> accepted guest physical address range. It's better to postpone memory
> acceptance until memory is needed. It lowers boot time and reduces
> memory overhead.
> 
> Support of such memory requires a few changes in core-mm code:
> 
>   - memblock has to accept memory on allocation;
> 
>   - page allocator has to accept memory on the first allocation of the
>     page;
> 
> Memblock change is trivial.
> 
> The page allocator is modified to accept pages on the first allocation.
> PageUnaccepted() is used to indicate that the page requires acceptance.
> 
> Kernel only needs to accept memory once after boot, so during the boot
> and warm up phase there will be a lot of memory acceptance. After things
> are settled down the only price of the feature if couple of checks for
> PageUnaccepted() in allocate and free paths. The check refers a hot
> variable (that also encodes PageBuddy()), so it is cheap and not visible
> on profiles.
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

Thanks, I skimmed over most parts and nothing obvious jumped at me. Dave
has some good suggestions; I'll try giving it a thorough in the near future.


-- 
Thanks,

David / dhildenb

