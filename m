Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAE3E24B45
	for <linux-coco@lists.linux.dev>; Sat, 28 Feb 2026 00:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772238492; cv=none; b=bE9/7ZTj4NvODsC1LrwHL5E+n2AivNPDYZzEHte0B4AC/A94mai3orWR9nrAPvPDYjXHa7EEYTmrbypVhyiNvLF0r52P58n49HCmho6N8eQPNjbI9JMpqotDmsV54gSfJsGUwhHBB1dfalMxlAAsFx8ri75IXMsk58Qt11DMPBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772238492; c=relaxed/simple;
	bh=YGNKoZbd9ItV0tpLlMFHS8bKihozZyqN701JI8Fx9wU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G6bao6MWIrXZMMyeSaHhxRXcXhwX/XHOIfeE4l7WTAIgHM26Vj6uPkQEsrQhdrIH88A4iJWj6yRQZOymTOdnE5WzM6CVahH7Q/1ft3oRqyROQILGNOVwAyr+xHgZzJggUiBWUwQ4GfwksQQRhlmz6TIXWibpbXGd9NC/y+azZvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=DW5WnZMR; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="DW5WnZMR"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-896ff127650so41350246d6.3
        for <linux-coco@lists.linux.dev>; Fri, 27 Feb 2026 16:28:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1772238490; x=1772843290; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KAMLfTB0VdCLmRuczMOUd+4kmAfCR9U6SjigH585Y48=;
        b=DW5WnZMRNLqd7pTj8UY/gLg3v3mRBn/6m1IcTCGwdkDBux4D6RQERavPv9S17bOo2L
         Pt0zIe04B1NDAkqpSNJ6KnwhcbSwCj+stuJYRX/SmVDZdZLJi+ZbjTW8pEFulV5xy0ey
         EiYbYWnPN60CYk1eI+7222GNFKNhrlynIDi2txlzJlj6Y44LTHa+tikOqOtsxJozQSVH
         y+q/OtLrFNk/jHi/dWMQC6ChzMPM+/zitZQFbbfXRVsugQ+TGYe7kOwFQjpAi34vU/0T
         t/s/eUogirQLAC20IXKPJq4NwwhujZDdh6YBSsjaouVUIaqvA6LOE/h2/6g4U4XLtnxP
         GjAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772238490; x=1772843290;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KAMLfTB0VdCLmRuczMOUd+4kmAfCR9U6SjigH585Y48=;
        b=DtqaCNVEkBeeOpCLTJWR2MzLnxda/ztzLx1ETSq9lOiWic9MksrhBPfDUA8XXjtqyP
         +0KF19xOi3KN5+gn0OSWsrqiRS9s6+8EIzL5BkO5OJ3zcuAL2kkN0/nSw+42c45MfJ6t
         BYo9G6o6AWDbrjSaNJzCX0KnQmsugq2WToo5X5k3wP0lswmVwbGCjT/sPhkzc0uydTmW
         qdjcWR0JF2HOW1xv2gD9E2PkSIdUrr9CSDW6nQPqqKzqm2fdjin0jOIIxzgyDg5sPU9A
         UcDof+AGTj0quKbZldzk3NtdX3e0liEPogBDdVGSI9Tb5H65SIfxjAymuLwbDI/D0eHR
         W5OQ==
X-Forwarded-Encrypted: i=1; AJvYcCUsorzyxELh6IugeWifw/Z5YzjsqDip0bCtiz65bLMqnrIRunAy8/KFHelTlJJokyI28/ANsTpQ5rJd@lists.linux.dev
X-Gm-Message-State: AOJu0YzP6zkPxQSyJ1+K6rTQXiLfulW4GjkLXVLiaz8ImzFpF0AoAnD3
	I0vzdDleeoKKe6Fo0JoiU/9crDVuYYC7xqQ8NIifc1H/4x2PCHoptP+FQtFEfFRnIc4=
X-Gm-Gg: ATEYQzyj96TtYkkpDZnYzTwKOwVK/cZmPhHa/Giw40doUEabyTtmO+yfRximjXeVSfW
	wPxWC7u7KKWyxg+6og3udP5Z2jv/LqObSWZquiHpQwQJcntT4GDj9f31528giOA/Sn0u9AoB78X
	ERwRk1AKm5UweqJZL3juKCgZFlAYYo1zGxPJ/GJ4ZilNC4v/lrB4JwgUPLz2nULdMtqq5lf3hfj
	PiDc7D+QeAx9zUXSqOSmW0GZgZbt2iGYfGwBdjieW57hqj9fdlrYyAhkAyhJHzrBz35joC1jM5c
	Zgh4jdVhyqrXnGHRUTtOlwHRy+sxIRw7729hhiqTzT62xZz59jjxyqqirU2QALr7/FKM2fdXHAO
	yDeb1If+5Xtf3MYIUztr7RINlfQEZf3yWr/1Y1W8ez8fUueqQ19qGUFv22k77eXtuwI91wTrnAi
	9tMd8aiNCs8qdeOUFADLMXLYh7x3DZkXFLenPtYGaB1vUk6z28Og9w2ufS/5rbofRz7pF5h7PrW
	ndHm8Io
