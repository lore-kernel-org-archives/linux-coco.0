Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E4EE8BF5
	for <linux-coco@lists.linux.dev>; Thu,  7 Sep 2023 14:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694096739; x=1725632739;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lLkgQjdozZeu2blgME5D5x7Y7mxXeqbdwxTIXoD6yOY=;
  b=Ofh9t4PtQTYb3SCQ/TicXRd/4wuDdVK52Ne9P9Quutr/nCCNzKLcfu/A
   E99q/0JrW86Lc2R2lkvbG0CDyxuMNbTb3DQdgxM9t1zgqHha4Wdz0ejVD
   eeb2UMrmIaNskd92Q+kl2JKc0ZJ8oiTICzlxKwXj4L5LmI/SuQvXCqJKs
   6d7yLZCe6BNHDJFX3VKnqCztE78KRkfZaBhW8Fqn6tY6EAvmnLURphUXw
   S9yxw6JWYvsvr3pQ4IdRX+82Cm4aq5F1ucE/WMEBz48Cb4SpKXPARiurW
   IZRtHSc3kdgRbQr2GsVHnPg1wSu9mYCb0wHFUodOorACuViMit5C/Xq6J
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="357679644"
X-IronPort-AV: E=Sophos;i="6.02,235,1688454000"; 
   d="scan'208";a="357679644"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2023 07:25:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="735520927"
X-IronPort-AV: E=Sophos;i="6.02,235,1688454000"; 
   d="scan'208";a="735520927"
Received: from oshragax-mobl1.ger.corp.intel.com (HELO box.shutemov.name) ([10.251.215.248])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2023 07:25:14 -0700
Received: by box.shutemov.name (Postfix, from userid 1000)
	id 7882D104860; Thu,  7 Sep 2023 17:25:10 +0300 (+03)
Date: Thu, 7 Sep 2023 17:25:10 +0300
From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
To: Dave Hansen <dave.hansen@intel.com>
Cc: Adrian Hunter <adrian.hunter@intel.com>, Borislav Petkov <bp@alien8.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	Mike Rapoport <rppt@linux.ibm.com>,
	Lorenzo Stoakes <lstoakes@gmail.com>,
	Tom Lendacky <thomas.lendacky@amd.com>, Baoquan He <bhe@redhat.com>,
	Vivek Goyal <vgoyal@redhat.com>, Dave Young <dyoung@redhat.com>,
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org, linux-coco@lists.linux.dev,
	linux-efi@vger.kernel.org, kexec@lists.infradead.org
Subject: Re: [PATCH 3/3] /dev/mem: Do not map unaccepted memory
Message-ID: <20230907142510.vcj57cvnewqt4m37@box.shutemov.name>
References: <20230906073902.4229-1-adrian.hunter@intel.com>
 <20230906073902.4229-4-adrian.hunter@intel.com>
 <9ffb7a3b-cf20-617a-e4f1-8a6a8a2c5972@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9ffb7a3b-cf20-617a-e4f1-8a6a8a2c5972@intel.com>

On Thu, Sep 07, 2023 at 07:15:21AM -0700, Dave Hansen wrote:
> On 9/6/23 00:39, Adrian Hunter wrote:
> > Support for unaccepted memory was added recently, refer commit
> > dcdfdd40fa82 ("mm: Add support for unaccepted memory"), whereby
> > a virtual machine may need to accept memory before it can be used.
> > 
> > Do not map unaccepted memory because it can cause the guest to fail.
> 
> Doesn't /dev/mem already provide a billion ways for someone to shoot
> themselves in the foot?  TDX seems to have added the 1,000,000,001st.
> Is this really worth patching?

Is it better to let TD die silently? I don't think so.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
