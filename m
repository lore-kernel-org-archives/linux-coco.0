Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8D08402BAB;
	Wed, 16 Sep 2026 14:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789567810; cv=none; b=ALMcnrFh06o17z5rij05ij/0S3QBjAOG4ORJ2LXx95+GjxDEU5IAxolvc02TcDr2frT9sROoYVsZKQlygnfUnCY6CsMB8yhrSm2Bx9m9PJbAKDCt9BX2YcADzUIDRqSdE5ytz4pkXS+EmS1ut5sbsJHttF1KPtFvPKMfp2DoojI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789567810; c=relaxed/simple;
	bh=zke2Jbnju74YwXiS4owNn2TyZgM3iYNnDNS2JQ6KN64=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=UNscukxrRwxVSfgbrC4/Q9/9spjreaG25nBN/3fEksSOrT++V30v5sMzSWg8zciSn9gG2CgJ4ZIkV0F1LdiM5H077uN7+e/dUBYBScm4z067S37JvELHoCtYuxHR08Jbjy35/Evq7m0CmYN1VimfWRt88W2A58KVyyBAAMJctBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C5z2dP/s; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C5z2dP/s"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEC8D1F00899;
	Wed, 16 Sep 2026 14:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789567809;
	bh=9wkSkC3ghOPH7GbBKWRGiMYDHI1khZ1B7DAF4kPwM+Y=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=C5z2dP/s3qv/3Cdw4aENJeNEDMCznZMWR6yD4F70/z77sFaVzAYu6gL4DaE/I4Ab4
	 Fd8XrSowrTOxKVo1DQEgDfK1154oCdFWuars9hJY5LUiMsIvTGXe/4tzcLwf/Tfgtc
	 jEo942aygEPooDXWirDAtNGgUX+nYSMcdSDvme4G5wGKj/tUOlqS9Qp9cKICaFAkpI
	 BvVcCi8toeL4FmwJklDNGpuRypSaZfLrzNAH0FVoKfewx7rUTVguQ+ejAJMTWxoOMx
	 EJ7gnYJwrGjmKCJq59UQlAg43Wtn6bdAOGBPXz7kU3vipgB+YGbUA+9QA2m1iwSHeF
	 tKU9ynqkCWJ5w==
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
	Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH v11 7/7] coco: guest: arm64: Replace dummy CCA device
 with sysfs ABI
In-Reply-To: <aqp2DRInEhzpEqAc@arm.com>
References: <20260914060511.277948-1-aneesh.kumar@kernel.org>
 <20260914060511.277948-8-aneesh.kumar@kernel.org>
 <aqp2DRInEhzpEqAc@arm.com>
Date: Wed, 16 Sep 2026 19:39:59 +0530
Message-ID: <yq5ald911e4o.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Catalin Marinas <catalin.marinas@arm.com> writes:

> On Mon, Sep 14, 2026 at 11:35:11AM +0530, Aneesh Kumar K.V (Arm) wrote:
>> diff --git a/Documentation/ABI/testing/sysfs-firmware-cca b/Documentation/ABI/testing/sysfs-firmware-cca
>> new file mode 100644
>> index 000000000000..bf177d636b92
>> --- /dev/null
>> +++ b/Documentation/ABI/testing/sysfs-firmware-cca
>> @@ -0,0 +1,10 @@
>> +What:		/sys/firmware/cca/realm_guest
>> +Date:		May 2026
>> +Contact:	Linux ARM Kernel Mailing list <linux-arm-kernel@lists.infradead.org>
>> +Description:	Read-only. Indicates whether the kernel is running as an
>> +		Arm Confidential Compute Architecture (CCA) Realm guest.
>> +
>> +		The value is one of:
>> +
>> +		0: the kernel is not running as a Realm guest
>> +		1: the kernel is running as a Realm guest
>
> Does this file ever read as 0? It is created only if rsi_present and
> always reads as 1. That's fine by me but we shouldn't document 0 as a
> value. More like if present, it always reads 1 and RSI is present.
>

For now, that is correct. However, the two checks could diverge if Realm
guest support is enabled only after additional checks, such as version
compatibility.

In that case, is_realm_world() and static_branch_unlikely(&rsi_present)
could return different results.

I assume that any error when reading the file, including -ENOENT, can be
treated as indicating that the kernel is not running as a Realm guest.
Do we need to document that?

-aneesh
