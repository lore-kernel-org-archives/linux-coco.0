Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07AC04C1505
	for <linux-coco@lists.linux.dev>; Wed, 16 Sep 2026 15:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789572125; cv=none; b=TEoDsLqeHYM/08j72i/j51aMUA9AGyQzEXPl+vOXY6GLT7WM7mPQEYuNSKTjmrrFuiHq48ycpP/Yz+GkmzwEk1wGHfqcwiIShgKqvHF9OJdnKyYgC0cnQ0PqsIcMhpS4PnsZlF+VRfivf/gBvADxLTVkxxIH9CiF1DliDdCMEOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789572125; c=relaxed/simple;
	bh=yLzqZqOmebTBUGiFGKZgcketuLUgJ8qsgeE7eEWH3WE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZP4a5NDzduiAOeb7/Exvh8wfg5OyvMJhT0CWTDziz7ziytGX5XpZaVOtiVM14nq/1oz8ezQBH8vrIbImNqFpEjtScpL2+UOkGqcVdDLzep5cRQ0VA76hyO3nK1EFLFNWJuwKJHrRUajdoLYGFYqpwlKsJ7qeYfqAbgaz+hf6Ofw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=GvLhrGBr; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="GvLhrGBr"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BF8FE1516;
	Wed, 16 Sep 2026 08:21:54 -0700 (PDT)
Received: from [192.168.4.158] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EAB3A3F86F;
	Wed, 16 Sep 2026 08:21:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789572118; bh=yLzqZqOmebTBUGiFGKZgcketuLUgJ8qsgeE7eEWH3WE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=GvLhrGBrgZKQ6UXMR1KePllYx/JYkHFtc+ee1sTloowa55iV/kp0tYM9EhtuLmniH
	 I+zaQNzi/XSmbxH+mUYEgbR4/Gh6h8QSKEXJkA4bbi39s6Rm8oLQKJWj4baA1kl7ei
	 HRfBS4WSl9qLmbfTIAm9o8Ey3xM6GSWbycm80Q28=
Message-ID: <bb59b1e0-2550-4a9d-8738-a54e5f106f45@arm.com>
Date: Wed, 16 Sep 2026 16:21:54 +0100
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 4/7] arm64: realm: Move Realm memory encryption ops to
 RSI code
Content-Language: en-GB
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
 linux-coco@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Jason Gunthorpe <jgg@nvidia.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Greg KH <gregkh@linuxfoundation.org>, Jeremy Linton <jeremy.linton@arm.com>,
 Jonathan Cameron <jic23@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Sudeep Holla <sudeep.holla@arm.com>,
 Will Deacon <will@kernel.org>, Steven Price <steven.price@arm.com>,
 Andre Przywara <andre.przywara@arm.com>
References: <20260914060511.277948-1-aneesh.kumar@kernel.org>
 <20260914060511.277948-5-aneesh.kumar@kernel.org>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20260914060511.277948-5-aneesh.kumar@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14/09/2026 07:05, Aneesh Kumar K.V (Arm) wrote:
> Realm memory encryption callbacks are CCA-specific. Keep the Realm callback
> registration with the RSI initialization code instead of pageattr.c, which
> only needs to provide the low-level page-attribute transition helper.
> 
> Export __set_memory_enc_dec() within arm64 so the RSI code can wrap it with
> the Realm-specific encrypt/decrypt callbacks and warning policy.
> 
> No functional changes in this patch.
> 
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>

Reviewed-by: Suzuki K Poulose <suzuki.poulose@ram.com>

