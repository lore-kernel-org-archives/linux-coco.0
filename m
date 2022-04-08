Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1038258A
	for <linux-coco@lists.linux.dev>; Fri,  8 Apr 2022 17:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649437344; x=1680973344;
  h=message-id:date:mime-version:to:cc:references:from:
   subject:in-reply-to:content-transfer-encoding;
  bh=yyWbXS/ISGdNNtqxbp6nrln8YxFisMQHA7t8fOE4CaE=;
  b=jyoIiF5SedwtL2RR2UQaUXz8QEwIBxSnD6Y2q8ykj7bYUyvJ8dIwiXsD
   RY4XAnA1mIdcxEON/UjSCsR3HzmMtKUKcAr2KilprQGKYRi8rRXFN7IJz
   hKJ+2l9ss6ZJjFcXUYFUzUQlL7PigRZBSybXAdRqr1aHrBOMjrMXreKhZ
   kssyQ9jcKIi1ajXcF1hXsnGFmg+6721mdWoSp6s5GpaDgzLbsFVq9QaV9
   wuLD1AeYHicYJ6WZ0vGpEFmSPP+GMIEVyvxIPLd8hM3mXuD/uHfOUZjdb
   BdZqmC3qZnzC0Grz/Xdga7S9Fr5KQhIdlXI4aKGGSt2Uh6kXFMBFXilTO
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10310"; a="261328549"
X-IronPort-AV: E=Sophos;i="5.90,245,1643702400"; 
   d="scan'208";a="261328549"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2022 10:02:10 -0700
X-IronPort-AV: E=Sophos;i="5.90,245,1643702400"; 
   d="scan'208";a="525448716"
Received: from tsungtae-mobl.amr.corp.intel.com (HELO [10.134.43.198]) ([10.134.43.198])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2022 10:02:09 -0700
Message-ID: <95eabe79-a13b-79b1-1196-407920531f20@intel.com>
Date: Fri, 8 Apr 2022 10:02:13 -0700
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
 linux-kernel@vger.kernel.org
References: <20220405234343.74045-1-kirill.shutemov@linux.intel.com>
From: Dave Hansen <dave.hansen@intel.com>
Subject: Re: [PATCHv4 0/8] mm, x86/cc: Implement support for unaccepted memory
In-Reply-To: <20220405234343.74045-1-kirill.shutemov@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/5/22 16:43, Kirill A. Shutemov wrote:
> Patches 1-6/7 are generic and don't have any dependencies on TDX. They
> should serve AMD SEV needs as well. TDX-specific code isolated in the
> last patch.

Oh, that's quite nice.  Are the SEV-SNP folks planning on using this?
If they are, acks/reviews would be much appreciated.

