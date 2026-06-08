Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 724B03B42F2;
	Mon,  8 Jun 2026 08:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780907964; cv=none; b=kAF4b4dQSK6OlzPiAKuRBilc/PiOgVFzkFVOCmkDnMdM6pYACwAPtJfgQH5txahJ7k3rQeh7H3CEySrlQohIo4mSOB4SplGyN2/W+DZfqf378SywbNTNUHJyK3FKKKrf+CnXBJ2AmrHB6bb0KqRdFwqLLwt+DwX7dRgOu7UClxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780907964; c=relaxed/simple;
	bh=XDwA+qy9w0N2kn9KpQET5+GYdml7xlKDalZ9ynF/kEU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a1XgJttor9EfLIs5pOaScH9CQWrMKfn7zT1OgeuDLEz4KfFZfPUnPH03L2qtLVSESAPlBLRwpSTpfJx8xYzAGQKbN7jxPEdjM+oDnFVL1DTwYTcxW2w9GLByovvN08k816Law2yEpcvvr9hlSRBq1XJ5VaitDvoV0harhMEfxTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MLHvzxjx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MLHvzxjx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 723D21F00898;
	Mon,  8 Jun 2026 08:39:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780907960;
	bh=pvf0tOC7mTFxwCrEWNHyHWtzHGoBY12hIxMDv76SqCk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MLHvzxjxOcnDaAI/0TCOB51+C97JsSw5I2CEfgADKLcil2Fj5Fy+qPueOBbFHc+nr
	 t//H9ANpp3pp7m2+z0ZbIMQaKEvApXQZ28OQa1dmAhwW5/GxSzc9bpNEo41Ol/WeSL
	 M0dbjy0ABgDSxjDPQIkzykZ8Dd6IhdUST5U95GN+auhn0wgDSwHE4MbtjbobdHEL8s
	 3cduGyoLkfr/BD4x+xgUPbkVBEh4TeUnCel2+8ebPdRAwCYF1R32XtrOWe3VI/Ss7j
	 n7a2a4n6MPU84h8grH02QuOaJ9kJ7mpmG/W43lZg7ixnaGMOMK3Jr8e9yxdq8IQx5n
	 0zEDsTi1XBwdw==
Date: Mon, 8 Jun 2026 09:39:16 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Cc: linux-coco@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Greg KH <gregkh@linuxfoundation.org>,
	Jeremy Linton <jeremy.linton@arm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>, Will Deacon <will@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>
Subject: Re: [PATCH v6 3/4] firmware: smccc: arm-cca-guest: Bind the TSM
 provider to an SMCCC device
Message-ID: <20260608-economic-lucky-phoenix-2eaeaa@sudeepholla>
References: <20260527100233.428018-1-aneesh.kumar@kernel.org>
 <20260527100233.428018-4-aneesh.kumar@kernel.org>
 <20260603-determined-bumblebee-of-promise-e633d6@sudeepholla>
 <yq5ase72qvwb.fsf@kernel.org>
 <20260604-juicy-daft-starling-3eec1f@sudeepholla>
 <yq5ao6hlzbpa.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <yq5ao6hlzbpa.fsf@kernel.org>

On Mon, Jun 08, 2026 at 01:49:13PM +0530, Aneesh Kumar K.V wrote:
> Sudeep Holla <sudeep.holla@kernel.org> writes:
> 
> > On Thu, Jun 04, 2026 at 06:56:28PM +0530, Aneesh Kumar K.V wrote:
> >> Sudeep Holla <sudeep.holla@kernel.org> writes:
> >> 
> >> ...
> >> 
> >> > +static const struct smccc_device_info smccc_devices[] __initconst = {
> >> > +       {
> >> > +               .func_id        = ARM_SMCCC_TRNG_VERSION,
> >> > +               .requires_smc   = false,
> >> > +               .min_return     = ARM_SMCCC_TRNG_MIN_VERSION,
> >> > +               .device_name    = "arm-smccc-trng",
> >> > +       },
> >> > +};
> >> > +
> >> > +static bool __init
> >> > +smccc_probe_smccc_device(const struct smccc_device_info *smccc_dev)
> >> > +{
> >> > +       struct arm_smccc_res res;
> >> > +       unsigned long ret;
> >> > +
> >> > +       if (!IS_ENABLED(CONFIG_ARM64))
> >> > +               return false;
> >> > +
> >> > +       if (smccc_conduit == SMCCC_CONDUIT_NONE)
> >> > +               return false;
> >> > +
> >> > +       if (smccc_dev->requires_smc && smccc_conduit != SMCCC_CONDUIT_SMC)
> >> > +               return false;
> >> > +
> >> > +       arm_smccc_1_1_invoke(smccc_dev->func_id, &res);
> >> > +       ret = res.a0;
> >> > +
> >> > +       if ((s32)ret < 0)
> >> > +               return false;
> >> > +
> >> > +       return ret >= smccc_dev->min_return;
> >> > +}
> >> > +
> >> >
> >> 
> >> I am not sure we want the check to be as simple as ret < 0. Some
> >> function IDs may return input errors based on the supplied arguments
> >> (for example, RMI_ERROR_INPUT). In those cases, we would likely want
> >> this to be handled via a callback.
> >> 
> >
> > As I mentioned in response to Suzuki, we can defer that to probe of
> > that device. If *_VERSION, succeeds SMCCC core can add that device and
> > leave the rest to the core keeping the core and bus layer simple IMO.
> >
> >> We also want to use conditional compilation for some function IDs.
> >> Given the callback approach and the #ifdefs, I wonder whether what we
> >> currently have is actually simpler and more flexible.”
> >> 
> >
> > I was trying to avoid conditional compilation altogether and hence the
> > reason for keeping it as simple as possible. Also IS_ENABLED(CONFIG_ARM64)
> > in above snippet must come as some condition to this generic probe.
> >
> > Adding any more logic or callback defeats the bus idea here if we need
> > to rely/depend on multiple conditional compilation or callbacks IMO.
> >
> > Let's find see if it can work with what we are adding now and may add in
> > near future and then decide.
> >
> 
> If we move all the conditional checks to the driver probe path, then I
> think this can work. Something like the below:
> 

Sounds good to me.

[...]

> We can also move arch/arm64/include/asm/rsi_smc.h to
> include/linux/arm-rsi-smccc.h. There was a suggestion to move these
> firmware interfaces out of architecture-specific code:
> 
> https://lore.kernel.org/all/agsNO9cc7H-b0H8L@willie-the-truck
>

Ah OK, sorry I had missed this.

-- 
Regards,
Sudeep
