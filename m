Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 734B54C6D;
	Sat, 29 Aug 2026 05:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787983109; cv=none; b=T0QF27L1eIEUaF0CRNv6pQp7XIe4STrsLJa2EpWuJJ4S6IqhmZSkMFaugWtBm3Gva/y/rcNbV4HaMJl9FUADGCiJlQOHIiEhJ3R/IqAQdwrtU6vlnXAfblkXe5qVQueD743E+Lo+hqGdxTaqxRge545SxCet4OO/DUg5sBxxEKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787983109; c=relaxed/simple;
	bh=yjFsnsGM/joZbue18klTP0WJxnikjuFxSRnv6W9xMsg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=C3bfAwTXNa7k1A4hnC0dudn+cPvt94Fqj2sc9s+jbfo1QikNCziLGBxRp/cIztkhA893W/jG1ZYQvKTvEQlHY1ECiYWHYwFikDHk49hfvAHZ2nBYSS3gAXPATpmALnrjwLAEp2+VWzhRZy8HElLBU0R9cPklHMWv+mEfxXHt6ZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P6DfBeoR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P6DfBeoR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AB491F000E9;
	Sat, 29 Aug 2026 05:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787983108;
	bh=dkQIWOOSi9dZ5y0ttPxRnwaYK9TXWapOZX1UUbuCJaA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=P6DfBeoRGodPEVPTGXHpQLPo5+qSYlVpvByt0WAmHDa7xGmzwW8XdijVdUaKpisvR
	 BtpDH+snGhdGV7Dnq8/py0ERpsoWERnBogLU2PZAfjyAs1v+MYwYt8aCPkl+DmQfGr
	 YMYu1esguiJNg0/0AUc1/LxqA8Nzfi/zFq7gIoJA2phUcMfYQEGQ19+5aa4YOsmYA/
	 Pr21jz/qYDkOhgQQ/5o/EFMk1RLXK8bx0xHc2iIImp69sJRZ1eGAyGJowbi2VUoaje
	 jXXIIhY+opLNsBol1mq6HpDVHJ09Kg2o17Oi5R+/kZ0mGQpOksDbtoaX1L5NleXqQD
	 N1HiWIU4/ZDpQ==
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
Subject: Re: [PATCH v9 3/7] firmware: arm_rmm: Move RSI support out of
 arch/arm64
In-Reply-To: <178794567779.4159892.7755943757427570192.b4-review@b4>
References: <20260805063255.1638614-1-aneesh.kumar@kernel.org>
 <20260805063255.1638614-4-aneesh.kumar@kernel.org>
 <178794567779.4159892.7755943757427570192.b4-review@b4>
Date: Sat, 29 Aug 2026 11:28:19 +0530
Message-ID: <yq5aqzjhtqmc.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Jason Gunthorpe <jgg@nvidia.com> writes:

>> The RSI SMCCC function IDs describe a firmware ABI and are not arm64
>> architecture specific definitions. Follow-up changes need to use them from
>> non-arch code, including drivers/firmware/smccc and the Arm CCA guest
>> driver.
>> 
>> Move the complete Realm Service Interface (RSI) implementation from
>> arch/arm64 to drivers/firmware/arm_rmm. The RSI SMCCC definitions and
>> command helpers are also moved to include/linux so they can be shared by
>> architecture code and firmware or driver code. This also keeps the
>> firmware interface outside architecture code, as requested [1].
>> 
>> [1] https://lore.kernel.org/all/agsNO9cc7H-b0H8L@willie-the-truck
>> 
>> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
>
> The sashiko remarks don't look useful
>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
>
>> [ ... 321 lines skipped ... ]
>> -#include <asm/rsi_smc.h>
>> +#define RSI_PDEV_NAME "arm-cca-dev"
>
> This name shows up on the smccc bus as a device, '-dev' doesn't seem
> to make sense as a device name to me, I'd drop it.
>

I will drop the -dev from the name. The final name is "arm-rsi"

>
> And is this arm-cca or should it be called arm-rsi with a different SMCC device for
> arm-rmi ?
>

We do that in patch 6. This patch deals with only code movement.

+++ b/include/linux/arm-smccc-rsi.h
@@ -8,6 +8,8 @@

 #include <linux/arm-smccc.h>

+#define RSI_DEV_NAME "arm-rsi-dev"
+

-aneesh
