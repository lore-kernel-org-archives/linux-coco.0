Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2257F383C64;
	Thu, 14 May 2026 12:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778763344; cv=none; b=Ukdy3o1KLXFtUOLkJTNblFnzY71QvHvcB7p6n+5nY85zqV150MC8tQf7RKfSgzSoL6aagN4zwYMzZpsDJun6EcXWqD4fPfCzoCXL9goaWvSCYm5OGBIuju86AuL1En+9sHUvqiTyBDcD7m3/E+2eO1TGVAmFli/XyMu41Ea+768=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778763344; c=relaxed/simple;
	bh=Nl6b59PjQMcous4ytyzR+wCAscn4OPey4CqOkKZOb1Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K+9Rud3SI7rFU79HJsDbrJwrk10S0+FiPX+OwRuYd+ex1p7/EZNiRi/v4dv80a34DmnBtuj12OBOKaAS5dk/P8iFKppOgFGIVccGO16t9NVdlzRtQoSbujDfvHlMc/IKZmI4KSqPUUv1qSPcKrVjust9DMPWJyMzGbY0/oIIMLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=G8o+16Uz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="G8o+16Uz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3695CC2BCB3;
	Thu, 14 May 2026 12:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1778763343;
	bh=Nl6b59PjQMcous4ytyzR+wCAscn4OPey4CqOkKZOb1Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G8o+16UzOUWzXizJawdPj1/3+yhKYAHdPQh77qYDhUGORdPPZHOgd0SDP2LNY0otn
	 pHpVNBTmgs4daXOu6UTG8ovzHsZiqwjwmNmx4VJcbl5aEtp+pGDd+d7h1HHuz3Cum1
	 Y0C/eCyZ+JWHWiaIICzaKOyxN0aZrMxHq2V8NgiI=
Date: Thu, 14 May 2026 14:55:48 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
	linux-coco@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jeremy Linton <jeremy.linton@arm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>, Will Deacon <will@kernel.org>,
	Steven Price <steven.price@arm.com>
Subject: Re: [PATCH v5 1/3] firmware: smccc: coco: Manage arm-smccc platform
 device and CCA auxiliary drivers
Message-ID: <2026051420-amusement-drove-73e6@gregkh>
References: <20260514094030.42495-1-aneesh.kumar@kernel.org>
 <20260514094030.42495-2-aneesh.kumar@kernel.org>
 <0c88bcee-65b5-4328-87e6-e1c714c3d1ca@arm.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0c88bcee-65b5-4328-87e6-e1c714c3d1ca@arm.com>

On Thu, May 14, 2026 at 12:04:13PM +0100, Suzuki K Poulose wrote:
> Hi Aneesh
> 
> On 14/05/2026 10:40, Aneesh Kumar K.V (Arm) wrote:
> > Make the SMCCC driver responsible for registering the arm-smccc platform
> > device and after confirming the relevant SMCCC function IDs, create
> > the arm_cca_guest auxiliary device.
> > 
> 
> There are a few changes squashed in to this patch. Please could we
> split the patch in the following order ?
> 
> 1. Add platform device for arm-smccc

Do not make any more "fake" platform devices please.

> 2. Move TRNG to Auxilliary Device - (Even though it is a later patch, move
> it before the RSI changes)

No, move it to the faux api please.

thanks,

greg k-h
