Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD4577FBA2
	for <linux-coco@lists.linux.dev>; Wed, 30 Apr 2025 05:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745992462; cv=none; b=B5CSptU/mqq6hIwh1ctsvxC5b2HCfNfOuKa29CVQ/zhdjCkC2Q2KAsUa8CYB6MJqB4j95Jx6N/U6kDn2rRpP0s22GXu3wikEEDWYh+RpkWMz8yncPAg6aserc2zMWwLcO3woK+9/Ya178nqvc+YtJJLj7eb8/NXkdRHfhFWqDdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745992462; c=relaxed/simple;
	bh=gjiijpuNZ8eaxb49J32vdBIrEm2hghOHXs5lHIIU/Wg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q+h/aGwY0z8pSi4V51BgNCATrAt4BSossaB/fjVdtBmrTsxtP9t7CTmxzoAYoefYw54VpDkoC2DSrAl/K8GNPz6YL4REEv+t6bOzI/JwAS6eSDvnAW4Ujpm6F9q56sBgPRshhzxRtYVsiul1vx/xqINJtiN38FxQjsHCv0qfpJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hZwUs5rW; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hZwUs5rW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745992459;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bIGWFGarGyFIijKMOzGh/uSVQg6azY82PqS3bKeu+Kk=;
	b=hZwUs5rWgk56EPiga55icA2l4rDrSxK2Db74ZHyyIwn01rgLnJETFFYfg5Z05IDGOo3H/Z
	R9WuQcLKgCDqg+3sPFZlGE8fXJHbhgf50QNUtsjcsBokeNu9roPy/4++Hen65v7m42lH+u
	LMaRgglVaxMgispzxKwcsMQXO/ILlqY=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-46-2lgSbAzFNf6cfbezTHxeig-1; Wed, 30 Apr 2025 01:54:18 -0400
X-MC-Unique: 2lgSbAzFNf6cfbezTHxeig-1
X-Mimecast-MFC-AGG-ID: 2lgSbAzFNf6cfbezTHxeig_1745992457
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7401179b06fso2641192b3a.1
        for <linux-coco@lists.linux.dev>; Tue, 29 Apr 2025 22:54:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745992457; x=1746597257;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bIGWFGarGyFIijKMOzGh/uSVQg6azY82PqS3bKeu+Kk=;
        b=rKhLetz1ZyJY5nhQH0liDLrRu5cxHxH0K48TGMJARWnl+6OmhqOytLxZKBlr2FwWE9
         UgWTVpTCF1VE2d7CoWwwWG4YxLyjPVVjQmFj9QDUJBTQght9txHZb3SRGrJg01i77C74
         +JPF44PvsBtFaYfZCbd7CCsRB+eCHgH7iI96uwf1w0wMgVXONHH2LuS757ExpcIMq05D
         W7WbNRFBDW37n+Xo/s7HOhdB6RjYCGY46WT675UsweUDTn8p/itpTbDXuF2isdR5UFhX
         B25aKJfAQCpShrzbdL6zqUS5s5WqC3I6vbryAzVIIEGwndKD//HKe4r2qsXg9+vw/Atl
         RsKg==
X-Forwarded-Encrypted: i=1; AJvYcCU7Gou9dJsPLOT6wcTa0owiMn+XdGCOSZyyNhjp6+SFxukaGRqr9ixRS5ADCevoUj22eOtnsHKSbXki@lists.linux.dev
X-Gm-Message-State: AOJu0YzD6fdv3ktwDGdOAfgkpy/J1AM0v6+SmEsnHjGHSb+7dvDeC1XP
	hwUuEXVq9O2+3b3ry6gg+Q2P2dqe9/TsUbKdHA+Os/0Bm3+XK8AoY5I5HRW3DjJa16JFCsSlfju
	sTCTcg+D4nVVyZgwdOT/jPAD9gL6xo/G8Fstj2v39X0w9i9NydkDUlTJ6lAo=
X-Gm-Gg: ASbGncseipwhkKZhvaO4P8bhj1PfSJTcg/253zC3SWJ1Pstag3JV7OPYDO/rdoKH1RO
	vkLz5tMvGVrj3jcs80kZYsDHdkioLPeIC5XswGqbWb9KoMkG4jF9VKCxqFjessE0HfqqkDzGqnh
	c4HWe60fgcc1ufdG5+wzGTlDu+Ei2CX6Z2/bk0OauK4cRjg2J20kRIO39dtywKoZa6kU6iCMiP3
	gfhUQxozwx4xWUctyCQX4NXuvv1e9rAIif0RtJFQnR1uC16/VAytrfqajxA3GMtX443fkWh0oNu
	9Jn1bSG/czGh
