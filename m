Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A88E747DFB2;
	Thu,  4 Jun 2026 13:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780580755; cv=none; b=JnognLT4odyKAyDkHx24/uBFR1CTD1aMfyCwBnznRHaUye6CKZDiwGOo8XOixL8naJ+MHI4YBYOIPrrpuwLNxZOUjJ+4q/RSE65ng2+oIDOll2KYpawbByZBxN3A4HW7yO2h7MW3L+zlbACJeINEOL17Hn699WT1jZqYhmIyCwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780580755; c=relaxed/simple;
	bh=+xW7XNxkORNNJfXBlR932TqhN9Mz1MZF/VtVsRMfLcY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VuTR2z77EHhEPn7WkkGLo3BQ/aJa6v1mTdIU8UErcC6H0ytXluInsByAWwZ+3y3JCnk5vjZfF6PyLePOXTNvp+drTJ4akZcq/akxx14bm76N0d14iJqU3AHRpPlctky7EiuFlu1Do8v5xcKHDwAihd4g0PSQR1Qdu97xA+H6+kA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CS8HmWdr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CS8HmWdr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20B481F00899;
	Thu,  4 Jun 2026 13:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780580754;
	bh=bG6yD1DR2hEpGh8JtLgi0HKdEg4kb4ZJsmcgeqPHJnw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CS8HmWdr26RcdgrU/GyogvKbgS1oRujsoniyoTH9ATztks9rThxc+Qr4MLP139deS
	 xLxA+SNlv9l/h7DXJkcdMK+T9dovMpswgDvygmLKgFlRJjy51tW8sIKFqVJaNE6g4w
	 ySvi9ANEFpSS/YYmii9DfSr7kxblrs2uezW+maHKsZgRzw2weBk9NCEQ0qInyGI3to
	 QsnyZnSDRqNEtJmnE4tTnpGcziD2JwCAdeDMv3NNXbiGJpJWETYaGJ+EUmX0SasmGU
	 4JSh/sfl7JQpKlCkV9xb/GDeL3/B6R3NREuNEDzDiKCAcmy0yEHrTGEXtVA8uM1fip
	 NRVw9oMkFE0dw==
Date: Thu, 4 Jun 2026 14:45:49 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Cc: linux-coco@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Greg KH <gregkh@linuxfoundation.org>,
	Jeremy Linton <jeremy.linton@arm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>, Will Deacon <will@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>
Subject: Re: [PATCH v6 3/4] firmware: smccc: arm-cca-guest: Bind the TSM
 provider to an SMCCC device
Message-ID: <20260604-juicy-daft-starling-3eec1f@sudeepholla>
References: <20260527100233.428018-1-aneesh.kumar@kernel.org>
 <20260527100233.428018-4-aneesh.kumar@kernel.org>
 <20260603-determined-bumblebee-of-promise-e633d6@sudeepholla>
 <yq5ase72qvwb.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <yq5ase72qvwb.fsf@kernel.org>

On Thu, Jun 04, 2026 at 06:56:28PM +0530, Aneesh Kumar K.V wrote:
> Sudeep Holla <sudeep.holla@kernel.org> writes:
> 
> ...
> 
> > +static const struct smccc_device_info smccc_devices[] __initconst = {
> > +       {
> > +               .func_id        = ARM_SMCCC_TRNG_VERSION,
> > +               .requires_smc   = false,
> > +               .min_return     = ARM_SMCCC_TRNG_MIN_VERSION,
> > +               .device_name    = "arm-smccc-trng",
> > +       },
> > +};
> > +
> > +static bool __init
> > +smccc_probe_smccc_device(const struct smccc_device_info *smccc_dev)
> > +{
> > +       struct arm_smccc_res res;
> > +       unsigned long ret;
> > +
> > +       if (!IS_ENABLED(CONFIG_ARM64))
> > +               return false;
> > +
> > +       if (smccc_conduit == SMCCC_CONDUIT_NONE)
> > +               return false;
> > +
> > +       if (smccc_dev->requires_smc && smccc_conduit != SMCCC_CONDUIT_SMC)
> > +               return false;
> > +
> > +       arm_smccc_1_1_invoke(smccc_dev->func_id, &res);
> > +       ret = res.a0;
> > +
> > +       if ((s32)ret < 0)
> > +               return false;
> > +
> > +       return ret >= smccc_dev->min_return;
> > +}
> > +
> >
> 
> I am not sure we want the check to be as simple as ret < 0. Some
> function IDs may return input errors based on the supplied arguments
> (for example, RMI_ERROR_INPUT). In those cases, we would likely want
> this to be handled via a callback.
> 

As I mentioned in response to Suzuki, we can defer that to probe of
that device. If *_VERSION, succeeds SMCCC core can add that device and
leave the rest to the core keeping the core and bus layer simple IMO.

> We also want to use conditional compilation for some function IDs.
> Given the callback approach and the #ifdefs, I wonder whether what we
> currently have is actually simpler and more flexible.”
> 

I was trying to avoid conditional compilation altogether and hence the
reason for keeping it as simple as possible. Also IS_ENABLED(CONFIG_ARM64)
in above snippet must come as some condition to this generic probe.

Adding any more logic or callback defeats the bus idea here if we need
to rely/depend on multiple conditional compilation or callbacks IMO.

Let's find see if it can work with what we are adding now and may add in
near future and then decide.

-- 
Regards,
Sudeep
