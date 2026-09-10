Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A00C1FF7C7
	for <linux-coco@lists.linux.dev>; Thu, 10 Sep 2026 05:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789019599; cv=none; b=mnpTEzL5RURmqF8EuYS9aGETqrSqHqc+R9wX4Y1G48IaQBrFsqZ4VpGbEV6Edqq/lPNdfMRAQIyTtzlLIhmciHY4V0vYSZvNaiproqwPFRBqomqXy1vqoSJuh50uBeHsrzwyh9ywNqV2cwNTj+0gxYsZaVSKIrOA5Iz4wCI4gwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789019599; c=relaxed/simple;
	bh=H0YWLVNt1VspJyW++/mL2xiGGQ1f0zXMz1fyGHmQyZM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UOrYexGSgT3CR6O9I3m4WbZwMTsaQnU+NihUkEmd9yFf0Vd2pFOij2jYbdoh27+hyjtHgBFw6cLKYeJuUdoef1jTxEnEXLJ0YE8Sygpo+eILElWeSWEv3AtF9jn5XsB8Ow6mylKRAgwuBEvTX8TyovbSOEvknyH7SeaY/iEqNJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YL6xqdsf; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YL6xqdsf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789019596;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aMvkKeYrjNymKP3nzuev6PMvw+A1W0w+cadnXyWgZ8s=;
	b=YL6xqdsfu3wSii8TSKIcYYLnf7o/aCHfaKwYd66rfmHv1SbtqK4z8NNOWJIzJq9YXmWBrW
	788biDknj/LrErgK1ysDLOR2JnnsGNmsbn7QyR0rN+/kvO0h5Ag7Xq6Ge3DfFkM33XuUQ2
	0JPU1/3s4gjDofFxz0ZY2b/fSKJVSlk=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-464-z9M_rzMwNiOYERAEBEK6NA-1; Thu, 10 Sep 2026 01:53:15 -0400
X-MC-Unique: z9M_rzMwNiOYERAEBEK6NA-1
X-Mimecast-MFC-AGG-ID: z9M_rzMwNiOYERAEBEK6NA_1789019594
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2db3734d06dso101204985ad.0
        for <linux-coco@lists.linux.dev>; Wed, 09 Sep 2026 22:53:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789019594; x=1789624394;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aMvkKeYrjNymKP3nzuev6PMvw+A1W0w+cadnXyWgZ8s=;
        b=L8TF6lcafbpH/gbZquTtaV1YmM2+lQXbH24plPQOu1OtlaKWHHfWzroGJWAgknDn8B
         ThmcgG11CQU6zjaFSthYSkPWbpwy3uzws/cjn2GBlrW3J3iLpEnjwemh+YVsV/MxTVvZ
         K/LKa8AgJrJqgz8BKx0TzMFHlWTPLASDKgS6aiBen3j7nzljeqwZkX3V52SfaMuLUrIs
         hp8Z40OvNVQjEeOWlRrSeIZQwLH1yzwaDE65jWxYemZ79bzK+FezW1TgzvUq86ZPSU1D
         1pSyMNxTblGzkNsM5mc8TA35PVWlze9LOMWc4FxX9sIPb0DVUtlLU0UlxoYjD3m/wZRy
         1w5A==
X-Forwarded-Encrypted: i=1; AKwUvBwJJxF2jP70RP511OD2xEI6LAT6sEwm0eu6DjevLF7+u6lJsRhriwbGsfhrWnEKh+sh4epD57bBPg9a@lists.linux.dev
X-Gm-Message-State: AFuF++kTJrMRtA92q6NN/E8Y/H18Xy0ewVNC+Wy8x4kA8CKJY03Oe7S8
	/c7WvQNEs+SNVXEpCK80RRMIpQNUjpTadQW/xQ4Oi03+8FfnmGfOXrYhu4gX4zYrCfHjZoY3wuG
	zd0jUAOyvPn3R0A8DK9CbwSU80wZzmJ3hdTMcMHbacCAfy9KB6A3UHuE+FAv2qjg=
