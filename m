Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 801B6372062
	for <linux-coco@lists.linux.dev>; Mon, 10 Aug 2026 10:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786356232; cv=none; b=URjNOwxyspWaA3Jz3jCn2z5HHcFvzctx4Ro818bIlXS5x8oPQ3qpyMmZFafnuEnRORdlU9UAv1+i6pDNg3NLuVMp3U92DtEoZ5r7kR/PuaNmipDj0XZLnn1+fYRGk13YHMKY9ALdVGcwXZuqRg/WfPlmpEP/GQz8GjVhfEOrBl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786356232; c=relaxed/simple;
	bh=F7OBCGqMFj3VcayDs0xRPYFqsQ8rcBMsUp03ZpbWg3Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tg7W/miZhEYJ2FcuC2G8avXhCtAk7t2tH+y61DBjDf6qgyvwhMrCA4yS3/OhEPMyPrJ2I+K9933xX4XS1ps3yfJ9953l2b4b8WmHZwM1T9D2oLmOp7tCpS3jSJhA31ZW1p1IhaBV3y8H/jSw2o30FacrqpuiBx3xbDT1Hvv/Ey0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=q5r8cxKI; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="q5r8cxKI"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F10DD14BF;
	Mon, 10 Aug 2026 03:03:44 -0700 (PDT)
Received: from [10.57.41.8] (unknown [10.57.41.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0E0783F86F;
	Mon, 10 Aug 2026 03:03:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786356228; bh=F7OBCGqMFj3VcayDs0xRPYFqsQ8rcBMsUp03ZpbWg3Y=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=q5r8cxKIlmQ7cZDZx5OxwonbcDEf0uVjhXJi6jScQGRLhtW5xZFkxX9naUOwUUo+Z
	 wvm64LLa5T0Tv6qvuwPn1Vq2Adg46HAHRKrntEdBObRAHaQXt00JX8x48GZkIaNPjp
	 Q7B25PJnURdVFPL0n0BhG8SzS0CkF7kjGnMO67kc=
Message-ID: <a43a83c4-26cc-449e-a1b4-1cdeff1d51d9@arm.com>
Date: Mon, 10 Aug 2026 11:03:41 +0100
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 3/7] firmware: arm_rmm: Move RSI support out of
 arch/arm64
Content-Language: en-GB
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
 linux-coco@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Catalin Marinas <catalin.marinas@arm.com>,
 Greg KH <gregkh@linuxfoundation.org>, Jeremy Linton <jeremy.linton@arm.com>,
 Jonathan Cameron <jic23@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Sudeep Holla <sudeep.holla@arm.com>,
 Will Deacon <will@kernel.org>, Steven Price <steven.price@arm.com>,
 Andre Przywara <andre.przywara@arm.com>
References: <20260805063255.1638614-1-aneesh.kumar@kernel.org>
 <20260805063255.1638614-4-aneesh.kumar@kernel.org>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20260805063255.1638614-4-aneesh.kumar@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05/08/2026 07:32, Aneesh Kumar K.V (Arm) wrote:
> The RSI SMCCC function IDs describe a firmware ABI and are not arm64
> architecture specific definitions. Follow-up changes need to use them from
> non-arch code, including drivers/firmware/smccc and the Arm CCA guest
> driver.
> 
> Move the complete Realm Service Interface (RSI) implementation from
> arch/arm64 to drivers/firmware/arm_rmm. The RSI SMCCC definitions and
> command helpers are also moved to include/linux so they can be shared by
> architecture code and firmware or driver code. This also keeps the
> firmware interface outside architecture code, as requested [1].
> 
> [1] https://lore.kernel.org/all/agsNO9cc7H-b0H8L@willie-the-truck
> 
> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
Acked-by: Suzuki K Poulose <suzuki.poulose@arm.com>

