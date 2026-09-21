Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF9463546C6
	for <linux-coco@lists.linux.dev>; Mon, 21 Sep 2026 10:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789984817; cv=none; b=aZg+mVRDlg7wkm8T6st3CmAW6luz0FMYQchESR3UrqoEF7FoETYMmNAocfliv3staYG/wQYKA221X3ZtairbUvYkBmHUirCFkogEygRUwvB3K6C07mml8l1D2rHt8x1tYdvhNqNHYo6iSHsXrRkZcU3dA+8d43me5NXkV+iMvZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789984817; c=relaxed/simple;
	bh=KAHxQyCLffudv7kQ3tADcUX1WeHMPGpfPiNr5Zb4Uh8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cPXVr0pOC+o9sLjraNAhyBdDH6tN7N/XW64vBtTeHh6f6OP2kEy4Fn/VSrYCDXU3c63nsP7vJON7tHFPmp6aQaDr3Sn6AZ5b4UjgXi+bs2fIC+S7LE3I1GRakpcsHIswj1YDA9OqhiksMzvxJIv6PWvx0K4di/zBcyn2ged5qsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=XIoXtAaM; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="XIoXtAaM"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BD5B6153B;
	Mon, 21 Sep 2026 03:00:11 -0700 (PDT)
Received: from [10.0.128.141] (unknown [10.0.128.141])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id ED95B3F86F;
	Mon, 21 Sep 2026 03:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789984815; bh=KAHxQyCLffudv7kQ3tADcUX1WeHMPGpfPiNr5Zb4Uh8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=XIoXtAaMDOmRwnyu8sQf9DbMLWTCBU9V5oWmQUBvvcAE0iV7BleEDJn/HYfi8FPS4
	 WURSswpMLg10IEqSoRXoWQTAKT605tz3LQp9wSC1XsWgay3+UaMl75Zq22llLh57WA
	 qG+44nuymFX6VWTfsKEBT31BtsVckOC8JfB6jbVg=
Message-ID: <f927f542-cf96-4dd3-a4ec-94883ba10ce6@arm.com>
Date: Mon, 21 Sep 2026 11:00:11 +0100
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 4/7] arm64: realm: Move Realm memory encryption ops to
 RSI code
Content-Language: en-GB
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>
Cc: linux-coco@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Jason Gunthorpe <jgg@nvidia.com>,
 Greg KH <gregkh@linuxfoundation.org>, Jeremy Linton <jeremy.linton@arm.com>,
 Jonathan Cameron <jic23@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Sudeep Holla <sudeep.holla@arm.com>,
 Will Deacon <will@kernel.org>, Steven Price <steven.price@arm.com>,
 Andre Przywara <andre.przywara@arm.com>,
 Suzuki K Poulose <suzuki.poulose@ram.com>
References: <20260921053807.354802-1-aneesh.kumar@kernel.org>
 <20260921053807.354802-5-aneesh.kumar@kernel.org> <arDwTjQiqF6VZOau@arm.com>
 <yq5a5wzz3rfo.fsf@kernel.org>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <yq5a5wzz3rfo.fsf@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 21/09/2026 10:05, Aneesh Kumar K.V wrote:
> Catalin Marinas <catalin.marinas@arm.com> writes:
> 
>> On Mon, Sep 21, 2026 at 11:08:04AM +0530, Aneesh Kumar K.V (Arm) wrote:
>>> Realm memory encryption callbacks are CCA-specific. Keep the Realm callback
>>> registration with the RSI initialization code instead of pageattr.c, which
>>> only needs to provide the low-level page-attribute transition helper.
>>>
>>> Export __set_memory_enc_dec() within arm64 so the RSI code can wrap it with
>>> the Realm-specific encrypt/decrypt callbacks and warning policy.
>>>
>>> No functional changes in this patch.
>>>
>>> Reviewed-by: Suzuki K Poulose <suzuki.poulose@ram.com>
>>
>> Nit: Suzuki's still at arm ;)

;-)

>>
> 
> 
> Will fix. I copied it from:
> 
> https://lore.kernel.org/all/bb59b1e0-2550-4a9d-8738-a54e5f106f45@arm.com

Yikes, my bad.

for FWIW, I really meant :

Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>

