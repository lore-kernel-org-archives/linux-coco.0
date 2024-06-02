Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 851E640855
	for <linux-coco@lists.linux.dev>; Sun,  2 Jun 2024 14:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717338064; cv=none; b=Qv2zd9068wpYZGbtzMgRP2CV0v70DnxmSh+fnV9d8FoKWqonQMgIYt/JLIm/hGKuxax3ecYGtf/6SRR8rcRFz67igtjNmtHWgNE2ewhmLPcwrmyOuKZnB7e2YGyCl3TMnZb3Fe+TFs1Jhkw0QP3Q/qwe2OBtxOLuKTbNeKHySQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717338064; c=relaxed/simple;
	bh=HHQSybEJxUEGfYcVhVIrgQp0w28pkdQd7EvfJc/M9y4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i8iwnidfypXwEd4+AkLlC87kPLQOroLb+QAd41XWRAopV5f1+VmEMKl54uoxQx/bzWQbS4Wa8g5nvvWJsbfhbcMxyctgkjAw+kpKIARIMDdCNEhw5SoMaPQH1ROIKnwOyv/jz786ZnxNhU3eeHYEXabygNVuo/no4XWIxfKDZW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lz2+jFcP; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lz2+jFcP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717338062; x=1748874062;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HHQSybEJxUEGfYcVhVIrgQp0w28pkdQd7EvfJc/M9y4=;
  b=lz2+jFcPXtd/P1ApVN7PZhCbYY13tV1pOiDX9OErtFSGepDJSvx1rWTi
   wnfLjz9qFaZOgYytpMAWr5TovX6yED/WAMhnfnuE/iLk1L68k7dc1XUPv
   U17wDGSDBE7VWl5ilpwjfsXTwXCy5bzAM9vu/2aFy/Ob4xdkbkw+37uLz
   lFHPjp1qo95oCXUb4NHGYUzjoawkDt3fO9ye8UOl7itaCfPrgfNJk/TP0
   RoftUAXOcBYdctFXoz0W8A59PYElwiMfELl0Kc5lAKxxO8hPHjOmKVCs6
   j0kVApAf9r+XfxP7K7JuDGBhtOlFUPT9vzk/UpivtNejwdn88TqO8Nx0O
   g==;
X-CSE-ConnectionGUID: +bNJtNXKQ3ihjMq+0iQViQ==
X-CSE-MsgGUID: N5jIpbk7TXeczTM/WtOcfg==
X-IronPort-AV: E=McAfee;i="6600,9927,11091"; a="17629008"
X-IronPort-AV: E=Sophos;i="6.08,209,1712646000"; 
   d="scan'208";a="17629008"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2024 07:21:02 -0700
X-CSE-ConnectionGUID: ke8Ahaw5T768IbxDwu8Qog==
X-CSE-MsgGUID: wlmiIkyFSpy2c6mxIJT/Ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,209,1712646000"; 
   d="scan'208";a="36560562"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa010.jf.intel.com with ESMTP; 02 Jun 2024 07:20:56 -0700
Received: by black.fi.intel.com (Postfix, from userid 1000)
	id B8B441CB; Sun, 02 Jun 2024 17:20:54 +0300 (EEST)
Date: Sun, 2 Jun 2024 17:20:54 +0300
From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
To: Borislav Petkov <bp@alien8.de>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, Elena Reshetova <elena.reshetova@intel.com>, 
	Jun Nakajima <jun.nakajima@intel.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>, "Kalra, Ashish" <ashish.kalra@amd.com>, 
	Sean Christopherson <seanjc@google.com>, "Huang, Kai" <kai.huang@intel.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Baoquan He <bhe@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	"K. Y. Srinivasan" <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, 
	kexec@lists.infradead.org, linux-hyperv@vger.kernel.org, linux-acpi@vger.kernel.org, 
	linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, Tao Liu <ltao@redhat.com>
Subject: Re: [PATCHv11 11/19] x86/tdx: Convert shared memory back to private
 on kexec
Message-ID: <tur63s5trxwwnwfs43f4jcc6pfostpw6cchwhrgo7tsfzicozn@mvqrntyi6x4w>
References: <20240528095522.509667-1-kirill.shutemov@linux.intel.com>
 <20240528095522.509667-12-kirill.shutemov@linux.intel.com>
 <20240531151442.GMZlnpYkDCRlg1_YS0@fat_crate.local>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240531151442.GMZlnpYkDCRlg1_YS0@fat_crate.local>

On Fri, May 31, 2024 at 05:14:42PM +0200, Borislav Petkov wrote:
> On Tue, May 28, 2024 at 12:55:14PM +0300, Kirill A. Shutemov wrote:
> > +static void tdx_kexec_finish(void)
> > +{
> > +	unsigned long addr, end;
> > +	long found = 0, shared;
> > +
> > +	lockdep_assert_irqs_disabled();
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
> > +		if (pte && pte_decrypted(*pte)) {
> > +			int pages = size / PAGE_SIZE;
> > +
> > +			/*
> > +			 * Touching memory with shared bit set triggers implicit
> > +			 * conversion to shared.
> > +			 *
> > +			 * Make sure nobody touches the shared range from
> > +			 * now on.
> > +			 */
> > +			set_pte(pte, __pte(0));
> > +
> 
> Format the below into a comment here:
> 
> /* 
> 
> The only thing one can do at this point on failure is panic. It is
> reasonable to proceed, especially for the crash case because the
> kexec-ed kernel is using a different page table so there won't be
> a mismatch between shared/private marking of the page so it doesn't
> matter.

Page tables would not make a difference here. We will switch to identity
mappings soon. And kexec-ed kernel will build new page tables from
scratch.

I will drop the part after "It is reasonable to proceed".


-- 
  Kiryl Shutsemau / Kirill A. Shutemov
