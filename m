Received: from mail-qk2-f43.google.com (mail-qk2-f43.google.com [74.125.230.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 268E549AA54
	for <linux-coco@lists.linux.dev>; Mon, 21 Sep 2026 12:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789994249; cv=none; b=khltHVEnjDepVT79AIV56RITEY8Qenu8NSCHC/kB3h7H0tvt24brCTHzpZIB+NQ4vsx2Ple/EY0NRI8Diy4Ge7UtpuF8pZqsajoTsRC2S2U8LGS291SDIH4OIbuxOgY5genT4Xt27Gu270UsoBswcM7e8nQg9gDj6Ndhx4rpxZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789994249; c=relaxed/simple;
	bh=+Hm52DrFJhVzTImXmCJeMk9yT6JstqdY7Mr3vv4AxKw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g7gUQChz86EafAr05A6furkKJkPpkQjtvYBZDTuzqjJCmqUvYHWlnw7xU5pHc8JTx5Ofak3lZM8L8YHAuWeBduSZP5r17HiZC4wkSpGVYH3GXbrdLUc7rZGGronzFzfCcfy4yLfSiTLq+qoBvlgBP5+/0PJXNX/n9N5VIPHeDs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=NLs3h9Vl; arc=none smtp.client-ip=74.125.230.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="NLs3h9Vl"
Received: by mail-qk2-f43.google.com with SMTP id d75a77b69052e-530301ff353so38963811cf.2
        for <linux-coco@lists.linux.dev>; Mon, 21 Sep 2026 05:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1789994247; x=1790599047; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+Hm52DrFJhVzTImXmCJeMk9yT6JstqdY7Mr3vv4AxKw=;
        b=NLs3h9VlvshFYKj+FwWrs0XtFOS+Mc7miYFokVGwntH5cw4PSAz3fmCGt76yBXgwFz
         5uF8OiBD996Ji/OvhPveBFRGeW1ZaSYeh3GEcVQt2Z9cVi5T+Khe34mzkRNK1gQLHoYj
         is0jrZyNQXKoE6v8eegpcvyqFLuVJX10DBFXxHSHyYodWc1oMpoH8meUOgUAhQW4MxHd
         7nmrR8zDJRQzbAFjUs4hqgD9u0+4UwZXH5Z1x1xp/+SMzPQpl67eX4pH/ZZMp1muWyzj
         j6NFpbPc4GE5NK50BPLK27SSqWHxdHg6xnTyxyxLgdR1AuRxVkr6j6PahF5GIfKqVMXg
         SqVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789994247; x=1790599047;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+Hm52DrFJhVzTImXmCJeMk9yT6JstqdY7Mr3vv4AxKw=;
        b=WFQL7uRhEKh36dwiUqQUkkoipECezd2zsAYKAsOv1LZUp1V3iQiASK9jVqmLYDvAvh
         4HeE12wBApHxh+3tRVk6TMldT1L1rR9Q6jz6pius4bNUOMY8KGwCY0FCmQ/eQqah0Re/
         sFs6e/Ws1x4w1wWE/yCyihnEKN3Mb9XnYbfHwUXGSBVT8/p8/NmisyDgnBsJHN1TVqG/
         hOp/0i4VgoKWlMFHdh961LAGHTnaiR6DAEY+SePeICu+2ARmA/vmQLBIrIxjZ8MjuR2e
         /09uUPecE4gSN/4Jlqu5r4H2Bi+03BfaDsYClzf3/QLUWnCz+faVC98Iqdvli4TCn3s2
         o/uw==
X-Forwarded-Encrypted: i=1; AKwUvByC7EPa1SVTWDxRiUfXuXTOlQMEYwVb96Tbf5TMQvxDmB7n26OF8eJNGgg/Ebiqxwyd1y2q4h1xGJoZ@lists.linux.dev
X-Gm-Message-State: AFuF++ko5MjpfIlVpxCQpFMt+bWVW+CXAC+Q5DKQq2qq0yyEJ96CeJKK
	cWUbSbbhaZJ/nU3uMV2HOC+7ctn2bh8TWzlF+DMvNKJ9HV9yIDgS9t41aXP6KfR5oZQ=
X-Gm-Gg: AYBFou2JhDADr5ot+APTAgxTAaKhRV3wwZZCwKj3qwgNo+iL7sDLlMAs9MFi2cTs5gg
	O1Jhk6OUjQxzPKy0sXTXTrVE14OSrZDSkSy+MOJdW76tJ2bvHM7FBrt2prEowujYC6KCuIHdLsy
	L5VEVs55j2D98pSaWWxMmzQTiGHlgg8Oaz5YC4Y8/7Q4YkeHK9A0g0gdg5oZM2cFo67ZHJbX4Mn
	KJXACZoYjEc+72mAoAM3p2cjKuVlspdnoB7/dtRQ0AEmdGnuta2wfVYx+NvQNJrtipqM5iafaTZ
	Q7dY1oFRW7z9JPPmOa7bZ9qxqYvceJzw7Lxme1M0u7yI+H7H/uEaAgF/Ena1mELYcjVAvmjOlGW
	9MlzSOOuBPr1mTubhENyAtklu9LYyYoZZHPTUFKfcY++BlHplEYbeinMI6knyFUvlP+hgHZgUhq
	79rvSHCGl1xZDHaW5+W6WwVf5jBXhmanzHFa/kGuTfkjF10LPbgZvSV72VTIVf1bc0bLT5ttfKQ
	OYNXNCfF/c8aNAeCdOHXDwVUwO3FnV7kwW+UDVjkWirUInA8uKJLKB4lSXVKFZe+4Y=
X-Received: by 2002:a05:622a:1311:b0:52f:a0b3:bcb9 with SMTP id d75a77b69052e-532d8cf35b1mr4406171cf.10.1789994247006;
        Mon, 21 Sep 2026 05:37:27 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-532ae77acccsm63282941cf.30.2026.09.21.05.37.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 05:37:26 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1x8dGv-00000006HZy-3ljy;
	Mon, 21 Sep 2026 09:37:25 -0300
Date: Mon, 21 Sep 2026 09:37:25 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	"Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
	linux-coco@lists.linux.dev, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev, Marc Zyngier <maz@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Thomas Gleixner <tglx@kernel.org>, Will Deacon <will@kernel.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	"T.J. Mercier" <tjmercier@google.com>
Subject: Re: [PATCH v6 7/9] dma-buf: system_heap: Enforce shared-granule
 alignment for cc-shared buffers
Message-ID: <20260921123725.GN11599@ziepe.ca>
References: <aq1V3oeDdvXobt8J@arm.com>
 <97c30fce-9bda-4c61-b1b9-10297b89c8d9@amd.com>
 <20260918153642.GD11599@ziepe.ca>
 <d8123f21-d5ce-415b-a05a-392d97b8b57d@amd.com>
 <20260918165315.GF11599@ziepe.ca>
 <6115eaf7-21bc-49ce-8a74-08fd37a1e2c9@amd.com>
 <20260921115141.GJ11599@ziepe.ca>
 <45dd7a2f-8474-4388-b383-2dee3ee62206@amd.com>
 <20260921121739.GM11599@ziepe.ca>
 <cd2b32dc-5a80-4ef5-82bc-dd41ea96dc01@amd.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cd2b32dc-5a80-4ef5-82bc-dd41ea96dc01@amd.com>

On Mon, Sep 21, 2026 at 02:24:21PM +0200, Christian König wrote:

> I also don't see where mem_cc_shared_granule_size is added?

Patch 1:

https://lore.kernel.org/all/20260904103452.1197239-2-aneesh.kumar@kernel.org/

Aneesh, please be sure to use get_maintainers on series like this so
everyone gets cc'd.

Jason
