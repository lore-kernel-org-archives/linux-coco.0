Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F0651D86DC
	for <linux-coco@lists.linux.dev>; Fri, 27 Feb 2026 00:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772151669; cv=none; b=llUTYGfDSrVQ/mJX4psgl7f2xMTxKIwT34TV11UQ9P/rjY/pFHrjOdfYpB3VL+lqAZ4xev5oRDBFCbRHksgg5+AAIjkZcHiHZt/nYJUAwHq8CzPtam3W6n0FCDhidGKFRPQSDIKsgKm0D/PpCaqfS9qb6ktKYLvDxIl3PQP6ANU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772151669; c=relaxed/simple;
	bh=1H1E6m/3SBzjbZermb/QgS4pChpnCVDklOtdppC5Ybw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Muq4FgDWORP6iu4mWOj/FdzIyGwSYoEqXV92gX7Xc03AFPeJ5cpjiTDZ3Nr22ohW9IgR3vPq5Jc/J+6UPZXhtkX5n1PTAbtHaqpzPboVIJZsc3spJneIerT53Z0VHTASkj3YACrF9+OE4Syio2ZL/JlIEq9gMg3oWEhJS1gvVvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=MmDlufTW; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="MmDlufTW"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-5069df1de6fso12732451cf.3
        for <linux-coco@lists.linux.dev>; Thu, 26 Feb 2026 16:21:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1772151667; x=1772756467; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LZJ67b0vcINlAFMObCVMgz4IqYLAlWLPJaI4jITHQUI=;
        b=MmDlufTWi2F20ECvgWugI7kMiF1wNcaIKDvVb44MyEd5ErTm6Cy3YifXl8bMhERdaY
         85LQ3GcjZp8f06ZsG0wU5kaR+vOKVcMKfDu23C8RBpOBdSklqTxLi3TuERWnWlWC8EEK
         bbDdP5Y2DYo/g4nmQl0IoZlj28B7d/l7+6KOYPjE3ejXjkTKZsE/n2XdyM1YhNSpvwJ/
         vyjchWUR9sfVAWbyxnHBRijHjVLQ3ZPqo+rQ+UL2yqOuRoNGJwIUvsX9Nfs2qYWjfr1L
         Eb7giT8rzTjQ9TToKyqbnbR96kcEmLSZ9I0vxUpFOnqn3iIH4IWA3LeLwztgHrSZ76Fb
         HVbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772151667; x=1772756467;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LZJ67b0vcINlAFMObCVMgz4IqYLAlWLPJaI4jITHQUI=;
        b=oWIt/pFTDoKFCFYzPT1T9zPcR+L2/a+IBcubZF94fnAX4BZ3RqDbKX+wdg04QS+kwj
         72gIz9mWKhid5cHy11Al3saO3X/cY/ec+/JipqMEL9DX/YCkRpSgkFZt+4efYUapqXFW
         wj/aWV/BeLn/zPdVagbyc6xsxlh+cFQjsGCPqXWuHJdAB4RyytGKqvmrWSt1gYFVJXLi
         BFcnJ8vDB1FCK4hv2ueptOEkmyVCkKEDvxVy72zRMYnO8IkGJJxltn0E11ilCp7htdvt
         oDrwydrkCcsgGGHz3LwW8Li9/YUKajCVfWJZGmZ/7Jrjf98moXa7bZKhiMckrk+owzl7
         aM3Q==
X-Forwarded-Encrypted: i=1; AJvYcCWuJYB7HG51OKWZ1V0ayR0j2coepvvD4L8fLqEXAqF1czpgJxAwMHQWp9ovmumppDUttYiNYSH11+it@lists.linux.dev
X-Gm-Message-State: AOJu0YyA198+xZ9zv9BascZ2GEUPhwiZchrGZMUVnMMTR6EvxBSBT8C1
	lR2febhFU2VO5R0R+BNYqXz5jObW1cgHKRcmgIc1dI5NiSNJhqAvZlOxEYqVM4HSZys=
X-Gm-Gg: ATEYQzzuiSsNHd0yPCT7kgWBN19tBtmwJUt9Tr6Y3bpiuwfQm/tlnWQgAJ7nPbwkUw8
	lGP6gkPnmh3mAJR+T4jRdbdUSPCqBExxZVtR3xwdpgncnfaZxqMRaOYn0VhrCKQpALUakmfFHNK
	0C8w98SOevD30tNLaNEfbFv6oZdXzIKyqTCL5BeLj/cAw045kT13PR9S8MQWuF6AV1UJyI2gFAo
	+YNR4A89Dp4+SkQBZnAk3dtmXn0bCEN24awWUPH9G068upqZgPWFlm3QFvCA3tnbVqHzsee6MWY
	+JGDu7wsCv3Jqv2tMzKZ1sowzTUlNRX/9F0rPzf0CPvWFHaRrGTCsshL8JRmEowGNQ244G0Oxhe
	0+m3FKiTyDTPnDzRyRmSFkDmwk6Ge4OkQ1UoEnhRkXE0Un2/hxQA+GJjaThjPg/stU8tYf2XbWs
	qQnWneiwJAk9UeazOjME6b24CW10NDC1OwznS84hPBG6PyM4jKkJvBPHW70xR4qBySEfnT0BF0l
	ksL7Cr3
X-Received: by 2002:a05:622a:3cb:b0:502:f07e:8569 with SMTP id d75a77b69052e-5075282779dmr12593871cf.35.1772151667151;
        Thu, 26 Feb 2026 16:21:07 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-162-112-119.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.162.112.119])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50744963095sm36791911cf.3.2026.02.26.16.21.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 16:21:06 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1vvlbN-00000000pwc-2290;
	Thu, 26 Feb 2026 20:21:05 -0400
Date: Thu, 26 Feb 2026 20:21:05 -0400
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
Message-ID: <20260227002105.GC44359@ziepe.ca>
References: <20260225075211.3353194-1-aik@amd.com>
 <aZ7-tTpobKiCFT5L@google.com>
 <CAEvNRgEiod74cRoVQVC5LUbWDZf6Wwz1ssjQN0fveN=RBAjsTw@mail.gmail.com>
 <20260226190757.GA44359@ziepe.ca>
 <aaDL8tYrVCWlQg79@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aaDL8tYrVCWlQg79@google.com>

On Thu, Feb 26, 2026 at 02:40:50PM -0800, Sean Christopherson wrote:

> > If guestmemfd is fully pinned and cannot free memory outside of
> > truncate that may be good enough (though somehow I think that is not
> > the case)
> 
> With in-place conversion, PUNCH_HOLE and private=>shared conversions are the only
> two ways to partial "remove" memory from guest_memfd, so it may really be that
> simple.

PUNCH_HOLE can be treated like truncate right?

I'm confused though - I thought in-place conversion ment that
private<->shared re-used the existing memory allocation? Why does it
"remove" memory?

Or perhaps more broadly, where is the shared memory kept/accessed in
these guest memfd systems?

Jason
