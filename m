Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 345F8261388
	for <linux-coco@lists.linux.dev>; Tue,  1 Sep 2026 04:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788237951; cv=none; b=oe45lhYa+N3pIF6HEdbvYDZeggZfLVonnsxgDbPr9iASUdlQQNYdAneZwYgJU2XOzXMPJjq00V9BsAygC6sT2+rZpy+5cX+hIEV36iH04or/4eV9bkweWaiqzI8q3H3jNGKKhstZKCoeMl4rjtIbGXP62Knr49tXjr+3DfMRz5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788237951; c=relaxed/simple;
	bh=Jmkwxqy/ZvGVHKyyYPxHqUaecy4WhtwqUYZDe5W9ceo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P4ly5fBJES1DVVdJ27pycciaq2K2lCRyeelmY5BlHZooblNPXPjsDD7aGcou+7IZMPwOXn2S9JDyEwa0bR7Y8aYyjrKG717ZO2CjqeorMt/Z36IUVRU8qmBgms3EPalp3ynYmjsE9B3jKq9Y7Pw1e+xzs2ZvIdVBKzDdVD6T2lI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OORIIB3B; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OORIIB3B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788237949;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pJEzvIaybX9Dts9DYz8bf1h8e9d8Ys+d8ayhElVmFmU=;
	b=OORIIB3BY0QqW5OJa7EMhJNk5MrXhD4EaQRJAEe7uBvcyUqhMG3hBLmPkmuBYoAOZJFb5p
	of8nEOcH/bJsoB79b2Y+TLEjq+0VGIgySGy2xzLolylAg6a51tqrGm37DqBuoHYMhVJG+l
	T5Sz8UdEUZzjY1zqEM+oAC4GnX0ne4M=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-110-uNc_ZYyTPoSW_OWqkTJktg-1; Tue, 01 Sept 2026 00:45:48 -0400
X-MC-Unique: uNc_ZYyTPoSW_OWqkTJktg-1
X-Mimecast-MFC-AGG-ID: uNc_ZYyTPoSW_OWqkTJktg_1788237947
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38f283baf1fso857800a91.3
        for <linux-coco@lists.linux.dev>; Mon, 31 Aug 2026 21:45:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788237947; x=1788842747;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pJEzvIaybX9Dts9DYz8bf1h8e9d8Ys+d8ayhElVmFmU=;
        b=SDFxZVaJFcKMLcty8ckdsC3R3mGzGKsb8xKRU5jmsvWIVvipI4K+HltgVPYtQzTyOx
         c0dw0HlayM/9WtYImbyqzoYzr6UGe6Edm3K1C9+DVdfpONL0Xgb9fI8S7/6PrvqbTISd
         NQOk/rfsLKxX96lyFzh+9tE6nqpDFT6ZpGJgov7OwebEdGhtA4o2Aix8u0/MPgYoPcmz
         f6vK5GElB+g/ppdl2p0HvexFouJXxnZ0J2VwiSvieR9aTeENz02MmP/4W06FVZGkyUQr
         l0cpenfPj2KoOE3bw0rq5HVEH9rxEtPVW54f1Cd4yQpq03r0IgKZIglO9wWlU2t5xv+b
         Z53A==
X-Forwarded-Encrypted: i=1; AKwUvBwpGkUMRTM9ApcrhY1TK/+dXK55OSlFBIG1rHq4gXW/CIwhn5JMo7hKvcB6icSQmNkpgWOthKJcL9Jf@lists.linux.dev
X-Gm-Message-State: AFuF++l/POlJ297L+Yj+KisbZ7+eulYNtAKxUIByGgIh6yRhI4nEDVpE
	pLUF1616EcRK2+5M3r4B+Xvp62NbUCGYiAc+QzKriXRl1OQHtJZm35+WNn9qd53HFw1QMG0LInO
	Z9jK1AKsbFXr+oj8f9PmL1tO6X7MMDjj2RSNKdPmKvUYIG6bgwW0Va2VgSXOcX4I=
