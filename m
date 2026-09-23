Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1E6051AEE8
	for <linux-coco@lists.linux.dev>; Wed, 23 Sep 2026 15:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790176111; cv=none; b=UQfhX7bPQmprBpHUkPMdYSvTy2ppElq9AtbqvOgTK1JWNeRQgyViZnDpDJmOMvu5SVlLKDoMgwMEwhsV7VmDiiKH+WhPHeulwGoh0UEe/Dd3ZiYXany1PLnApoIisO2Nrc9t6bbJ+Y6jdzQbHMc/nqC3yEmI9HKjPeAblrqnJDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790176111; c=relaxed/simple;
	bh=edtWsNHFqIjdvZULam1O7IB7K582ntmW2xvpX9oL22I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VpHHAqIskuPx24IGvpCE4Qptu+3s5ZuFK4FboZlNJBC+gpJwllKvqTEOLkP2rDCDCeyuyL9HjHsHt4Ncag/QCM1HgOU+spcK4j9aa89Q+1uwZiW+Z1AEimy+SfGlunc1eZpHhFeDw4doDqVU8/C5hbLJvazRUvhuI0N21bsWcmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=iU4so09V; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="iU4so09V"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5311D1576;
	Wed, 23 Sep 2026 08:08:25 -0700 (PDT)
Received: from [192.168.4.158] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 911EE3F86F;
	Wed, 23 Sep 2026 08:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790176108; bh=edtWsNHFqIjdvZULam1O7IB7K582ntmW2xvpX9oL22I=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=iU4so09VsYwG4mfgnfjgyscGoaIH5dI/auxUcOj5+WeOxNFbRV3D/N0hk7AuSemUr
	 LzjaY2DjeMua/Z1a8HVVBcmvGoUMrZN+AS9DP8LD+OMC4rRwpiX0pC65rMWXmRR6I9
	 UIwmVo7MsWUDnfODGoK/v7dAInTdKjmgt4XguVcc=
Message-ID: <c8819aea-d0a2-45ea-a4dc-54e2f9aa2df8@arm.com>
Date: Wed, 23 Sep 2026 16:08:24 +0100
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 7/8] coco: guest: arm64: Add sysfs ABI for CCA Realm
 guests
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
 <20260923140405.1111554-8-aneesh.kumar@kernel.org>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20260923140405.1111554-8-aneesh.kumar@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23/09/2026 15:04, Aneesh Kumar K.V (Arm) wrote:
> Userspace has used the arm-cca-dev platform device to detect Arm CCA
> Realm guests. Removing it without a replacement would break that
> detection and would also leave userspace depending on kernel
> device-model details.
> 
> Add /sys/firmware/cca/realm_guest as a stable ABI for detecting whether
> the kernel is running as an Arm CCA Realm guest. Create the file only in
> Realm world, where it reads 1.
> 
> Document the new ABI in Documentation/ABI/testing/sysfs-firmware-cca.
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

