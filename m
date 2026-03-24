Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 519073EDAA4
	for <linux-coco@lists.linux.dev>; Tue, 24 Mar 2026 12:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774353664; cv=none; b=mXnlbY2+LHzRTf20XDfRf/B2UujAulDsLJFCqI0zYFr3zYO+gWNlIYN32pV289ccRq9Zr4gkrtMOYp9wr7BmWxrr6NhNvzRY8WoJ6GrdV0jboi1JY10fLunRKcyfuJVzZQYiBesG2dMMdqCfzvqPQU2MS9gv2RmhKBWY554cMIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774353664; c=relaxed/simple;
	bh=LBSelXUmDdw7uStyJ/dS5KNmrXZYc6tcp0HXtRjX5cQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rK165BcECvD8BrM9g3HboPLCLwcobemqmnoHKmRnN+wdWTDY9ErQRNllLAvd4lc25dyRyHE53vahnVCxxyP1AlSXpD0o83Ss8fFa3j3ZAqwQQ8g+x6iJg/D7hUSJBoUyntpCc52xsFKig9p4zyYF+7DVIUbCiFKS86+QN0cl4/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=h5oLWxRc; arc=none smtp.client-ip=209.85.161.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="h5oLWxRc"
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-67bb3fe55a5so1499576eaf.2
        for <linux-coco@lists.linux.dev>; Tue, 24 Mar 2026 05:01:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1774353660; x=1774958460; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6xGeDSaplrfa0s0FkTnYgpWTfeJHarWr6HfnS+Tx8gc=;
        b=h5oLWxRco354BwzH0HQIF4+ZCi/HrI6TDb65nsahZ6lMxHefytxEfUCpDLK/Z6zh1Q
         n3i8EwHGxCaU5KvOy0PbLJ990dY3s25e+G1zGh/Gh70u0tl13kuHouKJkpPk/DaO+Zsi
         c70BW9DcYG7ACzk/INl62JQBec23mdu1Z/T/NAg22D+UMeuqRtwiCe7LuuQdVJg3eAl4
         K/JKVF/BW13ZbJW9FP0DUWHbs/0ccwJSJupa+gXlZPPdoh4En+LMuXfWo+UZ65jGvULw
         L3k1B4a9huRq3eqOj1POw73wZUeH9sBGKWrejAW5WCnHrxd51x2TKMu3mtG3qj9K6izJ
         px2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774353660; x=1774958460;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6xGeDSaplrfa0s0FkTnYgpWTfeJHarWr6HfnS+Tx8gc=;
        b=gGOL9uh1VxVoN/aikLRreYOsjEeGbwMrGeJzpYOCAotGC1rcx5CjpoOJv5YKKhxs4E
         J8VLqM8ZqgvrHvQxbWp+cTdEzepgf+/WkYGxv4R9Bdn5HeXyTfiXDX1H7meB2n3KCh8q
         CuSSodXiXPAkud9cJL2pG5IbdjAIzkXHnVm7l4xLS+EUmbG4TO3XvtE8tZ320wA7N/BU
         kuzMsy1KTC7TiRNTmUbCxZ1rfVLD4Vq8bD+5N6VKesGR72HHC2Ea2/DLrH948Etrm9rc
         FAEWIyKboE2DDL/Vi+pCb7iMQr0kkeUjswo0XDmS5qYSZwNRFlAEoHAi9mNMbfbfDNgX
         Yc2w==
X-Forwarded-Encrypted: i=1; AJvYcCU8aYP6CLhGkbURoF5XhgpxcifTTN/MFySYGlpl6iVSbvn+6Hv+Yk0gSH870mOX7kE125H5F0RhrGi1@lists.linux.dev
X-Gm-Message-State: AOJu0Yzm04O9DsQB7d5+GjZ6k1FbbZRUsfwo0UKSj4pW8NyrFo+8g4+J
	H0Dw/Qm/cCwJs82xzmjj7552OvFmlvisLrgQ7VvDsDWl6vVNxGop4iUtVN7pPiXnnyg=
