Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1069F644
	for <linux-coco@lists.linux.dev>; Mon, 30 Jan 2023 06:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675061189; x=1706597189;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=DBy9ACt6QqbTYSWYlb9yQn7TbaVQV5Up/Ns12kloQi4=;
  b=c9gH3tawOpdKps7AKTY7GJjXAuI+sLQ0m8dfjSGlhBlVIVb4BavaRRVU
   7d7dP5e8Dt360EuWTpnT2lpFME9fr3eB9LyMY8oyDbOCQLNdbxTk7cVDv
   Ox7zqHNQE8c7gltDVyhPTk2Db+vAviF3NgIqlmR2tFdnOKBglqbyRN+o0
   23vaRRqYC7nxAOtl6RnNfTe7XcaYgnNvEAYmHcEHZgs/owaLf9oDTzrYl
   L4Gnzp4KMcH6kujJG08eFM1COt7AeQYHYj0x963JhJFE2elKy+gjXpe7D
   ejSXPSb4cF3B0os1MrknnZes3RirNbErgbWcNiPLNpJSZcxWLU3Hfzo+z
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10605"; a="327501758"
X-IronPort-AV: E=Sophos;i="5.97,257,1669104000"; 
   d="scan'208";a="327501758"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2023 22:46:24 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10605"; a="696299830"
X-IronPort-AV: E=Sophos;i="5.97,257,1669104000"; 
   d="scan'208";a="696299830"
Received: from akleen-mobl3.amr.corp.intel.com (HELO [10.212.149.210]) ([10.212.149.210])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2023 22:46:23 -0800
Message-ID: <09a56915-7ce2-b70c-33ec-3a8767269637@linux.intel.com>
Date: Sun, 29 Jan 2023 22:46:23 -0800
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
Content-Language: en-US
To: Guorui Yu <GuoRui.Yu@linux.alibaba.com>, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, konrad.wilk@oracle.com,
 linux-coco@lists.linux.dev
Cc: robin.murphy@arm.com
References: <20230128083254.86012-1-GuoRui.Yu@linux.alibaba.com>
 <20230128083254.86012-3-GuoRui.Yu@linux.alibaba.com>
 <9b167caf-1b10-f97a-d96a-b7ead8e785e8@linux.intel.com>
 <2ec59355-c8d5-c794-16e8-7d646b43c455@linux.alibaba.com>
From: Andi Kleen <ak@linux.intel.com>
In-Reply-To: <2ec59355-c8d5-c794-16e8-7d646b43c455@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


> I try to solve this problem by creating a new kernel thread, "kccd", 
> to populate the TLB buffer in the backgroud.
>
> Specifically,
> 1. A new kernel thread is created with the help of "arch_initcall", 
> and this kthread is responsible for memory allocation and setting 
> memory attributes (private or shared);
> 2. The "swiotlb_tbl_map_single" routine only use the spin_lock 
> protected TLB buffers pre-allocated by the kthread;
>   a) which actually includes ONE memory allocation brought by xarray 
> insertion "__xa_insert__".

That already seems dangerous with all the usual problems of memory 
allocations in IO paths. Normally code at least uses a mempool to avoid 
the worst dead lock potential.

> 3. After each allocation, the water level of TLB resources will be 
> checked. If the current TLB resources are found to be lower than the 
> preset value (half of the watermark), the kthread will be awakened to 
> fill them.
> 4. The TLB buffer allocation in the kthread is batched to 
> "(MAX_ORDER_NR_PAGES << PAGE_SHIFT)" to reduce the holding time of 
> spin_lock and number of calls to set_memory_decrypted().

Okay, but does this guarantee that it will never run out of memory?

It seems difficult to make such guarantees. What happens for example if 
the background thread gets starved by something higher priority?

Or if the allocators have such high bandwidth that they can overwhelm 
any reasonable background thread.

-Andi


