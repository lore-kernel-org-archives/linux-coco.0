Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D86BB2E63E
	for <linux-coco@lists.linux.dev>; Mon,  9 Oct 2023 13:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fhPvEhQA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696858623; x=1728394623;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pTBhh0Z/eWz4qUWI59Hqv+z4l97YfU9wayl/EFDoxSw=;
  b=fhPvEhQAQLfkY2E5WldCWKNKM1gIUsX1g7uxFCccOTNgdjSj8J2gsy+J
   PthyFCv2RRuIXHlGJ6QXCczZSe4NUkI8491xHNgROZz2eqG5W1w8a7Ocb
   ZV1ENcoqTm6tJxYUT0Y6RJNjqogew97U07mmffD2huAKh0VndQsha10VC
   bQG7mhMLXfYN4tTytruoOYmyojdpYIjhDbgQgYevqq0H/wf1P+kQr2RxB
   dQTDzMcFM5/9kgGnVY8GveP9GYyQ4HPqxfdWi4Tr17ROsYu4xRbJEbV31
   T43W69kq2gjnpQ9AYBic30RhtSue2YcQh9OijrVfaFY08/GUl9/cr9xrJ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="450645440"
X-IronPort-AV: E=Sophos;i="6.03,210,1694761200"; 
   d="scan'208";a="450645440"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2023 06:37:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="756721610"
X-IronPort-AV: E=Sophos;i="6.03,210,1694761200"; 
   d="scan'208";a="756721610"
Received: from ahuge-mobl.ger.corp.intel.com (HELO box.shutemov.name) ([10.252.40.233])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2023 06:36:58 -0700
Received: by box.shutemov.name (Postfix, from userid 1000)
	id E967510A196; Mon,  9 Oct 2023 16:36:55 +0300 (+03)
Date: Mon, 9 Oct 2023 16:36:55 +0300
From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
To: Baoquan He <bhe@redhat.com>
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
Subject: Re: [PATCH 00/13] x86/tdx: Add kexec support
Message-ID: <20231009133655.3aqi4kwx7wtqgqtm@box.shutemov.name>
References: <20231005131402.14611-1-kirill.shutemov@linux.intel.com>
 <ZSNADxBZEDyxEnZ4@MiWiFi-R3L-srv>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZSNADxBZEDyxEnZ4@MiWiFi-R3L-srv>

On Mon, Oct 09, 2023 at 07:49:35AM +0800, Baoquan He wrote:
> On 10/05/23 at 04:13pm, Kirill A. Shutemov wrote:
> > The patchset adds bits and pieces to get kexec (and crashkernel) work on
> > TDX guest.
> > 
> > They bring kexec support to the point when we can start the new kernel,
> > but it will only be able to use single CPU. It should be enough to cover
> > the most common case: crashkernel.
> 
> Not sure if this question has been raised and answered in the past. Please
> forgive my bad memory if it has. The one cpu is fine to kdump kernel most
> of time, while we enable all CPUs by default when kexec rebooting. And kdump
> kernel with multiple cpu is allowed too. Wondering if there's plan to
> support the multiple cpu on TDX in the future.

Sorry, I didn't update this part of cover letter properly, but the last
patch of the patchset makes possible to kexec with multiple CPUs and the
2nd kernel will see them all. It requires support on BIOS side, otherwise
we fallback to single CPU kexec.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
