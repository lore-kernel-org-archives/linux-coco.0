Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ACD43ACA68
	for <linux-coco@lists.linux.dev>; Thu,  2 Apr 2026 12:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775131381; cv=none; b=LkuJ0NkdI6kkMEmWwWhG6XEWOKzXb4LJIrujw8Zd05+fMkZfRTpyk8h1h43eDzsWRjFfT4ZLfcoURRulgqNk0qjzo5Xfz8758nVDytcj9iazbk8rSF9zUgNW16nEX7qVzaOKHDa1x+0EFn86FCafzd/ZTxB8rPm3nnTcBLifDW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775131381; c=relaxed/simple;
	bh=+KtTbuhHgiuHy+YXQS2vChspL032vn/9QRxOV9xDd6Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GvlBLgtqngLH00YvSptQH+JZGLOOtFaf4eYrsrwf4E9Ui0V0kaS2MxiXSm6fdN3MWK+ON/ryd6Cja4GLiJ6H9MKPSFU3lGDXPz3mYAYLu/w/M5lXvG/gyC2Df+zWpo6LGHZlgEFWNDxnvwQeHu0/q1CCr7aLA2lQTttpSw1V9/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=JIa++7Gm; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="JIa++7Gm"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-506a747448dso6600671cf.0
        for <linux-coco@lists.linux.dev>; Thu, 02 Apr 2026 05:02:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1775131377; x=1775736177; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+KtTbuhHgiuHy+YXQS2vChspL032vn/9QRxOV9xDd6Q=;
        b=JIa++7GmfiklhTjs2HKrsrugwH5kuo2/cqn+iVdVe4wb7QCdQNksOQ5zeB0rw8lc4g
         VS1plqQOWSIplIrDDy7zC4dP1Nq1/l5JakEG5S4h0cxuvrd7Gl57OxYyWHbh7V3FUMpt
         oASzWluuyc1UHak65xgcU/tM6qj72Z5Vrav2ZYPKV3TNuC9WBTvOywGapVMWlffy7Il1
         OH01mpFrjK5khu3/nGWTFLczAOzx+G7X+LQaiTZXspdvUoUleLQkxytc6xpx1q0Jaklc
         iPO4oMVLkQrgAsg2ck0mqqCL3FFB3cNqR2AJjFT4ceHn0dnxpCFWiP0j/isFqVsLCUn2
         CYDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775131377; x=1775736177;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+KtTbuhHgiuHy+YXQS2vChspL032vn/9QRxOV9xDd6Q=;
        b=JrM9nv17T+4nfCDc1TYNzu85fbgpPD7uxJnMqBnZIKgk7rclDXbxd9N8cojdzNjtlN
         okwjAoMylXz4ebi/HmlMz/Zwc5atXsmknodZjwukqtcz0tNyM1VUJgATuH6dSsPxmM+l
         mYzgQwjHGCTbkLf1FCw15vzh1ksbgBsPV16z/jrAX3mXzxUOY0CHihRLa1E5CgBZdreN
         c6rVcTPZ2C9xpf5pPC7XlEAkJZEqjTzBWChGCbQl3QUFtOlJbGXLcEMp9EHnl/dJ+fQz
         nJlWzbXm0AfUg9TyGsFYVkrlAg5enNL4D1rYck86r/kDRzYicCQzCE7oZ6v58Boh5cWk
         44NQ==
X-Forwarded-Encrypted: i=1; AJvYcCVbHVmuWcbGNUs7+IyTU8d+LCZSGJQo28DgjvoJ6mm4Mn3tn6Gz2k9P+LXvLPNJ9t0x4wHHQM4WYNUW@lists.linux.dev
X-Gm-Message-State: AOJu0YxFBQqizpj5SOvCI6xx171Ofn1BaDrOc0NXZEe6IgVmp7+UegId
	fhD0ZokBz5ERRQ1gJ3IWyHNFbq2vE1fKPZnTZdBayML/V1FDp+0k3g/drPT1Wa5nTDQ=
