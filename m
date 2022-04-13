Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 480FE290C
	for <linux-coco@lists.linux.dev>; Wed, 13 Apr 2022 15:36:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649864209; x=1681400209;
  h=message-id:date:mime-version:to:cc:references:from:
   subject:in-reply-to:content-transfer-encoding;
  bh=oIiCjJKpo00HkSNcMJpuGaaA17RzsSWMzH4oj7iHyy8=;
  b=iaZGa5Of1F9NtoV2k2W3QwpWRV9g0fb5vvkCvsyZcRW2hdPqewsEt4yg
   1XeEIDz0WR0Uyur+ZSLbC3Lj0TN+HHyrSMDu9+gSj5Un1e8V4a7uIyh0E
   LYH0zbdfDeZmS13BtfLZ8JqSvfCWMXfum1JE9Wr5I4FIpsX04nqjbixF1
   245pH+eCxW/0Ocn0w2Owr5T2iSSXZkSXK5flAeoqfiCR/V74QrQmAs7i7
   4psv28IIxBey5Tp6YeEu1WFKMzbs4EPHho8DS8s4CiT5enxamLRYCyaG1
   Ljw7vNoaM/jkfITCs7/ChYyJDOXF/CjTxH+BRph2Q3PrqvHvHvg5z/hAU
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10316"; a="243286233"
X-IronPort-AV: E=Sophos;i="5.90,257,1643702400"; 
   d="scan'208";a="243286233"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2022 08:36:48 -0700
X-IronPort-AV: E=Sophos;i="5.90,257,1643702400"; 
   d="scan'208";a="559791794"
Received: from jmsepko-mobl.amr.corp.intel.com (HELO [10.212.61.150]) ([10.212.61.150])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2022 08:36:45 -0700
Message-ID: <cfcf9f82-7e5f-58b6-7b47-9ac552832596@intel.com>
Date: Wed, 13 Apr 2022 08:36:52 -0700
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: "Kirill A. Shutemov" <kirill@shutemov.name>,
 David Hildenbrand <david@redhat.com>
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
 <93a7cfdf-02e6-6880-c563-76b01c9f41f5@intel.com>
 <ff9e0bad-be9a-97ac-ae88-d22bcfbe80d4@redhat.com>
 <ebf3ccef-e6fe-62d5-74e8-91e30e7c2642@intel.com>
 <a458c13f-9994-b227-ff61-bfdfec10bc27@redhat.com>
 <20220413113024.ycvocn6ynerl3b7m@box.shutemov.name>
From: Dave Hansen <dave.hansen@intel.com>
Subject: Re: [PATCHv4 1/8] mm: Add support for unaccepted memory
In-Reply-To: <20220413113024.ycvocn6ynerl3b7m@box.shutemov.name>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/13/22 04:30, Kirill A. Shutemov wrote:
>> 2) Fast boot; after boot, all memory will slowly but steadily get
>>    accepted in the background. After a while, all memory is accepted and
>>    can be signaled to user space.
...
> Frankly, I think option 2 is the worst one. You still CPU cycles from the
> workload after boot to do the job that may or may not be needed. It is an
> half-measure that helps nobody.

Let's not be too hyperbolic here.  "Worst" is entirely subjective and it
totally depends on your perspective and what you care about.

There are basically four options:

 * Accept everything in early boot
 * Accept with deferred page free
 * Accept with kthread after boot
 * Accept on demand

and four things that matter:

 * Code complexity
 * Time to a shell prompt
 * CPU/Memory waste
 * Deterministic overhead

Did I miss any?

News flash: none of the options wins on all the things that matter.
We're going to have to pick one (or maybe two).  I'm also not horribly
convinced that there's a problem here worth solving, especially one that
requires surgery in the core of the buddy allocator.

This is essentially making a performance argument: it takes too long to
boot if we go with a simpler solution.  Yet, I haven't seen any data.  I
think we need to go with the simplest approach(es) until there's some
actual data to guide us here.

Here's another way to look at it:

> https://docs.google.com/spreadsheets/d/1Fpv0Yp0CTF5_JXHR2pywvNtImTwUVGTxDMlJ5t8qiis/edit?usp=sharing

