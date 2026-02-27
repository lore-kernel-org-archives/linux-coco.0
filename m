Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C444261B8D
	for <linux-coco@lists.linux.dev>; Fri, 27 Feb 2026 01:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772154545; cv=none; b=K4+XIEAUuAZARsMg24jM02oK6m5DcdYyjB3dABLHhEIJUfN/SE7Y5fv2Uw1lufTbKU7gx4gvMWEZ1519EhLonT/fa8SCabCw9PVCTRW5jq0Tlfg6K2xLDSfopj0N1OtqeHu01D5c+z8/pmgzS8zwfDDH1Q9gyEsSXC9+Z/r5q/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772154545; c=relaxed/simple;
	bh=Vsm+/jCgY2aB74QyLRYBdy8B+Rgt8iW3O8facH4/8UY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WOKwo0p7BN+wB8YDxkAgM78liJ0MaEeyzIJ/rdd53h642eoSlHKCpwI14d/a07TiEXb2qL4tL2f7odZkDSHlbNhg0l5WH/O19y1QlRtSfaxgmT1AQ9MEUe3wiC3F1gCVNfWWHUfaZEr7//cz7Q6EIWQdQZcDHT+BNEVgJ81OdaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=FD4bx4lN; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="FD4bx4lN"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-505e2e4c35fso16737741cf.3
        for <linux-coco@lists.linux.dev>; Thu, 26 Feb 2026 17:09:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1772154543; x=1772759343; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fIbZ6hyyMHAKB2BJD8/8kNRLCv959jzKvxcpPvl74ls=;
        b=FD4bx4lNbiqBfnrZy67MErETlt4Ooky2fRjy22qpX0HRrvY+YUbE2T9TjlEdocTjS8
         FW+d3E2MZ+RbLV/YGXahlLq76Zn/wvg+M9NkFcfM8xp1LCeEpj9S+zc0Pam5EezDqzzW
         xgXpSn4uLBR9n6Y+fl2RdJPEt0U1HIGUdy0P6LrEjX7HEr9IAz4CLFZcyMhg1RdaofqM
         0icaa1WaWIRMmh4GgdKUfPALUY8LJ9DRMiB3aVvMzWUQR2S7rpvTLyGYF5p6ouocSs8V
         AlqU0nzWxDl5PvkabvmE10FxThU2QFLXSrOup3GbC4bxL5AbOFdh4NuO4rP5B+Un3iy4
         GSIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772154543; x=1772759343;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fIbZ6hyyMHAKB2BJD8/8kNRLCv959jzKvxcpPvl74ls=;
        b=va8JnRgoxNumooccletYmTBdCMylGlV43y86NDoJuO72zDWFqbbehTjZHOr7qJk8vg
         YVqiZ0uTH6aW53/PrL/YepHtwSvvnY7q+hydOGpICfIByuSY+JndEayw5TUUraEg797s
         DphA0dVX5yNmxK+bO7WyhkmIK2FSdnNZig5EpnNu4DHBKzCMSDGV1w9rzmSj4b/gHX4S
         24jRu8ZAMuW+epNDku2nkBJn3al3DBor3iEg7+GUcRBQ2hceS3xszvuVOzaBb7NGANLy
         SM9GnsQ0PfzE5NYLifJLIrDNf8ueBtSxL3HfmGI7CMrDkE7sxaOYusf9GBDzzSaeVK/d
         bdlA==
X-Forwarded-Encrypted: i=1; AJvYcCUuN/YylCZzvA8DC6HdoTU/ODQQJcET3PDAI4sdw9AVPtFZOemvikXA8bBbX7k2havHgxfkKK+rJe6I@lists.linux.dev
X-Gm-Message-State: AOJu0YwT9WZO3KAdfTNpq4tNfciig6VMHJhGeulKI9+TRcaT5e+gUY/4
	skGSKIGzEKz4nGlSJ5nSoaXP45Edenbb5RXqPaGlQnd/BGU/MLEDUyvTPH4HgJZpY8s=
