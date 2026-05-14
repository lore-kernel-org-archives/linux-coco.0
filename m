Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 306D8389108
	for <linux-coco@lists.linux.dev>; Thu, 14 May 2026 17:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778778620; cv=none; b=aGAKe/zAvqD/Nvq9MzDQ/qimYEfDRxvqQpMVe7fJH9BJpEqmO9YumC01B+Dh0nLUZqapPW9sIjI+zthCiICZTpZhm1wYAvNAoATjNVqYXXHSf+v/Ds834ac36iDf/3X/sHHbGE7oiYCkBIiTbfbU91Fn1ZLXa/52w4PuyvDOEWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778778620; c=relaxed/simple;
	bh=QIcPCYJhXPs7IX6f0RotHqQm1SVDBkwqA4iJRWyzoSw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LJtNPyafFAw6Na8wEazt61lROeHAQvO+xM59xZj/bYL+l/HQxRCGhLys2u+U3mD4ZPREQ+DVR4JG1GYz8cKgRypUQG2qZ5yZTO533l3cpauyxAJOS9lL1qqo3vH7M4+lrqXMq5IOhJPGpu1OirmDnZekdsZKNQLlrLAnDYQNmWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=rylaXg6T; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="rylaXg6T"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A320D25DE;
	Thu, 14 May 2026 10:10:11 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DC6C63F836;
	Thu, 14 May 2026 10:10:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778778616; bh=QIcPCYJhXPs7IX6f0RotHqQm1SVDBkwqA4iJRWyzoSw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rylaXg6T4uAIfiR56zy6O5kwO5eSAcqXi3RA1utMgYam8saAff4YcZFSiSdBoDE6j
	 JHybvRSTp8NUjMkGcHL6uOPDNxE4hjMiszHM7uLsJoXHJ7PesrwH8dm53f9Tl1k6tp
	 R2o33YfHX2KIG3I+fGGySHH6BPvrIFNw1WiGhFbY=
Date: Thu, 14 May 2026 18:10:09 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Cc: Greg KH <gregkh@linuxfoundation.org>,
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
Message-ID: <agYB8SZUlfXpjkgF@arm.com>
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

It breaks this but can we not have some systemd rule that checks
/sys/firmware/cca/realm_guest and modprobes arm_cca_guest?

Alternatively, we could do a request_module("arm_cca_guest") if
RSI is available when we check it in smccc_devices_init(). Or make it
even fancier with a request_module("arm-smccc-service-...") (some ID
range while arm-cca-guest.c has a corresponding MODULE_ALIAS() for that
SMCCC range.

-- 
Catalin
