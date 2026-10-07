Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A50E4AD7EF
	for <linux-coco@lists.linux.dev>; Wed,  7 Oct 2026 14:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791382844; cv=pass; b=T+3wuEDd6QnGUEO/gkjtmtu6J1XnkKn8lmetEvoKNFpwvNgAomneUwmiD0tbrpwXZIXEPykbf9adInr4TcV+8Lp9nhETOKihoDIQtx0j8FgYaoxCq3sgqHwpZGdpV7D0cidYMe0c/QVyWhQLL1L1kvwJIRLxyf5oqdG9F5MjB10=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791382844; c=relaxed/simple;
	bh=o3uLcb/w+UjgedlrqzsxP4CDLrNZM+eCbg0hqnND8A8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L11E2G8i9bxoze2C+kxZowJn3Sq2nhUnsDA7l8p5MDLxVm05WoSTPftEGFXc9HhO9K6S08e8bA6Bw8PR9RERfBdgwCBQ9mFMWw0KGC0dz9kiLg07rH2hmML/qLyGKVtoMBNdvURVNFv1WE+WAhfQsFnKqKz5Rp5+vI4qkNCR4yg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kx8Rlk6z; arc=pass smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kx8Rlk6z"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5bcc04c71f5so9214e87.0
        for <linux-coco@lists.linux.dev>; Wed, 07 Oct 2026 07:20:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791382830; cv=none;
        d=google.com; s=arc-20260327;
        b=BJk+4mnLikeaFfp5I2IfkmdUKx1uql2714CplYNgJuW9FtCkbr5kWGOZeNMh83hGJP
         ZL1M9AmRpOM8+NNNW0OyLDmGs1lA0/QU/wuRSbxOB9a61CjSaeR0mjQZnLnj4OFgycU3
         ppln9ioH/pKBXOjlrQfPOEDIvUfQmHQB7dtkjmZ+pEgIl2m8VqKrvxWTESpz7TTTvVMh
         8RaUrtHrRD2YkYZ3uFArZIiXnbJyl1DXmq9IBAAXH1O1shmKzpHeYOw1rnj0bSRO5C9f
         t7crWgbFu+1jFtYnHwC4luLKJjQsyOiliKpK3Ie2SgcVaTEqxkZxQgjeObfRKr49wYI9
         x/Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=4UyXA6Kbx2RrlHyZTfn8yf8h54TNQENLjWNQqtxe20s=;
        fh=vLwy9x7zzfzT93VRz4b8aZ0+MK+JFlKWWrul8ZkMkfY=;
        b=lf80GnDk65gxdpBMgoY7wOEi2zpGIhGlscJ8LXMkEincm/pBMVobKCDOxridrjUb2X
         5+BvQLTaLXso9UY3eXoeCGnRQslN1YhMnSZPTfwpkyd1CnJ7evHnrvRojVltsHAKFpDt
         Dxrp/UcogUAhH5kYWBC+10N0MqarGXC7hi5VgxvzsOsu+RSuvsnimeWmq7I3nnb4GI+8
         ez9zu6tJ/tcg1POU8iXDXCiYZDjPl5JbtewGB5zYnsTd1LOe2/ZahoUR3Mq1ip2/+dEn
         6zK51SiOBuQrHITm1LA9pY4/OEPCobNxsIHkrsRpFm1SM8yqV4nVax3E5Ww6ycu5ni85
         Yhqg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791382830; x=1791987630; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4UyXA6Kbx2RrlHyZTfn8yf8h54TNQENLjWNQqtxe20s=;
        b=kx8Rlk6zMEi0VrS/rVTh8aQBhI9mSKUQsl+JrYf+6aJf6G5fX1V1fgIJgkHrLPM9hX
         O2VnhJzXNAwJrwFTuG0dDAKC9Oa6alPD/Ed/MnGlpK0T01CZiigFZmWoajmk60lq5Biu
         A952O1POtXJ3ZkZQhM7jKrXjrucCUQA+3c7zbzuuP5fGaxyNIxTwNnnhetWwHYDveIWb
         hN6M9WRxrIf95tExd7d8EyK2lxJ9nPohfyDCoYThU7O4Yt/RhFJBQ+r+khUghM/F6YnP
         XAIEska+SnXu68yD5vzNpuiMl8Gi13mVZrFLYzypzY2KlD3vgbb2yXVa2Z9nuALoazQB
         wWbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791382830; x=1791987630;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4UyXA6Kbx2RrlHyZTfn8yf8h54TNQENLjWNQqtxe20s=;
        b=uPuwqX/BUlx/YdC0+utdYAcZxVf8hYBJKkWSzsOAbiSuA5J+lIbULSa0ionW5YX2b6
         LH5088JDTECEqCP6W9m0LlVnZ5l5wPZJ7uaOIKtSxMyaxqppVp7MMqJpebndVA6RVesi
         xoJNu8JjpJ0g32giB1N7KLftB//D3ceCNmsEMMIGOBF7y6WAUCvn97Lneeh5srZ/b+dz
         YuyK8LPRyqECSM/Xx96AInIhggUnOmU5BPxSNcObpBViveKu96F9Rjp6Dx7gH7/8x/9E
         w3VOJ9GaINUSa2kJ8c/RLRWfKbkoU3BirSKeaG20rG4G0NV7ebeeNEexEnfO8R1ZIF8f
         qSAQ==
