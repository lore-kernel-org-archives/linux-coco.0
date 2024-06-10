Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3531C15A8
	for <linux-coco@lists.linux.dev>; Mon, 10 Jun 2024 13:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718026478; cv=none; b=mxLPMrZUUQEvbA9kAvbpUV3/svz9UNmFNrSa/7XfzVvu+vXSe7xVgURJco7pWfFxMbHCeO/gGzd2OfsDfyiIrNyP85BNvplInq5rXOcefYQ9EZLv6ECJ0Lii5/nXEGuWv5dJnopVz6/sYIBf7LsM+83N9raKyyelxRE08SFNR6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718026478; c=relaxed/simple;
	bh=pBvR9McWmov7Rp1pdAQ23EgPGal3SUA9rAXjWP/q4hI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O02p1FJ6qplEDREcvrAkEAnKefy9k2iZhaXDaA0c+FZFlz1J+6Rz2asjhPL0vjJqs+AwGr65SzAjdd4im4KvdOLoTlLi/xupBv1Xp6auFKHxAIv9wwrBF0mmTY8ptjuX8u0uPWwaeyjcN5Byi0VwlUOAckzRqZs8t/C0e4kd9+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nFjaBRww; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nFjaBRww"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718026477; x=1749562477;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pBvR9McWmov7Rp1pdAQ23EgPGal3SUA9rAXjWP/q4hI=;
  b=nFjaBRwwQRjGPkWYJMBosgB+QoXkakXYTTVhbgmosTqGYO7BviOgF+J/
   0kzJBIKA+kb3vJS/IZc5b9xCT+kx/96CdT5rCCBSRR6Mt8EpldZrN5tEB
   J0eOkxIk8ZBUaAt6ztBGa0BCRrTgz/Smp7XG+QM0Hj6O6GxJ/emsI62Z6
   /1txMHd33YCVrKJO0cSNwGAjQCk9Y0yDNbMy1kixRZWaZFAOLIsf4z0rq
   +XTHsmb7QAbzcfCgzFVVBKlzOA2PORsW4fJ+l+UJ9XLS5CvADMKcccy/9
   jCJs9P4shEf3qpslrMcNHLlW4jqawb8SvkBU5VCGbI/gQkyQqHjikJypN
   g==;
X-CSE-ConnectionGUID: Fxcpdkk0SEGl7BlEFKpS3g==
X-CSE-MsgGUID: J3AcaoGkROK8vt271vUVbA==
X-IronPort-AV: E=McAfee;i="6600,9927,11099"; a="14858567"
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; 
   d="scan'208";a="14858567"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2024 06:34:19 -0700
X-CSE-ConnectionGUID: O5yUHhQhS7CSCilTyKpjfw==
X-CSE-MsgGUID: dsZ5qsK+RWa+0bz7LZirEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; 
   d="scan'208";a="43503465"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa005.fm.intel.com with ESMTP; 10 Jun 2024 06:34:16 -0700
Received: by black.fi.intel.com (Postfix, from userid 1000)
	id 6C95A1FD; Mon, 10 Jun 2024 16:34:15 +0300 (EEST)
Date: Mon, 10 Jun 2024 16:34:15 +0300
From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
To: Dave Hansen <dave.hansen@linux.intel.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, 
	cho@microsoft.com, decui@microsoft.com, John.Starks@microsoft.com
Subject: Re: [PATCH] x86/tdx: Generate SIGBUS on userspace MMIO
Message-ID: <b7bz3ix3yqmc5xla7ldnxu3lsvvqzlxigq2po2dqkoejucppj3@fbaw37ilwpkr>
References: <20240528100919.520881-1-kirill.shutemov@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240528100919.520881-1-kirill.shutemov@linux.intel.com>

On Tue, May 28, 2024 at 01:09:19PM +0300, Kirill A. Shutemov wrote:
> Currently, attempting to perform MMIO from userspace in a TDX guest
> leads to a warning about an unexpected #VE and SIGSEGV being delivered
> to the process.
> 
> Enlightened userspace may choose to handle MMIO on their own if the
> kernel does not emulate it.
> 
> Handle the EPT_VIOLATION exit reason for userspace and deliver SIGBUS
> instead of SIGSEGV. SIGBUS is more appropriate for the MMIO situation.
> 
> Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>

Any feedback?

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
