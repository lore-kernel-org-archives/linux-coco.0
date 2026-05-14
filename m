Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 992333B5F59
	for <linux-coco@lists.linux.dev>; Thu, 14 May 2026 13:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778764768; cv=none; b=BWAyZ7zCAckIjs9DcH1UlZvokycz2aJu3uOfJ7Puh+6dVlqd9QLS8q7xHvWF70cpdS+FpLMnCZC1ITHc4RLb4dgmW2mVm35YD/L1YjWcZBAcCqqGhjNvfY/TKCcGB6TB0ftCw2aNCPQyLPXv0z6nZ90BjkZJbJvgVUaH/OP3izc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778764768; c=relaxed/simple;
	bh=bvjSbqa0p7Z+uEjFQabmmM4Zir3KgH00PehO0lgDGIc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i1KueVcGBgCRPiVr4qryO0ghteABPA71NsiUd2SfPRejQkByEBsfpco4F6BpvI6waCUQXrOV0x1TZefr85EU2CkPkUmpHqNVXsE7P+viG+HibWzvh5PvW7ZDIXe6x/tVTanNoj55WtfdqgwbSZql48jhxUsX9WLJOz5eiFBDFM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=iETmPvYb; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="iETmPvYb"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 33BC81762;
	Thu, 14 May 2026 06:19:21 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C319B3F836;
	Thu, 14 May 2026 06:19:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778764766; bh=bvjSbqa0p7Z+uEjFQabmmM4Zir3KgH00PehO0lgDGIc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iETmPvYbqiV0N/aiYARhQek+UffSXn79zj5YA9WS4yD+yeXx4mAIhbQsUWLncIpPO
	 20U+Kp8leOgaC+F2cVwMzGr4bHbRjFUf19NWgMoCNYTq+zy9X8lSZliQTSgFNrca1Q
	 cJ3qx4wjhH0T/da+5ac8GRrbWLfexf3/a54Ynmbk=
Date: Thu, 14 May 2026 14:19:19 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	"Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
	linux-coco@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Jeremy Linton <jeremy.linton@arm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>, Will Deacon <will@kernel.org>,
	Steven Price <steven.price@arm.com>
Subject: Re: [PATCH v5 1/3] firmware: smccc: coco: Manage arm-smccc platform
 device and CCA auxiliary drivers
Message-ID: <agXL12bNh4gGyK1K@arm.com>
References: <20260514094030.42495-1-aneesh.kumar@kernel.org>
 <20260514094030.42495-2-aneesh.kumar@kernel.org>
 <0c88bcee-65b5-4328-87e6-e1c714c3d1ca@arm.com>
 <2026051420-amusement-drove-73e6@gregkh>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026051420-amusement-drove-73e6@gregkh>

On Thu, May 14, 2026 at 02:55:48PM +0200, Greg Kroah-Hartman wrote:
> On Thu, May 14, 2026 at 12:04:13PM +0100, Suzuki K Poulose wrote:
> > On 14/05/2026 10:40, Aneesh Kumar K.V (Arm) wrote:
> > > Make the SMCCC driver responsible for registering the arm-smccc platform
> > > device and after confirming the relevant SMCCC function IDs, create
> > > the arm_cca_guest auxiliary device.
> > > 
> > 
> > There are a few changes squashed in to this patch. Please could we
> > split the patch in the following order ?
> > 
> > 1. Add platform device for arm-smccc
> 
> Do not make any more "fake" platform devices please.
> 
> > 2. Move TRNG to Auxilliary Device - (Even though it is a later patch, move
> > it before the RSI changes)
> 
> No, move it to the faux api please.

So should we end up with:

  /sys/devices/faux/arm-smccc/
    smccc_trng/
    arm-rsi-dev/
      tsm/tsm0

  /sys/class/tsm/tsm0
    -> ../../devices/faux/arm-smccc/arm-rsi-dev/tsm/tsm0

  /sys/firmware/cca/
    realm_guest

-- 
Catalin
