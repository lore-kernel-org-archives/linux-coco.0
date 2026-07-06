Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29D3B331222;
	Mon,  6 Jul 2026 13:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783343922; cv=none; b=BCG82moP0/kJNR0bt8rWlDG/HuyW46ce97s0JVL2M5Akp3h9P5PyL8KivNl5Ue2wbZbh7SU4pYIQNf9E8KOc2PdVfBkJ3SqKWI7x7DqTTavgmSRM9tsPWdEMc9DLgfC5Ms5hfa3VsOEexSaVZgtapamgG+nZYnqyqv18togRBXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783343922; c=relaxed/simple;
	bh=RhCvTH+puBHrLMdqq4GqjfjUXI1Mf66EvWPiFAtkzjU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=noS7/bhCPsM0uuAQ1usgEx49rDqxEzIDVCiB7OiJIjfCIX/R8p403earmKYn92LV+ufVcLtTxarEsvHxUFWEdLFKInvIaHzDBckzfbE4P1Caq7tRoY+onqfsGLcnXRupZKYJ7a3LJ1KUOhc26aYQH0RtkkFFXqjKa0pWEZnGOIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OWbqZfzT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OWbqZfzT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 648E71F000E9;
	Mon,  6 Jul 2026 13:18:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783343920;
	bh=o90i0cfZoLQRDEd07HRcrIoHeZh+FDlGHtKxB6iNI3Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OWbqZfzTjukjCzOtpI+vcCyyKg07CpN2ldAOpni3JjhkAkDxWhIsBCzUf286cmC9q
	 yrE2uqIKA2KRLWx86P74/nxaNx/kFtX3BB3M23nsEVwTtEUirt6bvFBE70dUwfzoEM
	 ny2qx0VQb+Z36+yFeQ3AmMS6XqBtpE/FPkbtN+rxNyJ7Kl0Dwysluo5K6ILluGm1nR
	 m8ZcANJm4bSevE7vxYLN1zrEy/cRUeszik1g5Zky8oIU5XHxUs2NBeOpHJZkHx/FUf
	 a4s1NienhNgGtHkksFdrnd8pXON5QdTn0GkaDA658UZak6YIkJXmtMr1cOZ7HnDCl1
	 h1WeH/xT21RHA==
Date: Mon, 6 Jul 2026 14:18:36 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
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
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH v7 1/6] firmware: smccc: Add an Arm SMCCC bus
Message-ID: <20260706-belligerent-excellent-saluki-a4e431@sudeepholla>
References: <20260611130429.295516-1-aneesh.kumar@kernel.org>
 <20260611130429.295516-2-aneesh.kumar@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260611130429.295516-2-aneesh.kumar@kernel.org>

