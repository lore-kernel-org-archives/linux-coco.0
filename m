Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B33A692AA
	for <linux-coco@lists.linux.dev>; Tue,  5 Dec 2023 17:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ar/yG1NM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701796609; x=1733332609;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+3ZqesXVy8GB3x255vfft0g1wTDCIpWjiLA4RZ264PA=;
  b=ar/yG1NMMs5bYER69lHbIU6mwazPOEOOa0pclAPbnEBMEzs0em0GlI5r
   ciaMMQp3YbRyt8MYZR3BX0BsOtd52xzDropSxlDLCgwyZI/uJehrbP7xG
   HlWt9dSRFOAlJ1FOoAzPqosEKRimfbeS/7c8LSi34mjGE3/PeXdQUmlNE
   iPtPXYWahe6YpjeeXAgOA1hZ9JRfzNHnyr9VIR4yrja5KK0fX3zSR4X9w
   L0NuAu009cAsbkUaoSd1L7PAFv6w7xRX0W1z2NavszmnKVZTSi+4IG4gp
   wcpJbsmgNAJNk2uGZeuRLOW447b3lBTZh+LL1hCMn2ksyg8vRhUskCH3Z
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="425084807"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; 
   d="scan'208";a="425084807"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2023 09:16:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="841544380"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; 
   d="scan'208";a="841544380"
Received: from rjongalo-mobl2.ger.corp.intel.com (HELO box.shutemov.name) ([10.252.46.235])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2023 09:16:46 -0800
Received: by box.shutemov.name (Postfix, from userid 1000)
	id 7402310A43A; Tue,  5 Dec 2023 20:16:43 +0300 (+03)
Date: Tue, 5 Dec 2023 20:16:43 +0300
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
Message-ID: <20231205171643.zg7fwxjyccab53kf@box.shutemov.name>
References: <20231205143738.2875-1-kirill.shutemov@linux.intel.com>
 <20231205144619.GCZW83uzAomKmupn7j@fat_crate.local>
 <20231205150012.6lma2wzcellr7pz7@box.shutemov.name>
 <20231205150648.GDZW88iAjBzYoIJ0+o@fat_crate.local>
 <20231205151437.aqmuydosfmnq3zr4@box.shutemov.name>
 <20231205160035.GEZW9JI8eKENXBo6EO@fat_crate.local>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231205160035.GEZW9JI8eKENXBo6EO@fat_crate.local>

On Tue, Dec 05, 2023 at 05:00:35PM +0100, Borislav Petkov wrote:
> On Tue, Dec 05, 2023 at 06:14:37PM +0300, Kirill A. Shutemov wrote:
> > My point is that if you need to check for SEV you need to check SEV, not
> > CC_ATTR. CC_ATTRs only make sense in generic code that deals with multiple
> > CoCo environments.
> 
> That makes more sense.
> 
> So that commit already says "If future support is added for other
> memory encryption technologies, the use of CC_ATTR_GUEST_MEM_ENCRYPT
> can be updated, as required."
> 
> And what this test needs to do is to check:
> 
> 	if (guest type >= SEV)
> 
> meaning SEV and -ES and -SNP.
> 
> I'm wondering if we should export amd_cc_platform_has() for such
> cases...

What's wrong with using X86_FEATURE_* here?

X86_FEATURE_SEV_GUEST is set for all SEVs. X86_FEATURE_SEV_ES_GUEST and
X86_FEATURE_SEV_SNP_GUEST can be used to test specific flavor.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
