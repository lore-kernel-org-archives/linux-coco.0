Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 842FA44CAF2
	for <linux-coco@lists.linux.dev>; Thu, 26 Feb 2026 19:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772134028; cv=none; b=h4ou4Mf+c5MTJ5i4tNmVTyRcmFM+ZZukX7k9ma/DcAWCnvb6Fart49qNJdl9ANmuBdMxngzQfnjZel8yrfhwfuhtRS9nZ0QtNegQ1u8uYUhC1pE1Z+x7aK/qOnR0ZoCLSdAFU14bGO+5CiRGlFyGrk0kZjhlbChqoiZXYCssVNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772134028; c=relaxed/simple;
	bh=pTOdXcn8havDpB/nGx2tDUoWLjBch4ocjJIaSDJa3XQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fVLM9wa5vDC+w3wPL6uTFk57Vuay7zdQ8+3txtd/BPfyFHPG9wEx2KOIKHFzCH/Yn3TErJ8z2d73LWZCDo5Sbgs60HkjgNhTsoKD7o9FWpelch+o+b9vQd2MqQlQDblImMdB94zywv18a5xa0ZNrHBbql90Z2gmo/a+o7nurNHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=D5y6HnJf; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="D5y6HnJf"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-506a747448dso10595351cf.0
        for <linux-coco@lists.linux.dev>; Thu, 26 Feb 2026 11:27:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1772134022; x=1772738822; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ihQ/rPzUFVaXq5y8xpMnCIhxlDxECF6mdQTm7Xamdb4=;
        b=D5y6HnJfst8IsN2I1aXn7hvLi1N7+AwQDcrTqg8aZ+Xc+JIwx4WUx6qi+fR7es+4OZ
         qS80llV9bT8O8/nt0KklPv4lz3u40Zx4bCjqEu0Wip6x3Hgw6xbj8OwfVqSJn5VKhwGB
         vXzz5Gefe+ueOVyaFWHeKH4xSZL4UAq2sUfkR7GAN2SVio/DnX1wc4WH3av0qKV4vP1b
         4/qldA9p8jlp3WAcOpj9UB4hyw3bP3+/UL6SemWQpoCEtc2Sc+p23kj19iCSGN5T9v9p
         vLb4cOINgq++C9MKjM/XUX9KsEvdS0HSs8eZveEHXx8H7J8Qs31zm+lIa4ttEvuac7GQ
         8oEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772134022; x=1772738822;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ihQ/rPzUFVaXq5y8xpMnCIhxlDxECF6mdQTm7Xamdb4=;
        b=NvYpau+xghEk8/YdnPUDg71//RhmDISAE4+yQNTmLygYPNQZHl8vHo7SLOhmTBefro
         eQjNfG9IgfsTuLVIqbB9X99cCYe4IRSSjUxFb02Atg8Xa1lrnHRdrgJd7Kx2HUr82I0s
         Qz0SVCfMbeXvtPaU6yU0d5toDlx54uB4e8HrA0Y/GUTXvjL08/ZbHwrrmq1Z1ovTwdX2
         bVis9MTsNGioo6ttqEreNLj7nGFFEaVTEdVAbMkRNrwWA4yhmhvRQLK6UOgkC966kfx3
         P3etxYXC5cLyb52nNZcejHes+q0XBEJoQ6OhY8bFZYO7f2Nv1J5pViv9bXqaTpiPu/gU
         i3Nw==
X-Forwarded-Encrypted: i=1; AJvYcCUb67tgP2q9xsVIGhdEVFyU09E12Z/i5k9NNeKrOTPBNfDHfnSdXoXCKLy3FxqgBudGaKVcnZ92XWrO@lists.linux.dev
X-Gm-Message-State: AOJu0YwKOoqDFsGm+QIGzUXbtzHdHZ3MmCmXcCba7ZkGIfXPS+BCbMZP
	11yeIk4EXYTHZIg73Qba02bgpX/514nQ01v18TH96nxLK6PoeS3Yvxwwt/xiy886vzE=
