Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39D3A357D1A
	for <linux-coco@lists.linux.dev>; Mon, 13 Jul 2026 19:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783971740; cv=none; b=e9g9z2Ldjfgc9MZqNTGSbCP1kyhnpRlzaml+wriqZ0maWfWo5cd3rF+d6WHmXQc4lPSSYBnNP1IeTopsjliQ3oLHd65qMxbLAvZLZBJqTeXV0RVV/NSv5Nt0ZE5ZpYWNWIxN2gThpC9Ll8FA+B8W2PrraWkdspX0cMxa9Tsc50M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783971740; c=relaxed/simple;
	bh=5d6Bc8gkCbSlPfvzi0E/608dMWlnVz1C1iUyYSF7w/A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OVzcQTOqeOSwNsUeN1sU4nQHYEAtAlx4WHFhKmjqqounHrk2tlfUhLjJpvUDSpZ7+87jbTr1g2Ev21BXgB8Myu6mDM2uuccWDfKXjPjYLiGfmiqdJ82YIcxjZQ5m7vocb9JqXPnJktl0Z81LSS43fDCKmSQvlCnIGvB7nqfOH1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=GS2yLQ7q; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="GS2yLQ7q"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-92e85499ffbso21175485a.0
        for <linux-coco@lists.linux.dev>; Mon, 13 Jul 2026 12:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1783971738; x=1784576538; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=q5KluJxuBWim2YOI+gCMldEdZU/bLOQ3tr992AX6OwE=;
        b=GS2yLQ7qoZ4wWhbpetkiDl7h1gvrH3vaJ2vE6Myr2R3a/7qmTKylJBKbxq1EdOu7OO
         Hoa7f+XsQrGHFdcr+tTC+uI6wRzRSnYTIxDXfv4QbXiwwAlTZxTzdhVHaw6Tekv8Wtmg
         WCyna1Pm/ECAKGBtrT1Q8tTIZNSXQmgopLhJ7QiZO8IeYt49vetmMOI/F6yw2lbOj51D
         lLhkPMGPPa5MQGBtQQIWRKQMAo597jKDG0x6gi4q3kbkOd0XBy8jxpBJYSKG07v8DBlf
         XjkmtWHnJwHTn6xzHCCTrKoQ4uxR0f6TZvQkQLXcVxATvDFTsVHn14qCYNZnH0ELVwJX
         OnSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783971738; x=1784576538;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q5KluJxuBWim2YOI+gCMldEdZU/bLOQ3tr992AX6OwE=;
        b=ieg7/TFWyMVST6BlbO/6hmcJgQW/VCgwXFd/Xs6I35gKgsT4lPBpRCt5toTIs1ZRw/
         gSOJB+In9x7BxosQQzD2uXkKzg4sdy3UMTvjVTudH06tuqUCQYnu6MuFhDIZdWQ75zfk
         0kMbT8v02gZxLkqgtJnEopiwOnXxmPXvEl8n7jyImDhOdJlpcwO+9k6Ct79hRfIzZChG
         G1LenYLeKlGRsX/968aSqQEfFONsrWSyVNFSiyIc+Dng0/kBBtfHsf5wjtOvbQzjBO/G
         nRvYEyp3NpuZiHcnLX4hU46wbWRtTOvK3V1uBoGxnkNXLJONkGTNjSa/I13kWquUytpU
         VrvQ==
X-Forwarded-Encrypted: i=1; AHgh+RqGFvDTH96AKsOKgdlj1yblCTxCmMZHFimoV3CTL7JKxnCqWJv7pZwI1FozoC0PZOcK/togCVGN6Xdi@lists.linux.dev
X-Gm-Message-State: AOJu0Yw2ncnhPSoe3sMtJQ6K9JmbndREYEQU+R9hUWPUg+7xFk/X0eQV
	HY47t7HwytWMYeUg7EVT5bQ9eGvtEmXioN0w9sbBrrtF5IvBD4wEe21Qt6T+kteSGdc=
X-Gm-Gg: AfdE7cn3AOrdPXLcpfPfrwEqs43OWvnO4dxH81CRAWHuFeKW7rfXkSNCfb1uSfL51h4
	L47zuIVZozS99eswM8tCPpLdrbl+2aGJn6SJeqclovIh2ag3Z9BlqAg97CJTS++3bJN48opLJZU
	S0EflrmyTgrqao8TOSB27o+oIoSjPqnlgYXGRYorCLbOdCbGq+S/TZGC+9BSdyCL40WfWnQVahx
	2OKhB2C9LFZhAREONt2sxNL91LzZGWw/v9x+S3M667g/otUHluRzC+1PNCIm+oVbPGtJtzRC3TC
	5kNCBWOm4idUB1RFmrnSDDzIRDC4JpqZT1GjrlrhtcmWSnC9fyO/02quLNhvkiLjnzQlg0q8Pav
	gjjVpa6qEiep8lznfUu9JmNkKPwdk0GP4iQjxmf8WmNGwgu9wbJO77ifNMoUp
X-Received: by 2002:a05:620a:262a:b0:92b:d4e3:1f08 with SMTP id af79cd13be357-92ef2bcc2e9mr1042196885a.55.1783971738155;
        Mon, 13 Jul 2026 12:42:18 -0700 (PDT)
Received: from ziepe.ca ([159.2.72.92])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92ee5d37540sm1154048285a.38.2026.07.13.12.42.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 12:42:17 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wjMXh-0000000E6o6-0etu;
	Mon, 13 Jul 2026 16:42:17 -0300
Date: Mon, 13 Jul 2026 16:42:17 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
Cc: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev,
	Robin Murphy <robin.murphy@arm.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jiri Pirko <jiri@resnulli.us>, Mostafa Saleh <smostafa@google.com>,
	Petr Tesarik <ptesarik@suse.com>,
	Alexey Kardashevskiy <aik@amd.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Xu Yilun <yilun.xu@linux.intel.com>, linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>, x86@kernel.org,
	Michael Kelley <mhklinux@outlook.com>
Subject: Re: [PATCH v7 21/22] dma: swiotlb: handle set_memory_decrypted()
 failures
Message-ID: <20260713194217.GA3133966@ziepe.ca>
References: <20260701054926.825925-1-aneesh.kumar@kernel.org>
 <20260701054926.825925-22-aneesh.kumar@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260701054926.825925-22-aneesh.kumar@kernel.org>

On Wed, Jul 01, 2026 at 11:19:25AM +0530, Aneesh Kumar K.V (Arm) wrote:
> Check the return value when converting swiotlb pools between encrypted and
> decrypted mappings. If the default pool cannot be decrypted after early
> initialization, mark the pool fully used so it cannot satisfy future bounce
> allocations.
> 
> For late initialization, return the `set_memory_decrypted()` failure. For
> restricted DMA pools, fail device initialization if the reserved pool
> cannot be decrypted.
> 
> This prevents swiotlb from using pools whose encryption attributes do not
> match their metadata, and avoids returning pages with uncertain encryption
> state back to the allocator.
> 
> Tested-by: Michael Kelley <mhklinux@outlook.com>
> Tested-by: Mostafa Saleh <smostafa@google.com>
> Reviewed-by: Petr Tesarik <ptesarik@suse.com>
> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
> ---
>  kernel/dma/swiotlb.c | 80 +++++++++++++++++++++++++++++++++++---------
>  1 file changed, 65 insertions(+), 15 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
