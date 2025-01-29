Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB02518FDB2
	for <linux-coco@lists.linux.dev>; Wed, 29 Jan 2025 04:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738126237; cv=none; b=GQVwpE7lx3HPSH2+41Uh1BfDEquLwOOGqSr+aebbOy6HfkVAHmXvpIG+s0/uqpWF4G3Z9fM77/JvryuV+d0O8SyOekCa4l18uczBngRzXdgyuhTgkeKJr7nOX4f34x520AUZWwYO2kAnoSa23eBK+HwWgilGBIFijLdChhhODuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738126237; c=relaxed/simple;
	bh=YYUC6GKqVjKjSa8HQ0ij/8CMuynJrEIMoqLwa8xg9LE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PW8f2nLohAULc/+/VL6CcMLNjyJcmMShWTng4nmqH/qmiGs1vwoQZTATAUwYntISRbcEIRvNRVkALzU1wYwT35rrnBtqE3fB/2eyfKtCf8AYAEQWEYqLWIq1ghpDeAE3y7KFZ49C5cW0aov3NhyKMzWhYjNgFogxDpAsuBB7DPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hONiztzs; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hONiztzs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738126234;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dnie7b2QLZHOtsz9Z4JDce0HC9WOty7SOXWzLQevN+A=;
	b=hONiztzsu1LQZRRE9Tx8d0jVJwwxXMg61NqjNZH3QjNSeofjmOMIzfMdPFgC2/EoCD+jKY
	krJsRNfOiGJ9OnQJKnIy96vf7733rbKUuOhCfrhDYSu1C9b4bhaxbItoCWAE2eBnI7u1yZ
	y86YBv2iU64S+RkD85wZu6Uq/nnKYis=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-428-NtxCW7uROCapwrG1eGOwqQ-1; Tue, 28 Jan 2025 23:50:31 -0500
X-MC-Unique: NtxCW7uROCapwrG1eGOwqQ-1
X-Mimecast-MFC-AGG-ID: NtxCW7uROCapwrG1eGOwqQ
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-21681a2c0d5so115871845ad.2
        for <linux-coco@lists.linux.dev>; Tue, 28 Jan 2025 20:50:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738126230; x=1738731030;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dnie7b2QLZHOtsz9Z4JDce0HC9WOty7SOXWzLQevN+A=;
        b=mgqC1xR4KTZ/3Gs1ynTUL0JtDT48ZxgRY70oTczWa2HrgBqvbInHeUHvrAc7mppX7F
         oIhuh7AkQaJSaVA57Bi6nQm0JCBD+UOrigKbyvi4531dH6RwhQ2pZCVOiY8XHomBgf7z
         hryLX45jP1THjcLyLRICG7IB/OVofmTVYAKnVSIStNK/YOcvEWeQZ+ccSrEnyQTyG0aU
         7IJLIUfjAn0uq1tcDK4yVtSDMygrBDghwW0YjNgYa8jxpiGWW6iCM8n+fIkqcZlWLKr1
         SPuHRnkaq2L+zsHb8gH/WahWDgVQDli9zPu9WAnVoSaqO9sbYMiuM5RbnNddDvYT9dRu
         CI7A==
X-Forwarded-Encrypted: i=1; AJvYcCW7iWHoomTPkcRPwsPL7/rv53H8QAQIcvlxYW0IaUeb+1GS68Gx9w28IHsyWYxBeNQ+I/2egVf+MwWM@lists.linux.dev
X-Gm-Message-State: AOJu0YyxLROv1So+aXcFvxNc3pzVfJc8jnhMi72495oUnxU3IXaYgqYl
	QrDr8m/wB8gPUHZX/ZaDJdSDtMpCgMTLo744R57d2O4wjOGD6igwAA8ZwXkh9CVoRkGKXgcKMk2
	z77raA8T5Cs+2iV8TfIHhU9abkZgsQBWwFbqsoBa1o0ZZFoEZOh/5q5Y06j4=
X-Gm-Gg: ASbGnctv5FPMGYEdBMugbwvT75X2MCxems//kCoF8agFSvgS0819Bg/StFkMKHQ269S
	qoKkqodX1OOo7O7Z5FohTR0QCKuFeu9XyfvhsmNlIwAmpxBGDVE60MdpTkZl2+qS3PzEK9Xc6PH
	W6P9BmPZ5q5h58cis3nXUB0Lr2voYngpihotDX2YcKB8kkzsDRucQbiP437SelCHC43ldd0V4o4
	Z7leTkAYm7hX1vebUO7kzmUxGlNIsIY+p2tosIGIkM9cUnU6D+nkNy6MsMJD6iW+rEhykbtb8Wq
	37rz+w==
