Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25FC223C51B
	for <linux-coco@lists.linux.dev>; Tue,  1 Jul 2025 06:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751351939; cv=none; b=WWM8EhbRCUsNHJYw8kfN2LS6EK1cobWtiXeB7eGeHT9f/upAkyx34VgALBNdcmLCpNfdMRf2cuBg02MYTyfTrL63uMJir4Osv7XETebnqWwDwgbQ78Ccf4T2lDCa0BePgxi+xxzNcUc/Zppi6LUSLtYpEAh3PUx+LCgPDkOpfZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751351939; c=relaxed/simple;
	bh=vdn58W0P4SV8Ws3EOrRhV/EDGwj8q19SsrDH5hQ3C3g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HDkFoa3O7kwsWZ3H6LBYZ5ZMGOVrTEXjdq2wadqxBlGJ3Eddo1YWW067ldZYwN9Jj9x2VqeH4NQ/763z+snZVjRSVBg7W7mA1E5BaZaxEivFEZY0sPSYmyPUXFwQSarSCAB3J0EGdZV/o6dqpDKl+fnfRDqhxVovB9ng1/01Ng8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EsnrwMS0; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EsnrwMS0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751351937;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/N2L3Cw1UrT66uEmHGGmoTWSgiUKsnwQtuwgvg8Krxk=;
	b=EsnrwMS00+2qlzINF50fSDq4pOay/TuxTGLMIP8Xx+SHaypS7fR0+2ttYkTHPJpUiCpTyy
	lxel+2D2z/97ykiGTKLeMQvU6g5g6R1I8XsoOU2rkmtmr1o9sjYZlPI7/UcDhZjc8CGOYA
	PQ0uRPv6hl1YdMq4T+v/bCxObcM2y30=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-689-uf3M6UICNt6jBBnST_iRBQ-1; Tue, 01 Jul 2025 02:38:56 -0400
X-MC-Unique: uf3M6UICNt6jBBnST_iRBQ-1
X-Mimecast-MFC-AGG-ID: uf3M6UICNt6jBBnST_iRBQ_1751351935
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-315af08594fso2995189a91.2
        for <linux-coco@lists.linux.dev>; Mon, 30 Jun 2025 23:38:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751351935; x=1751956735;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/N2L3Cw1UrT66uEmHGGmoTWSgiUKsnwQtuwgvg8Krxk=;
        b=oFWo3oUCNCAp8QD9X81vM3yCa6Q2SYUC1Z3a8WeT93LyezIjKsvCscd3OgoY5ns001
         8zNUbmoyZt3jRIyflOlfw1xjVcGLjAHWOHUasS9Cvxc6XdiKm+mcyU3KZjtGhtQ/6OMT
         Zq3TCClsWVW6/vy1owPI2ZdRAg9Td2BL7RyfRYoa1mbZWjJUBbd6ZhiSrykJY13WJOYo
         G+wLH56w4TjfzWU5dcjv2jDohAe7QJ3JHtZeAlCeUIaDIpPuZDLcLAvYqtMmk0GNDcKE
         sYomlPz38uDlFV1Z7UbDHIm17e03qGi90Z9rvz9ixyXttZyoANRFD7saSczrNTKHBEbo
         t91w==
X-Forwarded-Encrypted: i=1; AJvYcCXgWu8U4mNLV4mRW4R1vaha0lZOp4TXXTjL5QVEQiCoPlXP7jmn3U4DkCIi0kOhe1VP+tnl1eYFwrXi@lists.linux.dev
X-Gm-Message-State: AOJu0YyXyWc+0ocg1d1ucNPdzouPWOwn6e1Su4BL5+rqo8TCpsaHnZ+N
	xukvA11KOdDT2N0OdwIdkjYSMZ+0qBCCpN1cztyomn9ufF0mMnwNSJex4pPIOuV+b6oP9VVZHn4
	l6BV03A1qvRkGjC8UeaK6wrXzjb9RLe46SmGiZnFKYhTEqJbm2i1Yc9TCQDprdUY=
X-Gm-Gg: ASbGncuXXFKFz5hnkQnr5o/2FmwIX0Lck4qGh5/K6hCrjUd66MueBIsK4zQ2sKG2kFO
	ry+IQlON3M5R9/pm5SGG5eInLOrptuqW0xdcv51qVkcePGuhyyggGaAp4fBlDX6gU+QhYC4NiPK
	i8cwXkpMVHRlt6tlmdkMeN+bEVIutrIEfvYID+4aCkKTDp+7IFLXcR1GHqcH7lzezr9+OxdrbNc
	2GuQ3M8wp0C6PaMLf4urb54WoxFiZ2zWlGDY58+/RvSESAj+rx02oWLjxRyMowO+ZnC/1jJZ5Ty
	k+6ZA2NzdkJ0+Xa30isPR6kS4HjeA8jDehfJYEh4ruu3zz19hZi2Pz0knI9LOg==
