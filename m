Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F956384CDA
	for <linux-coco@lists.linux.dev>; Wed, 23 Sep 2026 15:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790176019; cv=none; b=hJ2s9L69I86RcXPTT8hoT0pd4XJGsShN6+Hyy8sRfesF2sd9PmWY7IXSyWmVu5f2s16C+sVXLbipcbgnsUHtuniWRbCplNnkFJpFscYK6whYuqK6oOuPPjp5GPPL8z9Rxqf6fAJTy4IvXVYSVqDcTbEt104Smc1PeYhqNVOLTRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790176019; c=relaxed/simple;
	bh=zusK0QTR+s2AdzuFMy1tZJpLHzZiZCt2XlTeuJedi+M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BDSBp44iRu88PRGXyFam1vDyMAKIFljxIYzu/tF48j6YGS1nQmsR0bDv59VXIKKkA4nZwwhMLoYh4956MjZvjAN4Edm6gsDWceTsFg4GJtAcZxerqzynX8KLIP8+2g7YSnLTi65DFMQdmGW16Zx1TYh7TOgaSziVhkQcgwhk9sQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=ahF3ALT9; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="ahF3ALT9"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F01401570;
	Wed, 23 Sep 2026 08:06:53 -0700 (PDT)
Received: from [192.168.4.158] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E874F3F86F;
	Wed, 23 Sep 2026 08:06:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790176017; bh=zusK0QTR+s2AdzuFMy1tZJpLHzZiZCt2XlTeuJedi+M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ahF3ALT9UepxEmecNFZ1qVeRrBCb1D1qc5G3t+7KfoQ0JRIJzKe+2cIu9nKbGWLrI
	 kcCacVQLGsrCJT3d0A198vv9Fi1ox9t1JeXBsEFdxfaSPHEaB4hCoU0UJ/Z5sCo4Fm
	 HAcjSsIMNZkK22Yxb4+yz3Q1Hlems5gexj9DjhhY=
Message-ID: <d326a6fc-c2fb-4d1d-bba6-520bf3e67d60@arm.com>
Date: Wed, 23 Sep 2026 16:06:53 +0100
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 6/8] firmware: smccc: arm-cca-guest: Bind the TSM
 provider to an SMCCC device
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
 <20260923140405.1111554-7-aneesh.kumar@kernel.org>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20260923140405.1111554-7-aneesh.kumar@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23/09/2026 15:04, Aneesh Kumar K.V (Arm) wrote:
> The Arm CCA guest TSM provider currently binds through the arm-cca-dev
> platform device. Like arm-smccc-trng, this device is not an independent
> platform resource; it is a software representation of the RSI firmware
> service discovered through SMCCC.
> 
> Move RSI discovery into the SMCCC firmware driver. When the SMCCC
> conduit is SMC and if RSI ABI version call is supported, create an
> arm-rsi SMCCC device. Convert the Arm CCA guest TSM provider to an SMCCC
> driver so it binds to that discovered RSI service and keeps module
> autoloading through the SMCCC device id table.
> 
> Keep the old arm-cca-dev platform-device registration for now. Userspace
> has used that device as a Realm-guest indicator, so removing it is left to
> a follow-up patch that adds a replacement sysfs ABI.
> 
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
> Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>
> Cc: Sudeep Holla <sudeep.holla@kernel.org>
> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>

Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>


