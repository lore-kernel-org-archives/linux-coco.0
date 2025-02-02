Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFF891A270
	for <linux-coco@lists.linux.dev>; Sun,  2 Feb 2025 06:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738478515; cv=none; b=LDE08NTJDOPbrgQcivql84DVYPipt17gd7UGX3o4KibymVUuuMcE/mS+/rzf/AGBNqUIzHAP15hcX1i5aZ20hRAgCOsohA9PlrXtPMxXEcs2BZpN5Tyik0br1WgPupWiRzSuyK05+a2d1Q/yhnIWIGi70C3OveZMUJEoL4t1crI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738478515; c=relaxed/simple;
	bh=wSTLzGhMLffhO/v6hJYaRpeR5d/1GKbHdC9MlbN+LvE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QePLd5Rd7oXd9q7FN3yuEzgbPf8KvxcbtRvcDhazOWHx24H5sUeE8k5rzyvtS9j7FjnF5hJKgmi89gTBCTIM0NWbKABXnRBeIhM1VPi04MQkmP6jryC0zCCou7TMWs8kC6ttoneHXfHnH7lXaAnIXzQgMLnL1jEeKPXvsZhnRqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Lxlnv7W1; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Lxlnv7W1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738478512;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O9bc7QlURY2KqxOqSdcgXWV1nxuIWVaexteEdP17afs=;
	b=Lxlnv7W1BfVzrZFUOtFpK4BkYpsBVoj4t4wJbj7VkpyTIEzxavaOwB0ajS/UnxDg5vI3ZV
	ofRAQRghMyEIqN7ASiLhMVpO4VR/B6RbPD5tcSDgDlB6gG0fcUUwvHwzv87JkYIxNRKIf7
	2yrg7xHbZlETkDugZ0sZlqokXbrSIe8=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-465-KWPeifl9Osi4M7naNQdsSg-1; Sun, 02 Feb 2025 01:41:51 -0500
X-MC-Unique: KWPeifl9Osi4M7naNQdsSg-1
X-Mimecast-MFC-AGG-ID: KWPeifl9Osi4M7naNQdsSg
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-21681a2c0d5so59570745ad.2
        for <linux-coco@lists.linux.dev>; Sat, 01 Feb 2025 22:41:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738478510; x=1739083310;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O9bc7QlURY2KqxOqSdcgXWV1nxuIWVaexteEdP17afs=;
        b=JiIY+2o+ex4LDrClM5O68DbrWsCcbfHbHhOTC0Ju44asZfmWddTyg1oUtoxW8IborZ
         TtjNwDyJULs0IQ1QYVyNz6tz842QY/shWcplr02gRLdebna39b641NypObtSIzHX+pL2
         tLPWMCBDW/fIP5c9chE9/t3hM/u1dQd8c1IerZWbTqR4Z8yRo5Q5WYZ9UETRCEdDkaZU
         kDGyHzEUBLHdlcX4R0X1KSQ7AwZcS83yimfS9OjTVhiU4eJNe+03Ifhr2Zxa6+SxMGHm
         eEHdFGzvpm9dHQVp5LrhL7DlHVpUod/ykUZuf8YeHq0oNf3req3nu8aW/XQI6W86Za1E
         IP7w==
X-Forwarded-Encrypted: i=1; AJvYcCUstZTRMvN+anYxTQXzl6w9FwLDJss4Q+jWVN+3ECj4CiInq76KITtRNJ25Ki6z9qv8+j7DyGBLFJ9U@lists.linux.dev
X-Gm-Message-State: AOJu0YxF4s99asTOS6ahV+FMCbFJtgQQguDk2irbODF7CnAlDfGLAkrO
	VP5IqGVHIeP8GHB57vxwFF18ZLg1pleW9AaPhy/G04YDWBj2E7JsWrkzSspaB4WdpE+idTPGuu0
	s/bPQG0+AEL8n2vf9jUZEo3r3iGexIvaQkSSg5EOLTmqDXrbulTK0yhXCCHs=
X-Gm-Gg: ASbGncuEnNhCFcUT4Ce8XDt4fBHUw6Uy9dSPw8gbaWWU1dO4tTFb+7WJeqTB6zmKgc0
	CgWndoj956ld0syqypPshvEZfPueE+gZh+az9GAXOEw6r2pDxNE51elveusRdOUJYcymrT5KQWM
	n4YdbakxXImI2zCfBpJocz3obahzqX1PQRNDOYJ+38XQJay7MIGmmrkofS2qE7h+rrlMtZhdBlz
	w+SoaLyr2rdwF+QFC3mUU0cf2oc64xcNfOJkRTvumXt5N0oAMo3P+VePFkm1C3+tzKNAuAAXtAU
	7G0+GQ==
