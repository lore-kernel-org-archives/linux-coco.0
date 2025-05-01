Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C286B267AEC
	for <linux-coco@lists.linux.dev>; Thu,  1 May 2025 23:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746142257; cv=none; b=UJsjhDve+POUQnwb3bd75w2k6ma2ERPKsAmV3JE6f4K6undt/ok2uzQP3iL7Gyaxe1DLq9JK3JePGVqsTFytar/zuPvL+xuGvjz35XVJSPY/6penCzHfq/qITBOlc0MZNffIFV54hj0bDEJHAeBxpV2PBvoBCya2nsrOGP4Kja0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746142257; c=relaxed/simple;
	bh=xVGEn53VMIadoPNtpTXYP9w2q/1FWFt4j5ySM3+Il+k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p/40ihSnYgZR5zFzEbgv8Pn7DkrRrjeyU9RuzM6j5MH4mwZR7SGZc9BCCFWu1Gh0DlGAsin1ophDjm7YhlQD9ogXuhOKhgAdCb7TTdymwULeyH4kICqBU3JvmX9iP1/lQ+ciEaqNqluA7OFhD6tEYJ4CQ3Ih51NWt2sf2+aDS6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CUNTGs3r; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CUNTGs3r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746142254;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=V61xkxPc38oYjgZEUT4lB2Jdszj4oz3OEIRZu6N5HPs=;
	b=CUNTGs3r4VrwR//lImqk2Lgrr+aIoFJduIe8NWCd2Ml1yplw519Ubqu+2Y8Y632c84BsGJ
	ZvK+p3nxNh4f4/sHpOMfjjk5SA2PwVMqILkChy+O83t2IUL3Lr+JRW7xIYyk7e5WtZKmtH
	B70O31qY+YMSdzCdB8t1q8qtmVUvLbE=
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-517-e9zkngTGO-SzB-WklIYljg-1; Thu, 01 May 2025 19:30:53 -0400
X-MC-Unique: e9zkngTGO-SzB-WklIYljg-1
X-Mimecast-MFC-AGG-ID: e9zkngTGO-SzB-WklIYljg_1746142252
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-af2f03fcc95so1455455a12.1
        for <linux-coco@lists.linux.dev>; Thu, 01 May 2025 16:30:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746142252; x=1746747052;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V61xkxPc38oYjgZEUT4lB2Jdszj4oz3OEIRZu6N5HPs=;
        b=Pc2WfTQE5beIiGwhgpXisjwamVjNYnqQTT8Ky5cmHledFLiLO7hsTFVt0nt20xSLeE
         NnX/b6DtBf2UaD4AIvJGUyWzl3iE6FtEJkTYVooZG+mhtFwXFW5HYCGTK9S8VA/Lsl1B
         DzGIPLeerVvlKv6OhuXSQ0eOtcaBoG9bR2cZSP0ExREdJY1wTTQRJmBkuiuy8bZ1Rn3w
         cHzbYh6Oh6NqN+q2RFmqoIuNlYMX2r/08xE4MO/jCDkDeqCZ6ChCZdTV5Ro+q/Ac5LQJ
         OUE6+kWlR3T4PXcPHdqXfsC+yq1nCz5qyIWvKoZxsL1ulFN7DEUFMmoGCtkIJHA8Fwdh
         OQTQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZR8trzomKexTjLz6VB7q9bQFl9ON58L4nveWgaCw/DPrJXRekZxYE3iyXJaV1eRO+sDD8DyCKTs0l@lists.linux.dev
X-Gm-Message-State: AOJu0YwMkrS4lD59Hdk1L9U7kYX90IUEeyuNffwCmkXdmiV6Al+BQOUh
	JUZfh+tE0RKs0uWV7Q/oQnuq+C5w61N+CIBBSV3Rl2AqcFseetuQTB5OTJK8cwq7tpj+SZJsrZU
	Uvxwo11GR0N/liGbk09SvMBe7v0hbQXFzXRARn6yvzeQbm1XKd2c1nzRjv68=
X-Gm-Gg: ASbGncvIwJ7eXtE+BuGC464bHx1mcoW9Hz8Np4aPaz6lZvZV4AEtKcwNE9N5V5b5K2Z
	Y6DTVh7+2mVOqc8iadu85S3NnYk0825p4NW+85TbgmOzL1uEI50wU4Nd1moA75jwbzdZ40iuKJk
	7hxsR4O2XQg7yNff0jpwOZ1mG6A30cZhHgRcgVe8t11k/xrXxwv8c5YG3F+Ae/NukVTTe2EWe9A
	D1PU4ETx1QOY3mOl/JcrbMkVEivHtRdk+vR8W2DES435XEbcSogsv0gaH1+NyV4QGBCCCid32AG
	aUO9d7mZo+QC
X-Received: by 2002:a05:6a20:394d:b0:1f3:2c55:8d8a with SMTP id adf61e73a8af0-20cde952da6mr1047595637.12.1746142252569;
        Thu, 01 May 2025 16:30:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF2dZAV7HsuZ8oKI3zYsiz7ja1Xpp36L3rGRrA0ckr87PI6dc2juV/UWU2b7kcpP5iRZnp7dw==
X-Received: by 2002:a05:6a20:394d:b0:1f3:2c55:8d8a with SMTP id adf61e73a8af0-20cde952da6mr1047551637.12.1746142252156;
        Thu, 01 May 2025 16:30:52 -0700 (PDT)
