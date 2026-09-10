Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B66291DB92C
	for <linux-coco@lists.linux.dev>; Thu, 10 Sep 2026 05:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789018443; cv=none; b=dqx7ejIf67OTKvCL6IlvCK1H9p55ecC25i7UqucDuFeQ1lDCj7PqOQn3G+kmBH0CYpoI+KX/DEeyxxMNFlDvKQUpQR6L7o1hlpD5xaBM4jM2JF91MfLRdxiNZNCf+1rhhblHAbUw+FZVaL5uzuLwrHNUVtjk7iYdvOMpJ5kubsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789018443; c=relaxed/simple;
	bh=ZIT1JUns1UwkE1FUePimxNg9u/6VCWQdnkHihI+FCVw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A6LlmSoYzfYC4MRJcYTxLuMfhNVksKr+bDZYcZxoX242X/us6Rq5ZF96oGCL+ZGroNpW6tDLGNhWxLF3F95qREeSnzXeaY1ZxNWedzUHrqUpwRtlqrBZFwX9QTJHbxeNqGlxNSaK4hIPSnLjDiERzbtj8IM0bMCyO5cL1sj/na4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=e2blvXD/; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="e2blvXD/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789018440;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pmfagZcaovN6T79eUTiT4gf4vwdGinNeI+/TCO/n5fs=;
	b=e2blvXD/jWnKF1oesXhNa/8jwVZDIs2P8jNYsUOqj0es3tFvAHn22+BsVSbZhUXnpdEhCe
	Ek2s74MoGxqJRH72XyMEFpVFuL3TXk64zPRPJSbobEJKk5QhAedXa6VXUB1vFoUgIPqKdP
	q2KFcG8D9MpGogk+sBpK8UrvzAV+yD0=
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-197-4x5yPunoOmqVZ79GUtjOUw-1; Thu, 10 Sep 2026 01:33:59 -0400
X-MC-Unique: 4x5yPunoOmqVZ79GUtjOUw-1
X-Mimecast-MFC-AGG-ID: 4x5yPunoOmqVZ79GUtjOUw_1789018439
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc4922b7c31so3066302a12.1
        for <linux-coco@lists.linux.dev>; Wed, 09 Sep 2026 22:33:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789018438; x=1789623238;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pmfagZcaovN6T79eUTiT4gf4vwdGinNeI+/TCO/n5fs=;
        b=hBPKlh5pk2PaHc+VO0Tl76TKhN3oMpURix9o9F4M8k+0eheApZDxiG7W44X9eXkLSh
         BcnBVpQQVuqiBC+vBL8ObU01ZBNKnzQJK/QgpCTqfPR2zM8r+CrOZ6zl9o4GYhfXb2ud
         w0uydxSFrJ5ZVvC4ytxHZ/Os2E+zZUAcOue9kIkGaBcwmp0lYLZjC8ykqIqtKSGaJ14B
         hz2NYLm0tWRGXMVrhKCKJFueN3iuQIZXle/+G2vTbVf8Ht9HaSFs3Gib3O0MLQLJSp90
         gtNYE9A4Q5J15arz1S6Dw+F3a/DLHxV4r77QwN8C5FEGzjDxdgymz/OI0Qy2nrFOC73E
         bIzA==
X-Forwarded-Encrypted: i=1; AKwUvBzo5eTFcAolQzABHfZnM1ufI501oO435hIsROGMPo/Hpo/XKulNrzwNWexdKICszSeQgvs0S7Q6ZCKL@lists.linux.dev
X-Gm-Message-State: AFuF++npEmLPt+beO08UiyzS5qkIKVDy4w4UOFkhabh3fIG/xFH7v5XF
	zOtohHsHvqwSOkkJBmyRUbFHfJ61FGLdgoG007yjCtokJJi3rmLPKgW0UkwOMYnbAZ3VkKDjaJC
	9ro8g5yOMiO4WBlsJycDCB4zyEi7RLU09jDQqr73PDnN3cjtOiBNE/BIsjJPhEPA=
X-Gm-Gg: AYBFou1Gjo/STordOHMrY+tUCKk8R6WzfaK/+MdXc4marNqnj3xRtw8H7yrJWSkNvoU
	SWWScrUPdy4hBtFBbfGMW1XOapiinemO3J7zzIVpxhtGa2/8KamkiWWwJ0XKd5/SyNotUdwWLp2
	wfAScXTszyzt8wPG0GfWok2hFMKd2PUy2yw7VPnhq/cfXTvZaE9XiHbmkE915EtyMb8pvUviA87
	sMaSw/6P/c3bBRbSshJztmhULuyR8RUcHQUzP6HpfQFN1qhzZNuvYpneONq5+RhBz3PPKdktzeZ
	LFFi+mBtQ1m9JIJf1EhTzf+REI+ccqqSwrU362YPgr0hoEHemBBnRtwiE+o1etKEpG6OXMdB0YS
	KMBx1w3iPPREvf8NLePWbcdZEZ8FnKEgXB8ZHrxqI6w==