X-Received: by 2002:a05:6a20:6f09:b0:1ee:c7c8:ca4 with SMTP id adf61e73a8af0-20a89a00bbcmr2861337637.36.1745992457142;
        Tue, 29 Apr 2025 22:54:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHUXFSfIAhV0jE/BzfNUpot5jDexa8qPOr5xBP2FVKQDAqbgwsZM0ilxjtUmRqioxNOvLSyig==
X-Received: by 2002:a05:6a20:6f09:b0:1ee:c7c8:ca4 with SMTP id adf61e73a8af0-20a89a00bbcmr2861303637.36.1745992456803;
        Tue, 29 Apr 2025 22:54:16 -0700 (PDT)
Received: from [192.168.68.51] ([180.233.125.65])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74039a94aecsm792360b3a.178.2025.04.29.22.54.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Apr 2025 22:54:16 -0700 (PDT)
Message-ID: <dda34de7-703b-4d9c-8666-c1a195327f32@redhat.com>
Date: Wed, 30 Apr 2025 15:54:08 +1000
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 12/43] KVM: arm64: vgic: Provide helper for number of
 list registers
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
References: <20250416134208.383984-1-steven.price@arm.com>
 <20250416134208.383984-13-steven.price@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20250416134208.383984-13-steven.price@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 0eY-mVhyZfYgwx80ZeToDidShST8BZHHS2Yu_YPAIu4_1745992457
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/16/25 11:41 PM, Steven Price wrote:
> Currently the number of list registers available is stored in a global
> (kvm_vgic_global_state.nr_lr). With Arm CCA the RMM is permitted to
> reserve list registers for its own use and so the number of available
> list registers can be fewer for a realm VM. Provide a wrapper function
> to fetch the global in preparation for restricting nr_lr when dealing
> with a realm VM.
> 
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
> New patch for v6
> ---
>   arch/arm64/kvm/vgic/vgic.c | 11 ++++++++---
>   1 file changed, 8 insertions(+), 3 deletions(-)
> 

With below nitpick addressed:

Reviewed-by: Gavin Shan <gshan@redhat.com>

> diff --git a/arch/arm64/kvm/vgic/vgic.c b/arch/arm64/kvm/vgic/vgic.c
> index 8f8096d48925..8d189ce18ea0 100644
> --- a/arch/arm64/kvm/vgic/vgic.c
> +++ b/arch/arm64/kvm/vgic/vgic.c
> @@ -21,6 +21,11 @@ struct vgic_global kvm_vgic_global_state __ro_after_init = {
>   	.gicv3_cpuif = STATIC_KEY_FALSE_INIT,
>   };
>   
> +static inline int kvm_vcpu_vgic_nr_lr(struct kvm_vcpu *vcpu)
> +{
> +	return kvm_vgic_global_state.nr_lr;
> +}
> +
>   /*
>    * Locking order is always:
>    * kvm->lock (mutex)
> @@ -802,7 +807,7 @@ static void vgic_flush_lr_state(struct kvm_vcpu *vcpu)
>   	lockdep_assert_held(&vgic_cpu->ap_list_lock);
>   
>   	count = compute_ap_list_depth(vcpu, &multi_sgi);
> -	if (count > kvm_vgic_global_state.nr_lr || multi_sgi)
> +	if (count > kvm_vcpu_vgic_nr_lr(vcpu) || multi_sgi)
>   		vgic_sort_ap_list(vcpu);
>   
>   	count = 0;
> @@ -831,7 +836,7 @@ static void vgic_flush_lr_state(struct kvm_vcpu *vcpu)
>   
>   		raw_spin_unlock(&irq->irq_lock);
>   
> -		if (count == kvm_vgic_global_state.nr_lr) {
> +		if (count == kvm_vcpu_vgic_nr_lr(vcpu)) {
>   			if (!list_is_last(&irq->ap_list,
>   					  &vgic_cpu->ap_list_head))
>   				vgic_set_underflow(vcpu);
> @@ -840,7 +845,7 @@ static void vgic_flush_lr_state(struct kvm_vcpu *vcpu)
>   	}
>   
>   	/* Nuke remaining LRs */
> -	for (i = count ; i < kvm_vgic_global_state.nr_lr; i++)
> +	for (i = count ; i < kvm_vcpu_vgic_nr_lr(vcpu); i++)
>   		vgic_clear_lr(vcpu, i);
>   

The unnecessary space before the semicolon can be dropped.

	for (i = count; i < kvm_vcpu_vgic_nr_lr(vcpu); i++)

>   	if (!static_branch_unlikely(&kvm_vgic_global_state.gicv3_cpuif))

Thanks,
Gavin

