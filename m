Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 872D53A5438;
	Mon,  8 Jun 2026 08:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780906765; cv=none; b=EUCu0L+VxWcnxYXiXPWSVDnIDcydEzwC6QGmgHzso7ehPFz0uT9LABEfZbrGp0PAzgAP/DkEIFPlohhEkn9jY4KIJRAsxokrbT7JhsiBKAISQWvvrCa2BUpfiA5kC5VSgkYzVB4sFYy2TWmBtYAfd6XJeIWow2G+y26XzkCJGP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780906765; c=relaxed/simple;
	bh=Ub1BFuZBlaeptymczl1SIwVrZxJBFyNG+hXa7FzbV04=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=PaQiLbCQg6uzIgxR63xDKfpD/uuUmUclhv+HJdigE5pE/mksmW4jgCo4TdlUSyw7fMPbuWO/6yjS3xaIfpW+rVP8XJIFi4GqVokFNjj5c0iov6XtbLdSFeaVOlswub8H2O6P/sAI3nA2LpMJyVSCnaTh25ZE0KLnxfKtAhJVkzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Mmq5wbmI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mmq5wbmI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E37721F00893;
	Mon,  8 Jun 2026 08:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780906761;
	bh=XhYNZb14iT7WTi/rIPt9D0xOIE2Ux7BaHdEjyhqsqYw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=Mmq5wbmIYFu1a4E9O/keCOTey2Zntjaf7yICd0m6BGd1oheJRkTRaN/GmCNq27lhd
	 FjdHBn0GAX/d6+/TmxvmgoubTaAPzhxz+6eL4v/Y0t0GPudGyzAW51K2XYVw6sWjDd
	 lB25o4DoPQPeM8Kl49NdCT847toI7uF1jIYZjxL0UT6LkcCoOVN6PirRxV4vx+tEYj
	 8WsmQtJBm3ts4O+ccaHr1F7o+kdqpThzb9+ZYIzKNWa+9ytO363rGrbcO5J7UI0SA4
	 DAIKA9oebiy06o+42gO47NIHTUwCT8PpWX7oNRCAGE1QHHF0+mx7XsUmVoICiYmln7
	 DkjW0cxD5ONnA==
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
In-Reply-To: <20260604-juicy-daft-starling-3eec1f@sudeepholla>
References: <20260527100233.428018-1-aneesh.kumar@kernel.org>
 <20260527100233.428018-4-aneesh.kumar@kernel.org>
 <20260603-determined-bumblebee-of-promise-e633d6@sudeepholla>
 <yq5ase72qvwb.fsf@kernel.org>
 <20260604-juicy-daft-starling-3eec1f@sudeepholla>
Date: Mon, 08 Jun 2026 13:49:13 +0530
Message-ID: <yq5ao6hlzbpa.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Sudeep Holla <sudeep.holla@kernel.org> writes:

> On Thu, Jun 04, 2026 at 06:56:28PM +0530, Aneesh Kumar K.V wrote:
>> Sudeep Holla <sudeep.holla@kernel.org> writes:
>>=20
>> ...
>>=20
>> > +static const struct smccc_device_info smccc_devices[] __initconst =3D=
 {
>> > +       {
>> > +               .func_id        =3D ARM_SMCCC_TRNG_VERSION,
>> > +               .requires_smc   =3D false,
>> > +               .min_return     =3D ARM_SMCCC_TRNG_MIN_VERSION,
>> > +               .device_name    =3D "arm-smccc-trng",
>> > +       },
>> > +};
>> > +
>> > +static bool __init
>> > +smccc_probe_smccc_device(const struct smccc_device_info *smccc_dev)
>> > +{
>> > +       struct arm_smccc_res res;
>> > +       unsigned long ret;
>> > +
>> > +       if (!IS_ENABLED(CONFIG_ARM64))
>> > +               return false;
>> > +
>> > +       if (smccc_conduit =3D=3D SMCCC_CONDUIT_NONE)
>> > +               return false;
>> > +
>> > +       if (smccc_dev->requires_smc && smccc_conduit !=3D SMCCC_CONDUI=
T_SMC)
>> > +               return false;
>> > +
>> > +       arm_smccc_1_1_invoke(smccc_dev->func_id, &res);
>> > +       ret =3D res.a0;
>> > +
>> > +       if ((s32)ret < 0)
>> > +               return false;
>> > +
>> > +       return ret >=3D smccc_dev->min_return;
>> > +}
>> > +
>> >
>>=20
>> I am not sure we want the check to be as simple as ret < 0. Some
>> function IDs may return input errors based on the supplied arguments
>> (for example, RMI_ERROR_INPUT). In those cases, we would likely want
>> this to be handled via a callback.
>>=20
>
> As I mentioned in response to Suzuki, we can defer that to probe of
> that device. If *_VERSION, succeeds SMCCC core can add that device and
> leave the rest to the core keeping the core and bus layer simple IMO.
>
>> We also want to use conditional compilation for some function IDs.
>> Given the callback approach and the #ifdefs, I wonder whether what we
>> currently have is actually simpler and more flexible.=E2=80=9D
>>=20
>
> I was trying to avoid conditional compilation altogether and hence the
> reason for keeping it as simple as possible. Also IS_ENABLED(CONFIG_ARM64)
> in above snippet must come as some condition to this generic probe.
>
> Adding any more logic or callback defeats the bus idea here if we need
> to rely/depend on multiple conditional compilation or callbacks IMO.
>
> Let's find see if it can work with what we are adding now and may add in
> near future and then decide.
>

