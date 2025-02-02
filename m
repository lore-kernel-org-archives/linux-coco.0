Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A3CC2AEF5
	for <linux-coco@lists.linux.dev>; Sun,  2 Feb 2025 23:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738538129; cv=none; b=BD0SGN3xKGdyC8HddNiJXd6N/sMAMS7NoNpJC30lw2KNbKkyUmPi7MQUkWIySJMSo+5WWZ7QICQpqjdBCOhZmT1spz+WXgQ+BGy9xKii5mq/QXozjDdTREJ0wnXJFoe1/t1Vlc6w1Dv9yAqh0j9Bdxf3MSUVzfdtlScn4hbcZKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738538129; c=relaxed/simple;
	bh=z4db+2e0h419DE1q2WVYFefMz+/sAeD1xP8xxo9CJHM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=easmDJ5yTGN5CRA2brfSI+atVuGBcMmjOkAfgxmeu91KMhrcCVc4rk1mizamKtllw59E7CJTB0cVLr+qtvT9u+uMRv84wDd0p0hFVYMVJ+pPE8iju1tozgTga8BRGAbdJl5sXXMbM4j2QouuqRuM/9BpQHqO+HNLlqm+5K+dMFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ze3Juraj; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ze3Juraj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738538126;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=e1dos8mPCCNcJjz8w4voHe85/j4TJkmhqF45HVaBd4U=;
	b=Ze3JurajOqjXDLx8UyPKcUrizBwqwS2QtKokQ2ffW8nsQ5jj+3VOCQGzIqe00QUjqnhMvj
	giQKusinQkz7pRvFHBWkyB3wcWSnjRUbi6k2d1lKFeHL88VKFdqROKJNfzSc1mDzOx5ecy
	cMt9GfTYkyIrM40mW9buosZm8wfSiuc=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-665-puGwjQHPMRe90pR3Wt32sQ-1; Sun, 02 Feb 2025 18:15:23 -0500
X-MC-Unique: puGwjQHPMRe90pR3Wt32sQ-1
X-Mimecast-MFC-AGG-ID: puGwjQHPMRe90pR3Wt32sQ
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-216311faa51so67361435ad.0
        for <linux-coco@lists.linux.dev>; Sun, 02 Feb 2025 15:15:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738538122; x=1739142922;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e1dos8mPCCNcJjz8w4voHe85/j4TJkmhqF45HVaBd4U=;
        b=ndnyj7UZZMMxx6xDqlZvC3bt7hBKoVHO74BHtSZYuUR5A3Q+G0rebim+aP5jvZ0H8W
         pw48g23TVKv5xuNVnxBZzDNvCSktMom+MtLe0etAiEngmsvZgmwPdUooW5r9TpYX/7PY
         DKB2wtid6RcjiohYlv9ATV70uVvHbTtKYftBfXKEMCrL1n0qlt+NIA4fa1OYaVxMHZMJ
         LJFTxxugg+WONvz3laeY935psSTuQI6F38x07z5RY789tjweJ8NjGOqW/cKZdW7Haghl
         JM8mhzxvfp0YGvwRyxWmv91BBincvBRFW76NCV5QtWzcvNAVFQDF8eX3v8OdhGG9fuEy
         c4QQ==
X-Forwarded-Encrypted: i=1; AJvYcCXAwpe00peLARxzJXVX04scsDFkqTf0XsDrzElOe/IX8Vzu3enzXo5Noy69EG2WS/DkQF4D0pCLUjxE@lists.linux.dev
X-Gm-Message-State: AOJu0Yx+qHDPboNaYC2oq3PYjmGvjArf1jrh21Vz4y6kISfKkA4XXLBx
	W6GjQQnbAxVtq6SoeHUWO85TOgyoELRsgFkgL82bPkehH9qz7x7stXuLi1h+qtBXPN5u5xNPjH4
	Ef3xz6/+zs8h4ZMjBL6XiCECsQxPiz7CcQ+6j8WjZjqG2NvZn9QtEig+XM+w=
X-Gm-Gg: ASbGncuD/OQjkAdTBhVvvkw91pVRKXPn3n4Af+yb/7ktp4nH7xxP6Gq2VMwHE2lLwNU
	05o56p4UxZF62G59NWNjqLRql8I8BbcK035UdyC6bgCmhHUhmHx7/OG2LSyAdM8xJzrdj+QsTF7
	QhC1uRwVuW1u5BIGpnjmXeTsPHQI/69/un5hS9vYAFAlAJsSC6j1ydvHxTLk9wSVKbitSmxmk2C
	rc+p5kMqnR9f+Ox/kx5qwpXVQY3YUspmZRqg48jQNCvtG5eyVT3vFXmekXluWB7+fzfc+fbBhGg
	9csmMw==
X-Received: by 2002:a17:903:120a:b0:216:3f6e:fabd with SMTP id d9443c01a7336-21edd7eafccmr173598905ad.7.1738538122319;
        Sun, 02 Feb 2025 15:15:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE2mf76DirOg9TZyfOkrJfXsutpQ6g81h2feZA7/LYyJlI04cSOqf6NavNatW10Gphrl5eu/w==
X-Received: by 2002:a17:903:120a:b0:216:3f6e:fabd with SMTP id d9443c01a7336-21edd7eafccmr173598665ad.7.1738538121968;
        Sun, 02 Feb 2025 15:15:21 -0800 (PST)
