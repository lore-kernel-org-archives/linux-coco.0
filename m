Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8B1C1F4622
	for <linux-coco@lists.linux.dev>; Tue,  4 Mar 2025 05:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741065359; cv=none; b=OzJqdfM/xIKRDCTcpudRCtCBXAKO3qYQKNkPERg5g6z/p5P8a5a39KnqRN+x/ihaQNyK/YnP+SCiYGct9Gcb9oJ77SEtLVTT671EniyFWsnIc7ftTUIftWR62VN/z9bkX/YivAem/r/C5X6kiO9EN/GFhVWdoHuLZBn/fNf5fOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741065359; c=relaxed/simple;
	bh=I70BjEXqWMzdLTvepT7oYU6oxEIcfIfhUlrieGGjjJk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PdlBjJa2krSlpevoegMMC5PAUZ+O/GMWrVWvpAkRuVoX37QQ5/MXXHsXVL5PCxDZ3+WF/5PvksgcQqsULT/VUM06/0/utDxrmj0dg8CQnSGnE5FBKsSaztLr3cKLpPc2RLywYalKo+x5EbqRBK4ZmxOoSenzE88f/cEboFuOEMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IkgD6eOX; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IkgD6eOX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741065356;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iHp7c8083IblnSkSElkO4q8Pyi74C3j+q7Rd++XFOzQ=;
	b=IkgD6eOXzM1xiRqPrcfR3Y4JBEr8pqoFcbNIWaEs2gJi/tC/mEOUXc5O9NzwDoEKJQ3T/F
	FyuvdCdRcXvWSPIAKrqRNsZOLT9cHSo14W639FZM3EWb8ZBb9J6vEHKZtprRpfkv7EsrAw
	2C50wul1zT0ZFfbvs2cytVI73kG9ssA=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-49-olQL1sWAOpCXtYocTQxHxw-1; Tue, 04 Mar 2025 00:15:40 -0500
X-MC-Unique: olQL1sWAOpCXtYocTQxHxw-1
X-Mimecast-MFC-AGG-ID: olQL1sWAOpCXtYocTQxHxw_1741065340
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-22350e4b7baso91810855ad.3
        for <linux-coco@lists.linux.dev>; Mon, 03 Mar 2025 21:15:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741065339; x=1741670139;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iHp7c8083IblnSkSElkO4q8Pyi74C3j+q7Rd++XFOzQ=;
        b=wkaJCwxEuN3kCWIcNxvSHNwCQWgzEH3j5Bv/zAwmX+0zcMP8yuOhlMMbKpukjrIADD
         yW+37adnkFvtgTuQSv5GCvhFyU4dWVcBCGEPBB8gnEE25HKW1syvNbNYKEbYd9LN6t3U
         H1qySZ/WdBv6ReGYG+KLtd2WRRzIrkzTZViXyc6npKC5hXdQtlGjhxykIlx82vijwheD
         13E444Cll2Jpv/LEda8gEBaGiyQXwBcxZz8ox3mbj/weMFlZw89BTo9GSxLpBcIBwFoA
         6m2yX7ygYsVhnyBtpDu6ZQuXPsereHTrQ4FMjF8Cm03OHfzKS1mZDpmFSaNklw90uSmq
         /vfQ==
X-Forwarded-Encrypted: i=1; AJvYcCU+ldK9bf7NMqJtLfWbw4kpG4bRoK8C+wIvayCmSVBFsqHKQTOPaDloAOsy3G6HbOo6qSsGblK3gkyP@lists.linux.dev
X-Gm-Message-State: AOJu0YwJgkmANIp++f552LaI8+hkG/47RMgXtiU5g/QsBBPR9eimS4St
	+5qPtU7fGBuuGfwGsiOp4k0rJ0ZefdC8wSKaKJU7s5UmHyrO2CDsscGbcwQPBdvlRvlm5iOjM+i
	kA4Wbs0fHZhT3EnvJnVQ/ZbHTBR2XL/bWZwshj1JuJ8ZZdviKw2O7fWTHafs=
