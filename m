Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB5D432D45C
	for <linux-coco@lists.linux.dev>; Tue, 17 Mar 2026 15:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773762011; cv=none; b=jyR4r9T1UlIplbozfm9Lg367FNEEJk5UBa37ILin38E7KGdqkZKbtmGEyD+Ulir5CWtOZ6U/7Zo45yDbUenqWRJD38IHAy/Jdo1QyM5wrXCEKL2CUTLEVMQ0ZUBZ+7wfEg3bv1oV6BSBkNl+usMBLwgyehtwzTOQ+l6kmgsGOrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773762011; c=relaxed/simple;
	bh=sBrzgYqy4YhXBaHZkGEzLEeQP1vB36ZIIqh/wd2RhOI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=honTyaGEuc8M8ln/RLKqdrjHpPQlCEQJNYaCj4uN4XU83I9WBVuqi0tBdVmxk6WdhkX384+9BzjFXVaOBxnbOq3tJmOV3elhmtVOm9Y+N9if+Mqf9AFAofxP7+ZZf8aKLz83mJ3/k+OctQiSihKrghRtDqK4LmA7bmWIFyOMONE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wMsjz+CO; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wMsjz+CO"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4852af55981so92875e9.0
        for <linux-coco@lists.linux.dev>; Tue, 17 Mar 2026 08:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773762006; x=1774366806; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CDw4r5ujTl31OHrtYbqvixsT9t+9enT6zG9dzarVNeI=;
        b=wMsjz+COE/ZLk8R+i18cYqqKpSaJ5xcPb5K7vlk0MYstN08Defc6zIUw77Mc32OVP3
         2bzCGriS8qR0wRpcXnsSeIBKNpVk2zqVTEvsd58Prvahwcn6KWJaTvjH4OttBpw8cx7t
         KPMmzTWLqGPtwhN5IUkuuJztRuI/Xz/xu5cJzAtwWQ5cYXYD1b4C+ybaKJrFzmc8LcTI
         o7zAncnMj/NJWthUJ39wkfLIPziLkY7/6Flhq1LHxsfJSFodg+o6YaXewy00Es9Nh5/+
         dQ/jcmLlz1ARN0Jh3EVVJb5x/acjRqcIvbVEyQeMoQcpHDiQNvYkr5Rbmm+d/bLeLMDr
         IRrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773762006; x=1774366806;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CDw4r5ujTl31OHrtYbqvixsT9t+9enT6zG9dzarVNeI=;
        b=aupJMeESLq5XLD5OYkIQxo8SxEdYIyLZTtAIN+fuKBonEt2LIie4DT4QEorA1+bVsr
         oRo3C40odJVdW5jFoDmwqYOEla3lQAXxe+5kM/AZvyj2IlD0oulaNlQI2+Pg2o+rIxY4
         wIRcwX+B+EXjLJ5gmrvUR4IcTZcjFQ5Wicv3vpu+CwvcP0huagyiOFs9hhZttHd8sGP7
         XKjLUBjdtVOXhc1gySi/mht/UMT+Gmzm7zosgMQBfbJXQqFxDzaoiaQn3MQkigmTzHdR
         WscwzQ/Q4/PQw1puaPzD5pEQJ/6TnvkaQfDskN5UoP4mukZqMaWL6aH+gRMKpYiXU1Eu
         oosg==
X-Forwarded-Encrypted: i=1; AJvYcCXj0xVMfik8sPwfFAPI0n61FoCLod+fG25RVso+P/WQ0QZsyApZNqkW1sq5s4FhezSzidTRIrDO5VLW@lists.linux.dev
X-Gm-Message-State: AOJu0YyvyQxPm9XqSUaf6WkNk1YtWg0sUaDbyo9f9iZuU39NOsDEZ6jB
	wLDKYvkp9rAhj97q5mM0bfT5BNRE6O1jBlZLlffsBai85xHqcMDLE8yqf8Ym9T7+Mw==
