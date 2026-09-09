Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E5433002B9;
	Wed,  9 Sep 2026 07:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788939448; cv=none; b=pVKRtyql9szJMxDljtgeMj5Yog7iKJE+AXmLnmFXLy+jZwJUPo60f7fTdTkwRkGDkANk3p23rb3SPJ2hx3elGPA5tFPObQOxy74Rdsn8gmGwNZUV2bf1RdMCt6+BZo1ot8oKn/OI0+oYIpaT9gkbEuNA1z8ZmUgiTKhYESaNN3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788939448; c=relaxed/simple;
	bh=bxG5XvvBVoxSF5m95QrKNdxwfBkN3HiM6ZmP7BIDYL0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=elEXhjwcsP6YXaH9EhfV/2+jtNSw4W5VG8FB8CJIZb5GV+zQWzeTm+g6C2PfvhrxqfVdjqDfiSM+PU9yjsuU7xef65ubLYbCQftX4oIMse9vxRxdKleA4xWb9Fae42bfaJ2Waa8/3xF0f+oxxOtIDazXfuAQl1OsY+LJoG+Ksu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Dl+hRUS7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Dl+hRUS7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E580A1F00A3F;
	Wed,  9 Sep 2026 07:37:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788939447;
	bh=U/QZJikpo5kZYaUKl+nXZK03zswjscmlVtD3BHEcVcQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=Dl+hRUS7EGUIOBSQVLZBfIfZurYDPsVL4Az7bRRfECr6kD5mpE6oUfbena6TSipgH
	 IILNxj5T8iND/m3lPyC1dVNo/vsed361q4LXmfL01jScxrnXhbl6SQ+b1hxUEwxPdU
	 xM8sLLyukLF1dLS3INT9077CdWagsWWS5RE5JR74VEDgvpKzPevSd9bp6Re9jv9cAY
	 esbfnCE9qIN8hd6A46n4Dv/gSB5mDs57hN4XRJyEa0kU0JjYcj+vkAwYDtbFcD3WrW
	 GtxRgz0G2EcBDcAVSWMmtGWLeXcQlHcY45EwszMtYzUZMjgnf0cZbCd72QEazjoS5B
	 /aa7vM9A9gXlw==
X-Mailer: emacs 31.1 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: linux-coco@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Greg KH <gregkh@linuxfoundation.org>,
	Jeremy Linton <jeremy.linton@arm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Will Deacon <will@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH v10 6/7] firmware: smccc: arm-cca-guest: Bind the TSM
 provider to an SMCCC device
In-Reply-To: <178855077571.693280.17942746234757215326.b4-review@b4>
References: <20260904095000.1184861-1-aneesh.kumar@kernel.org>
 <20260904095000.1184861-7-aneesh.kumar@kernel.org>
 <178855077571.693280.17942746234757215326.b4-review@b4>
Date: Wed, 09 Sep 2026 13:07:18 +0530
Message-ID: <yq5atsnyeuz5.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Jason Gunthorpe <jgg@nvidia.com> writes:

>> [ ... 42 lines skipped ... ]
>> @@ -94,6 +95,11 @@ static const struct smccc_device_info smccc_devices[] __initconst = {
>>  		.requires_smc   = false,
>>  		.device_name    = "arm-smccc-trng",
>>  	},
>> +	{
>> +		.func_id        = SMC_RSI_ABI_VERSION,
>> +		.requires_smc   = true,
>> +		.device_name    = "arm-rsi",
>> +	},
>>  };
>>  
>>  static bool __init smccc_probe_smccc_device(const struct smccc_device_info *smccc_dev)
>
>    [Severity: High]
>    When this new entry is probed by smccc_probe_smccc_device(), does
>    arm_smccc_1_1_invoke() pass uninitialized registers to the firmware?
>
>    Looking at smccc_probe_smccc_device() during system initialization:
>
>    drivers/firmware/smccc/smccc.c:smccc_probe_smccc_device() {
>        ...
> 	   arm_smccc_1_1_invoke(smccc_dev->func_id, &res);
>        ...
>    }
>
>    Since arm_smccc_1_1_invoke() is a variadic macro, providing only the func_id
>    leaves x1/r1 uninitialized in the SMC inline assembly.
>
>    For SMC_RSI_ABI_VERSION, the RMM uses x1 as the requested interface revision
>    to determine supported revisions.
>
>    Could this pass a garbage requested interface revision to the RMM,
>    potentially causing probe failures or returning an unsupported boundary?
>
>    Could this also leak kernel register state to EL2?
>
> Sashiko still has this to say, I think it should pass 0 as the x1
> 'requested version' instead of unpredictable garbage.
>

To handle 

> Could this also leak kernel register state to EL2?
>

Should we instead do

	arm_smccc_1_1_invoke(smccc_dev->func_id,
			     0, 0, 0, 0, 0, 0, 0, &res);
	ret = res.a0;

There is no standard defining how the various SMCCC VERSION calls are
expected to work. For example, ARM_SMCCC_TRNG_VERSION does not use x1,
while SMC_RSI_ABI_VERSION does. Another VERSION call could use both x1
and x2. The only consistent behavior is to return
SMCCC_RET_NOT_SUPPORTED when the SMCCC function ID is not supported.

-aneesh