X-Gm-Gg: ATEYQzwYEdoqeFShRm9SHQhKZvbfdwbDg/pqBN6XuRZUsd9s4fLIzwCgDoOADRRDie7
	zPVZRH/eGgVqUgEFItngkutxGVFVHPWaAyB+6QnEZJ9WYbEsTqpuaSzGBZhifxgXJYxY9uxb4jn
	/AMmu0D9aAvae3bw8CG3iZ45lqmD6MVruVsReOw44c6bnZdkvkB0WPW8Zd+m72LatF7swaeNz+4
	CTI0Fg3lOoeppBKRboug3R3JekDiinF7ID+8I95MIq3TQcRGRWsGihz0y4GcrSvR+O7d/nx7ewD
	egrq4t3elX2bjkC3xxZ5orRljXbDIxVR9BYA2r/WfpIuch2yDPn2TlcpX3Z6aVzmQX+2O8yyidW
	wkEWEkDIrIWXAI8DjY3l6JXvjEGqcpPO2eyK/w8a6+Bl2i+aTyUrilZNOKQqdZgiOPlpHswvFuj
	XwzUUaw4o085OKI6kXgnNqrfHrZ00TuZiv+moSBsmIzcMfoY5DMxyaKCWfJgn83VxdX/zp9g==
X-Received: by 2002:a05:622a:a18b:b0:50b:538e:93b1 with SMTP id d75a77b69052e-50d3bb64108mr80844141cf.5.1775131376396;
        Thu, 02 Apr 2026 05:02:56 -0700 (PDT)
Received: from ziepe.ca (mctnnbsa70w-159-2-73-22.dhcp-dynamic.fibreop.nb.bellaliant.net. [159.2.73.22])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50d4b8da5cbsm20265321cf.31.2026.04.02.05.02.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 05:02:55 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1w8GlC-0000000Bm0s-1xCy;
	Thu, 02 Apr 2026 09:02:54 -0300
Date: Thu, 2 Apr 2026 09:02:54 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Brian Starkey <brian.starkey@arm.com>
Cc: Jiri Pirko <jiri@resnulli.us>, dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org, iommu@lists.linux.dev,
	linux-media@vger.kernel.org, sumit.semwal@linaro.org,
	benjamin.gaignard@collabora.com, jstultz@google.com,
	tjmercier@google.com, christian.koenig@amd.com,
	m.szyprowski@samsung.com, robin.murphy@arm.com, leon@kernel.org,
	sean.anderson@linux.dev, ptesarik@suse.com, catalin.marinas@arm.com,
	aneesh.kumar@kernel.org, suzuki.poulose@arm.com,
	steven.price@arm.com, thomas.lendacky@amd.com, john.allen@amd.com,
	ashish.kalra@amd.com, suravee.suthikulpanit@amd.com,
	linux-coco@lists.linux.dev, nd@arm.com
Subject: Re: [PATCH v5 0/2] dma-buf: heaps: system: add an option to allocate
 explicitly shared/decrypted memory
Message-ID: <20260402120254.GB2551565@ziepe.ca>
References: <20260325192352.437608-1-jiri@resnulli.us>
 <4s75rtsmdfrze4rscbqzyrjyrko7n6sehe7agrngqag2cna5bz@eflmf4kwjocj>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4s75rtsmdfrze4rscbqzyrjyrko7n6sehe7agrngqag2cna5bz@eflmf4kwjocj>

On Thu, Apr 02, 2026 at 10:52:34AM +0100, Brian Starkey wrote:
> I'm not clear why the heap depends on !CONFIG_HIGHMEM, but I also
> don't know anything about SEV/TDX.

It is because the CC apis, set_memory_decrypted()/etc are slightly
mis-designed. They take in a vaddr to represent the address instead of
a phys_addr_t or a page *

This means the user has to use page_address() and then the whole thing
is incompatible with highmem.

Which is fine, highmem and CC are never turned on together.

Jason