X-Received: by 2002:ad4:5dc2:0:b0:896:f8dc:f6d4 with SMTP id 6a1803df08f44-899d1d6ca54mr69417576d6.5.1772238489925;
        Fri, 27 Feb 2026 16:28:09 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-162-112-119.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.162.112.119])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-899c7376847sm55825926d6.28.2026.02.27.16.28.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 16:28:09 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1vw8Bk-00000001WwN-1wgX;
	Fri, 27 Feb 2026 20:28:08 -0400
Date: Fri, 27 Feb 2026 20:28:08 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: dan.j.williams@intel.com
Cc: Robin Murphy <robin.murphy@arm.com>, Alexey Kardashevskiy <aik@amd.com>,
	x86@kernel.org, linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	linux-pci@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Mike Rapoport <rppt@kernel.org>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Neeraj Upadhyay <Neeraj.Upadhyay@amd.com>,
	Ashish Kalra <ashish.kalra@amd.com>,
	Stefano Garzarella <sgarzare@redhat.com>,
	Melody Wang <huibo.wang@amd.com>,
	Seongman Lee <augustus92@kaist.ac.kr>,
	Joerg Roedel <joerg.roedel@amd.com>,
	Nikunj A Dadhania <nikunj@amd.com>,
	Michael Roth <michael.roth@amd.com>,
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
	Andi Kleen <ak@linux.intel.com>,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
	Tony Luck <tony.luck@intel.com>,
	David Woodhouse <dwmw@amazon.co.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Denis Efremov <efremov@linux.com>,
	Geliang Tang <geliang@kernel.org>,
	Piotr Gregor <piotrgregor@rsyncme.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Alex Williamson <alex@shazbot.org>, Arnd Bergmann <arnd@arndb.de>,
	Jesse Barnes <jbarnes@virtuousgeek.org>,
	Jacob Pan <jacob.jun.pan@linux.intel.com>,
	Yinghai Lu <yinghai@kernel.org>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	"Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
	Xu Yilun <yilun.xu@linux.intel.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Kim Phillips <kim.phillips@amd.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Claire Chang <tientzu@chromium.org>, linux-coco@lists.linux.dev,
	iommu@lists.linux.dev
Subject: Re: [PATCH kernel 4/9] dma/swiotlb: Stop forcing SWIOTLB for TDISP
 devices
Message-ID: <20260228002808.GO44359@ziepe.ca>
References: <20260225053806.3311234-1-aik@amd.com>
 <20260225053806.3311234-5-aik@amd.com>
 <699f238873ae7_1cc5100b6@dwillia2-mobl4.notmuch>
 <04b06a53-769c-44f1-a157-34591b9f8439@arm.com>
 <699f621daab02_2f4a1008f@dwillia2-mobl4.notmuch>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <699f621daab02_2f4a1008f@dwillia2-mobl4.notmuch>

On Wed, Feb 25, 2026 at 12:57:01PM -0800, dan.j.williams@intel.com wrote:
> > (since a device that's trusted to access private memory
> > isn't necessarily prohibited from still also accessing shared memory as
> > well), hmmm...
> 
> The specification allows it, but Linux DMA mapping core is not yet ready
> for it. So the expectation to start is that the device loses access to
> its original shared IOMMU mappings when converted to private operation.

Yes, the underlying translation changes, but no, it doesn't loose DMA
access to any shared pages, it just goes through the T=1 IOMMU now.

The T=1 IOMMU will still have them mapped on all three platforms
AFAIK. On TDX/CCA the CPU and IOMMU S2 tables are identical, so of
course the shared pages are mapped. On AMD there is only one IOMMU so
the page must also be mapped or non-TDISP is broken.

When this TDISP awareness is put in the DMA API it needs to be done in
a way that allows DMA_ATTR_CC_DECRYPTED to keep working for TDISP
devices.

This is important because we are expecting these sorts of things to
work as part of integrating non-TDISP RDMA devices into CC guests. We
can't loose access to the shared pages that are shared with the
non-TDISP devices...

> So on ARM where shared addresses are high, it is future work to figure
> out how an accepted device might also access shared mappings outside the
> device's dma_mask.

ARM has a "solution" right now. The location of the high bit is
controlled by the VMM and the VMM cannot create a CC VM where the IPA
space exceeds the dma_mask of any assigned device.

Thus the VMM must limit the total available DRAM to fit within the HW
restrictions.

Hopefully TDX can do the same.

Jason
