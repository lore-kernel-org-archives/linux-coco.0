Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEBD123F40D
	for <linux-coco@lists.linux.dev>; Tue,  6 Oct 2026 03:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791256073; cv=none; b=YqhDMjG6fGOLQJPlVe8Y75md417vaH0SUFwJYnCnWEo6kQpZyD5LwIXLRqWyOUQPtH3uNdJ0rMlGHfsP0Ln6SVS+VQmOta42gLtKRjf+2xGhUqTLgRLfdDjxWQBMToo/q0XF/5jdXbVnx/O3LTeyhTIK0aoFI0nCXqOz/kQGJIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791256073; c=relaxed/simple;
	bh=gzkLCBUFd4kbcPEHkSHri54LfRKFf1qQMHTvyuqX+WQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ASAXw97bv9L4xmJRiDiTMWIJjKigo1RhEyiLX/7XjmolBWctX7m/tQEujtHiwfknmkd4sQwU/S9qlWrBcs2MOUzACZBmdae6wnsdLwLcdL0xwjTZVtfphshJaZ6+MEd+TTpv2Yq0vTqg8RZraGHku44LS69i7dq9jg39cRVYe08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=N0ipT6mk; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="N0ipT6mk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791256070;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fNeoxAcpqLuP6xVkV/ooADVzEQHG7XjJg+hDhApi/Aw=;
	b=N0ipT6mkeXBym7F+9+LDotE84QSlJvaz7/BmEdbrkn4Sv/n861xpct4rseeMMfk9JVY3XN
	zwVlqcD9PpMxX8Dk4+nmNs2q99JcQeHNHe8lDTYSRFUlIbSTgZ0gwV7ZeF5ThM/xUk1JX2
	0w6VOEWKfoLx1CE5Ok3Mqb49Lw1FSFs=
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-211-ogkpPHS_PgCGLnoIAjPo6Q-1; Mon, 05 Oct 2026 23:07:49 -0400
X-MC-Unique: ogkpPHS_PgCGLnoIAjPo6Q-1
X-Mimecast-MFC-AGG-ID: ogkpPHS_PgCGLnoIAjPo6Q_1791256069
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-ccacc75a997so1090008a12.0
        for <linux-coco@lists.linux.dev>; Mon, 05 Oct 2026 20:07:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791256069; x=1791860869;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fNeoxAcpqLuP6xVkV/ooADVzEQHG7XjJg+hDhApi/Aw=;
        b=mvEnsf/G3W7vbLrpm3EDiyi5k1R1WE6eHg8bv5nTIaq4RGlXM/sKo6BwtPQKseT12s
         gGwI0uoxKz571R/UOtFwN9AkOgn/wQ4MNrveRUI3RhEKJf3mkEe0aPl2XCjEw3HwJ/Ib
         aLWV91sAEgye7G1CND7l45VPydZkJ4CHGd7wK5mA6H+sLsydcobuNOVcfAVUwqzVJ6fa
         d1afYicbnIx3w77hVGUnAJvItP19fZrPg2v7sr5mtMLj0QlLlcsjqzdGSBQ6OjIG5GSa
         0FQrJ+dggxatTyOXuNmzx46cc4cauVnk0/ZHCUaIYnkkHupQ34b9KRgbnAbtTsY3dlyY
         KdLw==
X-Forwarded-Encrypted: i=1; AKwUvBwnpjoRT+ayOXxi1Gxp85PCotOa4SIMlJelkFCfqcxCOdhoKvfrvC5ngwbpH4LT/fG4mO+WXQ8y9u1i@lists.linux.dev
X-Gm-Message-State: AFuF++m/nrXXRoLTNFADToRewMjo3tfv+4sZFTyKxOpKZGA3QueNQyFz
	WsHrO7+q+x0N78WBudpGq/H+CSkOERbNh9X+lZiD3XxZMw8ciVGCI0VVZCPZ0J6W7z1l8jBPXk5
	ZI1Np+F1gpLzY1eqyqpvs8WR7RixEKdgzQw875wrvnpr4E/xz2Ub/RsrKeRxheBc=
