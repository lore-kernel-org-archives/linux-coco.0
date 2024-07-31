Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C7591DA32
	for <linux-coco@lists.linux.dev>; Wed, 31 Jul 2024 13:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722432279; cv=none; b=FUGmWdYOxMQCWlPS1tKGil5Jb/FzOSVukoK7vVz1+VgsfUCjA7B0Lmc2H9KE2rGm6y2Dv++UQ1GVKHoxIZMC2IEk1MffT53ZFgZSfepYJkZ41df3AsKrZ8uc5yE4WreCB/MZQ+sBSbUFxFVBqKsIiRl0H+qq4fQKkaozpIJdmy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722432279; c=relaxed/simple;
	bh=Qt/TuqtRDWyI3Aj563KtSm+L9ik0hi0Mv4YywiGpWJQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=u9JTzEWPj0uMrUxs9C7i4IHN6DHDff/KzIkHO/xssKZHXMpLRXNQBfY4tA981Y5jLaQRhRj/7UuIBl5Sa8aU8lEoZ+ktoHpzALJzPzLGoRRH+UWO/aAOzP3BOgtxoyzHMhJA8JkzIbmc/iOuwHv7W3tXFaDMgSp+ep2x1mAzVRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EKQNbWOC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EKQNbWOC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44235C32786;
	Wed, 31 Jul 2024 13:24:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722432278;
	bh=Qt/TuqtRDWyI3Aj563KtSm+L9ik0hi0Mv4YywiGpWJQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=EKQNbWOCTgydGF4lpzl1zf2RHgQFY5p1vgUotCCZ/yuLkEJ88Pu+FKozm199miI/w
	 w05hY1HubqJNj9NxsjBaeU33Lk79fPvKRvSipm9o/QEWXm4mvwCaGSYCsXGh+fG+/k
	 znbZgFLzf1VLxy4ribELkdKSXCTum/cp8dOVLdoGNdick53vR/ou57FzxIEIHFOfDr
	 yJBWvNaXcngxDpYLu7ZVqBynKPpyDb76a1R0KsZL2bYmzGDvabhHpXoGLGomfRi5fo
	 sLbP68V4W5i8cptsNk///N3+UBD8AHPc2DGp1rlG2TW6GGXbYB8T3299A5bUB7i2iL
	 y1lOn511EMYmg==
X-Mailer: emacs 31.0.50 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
Cc: Will Deacon <will@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Suzuki Poulose <suzuki.poulose@arm.com>,
	Steven Price <steven.price@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Marc Zyngier <maz@kernel.org>, linux-coco@lists.linux.dev
Subject: Re: [PATCH 6/6] drivers/virt: pkvm: Intercept ioremap using pKVM
 MMIO_GUARD hypercall
In-Reply-To: <20240730151113.1497-7-will@kernel.org>
References: <20240730151113.1497-1-will@kernel.org>
 <20240730151113.1497-7-will@kernel.org>
Date: Wed, 31 Jul 2024 18:54:30 +0530
Message-ID: <yq5awml1u229.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Will Deacon <will@kernel.org> writes:

> Hook up pKVM's MMIO_GUARD hypercall so that ioremap() and friends will
> register the target physical address as MMIO with the hypervisor,
> allowing guest exits to that page to be emulated by the host with full
> syndrome information.
>
> Signed-off-by: Will Deacon <will@kernel.org>
> ---
>  Documentation/virt/kvm/arm/hypercalls.rst     | 26 ++++++++++++++
>  drivers/virt/coco/pkvm-guest/arm-pkvm-guest.c | 35 +++++++++++++++++++
>  include/linux/arm-smccc.h                     |  7 ++++
>  3 files changed, 68 insertions(+)
>
> diff --git a/Documentation/virt/kvm/arm/hypercalls.rst b/Documentation/virt/kvm/arm/hypercalls.rst
> index c42580e71bf8..af7bc2c2e0cb 100644
> --- a/Documentation/virt/kvm/arm/hypercalls.rst
> +++ b/Documentation/virt/kvm/arm/hypercalls.rst
> @@ -116,3 +116,29 @@ memory protection granule advertised by ``ARM_SMCCC_KVM_FUNC_HYP_MEMINFO``.
>  |                     |          |    +---------------------------------------------+
>  |                     |          |    | ``INVALID_PARAMETER (-3)``                  |
>  +---------------------+----------+----+---------------------------------------------+
> +
> +``ARM_SMCCC_KVM_FUNC_MMIO_GUARD``
> +----------------------------------
> +
> +Request that a given memory region is handled as MMIO by the hypervisor,
> +allowing accesses to this region to be emulated by the KVM host. The size of the
> +region is equal to the memory protection granule advertised by
> +``ARM_SMCCC_KVM_FUNC_HYP_MEMINFO``.
> +
> ++---------------------+-------------------------------------------------------------+
> +| Presence:           | Optional; pKVM protected guests only.                       |
> ++---------------------+-------------------------------------------------------------+
> +| Calling convention: | HVC64                                                       |
> ++---------------------+----------+--------------------------------------------------+
> +| Function ID:        | (uint32) | 0xC6000007                                       |
> ++---------------------+----------+----+---------------------------------------------+
> +| Arguments:          | (uint64) | R1 | Base IPA of MMIO memory region              |
> +|                     +----------+----+---------------------------------------------+
> +|                     | (uint64) | R2 | Reserved / Must be zero                     |
> +|                     +----------+----+---------------------------------------------+
> +|                     | (uint64) | R3 | Reserved / Must be zero                     |
> ++---------------------+----------+----+---------------------------------------------+
> +| Return Values:      | (int64)  | R0 | ``SUCCESS (0)``                             |
> +|                     |          |    +---------------------------------------------+
> +|                     |          |    | ``INVALID_PARAMETER (-3)``                  |
> ++---------------------+----------+----+---------------------------------------------+
>

