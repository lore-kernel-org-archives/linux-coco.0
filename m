Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 352501A073F
	for <linux-coco@lists.linux.dev>; Tue,  1 Jul 2025 06:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751351360; cv=none; b=cr38i2cBGT3z/LxZeW2elt8/GeeJu/bQSSfLruBZkvtmmWoI92duhFPVOSg5K5NEfWEeOfTxpnsC74cglJcJkUvySqE1cDCKXshTzcePvkaaJuTuT7bKUPwX06UsVaxHINSVTQFX2xg1oKKrqQiZUBR/qilRBN0vHtBlNOUVE6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751351360; c=relaxed/simple;
	bh=wPwMbaTNYVPpuLtF9kwK+jQrhw+TccxDKh96eVVowNQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GMdn18O6urNpPvqXYvBLLZB/T/8HNmHhl+3TuUx7br/D1jnL8AcoyxVyJHHnx2R/iAI6lpxMvf2s9lWSMz1prn8ihw3iPWK6BL3APsP7QzVs0jxnqAI92R7k+U4J2LYikR76xkaCl5ALy/TXZXFFhb3Vi6hvVa6GLzAtEoXPDsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Vgn2YrfL; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Vgn2YrfL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751351357;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3XQWfv7zNSIOP37t1HIUNsQ/ruDM0uRKKhFK+dc8Tj4=;
	b=Vgn2YrfLTxNOg41+MfGlYWR/RhjyFg6ZIlGRkYh1fsLXhbqL0gVvMWi5SmLZ6dOctwvARN
	EOvxpmTbh0tnrUSohJRyJ86uooW0KhxTm47XZAelzi9EaPFQsrywOuciYX6Qg6Jxtf7SpW
	zgp0Jft895ASE9Bn2hoqJB6Rt/Vn+ng=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-547-LK1RGVZwOsyLMokDlKaLPg-1; Tue, 01 Jul 2025 02:29:16 -0400
X-MC-Unique: LK1RGVZwOsyLMokDlKaLPg-1
X-Mimecast-MFC-AGG-ID: LK1RGVZwOsyLMokDlKaLPg_1751351355
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-311ef4fb5eeso4320629a91.1
        for <linux-coco@lists.linux.dev>; Mon, 30 Jun 2025 23:29:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751351355; x=1751956155;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3XQWfv7zNSIOP37t1HIUNsQ/ruDM0uRKKhFK+dc8Tj4=;
        b=V5f9mAPLYlehtSZdvT4lSrG98JPv+t4ViMO1WXBGsgat6wWlxLZG28qhwNV9gpnCrG
         /lDHyqpV+PCOtX9b56s29umFeqo8n1onjcNpbtQ/fcOYe7Fn/zMR38c0pdn2F5PXvFK2
         KLh0eoFbITXwTHaubf4EBSM3ACwkyuFZVfI7XEsLjX23zRjwg7AFC3N1msx/0V6wpOqy
         eXui8i/ZXwd94RSI6uZPX8xagpj06pWTalAB/oDWK1Qm8Y2ZOisY3iN9VaJ3MlNfn5+6
         4ozuHhmVPq34+fhYKSXCt56M90rLSG0JmxDNOmF2uDm8eyGWG73j8bEW1z+7TdSZmzoe
         HcGQ==
X-Forwarded-Encrypted: i=1; AJvYcCUyT/XCeVID9GUyYafv/9eMbGr+jojamtawFWh/zq0H5EGOxu+zey2sVrX4jd3GtbS3ZcpFtOGM50H9@lists.linux.dev
X-Gm-Message-State: AOJu0YzaslBYZiIAM7gTIhe6NKGYqlU0HUsVEXS+enz5pHfEb7adK+eu
	kZtgjsxpjxuzLnH6O5G9Uog/Qa3MUegGKPtbH8HSGYJYzjf+huHFQYQ/JjebUEv7Ss15PWQJxhm
	TFSn4Q2G6IQdm+qhg73Z4rSAiC7+n0yj2oByOp3jYKVImL1r9K22ibE7soQ+P/g4=
