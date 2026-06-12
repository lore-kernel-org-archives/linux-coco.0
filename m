Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 802761E520A;
	Fri, 12 Jun 2026 05:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781243272; cv=none; b=l/9nQE3r6xQTvI/qSgYl08rNXKzpVLD3sLvbnzc3LABKQIguVC7w7888B1+td7dM3f1puTSfx5tBI04RL4QwD1/zF3FPIWkwI/C2jD8rZuP6lgQBTMS83ZZWuYFdKZyg5xCM92WXuMvC+ypoIj8HJYQ+Tr3GDoHiPHUAb9KD588=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781243272; c=relaxed/simple;
	bh=XYKsWWsqFy4l4/B2b56zYCNHb5yGJk0jql7C0abIfB0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=kzBCP3TfGO9T/t12q3ZoG7o4uTJhKwyKr9eUg3bfBF2PWWOUyDyDRteplSdE9vQu1peSiy1gTO5s/XgzLYqli2tElyfAbjDeGUfcOyTRn85hbECuO80kxBGRDSjricykoenL1KQ73+B1heb0oqt4XcS0yygh1vugaTMjopRhuTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=odveNjCW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="odveNjCW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D17C1F000E9;
	Fri, 12 Jun 2026 05:47:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781243271;
	bh=T6CW/TyuaOTIt8N9Wr1RAPau+TTLjC9WJdIFjMkQ+v8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=odveNjCW0ZUI3oR91Xs45hWmQe3TgzpFDHBuM+gaYk0atc3WPIepJviYEc9Syytjm
	 j5CcT3jV21LN8fwMAeMp56LuWvHyEXAdAzVlEw7flVhlIRtAixD/4DZuI3S4YqAYyJ
	 HonE/hhUUmupYNkAqtmpuAKaxlIIyqlrH/P94LvG2IInaQXwIoryWlmHMO67JDN6IC
	 o4cZAbfZkljfmod/p5dg/+rTvRuGnlbs01ARS4Zq/Z5KzpeD964UAiADXlzv5ja97A
	 x/B26s6guXNwtTF2wbYAnEkMDgYL8w1qUL0VPj4vgy/u4tp2rT9ZqttI108yN4g2Mt
	 Bp027WOzif6RA==
X-Mailer: emacs 30.2 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
	linux-coco@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
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
	Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH v7 5/6] firmware: smccc: arm-cca-guest: Bind the TSM
 provider to an SMCCC device
In-Reply-To: <b1d4b888-bdbe-4a45-8561-4f27e0e9a1de@arm.com>
References: <20260611130429.295516-1-aneesh.kumar@kernel.org>
 <20260611130429.295516-6-aneesh.kumar@kernel.org>
 <b1d4b888-bdbe-4a45-8561-4f27e0e9a1de@arm.com>
Date: Fri, 12 Jun 2026 11:17:43 +0530
Message-ID: <yq5a1pecmhs0.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Suzuki K Poulose <suzuki.poulose@arm.com> writes:

..

>> diff --git a/include/linux/arm-smccc-rsi.h b/include/linux/arm-smccc-rsi.h
>> index fddb77986f70..ae663aa8fd7f 100644
>> --- a/include/linux/arm-smccc-rsi.h
>> +++ b/include/linux/arm-smccc-rsi.h
>> @@ -8,6 +8,8 @@
>>   
>>   #include <linux/arm-smccc.h>
>>   
>> +#define RSI_DEV_NAME "arm-rsi-dev"
>
> This shouldn't be here ? This is not part of the SMCCC RSI standard, but
> a linux thing. May be in drivers/firmware/../rsi.h ?
>

The name is used by the Arm SMCCC firmware driver
(drivers/firmware/smccc/smccc.c) and the arm-cca-guest driver.

Since it is used by the Arm SMCCC firmware driver, I used the above
header. We do not currently have a generic placeholder for RSI/RMI
definitions under drivers/.

-aneesh
