Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 526C0248893
	for <linux-coco@lists.linux.dev>; Tue,  6 Oct 2026 02:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791253533; cv=none; b=d5B/q2DtMm3NIFwNd0036Y/QKXk7qhQCxhtzyI9k/6W84bhNcd6UH1+jBeLGKszIxxQO/2Z8XHUgnZl3a5CJzVlrQfZJ9k7/zt7KJhb9LdRTQkhClwSWP31xHw8i+CSXjhBMgX50UWal5S9iYhrjwti983Fv3zitRYM1aUZ6HUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791253533; c=relaxed/simple;
	bh=QWAFFhzhcemt4JkAXvKSQU+sijmwJ3F9VG6lkevDJYQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A4xy3CAuRGCx6jdiIF9XOVa+zqQmcjEP5YAOJPA57O0MyNx+j8WvOI5Doasl5BWWQ+13ZLaoFimhvR7oxmv/KNtV1UHLUIgwqWoaqWmIO1KwLgeIqipp7nFaUp7wcTqjGbEnVVNJr447GjFuQluP0EHQiihLcZ9BViWy9Z40NMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SFuSqM0k; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SFuSqM0k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791253531;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ugMxefZ1qIEDU/oRAsn8b/LDZMC+9ePrF31NK37FBF8=;
	b=SFuSqM0kMRocs6bRvUTeS3WzPdsf1Gp5DotSQLJkYsDFmxv8HeU3M21S1hHfdkiI9/IOyl
	sfEAgEWf7Xei3ojQG/pMjWUaNC7eR4EF1STdJ1AVYF4xyc2qQbF/jGHw6ZqtLfbQ55SuQq
	VUITBINIeeTA75W6d1yvFkGIwWxcV2A=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-83-9D1UpbXUP_6qbBHH1svOiA-1; Mon, 05 Oct 2026 22:25:30 -0400
X-MC-Unique: 9D1UpbXUP_6qbBHH1svOiA-1
X-Mimecast-MFC-AGG-ID: 9D1UpbXUP_6qbBHH1svOiA_1791253529
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-39de4a68f7cso1982252a91.1
        for <linux-coco@lists.linux.dev>; Mon, 05 Oct 2026 19:25:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791253529; x=1791858329;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ugMxefZ1qIEDU/oRAsn8b/LDZMC+9ePrF31NK37FBF8=;
        b=fAaIZXwBHYYdH+LmpbObRc/aUPVhLVPpOtX2woE5jWasb3K0AD1pvii+mESrez1MYv
         BWfvKuOsO8lXHwrwJdUgbVmBfM6vv2G0gl+YqzMGEC6e1DlymULELSz/ENBzHSv2zjIa
         lKDHmxeZTM1M1PCOz6wvvAQR0S5c70bWyV0bDQVTSJiXm8qWvkVg5lMxb8NRJZWTxSzr
         TET6KPanDEkf1dqLY04fiZRQ43N1ORAeFMHt/DSin8qBvSJVPXfaR/5+2CnD1YkpqeEY
         vaHQHhxej2fLFIEpfmsJBoIQ30kBm/USKjwM4O015k/i6lsRua1jIm4MqvH2YLkBgtYR
         p55w==
X-Forwarded-Encrypted: i=1; AKwUvBynpiwbaSQQCiPDaS4bWoV+OwOq+OOSJy7jO1hY28Xgay1OS4885yNvD+CMbpGjzl9ZpLK2zocRkZeu@lists.linux.dev
X-Gm-Message-State: AFq9FYJumF6rcfzQt1wV9R0wPMrasLENFzPAHIvyC5H7LcwzzE5Tzqy0
	lfUgNJg9VGnNPFA2mZYh6GRDzqAY1zvDKHTsLpPX/z+Hh/2KZZxxdCcKRm+J5vOPy2KipHP7GJA
	LmDHmUywiuSaaCWOSrcX1GHpc/AHYEdI1bwn0/eGkszMTDWv9AHXhvCzET0bQafE=
X-Gm-Gg: AYBFou1O/R7Z3x5uPkU9gSn5wi4x0o0ZvJOY+ouAy3Vt4w+OVK7qunIpxtmbkSfHXDa
	d5+JQC8aelHJlSfqKj9Q4nNKrAajaW56L5WG388XKfBDQHzLn4y29kN2NDg6fbfsMmbdLM/5F52
	CoFmFZJE4QlNj5MiB3GqbCJoCOVNM+mAlpKwqNuc9VIN1Sj9+FkX756uuQIPjI9Idn1/wUf2xvu
	EUD76K278pxkN+xljpviGJG3XAXoA3WxHEaXlsUPHmTTIY43+o+g+Nt7WF5/B2lFpAChxzj3afj
	4y24SwtwozuV1UEu8leY3liJsq/U2XkNkzybllsxTprEtWGoeG/MnsKSrD6N0B3ufyPolfIMffQ
	hjDG9Ofh/irlVIHNPsUxSJPPJ//sCB4J1Qz7jJZwHBQ==
