Received: from mail-oi2-f43.google.com (mail-oi2-f43.google.com [74.125.231.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BCD8541E72
	for <linux-coco@lists.linux.dev>; Tue, 22 Sep 2026 17:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790098008; cv=none; b=h3dZ6hGENDTCebB1p8QBPWIjSHcMC47Z4HMVrZSDJeXzttVpTgEIiUSqL6diCkece/jEyxm/sfk2kJpwdj/1YkKVGJm1NewaRlu4TYTu8BvmvQkBkkZZKhSfLfNq19xq/909VT5Son61SSoTdDQivtkhtXDuRMjhQSBeXQGmwsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790098008; c=relaxed/simple;
	bh=ZsMda0uwAQyf/r755/L9LfI3ibTlAaDp5ifNzI89+Ro=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RZYYI27691CP4Z8jvW3jHlWoDbX85QObxH7m1s7ZtFc1EKs45TCphNSUkj5j9UalY1gXIjQe0EdwK2xdpVyxVy+hOy75RCDJYiOiY3e6LUOxaUDx3cTiA2oLz8sBoH6n/SPBSNAZRuRrueUZ4WyUsR88StCAf9KLcJf+RCbKL2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=TAA+MgB5; arc=none smtp.client-ip=74.125.231.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="TAA+MgB5"
Received: by mail-oi2-f43.google.com with SMTP id 46e09a7af769-8137b129131so138455a34.2
        for <linux-coco@lists.linux.dev>; Tue, 22 Sep 2026 10:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1790098005; x=1790702805; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZsMda0uwAQyf/r755/L9LfI3ibTlAaDp5ifNzI89+Ro=;
        b=TAA+MgB5i3cj5yTmEWtVqFhtQ64ZDiqeHgy6UZGJ03kUNPjdmLb0ZCE7n/yjJYMM1m
         phFG0a+ZHJO7whgI3lU5UKeyeYguMaZxJ6+L8V56K1aMGKekK6b94dM2iyGco+r0NRvC
         1OZCOPVzFU7zeZ+CCE9lDDPooBBSiEMAJlnqKtPA4yDVWFN6Kf/QeNFjESVxVDxVWL2G
         y2zR9vS7crazIU8I4BnupTjsUVtDkAFP5CTelWMs4y+6vdyh5kNsT0Z/o+V6l280QkJG
         sNhTBtksjk1GKBAHXLL9e4dRx0s+qHaSfGiI7act45TzAASFOWxDDbtX9BhFADV/dsWL
         VQwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790098005; x=1790702805;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZsMda0uwAQyf/r755/L9LfI3ibTlAaDp5ifNzI89+Ro=;
        b=IpAvmMiUSjKJGn8qpEcQQbesvKd7yr51k2s5HriEPMe+ixVqDTdwgtCAGrkCjS7qlk
         +47JOE8v1CyqVi6DxizSgFNA6PRLeTGawfVIwpA65zPbXZtT96nDTU74dbyG/qT03Wh+
         YxG29sP/7ag6LB23AzfY0/r+fKAca2SxBOo5GEFP9VctQ7SyAX51D8xqqUHT7dt70Q/W
         71Es8dQ21uWVTvLw8pStiSj96FPLYO1NkF+lQYVQPIFFZANyZeld1sMSXWr7mxxPF5M4
         HZg661iZtCxaOkkoMEaINIWEe4vm6vjFW0yIGqPw96wP9CngGFtTYCLLLEMR608kus1l
         3j0A==
X-Forwarded-Encrypted: i=1; AKwUvBy2m70grvazBzmU+icNKlWcu/B7rQKsYIVxdyIb2tob6ccelHkh1PGaNQvw+Cb3aClyUDPUkZ9N6MkO@lists.linux.dev
X-Gm-Message-State: AFuF++mvSH0SIbZ9JqG8cAkpj5BR7Sq6mCDZLyl5sD0hH28fkJfoSDuL
	Zam4G8mbuZ3lskNgwIPJowtOxL4sC09WqWC1OvbTSaZHQ92dgZj+SL+WxwgskaQSwsM=
X-Gm-Gg: AYBFou3c1g0wEUAD4YPjKPYhojunGJFlRU2bZRGWHUHtx4Z7KGSq6f3+ge2niY9g7ij
	WOAVUStg1eNmE5ZPRu6UxHzAE6b15hYZrpkXczdH3BNeC2q7Z5dUr3kbrxHGNedM2lFbSKNy+Yc
	EDqxtAt96K2fNJV0YfXJQFwDF13jVdREJJETB8jGah0SsQK+Ddv3CUu9oUWSYiuHSXuRq8vAZXN
	SxnnNT14VfN6+9rq3D1z+LCz9q4AfWU4wAzE9OFRLsdYyV2vZhLMQp7b021++g/4P1gLun1VbZp
	7XPEjcprB/C0e7csZ1GKvKJpMUgNoGnHOg83YPmzTUUjwjSLArvB0wUu8mRlc0SQ9Fw8XrhsoLK
	HwTB1DyolPNG1gXBLD21OSLtxau3/7fqPeyudQnkrywGv1zXyp+wKsaHyfVIPjD8jSKbnNvk8J5
	zvWoe99KqGY0ZAXlmHpWzweZuuS9cw9Hbd8URpL8oiQazp
X-Received: by 2002:a05:6830:82ee:b0:7e9:e488:3bce with SMTP id 46e09a7af769-815f0071c0bmr324985a34.6.1790098005310;
        Tue, 22 Sep 2026 10:26:45 -0700 (PDT)
Received: from ziepe.ca ([130.41.10.202])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-81603fc79dcsm103564a34.14.2026.09.22.10.26.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 10:26:44 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1x93id-0000000AWlt-1Oeu;
	Tue, 22 Sep 2026 13:51:47 -0300
Date: Tue, 22 Sep 2026 13:51:47 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
	linux-coco@lists.linux.dev, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev, Andrew Morton <akpm@linux-foundation.org>,
	christian.koenig@amd.com, Joerg Roedel <joro@8bytes.org>,
	Marc Zyngier <maz@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Steven Price <steven.price@arm.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Thomas Gleixner <tglx@kernel.org>, Will Deacon <will@kernel.org>,
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
	linux-media@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [RFC PATCH v7 02/13] mm: Add an allocator for CoCo shared memory
Message-ID: <20260922165147.GD1540250@ziepe.ca>
References: <20260921144847.501151-1-aneesh.kumar@kernel.org>
 <20260921144847.501151-3-aneesh.kumar@kernel.org>
 <arKsFofudnTYpXj1@arm.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arKsFofudnTYpXj1@arm.com>

On Tue, Sep 22, 2026 at 05:25:58PM +0100, Catalin Marinas wrote:
> Does the memset() post sharing logic work for pKVM as well? If nothing
> clears it, we have a small window where guest data is leaked to the
> host.

Same question for RMM? Or did they define that the RMM zeros on these
transitions?

Jason