X-Received: by 2002:a17:902:e742:b0:215:a97a:c6bb with SMTP id d9443c01a7336-21dd7c65891mr279349315ad.12.1738478509982;
        Sat, 01 Feb 2025 22:41:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEgiNqSMRe7eOLK7UU7yfr7SRk/XUpHiWVSGyN9DA4ZXFp8THxJ4DGREQDo0HNpjoMWa/PKyw==
X-Received: by 2002:a17:902:e742:b0:215:a97a:c6bb with SMTP id d9443c01a7336-21dd7c65891mr279349065ad.12.1738478509619;
        Sat, 01 Feb 2025 22:41:49 -0800 (PST)
Received: from [192.168.68.55] ([180.233.125.64])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de32efa0csm53772495ad.116.2025.02.01.22.41.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 Feb 2025 22:41:49 -0800 (PST)
Message-ID: <69a424e0-1350-484c-9ce7-b40c4fcacd8e@redhat.com>
Date: Sun, 2 Feb 2025 16:41:40 +1000
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 27/43] arm64: rme: support RSI_HOST_CALL
To: Steven Price <steven.price@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: Joey Gouly <joey.gouly@arm.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>,
 Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>,
 Oliver Upton <oliver.upton@linux.dev>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu
 <yuzenghui@huawei.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Alexandru Elisei <alexandru.elisei@arm.com>,
 Christoffer Dall <christoffer.dall@arm.com>, Fuad Tabba <tabba@google.com>,
 linux-coco@lists.linux.dev,
 Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
 Shanker Donthineni <sdonthineni@nvidia.com>, Alper Gun
 <alpergun@google.com>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>
References: <20241212155610.76522-1-steven.price@arm.com>
 <20241212155610.76522-28-steven.price@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20241212155610.76522-28-steven.price@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: y77VyCSHTeuSPkZbCA-8CKaeWyBK46YCbvgEA5k8XT8_1738478510
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/13/24 1:55 AM, Steven Price wrote:
> From: Joey Gouly <joey.gouly@arm.com>
> 
> Forward RSI_HOST_CALLS to KVM's HVC handler.
> 
> Signed-off-by: Joey Gouly <joey.gouly@arm.com>
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
> Changes since v4:
>   * Setting GPRS is now done by kvm_rec_enter() rather than
>     rec_exit_host_call() (see previous patch - arm64: RME: Handle realm
>     enter/exit). This fixes a bug where the registers set by user space
>     were being ignored.
> ---
>   arch/arm64/kvm/rme-exit.c | 22 ++++++++++++++++++++++
>   1 file changed, 22 insertions(+)
> 
> diff --git a/arch/arm64/kvm/rme-exit.c b/arch/arm64/kvm/rme-exit.c
> index 8f0f9ab57f28..b2a367474d74 100644
> --- a/arch/arm64/kvm/rme-exit.c
> +++ b/arch/arm64/kvm/rme-exit.c
> @@ -103,6 +103,26 @@ static int rec_exit_ripas_change(struct kvm_vcpu *vcpu)
>   	return 0;
>   }
>   
> +static int rec_exit_host_call(struct kvm_vcpu *vcpu)
> +{
> +	int ret, i;
> +	struct realm_rec *rec = &vcpu->arch.rec;
> +
> +	vcpu->stat.hvc_exit_stat++;
> +
> +	for (i = 0; i < REC_RUN_GPRS; i++)
> +		vcpu_set_reg(vcpu, i, rec->run->exit.gprs[i]);
> +
> +	ret = kvm_smccc_call_handler(vcpu);
> +
> +	if (ret < 0) {
> +		vcpu_set_reg(vcpu, 0, ~0UL);
> +		ret = 1;
> +	}
> +
> +	return ret;
> +}
> +

It seems that the return value from kvm_smccc_call() won't be negative. Besides,
the host call requests are currently handled by kvm_psci_call(), which isn't
what we want. So I think a new helper is needed and called in kvm_smccc_call_handler().
The new helper simply push the error (NOT_SUPPORTED) to x0. Otherwise, a unexpected
return value will be seen by guest.

handle_rec_exit
   rec_exit_host_call
     kvm_smccc_call_handler

>   static void update_arch_timer_irq_lines(struct kvm_vcpu *vcpu)
>   {
>   	struct realm_rec *rec = &vcpu->arch.rec;
> @@ -164,6 +184,8 @@ int handle_rec_exit(struct kvm_vcpu *vcpu, int rec_run_ret)
>   		return rec_exit_psci(vcpu);
>   	case RMI_EXIT_RIPAS_CHANGE:
>   		return rec_exit_ripas_change(vcpu);
> +	case RMI_EXIT_HOST_CALL:
> +		return rec_exit_host_call(vcpu);
>   	}
>   
>   	kvm_pr_unimpl("Unsupported exit reason: %u\n",

Thanks,
Gavin

