Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F06AD6AD4
	for <linux-coco@lists.linux.dev>; Fri, 22 Jul 2022 19:30:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1658518240; x=1690054240;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=yiC+//i7K9IE9d4hXO9yECQl7g97rBdGulNv7h3t0vA=;
  b=Yx3C8iMVLGaLqYcqha0/m41u2dhHrsR7I+lifvfEoZ4eTK6RZRp5hfKv
   0Pg/RzNsVWUZ7SlEbYR0xK/JE7FbhAq6EUMQ7STWxv1B+PyYYkbbuLFGO
   tc9FF4n7UpnI11VKwddKU99NxVciGUitF7PDl7PR4lqE1+2M2Hrh+WGoE
   vpsOp4oQn9jNCcvFGpJ7OAF6lOZX+6iqtnAGsZ0qcFrX3Wuj4bjh5df03
   bSrgCEONl01sF2gawYCPuvZzMrO31LVV5div9tWjHjr1oAdVUdFwEo5lQ
   5vCDOM76D+SgSQL7uOK3IOXytlHKbishopMRt8MAHGPsZQjj3zFTD0BQB
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10416"; a="286151803"
X-IronPort-AV: E=Sophos;i="5.93,186,1654585200"; 
   d="scan'208";a="286151803"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2022 12:30:39 -0700
X-IronPort-AV: E=Sophos;i="5.93,186,1654585200"; 
   d="scan'208";a="926161928"
Received: from jnoah-mobl.amr.corp.intel.com (HELO [10.209.71.211]) ([10.209.71.211])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2022 12:30:37 -0700
Message-ID: <707ca113-c2a2-8fe2-a22c-5be13adc7bb4@intel.com>
Date: Fri, 22 Jul 2022 12:30:36 -0700
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCHv7 02/14] mm: Add support for unaccepted memory
Content-Language: en-US
To: Borislav Petkov <bp@alien8.de>
Cc: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 Andy Lutomirski <luto@kernel.org>, Sean Christopherson <seanjc@google.com>,
 Andrew Morton <akpm@linux-foundation.org>, Joerg Roedel <jroedel@suse.de>,
 Ard Biesheuvel <ardb@kernel.org>, Andi Kleen <ak@linux.intel.com>,
 Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 David Rientjes <rientjes@google.com>, Vlastimil Babka <vbabka@suse.cz>,
 Tom Lendacky <thomas.lendacky@amd.com>, Thomas Gleixner
 <tglx@linutronix.de>, Peter Zijlstra <peterz@infradead.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Ingo Molnar <mingo@redhat.com>,
 Varad Gautam <varad.gautam@suse.com>, Dario Faggioli <dfaggioli@suse.com>,
 Mike Rapoport <rppt@kernel.org>, David Hildenbrand <david@redhat.com>,
 marcelo.cerri@canonical.com, tim.gardner@canonical.com,
 khalid.elmously@canonical.com, philip.cox@canonical.com, x86@kernel.org,
 linux-mm@kvack.org, linux-coco@lists.linux.dev, linux-efi@vger.kernel.org,
 linux-kernel@vger.kernel.org, Mike Rapoport <rppt@linux.ibm.com>
References: <20220614120231.48165-1-kirill.shutemov@linux.intel.com>
 <20220614120231.48165-3-kirill.shutemov@linux.intel.com>
 <YtltYRuL+2uQkYUK@zn.tnic> <ebcf2979-45fc-8d41-cc28-ac8da0d24245@intel.com>
 <Ytr4FCV2xPGUBLqs@zn.tnic>
From: Dave Hansen <dave.hansen@intel.com>
In-Reply-To: <Ytr4FCV2xPGUBLqs@zn.tnic>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/22/22 12:18, Borislav Petkov wrote:
> On Thu, Jul 21, 2022 at 08:49:31AM -0700, Dave Hansen wrote:
>> So, those (effective) 2MB clflush+memset's (plus a few thousand cycles
>> for the hypercall/tdcall transitions)
> 
> So this sounds strange - page validation on AMD - judging by the
> pseudocode of the PVALIDATE insn - does a bunch of sanity checks on the
> gVA of the page and then installs it into the RMP and also "PVALIDATE
> performs the same segmentation and paging checks as a 1-byte read.
> PVALIDATE does not invalidate TLB caches."
> 
> But that still sounds a lot less work than what the TDX module needs to
> do...

Sure does...  *Something* has to manage the cache coherency so that old
physical aliases of the converted memory don't write back and clobber
new data.  But, maybe the hardware is doing that now.


>> If you have a few hundred CPUs all trying to allocate memory (say,
>> doing the first kernel compile after a reboot), this is going to be
>> very, very painful for a while.
>>
>> That said, I think this is the right place to _start_. There is going
>> to need to be some kind of follow-on solution (likely background
>> acceptance of some kind). But, even with that solution, *this* code
>> is still needed to handle the degenerate case where the background
>> accepter can't keep up with foreground memory needs.
> 
> I'm still catering to the view that it should be a two-tier thing: you
> validate during boot a certain amount - say 4G - a size for which the
> boot delay is acceptable and you do the rest on-demand along with a
> background accepter.
> 
> That should give you the best of both worlds...

Yeah, that two-tier system is the way it's happening today from what I
understand.  This whole conversation is about how to handle the >4GB memory.