X-Gm-Gg: ATEYQzwkvMKUtEfvSWt+uibhF59GQQqWSBgLrSPrwPh5URDeGFg7fLptaARga/N+M+P
	DSc4Jpr6QPIQexWXZHvb6yfIAYCNAqsEy1kL5Am3N8/vJ/pvLnCYn9joYRCdCR8HHjphL4mG7YW
	FQe9uxmBAaKwXUl9A9cEBkrkEvf5LyC09530CvdqaDvNjadGVaDXKw3iF47cQVuZof/EpVQeQxs
	SVSzIFuSKBMBh4+84ySpHtTkd/yccJFpm3RpFUnNdCGUmdrNWHIfATfqVTNDjzDejiSFLZtUEra
	xWaXIbfQmueqa87u1zrlavi0dC/RS+x/+HuJT7ghrdmkGfoLosA2qImmn1LWEg7bPiXwiSrqTjn
	xPXN/MOZmh6EpS1DWayw4LWMj6adIPKWna/dMGljURACMOBXGJI/xK8UcOCQkNww9vJC0Xm6UWO
	V4EVIqiCui3MJkTPD4IhXrBCc5mVp9QC7i2Q5wKX3gTXYtAa4tuERUkbM+
X-Received: by 2002:a7b:cb8b:0:b0:483:6f85:b16e with SMTP id 5b1f17b1804b1-485709958a2mr850705e9.3.1773762005359;
        Tue, 17 Mar 2026 08:40:05 -0700 (PDT)
Received: from google.com (54.95.38.34.bc.googleusercontent.com. [34.38.95.54])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4856eae3396sm72909465e9.9.2026.03.17.08.40.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 08:40:04 -0700 (PDT)
Date: Tue, 17 Mar 2026 15:40:01 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Jiri Pirko <jiri@resnulli.us>
Cc: dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
	iommu@lists.linux.dev, linux-media@vger.kernel.org,
	sumit.semwal@linaro.org, benjamin.gaignard@collabora.com,
	Brian.Starkey@arm.com, jstultz@google.com, tjmercier@google.com,
	christian.koenig@amd.com, m.szyprowski@samsung.com,
	robin.murphy@arm.com, jgg@ziepe.ca, leon@kernel.org,
	sean.anderson@linux.dev, ptesarik@suse.com, catalin.marinas@arm.com,
	aneesh.kumar@kernel.org, suzuki.poulose@arm.com,
	steven.price@arm.com, thomas.lendacky@amd.com, john.allen@amd.com,
	ashish.kalra@amd.com, suravee.suthikulpanit@amd.com,
	linux-coco@lists.linux.dev
Subject: Re: [PATCH net-next v3 0/2] dma-buf: heaps: system: add an option to
 allocate explicitly decrypted memory
Message-ID: <abl10SQ4tdasfErt@google.com>
References: <20260305123641.164164-1-jiri@resnulli.us>
 <ablV_f_l7wD2m63E@google.com>
 <xdy5anped2koy47cuxbbqocyypisl7lagwvpuokpzpggohk2dp@yilc5ihictph>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <xdy5anped2koy47cuxbbqocyypisl7lagwvpuokpzpggohk2dp@yilc5ihictph>