X-Received: by 2002:a17:90b:3c50:b0:312:f0d0:bc4 with SMTP id 98e67ed59e1d1-318c8ec5177mr22460852a91.5.1751351934647;
        Mon, 30 Jun 2025 23:38:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFXGVdcl+epWZi9VPn55ApO38WReIopBQVp1X+PhM6QPcmIdOqHMzKdtlUHTKMJd/V5XIritA==
X-Received: by 2002:a17:90b:3c50:b0:312:f0d0:bc4 with SMTP id 98e67ed59e1d1-318c8ec5177mr22460805a91.5.1751351934113;
        Mon, 30 Jun 2025 23:38:54 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-62-5.mrk21.qld.optusnet.com.au. [175.34.62.5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-318c1523351sm10913306a91.48.2025.06.30.23.38.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jun 2025 23:38:53 -0700 (PDT)
Message-ID: <e33e6268-a6a5-421d-97c1-b26044e3cfa5@redhat.com>
Date: Tue, 1 Jul 2025 16:38:44 +1000
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 09/43] KVM: arm64: Allow passing machine type in KVM
 creation
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
 <20250611104844.245235-10-steven.price@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20250611104844.245235-10-steven.price@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: KpypIbHbohbKsr3oCkMOWZc_sHbef1lWYdAbusoYGh0_1751351935
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/11/25 8:48 PM, Steven Price wrote:
> Previously machine type was used purely for specifying the physical
> address size of the guest. Reserve the higher bits to specify an ARM
> specific machine type and declare a new type 'KVM_VM_TYPE_ARM_REALM'
> used to create a realm guest.
> 
> Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> Reviewed-by: Gavin Shan <gshan@redhat.com>
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
> Changes since v7:
>   * Add some documentation explaining the new machine type.
> Changes since v6:
>   * Make the check for kvm_rme_is_available more visible and report an
>     error code of -EPERM (instead of -EINVAL) to make it explicit that
>     the kernel supports RME, but the platform doesn't.
> ---
>   Documentation/virt/kvm/api.rst | 16 ++++++++++++++--
>   arch/arm64/kvm/arm.c           | 15 +++++++++++++++
>   arch/arm64/kvm/mmu.c           |  3 ---
>   include/uapi/linux/kvm.h       | 19 +++++++++++++++----
>   4 files changed, 44 insertions(+), 9 deletions(-)
> 

One nitpick below.

> diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
> index 65543289f75c..0049d67fe38f 100644
> --- a/Documentation/virt/kvm/api.rst
> +++ b/Documentation/virt/kvm/api.rst
> @@ -181,8 +181,20 @@ flag KVM_VM_MIPS_VZ.
>   ARM64:
>   ^^^^^^
>   
> -On arm64, the physical address size for a VM (IPA Size limit) is limited
> -to 40bits by default. The limit can be configured if the host supports the
> +On arm64, the machine type identifier is used to encode a type and the
> +physical address size for the VM. The lower byte (bits[7-0]) encode the
> +address size and the upper bits[11-8] encode a machine type. The machine
> +types that might be available are:
> +
> + ======================   ============================================
> + KVM_VM_TYPE_ARM_NORMAL   A standard VM
> + KVM_VM_TYPE_ARM_REALM    A "Realm" VM using the Arm Confidential
> +                          Compute extensions, the VM's memory is
> +                          protected from the host.
> + ======================   ============================================
> +
> +The physical address size for a VM (IPA Size limit) is limited to 40bits
> +by default. The limit can be configured if the host supports the
>   extension KVM_CAP_ARM_VM_IPA_SIZE. When supported, use
>   KVM_VM_TYPE_ARM_IPA_SIZE(IPA_Bits) to set the size in the machine type
>   identifier, where IPA_Bits is the maximum width of any physical
> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> index 8080443d24af..b3e3323573c6 100644
> --- a/arch/arm64/kvm/arm.c
> +++ b/arch/arm64/kvm/arm.c
> @@ -172,6 +172,21 @@ int kvm_arch_init_vm(struct kvm *kvm, unsigned long type)
>   	mutex_unlock(&kvm->lock);
>   #endif
>   
> +	if (type & ~(KVM_VM_TYPE_ARM_MASK | KVM_VM_TYPE_ARM_IPA_SIZE_MASK))
> +		return -EINVAL;
> +
> +	switch (type & KVM_VM_TYPE_ARM_MASK) {
> +	case KVM_VM_TYPE_ARM_NORMAL:
> +		break;
> +	case KVM_VM_TYPE_ARM_REALM:
> +		if (!static_branch_unlikely(&kvm_rme_is_available))
> +			return -EPERM;
> +		kvm->arch.is_realm = true;
> +		break;

Here we need to explicitly set the realm's state to REALM_STATE_NONE even though
it's equal to zero, and the struct vm should have been cleared on allocation.

		WRITE_ONCE(kvm->arch.realm.state, REALM_STATE_NONE);
		kvm->arch.is_realm = true;
		break;

> +	default:
> +		return -EINVAL;
> +	}
> +
>   	kvm_init_nested(kvm);
>   
>   	ret = kvm_share_hyp(kvm, kvm + 1);

[...]

Thanks,
Gavin

