Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 819103093C3
	for <linux-coco@lists.linux.dev>; Mon, 19 Jan 2026 09:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768816347; cv=none; b=lisa0yYQ/CYuEByu3mr0GugRfOOoTZ3Z0Z5fsJ9/FY+8kft7s8cqnxEdeRs2k1/yHVdq2eG9LaClmN8Q8PBQDlXNI6TAurgS7DOnmkWL87TIM0Wxcqzuj3H9NFwbOh+vCVuTi3MDnI2sA4pZo3LC+g+Mvyn2OOwxq5j7bckBizI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768816347; c=relaxed/simple;
	bh=/K+N7no199LAFJIxvY+00e+LuKC/ursEmV+EEGWlkAs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=c/Eqco68Q4kVQjOTa6hlD5lVOy9Ym1KkjMskIv1NJqeMjBu9sk2NmoqqwDeLRk3R/i8D0xFDYJAgUa3/DF+8/PxlyFJGNTFoMGOR5TbECiNeeyOP8wnFLPEN2D4IM6ih8VECDvB/CXmRprVaN0/mNFVe3P9MA9n9e7BmyCXhQYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=HT2tSp8e; arc=none smtp.client-ip=210.118.77.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="HT2tSp8e"
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20260119095218euoutp025a10f6fe414e5878330ee0b83ff61326~MGRaSS0G40937709377euoutp020
	for <linux-coco@lists.linux.dev>; Mon, 19 Jan 2026 09:52:18 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20260119095218euoutp025a10f6fe414e5878330ee0b83ff61326~MGRaSS0G40937709377euoutp020
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1768816338;
	bh=z+vsQlcwjoKouWWPbWz3EuaV6xaRFyJGEtU6Clh6LuY=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=HT2tSp8e+PSghdGYDZYmObYU/8bmAGjJlWaaI8ovGriTuclja1rET6+8M7pi8XMdx
	 rIfLsbDJ0Ze2unJ6fA8v+gVJl4ycH6b5dZHQvk4ZJilMIw6Vrt33+5xhVCpWTIZ4rA
	 HlYM32uWPGi86JY4hz+pSyQyIo0XAFGNFtMnM5Dc=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20260119095218eucas1p111df7f3d647c3d385fbb38cc02607986~MGRaEfgS91419314193eucas1p1U;
	Mon, 19 Jan 2026 09:52:18 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20260119095217eusmtip29bce1b403ef6b57acb65e729c09cc16c~MGRZo21kV1622316223eusmtip2n;
	Mon, 19 Jan 2026 09:52:17 +0000 (GMT)
Message-ID: <0ad7a059-8c51-4d26-9d7e-055abb702b66@samsung.com>
Date: Mon, 19 Jan 2026 10:52:16 +0100
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH] dma-direct: swiotlb: Skip encryption toggles for
 swiotlb allocations
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Robin Murphy
	<robin.murphy@arm.com>, iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-coco@lists.linux.dev
Cc: steven.price@arm.com, Suzuki K Poulose <suzuki.poulose@arm.com>, Claire
	Chang <tientzu@chromium.org>
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <yq5aldi0cyms.fsf@kernel.org>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260119095218eucas1p111df7f3d647c3d385fbb38cc02607986
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260114094941eucas1p2b2985accee8c2eb5ccd48f94463adffa
X-EPHeader: CA
X-CMS-RootMailID: 20260114094941eucas1p2b2985accee8c2eb5ccd48f94463adffa
References: <20260102155448.2554240-1-aneesh.kumar@kernel.org>
	<cddcaeff-9652-4685-ba6c-0fda79bd8680@arm.com> <yq5a7btr5wii.fsf@kernel.org>
	<1290fd7e-bfaf-47ce-b12f-cca0b938b293@arm.com> <yq5acy3eet1b.fsf@kernel.org>
	<CGME20260114094941eucas1p2b2985accee8c2eb5ccd48f94463adffa@eucas1p2.samsung.com>
	<yq5aldi0cyms.fsf@kernel.org>

