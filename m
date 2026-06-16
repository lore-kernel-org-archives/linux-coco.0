Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43D2247CC80
	for <linux-coco@lists.linux.dev>; Tue, 16 Jun 2026 18:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781635505; cv=none; b=hqJZhy7/OH1aQkp1mhfcWhDM3l0iQMnh2ihO6iPGITGZ2OCDIHX2zM6nvAUtXXv/vlXIrM7nrMEF4jRWJQkbNN1IB8YCXaIe0QKouR9prbpdrRtfef12KBXMEcWyZoLWsYnZ7y6oqtlqJ931Congny9FrdGKyqk3/b0+P8DfFZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781635505; c=relaxed/simple;
	bh=R33LmJr8q6kqHkYQWLGz7MbJ2uGNUERbltu0/vzmAZA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UWiSvcadZGu4B9IBohuPeGT9AXA3/Jq6TNRWgaWpDbWPpbVA2io3fl081+YRNQO6xo+UtyAY2nbS9UmQDVpxAculTyKCNT7x7Hspw++z/ygB7Q/ldPrK882zDQRzlunJijW8430V8ZLf8dm5sr5JF5blURQxUxYcscHKZcRtN98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=Pwie9d5E; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="Pwie9d5E"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-91ae31bbaa9so209723485a.1
        for <linux-coco@lists.linux.dev>; Tue, 16 Jun 2026 11:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1781635502; x=1782240302; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=G18mYJrcuFPmmxraU/yFJy+0YudgzW+4bZ7GypMnwpM=;
        b=Pwie9d5ELq1gVZ8l3wcDNbMZw/gXX0r2bCtTRh2KutC8u/UTLMkK7dVsoESeSvnXbh
         re6WvXWlQ7GM9iZIrYo1agWa7VWeX1FlbQa+fvEIRINs/Ugzzydav5XMbYac3+bN/izj
         gi8esPoXPKdwatz8nMQt4wjP6LeNqm/LHzVOzO1wHFBUbFKji7F/kODFL322Vu9FCoBW
         WeUMN8mRSqSlM/WwIReY+BIldRjt5w5KmeS5IeCbMFk4YW9ktT+TSEOhvYjWp45m7Ff1
         5n9/KwlGXGwNy+208AVxvow3IAcUniAXS+TpW2RBZHU1OeLcDQZuJtBNhFPzQwpe6qj6
         3J9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781635502; x=1782240302;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G18mYJrcuFPmmxraU/yFJy+0YudgzW+4bZ7GypMnwpM=;
        b=K7Hx5EP9h7LMSWwuCNeN464bmu8C8OtOv/ODdLiE8ER5pKhJiofOlsYmfomuDExvPJ
         C4qLOsUcF9k1t43rYJEVsXVFX3A3RW2FNt2fsmEkzSjA30VxceRoPYYp5odwipLIa4bG
         Epb6vfII13g2DqR94trNIoiJdZIbyF0+dS/UC0OPy3oUvaHNgatQ41bbL0HKYOsUtgG7
         aXhb2tGKDzyOoa5+gFvSyINFLsT0yLCXuTp1ub7/rrfZHidO2KIdR3wQpFX8CAdiBDmD
         ecL8hN2RmGqj+Lez1eFZOlVGsARI9X8klnD+ZaGutrX9LNdtLBX1LW5EfV/RJH+jH9hy
         sjtA==
X-Forwarded-Encrypted: i=1; AFNElJ9FTvbum3Tiy2bxClst7FxbxxtUpnSZg7OmoqfzqgkOA7o+x55KoENrmmSrW5WOAJPNR9IIIZFJ6B7Z@lists.linux.dev
X-Gm-Message-State: AOJu0YynKrtFtiGbq5gk/BWPvoJjaw9f2J+S7x+7GMueJs8B+lHe7+ys
	LIfzYX2/dyz6ea9GKTA7SJqZZMzunfcpqeFw6oAlTrmf65sn59oLvYsI14rEUEbdMzI=
