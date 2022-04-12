Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA6811FC6
	for <linux-coco@lists.linux.dev>; Tue, 12 Apr 2022 16:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649780424; x=1681316424;
  h=message-id:date:mime-version:to:cc:references:from:
   subject:in-reply-to:content-transfer-encoding;
  bh=0rhW/syVVmAH9bt4RVUxl07dFxjacizqjOlvBoRg8/g=;
  b=fznSP2bUn7v4Ce0vpBCs82h78w1kZi6hb3wnYbGSkKWm7LXLfuM8jlTj
   Ba7c+7aEjvEk8un7JwB1UoZYYehZtq2OUzRBtMbqUZQagCSgz80RJY4PQ
   rsjkx18NpD/iJd2bbITej4HRK0ZgJcr69DDTQMYggfLzgkwT0KtA18+uF
   Ms46StGsai17O+vdc/E9/SNQzC4gcaf2KU23Sr5kBQBi9lrwI/cPikW0m
   I4+AKNtlVo0GNcf/ldoVHElfmx/AkeOdeSOgqseemge5i4yKhNHeCErav
   f9s3xZ+uqk3DaKcp5tZoeoETHLBR9JCV/L54UNCB8YgqhdVV4/VMVvFZa
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10315"; a="262597755"
X-IronPort-AV: E=Sophos;i="5.90,254,1643702400"; 
   d="scan'208";a="262597755"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2022 09:08:39 -0700
X-IronPort-AV: E=Sophos;i="5.90,254,1643702400"; 
   d="scan'208";a="551773930"
Received: from vtelkarx-mobl.amr.corp.intel.com (HELO [10.209.191.73]) ([10.209.191.73])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2022 09:08:37 -0700
Message-ID: <ebf3ccef-e6fe-62d5-74e8-91e30e7c2642@intel.com>
Date: Tue, 12 Apr 2022 09:08:43 -0700
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: David Hildenbrand <david@redhat.com>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
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
 x86@kernel.org, linux-mm@kvack.org, linux-coco@lists.linux.dev,
 linux-efi@vger.kernel.org, linux-kernel@vger.kernel.org,
 Mike Rapoport <rppt@linux.ibm.com>
References: <20220405234343.74045-1-kirill.shutemov@linux.intel.com>
 <20220405234343.74045-2-kirill.shutemov@linux.intel.com>
 <93a7cfdf-02e6-6880-c563-76b01c9f41f5@intel.com>
 <ff9e0bad-be9a-97ac-ae88-d22bcfbe80d4@redhat.com>
From: Dave Hansen <dave.hansen@intel.com>
Subject: Re: [PATCHv4 1/8] mm: Add support for unaccepted memory
In-Reply-To: <ff9e0bad-be9a-97ac-ae88-d22bcfbe80d4@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/12/22 01:15, David Hildenbrand wrote:
> Can we simply automate this using a kthread or smth like that, which
> just traverses the free page lists and accepts pages (similar, but
> different to free page reporting)?

That's definitely doable.

The downside is that this will force premature consumption of physical
memory resources that the guest may never use.  That's a particular
problem on TDX systems since there is no way for a VMM to reclaim guest
memory short of killing the guest.

In other words, I can see a good argument either way:
1. The kernel should accept everything to avoid the perf nastiness
2. The kernel should accept only what it needs in order to reduce memory
   use

I'm kinda partial to #1 though, if I had to pick only one.

The other option might be to tie this all to DEFERRED_STRUCT_PAGE_INIT.
 Have the rule that everything that gets a 'struct page' must be
accepted.  If you want to do delayed acceptance, you do it via
DEFERRED_STRUCT_PAGE_INIT.