Ok you need a SMCCC call not just a pgprot_t update. 

> diff --git a/drivers/virt/coco/pkvm-guest/arm-pkvm-guest.c b/drivers/virt/coco/pkvm-guest/arm-pkvm-guest.c
> index 8256cf68fd76..56a3859dda8a 100644
> --- a/drivers/virt/coco/pkvm-guest/arm-pkvm-guest.c
> +++ b/drivers/virt/coco/pkvm-guest/arm-pkvm-guest.c
> @@ -9,8 +9,10 @@
>  
>  #include <linux/arm-smccc.h>
>  #include <linux/array_size.h>
> +#include <linux/io.h>
>  #include <linux/mem_encrypt.h>
>  #include <linux/mm.h>
> +#include <linux/pgtable.h>
>  
>  #include <asm/hypervisor.h>
>  
> @@ -67,6 +69,36 @@ static const struct arm64_mem_crypt_ops pkvm_crypt_ops = {
>  	.decrypt	= pkvm_set_memory_decrypted,
>  };
>  
> +static int mmio_guard_ioremap_hook(phys_addr_t phys, size_t size,
> +				   pgprot_t *prot)
> +{
> +	phys_addr_t end;
> +	pteval_t protval = pgprot_val(*prot);
> +
> +	/*
> +	 * We only expect MMIO emulation for regions mapped with device
> +	 * attributes.
> +	 */
> +	if (protval != PROT_DEVICE_nGnRE && protval != PROT_DEVICE_nGnRnE)
> +		return 0;
> +
> +	phys = PAGE_ALIGN_DOWN(phys);
> +	end = phys + PAGE_ALIGN(size);
> +
> +	while (phys < end) {
> +		const int func_id = ARM_SMCCC_VENDOR_HYP_KVM_MMIO_GUARD_FUNC_ID;
> +		int err;
> +
> +		err = arm_smccc_do_one_page(func_id, phys);
> +		if (err)
> +			return err;
> +
> +		phys += PAGE_SIZE;
> +	}
> +
> +	return 0;
> +}
> +
>  void pkvm_init_hyp_services(void)
>  {
>  	int i;
> @@ -89,4 +121,7 @@ void pkvm_init_hyp_services(void)
>  
>  	pkvm_granule = res.a0;
>  	arm64_mem_crypt_ops_register(&pkvm_crypt_ops);
> +
> +	if (kvm_arm_hyp_service_available(ARM_SMCCC_KVM_FUNC_MMIO_GUARD))
> +		arm64_ioremap_prot_hook_register(&mmio_guard_ioremap_hook);
>  }
> diff --git a/include/linux/arm-smccc.h b/include/linux/arm-smccc.h
> index 9cb7c95920b0..e93c1f7cea70 100644
> --- a/include/linux/arm-smccc.h
> +++ b/include/linux/arm-smccc.h
> @@ -118,6 +118,7 @@
>  #define ARM_SMCCC_KVM_FUNC_HYP_MEMINFO		2
>  #define ARM_SMCCC_KVM_FUNC_MEM_SHARE		3
>  #define ARM_SMCCC_KVM_FUNC_MEM_UNSHARE		4
> +#define ARM_SMCCC_KVM_FUNC_MMIO_GUARD		7
>  #define ARM_SMCCC_KVM_FUNC_FEATURES_2		127
>  #define ARM_SMCCC_KVM_NUM_FUNCS			128
>  
> @@ -158,6 +159,12 @@
>  			   ARM_SMCCC_OWNER_VENDOR_HYP,			\
>  			   ARM_SMCCC_KVM_FUNC_MEM_UNSHARE)
>  
> +#define ARM_SMCCC_VENDOR_HYP_KVM_MMIO_GUARD_FUNC_ID			\
> +	ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL,				\
> +			   ARM_SMCCC_SMC_64,				\
> +			   ARM_SMCCC_OWNER_VENDOR_HYP,			\
> +			   ARM_SMCCC_KVM_FUNC_MMIO_GUARD)
> +
>  /* ptp_kvm counter type ID */
>  #define KVM_PTP_VIRT_COUNTER			0
>  #define KVM_PTP_PHYS_COUNTER			1
> -- 
> 2.46.0.rc1.232.g9752f9e123-goog
