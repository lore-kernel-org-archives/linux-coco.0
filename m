Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D3E8107A5
	for <linux-coco@lists.linux.dev>; Tue, 16 May 2023 18:27:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684261651; x=1715797651;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=h1IC5Du4s+rB6lI+ZptTZERfabS0oTlbNW5MVGmb3FA=;
  b=lwkqfTrRAgX/a6vIPcFBBRLEZpIrjf+3hwIpzeLKwRfAKc7DdsfCY55R
   uNEaIWvBTI1Bit2mn2JTbAxCNxi70Go2ghsG/5PdvHYW8BbTXDDxj6ITB
   9TIKpOe10OZH8ImELGYyBZbrzuMtnEmXqBOhyCDj/X/beooozluML5qTX
   1B2Z+JohwFuHGTWyC0dopxeBwQF3pIx00QTWrCJbkns+dWq/URRXTFXgE
   hAd9/k1I+1za5a6UTdE0uBQN3pw6OrCvOQb/3gcn8f0HCvQLsQwzTKE0E
   N3coyo9i8WOJUfGL5Li0GoWMIaLdMcPM9ls3cxrIVxla91RrsFDtpQsf4
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10712"; a="351587637"
X-IronPort-AV: E=Sophos;i="5.99,278,1677571200"; 
   d="scan'208";a="351587637"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2023 11:27:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10712"; a="771162721"
X-IronPort-AV: E=Sophos;i="5.99,278,1677571200"; 
   d="scan'208";a="771162721"
Received: from mtpanu-mobl1.amr.corp.intel.com (HELO [10.212.203.6]) ([10.212.203.6])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2023 11:27:16 -0700
Message-ID: <6fe42f66-819c-f2c8-176b-759c1c5a9cf5@intel.com>
Date: Tue, 16 May 2023 11:27:16 -0700
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCHv11 6/9] efi/unaccepted: Avoid load_unaligned_zeropad()
 stepping into unaccepted memory
Content-Language: en-US
To: Ard Biesheuvel <ardb@kernel.org>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Cc: Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 Sean Christopherson <seanjc@google.com>,
 Andrew Morton <akpm@linux-foundation.org>, Joerg Roedel <jroedel@suse.de>,
 Andi Kleen <ak@linux.intel.com>,
 Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 David Rientjes <rientjes@google.com>, Vlastimil Babka <vbabka@suse.cz>,
 Tom Lendacky <thomas.lendacky@amd.com>, Thomas Gleixner
 <tglx@linutronix.de>, Peter Zijlstra <peterz@infradead.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Ingo Molnar <mingo@redhat.com>,
 Dario Faggioli <dfaggioli@suse.com>, Mike Rapoport <rppt@kernel.org>,
 David Hildenbrand <david@redhat.com>,
 Mel Gorman <mgorman@techsingularity.net>, marcelo.cerri@canonical.com,
 tim.gardner@canonical.com, khalid.elmously@canonical.com,
 philip.cox@canonical.com, aarcange@redhat.com, peterx@redhat.com,
 x86@kernel.org, linux-mm@kvack.org, linux-coco@lists.linux.dev,
 linux-efi@vger.kernel.org, linux-kernel@vger.kernel.org,
 Dave Hansen <dave.hansen@linux.intel.com>
References: <20230513220418.19357-1-kirill.shutemov@linux.intel.com>
 <20230513220418.19357-7-kirill.shutemov@linux.intel.com>
 <CAMj1kXG488uW=dpvbfvdN1fMZVJ3kCZQoW3UVQJW1F2VEXyxHg@mail.gmail.com>
From: Dave Hansen <dave.hansen@intel.com>
In-Reply-To: <CAMj1kXG488uW=dpvbfvdN1fMZVJ3kCZQoW3UVQJW1F2VEXyxHg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/16/23 11:08, Ard Biesheuvel wrote:
>> But, this approach does not work for unaccepted memory. For TDX, a load
>> from unaccepted memory will not lead to a recoverable exception within
>> the guest. The guest will exit to the VMM where the only recourse is to
>> terminate the guest.
>>
> Does this mean that the kernel maps memory before accepting it? As
> otherwise, I would assume that such an access would page fault inside
> the guest before triggering an exception related to the unaccepted
> state.

Yes, the kernel maps memory before accepting it (modulo things like
DEBUG_PAGEALLOC).

