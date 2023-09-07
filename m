Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 567C220FA
	for <linux-coco@lists.linux.dev>; Thu,  7 Sep 2023 10:09:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694081345; x=1725617345;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vslREB8ROsaiDtOyMM59OVIoUOD6oP12DWv5XlYD9Hw=;
  b=LXHXZOToDdv/OQOv+Him4c78gnZih2xFEyULsA5Fa5CnifFCcx2FLjTv
   9jRe5i9Tz4/bx5Qg+d01GUQI89zLlF2a5PMeqynj26GrhNpanKenhatVy
   jEW1pJLv01JrnG82QVs3YdDaMIRG/VbQbfexmlC3r9oCXT4ict0wnKnC+
   ljb4vQdzsSEDWom2FfcuIJ9rY9tk6Z940n893zISIgY4QO87GiS2LQTXF
   akcFSTD2lHbGZ8/f5zffdaNSYm6LoORbSwq0YRLVmD0wU43qbja4vR/8r
   rVwwEM3yZi3/h332m24NJc4gn/DRqOGt5LxvDp0fDRtWnDyjx5+f7erq/
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="367538850"
X-IronPort-AV: E=Sophos;i="6.02,234,1688454000"; 
   d="scan'208";a="367538850"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2023 03:07:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="691725586"
X-IronPort-AV: E=Sophos;i="6.02,234,1688454000"; 
   d="scan'208";a="691725586"
Received: from rbhaumik-mobl2.ger.corp.intel.com (HELO box.shutemov.name) ([10.249.44.38])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2023 03:07:49 -0700
Received: by box.shutemov.name (Postfix, from userid 1000)
	id C66861042C5; Thu,  7 Sep 2023 13:07:46 +0300 (+03)
Date: Thu, 7 Sep 2023 13:07:46 +0300
From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: Borislav Petkov <bp@alien8.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Dave Hansen <dave.hansen@intel.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Mike Rapoport <rppt@linux.ibm.com>,
	Lorenzo Stoakes <lstoakes@gmail.com>,
	Tom Lendacky <thomas.lendacky@amd.com>, Baoquan He <bhe@redhat.com>,
	Vivek Goyal <vgoyal@redhat.com>, Dave Young <dyoung@redhat.com>,
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org, linux-coco@lists.linux.dev,
	linux-efi@vger.kernel.org, kexec@lists.infradead.org
Subject: Re: [PATCH 0/3] Do not map unaccepted memory
Message-ID: <20230907100746.42ujuj7brawxw322@box.shutemov.name>
References: <20230906073902.4229-1-adrian.hunter@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230906073902.4229-1-adrian.hunter@intel.com>

On Wed, Sep 06, 2023 at 10:38:59AM +0300, Adrian Hunter wrote:
> Hi
> 
> Support for unaccepted memory was added recently, refer commit
> dcdfdd40fa82 ("mm: Add support for unaccepted memory"), whereby
> a virtual machine may need to accept memory before it can be used.
> 
> Plug a few gaps where RAM is exposed without checking if it is
> unaccepted memory.

Thanks for catching this. Looks good to me.

Reviewed-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
