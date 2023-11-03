Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB9A019458
	for <linux-coco@lists.linux.dev>; Fri,  3 Nov 2023 14:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eZHg9n15"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699023240; x=1730559240;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ImLATCUal4qcTIqW8Jys3wM2D8O83KmDvPk7LUPJviQ=;
  b=eZHg9n15aKjyhBPxKMecEhbhNlcOvuimQiKxnJ7HSAU/J0yytUYsl7xA
   8mwwsNZrG+Zk8EvzugLld7w2eoqaNlaRugzhTyRXiziDZdBQsrIBmJVXi
   1F5CcCh2/5stCpHdwfOoUII/KD8xcENmpO24D+hWsis99q+1e6vhE425T
   6k+o7v8ul8XD+BO+eWkHyV2XeUOoGLu61rxwaiMPLeb8Y/A+roKZc7Ff6
   Bdd6q7ys/FfWCbKujP/VLB1VmIm5b7D35QrkAZB4DLnmfKj0JSJpFLB0W
   jmeSqCdwKXWRrI7wzXOIsW8ZfOohjZ0cZWeSOUntKK3+yoPsnHxejQ+Tc
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="392839542"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; 
   d="scan'208";a="392839542"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2023 07:53:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; 
   d="scan'208";a="2912345"
Received: from mahautam-mobl.ger.corp.intel.com (HELO box.shutemov.name) ([10.252.51.190])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2023 07:53:56 -0700
Received: by box.shutemov.name (Postfix, from userid 1000)
	id C491E10A314; Fri,  3 Nov 2023 17:53:53 +0300 (+03)
Date: Fri, 3 Nov 2023 17:53:53 +0300
From: "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
To: Michael Roth <michael.roth@amd.com>
Cc: linux-efi@vger.kernel.org, x86@kernel.org, linux-coco@lists.linux.dev,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>, Vlastimil Babka <vbabka@suse.cz>,
	Nikolay Borisov <nik.borisov@suse.com>, stable@kernel.org,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] efi/unaccepted: Fix off-by-one when checking for
 overlapping ranges
Message-ID: <20231103145353.5wzcwc5znkzt6vzf@box>
References: <20231103142650.108394-1-michael.roth@amd.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231103142650.108394-1-michael.roth@amd.com>

On Fri, Nov 03, 2023 at 09:26:50AM -0500, Michael Roth wrote:
> When a thread needs to accept memory it will scan the accepting_list
> to see if any ranges already being processed by other threads overlap
> with its range. Due to an off-by-one in the range comparisons, a thread
> might falsely determine that an overlapping range is being accepted,
> leading to an unnecessary delay before it begins processing the range.

Maybe s/thread/task/g ?

> Fix the off-by-one in the range comparison to prevent this and slightly
> improve performance.
> 
> Fixes: 50e782a86c98 ("efi/unaccepted: Fix soft lockups caused by parallel memory acceptance")
> Link: https://lore.kernel.org/linux-mm/20231101004523.vseyi5bezgfaht5i@amd.com/T/#me2eceb9906fcae5fe958b3fe88e41f920f8335b6
> Signed-off-by: Michael Roth <michael.roth@amd.com>

Otherwise, looks good:

Reviewed-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
> 

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