X-Gm-Gg: ASbGnct90LsiiHunyUpyYr6ZIMAl/MG9uEFd6ExdHdRuvSiPjRL8e9mq5tkDOWfxrqP
	GQZHxdMmg8odL+wqU3Q9KiLZqaIIBigjJrfxsg6HE8nxVQxgLPDb/LcZ66CA8AvMxntCahzugut
	KLMPM1H5EzinG3ng2IZV14409ePbOWsGf92RhgcuGltlL5BwVo6m56mWpfmn0eX7scjWVanUYY9
	HRgLSFYFhcVUUfH2p0LKykd2SK60CdJKCfOtIaLRYlEicZsj7PjxbzaBL6QwVXVdv4WIN9DyBxO
	w72e5I4kRfDgNzDWhGCZYg9sfo4llHOzUw6VhXEmplsSS1kS5C966rCt7OPlOQ==
X-Received: by 2002:a17:90b:1e04:b0:315:f6d6:d29c with SMTP id 98e67ed59e1d1-31939b7c842mr3882743a91.15.1751351354721;
        Mon, 30 Jun 2025 23:29:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFV59dFp5Bv5xxfg5s1htC6r8rxsnnWuAaKM+NdCPbEnHIq4j0m9QvOPuGsAf4a/budVvDMUA==
X-Received: by 2002:a17:90b:1e04:b0:315:f6d6:d29c with SMTP id 98e67ed59e1d1-31939b7c842mr3882694a91.15.1751351354234;
        Mon, 30 Jun 2025 23:29:14 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-62-5.mrk21.qld.optusnet.com.au. [175.34.62.5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-315f53bdbf4sm15771349a91.22.2025.06.30.23.29.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jun 2025 23:29:13 -0700 (PDT)
Message-ID: <60e5f88e-c8f1-40d9-a69c-e7da4fc1c953@redhat.com>
Date: Tue, 1 Jul 2025 16:29:03 +1000
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 06/43] arm64: RME: Define the user ABI
To: Steven Price <steven.price@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>,
 Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>,
 Oliver Upton <oliver.upton@linux.dev>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu
 <yuzenghui@huawei.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 Christoffer Dall <christoffer.dall@arm.com>, Fuad Tabba <tabba@google.com>,
 linux-coco@lists.linux.dev,
 Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
 Shanker Donthineni <sdonthineni@nvidia.com>, Alper Gun
 <alpergun@google.com>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
 Emi Kisanuki <fj0570is@fujitsu.com>
References: <20250611104844.245235-1-steven.price@arm.com>
 <20250611104844.245235-7-steven.price@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20250611104844.245235-7-steven.price@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 6uuOLWmzWAXe_sm9oCxykAoMk8laxxPHXlUt3YYVAu4_1751351355
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/11/25 8:48 PM, Steven Price wrote:
> There is one (multiplexed) CAP which can be used to create, populate and
> then activate the realm.
> 
> Co-developed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
> Changes since v8:
>   * Minor improvements to documentation following review.
>   * Bump the magic numbers to avoid conflicts.
> Changes since v7:
>   * Add documentation of new ioctls
>   * Bump the magic numbers to avoid conflicts
> Changes since v6:
>   * Rename some of the symbols to make their usage clearer and avoid
>     repetition.
> Changes from v5:
>   * Actually expose the new VCPU capability (KVM_ARM_VCPU_REC) by bumping
>     KVM_VCPU_MAX_FEATURES - note this also exposes KVM_ARM_VCPU_HAS_EL2!
> ---
>   Documentation/virt/kvm/api.rst    | 73 ++++++++++++++++++++++++++++++-
>   arch/arm64/include/uapi/asm/kvm.h | 49 +++++++++++++++++++++
>   include/uapi/linux/kvm.h          | 10 +++++
>   3 files changed, 131 insertions(+), 1 deletion(-)
> 

With below nitpicks addressed:

Reviewed-by: Gavin Shan <gshan@redhat.com>

> diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
> index 1bd2d42e6424..65543289f75c 100644
> --- a/Documentation/virt/kvm/api.rst
> +++ b/Documentation/virt/kvm/api.rst
> @@ -3542,6 +3542,11 @@ Possible features:
>   	  Depends on KVM_CAP_ARM_EL2_E2H0.
>   	  KVM_ARM_VCPU_HAS_EL2 must also be set.
>   
> +	- KVM_ARM_VCPU_REC: Allocate a REC (Realm Execution Context) for this
> +	  VCPU. This must be specified on all VCPUs created in a Realm VM.
> +	  Depends on KVM_CAP_ARM_RME.
> +	  Requires KVM_ARM_VCPU_FINALIZE(KVM_ARM_VCPU_REC).
> +
>   4.83 KVM_ARM_PREFERRED_TARGET
>   -----------------------------
>   
> @@ -5115,6 +5120,7 @@ Recognised values for feature:
>   
>     =====      ===========================================
>     arm64      KVM_ARM_VCPU_SVE (requires KVM_CAP_ARM_SVE)
> +  arm64      KVM_ARM_VCPU_REC (requires KVM_CAP_ARM_RME)
>     =====      ===========================================
>   
>   Finalizes the configuration of the specified vcpu feature.
> @@ -6469,6 +6475,30 @@ the capability to be present.
>   
>   `flags` must currently be zero.
>   
> +4.144 KVM_ARM_VCPU_RMM_PSCI_COMPLETE
> +------------------------------------
> +
> +:Capability: KVM_CAP_ARM_RME
> +:Architectures: arm64
> +:Type: vcpu ioctl
> +:Parameters: struct kvm_arm_rmm_psci_complete (in)
> +:Returns: 0 if successful, < 0 on error
> +
> +::
> +
> +  struct kvm_arm_rmm_psci_complete {
> +	__u64 target_mpidr;
> +	__u32 psci_status;
> +	__u32 padding[3];
> +  };
> +
> +Where PSCI functions are handled by user space, the RMM needs to be informed of
> +the target of the operation using `target_mpidr`, along with the status
> +(`psci_status`). The RMM v1.0 specification defines two functions that require
> +this call: PSCI_CPU_ON and PSCI_AFFINITY_INFO.
> +
> +If the kernel is handling PSCI then this is done automatically and the VMM
> +doesn't need to call this ioctl.
>   
>   .. _kvm_run:
>   
> @@ -8528,7 +8558,7 @@ ENOSYS for the others.
>   When enabled, KVM will exit to userspace with KVM_EXIT_SYSTEM_EVENT of
>   type KVM_SYSTEM_EVENT_SUSPEND to process the guest suspend request.
>   
> -7.37 KVM_CAP_ARM_WRITABLE_IMP_ID_REGS
> +7.42 KVM_CAP_ARM_WRITABLE_IMP_ID_REGS
>   -------------------------------------
>   
>   :Architectures: arm64
> @@ -8557,6 +8587,47 @@ given VM.
>   When this capability is enabled, KVM resets the VCPU when setting
>   MP_STATE_INIT_RECEIVED through IOCTL.  The original MP_STATE is preserved.
>   
> +7.44 KVM_CAP_ARM_RME
> +--------------------
> +
> +:Architectures: arm64
> +:Target: VM
> +:Parameters: args[0] provides an action, args[1] points to a structure in
> +	     memory for some actions.
           ^^^
           Alignment

s/for some actions/for the action

> +:Returns: 0 on success, negative value on error
> +
> +Used to configure and set up the memory for a Realm. The available actions are:
> +
> +================================= =============================================
> + KVM_CAP_ARM_RME_CONFIG_REALM     Takes struct arm_rme_config as args[1] and
> +                                  configures realm parameters prior to it being
> +                                  created.
> +
> +                                  Options are ARM_RME_CONFIG_RPV to set the
> +                                  "Realm Personalization Value" and
> +                                  ARM_RME_CONFIG_HASH_ALGO to set the hash
> +                                  algorithm.
> +
> + KVM_CAP_ARM_RME_CREATE_REALM     Request the RMM to create the realm. The
> +                                  realm's configuration parameters must be set
> +                                  first.
> +
> + KVM_CAP_ARM_RME_INIT_RIPAS_REALM Takes struct arm_rme_init_ripas as args[1]
> +                                  and sets the RIPAS (Realm IPA State) to
> +                                  RIPAS_RAM of a specified area of the realm's
> +                                  IPA.
> +
> + KVM_CAP_ARM_RME_POPULATE_REALM   Takes struct arm_rme_populate_realm as
> +                                  args[1] and populates a region of protected
> +                                  address space by copying the data from the
> +                                  shared alias.
> +
> + KVM_CAP_ARM_RME_ACTIVATE_REALM   Request the RMM to activate the realm. No
> +                                  changes can be made to the Realm's memory,
> +                                  IPA state or configuration parameters.  No
> +                                  new VCPUs should be created after this step.
> +================================= =============================================
> +

The description about KVM_CAP_ARM_RME_ACTIVATE_REALM looks a bit confusing, maybe
something as below is more clear:

KVM_CAP_ARM_RME_ACTIVATE_REALM     Request the RMM to activate the realm. No changes
                                    can be made to the Realm's populated memory, IPA state,
                                    configuration parameters or vCPU addition after this
                                    step.

