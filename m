Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F45822068D;
	Thu, 14 May 2026 13:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778765130; cv=none; b=ERRKlh7XP61gjAJP4N+Gn62R1RhY99Ygg8nF+KSv/hFl/TADOYYv40+xElGfUyIGmBjd4M0i1iOxuAyfvRWeIZXzPINTd61k2BM2hy7IM0R6FM59Mmro4lVn7DYne0hR6bIeRa8+CurVXXOR2EvrPYBi/GjZtO1rA/ZjQWEVTIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778765130; c=relaxed/simple;
	bh=ulvgFg4I9zSaMwz7wledEYXjpK13Lp8Du0yVblLwaFs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kl89KeO8BqMPnkLIw2F9zsHfXKkCANqNmC6mCJsxzo8YixL3P9lUAd1ZV2OP9bvYlItebQg0hdWfBsLXVAw+XY9oV6BNnZiKnIGHQJwXfB63kq7sRsmEGP/7HpN+yXyIUGDCYSWNMVKvmhz2is7fcCjfXDbtuo1YH4ytCA/FjVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=sUDZdsT4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="sUDZdsT4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D5C9C2BCB3;
	Thu, 14 May 2026 13:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1778765129;
	bh=ulvgFg4I9zSaMwz7wledEYXjpK13Lp8Du0yVblLwaFs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sUDZdsT49F3H4o4qXneQukxv8TbyR0l2UU/Q12k2y3GXhcoX/xAy2MFgs0+wzmGaR
	 mwlITCJKMQFiuYiD7iq0yxCP7FyB40/uOHZnVQnBmEQi4CGDl8btVLja6XtI1zF/4j
	 fwEnt/y7j7cTfQth12a7q3sK6vK0tHDwLFGLNhfk=
Date: Thu, 14 May 2026 15:25:34 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Catalin Marinas <catalin.marinas@arm.com>
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
Message-ID: <2026051445-magician-coffee-962f@gregkh>
References: <20260514094030.42495-1-aneesh.kumar@kernel.org>
 <20260514094030.42495-2-aneesh.kumar@kernel.org>
 <0c88bcee-65b5-4328-87e6-e1c714c3d1ca@arm.com>
 <2026051420-amusement-drove-73e6@gregkh>
 <agXL12bNh4gGyK1K@arm.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <agXL12bNh4gGyK1K@arm.com>

On Thu, May 14, 2026 at 02:19:19PM +0100, Catalin Marinas wrote:
> On Thu, May 14, 2026 at 02:55:48PM +0200, Greg Kroah-Hartman wrote:
> > On Thu, May 14, 2026 at 12:04:13PM +0100, Suzuki K Poulose wrote:
> > > On 14/05/2026 10:40, Aneesh Kumar K.V (Arm) wrote:
> > > > Make the SMCCC driver responsible for registering the arm-smccc platform
> > > > device and after confirming the relevant SMCCC function IDs, create
> > > > the arm_cca_guest auxiliary device.
> > > > 
> > > 
> > > There are a few changes squashed in to this patch. Please could we
> > > split the patch in the following order ?
> > > 
> > > 1. Add platform device for arm-smccc
> > 
> > Do not make any more "fake" platform devices please.
> > 
> > > 2. Move TRNG to Auxilliary Device - (Even though it is a later patch, move
> > > it before the RSI changes)
> > 
> > No, move it to the faux api please.
> 
> So should we end up with:
> 
>   /sys/devices/faux/arm-smccc/
>     smccc_trng/
>     arm-rsi-dev/

What types are these child devices?  Also faux ones?

If so, great.

thanks,

greg k-h
