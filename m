Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF1064756BC;
	Thu,  3 Sep 2026 16:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788452303; cv=none; b=gW4GkOdbHHzIW8QTeNtc8c+yDf2lA4uusIpdCEVh3d3jJjhwKvL6Ux22EGon4ge4EhCQ2zJDgpk6CIHTzk5VvQ52BwtsTIhs7HzEdvio6IUlWGp9eJLSBwR1z/PSKzRAMqasLIph5X10WQlvb42J88iIsTHNdQr+ypNzZHWd024=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788452303; c=relaxed/simple;
	bh=kZxRDfKOOymBMs6vUXNLZ7kV/y3LDGCt3tyvW9Y7NCI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Nn/QYMF0vU6tkKiBA/wJnZd2kCDYmwTyKULkkAViWr0QJtwcnZGLJSYETk6yHqF/jkZEPumv4Tsq1wvOe9lcUprmj/k7JUAs3o4KvIcjaqi9eTQNuDnvghsT6lTiEVNRW84D+wLdcEvgymRh7j3SepeEquHCBwPunSTK2bDKRJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hapvbcE5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hapvbcE5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C657C1F000E9;
	Thu,  3 Sep 2026 16:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788452301;
	bh=wS7Gfn04Eu1i3oPxCjH/RuwxmV/hxIJiYf+5nVpOmkQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hapvbcE5miOohbPIaPHvti3o0SLfqrEn9kxtZccj3wcWKS1kvKmc6oQwLpiLCqXz3
	 ParsSYzjftg5iTJdFDi2+5VQ2tGstV8pP1ZfszpbY27+LJ1PI+Za0MQ5zFi/94eDFK
	 ZsFh6v0p4hRyU6SPNr2d8V+cbvJ3fLo97rbe8NL2FXIIqoR1JdkSSPfCr1+4S4nZWc
	 4Q69Zf1lPYbK1WftJZhLOALG0C280aEAojQrB6wR2dLKzbEcCaY0qPvx6CQy4ww3ks
	 x3RaSgQRBwsSmjYdnBDzthX473BkWwKzCkcclT1s/Xo7JgWuD791VCNosLoRDO8wX4
	 24bXiF+otOWPw==
Date: Thu, 3 Sep 2026 17:18:16 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	linux-coco@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Greg KH <gregkh@linuxfoundation.org>,
	Jeremy Linton <jeremy.linton@arm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>, Will Deacon <will@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH v9 1/7] firmware: smccc: Add an Arm SMCCC bus
Message-ID: <20260903-nonchalant-capable-parrot-539c8b@sudeepholla>
References: <20260805063255.1638614-1-aneesh.kumar@kernel.org>
 <20260805063255.1638614-2-aneesh.kumar@kernel.org>
 <178794567779.4159892.8785590655735217125.b4-review@b4>
 <yq5ay0diyavw.fsf@kernel.org>
 <20260903125718.GI4157646@nvidia.com>
 <yq5av78mxv0j.fsf@kernel.org>
 <20260903154626.GL4157646@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260903154626.GL4157646@nvidia.com>

On Thu, Sep 03, 2026 at 12:46:26PM -0300, Jason Gunthorpe wrote:
> On Thu, Sep 03, 2026 at 08:05:40PM +0530, Aneesh Kumar K.V wrote:
> > Jason Gunthorpe <jgg@nvidia.com> writes:
> > 
> > > On Thu, Sep 03, 2026 at 02:22:51PM +0530, Aneesh Kumar K.V wrote:
> > >
> > >> I have updated the bus to match devices using func_id.
> > >
> > > Did you have any thoughts on how to handle ARM's versioning scheme
> > > too?
> > >
> > > I'm not sure what the rules are but it seems like if the major changes
> > > then the API is incompatible? So shouldn't every driver advertise a
> > > supported major, and the major be in the modalias and checked by match
> > > too?
> > 
> > I expect a single driver to handle the RSI features and determine the
> > version range it supports. I don't think we want multiple drivers, each
> > handling a different major version of the RMM release. 
> 
> I thought the plan was we are only going to support RMM V2 and there
> will, never, ever be a V3. :) So RMM is maybe a bit different..
> 
> > Given that, wouldn't it be sufficient for the driver's probe routine
> > to check the supported version range and return -ENODEV if it is
> > unsupported?
> 
> It is sufficient, but is that what you want? Every driver needs to
> manually check these version things, do they? Do we want this
> duplication? 

Oh yes, we need this whatever you term as "duplication". I would argue
against terming it as duplications as if you look at the various SMCCC
based specification, we have zero consistency in how the VERSION command
is expected to work. The only consistency is returning
SMCCC_RET_NOT_SUPPORTED if not supported and that's the max a generic
SMCCC bus code can check. All other details need to be deferred to the
individual SMCCC drivers.

> Missing a check means FW upgrades might become Linux breaking.
> 

Are you referring to the SMCCC bus code or RSI in particular above. I don't
see any issue with SMCCC bus code check as that is the least we can do and
must not change with future versions of the firmware as well.


If it is specific to RSI and the driver supports v2.0 and the firmware
is upgraded to v3.0, it really depends on what the v3.0 firmware returns
in these 2 values:
Lower RsiInterfaceVersion : Lower supported interface revision
Higher RsiInterfaceVersion : Higher supported interface revision

If lower is also set at v3.0, then I would argue it is firmware upgrade
issue expecting old kernel with old RSI version supported to work. If
that returns v2.0, the driver must work IIUC. Aneesh, hopefully I got this
right ?

-- 
Regards,
Sudeep