X-Forwarded-Encrypted: i=1; AKwUvBz4+rciltOGfui7fdfWStzkEr76/10AdAoXlxeni5Uh6reXxqwpDI8ihqnwd91PfeLYeeJ0pYdCFrZi@lists.linux.dev
X-Gm-Message-State: AFq9FYJwsfr/HlM5sHZsuZMriM4RJXFgJ7U8xmmpQLFP0nJg/qpF32ql
	GZHniTIAWd6aUaceKSVRuR5EZkBxUjU4aEUj/DVV7WhTLpb1TeSuXuYVjnjCl8d67GhHJsLuf9P
	I/QZuJosiHvXj3j1Qo34ya7FDj/9OpN1eE56CUGIu
X-Gm-Gg: AYBFou3fOdZc+3rJ4e2ZVskxx8SkgM1i6CYB8eHWTC3mkZCURRTS4QkURVBDl32xVyd
	b+Iz7TeVIRP1jFVCZIlDCe7YttqutXOi1V+ZK0uUDNiZCG9rVYrsW6lLxm3epaJlQ1PWe5zTJV9
	3ScYrQbG8rJy+Y/XLeZkr2Pc8Q6SEqLbA/lZia6daBMV/yhh6glTb1VipF+EHXArN5nrYyYC6yH
	YoM/LCqdZaskT3SKJO2ic0OP8J3yQi8b/5YAGM5gA9yG/wT9S422p2eG6V/2Ntwr150m1VVpOYo
	eOafgXPU7H7DPEbY9DgXZODJrgr2Ee6lzkYk1eiSZWvvY+BQTJ8PzBa5
X-Received: by 2002:a05:6512:1555:b0:5b8:ebf3:3370 with SMTP id
 2adb3069b0e04-5bcca158f5emr347184e87.5.1791382829437; Wed, 07 Oct 2026
 07:20:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261007073537.2454351-1-suzuki.poulose@arm.com> <20261007073537.2454351-15-suzuki.poulose@arm.com>
In-Reply-To: <20261007073537.2454351-15-suzuki.poulose@arm.com>
From: Fuad Tabba <tabba@google.com>
Date: Wed, 7 Oct 2026 16:19:53 +0200
X-Gm-Features: AclHuK_RXJYhqf_nHqmpzWADAUDPbDkHCi_xcSBTNQ3epFkbXZUQQ8UXgywpORk
Message-ID: <CA+EHjTx-niYPnnRDvAAiY3MXLpSYau_PhiBTCiE9mOYUChASPQ@mail.gmail.com>
Subject: Re: [PATCH v23 14/14] KVM: arm64: Prevent unsupported vcpu features
 for VM types
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, maz@kernel.org, 
	will@kernel.org, catalin.marinas@arm.com, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, steven.price@arm.com, 
	aneesh.kumar@kernel.org, oupton@kernel.org, gshan@redhat.com, 
	joey.gouly@arm.com, yuzenghui@huawei.com, linux-coco@lists.linux.dev, 
	gankulkarni@os.amperecomputing.com, sdonthineni@nvidia.com, 
	alpergun@google.com, fj0570is@fujitsu.com, WeiLin.Chang@arm.com, 
	lpieralisi@kernel.org, enju.kohei@fujitsu.com, sudeep.holla@arm.com, 
	jonathan.cameron@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"

Hi Suzuki,

On Wed, 07 Oct 2026 08:35:37 +0100, Suzuki K Poulose
<suzuki.poulose@arm.com> wrote:
[...]
> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
> index 4d0e6bd2009ac..97089c81d6428 100644
> --- a/arch/arm64/include/asm/kvm_host.h
> +++ b/arch/arm64/include/asm/kvm_host.h
> @@ -42,6 +42,13 @@
>  #define KVM_VCPU_MAX_FEATURES 10
>  #define KVM_VCPU_VALID_FEATURES        (BIT(KVM_VCPU_MAX_FEATURES) - 1)
>
> +/* As dictated by kvm_pkvm_ext_allowed() */
> +#define KVM_PROTECTED_VCPU_VALID_FEATURES              \
> +       (BIT(KVM_ARM_VCPU_POWER_OFF)            |       \
> +        BIT(KVM_ARM_VCPU_PSCI_0_2)             |       \
> +        BIT(KVM_ARM_VCPU_PTRAUTH_ADDRESS)      |       \
> +        BIT(KVM_ARM_VCPU_PTRAUTH_GENERIC))

kvmarm/next already restricts protected VM features through
kvm_pkvm_vcpu_allowed_features(), shared with EL2 (0b7d843ef3bf).
Could you rebase on that and drop the protected half of this patch,
rather than add a second list?


Cheers,
/fuad
