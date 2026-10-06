Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 540511922FD
	for <linux-coco@lists.linux.dev>; Tue,  6 Oct 2026 03:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791256634; cv=none; b=YdIqBlKHq6LALzDzto/EGjG83eU787jbgMCqTjibRpHr81UgFYogCHKYH1leMqkivL1Uqtp3FvDBmkZDkQVKOLC0nPPz/+vLdkr8X/8/1lC2njCPqKduFDyRXhIuMmOLJncpMF/QiaGkMDNs7a6zN7kfrSQOxo21N5/eDuvC3as=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791256634; c=relaxed/simple;
	bh=OCwy2T21o6KZK5vUec+S24BqJgmIfSohdnltBRqhZh4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qFJHROldR4rpGM26rQeRmPUH3bfxUitD91odbCRPR+xx85qrSaRMiempBVjkK03rENqyJVvURI/X4XiKsB7AmVkeoN2wr2bzcN07EG1JczIJf5tM6IeJB/LVnH+b1HBEZE3Xn5v8IDTu9DwZvA3ufVIts0ZCHz1DTquOQ8qZQ6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JmRa6+pG; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JmRa6+pG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791256632;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cmIEoaAK9H0I/DObf/8+7Lpe62dBXA5oIjHsrjeoKTg=;
	b=JmRa6+pG+IfDsTB9eepNfpqWczkdHGUdGggMTuKdZCcorkxOVQklsIna/sgOlxYcPNymWc
	ddHuqZo1Xk8cuGs9GxmKRpWVNOv98I1IGdxmE8HJfPdGLKK0MzyGmN9xX5ZAgC+oO+Du4+
	DbQmt6Axb51VYKrsTbJeQjyFL7Ot74I=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-653-BEG48Z5lONqfmr3BUEaiQg-1; Mon, 05 Oct 2026 23:17:11 -0400
X-MC-Unique: BEG48Z5lONqfmr3BUEaiQg-1
X-Mimecast-MFC-AGG-ID: BEG48Z5lONqfmr3BUEaiQg_1791256630
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-39de4a68f7cso2018266a91.1
        for <linux-coco@lists.linux.dev>; Mon, 05 Oct 2026 20:17:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791256630; x=1791861430;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cmIEoaAK9H0I/DObf/8+7Lpe62dBXA5oIjHsrjeoKTg=;
        b=Phi4uVTPyFVbwrTfsfJam07Jnlb2YviIlTfTxh4Vhtkej+yAOLPF2CrQjtbBoVGzX5
         B8LxROrGbgRd28z1fzFpnnv6yMdNNqWOEg5lv80FbcC1hy8aNHXiAmjOIaV/qAkMmlzS
         w42ecbn8PJUh5MG/wcGXVzVfMFWSj7rHRSQPy0grXK5uW+IysSBtEezmoBt6SnfvxA4+
         xBLnicTjx0Z3ACVq9IMG1XZkHWbqBPw8xrAphQuTIToLWAw28gBQPt7XBOrvOOew2AUq
         tFN/tjg9Df4i/13bCDrUJgbGDIcYXdWGnh62qPDzN2XfYlVqwuhBOHUMCB5fqWiua/8x
         sidQ==
X-Forwarded-Encrypted: i=1; AKwUvBy9G1AMRTu1pZ1ZFP3rxsjdbHPAEg/f2+HsC4yA/WWjZWhAMPYN9a1ddtfN8hd8zyvEwOfJwNei7tBm@lists.linux.dev
X-Gm-Message-State: AFuF++ntFSEvcZtlSRjj2dsmbsOqj/R/+NGs1s9TtzIuW6LXXlJdx3IF
	F8X/4AE4e1ebhibzSW1ejMPdd4x5g1vOYPRYHe2JY/soCWjh4z5QVO2hNMpPMFjRFW9HDlFZIMM
	yyaNNVksxI+kz3J5RB/8+o5Ao7XvnYadjWMgbIKWx+9oiHPSLF7Kp86kkGq2Mfro=
