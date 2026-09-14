Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6348C4457CF
	for <linux-coco@lists.linux.dev>; Mon, 14 Sep 2026 13:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789393748; cv=none; b=jusqpJIIt60kgTg8jSxUKRwAn3v2gnLoAB75DFIBZjyUT3tcof8pOFgVARNaZZsj1p4q5gZb8hXre188i2SaOk4s+CTRA+wxQ0lcU7hrFC/BFVpf6RUhA4hvt2rxgRNzpgLRwzPvGByBixc23sWkO1yWhJCxSgdXH28QK0StVPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789393748; c=relaxed/simple;
	bh=yvGmcSwid2FCTbXP5Uf/xb5RvxMjo4RD4diMW2HJq/I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AH3DUidW0qhbR/vAUOd1U2JCfEeb6XZpMXUo76p5HEIFV9BWjRtgxru/xqW7WV6yEcA9ht3eY6a5kn98ufuE4YUaAA2td6kKJs3pe5m7ld/1ums24mDz56xVfePbwY+QWdiZcZpBcOp7xZwcHUDiiYoycNNSK5sVkzHCMJIFiUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=CA67/Kby; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="CA67/Kby"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2331B1570;
	Mon, 14 Sep 2026 06:49:02 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1FB7D3F882;
	Mon, 14 Sep 2026 06:49:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789393745; bh=yvGmcSwid2FCTbXP5Uf/xb5RvxMjo4RD4diMW2HJq/I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CA67/KbytAoqlBWscm0VmXJ9Jj8tm8EW8t7A73nylnoZl2hJBUQPBwpOl7PeH7Dpb
	 g1Ji2wSR+YOzc2jTe747Vti4pM3pvB2q3ErSh0WGMvDu1Gq3fDet6l7MQL+Eh6IbBJ
	 LyxZNAEvMN54N25TiURLa4b/ZSKlAUOu+eWeYZ/4=
Date: Mon, 14 Sep 2026 14:48:58 +0100
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
Subject: Re: [PATCH v11 7/7] coco: guest: arm64: Replace dummy CCA device
 with sysfs ABI
Message-ID: <aqf7Sr2VvzV3lLhN@arm.com>
References: <20260914060511.277948-1-aneesh.kumar@kernel.org>
 <20260914060511.277948-8-aneesh.kumar@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914060511.277948-8-aneesh.kumar@kernel.org>

On Mon, Sep 14, 2026 at 11:35:11AM +0530, Aneesh Kumar K.V (Arm) wrote:
> The SMCCC firmware driver now creates the arm-smccc platform device and

Nit: we now have devices on an arm_smccc bus, so this first line doesn't
make sense.

> instantiates the CCA RSI auxiliary devices once the RSI ABI is discovered.
> The arm64-specific arm-cca-dev platform device stub is therefore no longer
> needed.
> 
> However, userspace has used the arm-cca-dev platform device to detect Arm
> CCA Realm guests [1]. Removing it without a replacement would break that
> detection and would also leave userspace depending on kernel device-model
> details.

Well, removing it would break the ABI even if you replace it with
something else. But I think we agreed it wasn't great for systemd to
depend on the old interface either. Assuming systemd can be fixed (and
the fix backported) and no production deployments are affected, I'm fine
with this.

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
