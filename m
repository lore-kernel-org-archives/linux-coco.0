Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59AE05234
	for <linux-coco@lists.linux.dev>; Sun,  2 Feb 2025 02:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738462564; cv=none; b=o1O2PoDukOnfGKvzMo2tkgrOpmPjVM7g/A2LBpBh61l6U10sXQxDEjuLlxQTbHzkiKJeeHzjmw/I7hN9BPdCJK+R23MTmgdg00ZlLnjgrqxsr000m1GnQMC13eZmxhDfviwEjULBC0RdAl2HwmplcBO7FCi/EXyKjgwbfW9urYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738462564; c=relaxed/simple;
	bh=YpG5rQ2KFsWWjOCvMTMldtm0ojXwxSh6Ny+S3WE3jww=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Re9xNXteGCA++vjauNBM9kRiV/wYlPD1e7Y8xwKi++VrNujjMvr90wwnPMb2Lv/llgG/W5uh2LWfr5hBq/9VGc6wgMAVDdZrGUdViHDTVOhzi37E6FeY0li5uvaOnvyhBPnD2nOsqX0CxO4JpIOe5d1hH7r14M1jBSDuJ/VXSIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=H+Zya/uz; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="H+Zya/uz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738462562;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oaPgjrYHflaoqP5DxCw0DAPnLuPRTINmmGCdI1hjL0g=;
	b=H+Zya/uzs2s8lq440k5zOvKoWbQc08gHuhl4PyvRPEOxvTBzK/0E0J2s02LOepONmXD93P
	JMVGNZFH8d5FdhtVF7aTHMUHBCIBOj58opv9eTLvlsjeG0mJb4tHXwQAM9wF3nqdROW4DS
	Zbt/OQ3DZh0Itn9g7kNjRlXcapxVjls=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-248-Q1QKPRbJN0eiuk6GGLQ4LQ-1; Sat, 01 Feb 2025 21:16:01 -0500
X-MC-Unique: Q1QKPRbJN0eiuk6GGLQ4LQ-1
X-Mimecast-MFC-AGG-ID: Q1QKPRbJN0eiuk6GGLQ4LQ
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-216266cc0acso72979425ad.0
        for <linux-coco@lists.linux.dev>; Sat, 01 Feb 2025 18:16:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738462560; x=1739067360;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oaPgjrYHflaoqP5DxCw0DAPnLuPRTINmmGCdI1hjL0g=;
        b=jECp9xiJbc7gF/B7rmfL6I2ePlYRX4MGcHWivyBMhJd2XXQFt74JdvxoG/ZKAeMAUf
         ay6eg+dtqddFGu8WJE49r5ESeZe9f9/az5iQvvtmeqHKVWJ23vgWEc+YLU9iAze7t+qL
         nBbNUr6IBsIBhascNtrfM+g7Jc7bEVnqyC+1tCZ4N/taszMYNpgMTYwwJmMzDjtNjJqo
         Cca9X2qPyO+bYQc11wzpdYvP/y6j/EdKc0nj7qpaamKqaHRHJnOPMeSfgXki0dvO7wtJ
         y6M9EWdHll+fmEgImhicMdhNr5Sw1DRAqyPh02QxlwwE0QhZgpR0yEFR/fcnaSFnjKpM
         yA5A==
X-Forwarded-Encrypted: i=1; AJvYcCW89hQFVF9BdJWvSG7K0Fm47aEu0JRiFL5cF5GpQk91x1eJbE5yJwjuQV625Kxf/KcUAbNeqsK/gvX3@lists.linux.dev
X-Gm-Message-State: AOJu0YyzMXbbxnbDkk57OhJ/5aYv9dXIC/xhXyjT4uy72TBdpy5E2FMY
	YRyFxbvEUnZJNCuF3Y6rFKnLoOsuWoyYijn2zVyTXcMnrupRemQwiZgyckmfdiWFfydg9MXqHkV
	nRQInfqJCVLgtswNp0As7vKvqhDXl0z4xQb8fkT+3gKM1ExO8+mTHVrU0Q1O6E72jYKE=
X-Gm-Gg: ASbGncti1X32eF5h4pFlHSzbztBbNlRTIznuf1iqWDvRe7Ca39d99GGAxEsopo5hp2o
	rZIW1zA3BwB5Ulmdj1yNdu7sMHwZCbAy0l6q360rmY8iKSQTucxxTzE4mJakK9vhgMoa1fPaWCh
	fDH+jU8hQFemCWTxQ7mIgT/3KDLFJRcBRkrvO/q5W8nill3Di2mc3yxlpEfv6DDxwDqn1x5AmYU
	yZibQhx8elUlTYw4fkqWh/K2tT7KkVUzQLrixKiYJqs7ndqaQ8hGJRTx/KshRH4FC8SmDkWM0Rw
	oV5kZg==
X-Received: by 2002:aa7:8c43:0:b0:72f:f86d:c543 with SMTP id d2e1a72fcca58-72ff86dc5cfmr9769146b3a.9.1738462559687;
        Sat, 01 Feb 2025 18:15:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGwN4JpbwAKVJUbVg+/34hGwQp5HKYXpKcr/Eo2PO+gIzPd+r9+tV930pBIODwVO11f1VYIuw==
X-Received: by 2002:aa7:8c43:0:b0:72f:f86d:c543 with SMTP id d2e1a72fcca58-72ff86dc5cfmr9769126b3a.9.1738462559318;
        Sat, 01 Feb 2025 18:15:59 -0800 (PST)
Received: from [192.168.68.55] ([180.233.125.64])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72fe69ba47esm5834225b3a.96.2025.02.01.18.15.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 Feb 2025 18:15:58 -0800 (PST)
Message-ID: <ae13e762-bd0d-4525-8919-f6b1bcfc8fee@redhat.com>
Date: Sun, 2 Feb 2025 12:15:51 +1000
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 25/43] arm64: Don't expose stolen time for realm guests
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
 <20241212155610.76522-26-steven.price@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20241212155610.76522-26-steven.price@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: zzmW9sS8Def1qAYFvkm4xZbjbqrS-tXErdVeA4WKD7s_1738462560
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/13/24 1:55 AM, Steven Price wrote:
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
> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> index eff1a4ec892b..134acb4ee26f 100644
> --- a/arch/arm64/kvm/arm.c
> +++ b/arch/arm64/kvm/arm.c
> @@ -432,7 +432,10 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
>   		r = system_supports_mte();
>   		break;
>   	case KVM_CAP_STEAL_TIME:
> -		r = kvm_arm_pvtime_supported();
> +		if (kvm_is_realm(kvm))
> +			r = 0;
> +		else
> +			r = kvm_arm_pvtime_supported();
>   		break;

kvm_vm_ioctl_check_extension() can be called on the file descriptor of "/dev/kvm".
'kvm' is NULL and kvm_is_realm() returns false, which is the missed corner case.

>   	case KVM_CAP_ARM_EL1_32BIT:
>   		r = cpus_have_final_cap(ARM64_HAS_32BIT_EL1);

Thanks,
Gavin