If we move all the conditional checks to the driver probe path, then I
think this can work. Something like the below:

struct smccc_device_info {
	u32 func_id;
	bool requires_smc;
	const char *device_name;
};

static const struct smccc_device_info smccc_devices[] __initconst =3D {
	{
		.func_id        =3D ARM_SMCCC_TRNG_VERSION,
		.requires_smc   =3D false,
		.device_name    =3D "arm-smccc-trng",
	},

	{
		.func_id        =3D RSI_ABI_VERSION,
		.requires_smc   =3D true,
		.device_name    =3D RSI_DEV_NAME,
	},
};

static bool __init smccc_probe_smccc_device(const struct smccc_device_info =
*smccc_dev)
{
	unsigned long ret;
	struct arm_smccc_res res;

	if (smccc_conduit =3D=3D SMCCC_CONDUIT_NONE)
		return false;

	if (smccc_dev->requires_smc && smccc_conduit !=3D SMCCC_CONDUIT_SMC)
		return false;

	arm_smccc_1_1_invoke(smccc_dev->func_id, &res);
	ret =3D res.a0;

	if ((s32)ret =3D=3D SMCCC_RET_NOT_SUPPORTED)
		return false;

	return true;
}

static int __init smccc_devices_init(void)
{
	struct arm_smccc_device *sdev;
	const struct smccc_device_info *smccc_dev;

	for (int i =3D 0; i < ARRAY_SIZE(smccc_devices); i++) {
		smccc_dev =3D &smccc_devices[i];

		if (!smccc_probe_smccc_device(smccc_dev))
			continue;

               sdev =3D arm_smccc_device_register(smccc_dev->device_name);
               if (IS_ERR(sdev))
                       pr_err("%s: could not register device: %ld\n",
                              smccc_dev->device_name, PTR_ERR(sdev));

	}

	return 0;
}
device_initcall(smccc_devices_init);

with the diff to hw_random/smccc_trng

modified   arch/arm64/include/asm/archrandom.h
@@ -12,7 +12,7 @@
=20
 extern bool smccc_trng_available;
=20
-static inline bool __init smccc_probe_trng(void)
+static inline bool smccc_probe_trng(void)
 {
 	struct arm_smccc_res res;
=20
modified   drivers/char/hw_random/arm_smccc_trng.c
@@ -19,6 +19,8 @@
 #include <linux/arm-smccc.h>
 #include <linux/arm-smccc-bus.h>
=20
+#include <asm/archrandom.h>
+
 #ifdef CONFIG_ARM64
 #define ARM_SMCCC_TRNG_RND	ARM_SMCCC_TRNG_RND64
 #define MAX_BITS_PER_CALL	(3 * 64UL)
@@ -98,6 +100,10 @@ static int smccc_trng_probe(struct arm_smccc_device *sd=
ev)
 {
 	struct hwrng *trng;
=20
+	/* validate the minimum version requirement */
+	if (!smccc_probe_trng())
+		return -ENODEV;
+
 	trng =3D devm_kzalloc(&sdev->dev, sizeof(*trng), GFP_KERNEL);
 	if (!trng)
 		return -ENOMEM;

We can also move arch/arm64/include/asm/rsi_smc.h to
include/linux/arm-rsi-smccc.h. There was a suggestion to move these
firmware interfaces out of architecture-specific code:

https://lore.kernel.org/all/agsNO9cc7H-b0H8L@willie-the-truck

This will also avoid the #ifdef CONFIG_ARM64

-aneesh