X-Received: by 2002:a17:902:ef44:b0:2db:5f8c:b81c with SMTP id d9443c01a7336-2dd07dc594cmr84178955ad.19.1789018438209;
        Wed, 09 Sep 2026 22:33:58 -0700 (PDT)
X-Received: by 2002:a17:902:ef44:b0:2db:5f8c:b81c with SMTP id d9443c01a7336-2dd07dc594cmr84178265ad.19.1789018437476;
        Wed, 09 Sep 2026 22:33:57 -0700 (PDT)
Received: from [192.168.68.52] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db14aeaf74sm82803575ad.81.2026.09.09.22.33.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 22:33:56 -0700 (PDT)
Message-ID: <09f1d245-2104-4ca2-93af-a004c44b4161@redhat.com>
Date: Thu, 10 Sep 2026 15:33:45 +1000
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v17 05/20] KVM: arm64: Add vcpu load/put call backs for
 flavors
To: Suzuki K Poulose <suzuki.poulose@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: maz@kernel.org, will@kernel.org, catalin.marinas@arm.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 steven.price@arm.com, aneesh.kumar@kernel.org, oupton@kernel.org,
 joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
 linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
 sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
 WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com
References: <20260908162223.1683432-1-suzuki.poulose@arm.com>
 <20260908162223.1683432-6-suzuki.poulose@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260908162223.1683432-6-suzuki.poulose@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 6XlTuwHumFMedgTAF_uC4AGWwLVQ7EAM75erKS0At1E_1789018439
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Suzuki,

On 9/9/26 2:22 AM, Suzuki K Poulose wrote:
> Add VM flavor specific handlers for VCPU load/put, in an effort to make it
> easier to follow the code.
> 
> Based on a patch by Marc Zyngier
> 
> Suggested-by: Marc Zyngier <maz@kernel.org>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> ---
>   arch/arm64/include/asm/kvm_host.h |   6 ++
>   arch/arm64/kvm/arm.c              | 156 ++++++++++++++++++++++--------
>   2 files changed, 123 insertions(+), 39 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
> index d0dccc9ad6aa8..b2e99c5cb1cd3 100644
> --- a/arch/arm64/include/asm/kvm_host.h
> +++ b/arch/arm64/include/asm/kvm_host.h
> @@ -150,6 +150,11 @@ struct kvm_vmid {
>   	atomic64_t id;
>   };
>   
> +struct kvm_vcpu_ops {
> +	void (*vcpu_load)(struct kvm_vcpu *vcpu, int cpu);
> +	void (*vcpu_put)(struct kvm_vcpu *vcpu);
> +};
> +

struct kvm_vcpu::cpu has been set to 'cpu' before vcpu_load() is called in
kvm_arch_vcpu_load(), so we needn't explicitly pass @cpu to vcpu_load()?

