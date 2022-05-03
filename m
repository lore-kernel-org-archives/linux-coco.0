Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E2CD33CA
	for <linux-coco@lists.linux.dev>; Tue,  3 May 2022 20:24:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1651609466;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XuOARFW3gYZOmM4Y4nSXFBD8lHm6BchzW975izB6OwE=;
	b=Qg51rm1rXtnX1bLKv8Ve4w6xG4oUjOwJifG0I3HeVawg2X8xXjcJXWfmi74b2SP3uxFlBy
	g/7cpQZ3aVBIL5ik3+Cf8cFUbhTC8ktJkWBJE8kYh32gQCh1I+MrSr6SB8lt9W7zc9TTNa
	e897/ElNirWk+9/BFNtcNBmoPQ05Bww=
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
 [209.85.210.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-100-HrT7gWrPMRmTbEuMZUxe8w-1; Tue, 03 May 2022 16:21:24 -0400
X-MC-Unique: HrT7gWrPMRmTbEuMZUxe8w-1
Received: by mail-ot1-f72.google.com with SMTP id s15-20020a0568301c6f00b00605d7b44d8eso7732043otg.9
        for <linux-coco@lists.linux.dev>; Tue, 03 May 2022 13:21:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=XuOARFW3gYZOmM4Y4nSXFBD8lHm6BchzW975izB6OwE=;
        b=qo/FzfELbLalFiYrSnE9pYTrvLz8PRVD323J6qUDK/QjhOmeVmL9utCqeVJV8A+OqG
         3SHa/5oNIhaZDjx9lLWKeqL2xyMSJ7bekGqs4ery5NsrZdVFjjMz26GiJJ1ZJbM2XoUU
         LcmyvazJPh4L7hNxL6kzPCdq+npHMXge8FulAM5u3fpnbo+icnc4op3zM1PXp9yfFi/Z
         vxKNB2x3ZeVSSdJV5znQge5+4Es9iZCN9bliEYV2f4+ZPyrvV5mxG1Ti7aFScW6vqZjK
         JAr1Ng08iPZ6aJCmh5frUTd2sFAsJAMQQZ5ppZPet+aeJIggMgYco/G7aObyGhoaG2zV
         tJDA==
X-Gm-Message-State: AOAM531kOd1DUvafQzzOqqxuOXVnG6M0YleNr8AIh6x2bdcmJYNmzkDe
	6Kxk40bn/tWwNq0RpKaqKBJZ/kMfJ70yAUg0VUvY8FiLwcqyxy9WY1z4jlm9fO58C9n38zfz8Mc
	tVhrVdOCXSm7EzcIK07ud+A==
X-Received: by 2002:a05:6808:14d3:b0:325:ed6b:e748 with SMTP id f19-20020a05680814d300b00325ed6be748mr2683336oiw.105.1651609267935;
        Tue, 03 May 2022 13:21:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwKRbb5OLkMV2UmDQ1VLpoVhTPJwDt2cIVnFXrIsYyzxEIudxX/SPJKn8BJ62U+FH4qM5Vz5Q==
X-Received: by 2002:a05:6808:14d3:b0:325:ed6b:e748 with SMTP id f19-20020a05680814d300b00325ed6be748mr2683301oiw.105.1651609267392;
        Tue, 03 May 2022 13:21:07 -0700 (PDT)
Received: from [10.10.69.234] ([8.34.116.185])
        by smtp.gmail.com with ESMTPSA id w11-20020a4adecb000000b0035eb4e5a6cesm5328939oou.36.2022.05.03.13.21.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 May 2022 13:21:06 -0700 (PDT)
Message-ID: <2bb92a84-18f4-d007-9465-fdc19f6f1c86@redhat.com>
Date: Tue, 3 May 2022 22:21:03 +0200
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCHv5 02/12] mm: Add support for unaccepted memory
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
References: <20220425033934.68551-1-kirill.shutemov@linux.intel.com>
 <20220425033934.68551-3-kirill.shutemov@linux.intel.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20220425033934.68551-3-kirill.shutemov@linux.intel.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


>  
> +/*
> + * Page acceptance can be very slow. Do not call under critical locks.
> + */
> +static void accept_page(struct page *page, unsigned int order)
> +{
> +	phys_addr_t start = page_to_phys(page);
> +	int i;
> +
> +	accept_memory(start, start + (PAGE_SIZE << order));
> +
> +	for (i = 0; i < (1 << order); i++) {
> +		if (PageUnaccepted(page + i))
> +			__ClearPageUnaccepted(page + i);
> +	}
> +}

What was the rationale of leaving PageUnaccepted() set on sub-pages when
merging pages?

I'd just clear the flag when merging and avoid the loop here. You could
even assert here that we don't have any PageUnaccepted() on tail pages.

-- 
Thanks,

David / dhildenb