X-Gm-Gg: AYBFou2Muhqqasm0pXJFDif4YQiMfJ2iz+tBgHWxlJ9ojlJhouzksJBDQA16m6IIH7i
	G7nVOrOGGImc+1yqxfdaRvLiQmgEqQrmwiR2arRJV06mtzGpGtJONY6A+P6usmknW92VJ0ldSLq
	54CHPpio+faKJqIeBioX86/0CA5yAa3Fg51HgS26TEteXMlZQEZr4/T3Sa6O817G+jAgMr5jzeS
	1WWugjmGmkIA9kkK31ILTkxqnwAEr2k48+/UgR7aQ6lyrKe11cD616gt5yPz76mWolPW3qhY/JP
	n60oo8bfgbvYV6OBAqhFxKhXbeN4qKD+uSrxb6faxr/uT3e+6PZSZDI+qrzcnjdBTWWDt+rYY1f
	c/aVu4hy3SDU8iZGEmOnsIG2mH850FICruspQ7LVLTw==
X-Received: by 2002:a17:90b:5905:b0:398:9bd5:490b with SMTP id 98e67ed59e1d1-39b262133ccmr56583387a91.18.1789019593821;
        Wed, 09 Sep 2026 22:53:13 -0700 (PDT)
X-Received: by 2002:a17:90b:5905:b0:398:9bd5:490b with SMTP id 98e67ed59e1d1-39b262133ccmr56583277a91.18.1789019593097;
        Wed, 09 Sep 2026 22:53:13 -0700 (PDT)
Received: from [192.168.68.52] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39bae615657sm2525614a91.0.2026.09.09.22.53.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 22:53:12 -0700 (PDT)
Message-ID: <e66698e1-e582-4ff8-9881-4ddda5bc1d94@redhat.com>
Date: Thu, 10 Sep 2026 15:53:00 +1000
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v17 06/20] KVM: arm64: CCA: Add a new mode for supporting
 Realm guests
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
 <20260908162223.1683432-7-suzuki.poulose@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260908162223.1683432-7-suzuki.poulose@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: dsliHnoXSGMgjooJhAqJ8PvWuIKmVP7s0rAKxi1x-O8_1789019594
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Suzuki,

On 9/9/26 2:22 AM, Suzuki K Poulose wrote:
> Add an explicit mode to support Arm CCA guests.
> 
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> ---
>   Documentation/admin-guide/kernel-parameters.txt | 3 +++
>   arch/arm64/include/asm/kvm_host.h               | 1 +
>   arch/arm64/kvm/arm.c                            | 5 +++++
>   3 files changed, 9 insertions(+)
> 
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index 68647ff4bdd24..1afe3df3b923e 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -3256,6 +3256,9 @@ Kernel parameters
>   			nested: VHE-based mode with support for nested
>   				virtualization. Requires at least ARMv8.4
>   				hardware (with FEAT_NV2).
> +			rmm: Support for running confidential guests in Realm
> +			     world using RMM, as defined by Arm Confidential
> +			     Compute Architecture (CCA)
> 

I'm not sure, but 'realm' would be more appropriate name. rmm (Real Management Monitor) is
the term limited to the firmware to me. Besides, we have been using 'realm' broadly in this
series like kvm_vm_is_realm(), kvm_realm_state() and so on.

   
>   			Defaults to VHE/nVHE based on hardware support. Setting
>   			mode to "protected" will disable kexec and hibernation
> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
> index b2e99c5cb1cd3..31ae9d8d8e92f 100644
> --- a/arch/arm64/include/asm/kvm_host.h
> +++ b/arch/arm64/include/asm/kvm_host.h
> @@ -69,6 +69,7 @@ enum kvm_mode {
>   	KVM_MODE_DEFAULT,
>   	KVM_MODE_PROTECTED,
>   	KVM_MODE_NV,
> +	KVM_MODE_RMM,
>   	KVM_MODE_NONE,
>   };
>   #ifdef CONFIG_KVM
> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> index 9af3bbb2f8c24..50f0adfadab38 100644
> --- a/arch/arm64/kvm/arm.c
> +++ b/arch/arm64/kvm/arm.c
> @@ -3264,6 +3264,11 @@ static int __init early_kvm_mode_cfg(char *arg)
>   		return 0;
>   	}
>   
> +	if (strcmp(arg, "rmm") == 0 && !WARN_ON(!is_kernel_in_hyp_mode())) {
> +		kvm_mode = KVM_MODE_RMM;
> +		return 0;
> +	}
> +
>   	return -EINVAL;
>   }
>   early_param("kvm-arm.mode", early_kvm_mode_cfg);

Thanks,
Gavin

