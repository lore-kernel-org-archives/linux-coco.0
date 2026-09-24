Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2873E47668C;
	Thu, 24 Sep 2026 12:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790252677; cv=none; b=GIIevhhLNSdM5bDqLABUBJF8DnSKiQLcRntus4qiOqtTkb1X8oyx8z5OSNME+BMwqpEsedGjOcK/ATyS3qndxk2DKuvOgQ28ndSPbk01D0u69FYWHn7rYFCflJX3k5ohyGxdln9Ydb0KFcCCQnqLlRnycYAWYt2DQJ2+IUVcXJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790252677; c=relaxed/simple;
	bh=u8L/wHYZdV1ODL+B/1Yw8lqj41fWrbXaEpaQ6Ne731w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IIazPvfl3o0sOuz93fB1QCtdD13SjSUTzAG3b+15daj4ju7lhu9+AU4STNAqrtfKK+A7oQZqTRZwQuTMuvqzTHSCpphYUBNKrntFxKJYZRtbbWe4m3YhYwYXt9kgeAVTpnuLzLoWLW0J4dBN5U9qQZLqWneU7NQ7GlAoK93RcTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I8Tw7qvK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I8Tw7qvK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77C2D1F000FF;
	Thu, 24 Sep 2026 12:24:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790252675;
	bh=BHmbp6LuwAwTPjNUtGfqxu+9wvUItFCwUEQ7i+tbARU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=I8Tw7qvKc3yKWkGEDuFrd0+CwiKanTeJPq0VvAsi8ZIrm/3/QqMwvhQzYoU2rMBnJ
	 kQcdT22h0tmLmcW9493F1QEwJWTZ6rMwfQvuSITjJ2W7GSu+Z4QyGlNNP8P3Hfhjvk
	 nsgusBQqUQaNKNV+PqQNbRSSC0KzmbBczR/J60etFZunQ4IY+jbBwz5CRil0l3EbLA
	 m+kkO3kmDwjO5GerIezK9/RjppbaNivGcns1D0dTWGmb+Zm2GTO9fCrdVaA9tYo8y6
	 2C7TPIeMterKjpQMWrIaKwJGFyKyA8b1IByUQLc6BwRXQyjjpIh6/Gae0emTAuccBQ
	 KLBlJXQA6KxQg==
Date: Thu, 24 Sep 2026 13:24:31 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
Cc: linux-coco@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Jason Gunthorpe <jgg@nvidia.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Greg KH <gregkh@linuxfoundation.org>,
	Jeremy Linton <jeremy.linton@arm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>, Will Deacon <will@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH v11 6/7] firmware: smccc: arm-cca-guest: Bind the TSM
 provider to an SMCCC device
Message-ID: <20260924-bustard-of-stimulating-promotion-2e6d7c@sudeepholla>
References: <20260914060511.277948-1-aneesh.kumar@kernel.org>
 <20260914060511.277948-7-aneesh.kumar@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914060511.277948-7-aneesh.kumar@kernel.org>

On Mon, Sep 14, 2026 at 11:35:10AM +0530, Aneesh Kumar K.V (Arm) wrote:
> The Arm CCA guest TSM provider currently binds through the arm-cca-dev
> platform device. Like arm-smccc-trng, this device is not an independent
> platform resource; it is a software representation of the RSI firmware
> service discovered through SMCCC.
> 
> Move RSI discovery into the SMCCC firmware driver. When the SMCCC conduit
> is SMC and if RSI ABI version call is supported, create an arm-rsi-dev
> SMCCC device. Convert the Arm CCA guest TSM provider to an SMCCC driver so
> it binds to that discovered RSI service and keeps module autoloading
> through the SMCCC device id table.
> 
> Keep the old arm-cca-dev platform-device registration for now. Userspace
> has used that device as a Realm-guest indicator, so removing it is left to
> a follow-up patch that adds a replacement sysfs ABI.
> 
> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
> ---

[...]

>  drivers/firmware/smccc/smccc.c          |  6 ++++

Reviewed-by: Sudeep Holla <sudeep.holla@kernel.org>

-- 
Regards,
Sudeep
