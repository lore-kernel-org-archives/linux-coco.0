Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA03947DD7A;
	Thu,  4 Jun 2026 13:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780579598; cv=none; b=UHGTvznq9DeaNL92PdLlJ5Skl4BXJ+yQPPAls1ORtpzgZUaTp3991lFrpMcKzyvLEiksI/HnYz3CC5dS2bRJ2MxN4zwgr1t//aYkaWCFSFTcL2uXSBJd8D33VX2pFYYJ0rksBCWbcdTVamTjAbgNsVhCJwBAIbCrWAZMeGvEzEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780579598; c=relaxed/simple;
	bh=ARFHUvl6ri9RKwd/GIIgaNw67I16eJoihQjbsZRBdfo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=dwkww/uIJZ6qMoOuHBJEbx/NGv4ZXQ3RVV+xtIjT1C/UPIJqfm2LkNayuP/okDzTv8zbdMuZjol9FjA+LbiwUEC94ajea610lhDczPVa2gZTCl31m+Oi72PhPrszphdkwOYSSMX0lzQ6BSc3qGinEijXNBcmPeDr0t9QTXn2gTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bbdbeaSH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bbdbeaSH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E5461F00893;
	Thu,  4 Jun 2026 13:26:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780579596;
	bh=X1HiQn7Sj8ACG6yAdiTjOB9XT8tmQZ7bjDWPDZ23wt0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=bbdbeaSHdffGKrFkjEGKKLzhXkGm8ZRRyvvk2T38YWtxavtizF10huPufi3qBVIXc
	 D/lrOcC6l4hAYS+dzW0pvH2k2SR8hkhpgMueiMPgMFQAokTjua6hv25qB5IeRq2JvA
	 AJKheqD9FJGfs3gfN4V/5T8SVCIH1doGkFdILE4ZpJ2sfX4hjyN2PJO82AbYgB12Am
	 J73q0GNh+IL7WbrJr4alMW2oZY/cPU3+bmr8yxgySP9/sTYsTIi0FxD8bZwqyYcqek
	 ylMnfjPr5LVber9b3ojKwALS+3BaHJZGYtu2CR/Mt3j4NKScfSzgTKl2ImiQEDoO+U
	 +YIsckLx1kFpA==
X-Mailer: emacs 30.2 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: linux-coco@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Greg KH <gregkh@linuxfoundation.org>,
	Jeremy Linton <jeremy.linton@arm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Will Deacon <will@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>
Subject: Re: [PATCH v6 3/4] firmware: smccc: arm-cca-guest: Bind the TSM
 provider to an SMCCC device
In-Reply-To: <20260603-determined-bumblebee-of-promise-e633d6@sudeepholla>
References: <20260527100233.428018-1-aneesh.kumar@kernel.org>
 <20260527100233.428018-4-aneesh.kumar@kernel.org>
 <20260603-determined-bumblebee-of-promise-e633d6@sudeepholla>
Date: Thu, 04 Jun 2026 18:56:28 +0530
Message-ID: <yq5ase72qvwb.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Sudeep Holla <sudeep.holla@kernel.org> writes:

...

> +static const struct smccc_device_info smccc_devices[] __initconst =3D {
> +       {
> +               .func_id        =3D ARM_SMCCC_TRNG_VERSION,
> +               .requires_smc   =3D false,
> +               .min_return     =3D ARM_SMCCC_TRNG_MIN_VERSION,
> +               .device_name    =3D "arm-smccc-trng",
> +       },
> +};
> +
> +static bool __init
> +smccc_probe_smccc_device(const struct smccc_device_info *smccc_dev)
> +{
> +       struct arm_smccc_res res;
> +       unsigned long ret;
> +
> +       if (!IS_ENABLED(CONFIG_ARM64))
> +               return false;
> +
> +       if (smccc_conduit =3D=3D SMCCC_CONDUIT_NONE)
> +               return false;
> +
> +       if (smccc_dev->requires_smc && smccc_conduit !=3D SMCCC_CONDUIT_S=
MC)
> +               return false;
> +
> +       arm_smccc_1_1_invoke(smccc_dev->func_id, &res);
> +       ret =3D res.a0;
> +
> +       if ((s32)ret < 0)
> +               return false;
> +
> +       return ret >=3D smccc_dev->min_return;
> +}
> +
>

I am not sure we want the check to be as simple as ret < 0. Some
function IDs may return input errors based on the supplied arguments
(for example, RMI_ERROR_INPUT). In those cases, we would likely want
this to be handled via a callback.

We also want to use conditional compilation for some function IDs.
Given the callback approach and the #ifdefs, I wonder whether what we
currently have is actually simpler and more flexible.=E2=80=9D

>  void __init arm_smccc_version_init(u32 version, enum arm_smccc_conduit c=
onduit)
>  {
>         struct arm_smccc_res res;
> @@ -31,7 +68,7 @@ void __init arm_smccc_version_init(u32 version, enum ar=
m_smccc_conduit conduit)
>         smccc_version =3D version;
>         smccc_conduit =3D conduit;
>
> -       smccc_trng_available =3D smccc_probe_trng();
> +       smccc_trng_available =3D smccc_probe_smccc_device(&smccc_devices[=
0]);
>
>         if ((smccc_version >=3D ARM_SMCCC_VERSION_1_2) &&
>             (smccc_conduit !=3D SMCCC_CONDUIT_NONE)) {
> @@ -241,14 +278,20 @@ subsys_initcall(arm_smccc_bus_init);
>
>  static int __init smccc_devices_init(void)
>  {
> -       struct platform_device *pdev;
> -
> -       if (smccc_trng_available) {
> -               pdev =3D platform_device_register_simple("smccc_trng", -1,
> -                                                      NULL, 0);
> -               if (IS_ERR(pdev))
> -                       pr_err("smccc_trng: could not register device: %l=
d\n",
> -                              PTR_ERR(pdev));
> +       const struct smccc_device_info *smccc_dev;
> +       struct arm_smccc_device *sdev;
> +       int i;
> +
> +       for (i =3D 0; i < ARRAY_SIZE(smccc_devices); i++) {
> +               smccc_dev =3D &smccc_devices[i];
> +
> +               if (!smccc_probe_smccc_device(smccc_dev))
> +                       continue;
> +
> +               sdev =3D arm_smccc_device_register(smccc_dev->device_name=
);
> +               if (IS_ERR(sdev))
> +                       pr_err("%s: could not register device: %ld\n",
> +                              smccc_dev->device_name, PTR_ERR(sdev));
>         }
>
>         return 0;
>

-aneesh