On Thu, Jun 11, 2026 at 06:34:24PM +0530, Aneesh Kumar K.V (Arm) wrote:
> SMCCC-discovered firmware services are currently represented by separate
> platform devices, such as smccc_trng and arm-cca-dev. Those devices do not
> represent independent DT/ACPI-described platform resources; they are
> features of the SMCCC firmware interface.
> 
> Add an Arm SMCCC bus for services discovered through the SMCCC firmware
> interface. The bus provides SMCCC device and driver registration helpers,
> name-based matching, modalias generation, and a sysfs modalias attribute so
> SMCCC service drivers can bind to discovered firmware services and autoload
> as modules.
> 
> Follow-up changes can then register SMCCC firmware services as arm-smccc
> devices instead of creating independent per-feature platform devices.
> 
> Based on arm_ffa code
> 
> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
> ---
>  drivers/firmware/smccc/Makefile   |   2 +-
>  drivers/firmware/smccc/bus.c      | 164 ++++++++++++++++++++++++++++++
>  include/linux/arm-smccc-bus.h     |  49 +++++++++
>  include/linux/mod_devicetable.h   |  13 +++
>  scripts/mod/devicetable-offsets.c |   3 +
>  scripts/mod/file2alias.c          |   8 ++
>  6 files changed, 238 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/firmware/smccc/bus.c
>  create mode 100644 include/linux/arm-smccc-bus.h
> 
> diff --git a/drivers/firmware/smccc/Makefile b/drivers/firmware/smccc/Makefile
> index 40d19144a860..68bbff1407b8 100644
> --- a/drivers/firmware/smccc/Makefile
> +++ b/drivers/firmware/smccc/Makefile
> @@ -1,4 +1,4 @@
>  # SPDX-License-Identifier: GPL-2.0
>  #
> -obj-$(CONFIG_HAVE_ARM_SMCCC_DISCOVERY)	+= smccc.o kvm_guest.o
> +obj-$(CONFIG_HAVE_ARM_SMCCC_DISCOVERY)	+= bus.o smccc.o kvm_guest.o
>  obj-$(CONFIG_ARM_SMCCC_SOC_ID)	+= soc_id.o
> diff --git a/drivers/firmware/smccc/bus.c b/drivers/firmware/smccc/bus.c
> new file mode 100644
> index 000000000000..fe7e893130ce
> --- /dev/null
> +++ b/drivers/firmware/smccc/bus.c
> @@ -0,0 +1,164 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2026 Arm Limited
> + */
> +
> +#include <linux/arm-smccc-bus.h>
> +#include <linux/idr.h>
> +#include <linux/slab.h>
> +
> +static DEFINE_IDA(arm_smccc_bus_id);
> +
> +static int arm_smccc_bus_match(struct device *dev,
> +		const struct device_driver *drv)
> +{
> +	const struct arm_smccc_device_id *id_table;
> +	struct arm_smccc_device *smccc_dev = to_arm_smccc_device(dev);
> +
> +	id_table = to_arm_smccc_driver(drv)->id_table;
> +	if (!id_table)
> +		return 0;
> +

Any reason for not having this check when registering the driver also so
that it becomes a must to register ? I remember vaguely adding this as fix to
FF-A driver recently.

> +	while (id_table->name[0]) {
> +		if (!strcmp(smccc_dev->name, id_table->name))
> +			return 1;
> +		id_table++;
> +	}
> +
> +	return 0;
> +}
> +
> +static int arm_smccc_bus_probe(struct device *dev)
> +{
> +	struct arm_smccc_driver *smccc_drv = to_arm_smccc_driver(dev->driver);
> +
> +	return smccc_drv->probe(to_arm_smccc_device(dev));
> +}
> +
> +static void arm_smccc_bus_remove(struct device *dev)
> +{
> +	struct arm_smccc_driver *smcc_drv = to_arm_smccc_driver(dev->driver);
> +
> +	if (smcc_drv->remove)
> +		smcc_drv->remove(to_arm_smccc_device(dev));
> +}
> +
> +static int arm_smccc_bus_uevent(const struct device *dev,
> +		struct kobj_uevent_env *env)
> +{
> +	const struct arm_smccc_device *smccc_dev = to_arm_smccc_device(dev);
> +
> +	return add_uevent_var(env, "MODALIAS=" ARM_SMCCC_MODULE_PREFIX "%s",
> +			      smccc_dev->name);
> +}
> +
> +static ssize_t modalias_show(struct device *dev,
> +		struct device_attribute *attr, char *buf)
> +{
> +	struct arm_smccc_device *smccc_dev = to_arm_smccc_device(dev);
> +
> +	return sysfs_emit(buf, ARM_SMCCC_MODULE_PREFIX "%s\n", smccc_dev->name);
> +}
> +static DEVICE_ATTR_RO(modalias);
> +
> +static struct attribute *arm_smccc_device_attrs[] = {
> +	&dev_attr_modalias.attr,
> +	NULL,
> +};
> +ATTRIBUTE_GROUPS(arm_smccc_device);
> +
> +const struct bus_type arm_smccc_bus_type = {
> +	.name = "arm_smccc",
> +	.match = arm_smccc_bus_match,
> +	.probe = arm_smccc_bus_probe,
> +	.remove = arm_smccc_bus_remove,
> +	.uevent = arm_smccc_bus_uevent,
> +	.dev_groups = arm_smccc_device_groups,
> +};
> +EXPORT_SYMBOL_GPL(arm_smccc_bus_type);
> +
> +int arm_smccc_driver_register(struct arm_smccc_driver *driver,
> +		struct module *owner, const char *mod_name)
> +{
> +	if (!driver->probe)
> +		return -EINVAL;
> +
> +	driver->driver.bus = &arm_smccc_bus_type;
> +	driver->driver.name = driver->name;
> +	driver->driver.owner = owner;
> +	driver->driver.mod_name = mod_name;
> +
> +	return driver_register(&driver->driver);
> +}
> +EXPORT_SYMBOL_GPL(arm_smccc_driver_register);
> +
> +void arm_smccc_driver_unregister(struct arm_smccc_driver *driver)
> +{
> +	driver_unregister(&driver->driver);
> +}
> +EXPORT_SYMBOL_GPL(arm_smccc_driver_unregister);
> +
> +static void arm_smccc_release_device(struct device *dev)
> +{
> +	struct arm_smccc_device *smccc_dev = to_arm_smccc_device(dev);
> +
> +	ida_free(&arm_smccc_bus_id, smccc_dev->id);
> +	kfree(smccc_dev);
> +}
> +
> +struct arm_smccc_device *arm_smccc_device_register(const char *name)
> +{
> +	struct arm_smccc_device *smccc_dev;
> +	int id, ret;
> +
> +	id = ida_alloc_min(&arm_smccc_bus_id, 1, GFP_KERNEL);
> +	if (id < 0)
> +		return ERR_PTR(id);
> +
> +	smccc_dev = kzalloc_obj(*smccc_dev);
> +	if (!smccc_dev) {
> +		ida_free(&arm_smccc_bus_id, id);
> +		return ERR_PTR(-ENOMEM);
> +	}
> +
> +	smccc_dev->id = id;
> +	if (strscpy(smccc_dev->name, name) < 0) {

Since this is exported symbol and one can call arm_smccc_device_register(ptr)
where ptr = NULL, won't it blow up then ? IIUC strscpy() handles NULL dst
but doesn't check for NULL src.

> +		kfree(smccc_dev);
> +		ida_free(&arm_smccc_bus_id, id);
> +		return ERR_PTR(-EINVAL);
> +	}
> +	smccc_dev->dev.bus = &arm_smccc_bus_type;
> +	smccc_dev->dev.release = arm_smccc_release_device;
> +
> +	ret = dev_set_name(&smccc_dev->dev, "%s-%d", smccc_dev->name, id);
> +	if (ret) {
> +		kfree(smccc_dev);
> +		ida_free(&arm_smccc_bus_id, id);
> +		return ERR_PTR(ret);
> +	}
> +
> +	ret = device_register(&smccc_dev->dev);
> +	if (ret) {
> +		put_device(&smccc_dev->dev);
> +		return ERR_PTR(ret);
> +	}
> +
> +	return smccc_dev;
> +}
> +EXPORT_SYMBOL_GPL(arm_smccc_device_register);
> +
> +void arm_smccc_device_unregister(struct arm_smccc_device *smccc_dev)
> +{
> +	if (!smccc_dev)
> +		return;
> +
> +	device_unregister(&smccc_dev->dev);
> +}
> +EXPORT_SYMBOL_GPL(arm_smccc_device_unregister);
> +
> +static int __init arm_smccc_bus_init(void)
> +{
> +	return bus_register(&arm_smccc_bus_type);
> +}
> +subsys_initcall(arm_smccc_bus_init);
> +
> diff --git a/include/linux/arm-smccc-bus.h b/include/linux/arm-smccc-bus.h
> new file mode 100644
> index 000000000000..188891441e57
> --- /dev/null
> +++ b/include/linux/arm-smccc-bus.h
> @@ -0,0 +1,49 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (C) 2026 Arm Limited
> + */
> +#ifndef __LINUX_ARM_SMCCC_BUS_H
> +#define __LINUX_ARM_SMCCC_BUS_H
> +
> +#include <linux/device.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +
> +struct arm_smccc_device {
> +	int id;
> +	char name[ARM_SMCCC_NAME_SIZE];
> +	struct device dev;
> +};
> +
> +#define to_arm_smccc_device(d) container_of(d, struct arm_smccc_device, dev)
> +
> +struct arm_smccc_driver {
> +	const char *name;
> +	int (*probe)(struct arm_smccc_device *sdev);
> +	void (*remove)(struct arm_smccc_device *sdev);
> +	const struct arm_smccc_device_id *id_table;
> +
> +	struct device_driver driver;
> +};
> +
> +#define to_arm_smccc_driver(d) \
> +	container_of_const(d, struct arm_smccc_driver, driver)
> +
> +int arm_smccc_driver_register(struct arm_smccc_driver *driver,
> +		struct module *owner, const char *mod_name);
> +void arm_smccc_driver_unregister(struct arm_smccc_driver *driver);
> +struct arm_smccc_device *arm_smccc_device_register(const char *name);
> +void arm_smccc_device_unregister(struct arm_smccc_device *smcc_dev);
> +