X-Gm-Gg: ATEYQzzyoJoeH1jzdujbI9vvnAaH1aq4oJD1anNCdaEChSBsOVKC0RyjlolZFL6CTZR
	PCTFyem38C6kneV6opwQrPiZL80ArgZC8pNQtJdtDK6a16EsHBa6bls1ghrYmyR1CxLrUj2Ywd8
	093o9dbFowggZnvPwTPZuPxJe4sPtKpVAQjX8jz4wGIDsGPjM3e1YV2TZ/vkW2I7myXKRHQsYMf
	JDpdAu2PmJZ5k6tV95ePLFI4Ddtoqe/nFN5+ws09Y7b2fNnbIGsjgNK849Pi6gg5kPRM+BboR1D
	C89fh5MErVtSZH/QIqi2Qkbj+OndK4FvNocTC8l9vphVfDKJjb0Hh2x9dcyeVl/nOaGRiMdU0NA
	+K7indxaQMrEvG2SkSof/GKIQO2yJEOQKUKNW0N1qCSfhxoaKOUcLLpgGqUZWXMX1iP3ByxMIff
	mn6KPpu1ZhVKhrXUMXtY57sduMd/kt9ZGZPMzl1YLbVp3Dpy/n8dtKhwDJ8lu4ETE+PiLXKZz3n
	mFWKm42
X-Received: by 2002:a05:6820:174b:b0:67d:f88f:d83d with SMTP id 006d021491bc7-67df88fef36mr1271317eaf.29.1774353659590;
        Tue, 24 Mar 2026 05:00:59 -0700 (PDT)
Received: from ziepe.ca (mctnnbsa70w-159-2-73-22.dhcp-dynamic.fibreop.nb.bellaliant.net. [159.2.73.22])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89c85335402sm138526236d6.25.2026.03.24.05.00.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 05:00:58 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1w50RN-00000000GV5-3aCE;
	Tue, 24 Mar 2026 09:00:57 -0300
Date: Tue, 24 Mar 2026 09:00:57 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Mostafa Saleh <smostafa@google.com>
Cc: Jiri Pirko <jiri@resnulli.us>, dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org, iommu@lists.linux.dev,
	linux-media@vger.kernel.org, sumit.semwal@linaro.org,
	benjamin.gaignard@collabora.com, Brian.Starkey@arm.com,
	jstultz@google.com, tjmercier@google.com, christian.koenig@amd.com,
	m.szyprowski@samsung.com, robin.murphy@arm.com, leon@kernel.org,
	sean.anderson@linux.dev, ptesarik@suse.com, catalin.marinas@arm.com,
	aneesh.kumar@kernel.org, suzuki.poulose@arm.com,
	steven.price@arm.com, thomas.lendacky@amd.com, john.allen@amd.com,
	ashish.kalra@amd.com, suravee.suthikulpanit@amd.com,
	linux-coco@lists.linux.dev
Subject: Re: [PATCH net-next v3 0/2] dma-buf: heaps: system: add an option to
 allocate explicitly decrypted memory
Message-ID: <20260324120057.GC8437@ziepe.ca>
References: <20260305123641.164164-1-jiri@resnulli.us>
 <ablV_f_l7wD2m63E@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ablV_f_l7wD2m63E@google.com>

On Tue, Mar 17, 2026 at 01:24:13PM +0000, Mostafa Saleh wrote:

> On the other hand, for restricted-dma, the memory decryption is deep
> in the DMA direct memory allocation and the DMA API callers (for ex
> virtio drivers) are clueless about it and can’t pass any attrs.
> My proposal was specific to restricted-dma and won’t work for your case.

How is this any different from CC?

If the device cannot dma to "encrypted" memory, whatever that means
for you, then the DMA API:
 - Makes dma alloc coherent return "decrypted" memory, and the built
   in mapping of coherent memory knows about this
 - Makes dma_map_xxx use SWIOTLB to bounce to decrypted memory

There is no need for something like virtio drivers to be aware of
any of this.

On the other hand if the driver deliberately allocates decrypted
memory without using DMA API alloc coherent then it knows it did it
and can pass the flag to map it.

> I am wondering if the kernel should have a more solid, unified method
> for identifying already-decrypted memory instead. Perhaps we need a
> way for the DMA API to natively recognize the encryption state of a
> physical page (working alongside force_dma_unencrypted(dev)), rather
> than relying on caller-provided attributes?

Definately not, we do not want the DMA API inspecting things like
this.

Jason
