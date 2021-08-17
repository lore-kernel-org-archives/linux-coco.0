Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A862173
	for <linux-coco@lists.linux.dev>; Tue, 17 Aug 2021 15:01:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1629212460;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yGg8Z4A5xf8oGJMYeSLD5P5QfCrx/EVCnSOaaJXq7EU=;
	b=B6XOq4YuyvfhipDRykN/9sY6QnzZsK4vpJivkTx+5j1+vtJ000USgqryvCgQ3GX32QLVf7
	9QSmMbfCej5Q+go9b5yWkp57bFPg1J7DnXy3kGuSjmfiTQFuolIu4aAybiQlTV8FoSknuI
	iY0IhJzFj4lm7bGgEyZZQUJMaFOasuM=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-306-__HfGLjhPviorqPbYqcbHA-1; Tue, 17 Aug 2021 11:00:59 -0400
X-MC-Unique: __HfGLjhPviorqPbYqcbHA-1
Received: by mail-wm1-f69.google.com with SMTP id z186-20020a1c7ec30000b02902e6a27a9962so1058988wmc.3
        for <linux-coco@lists.linux.dev>; Tue, 17 Aug 2021 08:00:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:references:from:organization:subject
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=yGg8Z4A5xf8oGJMYeSLD5P5QfCrx/EVCnSOaaJXq7EU=;
        b=XV0+wsW9KLhk8gS3EwKi0HTKjxANo6kHYRLDUVgqdt/SxaxBa5szI6LzzRW007q450
         vvjyt3Ac7e5UZkYmhgLOkLaOkDpY4hnRd+wCBC5Ua0Qw996rCZuLKvJ2Iunv/luBn4Pr
         wzC/yKyYtg5xaffPqhGIQkTzo454Wvoe4rCSS2b+YWRLfpdVacd4Ag8BHQSJrkv1G/Dp
         lrUUqVSBe8/SZ0vahoSsTsM8sO7k1gDGIUr0zTGVFXHsQECsOp1RjLtgEgCVPJhc3A1Z
         8L6e6PJPHefST7JHMrqN3IOClOsPd0j7TMDiQ9Gistidlt62C61KmUUDWv7JqioxM7LP
         OgqQ==
X-Gm-Message-State: AOAM532O6E14CBasuCtg5XZml80Hsr/sUSrJTMyqNVYI0P0T8PJYl0FH
	Y8GY+zGt4ZQBURCTCIgAAGEpzX+gx7BCMmWlvJCXeoWAaXZrrvhKFbeRiH1SW9IYuTJhetRmYK8
	5L/rnKXqU3yEadI8cIETxVA==
X-Received: by 2002:a5d:5646:: with SMTP id j6mr4609610wrw.314.1629212457442;
        Tue, 17 Aug 2021 08:00:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyejLIxYhCB2E9DeA3krcwwCmu3fprlXT+ZDG/zyn7XM9Sp+8y2K9rvPbf9PtXB3ei0mDoIlA==
X-Received: by 2002:a5d:5646:: with SMTP id j6mr4609574wrw.314.1629212457208;
        Tue, 17 Aug 2021 08:00:57 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c65c6.dip0.t-ipconnect.de. [91.12.101.198])
        by smtp.gmail.com with ESMTPSA id w14sm2674088wrt.23.2021.08.17.08.00.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Aug 2021 08:00:56 -0700 (PDT)
To: Joerg Roedel <jroedel@suse.de>, Dave Hansen <dave.hansen@intel.com>
Cc: Andi Kleen <ak@linux.intel.com>, "Kirill A. Shutemov"
 <kirill@shutemov.name>, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Sean Christopherson <seanjc@google.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 David Rientjes <rientjes@google.com>, Vlastimil Babka <vbabka@suse.cz>,
 Tom Lendacky <thomas.lendacky@amd.com>, Thomas Gleixner
 <tglx@linutronix.de>, Peter Zijlstra <peterz@infradead.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Ingo Molnar <mingo@redhat.com>,
 Varad Gautam <varad.gautam@suse.com>, Dario Faggioli <dfaggioli@suse.com>,
 x86@kernel.org, linux-mm@kvack.org, linux-coco@lists.linux.dev,
 linux-kernel@vger.kernel.org,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
