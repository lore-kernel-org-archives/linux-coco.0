Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09534168
	for <linux-coco@lists.linux.dev>; Wed, 12 Jan 2022 18:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1642013119; x=1673549119;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Um0+dCThHlIVpdz2/59PejvkWBME4NoXAIzGQVp4iJU=;
  b=Ns6fc4RBJSQLwK9IP/sW43XUL9/0b9oQmJjz2iRSYzjDtbFZwZRYtsTW
   Z6PfrJjs0SrI8NCZxOrTpQRPX9IotGvDTtk1Cgrc8lGpqWAdV3n4r6lUp
   QWvOdyxAbc0HbOD9TSzWvmmTycfG8Aj/6bYmdg5tx6eFsPuDRN9fUGiAg
   xnGhgFuEe8e9C43GYhTueuv9X2I+gfrR6Q8TByiuj56Opiz5R4lyINQ3J
   PqIzNUwi/BV4n8sIZu9HzdW9big6w+nxd00iIxMZYKtPGQbzY4xSP1ZWC
   RGnO0BMM2uMjufdyaaSNUTC0oPRi95rF0/Va/TBCpMcWs4XsRw5HAKVqX
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10225"; a="243774906"
X-IronPort-AV: E=Sophos;i="5.88,282,1635231600"; 
   d="scan'208";a="243774906"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2022 10:40:56 -0800
X-IronPort-AV: E=Sophos;i="5.88,282,1635231600"; 
   d="scan'208";a="691495229"
Received: from kumarkan-mobl.amr.corp.intel.com (HELO [10.209.80.194]) ([10.209.80.194])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2022 10:40:55 -0800
Message-ID: <af7ceba3-c27e-9f18-6c1b-c251428d8da4@intel.com>
Date: Wed, 12 Jan 2022 10:40:53 -0800
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCHv2 1/7] mm: Add support for unaccepted memory
Content-Language: en-US
To: "Kirill A. Shutemov" <kirill@shutemov.name>
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
 x86@kernel.org, linux-mm@kvack.org, linux-coco@lists.linux.dev,
 linux-efi@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220111113314.27173-1-kirill.shutemov@linux.intel.com>
 <20220111113314.27173-2-kirill.shutemov@linux.intel.com>
 <3a68fabd-eaff-2164-5609-3a71fd4a7257@intel.com>
 <20220112183054.uedczc4ldntrj25j@box.shutemov.name>
From: Dave Hansen <dave.hansen@intel.com>
In-Reply-To: <20220112183054.uedczc4ldntrj25j@box.shutemov.name>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/12/22 10:30, Kirill A. Shutemov wrote:
> On Tue, Jan 11, 2022 at 11:46:37AM -0800, Dave Hansen wrote:
>>> diff --git a/mm/memblock.c b/mm/memblock.c
>>> index 1018e50566f3..6dfa594192de 100644
>>> --- a/mm/memblock.c
>>> +++ b/mm/memblock.c
>>> @@ -1400,6 +1400,7 @@ phys_addr_t __init memblock_alloc_range_nid(phys_addr_t size,
>>>    		 */
>>>    		kmemleak_alloc_phys(found, size, 0, 0);
>>> +	accept_memory(found, found + size);
>>>    	return found;
>>>    }
>>
>> This could use a comment.
> 
> How about this:
> 
> 	/*
> 	 * Some Virtual Machine platforms, such as Intel TDX or AMD SEV-SNP,
> 	 * requiring memory to be accepted before it can be used by the
> 	 * guest.
> 	 *
> 	 * Accept the memory of the allocated buffer.
> 	 */

I think a one-liner that might cue the reader to go look at 
accept_memory() itself would be fine.  Maybe:

	/* Make the memblock usable when running in picky VM guests: */

That implies that the memory isn't usable without doing this and also 
points out that it's related to running in a guest.

>> Looking at this, I also have to wonder if accept_memory() is a bit too
>> generic.  Should it perhaps be: cc_accept_memory() or
>> cc_guest_accept_memory()?
> 
> I'll rename accept_memory() to cc_accept_memory() and
> accept_and_clear_page_offline() to cc_accept_and_clear_page_offline().
> 
>>
>>> diff --git a/mm/page_alloc.c b/mm/page_alloc.c
>>> index c5952749ad40..5707b4b5f774 100644
>>> --- a/mm/page_alloc.c
>>> +++ b/mm/page_alloc.c
>>> @@ -1064,6 +1064,7 @@ static inline void __free_one_page(struct page *page,
>>>    	unsigned int max_order;
>>>    	struct page *buddy;
>>>    	bool to_tail;
>>> +	bool offline = PageOffline(page);
>>>    	max_order = min_t(unsigned int, MAX_ORDER - 1, pageblock_order);
>>> @@ -1097,6 +1098,10 @@ static inline void __free_one_page(struct page *page,
>>>    			clear_page_guard(zone, buddy, order, migratetype);
>>>    		else
>>>    			del_page_from_free_list(buddy, zone, order);
>>> +
>>> +		if (PageOffline(buddy))
>>> +			offline = true;
>>> +
>>>    		combined_pfn = buddy_pfn & pfn;
>>>    		page = page + (combined_pfn - pfn);
>>>    		pfn = combined_pfn;
>>> @@ -1130,6 +1135,9 @@ static inline void __free_one_page(struct page *page,
>>>    done_merging:
>>>    	set_buddy_order(page, order);
>>> +	if (offline)
>>> +		__SetPageOffline(page);
>>> +
> 
> I'll add
> 
> 	/* Mark page PageOffline() if any merged page was PageOffline() */
> 
> above the 'if'.
> 
>>>    	if (fpi_flags & FPI_TO_TAIL)
>>>    		to_tail = true;
>>>    	else if (is_shuffle_order(order))
>>
>> This is touching some pretty hot code paths.  You mention both that
>> accepting memory is slow and expensive, yet you're doing it in the core
>> allocator.
>>
>> That needs at least some discussion in the changelog.
> 
> That is page type transfer on page merging. What expensive do you see here?
> The cachelines with both struct pages are hot already.

I meant that comment generically rather than at this specific hunk.

Just in general, I think this series needs to acknowledge that it is 
touching very core parts of the allocator and might make page allocation 
*MASSIVELY* slower, albeit temporarily.

>>> @@ -1155,7 +1163,8 @@ static inline void __free_one_page(struct page *page,
>>>    static inline bool page_expected_state(struct page *page,
>>>    					unsigned long check_flags)
>>>    {
>>> -	if (unlikely(atomic_read(&page->_mapcount) != -1))
>>> +	if (unlikely(atomic_read(&page->_mapcount) != -1) &&
>>> +	    !PageOffline(page))
>>>    		return false;
>>
>> Looking at stuff like this, I can't help but think that a:
>>
>> 	#define PageOffline PageUnaccepted
>>
>> and some other renaming would be a fine idea.  I get that the Offline bit
>> can be reused, but I'm not sure that the "Offline" *naming* should be
>> reused.  What you're doing here is logically distinct from existing
>> offlining.
> 
> I find the Offline name fitting. In both cases page is not accessible
> without additional preparation.
> 
> Why do you want to multiply entities?

The name wouldn't be bad *if* there was no other use of "Offline".  But, 
logically, your use of "Offline" and the existing use of "Offline" are 
different things.  They are totally orthogonal areas of the code.  They 
should have different names.

Again, I'm fine with using the same _bit_ in page->flags.  But, the two 
logical uses need two different names.
