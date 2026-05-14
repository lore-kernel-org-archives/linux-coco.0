Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9BDF3E5A38
	for <linux-coco@lists.linux.dev>; Thu, 14 May 2026 13:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778766383; cv=none; b=C/4ldTEsWdCForNL/eSH7KyENgtJFex8hVoGxI14+3ilAwIpmtBXW5Fl271OVrWexLSklmKjC2gwtuGX0tjZBphqJY2FgR+NhlauReCRNk4AWkSRTYGCz3c5Oej0zjKPyPaHmFIZ9cL7WuekInC2maK8Ql10reU0kZKpFeOpl+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778766383; c=relaxed/simple;
	bh=reoFd3yclIQ8pFpoHoR4amGrcWXsKilD0ZgHr9xDQ1c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vr2AvfMzzDFL5AtrGNhStugXhInT7+n8UYZiyp7CurYGsd2qRGYbVFV8S+/706cdLnIh4xAS1dS7k7TQtOdfVgoXmMu9QC865aDm/YTxbrf+iu+n1AUreETrtSxey/d9oiDf4bORYqSLOW1REU3RjtDtsSfQmYpp8t1N30tneEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=IlCsoipm; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="IlCsoipm"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2BFAC165C;
	Thu, 14 May 2026 06:46:11 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5C6FA3F836;
	Thu, 14 May 2026 06:46:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778766376; bh=reoFd3yclIQ8pFpoHoR4amGrcWXsKilD0ZgHr9xDQ1c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IlCsoipmG27OHXyO2x7Mahc0teRGc+fOKzg0ernwpeFsMZVVaAm1SAcl+RJ062da6
	 h+YzhATcW2o4K3k1yzLyfYr/ty+8HZhVgVJhFnMhnFQ1v0snWbgUmKdk0gxQSL2yHK
	 Kh5K6ajqyzwLOfOC0sQakjpIn3XzbDobP3TRkQA4=
Date: Thu, 14 May 2026 14:46:11 +0100
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
Message-ID: <agXSI6PPf4uR7VBL@arm.com>
References: <20260514094030.42495-1-aneesh.kumar@kernel.org>
 <20260514094030.42495-2-aneesh.kumar@kernel.org>
 <0c88bcee-65b5-4328-87e6-e1c714c3d1ca@arm.com>
 <2026051420-amusement-drove-73e6@gregkh>
 <agXL12bNh4gGyK1K@arm.com>
 <2026051445-magician-coffee-962f@gregkh>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026051445-magician-coffee-962f@gregkh>

On Thu, May 14, 2026 at 03:25:34PM +0200, Greg Kroah-Hartman wrote:
> On Thu, May 14, 2026 at 02:19:19PM +0100, Catalin Marinas wrote:
> > On Thu, May 14, 2026 at 02:55:48PM +0200, Greg Kroah-Hartman wrote:
> > > On Thu, May 14, 2026 at 12:04:13PM +0100, Suzuki K Poulose wrote:
> > > > On 14/05/2026 10:40, Aneesh Kumar K.V (Arm) wrote:
> > > > > Make the SMCCC driver responsible for registering the arm-smccc platform
> > > > > device and after confirming the relevant SMCCC function IDs, create
> > > > > the arm_cca_guest auxiliary device.
> > > > > 
> > > > 
> > > > There are a few changes squashed in to this patch. Please could we
> > > > split the patch in the following order ?
> > > > 
> > > > 1. Add platform device for arm-smccc
> > > 
> > > Do not make any more "fake" platform devices please.
> > > 
> > > > 2. Move TRNG to Auxilliary Device - (Even though it is a later patch, move
> > > > it before the RSI changes)
> > > 
> > > No, move it to the faux api please.
> > 
> > So should we end up with:
> > 
> >   /sys/devices/faux/arm-smccc/
> >     smccc_trng/
> >     arm-rsi-dev/
> 
> What types are these child devices?  Also faux ones?

They'd also be faux devices with this structure (in practice they are
firmware interfaces that may be backed by some hardware like in the TRNG
case, though not directly accessible to Linux).

-- 
Catalin