X-Gm-Gg: ATEYQzy/q03hByQ95GnlQ7KF8b4f9Wl0TNIQsXJxDf3ZAMqVHgKyqBzxwAkhxkp9VeB
	lZPnyIqETyici097ws8XH4Hwy/pKdc+BkHUPDXAoafuykeRIcDE+/7NpKojFZeu10Kw9JnUC46a
	S8pLgGC0jaHaYH2yZYeXQImDcotKE2tzlPVKqmhouDFXeEhVPFfUKYz8pTVd6aVxUoWtqmQ3OBK
	EDXHFHwjE1SS9H2hQpJvkuZFCr6ZK09jvhK3NA2GUdr/bbHV739DEYBYfDEE6e3RcBy7BJZZEEM
	QPce8GESge2YGmhcNj+j05CeuH9kEr6hZsTGgy/OcxZwSFjMppRWPvDB43dZb8DfkuL3P5Yo0zI
	Qms6IwGF/NZTOwUGV3R5MVMPMQMCdyd4E2CXBjGDhzhbFAQB7T2wHadYXb0Srw0LZF50IIz0RJm
	o2yiqlfV4U7BxM3ABIk9NoSJY+VT9AWZsfj5IwQT+hKcDF4G3v3JbgJyiOaz0w2SMO5LmsdPNcB
	2QGoF1AyxtI2HGdcdQ=
X-Received: by 2002:a05:622a:1907:b0:506:bde3:1dea with SMTP id d75a77b69052e-5075299954emr12486431cf.36.1772154543378;
        Thu, 26 Feb 2026 17:09:03 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-162-112-119.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.162.112.119])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-899c716ccf5sm39101476d6.17.2026.02.26.17.09.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 17:09:02 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1vvmLm-00000000sEc-0kRO;
	Thu, 26 Feb 2026 21:09:02 -0400
Date: Thu, 26 Feb 2026 21:09:02 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Sean Christopherson <seanjc@google.com>
Cc: Ackerley Tng <ackerleytng@google.com>,
	Alexey Kardashevskiy <aik@amd.com>, linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org, Kevin Tian <kevin.tian@intel.com>,
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Steve Sistare <steven.sistare@oracle.com>,
	Nicolin Chen <nicolinc@nvidia.com>, iommu@lists.linux.dev,
	linux-coco@lists.linux.dev, Dan Williams <dan.j.williams@intel.com>,
	Santosh Shukla <santosh.shukla@amd.com>,
	"Pratik R . Sampat" <prsampat@amd.com>,
	Fuad Tabba <tabba@google.com>, Xu Yilun <yilun.xu@linux.intel.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	michael.roth@amd.com, vannapurve@google.com
Subject: Re: [RFC PATCH kernel] iommufd: Allow mapping from KVM's guest_memfd
Message-ID: <20260227010902.GE44359@ziepe.ca>
References: <20260225075211.3353194-1-aik@amd.com>
 <aZ7-tTpobKiCFT5L@google.com>
 <CAEvNRgEiod74cRoVQVC5LUbWDZf6Wwz1ssjQN0fveN=RBAjsTw@mail.gmail.com>
 <20260226190757.GA44359@ziepe.ca>
 <aaDL8tYrVCWlQg79@google.com>
 <20260227002105.GC44359@ziepe.ca>
 <aaDlRdnhIqRXEbPZ@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aaDlRdnhIqRXEbPZ@google.com>

On Thu, Feb 26, 2026 at 04:28:53PM -0800, Sean Christopherson wrote:
> > I'm confused though - I thought in-place conversion ment that
> > private<->shared re-used the existing memory allocation? Why does it
> > "remove" memory?
> > 
> > Or perhaps more broadly, where is the shared memory kept/accessed in
> > these guest memfd systems?
> 
> Oh, the physical memory doesn't change, but the IOMMU might care that memory is
> being converted from private<=>shared.  AMD IOMMU probably doesn't?  But unless
> Intel IOMMU reuses S-EPT from the VM itself, the IOMMU page tables will need to
> be updated.

Okay, so then it is probably OK for AMD and ARM to just let
shared/private happen and whatever userspace does or doesn't do is not
important. The IOPTE will point at guaranteed allocated memory and any
faults caused by imporerly putting private in a shared slot will be
contained.

I have no idea what happens to Intel if the shared IOMMU points to a
private page? The machine catches fire and daemons spawn from a
fissure?

Or maybe we are lucky and it generates a nice contained fault like the
other two so we don't need to build something elaborate and special to
make up for horrible hardware? Pretty please?

Jason
