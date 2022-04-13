Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5CE1290C
	for <linux-coco@lists.linux.dev>; Wed, 13 Apr 2022 16:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649866412; x=1681402412;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=DWtb2usfjznadWpJhU4OziLP1yrGa1nabsKTrAq6jcE=;
  b=L95KrWvHGuqMtwePvXhMKEqtnJS+xskMtpplWC73Eg563fWM66XhqFF1
   HRdc03AEc3Zgrdz6HmkPHE4/oOr4dS0289S5qy7dD7sLdykXVYHvkzNrh
   wL6AkLazUCjGcZyVOT/t/N3sAV/QDphIVuDJfjCwT6/335C/O3UlOKhUA
   1P1Sj568wvkI8wst7FSbjRKOAY5svarcwGaqDDK0nGPClkbcN6xE+EegT
   Ofcf3JcufibfXTMUU2YFdU+jrvUdAdippbmbzWsS6V2y7R+fooETOHiER
   ewper5X10KCF0qjBVCjsixr2HFoickT7/iWtB0SBQv0iIUGFfBAKY93mA
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10316"; a="323152027"
X-IronPort-AV: E=Sophos;i="5.90,257,1643702400"; 
   d="scan'208";a="323152027"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2022 09:13:12 -0700
X-IronPort-AV: E=Sophos;i="5.90,257,1643702400"; 
   d="scan'208";a="559803224"
Received: from jmsepko-mobl.amr.corp.intel.com (HELO [10.212.61.150]) ([10.212.61.150])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2022 09:13:10 -0700
Message-ID: <6848cde8-697a-3fb5-e517-ae6e3413f188@intel.com>
Date: Wed, 13 Apr 2022 09:13:17 -0700
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCHv4 1/8] mm: Add support for unaccepted memory
Content-Language: en-US
To: David Hildenbrand <david@redhat.com>,
 "Kirill A. Shutemov" <kirill@shutemov.name>
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
 <cfcf9f82-7e5f-58b6-7b47-9ac552832596@intel.com>
 <dd197d57-ce40-82f6-fa5f-c0450b39e23f@redhat.com>
From: Dave Hansen <dave.hansen@intel.com>
In-Reply-To: <dd197d57-ce40-82f6-fa5f-c0450b39e23f@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/13/22 09:07, David Hildenbrand wrote:
> Simplest meaning: accept everything during early boot and don't touch
> core-mm/buddy code, correct?

Yes, exactly.