X-Received: by 2002:a17:902:e742:b0:215:a97a:c6bb with SMTP id d9443c01a7336-21dd7c65891mr25754305ad.12.1738126230206;
        Tue, 28 Jan 2025 20:50:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHMqKCsMqj6oPSufQyu9NcOncGLMFRZQV6U3d6wG1hA9zWz3o8a6Zro3eM6yrw9ZTQ1ckrhUw==
X-Received: by 2002:a17:902:e742:b0:215:a97a:c6bb with SMTP id d9443c01a7336-21dd7c65891mr25753985ad.12.1738126229836;
        Tue, 28 Jan 2025 20:50:29 -0800 (PST)
Received: from [192.168.68.55] ([180.233.125.64])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21da4141536sm89662845ad.156.2025.01.28.20.50.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jan 2025 20:50:29 -0800 (PST)
Message-ID: <9a543b6f-5487-4159-89fb-73d9b6749a01@redhat.com>
Date: Wed, 29 Jan 2025 14:50:21 +1000
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 12/43] arm64: RME: Allocate/free RECs to match vCPUs
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
 <alpergun@google.com>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>
References: <20241212155610.76522-1-steven.price@arm.com>
 <20241212155610.76522-13-steven.price@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20241212155610.76522-13-steven.price@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: OXnqsPSJVVmOoEXpkazV6WlLzwxtsZK0yEyJNORyM_M_1738126230
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/13/24 1:55 AM, Steven Price wrote:
> The RMM maintains a data structure known as the Realm Execution Context
> (or REC). It is similar to struct kvm_vcpu and tracks the state of the
> virtual CPUs. KVM must delegate memory and request the structures are
> created when vCPUs are created, and suitably tear down on destruction.
> 
> RECs must also be supplied with addition pages - auxiliary (or AUX)
> granules - for storing the larger registers state (e.g. for SVE). The
> number of AUX granules for a REC depends on the parameters with which
> the Realm was created - the RMM makes this information available via the
> RMI_REC_AUX_COUNT call performed after creating the Realm Descriptor (RD).
> 
> Note that only some of register state for the REC can be set by KVM, the
> rest is defined by the RMM (zeroed). The register state then cannot be
> changed by KVM after the REC is created (except when the guest
> explicitly requests this e.g. by performing a PSCI call). The RMM also
> requires that the VMM creates RECs in ascending order of the MPIDR.
> 
> See Realm Management Monitor specification (DEN0137) for more information:
> https://developer.arm.com/documentation/den0137/
> 
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
> Changes since v5:
>   * Separate the concept of vcpu_is_rec() and
>     kvm_arm_vcpu_rec_finalized() by using the KVM_ARM_VCPU_REC feature as
>     the indication that the VCPU is a REC.
> Changes since v2:
>   * Free rec->run earlier in kvm_destroy_realm() and adapt to previous patches.
> ---
>   arch/arm64/include/asm/kvm_emulate.h |   7 ++
>   arch/arm64/include/asm/kvm_host.h    |   3 +
>   arch/arm64/include/asm/kvm_rme.h     |  18 ++++
>   arch/arm64/kvm/arm.c                 |   9 ++
>   arch/arm64/kvm/reset.c               |  11 ++
>   arch/arm64/kvm/rme.c                 | 144 +++++++++++++++++++++++++++
>   6 files changed, 192 insertions(+)
> 
> diff --git a/arch/arm64/include/asm/kvm_emulate.h b/arch/arm64/include/asm/kvm_emulate.h
> index 27f54a7778aa..ec2b6d9c9c07 100644
> --- a/arch/arm64/include/asm/kvm_emulate.h
> +++ b/arch/arm64/include/asm/kvm_emulate.h
> @@ -722,7 +722,14 @@ static inline bool kvm_realm_is_created(struct kvm *kvm)
>   
>   static inline bool vcpu_is_rec(struct kvm_vcpu *vcpu)
>   {
> +	if (static_branch_unlikely(&kvm_rme_is_available))
> +		return vcpu_has_feature(vcpu, KVM_ARM_VCPU_REC);
>   	return false;
>   }
>   

It seems the check on kvm_rme_is_available is unnecessary because KVM_ARM_VCPU_REC
is possible to be true only when kvm_rme_is_available is true.

> +static inline bool kvm_arm_vcpu_rec_finalized(struct kvm_vcpu *vcpu)
> +{
> +	return vcpu->arch.rec.mpidr != INVALID_HWID;
> +}
> +
>   #endif /* __ARM64_KVM_EMULATE_H__ */

