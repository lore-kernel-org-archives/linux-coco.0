Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B653B217723
	for <linux-coco@lists.linux.dev>; Tue,  9 Dec 2025 11:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765280876; cv=none; b=gtLckYZhVvNe7UROxhx8uOWQ2VST0tMabrv7gy6nLZFkJOBtgEP5IsN5CJXLaM4mCFpJYa9GEdFbvYFSLgakVkUYlE7oHqmiG9pfeggfJlPpBtHhlzURjYzMD2syQAiWvQKwtLATQzadRw2Td6hMI8yrazER/467WSNkfd/bu2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765280876; c=relaxed/simple;
	bh=HUX/Ro94uVUplNZNc4/gW2HrM7/9gydtVWMt3x4Keng=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XDSPLtnwTbmG8FAsoFHhBCOOtSA2+tr+RUdRfAV1JyvdPIROYlWqDS+499g0sz5yIfuU7oZZelsuCa+r3P136CUk+2H6pR4aNxVygdr1s0vLdTHl2UkhNVcxKgOMUZquSkE0dyujf6mzNbYIlNSWinej3oCUxi5OvAl8kvq73FA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com; spf=none smtp.mailfrom=foss.arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=foss.arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E4A551691;
	Tue,  9 Dec 2025 03:47:46 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CF8D43F762;
	Tue,  9 Dec 2025 03:47:51 -0800 (PST)
Date: Tue, 9 Dec 2025 11:47:48 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Vedashree Vidwans <vvidwans@nvidia.com>
Cc: <salman.nabi@arm.com>, <andre.przywara@arm.com>,
	<lpieralisi@kernel.org>, <mark.rutland@arm.com>, <ardb@kernel.org>,
	<chao.gao@intel.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-coco@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	<sdonthineni@nvidia.com>, <vsethi@nvidia.com>,
	Sudeep Holla <sudeep.holla@arm.com>, <vwadekar@nvidia.com>
Subject: Re: [RFC PATCH 4/5] firmware: smccc: register as platform driver
Message-ID: <20251209-hysterical-cobalt-viper-54433c@sudeepholla>
References: <20251208221319.1524888-1-vvidwans@nvidia.com>
 <20251208221319.1524888-5-vvidwans@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251208221319.1524888-5-vvidwans@nvidia.com>

On Mon, Dec 08, 2025 at 10:13:14PM +0000, Vedashree Vidwans wrote:
> - Update driver to be in-built kernel module. This will ensure driver is
> installed in kernel and would not require any user intervention.
> - Register the LFA driver as a platform driver corresponding to
> 'armhf000' device. The driver will be invoked when the device is
> detected on a platform.
> - Add functionality to register LFA interrupt in the driver probe().
> This LFA IRQ number will be retrived from the LFA device node.
> - On IRQ, driver will query FW component details and trigger activation
> of capable and pending FW component. The driver will loop to update FW
> component details after every successful FW component activation.
> - Mutex synchronization is implemented to avoid concurrent LFA updates
> through interrupt and sysfs interfaces.
> 
> Device node snippet from LFA spec[1]:
> fwu0 {
>     compatible = "arm,armhf000";
>     memory-region = <&fwu_payload>;
>     interrupt-parent = <&ic>;
>     interrupts = <0 100 1>; // SPI, Interrupt #100, Edge Rising
> };
> 

This will be gone in the latest beta of LFA, so please discuss and get
an agreement for the LFA device tree bindings.

We don't just use ACPI HID as devicetree compatibles. There are more
aligned with ACPI CID IIUC but I don't expect you to use ACPI CID just to
match DT compatible as ACPI HID will be defined for LFA.

