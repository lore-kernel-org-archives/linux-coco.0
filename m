Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3032F4A2078
	for <linux-coco@lists.linux.dev>; Wed, 16 Sep 2026 10:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789556329; cv=none; b=gRLGdeAJ22MAkGHyFnjdumwIWEF3TAyk2fP5OOQC2AjS8x2BmwPojzJvW3Wo8OyzZreTSmsGoWhZRhS30qBMcFX2N5iuASRqFId5eRazbk4zYa/H92xnED57zUj2+sgI8cZUb3zq3RM+jJZv/OpiCm40tzarCJfx6fWr04zrcuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789556329; c=relaxed/simple;
	bh=rs65dkxVRVvkoJPhv7tZmzzSj/ofGnKQrGCYnHAnM9E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hxvsZq4dqS4hX3YHkSFekW3P06yLHLvYvVI8b4cB/6X5/NgV8dWTMRAeXF7vp3Rfg3BATzT/uxqoRcl9zI3JUcPw4nxbv7Dgy5is9LWoq+4LaVCkkMK+aAp2jRxeJlRA8c8Dsddi91ltIZ/0Lxl0J4hV936X+Milt+4N91B+7nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=fis+1+JJ; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="fis+1+JJ"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B3801152B;
	Wed, 16 Sep 2026 03:58:24 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7D3B63F882;
	Wed, 16 Sep 2026 03:58:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789556308; bh=rs65dkxVRVvkoJPhv7tZmzzSj/ofGnKQrGCYnHAnM9E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fis+1+JJyMW4AMTvO/ToOq+lYsaWLmQ6s07E78Lbew1eEs868a1RI0rp9PW45HSEj
	 BnTHhgCmo4BVpRE/BENBQFB3beJfqPIXiY46jiETGH5+lG9k8jNp0wOH3NQg5elPBf
	 esx1MgZ/2IntmRX9eJAMldpoCcTrL0+iWv7t8nyc=
Date: Wed, 16 Sep 2026 11:58:23 +0100
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
Subject: Re: [PATCH v11 3/7] firmware: arm_rmm: Move RSI support out of
 arch/arm64
Message-ID: <aqp2TzS5FAE9ixc8@arm.com>
References: <20260914060511.277948-1-aneesh.kumar@kernel.org>
 <20260914060511.277948-4-aneesh.kumar@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914060511.277948-4-aneesh.kumar@kernel.org>

On Mon, Sep 14, 2026 at 11:35:07AM +0530, Aneesh Kumar K.V (Arm) wrote:
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
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Acked-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
> ---
>  arch/arm64/Kconfig                            |  1 +
>  arch/arm64/include/asm/io.h                   |  2 +-
>  arch/arm64/include/asm/mem_encrypt.h          |  2 +-
>  arch/arm64/include/asm/pgtable-prot.h         |  2 +-
>  arch/arm64/include/asm/rsi.h                  | 70 -----------------
>  arch/arm64/kernel/Makefile                    |  2 +-
>  arch/arm64/kernel/setup.c                     |  2 +-
>  arch/arm64/mm/init.c                          |  3 +-
>  drivers/firmware/Kconfig                      |  1 +
>  drivers/firmware/Makefile                     |  1 +
>  drivers/firmware/arm_rmm/Kconfig              | 17 ++++
>  drivers/firmware/arm_rmm/Makefile             |  2 +
>  .../kernel => drivers/firmware/arm_rmm}/rsi.c |  2 +-
>  drivers/virt/coco/arm-cca-guest/Kconfig       |  2 +-
>  .../virt/coco/arm-cca-guest/arm-cca-guest.c   |  5 +-
>  .../linux/arm-rsi-cmds.h                      | 77 +++++++++++++++++--
>  .../linux/arm-smccc-rsi.h                     |  6 +-
>  17 files changed, 108 insertions(+), 89 deletions(-)
>  delete mode 100644 arch/arm64/include/asm/rsi.h
>  create mode 100644 drivers/firmware/arm_rmm/Kconfig
>  create mode 100644 drivers/firmware/arm_rmm/Makefile
>  rename {arch/arm64/kernel => drivers/firmware/arm_rmm}/rsi.c (99%)
>  rename arch/arm64/include/asm/rsi_cmds.h => include/linux/arm-rsi-cmds.h (69%)
>  rename arch/arm64/include/asm/rsi_smc.h => include/linux/arm-smccc-rsi.h (98%)

BTW, can you also add the new files under the ARM64 PORT in MAINTAINERS,
similar to arm-cca-guest?

Thanks.

-- 
Catalin
