Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8293E1DDC18
	for <linux-coco@lists.linux.dev>; Mon,  9 Jun 2025 16:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749487383; cv=none; b=iJCgFuGwVLeU/zCOOdpUFHBrcS0bU9tVatei0o3w4nvDhOY0+sk8rCwQ5ptWleoshlg6HfkTQMyHc4IGoKMVsYK3Nck4xfXbDuDyv8CGZ6MmAIkWJig2tkUGmXeHSwIZ+6OBGwDle51VEW3L2AvWAYFrvAKK8999TYN/f7pxgeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749487383; c=relaxed/simple;
	bh=s2upxlrxJ+Rtk9BkE01z5t+cov/SI/oaWOZRvbfxygk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tVk/vISxSru4I8pJIA17QMSz6hondpeH4c1NHcY7kQt8z2oqQ1GWrYNzm72zfgBEX6SMSruKGlctYnU5eAaXbCo0tVnK/cwqTdYqg0kAHBaEvTv8/5J4qvj2oUNXYxfP1ZNA9kziMt2520cWBahMzydtRslKuXADAzekhbzxhFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 15E9114BF;
	Mon,  9 Jun 2025 09:42:43 -0700 (PDT)
Received: from [10.57.48.120] (unknown [10.57.48.120])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 697183F673;
	Mon,  9 Jun 2025 09:43:00 -0700 (PDT)
Message-ID: <0e313cc0-b673-4d13-ab22-741c7fde39df@arm.com>
Date: Mon, 9 Jun 2025 17:42:59 +0100
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 3/3] iommufd/tsm: Add tsm_bind/unbind iommufd ioctls
Content-Language: en-GB
To: Xu Yilun <yilun.xu@linux.intel.com>, Jason Gunthorpe <jgg@nvidia.com>
Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
 Alexey Kardashevskiy <aik@amd.com>, Dan Williams <dan.j.williams@intel.com>,
 linux-coco@lists.linux.dev, linux-pci@vger.kernel.org,
 gregkh@linuxfoundation.org, lukas@wunner.de, sameo@rivosinc.com,
 zhiw@nvidia.com
References: <aDsta4UX76GaExrO@yilunxu-OptiPlex-7050>
 <yq5azfeqjt9i.fsf@kernel.org> <aD3QcQxtjoYXrglM@yilunxu-OptiPlex-7050>
 <yq5ao6v5ju6p.fsf@kernel.org> <aD7TZRnFualizeXk@yilunxu-OptiPlex-7050>
 <20250603121456.GF376789@nvidia.com> <aD/aOk9jHryygiRG@yilunxu-OptiPlex-7050>
 <20250604123118.GE5028@nvidia.com> <aEEOKXxTuUifYxJY@yilunxu-OptiPlex-7050>
 <20250605145435.GA19710@nvidia.com> <aEZ65MtawOTjGZ9R@yilunxu-OptiPlex-7050>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <aEZ65MtawOTjGZ9R@yilunxu-OptiPlex-7050>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09/06/2025 07:10, Xu Yilun wrote:
> On Thu, Jun 05, 2025 at 11:54:35AM -0300, Jason Gunthorpe wrote:
>> On Thu, Jun 05, 2025 at 11:25:29AM +0800, Xu Yilun wrote:
>>
>>> That's good point, thanks. S-EPT is controlled by TSM, but the fact is,
>>> unlike RMP it needs too much help from VMM side, and now KVM is the
>>> helper. I will continue to investigate if TDX TSM driver could opt in to
>>> become another helper and how to coordinate with KVM.
>>
>> I think it would be quite a simplification if the iommufd operation
>> would also cause the TSM to setup the secure MMIO directly from the
>> pPCI device and remove hypervisor access to it.
>>
>> Then you don't need DMABUF to KVM at all.
> 
> I thought about this for sometime. It may be possible to trigger KVM
> to populate/zap the S-EPT but cannot let TSM direct setup/remove S-EPT.
> RMP could be updated by a single instruction, but S-EPT update involves
> generic KVM MMU flow like Page Table Page management, TLB invalidation,
> even mirror EPT management (specific to x86 KVM MMU).
> 
> To make KVM populate S-EPT, we need KVM memory slots and in turn need
> DMABUF.

May be this is answered/discussed already, but why can't we use 
(vfio->fd, offset) similar to the gmem_fd for KVM memory slot ? VFIO 
could prevent mmap if the device is bound and also pervent bind, when 
there is a mapping ?

Suzuki


> 
> Thanks,
> Yilun
> 
>>
>> The create vPCI call would have to specify the base virtual addresses
>> of all the BARs from userspace, which is probably OK as I suspose you
>> also cannot disable or relocate the MMIO BAR while in T=1 mode.
>>
>> Jason

