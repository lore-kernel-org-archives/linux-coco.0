Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12DC42BEC52;
	Mon,  6 Jul 2026 14:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783348512; cv=none; b=SR7bR4cbSOIrMt8TjLovqWapKoKu2kxnLQGa1fcfvqv72MoZgDjD4JVE/CzKo+AN4NCeFC1oO+SazvBVWV5OIAAOVIW7XiShTLlyajM2UEZH6eKZItBZ5p2hsWhmGRSg1zqZ2G2DQwRlrg21n3/nj0gnrFhJTiWF3dDz0WKowiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783348512; c=relaxed/simple;
	bh=atTX8ZxvA+ThDFoaSeEuBZxjFhVu6ZvA6TzQZyRVqdc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=bSU4ch1BcmIGHxVM4RXFipSACxOAb+X7nAeJNVnApQkWwvk0l/qyM/y8IVrJOTySt16Fy2YXSVcq4u37AMpct8NJRIYN7ynvlPqIFBEijN9AOTYGBhOnBqXw6TkhilA0d7U49QZq2/SQDfZh5OBB/dF1tdz1T73h0E/wIWG6sh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NEV/IGF9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NEV/IGF9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA1E81F000E9;
	Mon,  6 Jul 2026 14:35:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783348510;
	bh=4G2RsN8SH7uKD9+kRsew7gX7F/3GSrDbp0viWGKOoGo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=NEV/IGF9E0Nysa5xJZI+X+fl8hW0SLwcbZVNP39U+dkJN3/kW3wVKiCmP8kRbbYnp
	 Et0ZYU50/OIMlbuzdKpUlmppp4MB7+MRxG7M05PwYx9JDcubJ120JAx1t1U1/svHcG
	 Cheur8tqElCKJrNqEunSNIRSr5HFes3KX2RrYGtL9r0b8h9qP4nj/SffrxgDAvDNpj
	 63GUzit7cIfc6eSKbrjDuqKIg/C2tu6QqzjmLIwDPACVecDJsZLBvPQc+9y6i4pip/
	 xtY74+3xkqZaoR4jZVesh6clQjs+5MFNOLJWH1ukZ+JRZTxaNvdiyv/ll8XkkLBArS
	 G8bxiCpUXuGag==
X-Mailer: emacs 30.2 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: linux-coco@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Sudeep Holla <sudeep.holla@kernel.org>,
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
Subject: Re: [PATCH v7 1/6] firmware: smccc: Add an Arm SMCCC bus
In-Reply-To: <20260706-belligerent-excellent-saluki-a4e431@sudeepholla>
References: <20260611130429.295516-1-aneesh.kumar@kernel.org>
 <20260611130429.295516-2-aneesh.kumar@kernel.org>
 <20260706-belligerent-excellent-saluki-a4e431@sudeepholla>
Date: Mon, 06 Jul 2026 20:05:00 +0530
Message-ID: <yq5a4iici3u3.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Sudeep Holla <sudeep.holla@kernel.org> writes:

> On Thu, Jun 11, 2026 at 06:34:24PM +0530, Aneesh Kumar K.V (Arm) wrote:

...