References: <20210810062626.1012-1-kirill.shutemov@linux.intel.com>
 <20210810062626.1012-2-kirill.shutemov@linux.intel.com>
 <d091b333-9ef8-ac32-58c5-c325d29f26d7@intel.com>
 <9748c07c-4e59-89d0-f425-c57f778d1b42@linux.intel.com>
 <17b6a3a3-bd7d-f57e-8762-96258b16247a@intel.com>
 <796a4b20-7fa3-3086-efa0-2f728f35ae06@linux.intel.com>
 <f445da8b-c044-3765-65f2-f911dbf6a507@intel.com>
 <3caf5e73-c104-0057-680c-7851476e67ac@linux.intel.com>
 <YRTZr/Pxyb8fsV58@suse.de> <25312492-5d67-e5b0-1a51-b6880f45a550@intel.com>
 <YRaGch+D5HPtUk9l@suse.de>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH 1/5] mm: Add support for unaccepted memory
Message-ID: <b0228048-d2c2-6081-cfae-147e17acf785@redhat.com>
Date: Tue, 17 Aug 2021 17:00:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <YRaGch+D5HPtUk9l@suse.de>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 13.08.21 16:49, Joerg Roedel wrote:
> Hi Dave,
> 
> On Thu, Aug 12, 2021 at 07:14:20AM -0700, Dave Hansen wrote:
>> maybe_accept_page()
>> {
>> 	unsigned long huge_pfn = page_to_phys(page) / PMD_SIZE;
>>
>> 	/* Test the bit before taking any locks: */
>> 	if (test_bit(huge_pfn, &accepted_bitmap))
>> 		return;
>>
>> 	spin_lock_irq();
>> 	/* Retest inside the lock: */
>> 	if (test_bit(huge_pfn, &accepted_bitmap))
>> 		return;
>> 	tdx_accept_page(page, PMD_SIZE);
>> 	set_bit(huge_pfn, &accepted_bitmap));
>> 	spin_unlock_irq();
>> }
> 
> Yeah, this could work, but the global lock is likely the show-stopper
> here. For SNP we also not allowed to double-validate, so we need
> something that basically indicates 'validation-is-ongoing' on a per 2MB
> basis.
> 
> I am not an mm expert, but a page flag probably doesn't work. The flag
> would be on the head of the 2MB range and when that page is already used
> somewhere else there is no guarantee that the flag will survive. But
> correct me if I am wrong here :)
> 
> The other options I can come up with are not great either:
> 
> 	1) using an AVL bit in the direct-mapping PMD of that page. The
> 	   page-table would only be walked if the bit in the
> 	   accept_bitmap is clear. But I am not sure that all memory
> 	   which needs to be validated is in the direct-map.
> 
> 	2) Use another page-sized bitmap. If the machine has more than
> 	   64GB of memory the bit index is wrapped around. This
> 	   shouldn't be a performance problem at runtime, if this page
> 	   is only consulted when the valid bit is clear in the
> 	   accept_bitmap.
> 
> MM experts could certainly come up with better ideas :)


Not sure if already discussed, but what about making sure that free 
pages are not a mixture (partially unaccepted, partially accepted).

You'd have to expose the pages in that granularity to the buddy 
(__free_pages_core), indicating the state. You'd have to reject merging 
pages of differing acceptance state.

Accepting a page would then be handled outside of the zone lock, 
completely controlled by the state.

So a page in the buddy would either be completely accepted or completely 
unaccepted, signaled e.g., by PageOffline().

Consequently, when allocating a 4KiB page, you'd split an unaccepted 
2MiB page into separate unaccepted pages. You'd grab one of the 
unaccepted 4KiB pages and accept it before initializing it and handing 
it out.

-- 
Thanks,

David / dhildenb

