Received: from out199-16.us.a.mail.aliyun.com (out199-16.us.a.mail.aliyun.com [47.90.199.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83F8F376
	for <linux-coco@lists.linux.dev>; Mon, 30 Jan 2023 02:30:47 +0000 (UTC)
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R461e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018045176;MF=guorui.yu@linux.alibaba.com;NM=1;PH=DS;RN=6;SR=0;TI=SMTPD_---0VaM31N4_1675045507;
Received: from 30.221.130.236(mailfrom:GuoRui.Yu@linux.alibaba.com fp:SMTPD_---0VaM31N4_1675045507)
          by smtp.aliyun-inc.com;
          Mon, 30 Jan 2023 10:25:09 +0800
Message-ID: <2ec59355-c8d5-c794-16e8-7d646b43c455@linux.alibaba.com>
Date: Mon, 30 Jan 2023 10:25:06 +0800
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
From: Guorui Yu <GuoRui.Yu@linux.alibaba.com>
In-Reply-To: <9b167caf-1b10-f97a-d96a-b7ead8e785e8@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

在 2023/1/30 00:58, Andi Kleen 写道:
> 
> On 1/28/2023 12:32 AM, GuoRui.Yu wrote:
>> Under COnfidential COmputing (CoCo) scenarios, the VMM cannot access
>> guest memory directly but requires the guest to explicitly mark the
>> memory as shared (decrypted). To make the streaming DMA mappings work,
>> the current implementation relays on legacy SWIOTLB to bounce the DMA
>> buffer between private (encrypted) and shared (decrypted) memory.
>>
>> However, the legacy swiotlb is designed for compatibility rather than
>> efficiency and CoCo purpose, which will inevitably introduce some
>> unnecessary restrictions.
>> 1. Fixed immutable swiotlb size cannot accommodate to requirements of
>>     multiple devices. And 1GiB (current maximum size) of swiotlb in our
>>     testbed cannot afford multiple disks reads/writes simultaneously.
>> 2. Fixed immutable IO_TLB_SIZE (2KiB) cannot satisfy various kinds of
>>     devices. At the moment, the minimal size of a swiotlb buffer is 2KiB,
>>     which will waste memory on small network packets (under 512 bytes)
>>     and decrease efficiency on a large block (up to 256KiB) size
>>     reads/writes of disks. And it is hard to have a trade-off on legacy
>>     swiotlb to rule them all.
>> 3. The legacy swiotlb cannot efficiently support larger swiotlb buffers.
>>     In the worst case, the current implementation requires a full scan of
>>     the entire swiotlb buffer, which can cause severe performance hits.
>>
>> Instead of keeping "infecting" the legacy swiotlb code with CoCo logic,
>> this patch tries to introduce a new cc-swiotlb for Confidential VMs.
>>
>> Confidential VMs usually have reasonable modern devices (virtio devices,
>> NVME, etc.), which can access memory above 4GiB, cc-swiotlb could
>> allocate TLB buffers dynamically on-demand, and this design solves
>> problem 1.
> 
> When you say solving you mean support for growing the size dynamically 
> without pre-allocation?
> 
> The IOMMU is traditionally called in non preemptible regions in drivers, 
> and also allocating memory in IO paths is still not considered fully 
> safe due to potential deadlocks. Both makes it difficult to allocate 
> large memory regions dynamically.
> 
> It's not clear how you would solve that?
>
> -Andi

Hi Andi,

Thanks for your question!

I try to solve this problem by creating a new kernel thread, "kccd", to 
populate the TLB buffer in the backgroud.

Specifically,
1. A new kernel thread is created with the help of "arch_initcall", and 
this kthread is responsible for memory allocation and setting memory 
attributes (private or shared);
2. The "swiotlb_tbl_map_single" routine only use the spin_lock protected 
TLB buffers pre-allocated by the kthread;
   a) which actually includes ONE memory allocation brought by xarray 
insertion "__xa_insert__".
3. After each allocation, the water level of TLB resources will be 
checked. If the current TLB resources are found to be lower than the 
preset value (half of the watermark), the kthread will be awakened to 
fill them.
4. The TLB buffer allocation in the kthread is batched to 
"(MAX_ORDER_NR_PAGES << PAGE_SHIFT)" to reduce the holding time of 
spin_lock and number of calls to set_memory_decrypted().

Thanks,
Guorui