>> +static int arm_smccc_bus_match(struct device *dev,
>> +		const struct device_driver *drv)
>> +{
>> +	const struct arm_smccc_device_id *id_table;
>> +	struct arm_smccc_device *smccc_dev =3D to_arm_smccc_device(dev);
>> +
>> +	id_table =3D to_arm_smccc_driver(drv)->id_table;
>> +	if (!id_table)
>> +		return 0;
>> +
>
> Any reason for not having this check when registering the driver also so
> that it becomes a must to register ? I remember vaguely adding this as fi=
x to
> FF-A driver recently.
>

I will add

int arm_smccc_driver_register(struct arm_smccc_driver *driver,
		struct module *owner, const char *mod_name)
{
	if (!driver->probe || !driver->id_table)
		return -EINVAL;


>
>> +	while (id_table->name[0]) {
>> +		if (!strcmp(smccc_dev->name, id_table->name))
>> +			return 1;
>> +		id_table++;
>> +	}
>> +
>> +	return 0;
>> +}
>> +

...

>> +struct arm_smccc_device *arm_smccc_device_register(const char *name)
>> +{
>> +	struct arm_smccc_device *smccc_dev;
>> +	int id, ret;
>> +
>> +	id =3D ida_alloc_min(&arm_smccc_bus_id, 1, GFP_KERNEL);
>> +	if (id < 0)
>> +		return ERR_PTR(id);
>> +
>> +	smccc_dev =3D kzalloc_obj(*smccc_dev);
>> +	if (!smccc_dev) {
>> +		ida_free(&arm_smccc_bus_id, id);
>> +		return ERR_PTR(-ENOMEM);
>> +	}
>> +
>> +	smccc_dev->id =3D id;
>> +	if (strscpy(smccc_dev->name, name) < 0) {
>
> Since this is exported symbol and one can call arm_smccc_device_register(=
ptr)
> where ptr =3D NULL, won't it blow up then ? IIUC strscpy() handles NULL d=
st
> but doesn't check for NULL src.
>

Will add the NULL check.

>> +		kfree(smccc_dev);
>> +		ida_free(&arm_smccc_bus_id, id);
>> +		return ERR_PTR(-EINVAL);
>> +	}
>> +	smccc_dev->dev.bus =3D &arm_smccc_bus_type;
>> +	smccc_dev->dev.release =3D arm_smccc_release_device;
>> +
>> +	ret =3D dev_set_name(&smccc_dev->dev, "%s-%d", smccc_dev->name, id);
>> +	if (ret) {
>> +		kfree(smccc_dev);
>> +		ida_free(&arm_smccc_bus_id, id);
>> +		return ERR_PTR(ret);
>> +	}
>> +
>> +	ret =3D device_register(&smccc_dev->dev);
>> +	if (ret) {
>> +		put_device(&smccc_dev->dev);
>> +		return ERR_PTR(ret);
>> +	}
>> +
>> +	return smccc_dev;
>> +}
>> +EXPORT_SYMBOL_GPL(arm_smccc_device_register);

...

>> +#define to_arm_smccc_driver(d) \
>> +	container_of_const(d, struct arm_smccc_driver, driver)
>> +
>> +int arm_smccc_driver_register(struct arm_smccc_driver *driver,
>> +		struct module *owner, const char *mod_name);
>> +void arm_smccc_driver_unregister(struct arm_smccc_driver *driver);
>> +struct arm_smccc_device *arm_smccc_device_register(const char *name);
>> +void arm_smccc_device_unregister(struct arm_smccc_device *smcc_dev);
>> +
>
> I may be overthinking but what will happen if HAVE_ARM_SMCCC_DISCOVERY=3Dn
> and some driver is compiled using this header ? It should be fine if it
> fails to compile, just thinking out loud if we need to handle that are no=
t.
> As long as all the drivers using these depends on HAVE_ARM_SMCCC_DISCOVERY
> it should be fine I think.

This will result in a build failure. The driver should either select
HAVE_ARM_SMCCC_DISCOVERY or depend on HAVE_ARM_SMCCC_DISCOVERY.

>
>> +#define arm_smccc_register(driver) \
>> +	arm_smccc_driver_register(driver, THIS_MODULE, KBUILD_MODNAME)
>> +#define arm_smccc_unregister(driver) \
>> +	arm_smccc_driver_unregister(driver)
>> +
>> +#define module_arm_smccc_driver(__arm_smccc_driver) \
>> +	module_driver(__arm_smccc_driver, arm_smccc_register, \
>> +		      arm_smccc_unregister)
>> +
>> +extern const struct bus_type arm_smccc_bus_type;
>> +
>> +#endif /* __LINUX_ARM_SMCCC_BUS_H */
>> diff --git a/include/linux/mod_devicetable.h b/include/linux/mod_devicet=
able.h
>> index 23ff24080dfd..c9cee8c5a0b2 100644
>> --- a/include/linux/mod_devicetable.h
>> +++ b/include/linux/mod_devicetable.h
>
> This file seems to be reworked recently, so you need to rebase it moving
> smccc specific changes to separate file I think.
>

Do we need to add a separate file? I was able to rebase the series on
7.2-rc1

modified   include/linux/mod_devicetable.h
@@ -879,6 +879,19 @@ struct auxiliary_device_id {
 	kernel_ulong_t driver_data;
 };
=20
+#define ARM_SMCCC_NAME_SIZE 40
+#define ARM_SMCCC_MODULE_PREFIX "arm_smccc:"
+
+/**
+ * struct arm_smccc_device_id - Arm SMCCC bus device identifier
+ * @name: SMCCC device name
+ * @driver_data: driver data
+ */
+struct arm_smccc_device_id {
+	char name[ARM_SMCCC_NAME_SIZE];
+	kernel_ulong_t driver_data;
+};
+
 /* Surface System Aggregator Module */
=20
 #define SSAM_MATCH_TARGET	0x1


>> @@ -876,6 +876,19 @@ struct auxiliary_device_id {
>>  	kernel_ulong_t driver_data;
>>  };
>>=20=20
>> +#define ARM_SMCCC_NAME_SIZE 40
>> +#define ARM_SMCCC_MODULE_PREFIX "arm_smccc:"
>> +
>> +/**
>> + * struct arm_smccc_device_id - Arm SMCCC bus device identifier
>> + * @name: SMCCC device name
>> + * @driver_data: driver data
>> + */
>> +struct arm_smccc_device_id {
>> +	char name[ARM_SMCCC_NAME_SIZE];
>> +	kernel_ulong_t driver_data;
>
> Can't find any users of the above driver_data ?
> Is it for future ? If so, can you add details on how it is supposed to be=
 used
> if you don't want to drop it.
>

That would depend on the driver, wouldn=E2=80=99t it? I was comparing this =
with
struct auxiliary_device_id, and very few drivers use driver_data;
mei_gsc_probe() is one example.

I am not sure there is a generic rule here. IIUC, it provides a place
where a driver can add driver-specific data that can be used during the
probe routine.

>> +};
>> +
>>  /* Surface System Aggregator Module */
>>=20=20
>>  #define SSAM_MATCH_TARGET	0x1
>> diff --git a/scripts/mod/devicetable-offsets.c b/scripts/mod/devicetable=
-offsets.c
>> index b4178c42d08f..a485011ff137 100644
>> --- a/scripts/mod/devicetable-offsets.c
>> +++ b/scripts/mod/devicetable-offsets.c
>> @@ -254,6 +254,9 @@ int main(void)
>>  	DEVID(auxiliary_device_id);
>>  	DEVID_FIELD(auxiliary_device_id, name);
>>=20=20
>> +	DEVID(arm_smccc_device_id);
>> +	DEVID_FIELD(arm_smccc_device_id, name);
>> +
>>  	DEVID(ssam_device_id);
>>  	DEVID_FIELD(ssam_device_id, match_flags);
>>  	DEVID_FIELD(ssam_device_id, domain);

-aneesh
