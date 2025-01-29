Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDBB718B499
	for <linux-coco@lists.linux.dev>; Wed, 29 Jan 2025 04:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738123685; cv=none; b=OKbPfrA3wlLM11J/FXKj5Ld7+8bJFzmif7NUMcSw5AHKWO7C/rpcAYoc7e4MHnmAO5chw/v0iqNQC+TF1nal/CiebUyKJQUG83DyTkvj87bJjvrASJ7zauxSRXkkUXNnbtUAZ29DQQC6mY9hW3xu4VqfnpPHmYwn0hEme5ClGRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738123685; c=relaxed/simple;
	bh=CsAeFJeoQweV080X+SOo03x6K4oJXpfbYalIrjSAXhw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CV+sNVDrHJ9bvF6DVc5ekcmHW0dVIX0twSHTk0Kjq+2l0D9LOL6yLgg6qw9P3nfy+pMwla8pTsh8Xsj9zRjlufp2gOQM0alVqS73CfSGqbwAyIKYQTqlqB14NXlORLF18r/MPJBCMzZz/RkF2xRfgTyNWNT+RILz9n3UnD3V+vY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cDq+KGmu; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cDq+KGmu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738123682;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=++vP7Pzm+0U/vbuzpGurQDME6fn3ZbIwZpBgDGBaFV0=;
	b=cDq+KGmuqLNeAHcmuQKXgmemTzj6i7s9oaokuT4PqzJaaZA0Tb7i69sbIZNyQTtkVnPCmF
	DUnxitFsma+f9WBOoRDLXJSOZcOWIOX8UHNARw9hGfFdCRGqNdS+yytys9ecMgMDGJjgom
	Hsvfm3JLFf98Q1Ojq7d9aZFGHcOs0Tg=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-416-d2GUTiaePZCpEdjRPzLCTQ-1; Tue, 28 Jan 2025 23:08:01 -0500
X-MC-Unique: d2GUTiaePZCpEdjRPzLCTQ-1
X-Mimecast-MFC-AGG-ID: d2GUTiaePZCpEdjRPzLCTQ
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-21640607349so147281635ad.0
        for <linux-coco@lists.linux.dev>; Tue, 28 Jan 2025 20:08:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738123680; x=1738728480;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=++vP7Pzm+0U/vbuzpGurQDME6fn3ZbIwZpBgDGBaFV0=;
        b=LhvbI09TLXuESYNcN1JKqmTGD0sJdn+NH481+y5jqRPWvjsTvr8DX3cdYM9zfl4nRC
         ce0zalYjJsrG+3up9aD5lxhcd5zSnBtXemOU0F1bdxd5QVEPe1lJ6D5ct6RCf/rOZeiG
         F3VSwpDzDlndBmGKqhChErycXwXHIalzS5BUY/h2Ev02V+gg6xEIx8gxJK2JHm4Or3Kn
         3M7Aa/4uJbzW+kiRa5tWgS24Y18CTxdfGYLkWdTg2cCPbe4/Jv3FiUr8GehZrABa2NP4
         bKnnUYfvir0dkwkO+0/of6GNgzwKeZLpOTE5c1QbJscGyL3mG4BKUv98k2NiSGpyUuxe
         PbXQ==
X-Forwarded-Encrypted: i=1; AJvYcCWX+Fv+h4CusFN8/ZEWe1cV81jxcHofSF6iG6m6t0RaCSV6xCNTVUHf66id1M1/s8rv5siG7EPBBXVw@lists.linux.dev
X-Gm-Message-State: AOJu0YxeEcuwRJFsQp4tw0jj7CVqAgSMb+6EICz1s0L4H8lw7vVbHoAT
	Y7Ezi33kcjQotKKv0FQ5ZBTJSbYDMAr8pX3n4Ix1bmI84/3gP8/Sn6oHhh6GbMTCYiBKpmYEx1x
	J3xi+B45vZH94VpeUVhFB6tKnv54ps3EgtYg8vZJTkzg+ZX9zMr7EwlTuIhI=
