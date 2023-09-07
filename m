Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D73F128E7
	for <linux-coco@lists.linux.dev>; Thu,  7 Sep 2023 15:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694101393; x=1725637393;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=nvAw9m6A6x9DDVOWLkP+zkRHDGaDC+Y39YscRQTquf0=;
  b=kI9PmkyXVlTjf3xyYP+oaVTxG/gKVYRuQ50e74NL6/pTw0v7pX0d7/RR
   +i27VywFtemY+BMIfn0FgV5UacuTyS6FURF8cspubDmjty7D5gS6vRYSt
   MwQ4H3k+LaneW+FNptsO1vNI/wl7X82dJYgLXYA5Bmhi39zFJToEuDjsu
   ocHq6WIdA4Dm6gMoMeUpq39LUpD2uZs9+N6hHt0tdcbdlC45QD8/jjqTQ
   KHw3eFxfQDXxUjVH9IxijF3gbneX/zwRDBfxZF9eZcfWl+870Q1KQSyOT
   Ou668pFOB1/ds9KqRW3Tb1QpFjBET7ioZTegj2aIBGPHNe+umRtTElew1
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="463769144"
X-IronPort-AV: E=Sophos;i="6.02,235,1688454000"; 
   d="scan'208";a="463769144"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2023 08:43:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="735563105"
X-IronPort-AV: E=Sophos;i="6.02,235,1688454000"; 
   d="scan'208";a="735563105"
Received: from ningle-mobl2.amr.corp.intel.com (HELO [10.209.13.77]) ([10.209.13.77])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2023 08:43:07 -0700
Message-ID: <523020c5-87fe-6aa3-4c30-c0ca94d36f8f@intel.com>
Date: Thu, 7 Sep 2023 08:43:07 -0700
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH 2/3] proc/kcore: Do not map unaccepted memory
Content-Language: en-US
To: Adrian Hunter <adrian.hunter@intel.com>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 Borislav Petkov <bp@alien8.de>, Andrew Morton <akpm@linux-foundation.org>
Cc: Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@linux.ibm.com>,
 Lorenzo Stoakes <lstoakes@gmail.com>, Tom Lendacky
 <thomas.lendacky@amd.com>, Baoquan He <bhe@redhat.com>,
 Vivek Goyal <vgoyal@redhat.com>, Dave Young <dyoung@redhat.com>,
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-mm@kvack.org, linux-coco@lists.linux.dev, linux-efi@vger.kernel.org,
 kexec@lists.infradead.org
References: <20230906073902.4229-1-adrian.hunter@intel.com>
 <20230906073902.4229-3-adrian.hunter@intel.com>
From: Dave Hansen <dave.hansen@intel.com>
In-Reply-To: <20230906073902.4229-3-adrian.hunter@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/6/23 00:39, Adrian Hunter wrote:
> Do not map unaccepted memory because it can cause the guest to fail.
> 
> For /proc/kcore, which is read-only and does not support mmap, this means a
> read of unaccepted memory will return zeros.

I'm confused by this changelog and subject.

What is getting "mapped" here if mmap() isn't in play?