> [1] https://developer.arm.com/documentation/den0147/latest/
> 
> Signed-off-by: Vedashree Vidwans <vvidwans@nvidia.com>
> ---
>  drivers/firmware/smccc/Kconfig  |   3 +-
>  drivers/firmware/smccc/lfa_fw.c | 124 +++++++++++++++++++++++++++++++-
>  2 files changed, 125 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/firmware/smccc/Kconfig b/drivers/firmware/smccc/Kconfig
> index 48b98c14f770..c21be43fbfed 100644
> --- a/drivers/firmware/smccc/Kconfig
> +++ b/drivers/firmware/smccc/Kconfig
> @@ -25,8 +25,9 @@ config ARM_SMCCC_SOC_ID
>  	  platforms providing some sysfs information about the SoC variant.
>  
>  config ARM_LFA
> -	tristate "Arm Live Firmware activation support"
> +	bool "Arm Live Firmware activation support"
>  	depends on HAVE_ARM_SMCCC_DISCOVERY
> +	default y
>  	help
>  	  Include support for triggering Live Firmware Activation, which
>  	  allows to upgrade certain firmware components without a reboot.
> diff --git a/drivers/firmware/smccc/lfa_fw.c b/drivers/firmware/smccc/lfa_fw.c
> index 0e420cefa260..24916fc53420 100644
> --- a/drivers/firmware/smccc/lfa_fw.c
> +++ b/drivers/firmware/smccc/lfa_fw.c
> @@ -19,7 +19,12 @@
>  #include <linux/nmi.h>
>  #include <linux/ktime.h>
>  #include <linux/delay.h>
> +#include <linux/platform_device.h>
> +#include <linux/acpi.h>
> +#include <linux/interrupt.h>
> +#include <linux/mutex.h>
>  
> +#define DRIVER_NAME	"ARM_LFA"
>  #define LFA_ERROR_STRING(name) \
>  	[name] = #name
>  #undef pr_fmt
> @@ -129,6 +134,7 @@ static const struct fw_image_uuid {
>  };
>  
>  static struct kobject *lfa_dir;
> +static DEFINE_MUTEX(lfa_lock);
>  
>  static int get_nr_lfa_components(void)
>  {
> @@ -374,17 +380,23 @@ static ssize_t activate_store(struct kobject *kobj, struct kobj_attribute *attr,
>  					 image_attrs[LFA_ATTR_ACTIVATE]);
>  	int ret;
>  
> +	if (!mutex_trylock(&lfa_lock)) {
> +		pr_err("Mutex locked, try again");
> +		return -EAGAIN;
> +	}
> +
>  	ret = activate_fw_image(attrs);
>  	if (ret) {
>  		pr_err("Firmware activation failed: %s\n",
>  			lfa_error_strings[-ret]);
> -
> +		mutex_unlock(&lfa_lock);
>  		return -ECANCELED;
>  	}
>  
>  	pr_info("Firmware activation succeeded\n");
>  
>  	/* TODO: refresh image flags here*/
> +	mutex_unlock(&lfa_lock);
>  	return count;
>  }
>  
> @@ -510,6 +522,106 @@ static int create_fw_images_tree(void)
>  	return 0;
>  }
>  
> +static irqreturn_t lfa_irq_thread(int irq, void *data)
> +{
> +	struct image_props *attrs = NULL;
> +	int ret;
> +	int num_of_components, curr_component;
> +
> +	mutex_lock(&lfa_lock);
> +
> +	/*
> +	 * As per LFA spec, after activation of a component, the caller
> +	 * is expected to re-enumerate the component states (using
> +	 * LFA_GET_INFO then LFA_GET_INVENTORY).
> +	 * Hence we need an unconditional loop.
> +	 */
> +
> +	do {
> +		/* TODO: refresh image flags here */
> +		/* If refresh fails goto exit_unlock */
> +
> +		/* Initialize counters to track list traversal  */
> +		num_of_components = get_nr_lfa_components();
> +		curr_component = 0;
> +
> +		/* Execute PRIME and ACTIVATE for activable FW component */
> +		list_for_each_entry(attrs, &lfa_fw_images, image_node) {
> +			curr_component++;
> +			if ((!attrs->activation_capable) || (!attrs->activation_pending)) {
> +				/* LFA not applicable for this FW component */
> +				continue;
> +			}
> +
> +			ret = activate_fw_image(attrs);
> +			if (ret) {
> +				pr_err("Firmware %s activation failed: %s\n",
> +					attrs->image_name, lfa_error_strings[-ret]);
> +				goto exit_unlock;
> +			}
> +
> +			pr_info("Firmware %s activation succeeded", attrs->image_name);
> +			/* Refresh FW component details */
> +			break;
> +		}
> +	} while (curr_component < num_of_components);
> +
> +	/* TODO: refresh image flags here */
> +	/* If refresh fails goto exit_unlock */
> +
> +exit_unlock:
> +	mutex_unlock(&lfa_lock);
> +	return IRQ_HANDLED;
> +}
> +
> +static int __init lfa_probe(struct platform_device *pdev)
> +{
> +	int err;
> +	unsigned int irq;
> +
> +	err = platform_get_irq_byname_optional(pdev, "fw-store-updated-interrupt");

Nice, "fw-store-updated-interrupt" is not even mentioned in the example DT
node above, let alone proper DT bindings.

-- 
Regards,
Sudeep
