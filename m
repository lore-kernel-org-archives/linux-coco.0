Received: from out199-4.us.a.mail.aliyun.com (out199-4.us.a.mail.aliyun.com [47.90.199.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4778228F3
	for <linux-coco@lists.linux.dev>; Mon, 30 Jan 2023 14:01:13 +0000 (UTC)
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R161e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018045176;MF=guorui.yu@linux.alibaba.com;NM=1;PH=DS;RN=6;SR=0;TI=SMTPD_---0VaSvuzq_1675086323;
Received: from 192.168.51.205(mailfrom:GuoRui.Yu@linux.alibaba.com fp:SMTPD_---0VaSvuzq_1675086323)
          by smtp.aliyun-inc.com;
          Mon, 30 Jan 2023 21:45:24 +0800
Message-ID: <ccc21265-07aa-cd82-f679-4fee9c51df47@linux.alibaba.com>
Date: Mon, 30 Jan 2023 21:45:22 +0800
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 2/4] swiotlb: Add a new cc-swiotlb implementation for
 Confidential VMs
To: Andi Kleen <ak@linux.intel.com>, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, konrad.wilk@oracle.com,
 linux-coco@lists.linux.dev
Cc: robin.murphy@arm.com
References: <20230128083254.86012-1-GuoRui.Yu@linux.alibaba.com>
 <20230128083254.86012-3-GuoRui.Yu@linux.alibaba.com>
 <9b167caf-1b10-f97a-d96a-b7ead8e785e8@linux.intel.com>
 <2ec59355-c8d5-c794-16e8-7d646b43c455@linux.alibaba.com>
 <09a56915-7ce2-b70c-33ec-3a8767269637@linux.intel.com>
From: Guorui Yu <GuoRui.Yu@linux.alibaba.com>
In-Reply-To: <09a56915-7ce2-b70c-33ec-3a8767269637@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Andi,

在 2023/1/30 14:46, Andi Kleen 写道:
> 
>> I try to solve this problem by creating a new kernel thread, "kccd", 
>> to populate the TLB buffer in the backgroud.
>>
>> Specifically,
>> 1. A new kernel thread is created with the help of "arch_initcall", 
>> and this kthread is responsible for memory allocation and setting 
>> memory attributes (private or shared);
>> 2. The "swiotlb_tbl_map_single" routine only use the spin_lock 
>> protected TLB buffers pre-allocated by the kthread;
>>   a) which actually includes ONE memory allocation brought by xarray 
>> insertion "__xa_insert__".
> 
> That already seems dangerous with all the usual problems of memory 
> allocations in IO paths. Normally code at least uses a mempool to avoid 
> the worst dead lock potential.
> 

The __xa_insert__ is called with GFP_NOWAIT (GFP_ATOMIC & ~__GFP_HIGH), 
and I will try to dig into this to check if there is any chance to have 
the deadlock.

I also tried my best to test this piece of code, and no issue have been 
found in the case of a maximum of 700,000 IOPS.

Thanks for your advices from this point, since I have not notice such 
possibility.

>> 3. After each allocation, the water level of TLB resources will be 
>> checked. If the current TLB resources are found to be lower than the 
>> preset value (half of the watermark), the kthread will be awakened to 
>> fill them.
>> 4. The TLB buffer allocation in the kthread is batched to 
>> "(MAX_ORDER_NR_PAGES << PAGE_SHIFT)" to reduce the holding time of 
>> spin_lock and number of calls to set_memory_decrypted().
> 
> Okay, but does this guarantee that it will never run out of memory?
>
> It seems difficult to make such guarantees. What happens for example if 
> the background thread gets starved by something higher priority?
> 
No, this cannot guarantee we always have sufficient TLB caches, so we 
can also have a "No memory for cc-swiotlb buffer" warning.

But I want to emphasize that in this case, the current implementation is 
no worse than the legacy implementation. Moreover, dynamic TLB 
allocation is more suitable for situations where more disks/network 
devices will be hotplugged, in which case you cannot pre-set a 
reasonable value.

> Or if the allocators have such high bandwidth that they can overwhelm 
> any reasonable background thread.
> 
> -Andi
> 

Sincerely,
Guorui
