Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43B781F925
	for <linux-coco@lists.linux.dev>; Wed, 11 Oct 2023 13:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hY1kApki"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697030104; x=1728566104;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DVj1IAQaMNXzKm35tzE0vtrTuSeRAxpGGOqdY2NfLZ8=;
  b=hY1kApkiFgGhpYtn/PqyU14yXIUPS947Hdt+I2M9Gwyc9qzSN9M7TiDY
   ffWzOAEfiutagw3oIIvx234g84yaqmtePbwSe4VvIYqtf5aGicKtRD4h2
   hgz3bY5AI4vfID2y6MpgaDlXCWdGZJM9fdIbS769PXJfysPvk50JyZJwb
   8LdI9efVaOZkhlmNLn+kSGs/IWZKW74AAsFwW+v9K+klKezeM0d55Opka
   6CDYJw9UwHAEAYI2KkjhH1bOJQfStBayoDSSfKf9csrXZYQ+3VepmgX3l
   DdXq5AqZgdQuSPFWPNv+Sg89ZkgUyW5+NyAlwFkv5gPB5O9w1Wh5uTtLc
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="388525160"
X-IronPort-AV: E=Sophos;i="6.03,216,1694761200"; 
   d="scan'208";a="388525160"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2023 06:15:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="870138127"
X-IronPort-AV: E=Sophos;i="6.03,216,1694761200"; 
   d="scan'208";a="870138127"
Received: from laptop-dan-intel.ccr.corp.intel.com (HELO box.shutemov.name) ([10.252.56.166])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2023 06:14:56 -0700
Received: by box.shutemov.name (Postfix, from userid 1000)
	id D5B19109FB5; Wed, 11 Oct 2023 16:14:52 +0300 (+03)
Date: Wed, 11 Oct 2023 16:14:52 +0300
From: "kirill.shutemov@linux.intel.com" <kirill.shutemov@linux.intel.com>
To: "Huang, Kai" <kai.huang@intel.com>
Cc: "tglx@linutronix.de" <tglx@linutronix.de>,
	"mingo@redhat.com" <mingo@redhat.com>,
	"x86@kernel.org" <x86@kernel.org>, "bp@alien8.de" <bp@alien8.de>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
	"Edgecombe, Rick P" <rick.p.edgecombe@intel.com>,
	"Reshetova, Elena" <elena.reshetova@intel.com>,
	"Nakajima, Jun" <jun.nakajima@intel.com>,
	"rafael@kernel.org" <rafael@kernel.org>,
	"peterz@infradead.org" <peterz@infradead.org>,
	"sathyanarayanan.kuppuswamy@linux.intel.com" <sathyanarayanan.kuppuswamy@linux.intel.com>,
	"Hunter, Adrian" <adrian.hunter@intel.com>,
	"thomas.lendacky@amd.com" <thomas.lendacky@amd.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"kexec@lists.infradead.org" <kexec@lists.infradead.org>,
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>
Subject: Re: [PATCH 09/13] x86/tdx: Account shared memory
Message-ID: <20231011131452.r42nemcajjcj77hq@box.shutemov.name>
References: <20231005131402.14611-1-kirill.shutemov@linux.intel.com>
 <20231005131402.14611-10-kirill.shutemov@linux.intel.com>
 <f3776d2b6d45e74b4d0e62eb4e788c578132c21c.camel@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f3776d2b6d45e74b4d0e62eb4e788c578132c21c.camel@intel.com>

On Tue, Oct 10, 2023 at 10:05:21AM +0000, Huang, Kai wrote:
> 
> > +#ifdef CONFIG_DEBUG_FS
> > +static int tdx_shared_memory_show(struct seq_file *m, void *p)
> > +{
> > +	unsigned long addr, end;
> > +	unsigned long found = 0;
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
> > +		size = page_level_size(level);
> > +
> > +		if (pte && pte_decrypted(*pte))
> > +			found += size / PAGE_SIZE;
> > +
> > +		addr += size;
> 
> This could be a long loop, perhaps add cond_resched() here?

Sure.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
