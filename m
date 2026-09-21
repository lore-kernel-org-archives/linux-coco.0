Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 898F8368964
	for <linux-coco@lists.linux.dev>; Mon, 21 Sep 2026 09:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789981235; cv=none; b=NLtaCKNB7KSzBb/B/KvpRh89rOcJkX8EDU2ZUVcUQ4jzKTz0zM/NmQenICI+j12bKtjWwlOuLbFyX/kzVbAqwAlLwrzVtcpQxscfkjfIesacYWRNP9XVCzZRVQbiv5lyN9wqeecqVwpT8pCuYN3d0yzP6JFUQO1yzWxD86X5faE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789981235; c=relaxed/simple;
	bh=rmGLhNez3sr3VTeO0rvtyKw8ZUlXlZNA/shMOq4Nvmg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FrrO/qr4YVqu87Tw0EsmXV8j6QgMhMo5vcQ7KU9LyWuzfjoZJFdKCm27FcwJWXT6XHgllw1vXxZ2T/AgxscE5ntrYwCxAj7RpIB/j2KXVldosljOxdlQ+7L2t9JSha4JslcltVy1u425NtgYhwgseG2OXtkeT27q5D1/xX6HSu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Po5RM1+r; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Po5RM1+r"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 548101CE0;
	Mon, 21 Sep 2026 02:00:29 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 89A763F86C;
	Mon, 21 Sep 2026 02:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789981232; bh=rmGLhNez3sr3VTeO0rvtyKw8ZUlXlZNA/shMOq4Nvmg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Po5RM1+rdbnm6qFubw9+VCeRMeyVqlwMNum4SN8AgdpES5MhqzGT4Q5bGmOKxWQRm
	 qvEiQUYpgvamwapOlIW5mYnepDRMQ47wTTpxrqNeX4zeqbDujGvuOdhjL1jMUwZixw
	 Xw8WIdLM+JpusqCvpbr+Xkkf6QG7esS+aGrU8NlE=
Date: Mon, 21 Sep 2026 10:00:27 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
Cc: linux-coco@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Jason Gunthorpe <jgg@nvidia.com>,
	Greg KH <gregkh@linuxfoundation.org>,
	Jeremy Linton <jeremy.linton@arm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>, Will Deacon <will@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Subject: Re: [PATCH v12 7/7] coco: guest: arm64: Replace dummy CCA device
 with sysfs ABI
Message-ID: <arDyK8QDtCEc5SzU@arm.com>
References: <20260921053807.354802-1-aneesh.kumar@kernel.org>
 <20260921053807.354802-8-aneesh.kumar@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260921053807.354802-8-aneesh.kumar@kernel.org>

On Mon, Sep 21, 2026 at 11:08:07AM +0530, Aneesh Kumar K.V (Arm) wrote:
> diff --git a/Documentation/ABI/testing/sysfs-firmware-cca b/Documentation/ABI/testing/sysfs-firmware-cca
> new file mode 100644
> index 000000000000..9cc355724f94
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-firmware-cca
> @@ -0,0 +1,7 @@
> +What:		/sys/firmware/cca/realm_guest
> +Date:		May 2026

Still May?

> +Contact:	Linux ARM Kernel Mailing list <linux-arm-kernel@lists.infradead.org>
> +Description:	Read-only. Present only when the kernel is running as an
> +		Arm Confidential Compute Architecture (CCA) Realm guest, in
> +		which case it reads 1. If the file does not exist, the kernel
> +		is not running as a Realm guest.
> diff --git a/drivers/firmware/arm_rmm/rsi.c b/drivers/firmware/arm_rmm/rsi.c
> index 2dd69febedbd..425b27c0cad4 100644
> --- a/drivers/firmware/arm_rmm/rsi.c
> +++ b/drivers/firmware/arm_rmm/rsi.c
> @@ -7,14 +7,16 @@
>  #include <linux/memblock.h>
>  #include <linux/psci.h>
>  #include <linux/swiotlb.h>
> -#include <linux/platform_device.h>
>  #include <linux/arm-rsi-cmds.h>
> +#include <linux/kobject.h>
> +#include <linux/sysfs.h>
>  
>  #include <asm/io.h>
>  #include <asm/mem_encrypt.h>
>  #include <asm/pgtable.h>
>  
>  static struct realm_config config;
> +static struct kobject *cca_kobj;

Nit: do we need this static cca_kobj? Can you not just use a local
variable in realm_sysfs_init()?

>  
>  unsigned long prot_ns_shared;
>  EXPORT_SYMBOL(prot_ns_shared);
> @@ -182,17 +184,36 @@ void __init arm64_rsi_init(void)
>  	static_branch_enable(&rsi_present);
>  }
>  
> -static struct platform_device rsi_dev = {
> -	.name = "arm-cca-dev",
> -	.id = PLATFORM_DEVID_NONE
> +static ssize_t realm_guest_show(struct kobject *kobj,
> +		struct kobj_attribute *attr, char *buf)
> +{
> +	return sysfs_emit(buf, "1\n");
> +}
> +
> +static struct kobj_attribute cca_realm_guest =
> +	__ATTR(realm_guest, 0444, realm_guest_show, NULL);

Nit: __ATTR_RO,

> +
> +static const struct attribute *cca_realm_attrs[] = {
> +	&cca_realm_guest.attr,
> +	NULL
>  };
>  
> -static int __init arm64_create_dummy_rsi_dev(void)
> +static int __init realm_sysfs_init(void)
>  {
> -	if (is_realm_world() &&
> -	    platform_device_register(&rsi_dev))
> -		pr_err("failed to register rsi platform device\n");
> -	return 0;
> -}
> +	int ret;
>  
> -arch_initcall(arm64_create_dummy_rsi_dev)
> +	if (!is_realm_world())
> +		return 0;
> +
> +	cca_kobj = kobject_create_and_add("cca", firmware_kobj);
> +	if (!cca_kobj)
> +		return -ENOMEM;
> +
> +	ret = sysfs_create_files(cca_kobj, cca_realm_attrs);
> +	if (!ret)
> +		return 0;
> +
> +	kobject_put(cca_kobj);
> +	return ret;
> +}
> +device_initcall(realm_sysfs_init);

If you make it to here ;), I'd also split this patch in two as per
Jonathan's suggestion on the previous version.

-- 
Catalin
