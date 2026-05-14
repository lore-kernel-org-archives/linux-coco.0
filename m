Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61E1B388E6E;
	Thu, 14 May 2026 17:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778778889; cv=none; b=p6jrp//GOwjVAxI4+o5lT7AdJQ5xBmx2h7B9eGdZv4+kye4uulY5YYeIosAqZjSmXiADBpp6Izoqd8FbNWpzLwJykCDRd3AVRWAybQRimgJRx6QNim8T+49i6Vli5m3js6cOgz25kIkjpGxOGJyC3ibiJA+e1OwnlJ6S/e/tTQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778778889; c=relaxed/simple;
	bh=lnMo7v72zKFu0y5mB8UTk6zkeqM8ivoNe5mhWgmpWJc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XIgYzDggSpklzyqxMBrEUY/tyQrOSWs85Q+rszz4ckXJyKYsg8kNUxq/H5kCDWT/h9YiMZFUy0NGLqRnQbhckGbM5sJmr7JdAlwkpq9mw4YZGdzDbBB5rxsy9IknG4n0+OoEp7/m06WfXr9eOqjK6RWWD86KqZCrMBAxq3eO3qM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=T0VQQMoS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="T0VQQMoS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3129EC2BCB3;
	Thu, 14 May 2026 17:14:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1778778888;
	bh=lnMo7v72zKFu0y5mB8UTk6zkeqM8ivoNe5mhWgmpWJc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=T0VQQMoSq4qeiV+RKPVYcmqx/kdov6X/u7Zmn4OdaEJ+/hDjgWMZoieDA3RFytw9F
	 irelPH8A3CnpAnl3ZdvzhJo9klRwnWxvyq64BIBbJbzJd/YDYBo9FSjEsORKOMgXDj
	 gre+RlIDYWD5+RT7+NcLJuNxFpqBEbL+P8doJAvs=
Date: Thu, 14 May 2026 19:14:52 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, linux-coco@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jeremy Linton <jeremy.linton@arm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>, Will Deacon <will@kernel.org>,
	Steven Price <steven.price@arm.com>
Subject: Re: [PATCH v5 1/3] firmware: smccc: coco: Manage arm-smccc platform
 device and CCA auxiliary drivers
Message-ID: <2026051404-headboard-cabbage-e09a@gregkh>
References: <20260514094030.42495-1-aneesh.kumar@kernel.org>
 <20260514094030.42495-2-aneesh.kumar@kernel.org>
 <0c88bcee-65b5-4328-87e6-e1c714c3d1ca@arm.com>
 <2026051420-amusement-drove-73e6@gregkh>
 <yq5alddm5a6w.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <yq5alddm5a6w.fsf@kernel.org>

On Thu, May 14, 2026 at 08:07:27PM +0530, Aneesh Kumar K.V wrote:
> Greg KH <gregkh@linuxfoundation.org> writes:
> 
> > On Thu, May 14, 2026 at 12:04:13PM +0100, Suzuki K Poulose wrote:
> >> Hi Aneesh
> >> 
> >> On 14/05/2026 10:40, Aneesh Kumar K.V (Arm) wrote:
> >> > Make the SMCCC driver responsible for registering the arm-smccc platform
> >> > device and after confirming the relevant SMCCC function IDs, create
> >> > the arm_cca_guest auxiliary device.
> >> > 
> >> 
> >> There are a few changes squashed in to this patch. Please could we
> >> split the patch in the following order ?
> >> 
> >> 1. Add platform device for arm-smccc
> >
> > Do not make any more "fake" platform devices please.
> >
> >> 2. Move TRNG to Auxilliary Device - (Even though it is a later patch, move
> >> it before the RSI changes)
> >
> > No, move it to the faux api please.
> >
> 
> 
> Maybe I was not complete in my previous reply. I did not want to repeat
> the entire thread, so I quoted the lore link for more details.
> 
> 1. We have platform firmware-provided SMCCC interfaces. Based on the
> support/availability of these function IDs, we want to load multiple
> drivers.
> 2. This patch series adds a platform device to represent the
> firmware-provided SMCCC resource.
> 3. Different SMCCC ranges are now represented as auxiliary devices.
> 4. Different subsystems, such as TSM, can autoload their backend drivers
> based on the availability of these SMCCC ranges, which are now
> represented as auxiliary devices.
> 
> You had agreed to all of this in the previous discussion here:
> https://lore.kernel.org/all/2025101516-handbook-hyphen-62ec@gregkh

Then why did someone say "this is a fake platform device with no actual
resources"?  That's what I was triggering off of.

Again, if you have actual platform resources, GREAT, use a platform
device and aux.  If you do not, then do NOT use a platform device.

totally confused,

greg k-h