X-Gm-Gg: ASbGncsc0KjKXzzYpGovLsHeAiOKIaoocO/3boNqXfNvy5j8qwHW4keYKyO2dVrB0Zi
	hn+ri13pbWU7P+9fpijbGQobmjpXLSB4uyvLd8yozTh+KJfjtNNi2FKKpwGq1vZFAAjEsSLztGs
	DaH5LDmitMUTGGC53eHRzZoeMi15d/XtUxdl+FIYe2XtZtI/hpsLHIa7j7lPy9KKH6+3LKzkpdo
	Wdpx09ld4vvCTGkeADb4k4XNYbH+2Rlat27Ast0hvvQVlUUqXei6PgO2098IgYLtaM9XStNu6+/
	3kjdkkj9d/O0n5JiGg==
X-Received: by 2002:a17:903:244d:b0:215:9470:7e82 with SMTP id d9443c01a7336-22368f71b7amr213249465ad.4.1741065339575;
        Mon, 03 Mar 2025 21:15:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHwYeNz4BZ5M1mONF0+zOWTYRV5h3Fu8fVqk+GofZ0hdvm3v9bSMtAm5K07jzNGKbCercWDMg==
X-Received: by 2002:a17:903:244d:b0:215:9470:7e82 with SMTP id d9443c01a7336-22368f71b7amr213249125ad.4.1741065339283;
        Mon, 03 Mar 2025 21:15:39 -0800 (PST)
Received: from [192.168.68.55] ([180.233.125.164])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fe825a99a7sm13451855a91.6.2025.03.03.21.15.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Mar 2025 21:15:38 -0800 (PST)
Message-ID: <eb8ea5a0-fe6c-4b96-92da-f9ec0355b4dd@redhat.com>
Date: Tue, 4 Mar 2025 15:15:31 +1000
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 22/45] KVM: arm64: Handle realm VCPU load
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
References: <20250213161426.102987-1-steven.price@arm.com>
 <20250213161426.102987-23-steven.price@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20250213161426.102987-23-steven.price@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 7UhQhUCD2G1sVMAGcjCAI5TDz2VxUE6tG5eXfdbUEbs_1741065340
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/14/25 2:14 AM, Steven Price wrote:
> When loading a realm VCPU much of the work is handled by the RMM so only
> some of the actions are required. Rearrange kvm_arch_vcpu_load()
> slightly so we can bail out early for a realm guest.
> 
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
>   arch/arm64/kvm/arm.c | 12 ++++++++----
>   1 file changed, 8 insertions(+), 4 deletions(-)
> 

One nitpick below:

Reviewed-by: Gavin Shan <gshan@redhat.com>

> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> index 49ad633c5ca5..3e13e3d87ed9 100644
> --- a/arch/arm64/kvm/arm.c
> +++ b/arch/arm64/kvm/arm.c
> @@ -633,10 +633,6 @@ void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
>   	kvm_vgic_load(vcpu);
>   	kvm_timer_vcpu_load(vcpu);
>   	kvm_vcpu_load_debug(vcpu);
> -	if (has_vhe())
> -		kvm_vcpu_load_vhe(vcpu);
> -	kvm_arch_vcpu_load_fp(vcpu);
> -	kvm_vcpu_pmu_restore_guest(vcpu);
>   	if (kvm_arm_is_pvtime_enabled(&vcpu->arch))
>   		kvm_make_request(KVM_REQ_RECORD_STEAL, vcpu);
>   
> @@ -659,6 +655,14 @@ void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
>   		kvm_call_hyp(__vgic_v3_restore_vmcr_aprs,
>   			     &vcpu->arch.vgic_cpu.vgic_v3);
>   	}

A spare line is needed here.

> +	/* No additional state needs to be loaded on Realmed VMs */
> +	if (vcpu_is_rec(vcpu))
> +		return;
> +
> +	if (has_vhe())
> +		kvm_vcpu_load_vhe(vcpu);
> +	kvm_arch_vcpu_load_fp(vcpu);
> +	kvm_vcpu_pmu_restore_guest(vcpu);
>   
>   	if (!cpumask_test_cpu(cpu, vcpu->kvm->arch.supported_cpus))
>   		vcpu_set_on_unsupported_cpu(vcpu);

Thanks,
Gavin

