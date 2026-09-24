Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1B7D478870;
	Thu, 24 Sep 2026 12:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790252632; cv=none; b=EpaPTmUGlGsIAW+5LkINYQFy1/hdwkFyMDan87dJ92KOMiuLT5ILpz9ipSa8FyCyTpsSnIJH7xaKgrgSPcfojD/WokKjCuLvd1RIw0I0BIgJrGOAupn130bDbLlfwE9azxqoS87X7tn3kudJ08IWns/00F1JzlYbFJyLjONCbg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790252632; c=relaxed/simple;
	bh=SrWTueKF/ni3pM//Sju3Gey0ALdtf1KVDEBgcFwJu5Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K5bSqtOGGExlBSxPIs1wkqHW9R5TYzj9X/SEdNLMHFrGlo0dG/VjsCLQZo+Vu2BW0gNHdbzsyUlenlvohFX/VaBie0pNIxyjQr7Pb2XUXq3a9DnxW5bXG+5btOmbTsLCWDLaxZKMFYHKKj4HpSe9NF9c2hOdIh2lVUCIM1HyxQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HT+0caZL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HT+0caZL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 171261F00893;
	Thu, 24 Sep 2026 12:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790252630;
	bh=1Z4D6mW0aEnpyPBf4dC7msQIIWgUTmukhQJJUAWvWZk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HT+0caZLYw8WBs2XyYhJlRZ8XKohmAOA9diHhzvsgaCuEk2h2KGSxkiD/AQ1vjugR
	 a6qjnloAG3cTswYyE8sThczLvua7q5wowko5lNv8yJSksyPs22VT40Jqbtfh3fYoaK
	 EJ83U/33rQf855OqzWaXsaZz7zkdHYU2O3MPClU8UBtT2cMJTg47vB0FQnZJhBsv7h
	 AsiH1EBp+h3eeYWoQKogR/1i6e/K37ncSIXNqFjdTdJuiGTFcvdLwhLzDVyIpw/7y4
	 Lz3KTRPLBcOAE/EVwQjb72l38E4RmwBmcmHm0A26Qb8oKzjloSSEx2FBJU0jzY4Uvv
	 d9plPQ/Bb3r3g==
Date: Thu, 24 Sep 2026 13:23:45 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
Cc: linux-coco@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Jason Gunthorpe <jgg@nvidia.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Greg KH <gregkh@linuxfoundation.org>,
	Jeremy Linton <jeremy.linton@arm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>, Will Deacon <will@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH v11 2/7] firmware: hwrng: arm_smccc_trng: Register as an
 SMCCC device
Message-ID: <20260924-optimistic-elusive-bloodhound-a7a93d@sudeepholla>
References: <20260914060511.277948-1-aneesh.kumar@kernel.org>
 <20260914060511.277948-3-aneesh.kumar@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914060511.277948-3-aneesh.kumar@kernel.org>

On Mon, Sep 14, 2026 at 11:35:06AM +0530, Aneesh Kumar K.V (Arm) wrote:
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
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Tested-by: Andre Przywara <andre.przywara@arm.com>
> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
> ---

[...]

>  drivers/firmware/smccc/smccc.c          | 62 +++++++++++++++++++++----

Reviewed-by: Sudeep Holla <sudeep.holla@kernel.org>

-- 
Regards,
Sudeep
