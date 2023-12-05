Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9CA26A35A
	for <linux-coco@lists.linux.dev>; Tue,  5 Dec 2023 18:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DruW0T1U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701799699; x=1733335699;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nU6+ltTP+gOUvBsLEAvcLUqPG2SP0oUe7thQXPa5nUo=;
  b=DruW0T1UTHoqYqYdjH+iHtPNOQSBCJC1sGp2qKNIVWP4UaSgAqDOt17i
   jIybeu+GSpFw0/2w7nrVO0kVn5+X6wHzpRfVaKwD5BVPi9S0vu5vgYeoK
   L2z96doOsDXH3Z96fYnk5hSf1ZNi85VwVYbEIPbSlZ9trJkauwvmQg2WH
   3RtQv4Dze9dwjBR0JuaVL1ndztBqnQR5kiYxK6vk4gnrb6q5nFoK0G9kd
   OM6h9SCfq3m1kVK5XlIMXVOf4hJgjYW3IEmcsIk1vSGknsX20ct/Nm/2H
   F/NpQHnzJsfzbhuH+nPlY3sP3daqcjuiQZPnje3d9IO2F8fIAm6FuxL2n
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="992290"
X-IronPort-AV: E=Sophos;i="6.04,253,1695711600"; 
   d="scan'208";a="992290"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2023 10:08:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="747327088"
X-IronPort-AV: E=Sophos;i="6.04,253,1695711600"; 
   d="scan'208";a="747327088"
Received: from rjongalo-mobl2.ger.corp.intel.com (HELO box.shutemov.name) ([10.252.46.235])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2023 10:08:16 -0800
Received: by box.shutemov.name (Postfix, from userid 1000)
	id 3A14A10A43A; Tue,  5 Dec 2023 21:08:13 +0300 (+03)
Date: Tue, 5 Dec 2023 21:08:13 +0300
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
Message-ID: <20231205180813.phbxg5jdumfovshz@box.shutemov.name>
References: <20231205143738.2875-1-kirill.shutemov@linux.intel.com>
 <20231205144619.GCZW83uzAomKmupn7j@fat_crate.local>
 <20231205150012.6lma2wzcellr7pz7@box.shutemov.name>
 <20231205150648.GDZW88iAjBzYoIJ0+o@fat_crate.local>
 <20231205151437.aqmuydosfmnq3zr4@box.shutemov.name>
 <20231205160035.GEZW9JI8eKENXBo6EO@fat_crate.local>
 <20231205171643.zg7fwxjyccab53kf@box.shutemov.name>
 <20231205172436.GFZW9c1EaCaguGhglb@fat_crate.local>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231205172436.GFZW9c1EaCaguGhglb@fat_crate.local>

On Tue, Dec 05, 2023 at 06:24:36PM +0100, Borislav Petkov wrote:
> On Tue, Dec 05, 2023 at 08:16:43PM +0300, Kirill A. Shutemov wrote:
> > What's wrong with using X86_FEATURE_* here?
> 
> What's wrong with using something which is already there?

It is here and it is broken.

I think legitimate use case for cc_platfrom_has() is to check platform
capability, not specific implementation. CC_ATTR_GUEST_MEM_ENCRYPT makes
sense, CC_ATTR_GUEST_SEV_SNP doesn't.

And we have much more mature infrastructure around X86_FEATURE_ comparing
to CC_ATRR_. If we can use it, we should.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