X-Gm-Gg: AYBFou2ZvL8XMlNvTZrCAclMQ83KeCJrYggvcNbLcidOipvO7FmoI4291vzDR0dzobz
	G3z6ViXrR1z4gNm4ALCBQt7qYtGXXB2UXyuGsz0AzQYnBC2ZnOhSgZH7N35svDZvfW+4Sfphrq7
	d+UO+UYUis/GW+XIL114M2XijxqxB1CLBVBDb1KJhDEwBU1Te6toPNTjf8McfWj9zxyNYMJfBiC
	3Fhz38s7IG4wYwQd7l5btaEX8NxKSOxINwVtDsfK8J8o8cXLReDQl68OJxqv00/eLB5GMhuV5Vz
	XXgCAEF/ZYPNYG6SCQHyxfc/PYNhaqob4hXX3I2UDSFmz7DctScdCf62dzLaejJv99bhmtgF4OQ
	sYMo84+u90qasQDz/kX5Cc7mYTCNOGf5Kh/jWHanFYg==
X-Received: by 2002:a05:6a21:1392:b0:3e0:c57c:200b with SMTP id adf61e73a8af0-3e0d6cda067mr8229870637.40.1791256068567;
        Mon, 05 Oct 2026 20:07:48 -0700 (PDT)
X-Received: by 2002:a05:6a21:1392:b0:3e0:c57c:200b with SMTP id adf61e73a8af0-3e0d6cda067mr8229853637.40.1791256068087;
        Mon, 05 Oct 2026 20:07:48 -0700 (PDT)
Received: from [192.168.68.52] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cce6b542fc9sm1722095a12.1.2026.10.05.20.07.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Oct 2026 20:07:46 -0700 (PDT)
Message-ID: <d8bdfcaf-3b4f-4ab1-9b73-597c60bbb60b@redhat.com>
Date: Tue, 6 Oct 2026 13:07:37 +1000
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v22 13/23] KVM: arm64: Abstract out memory abort handling
To: Suzuki K Poulose <suzuki.poulose@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: maz@kernel.org, will@kernel.org, catalin.marinas@arm.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 steven.price@arm.com, aneesh.kumar@kernel.org, oupton@kernel.org,
 joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
 linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
 sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
 WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com,
 sudeep.holla@arm.com, jonathan.cameron@oss.qualcomm.com
References: <20261005090754.2140522-1-suzuki.poulose@arm.com>
 <20261005090754.2140522-14-suzuki.poulose@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20261005090754.2140522-14-suzuki.poulose@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: xk_7mwx-njVNMO1cTyLRM_k5BMLy6xzPivclwW77258_1791256069
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/5/26 7:07 PM, Suzuki K Poulose wrote:
> Move the memory abort handling under VM specific s2 operation.
> 
> Tested-by: Gavin Shan <gshan@redhat.com>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> ---
> Changes since v21:
>   - Rename protected_vm_mem_abort => protected_pkvm_mem_abort for consistency
>     with the other callbacks.
> ---
>   arch/arm64/include/asm/kvm_host.h |  2 ++
>   arch/arm64/kvm/mmu.c              | 33 ++++++++++++++++++-------------
>   2 files changed, 21 insertions(+), 14 deletions(-)
> 

One nitpick below. In either way:

Reviewed-by: Gavin Shan <gshan@redhat.com>

> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
> index 0778c308ce597..7cb343583953d 100644
> --- a/arch/arm64/include/asm/kvm_host.h
> +++ b/arch/arm64/include/asm/kvm_host.h
> @@ -156,6 +156,7 @@ struct kvm_vcpu_ops {
>   };
>   
>   struct kvm_gfn_range;
> +struct kvm_s2_fault_desc;
>   
>   struct kvm_vm_s2_ops {
>   	bool (*vm_age_gfn)(struct kvm *kvm, struct kvm_gfn_range *range);
> @@ -166,6 +167,7 @@ struct kvm_vm_s2_ops {
>   	void (*vm_stage2_unmap_range)(struct kvm_s2_mmu *mmu,
>   				      phys_addr_t start, u64 size,
>   				      bool may_block);
> +	int (*vm_mem_abort)(const struct kvm_s2_fault_desc *s2fd);
>   };
>   
>   struct kvm_s2_mmu {
> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> index 9cc7fcde4dd0a..ccbe2ffeda40b 100644
> --- a/arch/arm64/kvm/mmu.c
> +++ b/arch/arm64/kvm/mmu.c
> @@ -1740,7 +1740,7 @@ struct kvm_s2_fault_vma_info {
>   	bool		map_non_cacheable;
>   };
>   
> -static int pkvm_mem_abort(const struct kvm_s2_fault_desc *s2fd)
> +static int protected_pkvm_mem_abort(const struct kvm_s2_fault_desc *s2fd)
>   {
>   	unsigned int flags = FOLL_HWPOISON | FOLL_LONGTERM | FOLL_WRITE;
>   	struct kvm_vcpu *vcpu = s2fd->vcpu;
> @@ -2178,6 +2178,20 @@ static int user_mem_abort(const struct kvm_s2_fault_desc *s2fd)
>   	return kvm_s2_fault_map(s2fd, &s2vi, prot, memcache);
>   }
>   
> +static int kvm_vm_mem_abort(const struct kvm_s2_fault_desc *s2fd)
> +{
> +	struct kvm_vcpu *vcpu = s2fd->vcpu;
> +
> +	VM_WARN_ON_ONCE(kvm_vcpu_trap_is_permission_fault(vcpu) &&
> +			!kvm_is_write_fault(vcpu) &&
> +			!kvm_vcpu_trap_is_exec_fault(vcpu));
> +
> +	if (kvm_slot_has_gmem(s2fd->memslot))
> +		return gmem_abort(s2fd);
> +	else
> +		return user_mem_abort(s2fd);
> +}

The "if...else" block is moved from kvm_handle_guest_abort(), but it might be
clearer if we have:

	if (kvm_slot_has_gmem(s2fd->memslot))
		return gmem_abort(s2fd);

	return user_mem_abort(s2fd);

> +
>   /* Resolve the access fault by making the page young again. */
>   static void handle_access_fault(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa)
>   {
> @@ -2447,19 +2461,7 @@ int kvm_handle_guest_abort(struct kvm_vcpu *vcpu)
>   		.hva		= hva,
>   	};
>   
> -	if (kvm_vm_is_protected(kvm)) {
> -		ret = pkvm_mem_abort(&s2fd);
> -	} else {
> -		VM_WARN_ON_ONCE(kvm_vcpu_trap_is_permission_fault(vcpu) &&
> -				!write_fault &&
> -				!kvm_vcpu_trap_is_exec_fault(vcpu));
> -
> -		if (kvm_slot_has_gmem(memslot))
> -			ret = gmem_abort(&s2fd);
> -		else
> -			ret = user_mem_abort(&s2fd);
> -	}
> -
> +	ret = kvm->arch.vm_s2_ops->vm_mem_abort(&s2fd);
>   	if (ret == 0)
>   		ret = 1;
>   out:
> @@ -2873,6 +2875,7 @@ static const struct kvm_vm_s2_ops protected_pkvm_vm_s2_ops = {
>   	.vm_age_gfn			= no_age_gfn,
>   	.vm_test_age_gfn		= no_age_gfn,
>   	.vm_stage2_unmap_range		= no_stage2_unmap_range,
> +	.vm_mem_abort			= protected_pkvm_mem_abort,
>   };
>   
>   static const struct kvm_vm_s2_ops pkvm_vm_s2_ops = {
> @@ -2881,6 +2884,7 @@ static const struct kvm_vm_s2_ops pkvm_vm_s2_ops = {
>   	.vm_age_gfn			= pkvm_age_gfn,
>   	.vm_test_age_gfn		= pkvm_test_age_gfn,
>   	.vm_stage2_unmap_range		= pkvm_stage2_unmap_range,
> +	.vm_mem_abort			= kvm_vm_mem_abort,
>   };
>   
>   static const struct kvm_vm_s2_ops kvm_default_vm_s2_ops = {
> @@ -2889,6 +2893,7 @@ static const struct kvm_vm_s2_ops kvm_default_vm_s2_ops = {
>   	.vm_age_gfn			= kvm_vm_age_gfn,
>   	.vm_test_age_gfn		= kvm_vm_test_age_gfn,
>   	.vm_stage2_unmap_range		= kvm_vm_stage2_unmap_range,
> +	.vm_mem_abort			= kvm_vm_mem_abort,
>   };
>   
>   #define KVM_VM_S2_OPS(flavor, ops)		\

Thanks,
Gavin

