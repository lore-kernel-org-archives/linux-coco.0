Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E832168
	for <linux-coco@lists.linux.dev>; Tue, 11 Jan 2022 19:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1641928246; x=1673464246;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=guB/DjhT2AMQhK/vQUIlG64RQu1W/DQlUEBykbhTvTk=;
  b=KkBUu4stBMlxz0cJ+CBywL2HAIwBstIwLG6G9H8/+sIYn68wpRKHef+1
   P6aqZhPNfPCkl5Zs/CPOcJzLqRplwwASQxOlGVn3ZekrzTuavA1Njk2bS
   NW27uNLOOpsincQVTKS9nqc63OeYK2bBN52iwZdnLNen8JYSPCKiL9V0k
   snzVOdrA7Lm8q4rbHOA6ZIDc9G9qYnvpbMIw6jzJe9jQcTTqS9JBYnr0L
   akliwLhvJ6NoIBYv9LbP014FS8I50m71rwYApt0NUJrVcyyHdMMFEbjYh
   DSFp/iMd9CjWQnwSVWwftFsVFKGY1H/AGywz+3jfMU6V75OwOOUnQWNb5
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10224"; a="243519458"
X-IronPort-AV: E=Sophos;i="5.88,279,1635231600"; 
   d="scan'208";a="243519458"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2022 11:10:45 -0800
X-IronPort-AV: E=Sophos;i="5.88,279,1635231600"; 
   d="scan'208";a="613315060"
Received: from padhika1-mobl.amr.corp.intel.com (HELO [10.209.13.65]) ([10.209.13.65])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2022 11:10:44 -0800
Message-ID: <3a361a1d-0e14-8884-c5bb-90aeb87e38ef@intel.com>
Date: Tue, 11 Jan 2022 11:10:40 -0800
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCHv2 5/7] x86/mm: Reserve unaccepted memory bitmap
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
 x86@kernel.org, linux-mm@kvack.org, linux-coco@lists.linux.dev,
 linux-efi@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220111113314.27173-1-kirill.shutemov@linux.intel.com>
 <20220111113314.27173-6-kirill.shutemov@linux.intel.com>
From: Dave Hansen <dave.hansen@intel.com>
In-Reply-To: <20220111113314.27173-6-kirill.shutemov@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/11/22 03:33, Kirill A. Shutemov wrote:
> Unaccepted memory bitmap is allocated during decompression stage and
> handed over to main kernel image via boot_params. The bitmap is used to
> track if memory has been accepted.
> 
> Reserve unaccepted memory bitmap has to prevent reallocating memory for
> other means.

I'm having a hard time parsing that changelog, especially the second 
paragraph.  Could you give it another shot?

> +	/* Mark unaccepted memory bitmap reserved */
> +	if (boot_params.unaccepted_memory) {
> +		unsigned long size;
> +
> +		/* One bit per 2MB */
> +		size = DIV_ROUND_UP(e820__end_of_ram_pfn() * PAGE_SIZE,
> +				    PMD_SIZE * BITS_PER_BYTE);
> +		memblock_reserve(boot_params.unaccepted_memory, size);
> +	}

Is it OK that the size of the bitmap is inferred from 
e820__end_of_ram_pfn()?  Is this OK in the presence of mem= and other 
things that muck with the e820?
