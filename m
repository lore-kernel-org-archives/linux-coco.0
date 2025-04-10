Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A396520C49F
	for <linux-coco@lists.linux.dev>; Thu, 10 Apr 2025 23:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744328701; cv=none; b=mOTzA4iK4jgZDx1IFZyh4KK6x426qrR+TtzUaDurGREDif+3g/WOO9euNBFBAXwAPJyDxHmE3GFS7K3oP1gi4r3MIKaC3986lu8q4V3vrtzLnY5PB4pIazugKL9si6tVYrvnaqZIZy1EgrfxKEnBq2BLLfIm8MqpgnM3EIXR11E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744328701; c=relaxed/simple;
	bh=mghY2rYVvlPDE9Jsz5ZnOqrYyA6SfVM8M7wxlDc8iBQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rJ3cinDXRVq/bGHMYiFpTZJyhjIi/84twWELoyVJL1svQMOuyDCny8EJj3KvIoY2FaeXACLIbZJkwiI3RBD+x6Y141keHRltCYsjBDOaZ22iQcSJ6vFlleQDmt5nWhYXIBSXAkCc8hBnQ+9qhTx/8lfv3gIQ2JGy98rFsKzB/+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=AZvJsv4b; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="AZvJsv4b"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-7c55b53a459so157794685a.3
        for <linux-coco@lists.linux.dev>; Thu, 10 Apr 2025 16:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1744328698; x=1744933498; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uBiekUdIFmCYXVIVV+7WWzU3nvigAruofoH1gZDVt3E=;
        b=AZvJsv4b5de+PJ/7FLn3dX7MrKFDYjtzDqg04KXlGL+uOwj3f7JRG4+2iIXDSCIaKa
         sycbW4BTZEEWF61wVYKq07KlAa6loCE410+MYgTGFaD2G7KtwUYtp3EWKd7unNG69+8G
         KFsqOMD73HB34RLFopM/TO6coJHBJWSneUIo1BLSz7Gy0vGeXZEWh04Xq0xITNfOo6Ac
         wQyaLwSh59iOWRhISDQkq++nnJawVGUEm0YBc3wgG5FtW7wuvDmI8MpGUxtaynX1/BWF
         4jU+u0t4y0mLU1wMnJluAWKEYBsppbR+zgurR4rkYsjH3gtG99HNG7H1FwPmplQ+FmKV
         JFkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744328698; x=1744933498;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uBiekUdIFmCYXVIVV+7WWzU3nvigAruofoH1gZDVt3E=;
        b=jj/FjByK4dd2qExgpJC0/cwXj/XLMWFK1U9xpJR0jovyeQqYuQuIqNMKYoRWa3am5+
         k/mY9KVQB9K/AAXvLX6S9ssOVLMbLe7H7B0tVUsftp96xhOR5Qnm+x8Am+/CFk3kl+fp
         bcxYFolRRg3lvsz++C70OZAe0CYlnjP1ZYKNJLesympGJhU2dtlZ5OBTp8l3tKDE5TV8
         5c3AxyjDUIYxmPPbRlKhG/YMBCCG8CTeGKjuX/BZhGH8RPJObSRuc0dPtGRXS/IqhLX5
         AvA2Zq/3NPPlzTHoyFNRMAcN2P740nZAEBajA1w1OgEUPUQBqH/EU/D5x3He2O36gxD6
         5jTg==
X-Forwarded-Encrypted: i=1; AJvYcCW+QXm4gMwd2GyInd1X6e1kPjgj6Bq/7OzipBeUF93VG5lfqAB5j0GlCPrxNhegUciayYu2tBFWDWZm@lists.linux.dev
X-Gm-Message-State: AOJu0YyPRjNYqm3/si0yeL3K834daDDKm9qTR6gjngGf2JKCUEKABZo9
	g0iNzFKBXBnLt9h/tmc83L4Z0L3Td/lUMiSEq4KYUkDk/OIbaWwEXkJ+3oNinwU=
X-Gm-Gg: ASbGncuQnD8o6dO11cwlOZgHHP7GMmBRzZkfmamw1Tc93/Kwk1sL/rAN9gFNLRpEZnk
	YZWrWxofoKW6/VQGSpbS4XYr46qwVHLoIrTTCUbhGmCt+B40z7NRuxqQyrhC//LxmKt3d/vPpS9
	cJBte24ot6jdd6bjY5NjDrePWGZ3MeL/mOkXPm/KDSu3uuz26+knOkUAxsFiRN7MYmfV7ugJiC3
	BR/y+iX/suDo/h36g8x3oJ8zlkzyx3/qa1nArEFZ9Xoi3Ga2pgt5/mTGVWxuDKWLBsGw1VZ9641
	pw5Pi1JKPlBJcTDEkatuIQ1GJCGfb8QMnXFVl0CxvsWhc9kEOgc2uTY3ztmdz4wrmW9uD1mWpMm
	+kiEeCXL/4icm355XRYI=