X-Gm-Gg: AYBFou293jFruYCflGWx0AfDMX6+TQG+bbVGqucS88HkBPna6ZwNyPd/GihzhC7ywwq
	PzKdPV3pmrXJ/wqxRxmMbzKPbndxiHtLEWV1xZP11YlS0mNYW/UBXYrPoRpd5IaLAzyaO2eGPeh
	C7eIeKKZmRvveYqcM/U56FB5Yzz4VW/TNALiGBKMJJqkR4IMJR5VcG7ysbzKFmOF9PGLsaVtm4o
	+Wah+T5zqcjxxVcTH5kANgS7KiKxha6Q3BI8l51A7NbVHnSynpqVQUaAAM3XUobDk4RxgqT8MMs
	B3KniFa1o1XcwVuSq5+LbMFd9Q6/K7WNoR5a0jvhUDeic6ZpGZyW93n49uq/eiNKJlmNQnF+mA1
	dKt+RaIK53sM4q2vhBsvIcMQ2ip8tmfoEHOh5t8M5Og==
X-Received: by 2002:a05:6300:6698:b0:3de:7bd5:fb47 with SMTP id adf61e73a8af0-3e12474463bmr68480637.39.1791256630139;
        Mon, 05 Oct 2026 20:17:10 -0700 (PDT)
X-Received: by 2002:a05:6300:6698:b0:3de:7bd5:fb47 with SMTP id adf61e73a8af0-3e12474463bmr68459637.39.1791256629711;
        Mon, 05 Oct 2026 20:17:09 -0700 (PDT)
Received: from [192.168.68.52] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cce6b358400sm1870050a12.4.2026.10.05.20.17.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Oct 2026 20:17:08 -0700 (PDT)
Message-ID: <fdc81d01-27df-4557-80bf-80d4527e4bf2@redhat.com>
Date: Tue, 6 Oct 2026 13:16:59 +1000
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v22 16/23] KVM: arm64: CCA: Add VCPU load/put for Realms
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
 <20261005090754.2140522-17-suzuki.poulose@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20261005090754.2140522-17-suzuki.poulose@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: FGFuuWxcsFdG3keXK9XoS7FNlhO215ji67m3Uj6yNcI_1791256630
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/5/26 7:07 PM, Suzuki K Poulose wrote:
> RMM controls the VCPU settings and most are hidden from the KVM, except
> for the VGIC and timer bits.
> 
> A later patch would add syncing the VCPU state into the Realm REC related
> SMC parameters.
> 
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> ---
>   arch/arm64/kvm/arm.c | 18 ++++++++++++++++++
>   1 file changed, 18 insertions(+)
> 
> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> index 6c81fec35ecec..294cea4cc8271 100644
> --- a/arch/arm64/kvm/arm.c
> +++ b/arch/arm64/kvm/arm.c
> @@ -802,6 +802,13 @@ static void pkvm_vcpu_load(struct kvm_vcpu *vcpu)
>   			  &vcpu->arch.vgic_cpu.vgic_v3);
>   }
>   
> +static void realm_vcpu_load(struct kvm_vcpu *vcpu)
> +{
> +	kvm_timer_vcpu_load(vcpu);
> +	kvm_vgic_load(vcpu);
> +	vcpu_set_wfx_traps(vcpu);

Why we need to call vcpu_set_wfx_traps(), which updates 'vcpu->arch.hcr_el2'? I don't
see how 'vcpu->arch.hcr_el2' is affects realm in RMM. Could you please explain in the
commit log.

> +}
> +
>   void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
>   {
>   	vcpu->cpu = cpu;
> @@ -854,6 +861,12 @@ static void pkvm_vcpu_put(struct kvm_vcpu *vcpu)
>   	kvm_vcpu_pmu_restore_host(vcpu);
>   }
>   
> +static void realm_vcpu_put(struct kvm_vcpu *vcpu)
> +{
> +	kvm_timer_vcpu_put(vcpu);
> +	kvm_vgic_put(vcpu);
> +}
> +
>   void kvm_arch_vcpu_put(struct kvm_vcpu *vcpu)
>   {
>   	vcpu->arch.vcpu_ops->vcpu_put(vcpu);
> @@ -2213,6 +2226,11 @@ static const struct kvm_vcpu_ops pkvm_vcpu_ops = {
>   	.vcpu_put = pkvm_vcpu_put,
>   };
>   
> +static const struct kvm_vcpu_ops realm_vcpu_ops = {
> +	.vcpu_load = realm_vcpu_load,
> +	.vcpu_put = realm_vcpu_put,
> +};
> +
>   #define KVM_VCPU_OPS(flavor, ops)		\
>   	[(flavor)] = &(ops)
>   

Thanks,
Gavin

