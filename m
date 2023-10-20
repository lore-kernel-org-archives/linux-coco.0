Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9355111A4
	for <linux-coco@lists.linux.dev>; Fri, 20 Oct 2023 09:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZvoJaE5A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697793678; x=1729329678;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=a++LVpgYV0t0DpSZeHCFw0R4XO+/PCphuhcdSRisZ/4=;
  b=ZvoJaE5ACfb6vq2szCMxUhwnlfS+Uq4Cdz9XmH9v/YhvV9+TxI/Smu1C
   QZ4riIT/ZsO75Hz+KzMLny6Jpt4CW/K3QpXJ5OjgIxBHA19uypbvrIfOR
   RlvtKcOxuV1uTn8fRRljs/tPsh9/sDlqWqmISbLKkKAgOx7d0nyOMK7XQ
   UCobIWiFcSyDtWyui47GBs1yp1et3pfA92pdjfKMDpin9ydvcWM0Sbx06
   eoi3P9CNpIXU5dSvrnxBmYZbR2My4XAsVNG8fbovwHrxhGLggUN0x7aYq
   n5QDsEzbHZAn90hrSQA95l+1R4m9UCPWMUniIfeWN8kKKw1XTWKN+2yXN
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="365802085"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; 
   d="scan'208";a="365802085"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2023 02:21:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="760990089"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; 
   d="scan'208";a="760990089"
Received: from blavena-mobl2.ger.corp.intel.com (HELO box.shutemov.name) ([10.249.39.237])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2023 02:21:13 -0700
Received: by box.shutemov.name (Postfix, from userid 1000)
	id 2344E109D0A; Fri, 20 Oct 2023 12:21:11 +0300 (+03)
Date: Fri, 20 Oct 2023 12:21:11 +0300
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
Message-ID: <20231020092111.ho2rmhve23kgcxbr@box>
References: <20231005131402.14611-1-kirill.shutemov@linux.intel.com>
 <20231005131402.14611-11-kirill.shutemov@linux.intel.com>
 <8d0e4e71-0614-618a-0f84-55eeb6d27a6d@amd.com>
 <20231005212828.veeekxqc7rwvrbig@box>
 <e0459b50-7e21-7548-8151-9010ee88b0a6@amd.com>
 <20231005222839.jt2du72xogg3c5ny@box>
 <f4228262-02f9-3af5-8ef5-be109b5d3d13@amd.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f4228262-02f9-3af5-8ef5-be109b5d3d13@amd.com>

On Fri, Oct 06, 2023 at 02:24:11PM -0500, Kalra, Ashish wrote:
> 
> On 10/5/2023 5:28 PM, Kirill A. Shutemov wrote:
> > On Thu, Oct 05, 2023 at 05:01:23PM -0500, Kalra, Ashish wrote:
> > > On 10/5/2023 4:28 PM, Kirill A. Shutemov wrote:
> > > > On Thu, Oct 05, 2023 at 01:41:38PM -0500, Kalra, Ashish wrote:
> > > > > > +static void unshare_all_memory(bool unmap)
> > > > > > +{
> > > > > > +	unsigned long addr, end;
> > > > > > +	long found = 0, shared;
> > > > > > +
> > > > > > +	/*
> > > > > > +	 * Walk direct mapping and convert all shared memory back to private,
> > > > > > +	 */
> > > > > > +
> > > > > > +	addr = PAGE_OFFSET;
> > > > > > +	end  = PAGE_OFFSET + get_max_mapped();
> > > > > > +
> > > > > > +	while (addr < end) {
> > > > > > +		unsigned long size;
> > > > > > +		unsigned int level;
> > > > > > +		pte_t *pte;
> > > > > > +
> > > > > > +		pte = lookup_address(addr, &level);
> > > > > 
> > > > > IIRC, you were earlier walking the direct mapping using
> > > > > walk_page_range_novma(), any particular reason to use lookup_address()
> > > > > instead ?
> > > > 
> > > > walk_page_range_novma() wants mmap lock to be taken, but it is tricky as
> > > > we run here from atomic context in case of crash.
> > > > 
> > > > I considered using trylock to bypass the limitation, but it is a hack.
> > > > 
> > > > > 
> > > > > > +		size = page_level_size(level);
> > > > > > +
> > > > > > +		if (pte && pte_decrypted(*pte)) {
> > > > > 
> > > > > Additionally need to add check for pte_none() here to handle physical memory
> > > > > holes in direct mapping.
> > > > 
> > > > lookup_address() returns NULL for none entries.
> > > > 
> > > 
> > > Looking at lookup_address_in_pgd(), at pte level it is simply returning
> > > pte_offset_kernel() and there does not seem to be a check for returning NULL
> > > if pte_none() ?
> > 
> > Hm. You are right.
> > 
> > I think it yet another quirk in how lookup_address() implemented. We need
> > to make it straight too.
> > 
> > There's two options: either make lookup_address() return pointer for entry
> > even if it is NULL, or add check for pte_none() after pte_offset_kernel()
> > and return NULL if it is true.
> > 
> > I like the first option more as it allows caller to populate the entry if
> > it wants.
> 
> Yes, i like the first option.

I tried to this, but lookup_address() has to many callers. It gets beyond
the scope of the patchset. I will add pte_none() check on unshare side for
now.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
