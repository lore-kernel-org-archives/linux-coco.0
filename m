Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E69F63D94
	for <linux-coco@lists.linux.dev>; Tue,  9 Aug 2022 11:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1660044935; x=1691580935;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=ckfaBQEm61O3oz3fOP7g8FRe9wCmN4sKBCyP+R9DJ+E=;
  b=icXoFOhO0esCucQiTWlV8IF13vlhJZH4ytUT9gbliOchK3zIdoRVOhib
   HfWWJSFB5/Q6LVvqZP/dHyBJwUObyyCE2nMPgvBTDGg3W6ts5yIreeikA
   zVdvQfOY5Drw/liFPWoljcdXp6QneIHcmfxt7MPgPzmPipompUMioA2bk
   Th4oLENxmt1u52WrY/HatMIHIlI5gz1hMl9s99/mglHHTXaM+he/2dOGS
   9cy3EuID+68cLt8uCEn3NSeN0prBzvg1W9iWtjU/rbKPdorA7xMeQuxeB
   gHfPP71GpHir5LY3RXzT+11vidTl9WAReJqQLNXFto0/W1hIK5aXw8CGj
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10433"; a="291599724"
X-IronPort-AV: E=Sophos;i="5.93,224,1654585200"; 
   d="scan'208";a="291599724"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2022 04:35:34 -0700
X-IronPort-AV: E=Sophos;i="5.93,224,1654585200"; 
   d="scan'208";a="747008116"
Received: from labukara-mobl.ger.corp.intel.com (HELO box.shutemov.name) ([10.251.214.212])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2022 04:35:28 -0700
Received: by box.shutemov.name (Postfix, from userid 1000)
	id 86500103886; Tue,  9 Aug 2022 14:38:27 +0300 (+03)
Date: Tue, 9 Aug 2022 14:38:27 +0300
From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
To: Andy Lutomirski <luto@kernel.org>
Cc: Borislav Petkov <bp@alien8.de>, Sean Christopherson <seanjc@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Joerg Roedel <jroedel@suse.de>, Ard Biesheuvel <ardb@kernel.org>,
	Andi Kleen <ak@linux.intel.com>,
	Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>,
	David Rientjes <rientjes@google.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Ingo Molnar <mingo@redhat.com>,
	Varad Gautam <varad.gautam@suse.com>,
	Dario Faggioli <dfaggioli@suse.com>,
	Dave Hansen <dave.hansen@intel.com>,
	Mike Rapoport <rppt@kernel.org>,
	David Hildenbrand <david@redhat.com>,
	Marcelo Henrique Cerri <marcelo.cerri@canonical.com>,
	tim.gardner@canonical.com, khalid.elmously@canonical.com,
	philip.cox@canonical.com, the arch/x86 maintainers <x86@kernel.org>,
	linux-mm@kvack.org, linux-coco@lists.linux.dev,
	linux-efi@vger.kernel.org,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCHv7 10/14] x86/mm: Avoid load_unaligned_zeropad() stepping
 into unaccepted memory
Message-ID: <20220809113827.fchtnyzy44z5fuis@box.shutemov.name>
References: <20220614120231.48165-1-kirill.shutemov@linux.intel.com>
 <20220614120231.48165-11-kirill.shutemov@linux.intel.com>
 <7cec93c5-3db4-409b-8c1e-bc1f10dd68fc@www.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7cec93c5-3db4-409b-8c1e-bc1f10dd68fc@www.fastmail.com>

On Tue, Jul 26, 2022 at 01:17:13PM -0700, Andy Lutomirski wrote:
> 
> 
> On Tue, Jun 14, 2022, at 5:02 AM, Kirill A. Shutemov wrote:
> > load_unaligned_zeropad() can lead to unwanted loads across page boundaries.
> > The unwanted loads are typically harmless. But, they might be made to
> > totally unrelated or even unmapped memory. load_unaligned_zeropad()
> > relies on exception fixup (#PF, #GP and now #VE) to recover from these
> > unwanted loads.
> >
> > But, this approach does not work for unaccepted memory. For TDX, a load
> > from unaccepted memory will not lead to a recoverable exception within
> > the guest. The guest will exit to the VMM where the only recourse is to
> > terminate the guest.
> 
> Why is unaccepted memory marked present in the direct map in the first place?
> 
> Having kernel code assume that every valid address is followed by
> several bytes of memory that may be read without side effects other than
> #PF also seems like a mistake, but I probably won’t win that fight. But
> sticking guard pages in front of definitely-not-logically present pages
> seems silly to me.  Let’s just not map it.

It would mean no 1G pages in direct mapping for TDX as we accept 2M a
time.

> (What if MMIO memory is mapped next to regular memory?  Doing random
> unaligned reads that cross into MMIO seems unwise.)

MMIO is shared, not unaccpted private. We already handle the situation.
See 1e7769653b06 ("x86/tdx: Handle load_unaligned_zeropad() page-cross to
a shared page").

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