X-Received: by 2002:a17:90b:2812:b0:3a4:cbaf:f152 with SMTP id 98e67ed59e1d1-3a6cec2fb6emr4459088a91.33.1791253529342;
        Mon, 05 Oct 2026 19:25:29 -0700 (PDT)
X-Received: by 2002:a17:90b:2812:b0:3a4:cbaf:f152 with SMTP id 98e67ed59e1d1-3a6cec2fb6emr4459071a91.33.1791253528874;
        Mon, 05 Oct 2026 19:25:28 -0700 (PDT)
Received: from [192.168.68.52] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a85388c664sm2351690a91.4.2026.10.05.19.25.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Oct 2026 19:25:25 -0700 (PDT)
Message-ID: <32c662e1-0de9-44a7-81e5-2b1e6c824114@redhat.com>
Date: Tue, 6 Oct 2026 12:25:15 +1000
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v22 09/23] KVM: arm64: Prevent unsupported vcpu features
 for VM types
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
 <20261005090754.2140522-10-suzuki.poulose@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20261005090754.2140522-10-suzuki.poulose@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: SpzhK4ssOj3zZgWdnp9-EtWPaqZrRU5Mx9N_s7ZcFX8_1791253529
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/5/26 7:07 PM, Suzuki K Poulose wrote:
> Prevent unsupported VCPU features for the protected VCPUs. Realms and pVMs
> not support 32bit EL1 or NV yet. pKVM doesn't rely on the host vcpu
> features and it clears the unsupported features while hyp_vcpu is
> initialised. Block the features early in the vcpu init if we detect
> incompatible features.
> 
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> ---
>   arch/arm64/kvm/arm.c | 10 ++++++----
>   1 file changed, 6 insertions(+), 4 deletions(-)
> 

One nitpick below. In either way:

Reviewed-by: Gavin Shan <gshan@redhat.com>

> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> index f31d31fa27ad9..9c2ef7ca6a961 100644
> --- a/arch/arm64/kvm/arm.c
> +++ b/arch/arm64/kvm/arm.c
> @@ -1668,11 +1668,12 @@ int kvm_vm_ioctl_irq_line(struct kvm *kvm, struct kvm_irq_level *irq_level,
>   	return -EINVAL;
>   }
>   
> -static unsigned long system_supported_vcpu_features(void)
> +static unsigned long system_supported_vcpu_features(struct kvm_vcpu *vcpu)
>   {
>   	unsigned long features = KVM_VCPU_VALID_FEATURES;
>   
> -	if (!cpus_have_final_cap(ARM64_HAS_32BIT_EL1))
> +	if (vcpu_is_protected(vcpu) ||
> +	    !cpus_have_final_cap(ARM64_HAS_32BIT_EL1))
>   		clear_bit(KVM_ARM_VCPU_EL1_32BIT, &features);
>   
>   	if (!kvm_supports_guest_pmuv3()) {
> @@ -1688,7 +1689,8 @@ static unsigned long system_supported_vcpu_features(void)
>   		clear_bit(KVM_ARM_VCPU_PTRAUTH_GENERIC, &features);
>   	}
>   
> -	if (!cpus_have_final_cap(ARM64_HAS_NESTED_VIRT))
> +	if (vcpu_is_protected(vcpu) ||
> +	    !cpus_have_final_cap(ARM64_HAS_NESTED_VIRT))
>   		clear_bit(KVM_ARM_VCPU_HAS_EL2, &features);
>   
>   	return features;
> @@ -1708,7 +1710,7 @@ static int kvm_vcpu_init_check_features(struct kvm_vcpu *vcpu,
>   			return -ENOENT;
>   	}
>   
> -	if (features & ~system_supported_vcpu_features())
> +	if (features & ~system_supported_vcpu_features(vcpu))
>   		return -EINVAL;
>  

The following check at the beginning of kvm_vcpu_init_check_features() is redundant to
the check here. We can drop that in this patch or a preparatory patch.

static int kvm_vcpu_init_check_features(...)
{
        /*
         * This check can be dropped since the same check has been done
	* by the followup "if (features & ~system_supported_vcpu_features(vcpu))"
         */
        if (features & ~KVM_VCPU_VALID_FEATURES)
                 return -ENOENT;
}

  
>   	/*

Thanks,
Gavin