X-Gm-Gg: AYBFou0AK5vM7jzkxbA3vgvrjfVP/OoRIS/YgK0TSuF0BAxnibjes9AF1VmOkkGThTY
	I99MczgZLzHBzeRshNEj11xw+2qyLTqwEh+vl95nKPZ4sEbhZXOUNG05JtWMg1Tt+Ima1rf0JSI
	bRLExD37w3FLnPH2aMDNc5/S0Ereul1c4T1nrto97l/ILPuwRIKG6k8peRRLyuySH3p9LyVhB3y
	jbqXfwj7wAsHqgqBhscrZ6SHLMSiJadKlcSiN6enubrK24SFCP0z690K5xn31nV735O8fl9j7yb
	0qeaqMLAxufC84wvviBV1IO2ZvdaWj4OQBzn/h9DpWcumPD8G15ZCERG4atU3iVo6vMlcefp3p2
	7BFkDGUk9VCiJsLf62pVSFUCEo/cC9T5opTkXOHJ7kA==
X-Received: by 2002:a17:90b:3c45:b0:398:c292:ac80 with SMTP id 98e67ed59e1d1-398c292b6b2mr26462489a91.10.1788237946709;
        Mon, 31 Aug 2026 21:45:46 -0700 (PDT)
X-Received: by 2002:a17:90b:3c45:b0:398:c292:ac80 with SMTP id 98e67ed59e1d1-398c292b6b2mr26462384a91.10.1788237946100;
        Mon, 31 Aug 2026 21:45:46 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f99585csm33333687eec.21.2026.08.31.21.45.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 21:45:45 -0700 (PDT)
Message-ID: <216cfe43-e696-4de1-bf8e-58b2d35f3372@redhat.com>
Date: Tue, 1 Sep 2026 14:45:35 +1000
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v16 16/45] KVM: arm64: CCA: Allow passing the machine type
 in KVM creation
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
 Emi Kisanuki <fj0570is@fujitsu.com>, Vishal Annapurve
 <vannapurve@google.com>, WeiLin.Chang@arm.com,
 Lorenzo Pieralisi <lpieralisi@kernel.org>
References: <20260803134403.80630-1-steven.price@arm.com>
 <20260803134403.80630-17-steven.price@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260803134403.80630-17-steven.price@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: nrRBnwbaU77at7RhBaqEaw6Rx8-ZfPqp3xaReoGwEWQ_1788237947
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Steve,

