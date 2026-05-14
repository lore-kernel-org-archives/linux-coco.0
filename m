Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0D8A34402B;
	Thu, 14 May 2026 17:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778778813; cv=none; b=GBLLfHq3xlXqm7qgiaupy/67Zq2PFiIbfGw/9plWDL/HK9hYUGCeZXe8gB2PIXWb8yzaZn5UtXEM+BpJ6DD3/f2Fk7ca8fPWiXtudVX4EJc5k1cvP/o9eaZ//zoW0CExQyFtHLeEIPV4y9BHnxpFJdzm2tZ9FdGsB4ri6wiLHa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778778813; c=relaxed/simple;
	bh=4SFmX1YtXXz3aM4O+Q9tESg2mKpFKq2RahfzT5+gf2o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HYx0qZtAVYOUiGIl2We14xj0xyAGJ+tyJQGDxjZ+xNCSl4v5j6IAiSEjTlV4bGyTQSrdJD6tO6GihQtV+pMrEbX/PlFKcs1d+KKvQC+X0UlNcJcqNjoluvP418D+CFOY6TGEpGa1k4DFYsx/GGklCd0g97OBHXLgWXpCb7CfQgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=oobo6iv9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="oobo6iv9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCC5AC2BCB3;
	Thu, 14 May 2026 17:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1778778812;
	bh=4SFmX1YtXXz3aM4O+Q9tESg2mKpFKq2RahfzT5+gf2o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oobo6iv9Xu3KUSPx5b1Hkkv9VFCWQhhlbx5n5ds2xPSXtJje7up252429U3YA8LN3
	 y1d02qRlasFusBlh/pwsLX84YNv31VxQFJW56TPOLHa60KsL0zI94uU1pok/CUUyvf
	 3qe5gtvX/D65+uQ2xScgXOHA+xjzYk/E8aCYnRzY=
Date: Thu, 14 May 2026 19:13:36 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	linux-coco@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Jeremy Linton <jeremy.linton@arm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>, Will Deacon <will@kernel.org>,
	Steven Price <steven.price@arm.com>
Subject: Re: [PATCH v5 1/3] firmware: smccc: coco: Manage arm-smccc platform
 device and CCA auxiliary drivers
Message-ID: <2026051451-comfort-museum-4d2a@gregkh>
References: <20260514094030.42495-1-aneesh.kumar@kernel.org>
 <20260514094030.42495-2-aneesh.kumar@kernel.org>
 <0c88bcee-65b5-4328-87e6-e1c714c3d1ca@arm.com>
 <2026051420-amusement-drove-73e6@gregkh>
 <agXL12bNh4gGyK1K@arm.com>
 <yq5ajyt65a5y.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <yq5ajyt65a5y.fsf@kernel.org>

On Thu, May 14, 2026 at 08:08:01PM +0530, Aneesh Kumar K.V wrote:
> Catalin Marinas <catalin.marinas@arm.com> writes:
> 
> > On Thu, May 14, 2026 at 02:55:48PM +0200, Greg Kroah-Hartman wrote:
> >> On Thu, May 14, 2026 at 12:04:13PM +0100, Suzuki K Poulose wrote:
> >> > On 14/05/2026 10:40, Aneesh Kumar K.V (Arm) wrote:
> >> > > Make the SMCCC driver responsible for registering the arm-smccc platform
> >> > > device and after confirming the relevant SMCCC function IDs, create
> >> > > the arm_cca_guest auxiliary device.
> >> > > 
> >> > 
> >> > There are a few changes squashed in to this patch. Please could we
> >> > split the patch in the following order ?
> >> > 
> >> > 1. Add platform device for arm-smccc
> >> 
> >> Do not make any more "fake" platform devices please.
> >> 
> >> > 2. Move TRNG to Auxilliary Device - (Even though it is a later patch, move
> >> > it before the RSI changes)
> >> 
> >> No, move it to the faux api please.
> >
> > So should we end up with:
> >
> >   /sys/devices/faux/arm-smccc/
> >     smccc_trng/
> >     arm-rsi-dev/
> >       tsm/tsm0
> >
> >   /sys/class/tsm/tsm0
> >     -> ../../devices/faux/arm-smccc/arm-rsi-dev/tsm/tsm0
> >
> >   /sys/firmware/cca/
> >     realm_guest
> 
> But we need the ability to autoload different TSM backend drivers based
> on the support/availability of these SMCCC function-id ranges. faux
> device don't support that.

If you really need to "autoload" things, then do it like any other
normal bus or class does this, and send the proper uevents as needed.
Don't abuse the auxbus code for this please!

thanks,

greg k-h