Received: from [192.168.68.51] ([180.233.125.65])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b1fa82422e0sm228551a12.13.2025.05.01.16.30.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 May 2025 16:30:51 -0700 (PDT)
Message-ID: <6799bc5f-cc4a-446e-b47b-1cbabbc0b518@redhat.com>
Date: Fri, 2 May 2025 09:30:42 +1000
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 39/43] arm64: RME: Provide register list for
 unfinalized RME RECs
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
References: <20250416134208.383984-1-steven.price@arm.com>
 <20250416134208.383984-40-steven.price@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20250416134208.383984-40-steven.price@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Et20sm0Hdshc28BPX67XiTcb4FxHjJ_ayqwTzvq9SXg_1746142252
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/16/25 11:42 PM, Steven Price wrote:
> From: Jean-Philippe Brucker <jean-philippe@linaro.org>
> 
> KVM_GET_REG_LIST should not be called before SVE is finalized. The ioctl
> handler currently returns -EPERM in this case. But because it uses
> kvm_arm_vcpu_is_finalized(), it now also rejects the call for
> unfinalized REC even though finalizing the REC can only be done late,
> after Realm descriptor creation.
> 
> Move the check to copy_sve_reg_indices(). One adverse side effect of
> this change is that a KVM_GET_REG_LIST call that only probes for the
> array size will now succeed even if SVE is not finalized, but that seems
> harmless since the following KVM_GET_REG_LIST with the full array will
> fail.
> 
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
>   arch/arm64/kvm/arm.c   | 4 ----
>   arch/arm64/kvm/guest.c | 9 +++------
>   2 files changed, 3 insertions(+), 10 deletions(-)
> 

With below comment addressed.

Reviewed-by: Gavin Shan <gshan@redhat.com>

> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> index 4780e3af1bb9..eaa60ba6d97b 100644
> --- a/arch/arm64/kvm/arm.c
> +++ b/arch/arm64/kvm/arm.c
> @@ -1832,10 +1832,6 @@ long kvm_arch_vcpu_ioctl(struct file *filp,
>   		if (unlikely(!kvm_vcpu_initialized(vcpu)))
>   			break;
>   
> -		r = -EPERM;
> -		if (!kvm_arm_vcpu_is_finalized(vcpu))
> -			break;
> -
>   		r = -EFAULT;
>   		if (copy_from_user(&reg_list, user_list, sizeof(reg_list)))
>   			break;
> diff --git a/arch/arm64/kvm/guest.c b/arch/arm64/kvm/guest.c
> index dd379aba31bb..1288920fc73d 100644
> --- a/arch/arm64/kvm/guest.c
> +++ b/arch/arm64/kvm/guest.c
> @@ -671,12 +671,9 @@ static unsigned long num_sve_regs(const struct kvm_vcpu *vcpu)
>   {
>   	const unsigned int slices = vcpu_sve_slices(vcpu);
>   
> -	if (!vcpu_has_sve(vcpu))
> +	if (!vcpu_has_sve(vcpu) || !kvm_arm_vcpu_sve_finalized(vcpu))
>   		return 0;
>   
> -	/* Policed by KVM_GET_REG_LIST: */
> -	WARN_ON(!kvm_arm_vcpu_sve_finalized(vcpu));
> -
>   	return slices * (SVE_NUM_PREGS + SVE_NUM_ZREGS + 1 /* FFR */)
>   		+ 1; /* KVM_REG_ARM64_SVE_VLS */
>   }

KVM_REG_ARM64_SVE_VLS is exposed even SVE isn't finalized. See set_sve_vls() where
it's required that SVE isn't finalized, or -EPERM is returned. So this would be
something like below:

	if (!vcpu_has_sve(vcpu))
		return 0;

	if (!kvm_arm_vcpu_sve_finalized(vcpu))
		return 1;	/* KVM_REG_ARM64_SVE_VLS */

	return slices * (SVE_NUM_PREGS + SVE_NUM_ZREGS + 1 /* FFR */)
		+ 1; /* KVM_REG_ARM64_SVE_VLS */

> @@ -692,8 +689,8 @@ static int copy_sve_reg_indices(const struct kvm_vcpu *vcpu,
>   	if (!vcpu_has_sve(vcpu))
>   		return 0;
>   
> -	/* Policed by KVM_GET_REG_LIST: */
> -	WARN_ON(!kvm_arm_vcpu_sve_finalized(vcpu));
> +	if (!kvm_arm_vcpu_sve_finalized(vcpu))
> +		return -EPERM;
>   
>   	/*
>   	 * Enumerate this first, so that userspace can save/restore in

Since KVM_REG_ARM64_SVE_VLS can be exposed before the vCPU is finalized, it'd better to
move the check after the followup block where KVM_REG_ARM64_SVE_VLS index is copied
to user space.

	/*
          * Enumerate this first, so that userspace can save/restore in
          * the order reported by KVM_GET_REG_LIST:
          */
         reg = KVM_REG_ARM64_SVE_VLS;
         if (put_user(reg, uindices++))
                 return -EFAULT;
         ++num_regs;

	if (!kvm_arm_vcpu_sve_finalized(vcpu))
		return num_regs;

Thanks,
Gavin
	