Received: from [192.168.68.55] ([180.233.125.64])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de32ea5fesm62974185ad.132.2025.02.02.15.15.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Feb 2025 15:15:21 -0800 (PST)
Message-ID: <34990c4f-b65e-4af2-8348-87ea078afc16@redhat.com>
Date: Mon, 3 Feb 2025 09:15:12 +1000
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 34/43] arm64: RME: Propagate number of breakpoints and
 watchpoints to userspace
To: Steven Price <steven.price@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>,
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
 <20241212155610.76522-35-steven.price@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20241212155610.76522-35-steven.price@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: zyueNCUASkE9JQPNh2fVNXRpPfL0iSqZWr6TXtgLDXQ_1738538122
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/13/24 1:55 AM, Steven Price wrote:
> From: Jean-Philippe Brucker <jean-philippe@linaro.org>
> 
> The RMM describes the maximum number of BPs/WPs available to the guest
> in the Feature Register 0. Propagate those numbers into ID_AA64DFR0_EL1,
> which is visible to userspace. A VMM needs this information in order to
> set up realm parameters.
> 
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
>   arch/arm64/include/asm/kvm_rme.h |  2 ++
>   arch/arm64/kvm/rme.c             | 22 ++++++++++++++++++++++
>   arch/arm64/kvm/sys_regs.c        |  2 +-
>   3 files changed, 25 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/include/asm/kvm_rme.h b/arch/arm64/include/asm/kvm_rme.h
> index 0d89ab1645c1..f8e37907e2d5 100644
> --- a/arch/arm64/include/asm/kvm_rme.h
> +++ b/arch/arm64/include/asm/kvm_rme.h
> @@ -85,6 +85,8 @@ void kvm_init_rme(void);
>   u32 kvm_realm_ipa_limit(void);
>   u32 kvm_realm_vgic_nr_lr(void);
>   
> +u64 kvm_realm_reset_id_aa64dfr0_el1(const struct kvm_vcpu *vcpu, u64 val);
> +
>   bool kvm_rme_supports_sve(void);
>   
>   int kvm_realm_enable_cap(struct kvm *kvm, struct kvm_enable_cap *cap);
> diff --git a/arch/arm64/kvm/rme.c b/arch/arm64/kvm/rme.c
> index e562e77c1f94..d21042d5ec9a 100644
> --- a/arch/arm64/kvm/rme.c
> +++ b/arch/arm64/kvm/rme.c
> @@ -63,6 +63,28 @@ u32 kvm_realm_vgic_nr_lr(void)
>   	return u64_get_bits(rmm_feat_reg0, RMI_FEATURE_REGISTER_0_GICV3_NUM_LRS);
>   }
>   
> +u64 kvm_realm_reset_id_aa64dfr0_el1(const struct kvm_vcpu *vcpu, u64 val)
> +{
> +	u32 bps = u64_get_bits(rmm_feat_reg0, RMI_FEATURE_REGISTER_0_NUM_BPS);
> +	u32 wps = u64_get_bits(rmm_feat_reg0, RMI_FEATURE_REGISTER_0_NUM_WPS);
> +	u32 ctx_cmps;
> +
> +	if (!kvm_is_realm(vcpu->kvm))
> +		return val;
> +
> +	/* Ensure CTX_CMPs is still valid */
> +	ctx_cmps = FIELD_GET(ID_AA64DFR0_EL1_CTX_CMPs, val);
> +	ctx_cmps = min(bps, ctx_cmps);
> +
> +	val &= ~(ID_AA64DFR0_EL1_BRPs_MASK | ID_AA64DFR0_EL1_WRPs_MASK |
> +		 ID_AA64DFR0_EL1_CTX_CMPs);
> +	val |= FIELD_PREP(ID_AA64DFR0_EL1_BRPs_MASK, bps) |
> +	       FIELD_PREP(ID_AA64DFR0_EL1_WRPs_MASK, wps) |
> +	       FIELD_PREP(ID_AA64DFR0_EL1_CTX_CMPs, ctx_cmps);
> +
> +	return val;
> +}
> +

The the filed ID_AA64DFR0_EL1_WRPs_MASK of the system register ID_AA64DFR0_EL1 is
writtable, as declared in sys_reg.c. We need to consolidate the field when the
system register is written.

         ID_FILTERED(ID_AA64DFR0_EL1, id_aa64dfr0_el1,
                     ID_AA64DFR0_EL1_DoubleLock_MASK |
                     ID_AA64DFR0_EL1_WRPs_MASK |
                     ID_AA64DFR0_EL1_PMUVer_MASK |
                     ID_AA64DFR0_EL1_DebugVer_MASK),

>   static int get_start_level(struct realm *realm)
>   {
>   	return 4 - stage2_pgtable_levels(realm->ia_bits);
> diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
> index a4713609e230..55cde43b36b9 100644
> --- a/arch/arm64/kvm/sys_regs.c
> +++ b/arch/arm64/kvm/sys_regs.c
> @@ -1806,7 +1806,7 @@ static u64 sanitise_id_aa64dfr0_el1(const struct kvm_vcpu *vcpu, u64 val)
>   	/* Hide SPE from guests */
>   	val &= ~ID_AA64DFR0_EL1_PMSVer_MASK;
>   
> -	return val;
> +	return kvm_realm_reset_id_aa64dfr0_el1(vcpu, val);
>   }
>   
>   static int set_id_aa64dfr0_el1(struct kvm_vcpu *vcpu,

Thanks,
Gavin

