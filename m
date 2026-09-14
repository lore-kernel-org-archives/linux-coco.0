Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E938A43A7F5
	for <linux-coco@lists.linux.dev>; Mon, 14 Sep 2026 14:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789397466; cv=none; b=shX8pvVATugJQG6qEKGSJiZgGORxwBUwBligGd5drC2cIQau3GQjCcGJFu34CnoNYPfzaD7WHXYZzVSfvOYFcfIUtb2WhNa6BKUyfWzbnGg8OuuQ51Abn2IYJdyt0fOtQqYbz9MswMHByivIMOwwkQib1Nxssuet6ZLm8RkkEzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789397466; c=relaxed/simple;
	bh=fDxs3RSMgLMHYM2xJnti/dp16e+QGBfMd1fd6wVbCsM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PQpBWO5HhpmgeIGrRyGzy3ueSaGiqhJ+/58nOPnFOZ3I6rS8OvQ5CCBC3w0qf8GT/lYpxjNRQ4pFM02TmoWLystzyPWZCQShHExhGjhYdCO0DL1Xeo1cTo1lDBbr7zUIyTYdbyBS8x1YMZvnYNSygur4YZGxTkx22iF2NMaVjB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Fq7v4RIB; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Fq7v4RIB"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ED021153B;
	Mon, 14 Sep 2026 07:50:51 -0700 (PDT)
Received: from [10.0.128.139] (unknown [10.0.128.139])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 646E33F9A2;
	Mon, 14 Sep 2026 07:50:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789397455; bh=fDxs3RSMgLMHYM2xJnti/dp16e+QGBfMd1fd6wVbCsM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Fq7v4RIBTyW6Flh4cvLImhdyoMuZXe+QwP6fHOBIcZXAcK1B74ZfU928xjBU/apV0
	 Y3AHQ1ZplqMPJqRTc8XUo+GxwnDEjFAJFtUG57N1UJHTV3vK30CYEyJCXP1QZKc9zz
	 k1RPSf9O1PwTqyptUlSYNVa34PEihESyl2auRgKU=
Message-ID: <db219147-e2b5-43ce-9e14-a01ca65c52c7@arm.com>
Date: Mon, 14 Sep 2026 15:50:51 +0100
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 4/7] arm64: realm: Move Realm memory encryption ops to
 RSI code
Content-Language: en-GB
To: Catalin Marinas <catalin.marinas@arm.com>,
 "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
Cc: linux-coco@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Jason Gunthorpe <jgg@nvidia.com>,
 Greg KH <gregkh@linuxfoundation.org>, Jeremy Linton <jeremy.linton@arm.com>,
 Jonathan Cameron <jic23@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Sudeep Holla <sudeep.holla@arm.com>,
 Will Deacon <will@kernel.org>, Steven Price <steven.price@arm.com>,
 Andre Przywara <andre.przywara@arm.com>
References: <20260914060511.277948-1-aneesh.kumar@kernel.org>
 <20260914060511.277948-5-aneesh.kumar@kernel.org> <aqf0lyf6dQRc4eDR@arm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <aqf0lyf6dQRc4eDR@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14/09/2026 14:20, Catalin Marinas wrote:
> On Mon, Sep 14, 2026 at 11:35:08AM +0530, Aneesh Kumar K.V (Arm) wrote:
>> Realm memory encryption callbacks are CCA-specific. Keep the Realm callback
>> registration with the RSI initialization code instead of pageattr.c, which
>> only needs to provide the low-level page-attribute transition helper.
>>
>> Export __set_memory_enc_dec() within arm64 so the RSI code can wrap it with
>> the Realm-specific encrypt/decrypt callbacks and warning policy.
> 
> Suzuki commented on v9 I think not to expose this function but I don't
> see a nice way around since we now moved the realm_crypt_ops out of
> pageattr.c (so we'd have to export something out of that file).

Yep, you are right. Thats the conclusion we reached to.

> 
> Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

Thanks
Suzuki

