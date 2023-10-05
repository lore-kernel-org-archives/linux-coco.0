Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96ABC12B74
	for <linux-coco@lists.linux.dev>; Thu,  5 Oct 2023 22:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M8WJzC3w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696544931; x=1728080931;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3ak/CqPJFuvAGz1nL0ORtkufKNGBvhTu0OaUcGSyyRI=;
  b=M8WJzC3wqXA7oYbM3qTCSl4m2SpT7UXPCHm28YuBSPDI+op3sMctd2A5
   EQpq4o2i5XrlnhqdPR/sx5hjOXCMrozc/umyP87I74bWirHoaLCr95f+z
   C/xb/iCk19gkwKiEzp/wvFbrZQnbRlXYZWbydcgmcvq1y5Lcx2kokTx3X
   78n44uDYRPqeD0Wis0TLJZ55WQjwRFN5x8bpzUHV2jjiMwGcmpCMhNtOv
   ysoSS7Fs4/Nmu9gGmSDiZXJ1P/+Jn/5IBCftT6nVlDP0fdxuxfcbkyHoU
   CsbU9w7khVMcXqsofnmSBcW4xJFJ0766sp7iQys2qW1caOCAnOcD7Yo9l
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="5195868"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; 
   d="scan'208";a="5195868"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2023 15:28:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="817796476"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; 
   d="scan'208";a="817796476"
Received: from kvsudesh-mobl1.gar.corp.intel.com (HELO box.shutemov.name) ([10.251.222.76])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2023 15:28:43 -0700
Received: by box.shutemov.name (Postfix, from userid 1000)
	id BFE0B10A12D; Fri,  6 Oct 2023 01:28:39 +0300 (+03)
Date: Fri, 6 Oct 2023 01:28:39 +0300
From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
To: "Kalra, Ashish" <ashish.kalra@amd.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
	Elena Reshetova <elena.reshetova@intel.com>,
	Jun Nakajima <jun.nakajima@intel.com>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Tom Lendacky <thomas.lendacky@amd.com>, kexec@lists.infradead.org,
	linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 10/13] x86/tdx: Convert shared memory back to private on
 kexec
Message-ID: <20231005222839.jt2du72xogg3c5ny@box>
References: <20231005131402.14611-1-kirill.shutemov@linux.intel.com>
 <20231005131402.14611-11-kirill.shutemov@linux.intel.com>
 <8d0e4e71-0614-618a-0f84-55eeb6d27a6d@amd.com>
 <20231005212828.veeekxqc7rwvrbig@box>
 <e0459b50-7e21-7548-8151-9010ee88b0a6@amd.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e0459b50-7e21-7548-8151-9010ee88b0a6@amd.com>

On Thu, Oct 05, 2023 at 05:01:23PM -0500, Kalra, Ashish wrote:
> On 10/5/2023 4:28 PM, Kirill A. Shutemov wrote:
> > On Thu, Oct 05, 2023 at 01:41:38PM -0500, Kalra, Ashish wrote:
> > > > +static void unshare_all_memory(bool unmap)
> > > > +{
> > > > +	unsigned long addr, end;
> > > > +	long found = 0, shared;
> > > > +
> > > > +	/*
> > > > +	 * Walk direct mapping and convert all shared memory back to private,
> > > > +	 */
> > > > +
> > > > +	addr = PAGE_OFFSET;
> > > > +	end  = PAGE_OFFSET + get_max_mapped();
> > > > +
> > > > +	while (addr < end) {
> > > > +		unsigned long size;
> > > > +		unsigned int level;
> > > > +		pte_t *pte;
> > > > +
> > > > +		pte = lookup_address(addr, &level);
> > > 
> > > IIRC, you were earlier walking the direct mapping using
> > > walk_page_range_novma(), any particular reason to use lookup_address()
> > > instead ?
> > 
> > walk_page_range_novma() wants mmap lock to be taken, but it is tricky as
> > we run here from atomic context in case of crash.
> > 
> > I considered using trylock to bypass the limitation, but it is a hack.
> > 
> > > 
> > > > +		size = page_level_size(level);
> > > > +
> > > > +		if (pte && pte_decrypted(*pte)) {
> > > 
> > > Additionally need to add check for pte_none() here to handle physical memory
> > > holes in direct mapping.
> > 
> > lookup_address() returns NULL for none entries.
> > 
> 
> Looking at lookup_address_in_pgd(), at pte level it is simply returning
> pte_offset_kernel() and there does not seem to be a check for returning NULL
> if pte_none() ?

Hm. You are right.

I think it yet another quirk in how lookup_address() implemented. We need
to make it straight too.

There's two options: either make lookup_address() return pointer for entry
even if it is NULL, or add check for pte_none() after pte_offset_kernel()
and return NULL if it is true.

I like the first option more as it allows caller to populate the entry if
it wants.

> > > > +			int pages = size / PAGE_SIZE;
> > > > +
> > > > +			/*
> > > > +			 * Touching memory with shared bit set triggers implicit
> > > > +			 * conversion to shared.
> > > > +			 *
> > > > +			 * Make sure nobody touches the shared range from
> > > > +			 * now on.
> > > > +			 *
> > > > +			 * Bypass unmapping for crash scenario. Unmapping
> > > > +			 * requires sleepable context, but in crash case kernel
> > > > +			 * hits the code path with interrupts disabled.
> > > 
> > > In case of SNP we will need to temporarily enable interrupts during this
> > > unsharing as we invoke set_memory_encrypted() which then hits a BUG_ON() in
> > > cpa_flush() if interrupts are disabled.
> > 
> > Do you really need full set_memory_encrypted()? Can't you do something
> > ligher?
> > 
> We need to modify the PTE for setting c-bit to 1 so that will require
> cpa_flush(), though probably can add something lighter to do
> clflush_cache_range() directly ?

For TDX, I don't touch shared bit as nobody suppose to touch the memory
after the point (ans set_memory_np() enforces it for !crash case).

Can't SNP do the same?

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
