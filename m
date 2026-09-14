Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1110C463B86
	for <linux-coco@lists.linux.dev>; Mon, 14 Sep 2026 13:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789392232; cv=none; b=XPhNcSNwKDEInyRuoDOGaQccrCc+qoNXtLhZtvFwGm+2dTot9sM+qXnJUoS0iOfljJ4eJCFreCLKtZcISVFOPDlLXicuAPAwyLI0Kd7vyf2HFmlXhqXKRMKojT0y63o4nmCgtq9WdhDWvunDdtxiSQ/e0KdiSsk12Vsao2hBWHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789392232; c=relaxed/simple;
	bh=Gbs1+PidVJW9zHKmZC4gQY3M0pzm0ZbJmUV6YmKXQgo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZFTle9uAKULiepcmCc1HCUwpf2LNrUHjXCOt5NprsNii+ZVG3AEatqTEfgz1RH64CRZ6Kb4iT20RiCJKB21alk/ehyCROP2YrmW9jnozJs5isOoZ/RSH4OgAEtpydRK786aNymp+nmctyFGBdYCv92HL8gbZwlyvBr0DIrapixY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Gn2byeU/; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Gn2byeU/"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D77481570;
	Mon, 14 Sep 2026 06:23:46 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 771FB3F59E;
	Mon, 14 Sep 2026 06:23:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789392230; bh=Gbs1+PidVJW9zHKmZC4gQY3M0pzm0ZbJmUV6YmKXQgo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Gn2byeU/T2kYgfVpU4sa9Gn31WdZeEKgKqCTZbOcnN83WrLhc0HhLnX1lUeZRQtqq
	 E/brqte8ZGowQTzJBcK6isRuY3nOADbnRrZ/+jQnuBiq/JaRocx6eMI1dXVeHJiPpr
	 7ypAgObUmwFBnapm0ayvweLmt3ZKRgiBfsHGKkZU=
Date: Mon, 14 Sep 2026 14:23:44 +0100
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
Subject: Re: [PATCH v11 5/7] virt: coco: arm-cca-guest: Rename TSM report
 source file
Message-ID: <aqf1YAlH4XIvIRSj@arm.com>
References: <20260914060511.277948-1-aneesh.kumar@kernel.org>
 <20260914060511.277948-6-aneesh.kumar@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914060511.277948-6-aneesh.kumar@kernel.org>

On Mon, Sep 14, 2026 at 11:35:09AM +0530, Aneesh Kumar K.V (Arm) wrote:
> The Arm CCA guest driver currently only implements TSM report support, but
> follow-up changes will add more TSM-related functionality to the same
> module.
> 
> Rename arm-cca-guest.c to main.c and build it as an object of the
> arm-cca-guest module. This leaves room for the module to grow additional
> source files.
> 
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
