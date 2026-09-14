Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBC5F446066
	for <linux-coco@lists.linux.dev>; Mon, 14 Sep 2026 13:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789391909; cv=none; b=g9IgUUXenP0pwpuBWGNMyUnhdwJAjRFHJJFyBe1xryCV+ajiWrRZMK9LhKlVCntwUGYsL4nSejDpBZaIDOBrNFRBcEev7UxASmhBDg5fRcpTL98yv/YZwqxQPidG9CHLhXEdV0dwByTIO2sFfX8l022toXoJxlcNjVPbMhms264=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789391909; c=relaxed/simple;
	bh=4fFSBQUmiQmXrYe1XA04TLaJwyz/YyMUQosBL+4T7Qk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ft7NutPJss758xoxI4Y+R0UbTSF87Hr/UifGrwZShJYij5RF3/XPJ6pqI6cMZqTMthRNBT/njaC7OYEqzPdIaMKxj7hc4ImtJl+Z5fOCtjM9IOqYgGh+kR7ujtB/xE4+k16Vik1SC7LW6Gma9HyBrgAs6nx///2WkZeWi5jvzzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Cd1LGj1/; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Cd1LGj1/"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 77D071576;
	Mon, 14 Sep 2026 06:18:23 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8721F3F59E;
	Mon, 14 Sep 2026 06:18:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789391907; bh=4fFSBQUmiQmXrYe1XA04TLaJwyz/YyMUQosBL+4T7Qk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Cd1LGj1/mJ4u+1418F6iLq38fn956rgDEzm4+0FMnSL3Bu+3xHQy/239mqTq0dLOP
	 kmRwuZN8+mzhQt7yFew5Xx3tEBNwknVxKOKb1VnOIWECWioIAaVpgwCk7CFUSXtKkp
	 9vSlYv4HgfIxWUS7qlNb2HRQTHJv+lS+FfQu/QFM=
Date: Mon, 14 Sep 2026 14:18:19 +0100
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
Message-ID: <aqf0G2j_t7wlW0DP@arm.com>
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

The patch looks alright but always wondered why this and the following
two patches are not first in the series. They look like some almost
independent cleanup randomly in the middle of the SMCCC bus series.

Otherwise,

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
