Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17C8B3B232A
	for <linux-coco@lists.linux.dev>; Sat, 28 Feb 2026 18:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772303348; cv=none; b=G3e9HiPSeEZ+ZLIS1QtaGXq/jm8oZR8w801qqjvtxAsSuRSBd+tXyQKFpRjtodILTpxHcb4HU5wxR7OYeg/W6fso8RdAnGxh0opgDYdemOimHLTNWRKDNbCVDMiwlUaxxXZtidE/0ATC40n2VVVsX8IXhyUZd9s9+5C1fEi/r+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772303348; c=relaxed/simple;
	bh=rkzmltbCB7oYdQAHuLM1PEc4LQu8jhDMt38DwB5M/W8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rgu+z5OMp8WSQC387CfYbrwyJ3uLXoYkWY6watTJiLF++8oVxn9oaReDD2U2i5H4XloZG7IkwK6/bVo9lPS5MpORVIoHASYixGa1sgPZRHN4VqiRxo1xo42IgOPiol946eV2SVP5fOtVlxk85U3aTXPzfRDrYW9uDXIvD1g4zkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=WVPUnm+m; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="WVPUnm+m"
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-896f9397ecdso37663866d6.3
        for <linux-coco@lists.linux.dev>; Sat, 28 Feb 2026 10:29:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1772303346; x=1772908146; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=htHav7RfCL20FBhzRA0W1wS3HhKQenwSmiA0/DmxMnY=;
        b=WVPUnm+m1agX39uFZ6UZe4/7wZmebjJKqZt4htUqKvmu7D3/nNQlTVblpskiZ/4e/Y
         6a7PaukP5+SdbxLKWedUbk73V9nur7HOz/fg1prm51Oj5DGZzv2WMpAogwN3SXWK3esN
         EfGFzZKVdTYQfLVh6/RjA0W/GC+0shU169goTvOhcHa4SNGA01k4so9vKijP0Bc41b0i
         gWaCXSllThg0yixgbzmlEuEAGjdEhxzkyzA62titoOlZxm1FdyjD/5O64Geo4vy04EJX
         9tB5Fs5bPzZp29o6JxpSWC/2Bc2BpoDN9qmgM1pVuFyLiJHInqU7XSAcdMTYX7cVRyxn
         hAOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772303346; x=1772908146;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=htHav7RfCL20FBhzRA0W1wS3HhKQenwSmiA0/DmxMnY=;
        b=giFIH/5GE4AUfDJqAHUiXCAvVm37rYs0ILc0+/X4bvMrDWcFrpTERDRCeZLgfboMVC
         givSI9iGgj2duL34euCbV+F/czIZOfM/rpHMr8buxOdedzTH505OVcODAnmxcqfM12B8
         xGXB4grKNIf6WUQfEYMjCOfdHlzOMxMol5q/lLxMqsdz+Hibr8nh1UV7It79NgBfrvD6
         rXBHzVYIBwiLT+TDDqypyEYcg+At6FwFy8ipZhWxL0sGB2BmDyyk2DhUTfEhgAv9pIVJ
         tBV8LD6XfUDoxjEAO/OxidpVOCI6qRrFtdzjVeb543N/I64k4EJenj2T1Y8lZgGCeLFL
         4Y4g==
X-Forwarded-Encrypted: i=1; AJvYcCXhbl/KkvyDuH9AzzfU+WN7VJ7xQnZlvp4gJ/JWTpE9trRG2ZgC0vKAodXjkGTPkNkHgO9AQFXErnS9@lists.linux.dev
X-Gm-Message-State: AOJu0Yz3OCv8iHNZnN01xPIHNWYIx8EYyXELdYlGp8Oyu8JX2FlzjJtK
	5vLfo+mccvcnHHRae7PcEmIwU6YeKv1h1OukG1fjsp6GWG8PJjVenwSdMhqjiqiaKEY=