>   8. Other capabilities.
>   ======================
>   
> diff --git a/arch/arm64/include/uapi/asm/kvm.h b/arch/arm64/include/uapi/asm/kvm.h
> index ed5f3892674c..9b5d67ecbc5e 100644
> --- a/arch/arm64/include/uapi/asm/kvm.h
> +++ b/arch/arm64/include/uapi/asm/kvm.h
> @@ -106,6 +106,7 @@ struct kvm_regs {
>   #define KVM_ARM_VCPU_PTRAUTH_GENERIC	6 /* VCPU uses generic authentication */
>   #define KVM_ARM_VCPU_HAS_EL2		7 /* Support nested virtualization */
>   #define KVM_ARM_VCPU_HAS_EL2_E2H0	8 /* Limit NV support to E2H RES0 */
> +#define KVM_ARM_VCPU_REC		9 /* VCPU REC state as part of Realm */
>   
>   struct kvm_vcpu_init {
>   	__u32 target;
> @@ -429,6 +430,54 @@ enum {
>   #define   KVM_DEV_ARM_VGIC_SAVE_PENDING_TABLES	3
>   #define   KVM_DEV_ARM_ITS_CTRL_RESET		4
>   
> +/* KVM_CAP_ARM_RME on VM fd */
> +#define KVM_CAP_ARM_RME_CONFIG_REALM		0
> +#define KVM_CAP_ARM_RME_CREATE_REALM		1
> +#define KVM_CAP_ARM_RME_INIT_RIPAS_REALM	2
> +#define KVM_CAP_ARM_RME_POPULATE_REALM		3
> +#define KVM_CAP_ARM_RME_ACTIVATE_REALM		4
> +
> +/* List of configuration items accepted for KVM_CAP_ARM_RME_CONFIG_REALM */
> +#define ARM_RME_CONFIG_RPV			0
> +#define ARM_RME_CONFIG_HASH_ALGO		1
> +
> +#define ARM_RME_CONFIG_HASH_ALGO_SHA256		0
> +#define ARM_RME_CONFIG_HASH_ALGO_SHA512		1
> +
> +#define ARM_RME_CONFIG_RPV_SIZE 64
> +
> +struct arm_rme_config {
> +	__u32 cfg;
> +	union {
> +		/* cfg == ARM_RME_CONFIG_RPV */
> +		struct {
> +			__u8	rpv[ARM_RME_CONFIG_RPV_SIZE];
> +		};
> +
> +		/* cfg == ARM_RME_CONFIG_HASH_ALGO */
> +		struct {
> +			__u32	hash_algo;
> +		};
> +
> +		/* Fix the size of the union */
> +		__u8	reserved[256];
> +	};
> +};
> +
> +#define KVM_ARM_RME_POPULATE_FLAGS_MEASURE	(1 << 0)
> +struct arm_rme_populate_realm {
> +	__u64 base;
> +	__u64 size;
> +	__u32 flags;
> +	__u32 reserved[3];
> +};
> +
> +struct arm_rme_init_ripas {
> +	__u64 base;
> +	__u64 size;
> +	__u64 reserved[2];
> +};
> +
>   /* Device Control API on vcpu fd */
>   #define KVM_ARM_VCPU_PMU_V3_CTRL	0
>   #define   KVM_ARM_VCPU_PMU_V3_IRQ		0
> diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
> index d00b85cb168c..3690664e272c 100644
> --- a/include/uapi/linux/kvm.h
> +++ b/include/uapi/linux/kvm.h
> @@ -934,6 +934,7 @@ struct kvm_enable_cap {
>   #define KVM_CAP_ARM_EL2 240
>   #define KVM_CAP_ARM_EL2_E2H0 241
>   #define KVM_CAP_RISCV_MP_STATE_RESET 242
> +#define KVM_CAP_ARM_RME 243
>   
>   struct kvm_irq_routing_irqchip {
>   	__u32 irqchip;
> @@ -1586,4 +1587,13 @@ struct kvm_pre_fault_memory {
>   	__u64 padding[5];
>   };
>   
> +/* Available with KVM_CAP_ARM_RME, only for VMs with KVM_VM_TYPE_ARM_REALM  */
> +struct kvm_arm_rmm_psci_complete {
> +	__u64 target_mpidr;
> +	__u32 psci_status;
> +	__u32 padding[3];
> +};
> +
> +#define KVM_ARM_VCPU_RMM_PSCI_COMPLETE	_IOW(KVMIO, 0xd6, struct kvm_arm_rmm_psci_complete)
> +
>   #endif /* __LINUX_KVM_H */

Thanks,
Gavin

