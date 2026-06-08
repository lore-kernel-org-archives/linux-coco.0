Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAC3C358378;
	Mon,  8 Jun 2026 12:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780921966; cv=none; b=Ikb3zpjWJfOk1ZpRqS5zNDXkfGGH2sGN8RN7OEV0KI+pwX8VzDYta7jNtfPvr5Y253znZ2F4/je1+DneYJd3KcevYtjJwVOfkf16SShUFsLSCuRufw3+22aBNT58gzLlpM4MFBqySvuVvchv+1qDIFIR9wqUSDmFqFjjPtHgZVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780921966; c=relaxed/simple;
	bh=vDhxu5HkWpBZEwbZIF5tWBCIJXV1bqrgN0rx755Kwu4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cnx3uHl6/Ex7oLioTHTDK+FazT0k0V0/c94AKCQSAAA1UNRWmjaVc5Ep41nW5ZSjIMoZgZktd6lNYHrmeyngdhZlt3eaXk8hMPG9GF/sGpz59xrGG1WMDt18mqE+kxwe4xCw70eQr5N5j82PWGJkts1YogY65KfW8Dj5aNUozq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BuHvmcAk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BuHvmcAk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 787581F00893;
	Mon,  8 Jun 2026 12:32:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780921965;
	bh=BaD5dzE0XkKaVHaRfsV559bcL81Tx1hd4V5yWiB2MWI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BuHvmcAkpVGMkltyGW5aMyXfTrfPJA1k4i74plwI7JN1wJOeguiIw1CvPrqOhSDde
	 dHCyfG0M60CGjOsa7iMZ6TzPKuGb8UGDM0Z4ScrWHJXriCcH6wn6abMp4fDWh50xkD
	 Tv5NWdXMsHK2ye6j44vl+qkgNU4cUDGX8imV45eZPrfOmnQK4lkMVa/p9hMk+RNTDg
	 UpK6ulMISI4SVj2GVuJJZTALZQKzJmZIAS5Opzl7tEhVwVvK1yyFLYCffGChBOxYsN
	 JRUv/eci/eKuXmGfW9W4Fb+oRn1iu/CLpzVzHkRs72GKoSg5hLK01oJbp3iCX0Qu0a
	 q879RRED3Z4VA==
Date: Mon, 8 Jun 2026 13:32:41 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: linux-coco@lists.linux.dev, Sudeep Holla <sudeep.holla@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Greg KH <gregkh@linuxfoundation.org>,
	Jeremy Linton <jeremy.linton@arm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>, Will Deacon <will@kernel.org>,
	Steven Price <steven.price@arm.com>
Subject: Re: [PATCH v6 3/4] firmware: smccc: arm-cca-guest: Bind the TSM
 provider to an SMCCC device
Message-ID: <20260608-hot-fascinating-tortoise-cccc61@sudeepholla>
References: <20260527100233.428018-1-aneesh.kumar@kernel.org>
 <20260527100233.428018-4-aneesh.kumar@kernel.org>
 <20260603-determined-bumblebee-of-promise-e633d6@sudeepholla>
 <yq5ase72qvwb.fsf@kernel.org>
 <20260604-juicy-daft-starling-3eec1f@sudeepholla>
 <yq5ao6hlzbpa.fsf@kernel.org>
 <e0071e90-c2f5-4d15-b3c6-fe05bf1464e4@arm.com>
 <yq5aldcpz316.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <yq5aldcpz316.fsf@kernel.org>

On Mon, Jun 08, 2026 at 04:56:29PM +0530, Aneesh Kumar K.V wrote:
> Suzuki K Poulose <suzuki.poulose@arm.com> writes:
> 
> > On 08/06/2026 09:19, Aneesh Kumar K.V wrote:
> >> Sudeep Holla <sudeep.holla@kernel.org> writes:
> >> 
> >>> On Thu, Jun 04, 2026 at 06:56:28PM +0530, Aneesh Kumar K.V wrote:
> >>>> Sudeep Holla <sudeep.holla@kernel.org> writes:
> >>>>
> >>>> ...
> 
> ...
> 
> >>> I was trying to avoid conditional compilation altogether and hence the
> >>> reason for keeping it as simple as possible. Also IS_ENABLED(CONFIG_ARM64)
> >>> in above snippet must come as some condition to this generic probe.
> >>>
> >>> Adding any more logic or callback defeats the bus idea here if we need
> >>> to rely/depend on multiple conditional compilation or callbacks IMO.
> >>>
> >>> Let's find see if it can work with what we are adding now and may add in
> >>> near future and then decide.
> >>>
> >> 
> >> If we move all the conditional checks to the driver probe path, then I
> >> think this can work. Something like the below:
> >> 
> >> struct smccc_device_info {
> >> 	u32 func_id;
> >> 	bool requires_smc;
> >> 	const char *device_name;
> >> };
> >> 
> >> static const struct smccc_device_info smccc_devices[] __initconst = {
> >> 	{
> >> 		.func_id        = ARM_SMCCC_TRNG_VERSION,
> >> 		.requires_smc   = false,
> >> 		.device_name    = "arm-smccc-trng",
> >> 	},
> >> 
> >> 	{
> >> 		.func_id        = RSI_ABI_VERSION,
> >
> > Don't we need parameters passed to this (Requested Interface version for 
> > e.g.) ? See more below.
> >
> 
> The idea is that we only check whether the function ID is supported. All
> other conditional logic should be handled in the driver probe path, as
> demonstrated by the changes in drivers/char/hw_random/arm_smccc_trng.c.
> 

+1. Yes, we just want to know whether the firmware is aware of that feature
before creating the `smccc_device` for it. The device probe can then perform a
more thorough, feature-specific check to determine whether the device/feature
is usable.

That is the main idea behind the approach I suggested. Please let me know if
you still see any issues or think this may not work.

-- 
Regards,
Sudeep
