Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C9FE53A4
	for <linux-coco@lists.linux.dev>; Mon, 29 Aug 2022 16:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1661790278; x=1693326278;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=k1Bydfd+WyOURaZCkIr7Wq133wz3qjLUnS9McjzhzJY=;
  b=ESz2tNDREPeDdxhnf3xDEL/4vIk3nW9Ky9uG1C+Z67iOOlZgNbEFfNNo
   ubqm23vl325elD5ZrA5oFBEwYBxBb9/9Koa+rS2xLlwpRPWTMZNUgvXuQ
   60mi9lc/U5X/XIx0I7uZ3xgERbySB+wGjZ9qIx16FbdHIFqTCvj8iVjhZ
   Arl2plC3R9Ch95evuilfz9Y+4twaPjLKy0ZNm6eiDo/cppFtpIXHjn0KZ
   +ht2Y5l5UURpSbbOfNQDNZoUp4+Zf5LSvzD9/tPEKnc3F7czizkTl0XwG
   07B73clm099RtSUfYgZq/xM+dW0CCJ3g7E3NFbUyQChWZS6DZ0q3/9q35
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10454"; a="281907462"
X-IronPort-AV: E=Sophos;i="5.93,272,1654585200"; 
   d="scan'208";a="281907462"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2022 09:19:31 -0700
X-IronPort-AV: E=Sophos;i="5.93,272,1654585200"; 
   d="scan'208";a="611342635"
Received: from rlacadex-mobl.amr.corp.intel.com (HELO [10.209.116.122]) ([10.209.116.122])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2022 09:19:30 -0700
Message-ID: <984e07ed-914f-93ca-a141-3fc8677878e0@intel.com>
Date: Mon, 29 Aug 2022 09:19:27 -0700
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCHv7 02/14] mm: Add support for unaccepted memory
Content-Language: en-US
To: Dionna Amalie Glaze <dionnaglaze@google.com>,
 Tom Lendacky <thomas.lendacky@amd.com>
Cc: Mel Gorman <mgorman@techsingularity.net>, Vlastimil Babka
 <vbabka@suse.cz>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 Sean Christopherson <seanjc@google.com>,
 Andrew Morton <akpm@linux-foundation.org>, Joerg Roedel <jroedel@suse.de>,
 Ard Biesheuvel <ardb@kernel.org>, Andi Kleen <ak@linux.intel.com>,
 Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 David Rientjes <rientjes@google.com>, Thomas Gleixner <tglx@linutronix.de>,
 Peter Zijlstra <peterz@infradead.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Ingo Molnar <mingo@redhat.com>, Dario Faggioli <dfaggioli@suse.com>,
 Mike Rapoport <rppt@kernel.org>, David Hildenbrand <david@redhat.com>,
 Marcelo Cerri <marcelo.cerri@canonical.com>, tim.gardner@canonical.com,
 Khalid ElMously <khalid.elmously@canonical.com>, philip.cox@canonical.com,
 the arch/x86 maintainers <x86@kernel.org>,
 Linux Memory Management List <linux-mm@kvack.org>,
 linux-coco@lists.linux.dev, linux-efi <linux-efi@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, Mike Rapoport <rppt@linux.ibm.com>
References: <20220614120231.48165-1-kirill.shutemov@linux.intel.com>
 <20220614120231.48165-3-kirill.shutemov@linux.intel.com>
 <8cf143e7-2b62-1a1e-de84-e3dcc6c027a4@suse.cz>
 <20220810141959.ictqchz7josyd7pt@techsingularity.net>
 <CAAH4kHa6s3sBRySNu-TZG_6vOaN4KheVy4kvxG5s=wOTDGy2=Q@mail.gmail.com>
 <2981e25e-9cda-518a-9750-b8694f2356b5@amd.com>
 <CAAH4kHbcfnVWNQHf6Mrg__bSFT6196Sx4kno6o0Zo7hsgOgnNw@mail.gmail.com>
From: Dave Hansen <dave.hansen@intel.com>
In-Reply-To: <CAAH4kHbcfnVWNQHf6Mrg__bSFT6196Sx4kno6o0Zo7hsgOgnNw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/29/22 09:02, Dionna Amalie Glaze wrote:
>>> The stack track is in mm/page_alloc.c. I've done a little
>>> investigation, but I can't account for why there's a hard cutoff of
>>> correctness at 256GB
>>>
>>> [    0.065563] RIP: 0010:memmap_init_range+0x108/0x173
>>> [    0.066309] Code: 77 16 f6 42 10 02 74 10 48 03 42 08 48 c1 e8 0c
>>> 48 89 c3 e9 3a ff ff ff 48 89 df 48 c1 e7 06 48 03 3d d9 a2 66 ff 48
>>> 8d 47 08 <c7> 47 34 01 00 00 00 48 c7 47 38 00 00 00 00 c7 47 30 ff ff
>>> ff ff
>>> [    0.069108] RSP: 0000:ffffffffad603dc8 EFLAGS: 00010082 ORIG_RAX:
>>> 0000000000000404
>>> [    0.070193] RAX: ffffdba740000048 RBX: 0000000000000001 RCX: 0000000000000000
>>> [    0.071170] RDX: 0000000000000000 RSI: 0000000000000000 RDI: ffffdba740000040
>>> [    0.072224] RBP: 0000000000000000 R08: 0000000000001000 R09: 0000000000000000
>>> [    0.073283] R10: 0000000000000001 R11: ffffffffad645c60 R12: 0000000000000000
>>> [    0.074304] R13: 00000000000000a0 R14: 0000000000000000 R15: 0000000000000000
>>> [    0.075285] FS:  0000000000000000(0000) GS:ffffffffadd6c000(0000)
>>> knlGS:0000000000000000
>>> [    0.076365] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>>> [    0.077194] CR2: ffffdba740000074 CR3: 0008001ee3a0c000 CR4: 00000000000606b0
>>> [    0.078209] Call Trace:
>>> [    0.078524]  <TASK>
>>> [    0.078887]  ? free_area_init+0x5c1/0x66c
>>> [    0.079417]  ? zone_sizes_init+0x52/0x6c
>>> [    0.079934]  ? setup_arch+0xa55/0xb6d
>>> [    0.080417]  ? start_kernel+0x64/0x65a
>>> [    0.080897]  ? secondary_startup_64_no_verify+0xd6/0xdb
>>> [    0.081620]  </TASK>
>> Note that there is a bug in Brijesh's version of the patch and it will
>> almost exclusively use the MSR protocol. Please try the version of the
>> patch that I recently sent up based on the current unaccepted memory tree
>> from Kirill.
>>
> I've now tested this patch set with Tom's new patch set, and it
> appears to be that the problem with 256GB is more likely to be due to
> this unaccepted memory patch set rather than something AMD-specific.
> 
> Kirill, do you see any problems with 256GB on TDX? It seems there is
> some unaccepted memory getting touched in memmap_init_range when the
> VM's memory size is at least 256GB

It really helps this kind of stuff if you can post the *actual* error.
I assume this was a page fault, so there should have been some other
stuff before the RIP:...

Another thing that's really nice is to do the disassembly of the "Code:"
or share disassembly of memmap_init_range.  Even nicer would be to give
an faddr2line of the RIP value and track down which C code was actually
at fault.

It's *possible* to look into these things from what you posted, but it's
just slow.  I'm sure Kirill will appreciate the help.
