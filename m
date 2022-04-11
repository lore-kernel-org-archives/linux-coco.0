Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B42D710EB
	for <linux-coco@lists.linux.dev>; Mon, 11 Apr 2022 08:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1649666858;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xO5/uXu6trmQnelozguxiW34fXYut6Mlb4fdD2t6SEU=;
	b=EMfGSGoEPUa57MHJNNJL/lS2d/NUBXqM8TtRYzwA8NeUSSeIPotQmq/epZDYUrUvXHdj0k
	ruUICm5dt5XkOrofTRT6MJtXsZ1SsT6vEPCcYnOL0K3HIOLiuBu9y29ZUO0By14vtp+Bqv
	0E+BVEByp95EPWkJiHByXVSV7xAdUTE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-633-eunntkDBM8G4E1Oz5eDgOQ-1; Mon, 11 Apr 2022 04:47:37 -0400
X-MC-Unique: eunntkDBM8G4E1Oz5eDgOQ-1
Received: by mail-wr1-f72.google.com with SMTP id f9-20020adf9f49000000b00207a6d8b67cso509956wrg.8
        for <linux-coco@lists.linux.dev>; Mon, 11 Apr 2022 01:47:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=xO5/uXu6trmQnelozguxiW34fXYut6Mlb4fdD2t6SEU=;
        b=XnSSnOytYFKXZY30H75fXQABElqRW6u0V2IDQhYB3JMRZDJetKFJ0xbmPwb83WaxV0
         oMQFaGC4zW9vW36NmXlxKB0hwAfrlyPyHbgxSvkJU4znPGbIVMK8+kHIxLjwComVbK8a
         ArISCDqQevnHw/zATcEsNQf/CODsDeX+4kInO01jnwsJaCuqXIxuElXSNQi+A1FupMUW
         E4dnVMeNvXnY+D+Q5ZsSqHRn1UhQdYfskmFDcqtAkx+pQ/vZvHl1kvhQ6zzTJop+Lo8f
         Al+ZlJub1ne+fEaii0miILLxGnZtpzh2icZ+BXt79JldAOk9JyEF4JTe71sOnU5/Q7QH
         MWug==
X-Gm-Message-State: AOAM531wdyGCHl6MjPOwMuS8FIw1wNlUUpqcMTmyZL8j7Y89VuNW8lMj
	c1PGG2UlB8IEHN77PH0TIZUDLH7AWAC3e0riJLFWaIupxdzmX8QpD3Ei2fQcsS0iC7RIcCFsVVP
	OYAC8tBp7gL+KLjQWzXC80w==
X-Received: by 2002:adf:db86:0:b0:205:bccf:8cbf with SMTP id u6-20020adfdb86000000b00205bccf8cbfmr23524566wri.346.1649666856072;
        Mon, 11 Apr 2022 01:47:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwU4i8tDZK4R8SDfWHRx/HMVMKbJaFD0rR9CAx62zvu90I37i9CuXip3i2xbgqxkZ/aEv7AAg==
X-Received: by 2002:adf:db86:0:b0:205:bccf:8cbf with SMTP id u6-20020adfdb86000000b00205bccf8cbfmr23524547wri.346.1649666855817;
        Mon, 11 Apr 2022 01:47:35 -0700 (PDT)
Received: from ?IPV6:2003:cb:c703:aa00:2064:15bd:222d:3a02? (p200300cbc703aa00206415bd222d3a02.dip0.t-ipconnect.de. [2003:cb:c703:aa00:2064:15bd:222d:3a02])
        by smtp.gmail.com with ESMTPSA id c4-20020a056000184400b00207a55f712asm3352085wri.37.2022.04.11.01.47.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Apr 2022 01:47:35 -0700 (PDT)
Message-ID: <1837b625-c63d-9feb-ec98-3b4c7b0040b4@redhat.com>
Date: Mon, 11 Apr 2022 10:47:33 +0200
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCHv4 1/8] mm: Add support for unaccepted memory
To: "Kirill A. Shutemov" <kirill@shutemov.name>,
 Dave Hansen <dave.hansen@intel.com>
Cc: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
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
 <767c2100-c171-1fd3-6a92-0af2e4bf3067@intel.com>
 <20220409155423.iv2arckmvavvpegt@box.shutemov.name>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20220409155423.iv2arckmvavvpegt@box.shutemov.name>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

>>>  	if (fpi_flags & FPI_TO_TAIL)
>>>  		to_tail = true;
>>>  	else if (is_shuffle_order(order))
>>> @@ -1149,7 +1192,8 @@ static inline void __free_one_page(struct page *page,
>>>  static inline bool page_expected_state(struct page *page,
>>>  					unsigned long check_flags)
>>>  {
>>> -	if (unlikely(atomic_read(&page->_mapcount) != -1))
>>> +	if (unlikely(atomic_read(&page->_mapcount) != -1) &&
>>> +	    !PageUnaccepted(page))
>>>  		return false;
>>
>> That probably deserves a comment, and maybe its own if() statement.
> 
> Own if does not work. PageUnaccepted() is encoded in _mapcount.
> 
> What about this:
> 
> 	/*
> 	 * page->_mapcount is expected to be -1.
> 	 *
> 	 * There is an exception for PageUnaccepted(). The page type can be set
> 	 * for pages on free list. Page types are encoded in _mapcount.
> 	 *
> 	 * PageUnaccepted() will get cleared in post_alloc_hook().
> 	 */
> 	if (unlikely((atomic_read(&page->_mapcount) | PG_unaccepted) != -1))
> 		return false;
> 
> ?
> 

Please don't. Keep the usage of PG_* details inside page-flags.h


-- 
Thanks,

David / dhildenb

