Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3E3034A3A5;
	Fri,  4 Sep 2026 05:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788501022; cv=none; b=kaWHwIsKym4RlCk4ayLPuH4U46d+T0j9RBL0o82cY51sKyJoookbMcJI+j2LRCGlRO3Fm9o7WGaFYoMU4rSUN7hTNx5nSEwZIzAz4h/N+Pur0N+jRZIhG32QDmDTcTJcDz4RM8i2ptI4voMBHlw05CWVvJ6fTVcFhIzHg2qzVdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788501022; c=relaxed/simple;
	bh=zfk5xDIGhYK/v2UIi7NViq34syhb4JtY5V4d8Db9nN4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=EdVEYNw+meIv44M7FXB6gg7mV0iv0lk7RYoog644Eh6Dz3PFU45cSwOdcItZbiKsRI8HSVxvIS0nc2pc8HuEeAm1CpilF9FApE5Xavk6NO/SeeyfWdPzeQ13f8OTPZBOFHzkg4qxCeKPirQvYXkV8SGwRNnL/keKDIzGKY8pFVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XtJFt5QF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XtJFt5QF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A7301F00A3D;
	Fri,  4 Sep 2026 05:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788501021;
	bh=yB4YVspeMwk5ODtt2RBRRIPWz9juTE1sf3B03/H5mtM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=XtJFt5QFVxE1zso0J5EkYlk8qd97baPmE6jweS96sWdeGCMMMbvFLsYx+3j+JsOS9
	 9BOMeWFyxqIbFnrrq4qeenzwt7dOnYolWd6oMywsGmmUC3k+bbIhXK1FW8jKxhjMQ5
	 WEciqsGrP9CozS/IhTb92INUxZvzsnUsj9KlkTaTzH2ijGNjURdQ0GsYkdwHuwqKYT
	 9XcJ/BtjZWpAegLhbu2RXjylkAFswPlcxOvrGlKRonkkCl5JIl96S9xHajuq8cRqir
	 dN3/ogc6Dgt03dUnL6j3z4upeJ7/4YlN6oAyoenbVn09NizgTmss/E3KCf3V/ivN9v
	 v5W6sOXwH0cPQ==
X-Mailer: emacs 31.1 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: Jason Gunthorpe <jgg@nvidia.com>,
	Sudeep Holla <sudeep.holla@kernel.org>
Cc: linux-coco@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Greg KH <gregkh@linuxfoundation.org>,
	Jeremy Linton <jeremy.linton@arm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Will Deacon <will@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH v9 1/7] firmware: smccc: Add an Arm SMCCC bus
In-Reply-To: <20260903182152.GN4157646@nvidia.com>
References: <20260805063255.1638614-1-aneesh.kumar@kernel.org>
 <20260805063255.1638614-2-aneesh.kumar@kernel.org>
 <178794567779.4159892.8785590655735217125.b4-review@b4>
 <yq5ay0diyavw.fsf@kernel.org> <20260903125718.GI4157646@nvidia.com>
 <yq5av78mxv0j.fsf@kernel.org> <20260903154626.GL4157646@nvidia.com>
 <20260903-nonchalant-capable-parrot-539c8b@sudeepholla>
 <20260903182152.GN4157646@nvidia.com>
Date: Fri, 04 Sep 2026 11:20:13 +0530
Message-ID: <yq5ase3py38q.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Jason Gunthorpe <jgg@nvidia.com> writes:

> On Thu, Sep 03, 2026 at 05:18:16PM +0100, Sudeep Holla wrote:
>
>> Oh yes, we need this whatever you term as "duplication". I would argue
>> against terming it as duplications as if you look at the various SMCCC
>> based specification, we have zero consistency in how the VERSION command
>> is expected to work.
>
> Okay, then that pretty much settles it. Nothing to do
>
>> > Missing a check means FW upgrades might become Linux breaking. 
>> 
>> Are you referring to the SMCCC bus code or RSI in particular above. I don't
>> see any issue with SMCCC bus code check as that is the least we can do and
>> must not change with future versions of the firmware as well.
>
> Just in general, SMCCC drivers have to do something smart with the
> version.
>
> Like, is this OK:
>
> #define ARM_SMCCC_TRNG_MIN_VERSION	0x10000UL
>
> static inline bool smccc_probe_trng(void)
> {
> 	struct arm_smccc_res res;
>
> 	arm_smccc_1_1_invoke(ARM_SMCCC_TRNG_VERSION, &res);
> 	if ((s32)res.a0 < 0)
> 		return false;
>
> 	return res.a0 >= ARM_SMCCC_TRNG_MIN_VERSION;
> }
>
> ?
>
> It means you can never publish a version 2 that is ABI breaking
> because linux doesn't check for that. Was that ARM's intention with
> the version API? It's basically a completely pointless check that
> doesn't effectively do anything.
>
> My broader, more general point is that if SMCC is being made into a
> discoverable bus, that's great, but it would be even better if ARM
> could find a way to progmatically enumerate all the ABIs present on
> the SMCC interface to populate the bus. That would necessarily include
> some consistent treatment of versioning for consistent
> interoperability.
>
>> If lower is also set at v3.0, then I would argue it is firmware upgrade
>> issue expecting old kernel with old RSI version supported to work. If
>> that returns v2.0, the driver must work IIUC. Aneesh, hopefully I got this
>> right ?
>
> There was many long conversations about this and I think the
> conclusion was RSI will broadly not use versions for any kind of ABI
> control. It is too coarse to really work in the real world and we must
> have strong forward/backwards interoperability inside VMs forever.


Even if we take RMI as an example, SMC_RMI_ABI_VERSION returns the
lowest and highest supported interface versions.

After a firmware upgrade, either value can change. Unless the existing
kernel supports an interface version within the advertised range, the
upgrade will break compatibility. Including the major version in the
modalias does not help with this.

Even with separate kernel drivers for versions 1 and 2, we still face
the same issue. If the firmware initially supports version 1 and an
upgrade raises the lowest supported version to 2, the version 2 driver
can handle it. However, that is functionally equivalent to a single
driver supporting both interface versions. If the current kernel does
not support version 2, either through a single driver or a separate
driver, the firmware upgrade will break compatibility.

-aneesh
