Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D79F28F4
	for <linux-coco@lists.linux.dev>; Sun, 29 Jan 2023 16:58:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675011535; x=1706547535;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=zJdxOL4LRZKyZHC5+rSemcU1cQpgUazIepiio5t+Hh8=;
  b=LOWyfKEOuTeG2xEnmvm0XoXXHmRqY3VUiT1oCa2rVGf0BZnsFHa/ZwBv
   YPylybUMjyObIJZcp6POTAJYyTuk2t3j7hbY+Ri4XeHhSnlXEFbJLuRKi
   I+hS9SZj+OpoQ8maPsaQQ3Zd/IJ6zP7QpHi9HkhlIdpo2dhGr4OcUrSLe
   YI8Ka5vcSLaG1FsTcdMk0mX6KOGZFDKzf0orjc/kSwuPiz3l9fxnpxYZq
   2bwM/Q00EGu4aalNPLSOGEvJPT8emR41r9Rr+M2Ok9x7BnT/pFuneADZk
   3045l3uDpyqsrJ0kGkxfH2V5LMFwE2SiE02q8LTWcvvZpFKgPKAdbFpd+
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10605"; a="311031911"
X-IronPort-AV: E=Sophos;i="5.97,256,1669104000"; 
   d="scan'208";a="311031911"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2023 08:58:54 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10605"; a="787764913"
X-IronPort-AV: E=Sophos;i="5.97,256,1669104000"; 
   d="scan'208";a="787764913"
Received: from akleen-mobl3.amr.corp.intel.com (HELO [10.212.149.210]) ([10.212.149.210])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2023 08:58:54 -0800
Message-ID: <9b167caf-1b10-f97a-d96a-b7ead8e785e8@linux.intel.com>
Date: Sun, 29 Jan 2023 08:58:54 -0800
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
To: "GuoRui.Yu" <GuoRui.Yu@linux.alibaba.com>, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, konrad.wilk@oracle.com,
 linux-coco@lists.linux.dev
Cc: robin.murphy@arm.com
References: <20230128083254.86012-1-GuoRui.Yu@linux.alibaba.com>
 <20230128083254.86012-3-GuoRui.Yu@linux.alibaba.com>
From: Andi Kleen <ak@linux.intel.com>
In-Reply-To: <20230128083254.86012-3-GuoRui.Yu@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 1/28/2023 12:32 AM, GuoRui.Yu wrote:
> Under COnfidential COmputing (CoCo) scenarios, the VMM cannot access
> guest memory directly but requires the guest to explicitly mark the
> memory as shared (decrypted). To make the streaming DMA mappings work,
> the current implementation relays on legacy SWIOTLB to bounce the DMA
> buffer between private (encrypted) and shared (decrypted) memory.
>
> However, the legacy swiotlb is designed for compatibility rather than
> efficiency and CoCo purpose, which will inevitably introduce some
> unnecessary restrictions.
> 1. Fixed immutable swiotlb size cannot accommodate to requirements of
>     multiple devices. And 1GiB (current maximum size) of swiotlb in our
>     testbed cannot afford multiple disks reads/writes simultaneously.
> 2. Fixed immutable IO_TLB_SIZE (2KiB) cannot satisfy various kinds of
>     devices. At the moment, the minimal size of a swiotlb buffer is 2KiB,
>     which will waste memory on small network packets (under 512 bytes)
>     and decrease efficiency on a large block (up to 256KiB) size
>     reads/writes of disks. And it is hard to have a trade-off on legacy
>     swiotlb to rule them all.
> 3. The legacy swiotlb cannot efficiently support larger swiotlb buffers.
>     In the worst case, the current implementation requires a full scan of
>     the entire swiotlb buffer, which can cause severe performance hits.
>
> Instead of keeping "infecting" the legacy swiotlb code with CoCo logic,
> this patch tries to introduce a new cc-swiotlb for Confidential VMs.
>
> Confidential VMs usually have reasonable modern devices (virtio devices,
> NVME, etc.), which can access memory above 4GiB, cc-swiotlb could
> allocate TLB buffers dynamically on-demand, and this design solves
> problem 1.

When you say solving you mean support for growing the size dynamically 
without pre-allocation?

The IOMMU is traditionally called in non preemptible regions in drivers, 
and also allocating memory in IO paths is still not considered fully 
safe due to potential deadlocks. Both makes it difficult to allocate 
large memory regions dynamically.

It's not clear how you would solve that?

-Andi