>   struct kvm_s2_mmu {
>   	struct kvm_vmid vmid;
>   
> @@ -854,6 +859,7 @@ struct vncr_tlb;
>   
>   struct kvm_vcpu_arch {
>   	struct kvm_cpu_context ctxt;
> +	const struct kvm_vcpu_ops *vcpu_ops;
>   

I think this would be a field of 'struct kvm_arch' if all vCPUs inside a VM
have same vCPU operations.

>   	/*
>   	 * Guest floating point state
> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> index 51fc651267157..9af3bbb2f8c24 100644
> --- a/arch/arm64/kvm/arm.c
> +++ b/arch/arm64/kvm/arm.c
> @@ -74,6 +74,8 @@ struct kvm_ioctl_cap_map {
>   	long ext;
>   };
>   
> +static const struct kvm_vcpu_ops *arm64_vcpu_ops[VM_FLAVOR_MAX];
> +
>   /* Make KVM_CAP_NR_VCPUS the reference for features we always supported */
>   #define KVM_CAP_ARM_BASIC	KVM_CAP_NR_VCPUS
>   
> @@ -569,6 +571,8 @@ int kvm_arch_vcpu_create(struct kvm_vcpu *vcpu)
>   	mutex_unlock(&vcpu->mutex);
>   #endif
>   
> +	vcpu->arch.vcpu_ops = arm64_vcpu_ops[vcpu->kvm->arch.vm_flavor];
> +
>   	/* Force users to call KVM_ARM_VCPU_INIT */
>   	vcpu_clear_flag(vcpu, VCPU_INITIALIZED);
>   
> @@ -738,36 +742,72 @@ static void vcpu_load_pvtime(struct kvm_vcpu *vcpu)
>   		kvm_make_request(KVM_REQ_RECORD_STEAL, vcpu);
>   }
>   
> +static void vhe_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
> +{
> +	vcpu_prepare_mmu(vcpu);
> +	/*
> +	 * The timer must be loaded before the vgic to correctly set up physical
> +	 * interrupt deactivation in nested state (e.g. timer interrupt).
> +	 */
> +	kvm_timer_vcpu_load(vcpu);
> +	kvm_vgic_load(vcpu);
> +	kvm_vcpu_load_debug(vcpu);
> +	kvm_vcpu_load_fgt(vcpu);
> +	kvm_vcpu_load_vhe(vcpu);
> +	kvm_arch_vcpu_load_fp(vcpu);
> +	kvm_vcpu_pmu_restore_guest(vcpu);
> +
> +	vcpu_load_pvtime(vcpu);
> +	vcpu_set_wfx_traps(vcpu);
> +	vcpu_set_pauth_traps(vcpu);
> +}
> +
> +static void nvhe_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
> +{
> +	vcpu_prepare_mmu(vcpu);
> +	/*
> +	 * The timer must be loaded before the vgic to correctly set up physical
> +	 * interrupt deactivation in nested state (e.g. timer interrupt).
> +	 */
> +	kvm_timer_vcpu_load(vcpu);
> +	kvm_vgic_load(vcpu);
> +	kvm_vcpu_load_debug(vcpu);
> +	kvm_vcpu_load_fgt(vcpu);
> +	kvm_arch_vcpu_load_fp(vcpu);
> +	kvm_vcpu_pmu_restore_guest(vcpu);
> +
> +	vcpu_load_pvtime(vcpu);
> +	vcpu_set_wfx_traps(vcpu);
> +	vcpu_set_pauth_traps(vcpu);
> +}
> +
> +static void pkvm_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
> +{
> +	/*
> +	 * The timer must be loaded before the vgic to correctly set up physical
> +	 * interrupt deactivation in nested state (e.g. timer interrupt).
> +	 */
> +	kvm_timer_vcpu_load(vcpu);
> +	kvm_vgic_load(vcpu);
> +	kvm_vcpu_load_debug(vcpu);
> +	kvm_vcpu_load_fgt(vcpu);
> +	kvm_arch_vcpu_load_fp(vcpu);
> +	kvm_vcpu_pmu_restore_guest(vcpu);
> +
> +	vcpu_load_pvtime(vcpu);
> +	vcpu_set_wfx_traps(vcpu);

It seems vcpu_set_pauth_traps(vcpu) has been missed here?

> +
> +	kvm_call_hyp_nvhe(__pkvm_vcpu_load,
> +			  vcpu->kvm->arch.pkvm.handle,
> +			  vcpu->vcpu_idx, vcpu->arch.hcr_el2);
> +	kvm_call_hyp(__vgic_v3_restore_vmcr_aprs,
> +		     &vcpu->arch.vgic_cpu.vgic_v3);
> +}
> +
>   void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
>   {
> -	if (!is_protected_kvm_enabled())
> -		vcpu_prepare_mmu(vcpu);
> -
>   	vcpu->cpu = cpu;
> -	/*
> -	 * The timer must be loaded before the vgic to correctly set up physical
> -	 * interrupt deactivation in nested state (e.g. timer interrupt).
> -	 */
> -	kvm_timer_vcpu_load(vcpu);
> -	kvm_vgic_load(vcpu);
> -	kvm_vcpu_load_debug(vcpu);
> -	kvm_vcpu_load_fgt(vcpu);
> -	if (has_vhe())
> -		kvm_vcpu_load_vhe(vcpu);
> -	kvm_arch_vcpu_load_fp(vcpu);
> -	kvm_vcpu_pmu_restore_guest(vcpu);
> -
> -	vcpu_load_pvtime(vcpu);
> -	vcpu_set_wfx_traps(vcpu);
> -	vcpu_set_pauth_traps(vcpu);
> -
> -	if (is_protected_kvm_enabled()) {
> -		kvm_call_hyp_nvhe(__pkvm_vcpu_load,
> -				  vcpu->kvm->arch.pkvm.handle,
> -				  vcpu->vcpu_idx, vcpu->arch.hcr_el2);
> -		kvm_call_hyp(__vgic_v3_restore_vmcr_aprs,
> -			     &vcpu->arch.vgic_cpu.vgic_v3);
> -	}
> +	vcpu->arch.vcpu_ops->vcpu_load(vcpu, cpu);
>   
>   	if (!cpumask_test_cpu(cpu, vcpu->kvm->arch.supported_cpus))
>   		vcpu_set_on_unsupported_cpu(vcpu);
> @@ -775,28 +815,44 @@ void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
>   	vcpu->arch.pid = pid_nr(vcpu->pid);
>   }
>   
> -void kvm_arch_vcpu_put(struct kvm_vcpu *vcpu)
> +static void vhe_vcpu_put(struct kvm_vcpu *vcpu)
>   {
> -	if (is_protected_kvm_enabled()) {
> -		kvm_call_hyp(__vgic_v3_save_aprs, &vcpu->arch.vgic_cpu.vgic_v3);
> -		kvm_call_hyp_nvhe(__pkvm_vcpu_put);
> -
> -		/* __pkvm_vcpu_put implies a sync of the state */
> -		if (!kvm_vm_is_protected(vcpu->kvm))
> -			vcpu_set_flag(vcpu, PKVM_HOST_STATE_DIRTY);
> -	}
> -
>   	kvm_vcpu_put_debug(vcpu);
>   	kvm_arch_vcpu_put_fp(vcpu);
> -	if (has_vhe())
> -		kvm_vcpu_put_vhe(vcpu);
> +	kvm_vcpu_put_vhe(vcpu);
>   	kvm_timer_vcpu_put(vcpu);
>   	kvm_vgic_put(vcpu);
>   	kvm_vcpu_pmu_restore_host(vcpu);
>   	if (vcpu_has_nv(vcpu))
>   		kvm_vcpu_put_hw_mmu(vcpu);
>   	kvm_arm_vmid_clear_active();
> +}
>   
> +static void nvhe_vcpu_put(struct kvm_vcpu *vcpu)
> +{
> +	kvm_vcpu_put_debug(vcpu);
> +	kvm_arch_vcpu_put_fp(vcpu);
> +	kvm_timer_vcpu_put(vcpu);
> +	kvm_vgic_put(vcpu);
> +	kvm_vcpu_pmu_restore_host(vcpu);
> +	kvm_arm_vmid_clear_active();
> +}
> +
> +static void pkvm_vcpu_put(struct kvm_vcpu *vcpu)
> +{
> +	kvm_call_hyp(__vgic_v3_save_aprs, &vcpu->arch.vgic_cpu.vgic_v3);
> +	kvm_call_hyp_nvhe(__pkvm_vcpu_put);
> +
> +	/* __pkvm_vcpu_put implies a sync of the state */
> +	if (!kvm_vm_is_protected(vcpu->kvm))
> +		vcpu_set_flag(vcpu, PKVM_HOST_STATE_DIRTY);
> +
> +	nvhe_vcpu_put(vcpu);
> +}
> +
> +void kvm_arch_vcpu_put(struct kvm_vcpu *vcpu)
> +{
> +	vcpu->arch.vcpu_ops->vcpu_put(vcpu);
>   	vcpu_clear_on_unsupported_cpu(vcpu);
>   	vcpu->cpu = -1;
>   }
> @@ -2136,6 +2192,28 @@ int kvm_arch_vm_ioctl(struct file *filp, unsigned int ioctl, unsigned long arg)
>   	}
>   }
>   
> +static const struct kvm_vcpu_ops vhe_vcpu_ops = {
> +	.vcpu_load = vhe_vcpu_load,
> +	.vcpu_put = vhe_vcpu_put,
> +};
> +
> +static const struct kvm_vcpu_ops nvhe_vcpu_ops = {
> +	.vcpu_load = nvhe_vcpu_load,
> +	.vcpu_put = nvhe_vcpu_put,
> +};
> +
> +static const struct kvm_vcpu_ops pkvm_vcpu_ops = {
> +	.vcpu_load = pkvm_vcpu_load,
> +	.vcpu_put = pkvm_vcpu_put,
> +};
> +
> +static const struct kvm_vcpu_ops *arm64_vcpu_ops[] = {
> +	[VM_VHE] = &vhe_vcpu_ops,
> +	[VM_NVHE] = &nvhe_vcpu_ops,
> +	[VM_PKVM] = &pkvm_vcpu_ops,
> +	[VM_PROTECTED_PKVM] = &pkvm_vcpu_ops,
> +};
> +

We may avoid the variables {vhe, nvhe, pkvm}_vcpu_ops which are used for once:

static const struct kvm_vcpu_ops kvm_vcpu_ops[] = {
	[VM_VHE]            = { vhe_vcpu_load,  vhe_vcpu_put  },
	[VM_NVHE]           = { nvhe_vcpu_load, nvhe_vcpu_put },
	[VM_PKVM]           = { pkvm_vcpu_load, pkvm_vcpu_put },
	[VM_PROTECTED_PKVM] = { pkvm_vcpu_load, pkvm_vcpu_put },
};

>   static unsigned long nvhe_percpu_size(void)
>   {
>   	return (unsigned long)CHOOSE_NVHE_SYM(__per_cpu_end) -

Thanks,
Gavin