X-Gm-Gg: ATEYQzyAI/Uu+GPrIhkcqJn3/ehKZ1diObu9Mhf+EQchEwa8vrh01eqVSQ63HvdL8Qp
	zt+FdxTy2B0hj8rVV/yg0aJjbNcsAl6NbLsWZfpnDhswtxYh8AOnCwRlxkaj3K0vy1QN7XpzLDR
	tYflYR1bEVeTxSNyoapi/Cyh+QIa3pRooATdA4FHCDBJTB11oWJreBCsdUzKj048EZq2i7pEcv1
	+Vb7H2XZksu7WBHlI0r10rMCM3vOVFL9/FLqi/oh1SEDPNZG/wlvBEppI9cPJBl1kZGNW8yDpjm
	5oEkYxi6ekYVobTX93XZzkUXXqUAFujgBt7qRZCq7/dz2RDXETtKZ7MEGFf+CLl6hwM7OcPhAS/
	XFqyz5EpXQ+cJFy8WWUr/Udqt7F7cJR4gj9FvaoQbRoOUtXcP/jrO2VThF8FAxRY9GVVZOTG/06
	QRKBbCJzn6b/4X8wvkL4EtrJGgx9/ri8HaDT8r2mQQhOCV2OcVtLvq/9agO4iH9y38fQHPzUOhM
	Pca0Wrv
X-Received: by 2002:a05:6214:1943:b0:896:fe42:e8a0 with SMTP id 6a1803df08f44-899d1e8b1camr101368936d6.63.1772303346029;
        Sat, 28 Feb 2026 10:29:06 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-162-112-119.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.162.112.119])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-899c7376847sm71654726d6.28.2026.02.28.10.29.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Feb 2026 10:29:05 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1vwP3o-0000000250x-2vIE;
	Sat, 28 Feb 2026 14:29:04 -0400
Date: Sat, 28 Feb 2026 14:29:04 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Xu Yilun <yilun.xu@linux.intel.com>
Cc: Sean Christopherson <seanjc@google.com>,
	Ackerley Tng <ackerleytng@google.com>,
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
	Fuad Tabba <tabba@google.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	michael.roth@amd.com, vannapurve@google.com
Subject: Re: [RFC PATCH kernel] iommufd: Allow mapping from KVM's guest_memfd
Message-ID: <20260228182904.GR44359@ziepe.ca>
References: <aZ7-tTpobKiCFT5L@google.com>
 <CAEvNRgEiod74cRoVQVC5LUbWDZf6Wwz1ssjQN0fveN=RBAjsTw@mail.gmail.com>
 <20260226190757.GA44359@ziepe.ca>
 <aaDL8tYrVCWlQg79@google.com>
 <20260227002105.GC44359@ziepe.ca>
 <aaDlRdnhIqRXEbPZ@google.com>
 <20260227010902.GE44359@ziepe.ca>
 <aaFzgGTpZI0eZWdD@yilunxu-OptiPlex-7050>
 <20260227131815.GG44359@ziepe.ca>
 <aaJroUzTZXZfbRAl@yilunxu-OptiPlex-7050>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aaJroUzTZXZfbRAl@yilunxu-OptiPlex-7050>

On Sat, Feb 28, 2026 at 12:14:25PM +0800, Xu Yilun wrote:
> On Fri, Feb 27, 2026 at 09:18:15AM -0400, Jason Gunthorpe wrote:
> > On Fri, Feb 27, 2026 at 06:35:44PM +0800, Xu Yilun wrote:
> > 
> > > Will cause host machine check and host restart, same as host CPU
> > > accessing encrypted memory. Intel TDX has no lower level privilege
> > > protection table so the wrong accessing will actually impact the
> > > memory encryption engine.
> > 
> > Blah, of course it does.
> > 
> > So Intel needs a two step synchronization to wipe the IOPTEs before
> > any shared private conversions and restore the right ones after.
> 
> Mainly about shared IOPTE (for both T=0 table & T=1 table): "unmap
> before conversion to private" & "map after conversion to shared"
> 
> I see there are already some consideration in QEMU to support in-place
> conversion + shared passthrough [*], using uptr, but seems that's
> exactly what you are objecting to

There is some ugly stuff in qemu trying to make this work with VFIO..

> Further more, I think "unmap shared IOPTE before conversion to private"
> may be the only concern to ensure kernel safety, other steps could be
> fully left to userspace. Hope the downgrading from "remap" to
> "invalidate" simplifies the notification.

Maybe, but there is still the large issue of how to deal with
fragmenting the mapping and breaking/re-consolidating huge pages,
which is not trivial..

To really make this work well we may need iommufd to actively mirror
the guestmemfd into IOPTEs and dynamically track changes.

I will think about it..

Jason