X-Gm-Gg: ASbGnctd2eWlrzjYJzvzZx+RI1vrpG1K8NTWKpt2lvr4NlsTgMwuA+OyPpzycXEWHLn
	ZU8RFBVPrqudl6rqHu9mj6YYoLiPmAcO04iqC6FDJBdI21pARHQzD2FdjRvoI00TPMM1aV/A0fu
	kY0WXnHd8UrUsIsv/jiXgYmexA9UWsY17FTzhP+Ea0aWf8uJQ+aMte5S3KLV22yNzJGPD91qlQL
	4OXyW/+0x3eam2ZJzQcxOQgKYLr+ALOU+V8xOsmRKO5Y7O4mDussrCka8NwHXLp0z1pv3wyB/dK
	t7G3Xg==
X-Received: by 2002:a17:902:ce01:b0:215:3a42:dc17 with SMTP id d9443c01a7336-21dd7c4c298mr26327465ad.7.1738123680330;
        Tue, 28 Jan 2025 20:08:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHQIoq8D2QaYFpzEq5kL3xdCHIiITAzdgGLjBLAtD4+BnGQNR/G88wzSm8jyqJiShrpZVo+NA==
X-Received: by 2002:a17:902:ce01:b0:215:3a42:dc17 with SMTP id d9443c01a7336-21dd7c4c298mr26327115ad.7.1738123680051;
        Tue, 28 Jan 2025 20:08:00 -0800 (PST)
Received: from [192.168.68.55] ([180.233.125.64])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21da41415e9sm90098135ad.116.2025.01.28.20.07.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jan 2025 20:07:59 -0800 (PST)
Message-ID: <a580d287-2fb0-4e9d-adbb-57e4dbf25765@redhat.com>
Date: Wed, 29 Jan 2025 14:07:51 +1000
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 10/43] arm64: kvm: Allow passing machine type in KVM
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
 <alpergun@google.com>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>
References: <20241212155610.76522-1-steven.price@arm.com>
 <20241212155610.76522-11-steven.price@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20241212155610.76522-11-steven.price@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: kPXrdZ2u0qGk9N29iJKaWZInz1vgmvxymedR5qjTkeg_1738123680
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/13/24 1:55 AM, Steven Price wrote:
> Previously machine type was used purely for specifying the physical
> address size of the guest. Reserve the higher bits to specify an ARM
> specific machine type and declare a new type 'KVM_VM_TYPE_ARM_REALM'
> used to create a realm guest.
> 
> Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
>   arch/arm64/kvm/arm.c     | 17 +++++++++++++++++
>   arch/arm64/kvm/mmu.c     |  3 ---
>   include/uapi/linux/kvm.h | 19 +++++++++++++++----
>   3 files changed, 32 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> index c505ec61180a..73016e1e0067 100644
> --- a/arch/arm64/kvm/arm.c
> +++ b/arch/arm64/kvm/arm.c
> @@ -207,6 +207,23 @@ int kvm_arch_init_vm(struct kvm *kvm, unsigned long type)
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
> +		kvm->arch.is_realm = true;
> +		if (!kvm_is_realm(kvm)) {
> +			/* Realm support unavailable */
> +			return -EINVAL;
> +		}
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
>   	kvm_init_nested(kvm);
>   
>   	ret = kvm_share_hyp(kvm, kvm + 1);

Corresponding to comments for PATCH[6], the block of the code can be modified
to avoid using kvm_is_realm() here. In this way, kvm_is_realm() can be simplifed
as I commented for PATCH[6].

	case KVM_VM_TYPE_ARM_REALM:
		if (static_branch_unlikely(&kvm_rme_is_available))
			return -EPERM;	/* -EPERM may be more suitable than -EINVAL */

		kvm->arch.is_realm = true;
		break;

Thanks,
Gavin

