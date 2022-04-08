Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2224629A8
	for <linux-coco@lists.linux.dev>; Fri,  8 Apr 2022 18:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649441327; x=1680977327;
  h=message-id:date:mime-version:to:cc:references:from:
   subject:in-reply-to:content-transfer-encoding;
  bh=lnjfjM6We5ORXBOaO26qklSGxKpKgnuGsjWUu4xUFlQ=;
  b=E9+j7a83rpxFeoHOQIhadrpXDrd41pCNGqhYvVoWzcf4Y3dgIGuQGGbU
   kRZ3wsuc6QZ0O5P/7woRKt29JTM9HSz5GQh8SaCy0ZKSqxVJfa2Efjbz1
   Ms51IEmqHmDcyuqqcyebSj/LlGT8IpJz6mt/yPmMiqTNajy9jP1+EZ93A
   aWAdrRVZMe74pNONmA0upUl+wleCi0ZW9wsVT3BxVudCVnmO+fc7KQfQN
   ikw87p8M49ncMAxZv9LDfdErnwfdjMqVOZ38CieZuPDukBBKile0LEQxY
   lzHBaUuwwQiRexVIiBxAwVpcgbV/ECl94QsX3cDRLHKz2eWoP+Yx9PsHX
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10311"; a="286654212"
X-IronPort-AV: E=Sophos;i="5.90,245,1643702400"; 
   d="scan'208";a="286654212"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2022 11:08:46 -0700
X-IronPort-AV: E=Sophos;i="5.90,245,1643702400"; 
   d="scan'208";a="525473383"
Received: from tsungtae-mobl.amr.corp.intel.com (HELO [10.134.43.198]) ([10.134.43.198])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2022 11:08:45 -0700
Message-ID: <1ac804b3-eaaf-e87d-2fb5-30125c81ae28@intel.com>
Date: Fri, 8 Apr 2022 11:08:48 -0700
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
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
 Brijesh Singh <brijesh.singh@amd.com>, Mike Rapoport <rppt@kernel.org>,
 David Hildenbrand <david@redhat.com>, x86@kernel.org, linux-mm@kvack.org,
 linux-coco@lists.linux.dev, linux-efi@vger.kernel.org,
 linux-kernel@vger.kernel.org, Mike Rapoport <rppt@linux.ibm.com>
References: <20220405234343.74045-1-kirill.shutemov@linux.intel.com>
 <20220405234343.74045-6-kirill.shutemov@linux.intel.com>
From: Dave Hansen <dave.hansen@intel.com>
Subject: Re: [PATCHv4 5/8] x86/mm: Reserve unaccepted memory bitmap
In-Reply-To: <20220405234343.74045-6-kirill.shutemov@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/5/22 16:43, Kirill A. Shutemov wrote:
> A given page of memory can only be accepted once.  The kernel has a need
> to accept memory both in the early decompression stage and during normal
> runtime.
> 
> A bitmap used to communicate the acceptance state of each page between the
> decompression stage and normal runtime.  This eliminates the possibility of
> attempting to double-accept a page.

... which is fatal, right?  Could you include that an also the rationale
for why it is fatal?

> The bitmap is allocated in EFI stub, decompression stage updates the state
> of pages used for the kernel and initrd and hands the bitmap over to the
> main kernel image via boot_params.

This is really good info.  Could we maybe expand it a bit?

There are several steps in the bitmap's lifecycle:
1. Bitmap is allocated in the EFI stub
2. The kernel decompression code locates it, accepts some pages before
   decompression and marks them in the bitmap.
3. Decompression code points to the bitmap via a boot_param
4. Main kernel locates bitmap via the boot_param and uses it to guide
   runtime acceptance decisions.

> In the runtime kernel, reserve the bitmap's memory to ensure nothing
> overwrites it.
> 
> Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
> Acked-by: Mike Rapoport <rppt@linux.ibm.com>
> ---
>  arch/x86/kernel/e820.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/arch/x86/kernel/e820.c b/arch/x86/kernel/e820.c
> index f267205f2d5a..22d1fe48dcba 100644
> --- a/arch/x86/kernel/e820.c
> +++ b/arch/x86/kernel/e820.c
> @@ -1316,6 +1316,16 @@ void __init e820__memblock_setup(void)
>  	int i;
>  	u64 end;
>  
> +	/* Mark unaccepted memory bitmap reserved */
> +	if (boot_params.unaccepted_memory) {
> +		unsigned long size;
> +
> +		/* One bit per 2MB */
> +		size = DIV_ROUND_UP(e820__end_of_ram_pfn() * PAGE_SIZE,
> +				    PMD_SIZE * BITS_PER_BYTE);
> +		memblock_reserve(boot_params.unaccepted_memory, size);
> +	}

One oddity here: The size is implied by the e820's contents.  Did you
mention somewhere that unaccepted memory is considered E820_TYPE_RAM?
It *has* to be in order for e820__end_of_ram_pfn() to work, right?