On 8/3/26 11:43 PM, Steven Price wrote:
> Previously machine type was used purely for specifying the physical
> address size of the guest. Reserve the higher bits to specify an ARM
> specific machine type and declare a new type 'KVM_VM_TYPE_ARM_REALM'
> used to create a realm guest.
> 
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
> Changes since v15:
>   * Specify the encoding for each VM type in the documentation.
> Changes since v13:
>   * Rework to use the two top bits for the machine type now that pKVM has
>     merged and used the top bit for KVM_VM_TYPE_ARM_PROTECTED.
>   * Update the documentation to include KVM_VM_TYPE_ARM_PROTECTED as
>     well.
> Changes since v9:
>   * Explictly set realm.state to REALM_STATE_NONE rather than rely on the
>     zeroing of the structure.
> Changes since v7:
>   * Add some documentation explaining the new machine type.
> Changes since v6:
>   * Make the check for kvm_rme_is_available more visible and report an
>     error code of -EPERM (instead of -EINVAL) to make it explicit that
>     the kernel supports RME, but the platform doesn't.
> ---
>   Documentation/virt/kvm/api.rst | 21 +++++++++++++++++++--
>   arch/arm64/kvm/arm.c           | 11 +++++++++++
>   include/uapi/linux/kvm.h       |  7 ++++++-
>   3 files changed, 36 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
> index ce588c05b26a..802601eaf560 100644
> --- a/Documentation/virt/kvm/api.rst
> +++ b/Documentation/virt/kvm/api.rst
> @@ -181,8 +181,25 @@ flag KVM_VM_MIPS_VZ.
>   ARM64:
>   ^^^^^^
>   
> -On arm64, the physical address size for a VM (IPA Size limit) is limited
> -to 40bits by default. The limit can be configured if the host supports the
> +On arm64, the machine type identifier is used to encode a type and the
> +physical address size for the VM. The lower byte (bits[7:0]) encodes the
> +address size and the upper bits[31:30] encode a machine type. The machine
> +types that might be available are:
> +
> + =========================   =======   ========================================
> + Type                        [31:30]   Description
> + =========================   =======   ========================================
> + KVM_VM_TYPE_ARM_NORMAL      0b00      A standard VM
> + KVM_VM_TYPE_ARM_REALM       0b01      A "realm" VM using the Arm Confidential
> +                                       Compute extensions, the VM's memory is
> +                                       protected from the host.
> + KVM_VM_TYPE_ARM_PROTECTED   0b10      A "protected" VM using pKVM to
> +                                       isolate the VM from the host.
> + Reserved                    0b11      Reserved for future use
> + =========================   =======   ========================================
> +
> +The physical address size for a VM (IPA Size limit) is limited to 40bits
> +by default. The limit can be configured if the host supports the
>   extension KVM_CAP_ARM_VM_IPA_SIZE. When supported, use
>   KVM_VM_TYPE_ARM_IPA_SIZE(IPA_Bits) to set the size in the machine type
>   identifier, where IPA_Bits is the maximum width of any physical
> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> index 6f39831dcf5d..9881fd6c511c 100644
> --- a/arch/arm64/kvm/arm.c
> +++ b/arch/arm64/kvm/arm.c
> @@ -249,6 +249,17 @@ int kvm_arch_init_vm(struct kvm *kvm, unsigned long type)
>   	mutex_unlock(&kvm->lock);
>   #endif
>   
> +	if ((type & KVM_VM_TYPE_ARM_PROTECTED) &&
> +	    (type & KVM_VM_TYPE_ARM_REALM))
> +		return -EINVAL;
> +
> +	if (type & KVM_VM_TYPE_ARM_REALM) {
> +		if (!static_branch_unlikely(&kvm_rmi_is_available))
> +			return -EINVAL;
> +		kvm_set_realm_state(kvm, REALM_STATE_NONE);
> +		kvm->arch.is_realm = true;
> +	}
> +

Shall we use kvm_arm_rmi_supported() here? In that way, the check is consistent
to what has been done for KVM_CAP_ARM_RMI. You know that a misbehaving VMM can
issue KVM_CREATE_VM to create a realm VM without checking if KVM_CAP_ARM_RMI
is supported by the host.

	if (type & KVM_VM_TYPE_ARM_REALM) {
		if (!kvm_arm_rmi_supported())
			return -EINVAL;

		kvm_set_realm_state(kvm, REALM_STATE_NONE);
		WRITE_ONCE(kvm->arch.is_realm, true);
	}

>   	kvm_init_nested(kvm);
>   
>   	ret = kvm_share_hyp(kvm, kvm + 1);
> diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
> index 0231ff174a50..adee3936d6ae 100644
> --- a/include/uapi/linux/kvm.h
> +++ b/include/uapi/linux/kvm.h
> @@ -700,14 +700,19 @@ struct kvm_enable_cap {
>    * address size for the VM. Bits[7-0] are reserved for the guest
>    * PA size shift (i.e, log2(PA_Size)). For backward compatibility,
>    * value 0 implies the default IPA size, 40bits.
> + *
> + * Bits[30-31] are reserved for the VM type
>    */
>   #define KVM_VM_TYPE_ARM_IPA_SIZE_MASK	0xffULL
>   #define KVM_VM_TYPE_ARM_IPA_SIZE(x)		\
>   	((x) & KVM_VM_TYPE_ARM_IPA_SIZE_MASK)
>   
> +#define KVM_VM_TYPE_ARM_NORMAL		0
> +#define KVM_VM_TYPE_ARM_REALM		(1UL << 30)
>   #define KVM_VM_TYPE_ARM_PROTECTED	(1UL << 31)
>   #define KVM_VM_TYPE_ARM_MASK		(KVM_VM_TYPE_ARM_IPA_SIZE_MASK | \
> -					 KVM_VM_TYPE_ARM_PROTECTED)
> +					 KVM_VM_TYPE_ARM_PROTECTED | \
> +					 KVM_VM_TYPE_ARM_REALM)
>   
>   /*
>    * ioctls for /dev/kvm fds:

Thanks,
Gavin

