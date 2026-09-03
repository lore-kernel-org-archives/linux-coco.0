Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BE984B2CDE;
	Thu,  3 Sep 2026 14:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788444846; cv=none; b=iJHvNUQw2zuoIVpNIA5+Lce9YGKKAUBz66rnxlHdrt7rSumFtGN0FpxqvPyHB3jFub91cVxetjcg1FLpzQdEy/jmKK1rh//OCh7fPa+TcbjZVE2zOFKzClDv+A3GsymO/zH4lMWbj9Eb8FWL+PLlZIoI08O6sVMLPrzqsi6cJfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788444846; c=relaxed/simple;
	bh=6ycPb0MDs+0BC6sS5YbYZNBMPwbVziAJpVdopwJpy70=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uyKnXaMadgRexOI8Nupteem2uBnXqRU2Tnn1jJnrtDiPoGTDKpD0ce52UIuhWC2ICZ0wgB3vsV92OtmEFgKuyPnlyQ7XM6vAJEfhYCa8EehcLCMqiiQYPhaaIiG2T0JPyoaIadknHDvJDfV6SPghkBJpg+e/v6lZ9uJd6RNeNJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gpG5mfyH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gpG5mfyH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A5211F00A3A;
	Thu,  3 Sep 2026 14:13:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788444830;
	bh=8X9GwG70UHNRj33Xkhsz17g3PyiEIZVcdUidNwrtGYA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gpG5mfyH6G7y3dW3qwtCJq/N6sA2Wh378+wkUXiHC+B58GxdCkEbH4SJ5uMPBU2Kr
	 A7mXBWYFlJWsTak8dnr2iroIZnRwK1a2ntHKCCMF+73bsiU5WGfUMIl2NT2DrdawTz
	 mz6s7CqKO5DvHpphXyGYkcXrRFuY9C0BdcaZMjT1qokTbYnbFMpwpecwBoKQadXxqp
	 jVUfyLfWhMAS6jr9p0waXe3CJMwk6UQN7q1BX1dKFjTwF1rHcv6MXfsAyrE6a1Qhkv
	 /uNi6OA1V53au6xKA7w/KOdM2QXTICKocfQatkHC0U8aLXOhNAk6dtPSNPkECbfDmc
	 8RKw2gJX3t42g==
Date: Thu, 3 Sep 2026 15:13:45 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	linux-coco@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Greg KH <gregkh@linuxfoundation.org>,
	Jeremy Linton <jeremy.linton@arm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>, Will Deacon <will@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH v9 1/7] firmware: smccc: Add an Arm SMCCC bus
Message-ID: <20260903-pistachio-tiger-of-sufficiency-eaadcf@sudeepholla>
References: <20260805063255.1638614-1-aneesh.kumar@kernel.org>
 <20260805063255.1638614-2-aneesh.kumar@kernel.org>
 <178794567779.4159892.8785590655735217125.b4-review@b4>
 <yq5ay0diyavw.fsf@kernel.org>
 <20260903125718.GI4157646@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260903125718.GI4157646@nvidia.com>

On Thu, Sep 03, 2026 at 09:57:18AM -0300, Jason Gunthorpe wrote:
> On Thu, Sep 03, 2026 at 02:22:51PM +0530, Aneesh Kumar K.V wrote:
> 
> > I have updated the bus to match devices using func_id.
> 
> Did you have any thoughts on how to handle ARM's versioning scheme
> too?
> 
> I'm not sure what the rules are but it seems like if the major changes
> then the API is incompatible? So shouldn't every driver advertise a
> supported major, and the major be in the modalias and checked by match
> too?
> 

Just curious as how this should work with any v1.x firmwares in the wild
once the driver updates the supported major version to say v2.0

Is there a way to set the supported major version in the driver via
some module parameter that the old systems then can make use of. Just
random thoughts/queries to understand how they all fit it eventually for
the wild variety of f/w we need to support irrespective of what is the
supported max major version the driver advertises.

-- 
Regards,
Sudeep
