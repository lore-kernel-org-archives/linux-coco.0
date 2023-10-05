Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7347028DD7
	for <linux-coco@lists.linux.dev>; Thu,  5 Oct 2023 21:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JOgqqFU5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696541316; x=1728077316;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ONU1C7tc3rc3AtZ7xkoZa57Ejqtw/z10sNPrapPUHTM=;
  b=JOgqqFU5MJq7JBdpbB4j4XRCG5lYah9Yw+ypctxFq79T/UBlgny06ZOy
   pse+QDtz/eq5AK20s6nq8wv4meuuKsY3BYo2u25BYAdEl0ovehGkFcXLD
   GFswWkM6jqrOfMiSTZgf4igNCsv8hZvZGHfb0U+pxtBoBwKKzg8z/pO6c
   /eYRpI7y7FdobO1SQ6qjXhuBOQ77SMdxnDPwM/gBYLiYSlnbRCNg2l7R5
   ZQZsJhmQyGcrtjQG0ostCeoLKdXjebr6/FbIgu0ckyBOy8J33/uwSVVcD
   HlLUtQeTY02OxjVuC0k0vs84RrQpzWo/rJ33X8/J7myEDI4ylQS5sNfK3
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="382496484"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; 
   d="scan'208";a="382496484"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2023 14:28:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="875701487"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; 
   d="scan'208";a="875701487"
Received: from kvsudesh-mobl1.gar.corp.intel.com (HELO box.shutemov.name) ([10.251.222.76])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2023 14:28:30 -0700
Received: by box.shutemov.name (Postfix, from userid 1000)
	id 1D6CA10A12D; Fri,  6 Oct 2023 00:28:28 +0300 (+03)
Date: Fri, 6 Oct 2023 00:28:28 +0300
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
Message-ID: <20231005212828.veeekxqc7rwvrbig@box>
References: <20231005131402.14611-1-kirill.shutemov@linux.intel.com>
 <20231005131402.14611-11-kirill.shutemov@linux.intel.com>
 <8d0e4e71-0614-618a-0f84-55eeb6d27a6d@amd.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8d0e4e71-0614-618a-0f84-55eeb6d27a6d@amd.com>

On Thu, Oct 05, 2023 at 01:41:38PM -0500, Kalra, Ashish wrote:
> > +static void unshare_all_memory(bool unmap)
> > +{
> > +	unsigned long addr, end;
> > +	long found = 0, shared;
> > +
> > +	/*
> > +	 * Walk direct mapping and convert all shared memory back to private,
> > +	 */
> > +
> > +	addr = PAGE_OFFSET;
> > +	end  = PAGE_OFFSET + get_max_mapped();
> > +
> > +	while (addr < end) {
> > +		unsigned long size;
> > +		unsigned int level;
> > +		pte_t *pte;
> > +
> > +		pte = lookup_address(addr, &level);
> 
> IIRC, you were earlier walking the direct mapping using
> walk_page_range_novma(), any particular reason to use lookup_address()
> instead ?

walk_page_range_novma() wants mmap lock to be taken, but it is tricky as
we run here from atomic context in case of crash.

I considered using trylock to bypass the limitation, but it is a hack.

> 
> > +		size = page_level_size(level);
> > +
> > +		if (pte && pte_decrypted(*pte)) {
> 
> Additionally need to add check for pte_none() here to handle physical memory
> holes in direct mapping.

lookup_address() returns NULL for none entries.

> > +			int pages = size / PAGE_SIZE;
> > +
> > +			/*
> > +			 * Touching memory with shared bit set triggers implicit
> > +			 * conversion to shared.
> > +			 *
> > +			 * Make sure nobody touches the shared range from
> > +			 * now on.
> > +			 *
> > +			 * Bypass unmapping for crash scenario. Unmapping
> > +			 * requires sleepable context, but in crash case kernel
> > +			 * hits the code path with interrupts disabled.
> 
> In case of SNP we will need to temporarily enable interrupts during this
> unsharing as we invoke set_memory_encrypted() which then hits a BUG_ON() in
> cpa_flush() if interrupts are disabled.

Do you really need full set_memory_encrypted()? Can't you do something
ligher?


-- 
  Kiryl Shutsemau / Kirill A. Shutemov
