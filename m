Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1090B58101
	for <linux-coco@lists.linux.dev>; Tue,  5 Dec 2023 15:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IiCiNqP+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701788419; x=1733324419;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MnPLBQgc9Jr4eHHjTeEgqwSFgYc46mDEnA2okGxhpj0=;
  b=IiCiNqP+bB/8/HOhFPfnX4rzvSqxx2n50JUsmM8FAXtM4r9i1qyoDv+O
   tY62U225shTJG3vXjJSTmmcQdiHAJRh2CcYJAfHN8Tq+fHqe+EVejmsux
   NcT02pBA2sNRC7q/9XO2IcQUSJX+HyQV6oi+4evpRxhDiZMfs7rrBd8Tp
   uKN/nz5H3lRKZlm19XHa25JwWK2e1rGdajwsxjun8o1oTu8U3NFQbzdb5
   fwEGJIrMdNsRfq35jkXl/fMQ65XCjy6Qbru1drqnUOaGx7fR8TUr0+42m
   5Mbj8SFAA72PeWuNFg587zDmqPVCKyE6F25mJdhJkdvySCOJU83OyrReo
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="15452981"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; 
   d="scan'208";a="15452981"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2023 07:00:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; 
   d="scan'208";a="12354420"
Received: from rjongalo-mobl2.ger.corp.intel.com (HELO box.shutemov.name) ([10.252.46.235])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2023 07:00:15 -0800
Received: by box.shutemov.name (Postfix, from userid 1000)
	id 86EC110A43A; Tue,  5 Dec 2023 18:00:12 +0300 (+03)
Date: Tue, 5 Dec 2023 18:00:12 +0300
From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
To: Borislav Petkov <bp@alien8.de>
Cc: Tom Lendacky <thomas.lendacky@amd.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org,
	linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] x86/coco, x86/sev: Use cpu_feature_enabled() to detect
 SEV guest flavor
Message-ID: <20231205150012.6lma2wzcellr7pz7@box.shutemov.name>
References: <20231205143738.2875-1-kirill.shutemov@linux.intel.com>
 <20231205144619.GCZW83uzAomKmupn7j@fat_crate.local>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231205144619.GCZW83uzAomKmupn7j@fat_crate.local>

On Tue, Dec 05, 2023 at 03:46:19PM +0100, Borislav Petkov wrote:
> On Tue, Dec 05, 2023 at 05:37:38PM +0300, Kirill A. Shutemov wrote:
> > The SEV code uses cc_platform_has() checks to detect the SEV flavor.
> > However, these checks can sometimes produce false positives depending on
> > the context.
> > 
> > For example, sev_map_percpu_data() uses CC_ATTR_GUEST_MEM_ENCRYPT to
> > detect SEV guest, but this check will also pass for TDX guests.
> 
> Well, a function prefixed with "sev_" should check cc_vendor first...

I don't think cc_platform_has() is the right check. On TDX side we use
X86_FEATURE_TDX_GUEST for this and it works better than stretching
CC_ATTRs beyond their meaning.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
