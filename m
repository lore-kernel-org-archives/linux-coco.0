Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 167102BEC3B
	for <linux-coco@lists.linux.dev>; Fri, 27 Jun 2025 13:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751029464; cv=none; b=NMxIytlCEiZjDU/Ld5SOhGrculS8Vx/RmjpTOMAdVTYLiN6OlEYhne/hKY1Ql9gN0Kt/Ht0uD+RO15ZAA12SdTs1VneuTLn7TFX1pAz8xSI1Xd/UmoNFzM0Sp/eUSd3716QyP0IVA7h/0LRDHWfRwBT+ZmlxB/4fWnuIo2y1/uU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751029464; c=relaxed/simple;
	bh=XzX4psFBvnYR6QHI3Kw1ucRawOE+xlOc/dM9jXgI1bU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sPVuU70uQl5idUc21CBEpQcWvMMynYuJPaThdQ0BbZS8exbuf2Jcs5yWAbkVHtpWhVUSdsNUTNfvJuPCMljgh/lT9briykGC1o0xaycBpQknG2mXqYrAxT29Og44J5FF+V0CC4gUIEX8L8THhkOY9q0zP2BSJUmptErS7580h0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LFHkrwEZ; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LFHkrwEZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751029463; x=1782565463;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XzX4psFBvnYR6QHI3Kw1ucRawOE+xlOc/dM9jXgI1bU=;
  b=LFHkrwEZjOfVojLoRKrHPhRGdsJvJz6GcQrfqr5lRqde1HBKCHpi0aQZ
   V7EP3RqV2QeuXrI2mPiiBA71ud0Tj7FW7i2IwkjBRoqiN0/5kDynzHzf9
   3BJtrpVA+SYVrAikFX2QH81yC2DWCCs8lAW56tahKEbJCyLx00HDnz12z
   dDOVIQ83LBSBJD4av2uNTLKu1jFvp4RADLTuxpZO9ptspR7X5PSj3RhZM
   bm9xQKe+ttNaD0hcfCw9TAmNjBEwEq83OhvbJKsfd6wdsEfX16gyz6FFp
   TmEit7zyoDb8L7nzuyF6JH+h0q0yNI33EqQtESIBqXvTyLNUJEA/JdtXb
   g==;
X-CSE-ConnectionGUID: qlh236tFQuSELJRo6U7zhg==
X-CSE-MsgGUID: Psi25dmlQZKyfPMFsRU6gg==
X-IronPort-AV: E=McAfee;i="6800,10657,11477"; a="70773962"
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; 
   d="scan'208";a="70773962"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 06:04:02 -0700
X-CSE-ConnectionGUID: ldfBJ5F6RAmcS7Go8ORzNA==
X-CSE-MsgGUID: L9DsV3rAT+Wj/YlqbN+IEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; 
   d="scan'208";a="183836732"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa002.jf.intel.com with ESMTP; 27 Jun 2025 06:03:58 -0700
Received: by black.fi.intel.com (Postfix, from userid 1000)
	id 01F626A; Fri, 27 Jun 2025 16:03:56 +0300 (EEST)
Date: Fri, 27 Jun 2025 16:03:56 +0300
From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: pbonzini@redhat.com, seanjc@google.com, dave.hansen@linux.intel.com, 
	rick.p.edgecombe@intel.com, isaku.yamahata@intel.com, kai.huang@intel.com, 
	yan.y.zhao@intel.com, chao.gao@intel.com, tglx@linutronix.de, mingo@redhat.com, 
	bp@alien8.de, kvm@vger.kernel.org, x86@kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCHv2 04/12] x86/virt/tdx: Add tdx_alloc/free_page() helpers
Message-ID: <g5akv7uwsdrvs3j4wsj2xmc3fpdlyudj5sjuhw62m3f4yjsxse@nrne5miazbx4>
References: <20250609191340.2051741-1-kirill.shutemov@linux.intel.com>
 <20250609191340.2051741-5-kirill.shutemov@linux.intel.com>
 <dba2841f-0725-4b58-b633-650201c053b4@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dba2841f-0725-4b58-b633-650201c053b4@intel.com>

On Fri, Jun 27, 2025 at 10:49:34AM +0300, Adrian Hunter wrote:
> On 09/06/2025 22:13, Kirill A. Shutemov wrote:
> > +static void tdx_pamt_put(struct page *page, enum pg_level level)
> > +{
> > +	unsigned long hpa = page_to_phys(page);
> > +	atomic_t *pamt_refcount;
> > +	LIST_HEAD(pamt_pages);
> > +	u64 err;
> > +
> > +	if (!tdx_supports_dynamic_pamt(&tdx_sysinfo))
> > +		return;
> > +
> > +	if (level != PG_LEVEL_4K)
> > +		return;
> > +
> > +	hpa = ALIGN_DOWN(hpa, PMD_SIZE);
> > +
> > +	pamt_refcount = tdx_get_pamt_refcount(hpa);
> > +	if (!atomic_dec_and_test(pamt_refcount))
> > +		return;
> > +
> > +	scoped_guard(spinlock, &pamt_lock) {
> > +		/* Lost race against tdx_pamt_add()? */
> > +		if (atomic_read(pamt_refcount) != 0)
> > +			return;
> > +
> > +		err = tdh_phymem_pamt_remove(hpa | TDX_PS_2M, &pamt_pages);
> > +
> > +		if (err) {
> > +			atomic_inc(pamt_refcount);
> > +			pr_err("TDH_PHYMEM_PAMT_REMOVE failed: %#llx\n", err);
> > +			return;
> > +		}
> > +	}
> > +
> 
> Won't any pages that have been used need to be cleared
> before being freed.

Good point. I missed that.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