X-Gm-Gg: ATEYQzzvxxCUJ6Aply/2oJlnDHbfeLwJx0JCDT1ZYSVsLEfPGKyByD3NnRbLiotix6J
	/h+QlyrNBBGMgsRi21WjN8kpWZ3eQxBA4xcE/xlp+72fQO/8BhhrPV/amrikYQxSqQVyXpxp9Z0
	ZfLee1X8n37mUFf83HwwUwep9G1wuX1/WsRewselvg2Z5JYYzB405GTMR/UomGeIQsSddfq4ChF
	rgIXLeeVbbVzlym5Arc5KkdLuCrwItsVGWd/+1dgkdLYESb5BqqkSypurwSruv38+A8iMz4XvEI
	b0mfU1YO5WVdX4ecr3j6kxu5zUjzraljlf0qUvFRNwKRky//C2iV1wVd9U3uxt3FL6cs11slBfp
	1+PGwzZWXVF7wvRxTDwtYloKX2E7v0PVFC2ZY+vMWCOy97VxMxwfaRLDlJOcwxjragbR40GyuaS
	lFD48tdIbvKZj8xGrLH/vYH1/hOh5GhWgiAFE395o1gQwpt7hZTJIoY804I0Am31R0+RyM7hXBQ
	mzbdXeB
X-Received: by 2002:ac8:7d90:0:b0:501:17a1:4ccf with SMTP id d75a77b69052e-50752714463mr1505241cf.3.1772134022105;
        Thu, 26 Feb 2026 11:27:02 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-162-112-119.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.162.112.119])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-899c73a25e4sm23606076d6.50.2026.02.26.11.27.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 11:27:01 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1vvh0m-00000000ODe-3htA;
	Thu, 26 Feb 2026 15:27:00 -0400
Date: Thu, 26 Feb 2026 15:27:00 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Alexey Kardashevskiy <aik@amd.com>
Cc: Sean Christopherson <seanjc@google.com>, linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org, Kevin Tian <kevin.tian@intel.com>,
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Steve Sistare <steven.sistare@oracle.com>,
	Nicolin Chen <nicolinc@nvidia.com>, iommu@lists.linux.dev,
	linux-coco@lists.linux.dev, Dan Williams <dan.j.williams@intel.com>,
	Santosh Shukla <santosh.shukla@amd.com>,
	"Pratik R . Sampat" <prsampat@amd.com>,
	Ackerley Tng <ackerleytng@google.com>,
	Fuad Tabba <tabba@google.com>, Xu Yilun <yilun.xu@linux.intel.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>
Subject: Re: [RFC PATCH kernel] iommufd: Allow mapping from KVM's guest_memfd
Message-ID: <20260226192700.GB44359@ziepe.ca>
References: <20260225075211.3353194-1-aik@amd.com>
 <aZ7-tTpobKiCFT5L@google.com>
 <fb10affb-40d5-4558-b64b-0ab22659ccf2@amd.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fb10affb-40d5-4558-b64b-0ab22659ccf2@amd.com>

On Thu, Feb 26, 2026 at 05:47:50PM +1100, Alexey Kardashevskiy wrote:
> 
> 
> On 26/2/26 00:55, Sean Christopherson wrote:
> > On Wed, Feb 25, 2026, Alexey Kardashevskiy wrote:
> > > For the new guest_memfd type, no additional reference is taken as
> > > pinning is guaranteed by the KVM guest_memfd library.
> > > 
> > > There is no KVM-GMEMFD->IOMMUFD direct notification mechanism as
> > > the assumption is that:
> > > 1) page stage change events will be handled by VMM which is going
> > > to call IOMMUFD to remap pages;
> > > 2) shrinking GMEMFD equals to VM memory unplug and VMM is going to
> > > handle it.
> > 
> > The VMM is outside of the kernel's effective TCB.  Assuming the VMM will always
> > do the right thing is a non-starter.
> 
> Right.
> 
> But, say, for 1), VMM does not the right thing and skips on PSC -
> the AMD host will observe IOMMU fault events - noisy but harmless. I
> wonder if it is different for others though.

ARM is also supposed to be safe as GPT faults are contained, IIRC.

However, it is not like AMD in many important ways here. Critically ARM
has a split guest physical space where the low addresses are all
private and the upper addresses are all shared.

Thus on Linux the iommu should be programed with the shared pages
mapped into the shared address range. It would be wasteful to program
it with large amounts of IOPTEs that are already know to be private.

I think if you are fully doing in-place conversion then you could
program the entire shared address range to point to the memory pool
(eg with 1G huge pages) and rely entirely on the GPT to arbitrate
access. I don't think that is implemented in Linux though?

While on AMD, IIRC, the iommu should be programed with both the shared
and private pages in the respective GPA locations, but due to the RMP
matching insanity you have to keep restructuring the IOPTEs to exactly
match the RMP layout.

I have no idea what Intel needs.

Jason
