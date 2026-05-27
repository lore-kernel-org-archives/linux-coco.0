Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 228963D5651
	for <linux-coco@lists.linux.dev>; Wed, 27 May 2026 12:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779886308; cv=none; b=VGLnne14v08mMNknK8iF1yhruPu7cN/simAFM7TzmoNaVwqO1QmbQobUK3JXqAJTXyDW7Sy4rgcRh2ZNxkKqPpdRJIn4JhkNeP9Xmk/2Oi0DVaMYFxKlg+LcCFqpRBAdWNOUryLDC4lnJSAn1Yy6OAU0KTNou2Vk1rK/AJFikTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779886308; c=relaxed/simple;
	bh=3YV519fCLQr/dcnqiYK/3hUmKBEJM/JaljBjBD9SBqU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rSZVyIBmHjNUs4Oy8pFMTH+wM5WH4eOztDUaolsun/kWtR7OqxKAjNbevD2Sdn0Uo+ftL6LZLuFFxKgGJhLj5M04Uq0pOXlC15s1O33TwehULZqmOA8I4ObihADEy7IobiBDZz0RFnEHXu3CmxchRSyR9rHe3JtTrjDnZDAiv44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=ZrSdpOQL; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="ZrSdpOQL"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-50e5dbd8e0eso135383171cf.1
        for <linux-coco@lists.linux.dev>; Wed, 27 May 2026 05:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1779886306; x=1780491106; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Q4NRS1K5QNG7yp7e4rqW6uFiLphCUgs0ec2fYNP5HFo=;
        b=ZrSdpOQL/RgfO2XJCSZwbDeXmpZubB7/KoOzhbZJKmmIXxf2BGHdfgt5Fj+jRlWtp1
         SpgqCpc2nhJv8SEZa/n4/+HB8IHGnbQxG1AEfgI1cTstf+0WJGnkau6pr9v4kDy9eMCN
         Pdr3QnGlpHsvMNhA2ScRslp9kHj+HYLwcpgfxFOw6KXli8CUFknTYHdrNavjETtSalsw
         QoM/GuPKFsLdyEnlCTCzBq9yMBRKphC7vDSc/nmhvIH1FV7u19QfBz2TsoRYg6gMP/yt
         C3ggvaE/InK4KWgeV/6mcy79EA9OKQGinHbyxoWpg5f2z+2Sd2VN0oOCYjbWUAuVoSCN
         sN3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779886306; x=1780491106;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q4NRS1K5QNG7yp7e4rqW6uFiLphCUgs0ec2fYNP5HFo=;
        b=BdPOZYeX9r/htqVNiQaw4jre9OJNDR0GHguo8Z6BFRqeDW6yNFN1LXTc2IDv0AGjX5
         DpwSqfZpyotWPgdF+Zl9a5Lw16tkyjLBxYYMvyuq5mpJAwNvZxgeJJXLoEaXEDg25e0F
         LXhPJT6otcNM9jBxHn8NUAkTWs1R6KaIkVzbTDsqbTd/2A9r2pvp5CfpDekIo37GcngL
         3Ef8Kl3BJ4XS5G7ReDxlKl3GP/rlFOKA9eulIEZcoISjnO31eMiUkHzw/o7xv86oP9ZA
         LCzudxu0fzjoDieyTQFbKk8bpxEzwSDc2xCp0RkPQc6o0SWpQrpz8jIg6ebf9oxqzB1f
         qVbQ==
X-Forwarded-Encrypted: i=1; AFNElJ8Umfq2xgXb6K4Vb9oXvr4lzQLN8e2Sa0KsQiMRg5Xqg7PFtanptItw3gyaKRQB3fe0fKSC2IErIBPR@lists.linux.dev
X-Gm-Message-State: AOJu0Yy78HAoNwSwm8ckSIPuEBjKgN3mwZZ3GH29kYI68S1anVxXaN+4
	cE8woqSWFoeKe4gX3jS9Jv5gOaGgpzeAPznGo6moB2McW8Q2q2bK5BnpZPK90nennlY=
