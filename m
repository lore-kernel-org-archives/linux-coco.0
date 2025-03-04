Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 037711F4735
	for <linux-coco@lists.linux.dev>; Tue,  4 Mar 2025 05:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741066958; cv=none; b=JabwZ/eUkaS7xu/rNvF0nCdAvUGct0/Q/8q1wouoqLKf8fbiZ8vrkxMChl6HdUs11Rj2bojZOkurgU70VWb7RuVJmy20qIVneuu0eMl/KqYwrn8Bo1UAjnz8NFKIwJ2x9Sslf90MdjS0MQ6HK6OryK1Ildz+Rx6TUoDV8N/F0rI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741066958; c=relaxed/simple;
	bh=NDiYP2H5hYhH1uYD5YWszI9pFiidjNwL9HaA1erSaWE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oi4FUevUbH4VowSKsok0tphGO4dhMKl2WquG/WgTTsDY0nZvTGX1/2p67t8vXIiy6jC0aX91S6PDJBpZm04vsW2xJMZZgD3Q5SWBxiSwrTZc3bJcVByYJsJbPt3I+hw7gnl5JAH0Du2Zkr45ehbEk6zhFYtRjcWgweWzMZ6U1Ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Fmaoh8uD; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Fmaoh8uD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741066956;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hbTXak4fZZgmEd0OOFQqdTCiZzdYnXYZunDKpr8m1kE=;
	b=Fmaoh8uDSjMGqB6qqNYJYsVpdtPzgXJkgoe/748wil3Cfzb6qdvYBQLal24YpzdmIbCiu6
	qfz3RwZIsVKs1bdxWG+oChZ0bcL36dxMroi8JCzZC7qAjPMeYZ/uMRKeqgEeN4hCuDR46+
	n2RLY7n1tp/PTv7GeyY4YDJu8yF13cY=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-277-YrwknbgoMHet-9xI-p5Zjg-1; Tue, 04 Mar 2025 00:42:20 -0500
X-MC-Unique: YrwknbgoMHet-9xI-p5Zjg-1
X-Mimecast-MFC-AGG-ID: YrwknbgoMHet-9xI-p5Zjg_1741066939
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-2fe916ba298so10129093a91.1
        for <linux-coco@lists.linux.dev>; Mon, 03 Mar 2025 21:42:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741066939; x=1741671739;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hbTXak4fZZgmEd0OOFQqdTCiZzdYnXYZunDKpr8m1kE=;
        b=NlQLbd1gEGYES9fSq3TluYVX5ApooWIQHm6r6ja9Zcv7dalXXYegEiQ/PqNztJNkOd
         GIO776x8g02hKh0Q0gw0TQPM1n8/WjSTD9VCFy7vb7/FYQvgCrZh3yrYhfZ1dVDfvkgv
         OPlcae5H/3gHvqN6FZKT6THR+6m9x7ILLKUrmpnakyzuvjI/aE69YZYajxYb6lpxJHwh
         AgGyfuSDiTRoX7q/UWpyklxVGWs/YNGBLGXZjfBLe7FjJU9hpPiRVfUfK2sfYpAR1mI2
         krpo9glQcdt97ZySCcRnkGhdkzGEFwIc7oC4XM6Ix/7IsikvQMWGFRELc4D9OMPpa0ZK
         X3Iw==
X-Forwarded-Encrypted: i=1; AJvYcCU3QnDec9tlPrRtJJHxG8D7dAyBLl6synDXkp4ic64qZtmqcNnFYED2f59ar0/h6c7Y2mAcPIJudw6+@lists.linux.dev
X-Gm-Message-State: AOJu0Ywaicf225+Uh2rs2rhZMYy6ZGatezLAZgDlFuIs8icA0XAv62p1
	iBzyE6e4chOZ1lv0VFxx1m1dLNa18gwPd1ZHg5ZTyJWmCLIbFuYBxmw0m9jGXxRJw0tp0Tip4w1
	PqpaIZWvfZh9e3o1tVDQxL+cFNPuMIQIu/hkXlPxz68Xp9F9PFfPdkTTrdZA=
X-Gm-Gg: ASbGnctGWCptG5eA7sAELP1HT/tuDjmwjQuJuq8neeptaA01P/W5NhBYu2MnDY5QaOC
	OCj2kGEJDu5t8PjuyTA/aBFlb+ja5vfFcXynp7rHrpRz0F+UUyhQl7/agETZBZ1BAAjqbIBoiEc
	93iYTOeag70V7IMSC8UII5uHwDFUp8qFPJ1GA7kgfpapK7PbMyEupYo29YW4N5UPk/HPTW5vyCq
	dKumDxpof+ski/kmNbWDQW3ksvHOl2Oan4M8SwpYN7prmoB3uPi0+zXZLpFqsU+bt5tRvQOM/Be
	2bdgGvIy32ySkqXiqQ==
X-Received: by 2002:a05:6a20:c781:b0:1ee:e8c4:e1b6 with SMTP id adf61e73a8af0-1f2f4e01578mr26530456637.33.1741066939187;
        Mon, 03 Mar 2025 21:42:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHurZweDDClFEM+EDFVGKyToeXZSnslvrdiIY31gYPFZM1mfyMjnp3vImA6Ky+0fKgY2QYszg==
X-Received: by 2002:a05:6a20:c781:b0:1ee:e8c4:e1b6 with SMTP id adf61e73a8af0-1f2f4e01578mr26530433637.33.1741066938923;
        Mon, 03 Mar 2025 21:42:18 -0800 (PST)
Received: from [192.168.68.55] ([180.233.125.164])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af075209ba3sm5804806a12.29.2025.03.03.21.42.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Mar 2025 21:42:18 -0800 (PST)
Message-ID: <ecf15da0-49ff-4cc3-9e4e-5c47f79acc06@redhat.com>
Date: Tue, 4 Mar 2025 15:42:10 +1000
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 26/45] arm64: Don't expose stolen time for realm guests
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
 <20250213161426.102987-27-steven.price@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20250213161426.102987-27-steven.price@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: BrEk3BVco-X5HRVbsBaDrntE2NcmsVcGsESEBCv5Rmk_1741066939
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/14/25 2:14 AM, Steven Price wrote:
> It doesn't make much sense as a realm guest wouldn't want to trust the
> host. It will also need some extra work to ensure that KVM will only
> attempt to write into a shared memory region. So for now just disable
> it.
> 
> Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
>   arch/arm64/kvm/arm.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 

With Documentation/virt/kvm/api.rst updated:

Reviewed-by: Gavin Shan <gshan@redhat.com>

> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> index a6718dec00c9..79d541c95bfb 100644
> --- a/arch/arm64/kvm/arm.c
> +++ b/arch/arm64/kvm/arm.c
> @@ -403,7 +403,10 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
>   		r = system_supports_mte();
>   		break;
>   	case KVM_CAP_STEAL_TIME:
> -		r = kvm_arm_pvtime_supported();
> +		if (kvm_is_realm(kvm))
> +			r = 0;
> +		else
> +			r = kvm_arm_pvtime_supported();
>   		break;
>   	case KVM_CAP_ARM_EL1_32BIT:
>   		r = cpus_have_final_cap(ARM64_HAS_32BIT_EL1);

