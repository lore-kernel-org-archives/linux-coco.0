Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 024CD1364
	for <linux-coco@lists.linux.dev>; Wed,  3 Aug 2022 14:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1659535362; x=1691071362;
  h=message-id:date:mime-version:subject:from:to:cc:
   references:in-reply-to:content-transfer-encoding;
  bh=3kbiD6sIxSxAjVpFKmkjnzMfUr0hXQ3N3rtFHjcQbH4=;
  b=NBxPMUfhy9k35TQy9BPEjMzo3PiR69qUhIFyPzUDzLh2A54Ka9lmw72n
   peWRsFN6vX0c+v8AKgKV8P4c4QjNnIedDMImE6hRJNPWsCsR4OQSuEmmN
   RsNEXh2WFTmSuXO+g51OGBnnZYUHr1ug2tncPLeze+QGnJvvHe0TIHhl7
   jWik1bKGR/Y3JA7EmbeiWj8wJP80UwfWKcLM2htcjseH8s+nroEUQ/tkb
   Fh+46m2AiWaJfzp6jAhtgJAnD/m342MnpCvyB4YqKCu5PEbbsGrxavzqE
   mgJAf+qlubLdz7TRB+Yl+osrLmpuN83i1JNonHhrYj9YuDGJlKuRJ2VrK
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10428"; a="272725065"
X-IronPort-AV: E=Sophos;i="5.93,214,1654585200"; 
   d="scan'208";a="272725065"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2022 07:02:31 -0700
X-IronPort-AV: E=Sophos;i="5.93,214,1654585200"; 
   d="scan'208";a="631159385"
Received: from buichris-mobl.amr.corp.intel.com (HELO [10.209.124.150]) ([10.209.124.150])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2022 07:02:30 -0700
Message-ID: <073c5a97-272c-c5a0-19f2-c3f14f916c72@intel.com>
Date: Wed, 3 Aug 2022 07:02:31 -0700
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCHv7 10/14] x86/mm: Avoid load_unaligned_zeropad() stepping
 into unaccepted memory
Content-Language: en-US
From: Dave Hansen <dave.hansen@intel.com>
To: Borislav Petkov <bp@alien8.de>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Cc: Andy Lutomirski <luto@kernel.org>, Sean Christopherson
 <seanjc@google.com>, Andrew Morton <akpm@linux-foundation.org>,
 Joerg Roedel <jroedel@suse.de>, Ard Biesheuvel <ardb@kernel.org>,
 Andi Kleen <ak@linux.intel.com>,
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
 linux-kernel@vger.kernel.org
References: <20220614120231.48165-1-kirill.shutemov@linux.intel.com>
 <20220614120231.48165-11-kirill.shutemov@linux.intel.com>
 <Yt/ANO5usdV+JSSW@zn.tnic> <80cc204b-a24f-684f-ec66-1361b69cae39@intel.com>
In-Reply-To: <80cc204b-a24f-684f-ec66-1361b69cae39@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/2/22 16:46, Dave Hansen wrote:
> To sum it all up, I'm not happy with the complexity of the page
> acceptance code either but I'm not sure that it's bad tradeoff compared
> to greater #VE complexity or fragility.
> 
> Does anyone think we should go back and really reconsider this?

One other thing I remembered as I re-read my write up on this.

In the "new" mode, guests never get #VE's for unaccepted memory.  They
just exit to the host and can never be reentered.  They must be killed.

In the "old" mode, I _believe_ that the guest always gets a #VE for
non-EPT-present memory.  The #VE is basically the same no matter if the
page is unaccepted or if the host goes out and makes a
previously-accepted page non-present.

One really nasty implication of this "old" mode is that the host can
remove *accepted* pages that are used in the syscall gap.  That means
that the #VE handler would need to be of the paranoid variety which
opens up all kinds of other fun.

 * "Old" - #VE's can happen in the syscall gap
 * "New" - #VE's happen at better-defined times.  Unexpected ones are
   fatal.

There's a third option which I proposed but doesn't yet exist.  The TDX
module _could_ separate the behavior of unaccepted memory #VE's and
host-induced #VEs.  This way, we could use load_unaligned_zeropad() with
impunity and handle it in the #VE handler.  At the same time, the host
would not be allowed to remove accepted memory and cause problems in the
syscall gap.  Kinda the best of both worlds.

But, I'm not sure how valuable that would be now that we have the
(admittedly squirrelly) code to avoid load_unaligned_zeropad() #VE's.
