Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4231933A6EB;
	Mon, 21 Sep 2026 09:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789981294; cv=none; b=GCEezqlEeaj3IQrQmqQaP9RprF1m792p/lCFEioUtqs7sQmVy9tda6C/Ea59tpy8+lkSU44w8EAild9pG7GeFxhMKQXWX95zDHOXLZ27kbGEcv+EWgcPIuZt6Su/ixf0CO8gy4eAnieHEc6PoKnGa3BxAXVca8cbCCd1ImdDmgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789981294; c=relaxed/simple;
	bh=Ie1mOH4+KopURAQkynVReYv74glgCETVQLn/XvA1oYE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=VJwqztSm52pqMBFzDQeC8VHT87o9ZQ+sm9bgr4OjfrHM5faB62Q6HY518I0WI+r9beEj55Ko17hhBM1aRW51y4Ezdo9fA3CIa9aa+QAm0HorVaZm3+DvkuOlSQJSwlKo53xVYpGvxjLPvBQS4+p5hrvp4PtePjNU5jAwl1CotX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Chhjx5IP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Chhjx5IP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D90091F000FF;
	Mon, 21 Sep 2026 09:01:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789981292;
	bh=/edLhwlXxK5WLjsufiNiRMm+DEeITmeYwM/BGG2po/Y=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=Chhjx5IPpvXRMaHsZG/SYYAZuH7PK7n2Ec/3Da0nuAZu2Bk861eWfapQfsfDdsl/7
	 rsyyZPgxGIf57xVvjWO+fVXbki6UkV55Fmn6mvwB4D9GANc4KKcR1h18C1/Uwrhg8n
	 3ZYxlX/sV4K72MH/TPfb7Rwkb2unicftgkfsccl/HFKx91WR+XbP2J0OP58zinaVnE
	 5r7eUrIN4ALdbOQBuqhLZWsfVvRBir7ZoN+3kPzIlXtrpekUxIdetWfpa+p0C1cm5W
	 /5dtahPFzZVR8zMWnY+OXQ6nYGcCJwMGjB6ZYhAqUQIkNlCmrN/UETOFx03GGlmWBz
	 MWSKb8uHoLXpw==
X-Mailer: emacs 31.1 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: linux-coco@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Jason Gunthorpe <jgg@nvidia.com>,
	Greg KH <gregkh@linuxfoundation.org>,
	Jeremy Linton <jeremy.linton@arm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Will Deacon <will@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Subject: Re: [PATCH v12 2/7] firmware: hwrng: arm_smccc_trng: Register as an
 SMCCC device
In-Reply-To: <arDuqtfrRcBmWRic@arm.com>
References: <20260921053807.354802-1-aneesh.kumar@kernel.org>
 <20260921053807.354802-3-aneesh.kumar@kernel.org>
 <arDuqtfrRcBmWRic@arm.com>
Date: Mon, 21 Sep 2026 14:31:24 +0530
Message-ID: <yq5acxu73rmj.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Catalin Marinas <catalin.marinas@arm.com> writes:

> On Mon, Sep 21, 2026 at 11:08:02AM +0530, Aneesh Kumar K.V (Arm) wrote:
>> The SMCCC TRNG interface is a firmware-provided SMCCC service rather than a
>> standalone platform device. Now that the SMCCC core has an SMCCC bus,
>> create an arm-smccc-trng device for the discovered TRNG service and convert
>> the hwrng driver to an SMCCC driver.
>> 
>> The SMCCC id table preserves module autoloading for systems where the TRNG
>> driver is built as a module.
>> 
>> The sysfs device path changes from the old smccc_trng platform-device path
>> to an arm-smccc device path. No known userspace dependency on the old path
>> was found; a Debian Code Search lookup for the existing platform-device
>> name/path did not find any users.
>> 
>> Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
>> Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
>> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
>> Tested-by: Andre Przywara <andre.przywara@arm.com>
>> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
>> ---
>>  arch/arm/include/asm/archrandom.h       |  2 +-
>>  arch/arm64/include/asm/archrandom.h     |  2 +-
>>  drivers/char/hw_random/arm_smccc_trng.c | 32 ++++++++-----
>>  drivers/firmware/smccc/smccc.c          | 62 +++++++++++++++++++++----
>>  4 files changed, 76 insertions(+), 22 deletions(-)
>
> I asked you two times already to cc the hw_random maintainers. Not
> adding them again but not merging this stuff without their ack either.
> So, up to you.
>

Sorry, I missed that. I'll repost and Cc the hw_random maintainers.

-aneesh