I may be overthinking but what will happen if HAVE_ARM_SMCCC_DISCOVERY=n
and some driver is compiled using this header ? It should be fine if it
fails to compile, just thinking out loud if we need to handle that are not.
As long as all the drivers using these depends on HAVE_ARM_SMCCC_DISCOVERY
it should be fine I think.

> +#define arm_smccc_register(driver) \
> +	arm_smccc_driver_register(driver, THIS_MODULE, KBUILD_MODNAME)
> +#define arm_smccc_unregister(driver) \
> +	arm_smccc_driver_unregister(driver)
> +
> +#define module_arm_smccc_driver(__arm_smccc_driver) \
> +	module_driver(__arm_smccc_driver, arm_smccc_register, \
> +		      arm_smccc_unregister)
> +
> +extern const struct bus_type arm_smccc_bus_type;
> +
> +#endif /* __LINUX_ARM_SMCCC_BUS_H */
> diff --git a/include/linux/mod_devicetable.h b/include/linux/mod_devicetable.h
> index 23ff24080dfd..c9cee8c5a0b2 100644
> --- a/include/linux/mod_devicetable.h
> +++ b/include/linux/mod_devicetable.h

This file seems to be reworked recently, so you need to rebase it moving
smccc specific changes to separate file I think.

> @@ -876,6 +876,19 @@ struct auxiliary_device_id {
>  	kernel_ulong_t driver_data;
>  };
>  
> +#define ARM_SMCCC_NAME_SIZE 40
> +#define ARM_SMCCC_MODULE_PREFIX "arm_smccc:"
> +
> +/**
> + * struct arm_smccc_device_id - Arm SMCCC bus device identifier
> + * @name: SMCCC device name
> + * @driver_data: driver data
> + */
> +struct arm_smccc_device_id {
> +	char name[ARM_SMCCC_NAME_SIZE];
> +	kernel_ulong_t driver_data;

Can't find any users of the above driver_data ?
Is it for future ? If so, can you add details on how it is supposed to be used
if you don't want to drop it.

> +};
> +
>  /* Surface System Aggregator Module */
>  
>  #define SSAM_MATCH_TARGET	0x1
> diff --git a/scripts/mod/devicetable-offsets.c b/scripts/mod/devicetable-offsets.c
> index b4178c42d08f..a485011ff137 100644
> --- a/scripts/mod/devicetable-offsets.c
> +++ b/scripts/mod/devicetable-offsets.c
> @@ -254,6 +254,9 @@ int main(void)
>  	DEVID(auxiliary_device_id);
>  	DEVID_FIELD(auxiliary_device_id, name);
>  
> +	DEVID(arm_smccc_device_id);
> +	DEVID_FIELD(arm_smccc_device_id, name);
> +
>  	DEVID(ssam_device_id);
>  	DEVID_FIELD(ssam_device_id, match_flags);
>  	DEVID_FIELD(ssam_device_id, domain);
> diff --git a/scripts/mod/file2alias.c b/scripts/mod/file2alias.c
> index 2ad87a74bb03..92d3917f27cc 100644
> --- a/scripts/mod/file2alias.c
> +++ b/scripts/mod/file2alias.c
> @@ -1323,6 +1323,13 @@ static void do_auxiliary_entry(struct module *mod, void *symval)
>  	module_alias_printf(mod, false, AUXILIARY_MODULE_PREFIX "%s", *name);
>  }
>  
> +static void do_arm_smccc_entry(struct module *mod, void *symval)
> +{
> +	DEF_FIELD_ADDR(symval, arm_smccc_device_id, name);
> +
> +	module_alias_printf(mod, false, ARM_SMCCC_MODULE_PREFIX "%s", *name);
> +}
> +
>  /*
>   * Looks like: ssam:dNcNtNiNfN
>   *
> @@ -1493,6 +1500,7 @@ static const struct devtable devtable[] = {
>  	{"mhi", SIZE_mhi_device_id, do_mhi_entry},
>  	{"mhi_ep", SIZE_mhi_device_id, do_mhi_ep_entry},
>  	{"auxiliary", SIZE_auxiliary_device_id, do_auxiliary_entry},
> +	{"arm_smccc", SIZE_arm_smccc_device_id, do_arm_smccc_entry},
>  	{"ssam", SIZE_ssam_device_id, do_ssam_entry},
>  	{"dfl", SIZE_dfl_device_id, do_dfl_entry},
>  	{"ishtp", SIZE_ishtp_device_id, do_ishtp_entry},
> -- 
> 2.43.0
> 

-- 
Regards,
Sudeep
