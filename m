Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BDA8457E43
	for <linux-coco@lists.linux.dev>; Mon, 21 Sep 2026 08:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789980337; cv=none; b=WGdXYxJiqKPFVobX3Zv+uyw/HLRsN0TddbjXbMicBIpQMUI3KvE2jT2vs/tvAETapVktg5k9CdLgzclnGdMS+cRUlIWKISoQaXSVpzCke86s6NDJ0o80JNk+Hk8FBDlCzH5xF2S0qAfgZXUpViWcnk2fPkbmFi9Xuz83WiPfZcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789980337; c=relaxed/simple;
	bh=S79PLM7OFJBvhVWmeCH8T7TgIzhYa8hIStDMR5Puddg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jrl2d6lFL9WfixQyiGhrxyR+g/4+YH0rTwaASF5+y2aIaYtQpBoOVJmmkRytL2pw3G3OHvvij3e6+9fBWGRKcAFA6lWij03LjC6WYg6Etv7v+5PkA/TdsbhAq5iHTA6rV5zCBVi68acU2THSpY0XplIF3T/lg0fboCAH4fBLSGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=I7zoLa2/; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="I7zoLa2/"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 73804175A;
	Mon, 21 Sep 2026 01:45:31 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0B1333F86C;
	Mon, 21 Sep 2026 01:45:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789980334; bh=S79PLM7OFJBvhVWmeCH8T7TgIzhYa8hIStDMR5Puddg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=I7zoLa2/77OP0m2cDnZ1NU+cNWgCHAC37cl9S1wyRItEP8OQfUqWtyR7V7dLGQQsZ
	 puXncDq/Bhf+H+m2/WCrWsRgdXdh9X7otp2gOSW9g51cArK3sezDGqFrHHbEDFv83S
	 LrkoSzoO5XZvq9nQ0MRX0W+NtR6xZ1VrAcc9Dq10=
Date: Mon, 21 Sep 2026 09:45:30 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
Cc: linux-coco@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Jason Gunthorpe <jgg@nvidia.com>,
	Greg KH <gregkh@linuxfoundation.org>,
	Jeremy Linton <jeremy.linton@arm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>, Will Deacon <will@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Subject: Re: [PATCH v12 2/7] firmware: hwrng: arm_smccc_trng: Register as an
 SMCCC device
Message-ID: <arDuqtfrRcBmWRic@arm.com>
References: <20260921053807.354802-1-aneesh.kumar@kernel.org>
 <20260921053807.354802-3-aneesh.kumar@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260921053807.354802-3-aneesh.kumar@kernel.org>

On Mon, Sep 21, 2026 at 11:08:02AM +0530, Aneesh Kumar K.V (Arm) wrote:
> The SMCCC TRNG interface is a firmware-provided SMCCC service rather than a
> standalone platform device. Now that the SMCCC core has an SMCCC bus,
> create an arm-smccc-trng device for the discovered TRNG service and convert
> the hwrng driver to an SMCCC driver.
> 
> The SMCCC id table preserves module autoloading for systems where the TRNG
> driver is built as a module.
> 
> The sysfs device path changes from the old smccc_trng platform-device path
> to an arm-smccc device path. No known userspace dependency on the old path
> was found; a Debian Code Search lookup for the existing platform-device
> name/path did not find any users.
> 
> Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Tested-by: Andre Przywara <andre.przywara@arm.com>
> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
> ---
>  arch/arm/include/asm/archrandom.h       |  2 +-
>  arch/arm64/include/asm/archrandom.h     |  2 +-
>  drivers/char/hw_random/arm_smccc_trng.c | 32 ++++++++-----
>  drivers/firmware/smccc/smccc.c          | 62 +++++++++++++++++++++----
>  4 files changed, 76 insertions(+), 22 deletions(-)

I asked you two times already to cc the hw_random maintainers. Not
adding them again but not merging this stuff without their ack either.
So, up to you.

-- 
Catalin