X-Google-Smtp-Source: AGHT+IH4fTle0lZ5BXeT1W/Tk1EOzJKOHLxPsiVRzXbPb/Lh5qnqWIfCqkylbYRbJ/h5OGn56sXdfg==
X-Received: by 2002:a05:620a:4141:b0:7c5:b0b4:2cea with SMTP id af79cd13be357-7c7af1137f6mr129267485a.38.1744328698540;
        Thu, 10 Apr 2025 16:44:58 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-219-86.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.219.86])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c7a8969f1asm169263385a.59.2025.04.10.16.44.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 16:44:57 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1u31Zp-00000000N4j-0j3F;
	Thu, 10 Apr 2025 20:44:57 -0300
Date: Thu, 10 Apr 2025 20:44:57 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christoph Hellwig <hch@lst.de>
Cc: Dan Williams <dan.j.williams@intel.com>,
	Roman Kisel <romank@linux.microsoft.com>,
	Robin Murphy <robin.murphy@arm.com>, aleksander.lobakin@intel.com,
	andriy.shevchenko@linux.intel.com, arnd@arndb.de, bp@alien8.de,
	catalin.marinas@arm.com, corbet@lwn.net, dakr@kernel.org,
	dave.hansen@linux.intel.com, decui@microsoft.com,
	gregkh@linuxfoundation.org, haiyangz@microsoft.com, hpa@zytor.com,
	James.Bottomley@hansenpartnership.com, Jonathan.Cameron@huawei.com,
	kys@microsoft.com, leon@kernel.org, lukas@wunner.de,
	luto@kernel.org, m.szyprowski@samsung.com,
	martin.petersen@oracle.com, mingo@redhat.com, peterz@infradead.org,
	quic_zijuhu@quicinc.com, tglx@linutronix.de, wei.liu@kernel.org,
	will@kernel.org, iommu@lists.linux.dev, linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	linux-hyperv@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-scsi@vger.kernel.org, x86@kernel.org, apais@microsoft.com,
	benhill@microsoft.com, bperkins@microsoft.com,
	sunilmut@microsoft.com, Suzuki K Poulose <suzuki.poulose@arm.com>,
	linux-coco@lists.linux.dev
Subject: Re: [PATCH hyperv-next 5/6] arch, drivers: Add device struct
 bitfield to not bounce-buffer
Message-ID: <20250410234457.GB63245@ziepe.ca>
References: <20250409000835.285105-1-romank@linux.microsoft.com>
 <20250409000835.285105-6-romank@linux.microsoft.com>
 <0eb87302-fae8-4708-aaf8-d16e836e727f@arm.com>
 <0ab2849a-5c03-4a8c-891e-3cb89b20b0e4@linux.microsoft.com>
 <67f703099f124_71fe2949e@dwillia2-xfh.jf.intel.com.notmuch>
 <20250410072354.GB32563@lst.de>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250410072354.GB32563@lst.de>

On Thu, Apr 10, 2025 at 09:23:54AM +0200, Christoph Hellwig wrote:
> On Wed, Apr 09, 2025 at 04:30:17PM -0700, Dan Williams wrote:
> > > Thanks, I should've highlighted that facet most certainly!
> > 
> > One would hope that no one is building a modern device with trusted I/O
> > capability, *and* with a swiotlb addressing dependency. However, I agree
> > that a non-shared swiotlb would be needed in such a scenario.
> 
> Hope is never a good idea when dealing with hardware :(  PCIe already
> requires no addressing limitations, and programming interface specs
> like NVMe double down on that.  But at least one big hyperscaler still
> managed to build such a device.
> 
> Also even if the periphal device is not addressing limited, the root
> port or interconnect might still be, we've seen quite a lot of that.

Still it would be very obnoxious for someone to build a CC VM platform
where CC DMA devices can't access all the guest physical memory in the
CC address map :\

Keeping in mind that that the CC address map is being created by using
the CPU MMU and the CPU IOMMU so it is entirely virtual and can be
configured to match most problems the devices might have.

Too much memory would be the main issue..

IMHO I wouldn't implement secure SWIOTLB until someone does such a
foolish thing, and I'd make them do the work as some kind of pennance
:P

Jason