On 14.01.2026 10:49, Aneesh Kumar K.V wrote:
> Aneesh Kumar K.V <aneesh.kumar@kernel.org> writes:
>> Robin Murphy <robin.murphy@arm.com> writes:
>>> On 2026-01-09 2:51 am, Aneesh Kumar K.V wrote:
>>>> Robin Murphy <robin.murphy@arm.com> writes:
>>>>> On 2026-01-02 3:54 pm, Aneesh Kumar K.V (Arm) wrote:
>>>>>> Swiotlb backing pages are already mapped decrypted via
>>>>>> swiotlb_update_mem_attributes(), so dma-direct does not need to call
>>>>>> set_memory_decrypted() during allocation or re-encrypt the memory on
>>>>>> free.
>>>>>>
>>>>>> Handle swiotlb-backed buffers explicitly: obtain the DMA address and
>>>>>> zero the linear mapping for lowmem pages, and bypass the decrypt/encrypt
>>>>>> transitions when allocating/freeing from the swiotlb pool (detected via
>>>>>> swiotlb_find_pool()).
>>>>> swiotlb_update_mem_attributes() only applies to the default SWIOTLB
>>>>> buffer, while the dma_direct_alloc_swiotlb() path is only for private
>>>>> restricted pools (because the whole point is that restricted DMA devices
>>>>> cannot use the regular allocator/default pools). There is no redundancy
>>>>> here AFAICS.
>>>>>
>>>> But rmem_swiotlb_device_init() is also marking the entire pool decrypted
>>>>
>>>> 	set_memory_decrypted((unsigned long)phys_to_virt(rmem->base),
>>>> 			     rmem->size >> PAGE_SHIFT);
>>> OK, so why doesn't the commit message mention that instead of saying
>>> something which fails to justify the patch at all? ;)
>>>
>>> Furthermore, how much does this actually matter? The "real" restricted
>>> DMA use-case is on systems where dma_set_decrypted() is a no-op anyway.
>>> I know we used restricted DMA as a hack in the early days of CCA
>>> prototyping, but is it intended to actually deploy that as a supported
>>> and recommended mechanism now?
>>>
>>> Note also that the swiotlb_alloc path is essentially an emergency
>>> fallback, which doesn't work for all situations anyway - any restricted
>>> device that actually needs to make significant coherent allocations (or
>>> rather, that firmware cannot assume won't want to do so) should really
>>> have a proper coherent pool alongside its restricted one. The expected
>>> use-case here is for something like a wifi driver that only needs to
>>> allocate one or two small coherent buffers once at startup, then do
>>> everything else with streaming DMA.
>> I was aiming to bring more consistency in how swiotlb buffers are
>> handled, specifically by treating all swiotlb memory as decrypted
>> buffers, which is also how the current code behaves.
>>
>> If we are concluding that restricted DMA is not used in conjunction with
>> memory encryption, then we could, in fact, remove the
>> set_memory_decrypted() call from rmem_swiotlb_device_init() and
>> instead add failure conditions for force_dma_unencrypted(dev) in
>> is_swiotlb_for_alloc(). However, it’s worth noting that the initial
>> commit did take the memory encryption feature into account
>> (0b84e4f8b793eb4045fd64f6f514165a7974cd16).
>>
>> Please let me know if you think this needs to be fixed.
> Something like.
>
> dma-direct: restricted-dma: Do not mark the restricted DMA pool unencrypted
>
> As per commit f4111e39a52a ("swiotlb: Add restricted DMA alloc/free
> support"), the restricted-dma-pool is used in conjunction with the
> shared-dma-pool. Since allocations from the shared-dma-pool are not
> marked unencrypted, skip marking the restricted-dma-pool as unencrypted
> as well. We do not expect systems using the restricted-dma-pool to have
> memory encryption or to run with confidential computing features enabled.
>
> If a device requires unencrypted access (force_dma_unencrypted(dev)),
> the dma-direct allocator will mark the restricted-dma-pool allocation as
> unencrypted.
>
> The only disadvantage is that, when running on a CC guest with a
> different hypervisor page size, restricted-dma-pool allocation sizes
> must now be aligned to the hypervisor page size. This alignment would
> not be required if the entire pool were marked unencrypted. However, the
> new code enables the use of the restricted-dma-pool for trusted devices.
> Previously, because the entire pool was marked unencrypted, trusted
> devices were unable to allocate from it.
>
> There is still an open question regarding allocations from the
> shared-dma-pool. Currently, they are not marked unencrypted.
>
> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
>
> 1 file changed, 2 deletions(-)
> kernel/dma/swiotlb.c | 2 --
>
> modified   kernel/dma/swiotlb.c
> @@ -1835,8 +1835,6 @@ static int rmem_swiotlb_device_init(struct reserved_mem *rmem,
>   			return -ENOMEM;
>   		}
>   
> -		set_memory_decrypted((unsigned long)phys_to_virt(rmem->base),
> -				     rmem->size >> PAGE_SHIFT);
>   		swiotlb_init_io_tlb_pool(pool, rmem->base, nslabs,
>   					 false, nareas);
>   		mem->force_bounce = true;

Robin, could You review this? Is it ready for applying?

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