I would suggest to rename to kvm_arm_rec_finalized() since vCPU and REC are
similar objects at the same level. It'd better to avoid duplicate object
name reference in the function name.

> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
> index 8482638dce3b..220195c727ef 100644
> --- a/arch/arm64/include/asm/kvm_host.h
> +++ b/arch/arm64/include/asm/kvm_host.h
> @@ -789,6 +789,9 @@ struct kvm_vcpu_arch {
>   
>   	/* Per-vcpu CCSIDR override or NULL */
>   	u32 *ccsidr;
> +
> +	/* Realm meta data */
> +	struct realm_rec rec;
>   };
>   
>   /*
> diff --git a/arch/arm64/include/asm/kvm_rme.h b/arch/arm64/include/asm/kvm_rme.h
> index 32bdedf1d866..62d4a63d3035 100644
> --- a/arch/arm64/include/asm/kvm_rme.h
> +++ b/arch/arm64/include/asm/kvm_rme.h
> @@ -6,6 +6,7 @@
>   #ifndef __ASM_KVM_RME_H
>   #define __ASM_KVM_RME_H
>   
> +#include <asm/rmi_smc.h>
>   #include <uapi/linux/kvm.h>
>   
>   /**
> @@ -65,6 +66,21 @@ struct realm {
>   	unsigned int ia_bits;
>   };
>   
> +/**
> + * struct realm_rec - Additional per VCPU data for a Realm
> + *
> + * @mpidr: MPIDR (Multiprocessor Affinity Register) value to identify this VCPU
> + * @rec_page: Kernel VA of the RMM's private page for this REC
> + * @aux_pages: Additional pages private to the RMM for this REC
> + * @run: Kernel VA of the RmiRecRun structure shared with the RMM
> + */
> +struct realm_rec {
> +	unsigned long mpidr;
> +	void *rec_page;
> +	struct page *aux_pages[REC_PARAMS_AUX_GRANULES];
> +	struct rec_run *run;
> +};
> +
>   void kvm_init_rme(void);
>   u32 kvm_realm_ipa_limit(void);
>   
> @@ -72,6 +88,8 @@ int kvm_realm_enable_cap(struct kvm *kvm, struct kvm_enable_cap *cap);
>   int kvm_init_realm_vm(struct kvm *kvm);
>   void kvm_destroy_realm(struct kvm *kvm);
>   void kvm_realm_destroy_rtts(struct kvm *kvm, u32 ia_bits);
> +int kvm_create_rec(struct kvm_vcpu *vcpu);
> +void kvm_destroy_rec(struct kvm_vcpu *vcpu);
>   
>   #define RMM_RTT_BLOCK_LEVEL	2
>   #define RMM_RTT_MAX_LEVEL	3
> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> index 73016e1e0067..2d97147651be 100644
> --- a/arch/arm64/kvm/arm.c
> +++ b/arch/arm64/kvm/arm.c
> @@ -525,6 +525,8 @@ int kvm_arch_vcpu_create(struct kvm_vcpu *vcpu)
>   	/* Force users to call KVM_ARM_VCPU_INIT */
>   	vcpu_clear_flag(vcpu, VCPU_INITIALIZED);
>   
> +	vcpu->arch.rec.mpidr = INVALID_HWID;
> +
>   	vcpu->arch.mmu_page_cache.gfp_zero = __GFP_ZERO;
>   
>   	/* Set up the timer */
> @@ -1467,6 +1469,9 @@ static unsigned long system_supported_vcpu_features(void)
>   	if (!cpus_have_final_cap(ARM64_HAS_NESTED_VIRT))
>   		clear_bit(KVM_ARM_VCPU_HAS_EL2, &features);
>   
> +	if (!static_branch_unlikely(&kvm_rme_is_available))
> +		clear_bit(KVM_ARM_VCPU_REC, &features);
> +
>   	return features;
>   }
>   
> @@ -1506,6 +1511,10 @@ static int kvm_vcpu_init_check_features(struct kvm_vcpu *vcpu,
>   	if (test_bit(KVM_ARM_VCPU_HAS_EL2, &features))
>   		return -EINVAL;
>   
> +	/* RME is incompatible with AArch32 */
> +	if (test_bit(KVM_ARM_VCPU_REC, &features))
> +		return -EINVAL;
> +
>   	return 0;
>   }
>   

One corner case seems missed in kvm_vcpu_init_check_features(). It's allowed to
initialize a vCPU with REC feature even kvm_is_realm(kvm) is false. Hopefully,
I didn't miss something.

[...]

Thanks,
Gavin

