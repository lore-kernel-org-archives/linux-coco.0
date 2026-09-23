Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F3B4531603
	for <linux-coco@lists.linux.dev>; Wed, 23 Sep 2026 15:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790176159; cv=none; b=olWByNbmovM8L2aCrYPu3/QEwK2cXnMx3MqnLtb6A0+llRJ6CmV013h+izwhLBSfIGqKDVZUmLlERCYE+6BXG6Jp9UcyXLh3cv3XSUGdNEdlYqUxYNFnWAuPszMOgUGchvxn+42WJq+CXY1KvTi1xV3oERwDp1G54DZGCdTD45A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790176159; c=relaxed/simple;
	bh=EZhJBNxd5DgdGGLZIF38gcgQvX7YQE1kHz/PRhpXS2w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QA9F6638qZP49wGRGlBMlbPKJGBTX0bnc7We9ld939rDpqNcakuMjFYiug50udny97gbzuMbye2GiKdBP6Sn59SfL2c1n7Y5+u8smvCTy9PYQFhsts5ZopJ0NQCZeeUklsCuKDGaFigqZxOG2zMDtDJ2HdnNxh9+/hsCf8KgzL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=NhpdT+he; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="NhpdT+he"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5E1281713;
	Wed, 23 Sep 2026 08:09:13 -0700 (PDT)
Received: from [192.168.4.158] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4C1963F86F;
	Wed, 23 Sep 2026 08:09:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790176156; bh=EZhJBNxd5DgdGGLZIF38gcgQvX7YQE1kHz/PRhpXS2w=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NhpdT+heQlDj85e3E4DE1+9t2AiiZ3nDyE5kxR/4EC0Q91kUJB62lbUMWUPRRWLu0
	 ilcL3i3GHZMlN7f/wXGTSMRXkHBPZrUBpNgp+klVtXUoevFdSgpUuaGqgEEwS97z+X
	 DC/bh2wmEX1GmqzIXKTwY6fVXi0/pYVORCdB+zZc=
Message-ID: <e2019f1e-8bba-4ac2-b953-a300d5af319e@arm.com>
Date: Wed, 23 Sep 2026 16:09:13 +0100
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 8/8] coco: guest: arm64: Remove dummy CCA platform
 device
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
 Sudeep Holla <sudeep.holla@kernel.org>, Will Deacon <will@kernel.org>,
 Steven Price <steven.price@arm.com>, Andre Przywara
 <andre.przywara@arm.com>, Herbert Xu <herbert@gondor.apana.org.au>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 Olivia Mackall <olivia@selenic.com>, Russell King <linux@armlinux.org.uk>,
 Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
References: <20260923140405.1111554-1-aneesh.kumar@kernel.org>
 <20260923140405.1111554-9-aneesh.kumar@kernel.org>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20260923140405.1111554-9-aneesh.kumar@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23/09/2026 15:04, Aneesh Kumar K.V (Arm) wrote:
> The SMCCC firmware driver now creates the arm_smccc bus and instantiates
> the CCA RSI device once the RSI ABI is discovered. The arm64-specific
> arm-cca-dev platform device stub is therefore no longer needed.
> 
> Userspace now has /sys/firmware/cca/realm_guest as a dedicated CCA Realm
> guest indicator. Remove the dummy arm-cca-dev registration.
> 
> Link: https://lore.kernel.org/all/4a7d84b2-2ec4-4773-a2d5-7b63d5c683cf@arm.com
> Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
> Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>

Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>