X-Gm-Gg: Acq92OH66qe606sZu4GcJ6BzLpEgA94ExnNyU237XMM4UJbHIiBbcAokDH2balniEi7
	fGxDl0ILkDnoEgZX3Pl40a2Q/anJMjzQ9rPcigsJMyf891fFZrK5k8NHh3SvgHHJSC2xEUFFAdg
	Xk+uMFSpRtW0GYa7QSiPiIWMDkA2QtsVrzmOFt870ZuMC0w6sQIhq1G+YADrwUTQondR7TqXQNW
	Q3LmW0785DYh/uPFTg1o6+WttpifM4NWSB2pFKLRxtMhIr5vN31z5VsFq0/yvWqipiQrTkHs3oD
	ImYMwLldv7XmMEb2C6EtyWzjBt2HooT0KAQy4WZdUL9WD6Gg5IQe/cq8/FvOw5aDSeCrDT5u4Jh
	yMBLChcpfaclQXGvD5G+rk89A3iKUr4Dk3DYMG2A2wEBNS75sl5jkNpiHvtZLRAuS10qZ339OoG
	vawGhjyx8pXs2gPKEcLcE8mO++KknaYEUBLgUS7MCcHpXeFZIiIybwSBlTMGsRVuEA2ijsgNmAd
	rWqQPkq/c05KQ4I
X-Received: by 2002:a05:622a:1809:b0:517:1481:54a with SMTP id d75a77b69052e-51714810844mr23315551cf.53.1779886301081;
        Wed, 27 May 2026 05:51:41 -0700 (PDT)
Received: from ziepe.ca (crbknf0213w-47-54-130-67.pppoe-dynamic.high-speed.nl.bellaliant.net. [47.54.130.67])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-517069f2464sm41772341cf.2.2026.05.27.05.51.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 05:51:40 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wSDjX-0000000EOpm-3BXO;
	Wed, 27 May 2026 09:51:39 -0300
Date: Wed, 27 May 2026 09:51:39 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Dan Williams (nvidia)" <djbw@kernel.org>
Cc: Alexey Kardashevskiy <aik@amd.com>,
	"Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
	linux-coco@lists.linux.dev, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	Bjorn Helgaas <helgaas@kernel.org>, Joerg Roedel <joro@8bytes.org>,
	Jonathan Cameron <jic23@kernel.org>,
	Kevin Tian <kevin.tian@intel.com>,
	Nicolin Chen <nicolinc@nvidia.com>,
	Samuel Ortiz <sameo@rivosinc.com>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Will Deacon <will@kernel.org>, Xu Yilun <yilun.xu@linux.intel.com>,
	Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Tony Krowiak <akrowiak@linux.ibm.com>,
	Halil Pasic <pasic@linux.ibm.com>,
	Jason Herne <jjherne@linux.ibm.com>,
	Harald Freudenberger <freude@linux.ibm.com>,
	Holger Dengler <dengler@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Alex Williamson <alex@shazbot.org>,
	Matthew Rosato <mjrosato@linux.ibm.com>,
	Farhan Ali <alifm@linux.ibm.com>,
	Eric Farman <farman@linux.ibm.com>, linux-s390@vger.kernel.org
Subject: Re: [PATCH v5 5/5] iommufd/vdevice: add TSM request ioctl
Message-ID: <20260527125139.GL2487554@ziepe.ca>
References: <20260525154816.1029642-1-aneesh.kumar@kernel.org>
 <20260525154816.1029642-6-aneesh.kumar@kernel.org>
 <becd865d-09a4-4ac3-b719-4a0deae2692a@amd.com>
 <6a168c8ea7d10_2129b2100e@djbw-dev.notmuch>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6a168c8ea7d10_2129b2100e@djbw-dev.notmuch>

On Tue, May 26, 2026 at 11:17:50PM -0700, Dan Williams (nvidia) wrote:

> In that case pci_tsm_req_scope becomes tsm_req_type and is just:
> 
> TSM_REQ_TYPE_CCA
> TSM_REQ_TYPE_SEV
> TSM_REQ_TYPE_TDX
> 
> I am leaning towards the latter at this point.

Yeah, this sounds good. I would also include an common op field that
can be decoded by the TSM driver based on the TYPE above, and the
usual in/out message buffers.

Jason
