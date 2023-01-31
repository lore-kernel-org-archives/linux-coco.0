Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2A618F51
	for <linux-coco@lists.linux.dev>; Tue, 31 Jan 2023 17:16:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675185376; x=1706721376;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=9zBjP78++PUeYFI1Tn93XmBcUNX5nkcvT3SvfzZepBI=;
  b=PP5Hqvrcsn7c/yfAKYRhf2L8Dq3vY+tGMuSvMq5nKeJaviNzaBJFBHpi
   IQgRcER4AFi3zprwEugfI6lUBWJImVxcfAFENS1498BVz2oh6HM1bnpYD
   izconvgh09/728tidP+2+i+0IfL4/WtsshNap7EFZp/BA7nI2DJWJFIh/
   ZLMVM/cR3euD3suew1Vw74Zg31PnrWbk+y6E0zJkJGXCuSfcxM+42Z8IM
   2adpmJkcPyI3grzf6bDJydKTiA0/2fOqsc9+z1FkCdtkY8TNcFcBWprrG
   /dkyG6ihRRWEXbVvqzF3+YmuJOXr//6NL4sfTBMtyw+Mt6efAVg7wmjuI
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10607"; a="308241410"
X-IronPort-AV: E=Sophos;i="5.97,261,1669104000"; 
   d="scan'208";a="308241410"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2023 09:16:16 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10607"; a="909985397"
X-IronPort-AV: E=Sophos;i="5.97,261,1669104000"; 
   d="scan'208";a="909985397"
Received: from akleen-mobl3.amr.corp.intel.com (HELO [10.241.232.75]) ([10.241.232.75])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2023 09:16:15 -0800
Message-ID: <ee5d8c26-a453-678c-be48-d586271573d6@linux.intel.com>
Date: Tue, 31 Jan 2023 09:16:11 -0800
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 2/4] swiotlb: Add a new cc-swiotlb implementation for
 Confidential VMs
To: Guorui Yu <GuoRui.Yu@linux.alibaba.com>, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, konrad.wilk@oracle.com,
 linux-coco@lists.linux.dev
Cc: robin.murphy@arm.com
References: <20230128083254.86012-1-GuoRui.Yu@linux.alibaba.com>
 <20230128083254.86012-3-GuoRui.Yu@linux.alibaba.com>
 <9b167caf-1b10-f97a-d96a-b7ead8e785e8@linux.intel.com>
 <2ec59355-c8d5-c794-16e8-7d646b43c455@linux.alibaba.com>
 <09a56915-7ce2-b70c-33ec-3a8767269637@linux.intel.com>
 <ccc21265-07aa-cd82-f679-4fee9c51df47@linux.alibaba.com>
Content-Language: en-US
From: Andi Kleen <ak@linux.intel.com>
In-Reply-To: <ccc21265-07aa-cd82-f679-4fee9c51df47@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

 >No, this cannot guarantee we always have sufficient TLB caches, so we 
can also have a "No memory for cc-swiotlb buffer" warning.

It's not just a warning, it will be IO errors, right?

>
> But I want to emphasize that in this case, the current implementation 
> is no worse than the legacy implementation. Moreover, dynamic TLB 
> allocation is more suitable for situations where more disks/network 
> devices will be hotplugged, in which case you cannot pre-set a 
> reasonable value.

That's a reasonable stand point, but have to emphasize that is 
"probabilistic" in all the descriptions and comments.

I assume you did some stress testing (E.g. all cores submitting at full 
bandwidth) to validate that it works for you?

-Andi


