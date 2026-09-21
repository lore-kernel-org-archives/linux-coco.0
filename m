Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35526453A3C
	for <linux-coco@lists.linux.dev>; Mon, 21 Sep 2026 08:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789980614; cv=none; b=dvTSjJM6ioyZrkn5KBxN7KqIbAAbKBJgN2+2ivZ6QB9GS0ZvE55FHW/2zNLjxlPxmmm7Gph9g4pFmVozzYXNMgwPed1pMCct6dB01XZD+hjzouj3RtqRPIxbtOB6aMlYJi+axjSm58nsCQ3j2/1V0QwA2qzIPdIeQGOg6rnuT9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789980614; c=relaxed/simple;
	bh=zkJ6zamsKffplX1HXtrc8mnFcQsdKLrkWao+Syhic58=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=troTTxvH//xeNlJKSopXw4XMdsyTbpENYsRRC8MeCN4ZtlqJr5DLJKeooqwIaXW1YHBZqocKC2L6WMtYJqhGCjB1rdrKNZ7rFqIuM9Spw54JQaf05UOHoharPnM74KekK+Kgkyo756acLx7p3You9rY2gsHEliBGAev73djbyws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=jvJSfPqL; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="jvJSfPqL"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 073EE175A;
	Mon, 21 Sep 2026 01:50:08 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 96CC53F86C;
	Mon, 21 Sep 2026 01:50:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789980611; bh=zkJ6zamsKffplX1HXtrc8mnFcQsdKLrkWao+Syhic58=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jvJSfPqLf3HN3z+KPhvue54b/EtRQfqDF2kHtGW67M77rt+wnCXhmkm/1WsNMtE07
	 o5+IdFoiz9kgEfxWcB6RLBl1iMrurkg7cBAfH033tNTteqbaTzvwE3HtiifRkMpNqv
	 mmQPzdSKn8FH5n6VbL2u7b7fWhFSRikwpoVVdsXs=
Date: Mon, 21 Sep 2026 09:50:06 +0100
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
	Andre Przywara <andre.przywara@arm.com>,
	Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Subject: Re: [PATCH v12 3/7] firmware: arm_rmm: Move RSI support out of
 arch/arm64
Message-ID: <arDvvvqkm0O4OSlP@arm.com>
References: <20260921053807.354802-1-aneesh.kumar@kernel.org>
 <20260921053807.354802-4-aneesh.kumar@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260921053807.354802-4-aneesh.kumar@kernel.org>

On Mon, Sep 21, 2026 at 11:08:03AM +0530, Aneesh Kumar K.V (Arm) wrote:
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
> Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
> Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Acked-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
> ---
>  MAINTAINERS                                   |  2 +
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
>  18 files changed, 110 insertions(+), 89 deletions(-)
>  delete mode 100644 arch/arm64/include/asm/rsi.h
>  create mode 100644 drivers/firmware/arm_rmm/Kconfig
>  create mode 100644 drivers/firmware/arm_rmm/Makefile
>  rename {arch/arm64/kernel => drivers/firmware/arm_rmm}/rsi.c (99%)
>  rename arch/arm64/include/asm/rsi_cmds.h => include/linux/arm-rsi-cmds.h (69%)
>  rename arch/arm64/include/asm/rsi_smc.h => include/linux/arm-smccc-rsi.h (98%)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 42364c540f50..b867d537a579 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3953,6 +3953,8 @@ F:	Documentation/arch/arm64/
>  F:	arch/arm64/
>  F:	drivers/virt/coco/arm-cca-guest/
>  F:	drivers/virt/coco/pkvm-guest/
> +F:	include/linux/arm-rsi-cmds.h
> +F:	include/linux/arm-smccc-rsi.h
>  F:	tools/testing/selftests/arm64/
>  X:	arch/arm64/boot/dts/
>  X:	arch/arm64/configs/defconfig

Does it need drivers/firmware/arm_rmm/ as well?

-- 
Catalin
