Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D48833E172F;
	Thu, 23 Jul 2026 07:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784793363; cv=none; b=sDs1wgQG/exm1Cm31Imenl2w0gJvwc5zqp9u8XRU5Y6dCU8nD0snSQIai3pesID+mm9Og8rS9MOTOuqmLjWaOehQ+0eNQVXpP7ZvhPByindNdnihilejRu1lp4Oz3o9aTYGzB1/TIZfeeSCo+Z44W+r6wjPpxljuSIh6Ey9k5cI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784793363; c=relaxed/simple;
	bh=WrPrN9cV2PmibleLWI7XuTVzlsJZ0VJtDkclEP6rqXQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=XII65gfYioNasOsr9aQcHmvvkbdkHupE45yKZb9j98TVyhX2PeSNQ7jJIVwMjSovdNxQU2Q06Nsb5A9pBbRPUz0Kd/n0kAmtKowVLDJR/5C/+mqp8fIVUDf4yZg0u+X1Po4/wu4/lON802BZIpOurLjFtKy1HDrLEh5q/XT+xQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lEqG26ST; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lEqG26ST"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 784001F000E9;
	Thu, 23 Jul 2026 07:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784793362;
	bh=WrPrN9cV2PmibleLWI7XuTVzlsJZ0VJtDkclEP6rqXQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=lEqG26STPwmO5CnbjQJ8E9MYTEoMF6Q0RlYzHX4Nl7lhQbyIPIujiRUHYQjir+d/r
	 B1mUvrIxbGAUNBfgR6NfnqRt4926ESZt3Qv/4JTDflifujpN+scI9OwAjAny/fumqq
	 j4EEZ/LU+loG0nI4gTL97ef1bUmhzwM5iK6p16Uj/Nf+/MIXuEIVh1TJSf02475CsX
	 IiKhOaANjC7IAD35rAXrpftJ6WMj661dSOdnuvU9fMhnFw8I+jsx76AZuguSSb/jjo
	 nrXiLZs8d9TUWYRfr5Vdy1XoEL/lxAM4RS4nzIwNdYLgMkE7uNtEuR8/Ekab8knrKy
	 7jSLQNu+2Z2xA==
X-Mailer: emacs 30.2 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: linux-coco@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Catalin Marinas <catalin.marinas@arm.com>,
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
Subject: Re: [PATCH v8 0/6] Switch Arm SMCCC firmware services to an SMCCC bus
In-Reply-To: <20260707081351.1680209-1-aneesh.kumar@kernel.org>
References: <20260707081351.1680209-1-aneesh.kumar@kernel.org>
Date: Thu, 23 Jul 2026 13:25:52 +0530
Message-ID: <yq5aik666sxj.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain


"Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org> writes:

> As discussed here:
> https://lore.kernel.org/all/20250728135216.48084-12-aneesh.kumar@kernel.org
>
> The earlier CCA guest support used an arm-cca-dev platform device as a pure
> software anchor for the TSM class device. That platform device did not
> correspond to a DT/ACPI described device, MMIO range, interrupt, or other
> platform resource; it existed only to make the CCA guest driver bind and to
> place the resulting TSM device in the driver model. The same pattern also
> exists for smccc_trng. Creating separate platform devices for such
> SMCCC-discovered features is misleading, because those features are not
> independent platform devices.
>
> This series adds an Arm SMCCC bus for services discovered through the SMCCC
> firmware interface. The bus provides SMCCC device and driver registration
> helpers, name-based matching, uevent modalias generation, and a sysfs modalias
> attribute. SMCCC service drivers can use MODULE_DEVICE_TABLE(arm_smccc, ...)
> to emit arm_smccc:<name> aliases, allowing userspace to autoload service
> drivers when the SMCCC core registers matching firmware-service devices.
>
> The series then moves SMCCC TRNG and the Arm CCA guest RSI service off the
> platform bus. When the SMCCC core discovers the corresponding firmware
> service, it registers an arm-smccc device for that service. The hwrng
> arm_smccc_trng driver and the Arm CCA guest TSM provider are converted to
> SMCCC drivers that bind to those discovered devices.
>
> The old arm-cca-dev platform device has also been used by userspace as a Realm
> guest indicator. Removing it without a replacement would leave userspace
> depending on an internal driver-binding device. This series therefore adds
> /sys/firmware/cca/realm_guest as a stable, architecture-provided ABI for
> detecting whether the kernel is running as an Arm CCA Realm guest, and then
> removes the dummy arm-cca-dev platform-device registration.
>


Hi Will and Catalin,

Gentle ping. Can this be picked up for the next merge window?

-aneesh
