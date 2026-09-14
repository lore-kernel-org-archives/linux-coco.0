Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B4993D525F
	for <linux-coco@lists.linux.dev>; Mon, 14 Sep 2026 13:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789393385; cv=none; b=nTr7roJ6EnnwrjJeAAlpCfvu56O8v/wE/LM/xls30PfAoywjcg/phftGsgwsTqmHiDIidlC6LULSEpJevm5BqAXA3YzhXe0TTPxySMNDDJaXx0o/hIfG2RHrrAPki9LxXeXdWtc8HhJF93v1MkUVLivljCVXtuV7JghWhZc9Okg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789393385; c=relaxed/simple;
	bh=VsD3H2ySCWA+ttXwqRR44/yEVZBVYNu9HiXKcp4JU/I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EOg5a9WPzfIfQPTfqnZ1cEJVNLTaFAoehV5U9JMjenvSvK9IZegWdnCS1Y13uFbU4nxiL8F307fkqrL7VHhH2Nxr6n9UIuRz/JkbLCE7k4mp0PkF8g/6GnQ8kHkmdjmSeTIcYrZ+9qi8vjVYZnlWhxJcNJ+dZ5YYE4pS0oleO3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=QKEvRdM1; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="QKEvRdM1"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1895C1570;
	Mon, 14 Sep 2026 06:42:59 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 239B83F882;
	Mon, 14 Sep 2026 06:42:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789393382; bh=VsD3H2ySCWA+ttXwqRR44/yEVZBVYNu9HiXKcp4JU/I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QKEvRdM1KsJUIgRp2hAnY1MCgGM/jsC+08mreDLmTipFou8mjBZj9V/kx6bWzth3l
	 tuNqalyLN0cvWZ5wbjjg4t7KqBhT4908Ts+Tkbvtqy48J9zQGOpQbwVeRQIXszeC+r
	 lPDBN0rq3hBOLFndk/60GPy0jKdhx5mp3czuRW5I=
Date: Mon, 14 Sep 2026 14:42:51 +0100
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
	Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH v11 6/7] firmware: smccc: arm-cca-guest: Bind the TSM
 provider to an SMCCC device
Message-ID: <aqf524L399WhJ2XV@arm.com>
References: <20260914060511.277948-1-aneesh.kumar@kernel.org>
 <20260914060511.277948-7-aneesh.kumar@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914060511.277948-7-aneesh.kumar@kernel.org>

On Mon, Sep 14, 2026 at 11:35:10AM +0530, Aneesh Kumar K.V (Arm) wrote:
> The Arm CCA guest TSM provider currently binds through the arm-cca-dev
> platform device. Like arm-smccc-trng, this device is not an independent
> platform resource; it is a software representation of the RSI firmware
> service discovered through SMCCC.
> 
> Move RSI discovery into the SMCCC firmware driver. When the SMCCC conduit
> is SMC and if RSI ABI version call is supported, create an arm-rsi-dev

Nit: "arm-rsi". Or did you mean to actually user "arm-rsi-dev" below?

> SMCCC device. Convert the Arm CCA guest TSM provider to an SMCCC driver so
> it binds to that discovered RSI service and keeps module autoloading
> through the SMCCC device id table.
> 
> Keep the old arm-cca-dev platform-device registration for now. Userspace
> has used that device as a Realm-guest indicator, so removing it is left to
> a follow-up patch that adds a replacement sysfs ABI.
> 
> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
[...]
> @@ -94,6 +95,11 @@ static const struct smccc_device_info smccc_devices[] __initconst = {
>  		.requires_smc   = false,
>  		.device_name    = "arm-smccc-trng",
>  	},
> +	{
> +		.func_id        = SMC_RSI_ABI_VERSION,
> +		.requires_smc   = true,
> +		.device_name    = "arm-rsi",
> +	},
>  };

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