On Tue, Mar 17, 2026 at 02:37:02PM +0100, Jiri Pirko wrote:
> Tue, Mar 17, 2026 at 02:24:13PM +0100, smostafa@google.com wrote:
> >Hi Jiri,
> >
> >On Thu, Mar 05, 2026 at 01:36:39PM +0100, Jiri Pirko wrote:
> >> From: Jiri Pirko <jiri@nvidia.com>
> >> 
> >> Confidential computing (CoCo) VMs/guests, such as AMD SEV and Intel TDX,
> >> run with encrypted/protected memory which creates a challenge
> >> for devices that do not support DMA to it (no TDISP support).
> >> 
> >> For kernel-only DMA operations, swiotlb bounce buffering provides a
> >> transparent solution by copying data through decrypted memory.
> >> However, the only way to get this memory into userspace is via the DMA
> >> API's dma_alloc_pages()/dma_mmap_pages() type interfaces which limits
> >> the use of the memory to a single DMA device, and is incompatible with
> >> pin_user_pages().
> >> 
> >> These limitations are particularly problematic for the RDMA subsystem
> >> which makes heavy use of pin_user_pages() and expects flexible memory
> >> usage between many different DMA devices.
> >> 
> >> This patch series enables userspace to explicitly request decrypted
> >> (shared) memory allocations from the dma-buf system heap.
> >> Userspace can mmap this memory and pass the dma-buf fd to other
> >> existing importers such as RDMA or DRM devices to access the
> >> memory. The DMA API is improved to allow the dma heap exporter to DMA
> >> map the shared memory to each importing device.
> >
> >I have been looking into a similar problem with restricted-dma[1] and
> >the inability of the DMA API to recognize that a block of memory is
> >already decrypted.
> >
> >However, in your case, adding a new attr “DMA_ATTR_CC_DECRYPTED” works
> >well as dma-buf owns the memory, and is both responsible for the
> >set_memory_decrypted() and passing the DMA attrs.
> >
> >On the other hand, for restricted-dma, the memory decryption is deep
> >in the DMA direct memory allocation and the DMA API callers (for ex
> >virtio drivers) are clueless about it and can’t pass any attrs.
> >My proposal was specific to restricted-dma and won’t work for your case.
> >
> >I am wondering if the kernel should have a more solid, unified method
> >for identifying already-decrypted memory instead. Perhaps we need a
> >way for the DMA API to natively recognize the encryption state of a
> >physical page (working alongside force_dma_unencrypted(dev)), rather
> >than relying on caller-provided attributes?
> 
> I actually had it originally implemented probably in the similar way you
> suggest. I had a bit in page/folio struct to indicate the
> "shared/decrypted" state. However I was told that adding such bit is
> basically a no-go. Isn't that right?
> 

Yes, I believe it’s discouraged to add new fields to the struct page.
But I see the memory encryption API is spilling in different places
and I am not sure if that’s a good enough justification for that or
maybe we just need to re-architect it.
For the restricted-dma stuff, we don’t actually care about the
address, a device can either handle encryption or not, so relying on
force_dma_unencrypted(struct device *) which is implemented by the
architecture is enough, and we just need to integrate that so it
can be used from SWIOTLB and DMA-direct (and other places)
consistently. (although that might not be a simple as it sounds)

I am not sure in the dma-buf case if that would be enough, but
another way to have this per page and to avoid encoding this in
struct page, is to push this problem to the arch code and it can
rely on things as the page table (I believe ARM CCA have a bit
for that)

Anyway, I think there should be some boundaries in the kernel that
defines that instead of each subsystem having its assumptions,
especially memory encryption/decryption problems that can easily
cause security issues.

Thanks,
Mostafa

> 
> >
> >[1] https://lore.kernel.org/all/20260305170335.963568-1-smostafa@google.com/
> >
> >Thanks,
> >Mostafa
> >
> >
> >> 
> >> Jiri Pirko (2):
> >>   dma-mapping: introduce DMA_ATTR_CC_DECRYPTED for pre-decrypted memory
> >>   dma-buf: heaps: system: add system_cc_decrypted heap for explicitly
> >>     decrypted memory
> >> 
> >>  drivers/dma-buf/heaps/system_heap.c | 103 ++++++++++++++++++++++++++--
> >>  include/linux/dma-mapping.h         |   6 ++
> >>  include/trace/events/dma.h          |   3 +-
> >>  kernel/dma/direct.h                 |  14 +++-
> >>  4 files changed, 117 insertions(+), 9 deletions(-)
> >> 
> >> -- 
> >> 2.51.1
> >> 