X-Gm-Gg: Acq92OECjIMB0yPcr7fWQMOViHnhRMSvpDOHxpeR48Dy3JUvYAN07OR9riTa7eJALQc
	NOybPgaG0nyX6Hd0G6KGOPgoVkB8EkTb1VcBD0x9l5TwCDAH1gOaKFuFB6A7RWrn5hP238KsMoa
	qjPPuWzVwj2pgFfg5iUax/OeYHWYPqPKtgKHkgqeQf3jFKhlaRaxWWTM+Vl6VEVOo+A/TLitpYM
	K8qBI7GiFJZaLzxx8DK6AHVkgh8z+ebulpFhe0qewqgR3ND2E6dxbr4sHkgFoRCIe516Vy6HGnV
	ZsLKu+eofq8OybsYdcRpza1fBOoK7l6aITuBmpC/e//egvFxhzlfiUsqWZiV3UfEKqDluIPJPT8
	iw+XudSEJm2cbfOtBaG/sFnqnZA9cu+3Gv/LKpvW7nGb2OPAye9Kg8lrNQbh9nvcsmRj5vErnbG
	VPZSdJ4EDXksAJWxnirT/6bjRSi2ZD7oE/egNki9VmB0B+ZR6KscbW8o3G0yKXeBLlGcuxPFkTe
	K2Iiw==
X-Received: by 2002:a05:620a:2908:b0:915:d32a:1cba with SMTP id af79cd13be357-91dbc52c4damr20136485a.27.1781635502015;
        Tue, 16 Jun 2026 11:45:02 -0700 (PDT)
Received: from ziepe.ca (crbknf0213w-47-54-130-67.pppoe-dynamic.high-speed.nl.bellaliant.net. [47.54.130.67])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9161a00af50sm1669672285a.30.2026.06.16.11.45.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 11:45:01 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wZYmS-0000000GgQZ-3dnI;
	Tue, 16 Jun 2026 15:45:00 -0300
Date: Tue, 16 Jun 2026 15:45:00 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Christoph Hellwig <hch@infradead.org>,
	Kameron Carr <kameroncarr@linux.microsoft.com>,
	akpm@linux-foundation.org, urezki@gmail.com, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, rppt@kernel.org, mhklinux@outlook.com,
	linux-coco@lists.linux.dev,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>
Subject: Re: [RFC PATCH] mm/vmalloc: add vmalloc_decrypted() and
 vzalloc_decrypted()
Message-ID: <20260616184500.GD3577091@ziepe.ca>
References: <20260521205834.1012925-1-kameroncarr@linux.microsoft.com>
 <aibhnnDFQTHWMEFe@arm.com>
 <20260611114954.GC1066031@ziepe.ca>
 <aixGqCqKkQeDfUST@arm.com>
 <20260612181807.GP1066031@ziepe.ca>
 <ajGTPelKLhgFqh7F@arm.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ajGTPelKLhgFqh7F@arm.com>

On Tue, Jun 16, 2026 at 07:17:33PM +0100, Catalin Marinas wrote:

> > The entry point is dma_alloc_noncontiguous() and you get a scatterlist
> > back.
> 
> Yes but not scattered pages unless there's an iommu behind. Anyway,
> that's an implementation detail, something like
> dma_alloc_noncontiguous_vmap() could allocate scattered pages as a
> fallback.

Oh I never noticed it deliberately returns only a single dma entry. I
think that could be optionally weakened without alot of trouble

There is also dma_vmap_noncontiguous() already, so I think the main
framework is there, though it seems like it needs a a bit mmore features.

> Currently, something like netvsc_init_buf() just does a vzalloc() and
> passes it down to vmbus_establish_gpadl() which knows how to interpret
> the channel encryption status. I assume with the vzalloc_decrypted()
> API, that info needs to be interpreted at the netvsc_init_buf() level to
> know which allocation to call.

But it doesn't end at alloc does it? hyperv will still have to reach
into the vmap and convert it into an appropriate IPA to pass to the
hypervisor. That really needs to use the arch helpers the DMA API has
and those should not be called by any sort of driver environment like
hyperv.

> If we move towards a dma_alloc_noncontiguous_vmap() API we need vmbus to
> encode the encryption requirement in the hv_device::device somehow so
> that force_dma_unencrypted() knows what do return. 

Yes, they would have to act like PCI and mark in-TEE and out of-TEE
struct devices properly so the DMA API knows what to do instead of
open coding a copy of all this logic in hyperv.

> We have the DMA_ATTR_CC_SHARED but that's not interpreted on the DMA
> alloc path, 

It is to describe memory that was deliberately allocated as decrypted,
not to control allocation choices.

> so there's a bit more work needed on the DMA API I think (not sure
> whether Aneesh's series covers any of this).

I don't think it does directly. It largely sets the stage to properly
allow a struct device to opt out of force_dma_unencrypted() so we get
support a T=1 PCI device.

Jason

