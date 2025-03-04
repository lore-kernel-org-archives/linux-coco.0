Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFE9E1EEA2A
	for <linux-coco@lists.linux.dev>; Tue,  4 Mar 2025 06:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741068090; cv=none; b=CV/sMnH6p2EwJUJguaksO8DKBs6H/REimA1pLHeB+2qryl1lY/Vht43kAksKCos7WX9hDBGv72ShZKa3lLt1bhFH/P3yO/IEB37FI+p5EZtiihZlcT4uurSG/ZgHZ7Pto4Upt1+jUEY1iDGn4pKE12A2FKIxyOL4l8gJTavsVdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741068090; c=relaxed/simple;
	bh=eL87BOoGzXVDBj2SXPjQdFK+ZlB7bcDHzO1QoGp1gFs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FTM978ubw6YfkF9+Cd23cH3cBNRDwP5f9Cn5/2rvrOHxIt9Alt33oqsdwdGhR2cLRs+J97Ue1q+rnKup83k5rrva1TKseZsLcF+QY4A8uSu8nFPZUZng+0jwGq3eWXLr/zDNG7mh8oVhYdIdEhkUTXEhcM/iTmAW+NMvgYo8uEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EUkq5IZr; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EUkq5IZr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741068087;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=boHxbjq3P2vU0fO6UUb8Hfrkk8ida9vHUjKzaMq4o5k=;
	b=EUkq5IZrpr5zksZERM3x9cinzGEG6HM1jFScNNS+UZiLGn/IUheC/YkvQrpfUKuoJBKRnj
	wuVDoShCm5cp/JJlMusxl6PV6N1LBtm6uyv5akkWGOqFrQd4TqmM4SLvDyBFCpIHoL3vBn
	6n+YTWNoWGSRc4lEmezlJoNwiiuBFaU=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-557-3LsvjoHENjqWMxL9mWDlRg-1; Tue, 04 Mar 2025 01:01:26 -0500
X-MC-Unique: 3LsvjoHENjqWMxL9mWDlRg-1
X-Mimecast-MFC-AGG-ID: 3LsvjoHENjqWMxL9mWDlRg_1741068085
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-22349ce68a9so22793725ad.0
        for <linux-coco@lists.linux.dev>; Mon, 03 Mar 2025 22:01:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741068085; x=1741672885;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=boHxbjq3P2vU0fO6UUb8Hfrkk8ida9vHUjKzaMq4o5k=;
        b=Q53KgnJDfYrEZcryZUGtCdBRdnuj2ycOpANnb9BjNudOl0WoPlJXtzTnDl1XinA2yl
         jrxecU8QMRYeYamZY+bEL7bT0VwHT3JfOZgLIi2uiPPj0r+ps2XeyzJcRJIHEmK8G7j0
         uFuVXuV8P+oOMvzQMRUPq8wzu4ouC6Mz5VYVYlvAJN9GM+3ys839Nc1QMa1br3FygsJZ
         bPtseOONQZAlscWrgrdyy08xshkwIPaldg71Mrm2Jygd4m2qbJi3vXLTk9T0oIkszUdC
         uY8gzgdgSA1sBy5y5+KWPkRdbXRUt5zqE1+oB8CvnYgxabSQWTHcHvoNG9tBEKmm2XcB
         Falg==
X-Forwarded-Encrypted: i=1; AJvYcCVV3+lywWQ2DYC0Y03UfVBd02u/PI2bioCs/xo9EsYc/ooK/26RzHcejIXPDtENq36OtDQiC5MvqcnL@lists.linux.dev
X-Gm-Message-State: AOJu0Yw4FFl88FlNO4QU2Ln9pXCY8qluG9/Lf8S2bay0K5Z8ALTwOwZh
	SI/TEkVEtcOnfw0EILeSywLJDZ0ed9gZvrdJBvDypRMedVoQpqvvVEcc31TEME4vXkVxUTqXqEj
	Z/yeRDxN8EcKOOWQvX37gyv5O7KkDUlb1HuJ6u8RzyJA5W+EY2slCrGJ+exM=
X-Gm-Gg: ASbGncvHwXmfqnlxTSU07J9+ziIh7QlrXgcDyUEXcfvtMGPfm5OEdRzAfIBKAlB0wyW
	5INFbm/TZhBKNm5ZkmxsK2sDIROkklFXOv/2PKWK4pf+5lYxXEwwFreXtlmBfQRe6VP7VmV+TF/
	rxfYPdj4m1qJvSSfzAFw9jFJWzDHIyGZ7so27WgGXMStUe7mcDwIGtP6yLyw9ewWd4tG2ZUnGNt
	a1LorJLcl+yKrb/pjqC90Ce91UuQt5vMWlZ9PihhPlnylZMMGkM3dCDun/K8GJ1lQThh01Z7BY8
	oudSBKca+u5AeFSVvQ==
X-Received: by 2002:a17:902:d543:b0:210:f706:dc4b with SMTP id d9443c01a7336-22368f8901emr239972355ad.13.1741068085383;
        Mon, 03 Mar 2025 22:01:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHElCuS6yRgRylUHMYlinoo6CRmRHfyntq1vELw6NqviCnDfsX3HH8S1d66GYPIYgVFC5KeFg==
X-Received: by 2002:a17:902:d543:b0:210:f706:dc4b with SMTP id d9443c01a7336-22368f8901emr239972065ad.13.1741068085037;
        Mon, 03 Mar 2025 22:01:25 -0800 (PST)
Received: from [192.168.68.55] ([180.233.125.164])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-223504dc6desm87837665ad.168.2025.03.03.22.01.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Mar 2025 22:01:24 -0800 (PST)
Message-ID: <12b5ba41-4b1e-4876-9796-d1d6bb344015@redhat.com>
Date: Tue, 4 Mar 2025 16:01:16 +1000
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 28/45] arm64: rme: support RSI_HOST_CALL
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
References: <20250213161426.102987-1-steven.price@arm.com>
 <20250213161426.102987-29-steven.price@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20250213161426.102987-29-steven.price@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: YL8wizO_Y-cE7Csnx_iN176LQXEnCJjCWY3kqwfAVBE_1741068085
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/14/25 2:14 AM, Steven Price wrote:
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
> index c785005f821f..4f7602aa3c6c 100644
> --- a/arch/arm64/kvm/rme-exit.c
> +++ b/arch/arm64/kvm/rme-exit.c
> @@ -107,6 +107,26 @@ static int rec_exit_ripas_change(struct kvm_vcpu *vcpu)
>   	return -EFAULT;
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

I don't understand how a negative error can be returned from kvm_smccc_call_handler().
Besides, SMCCC_RET_NOT_SUPPORTED has been set to GPR[0 - 3] if the request can't be
supported. Why we need to set GPR[0] to ~0UL, which corresponds to SMCCC_RET_NOT_SUPPORTED
if I'm correct. I guess change log or a comment to explain the questions would be
nice.

>   static void update_arch_timer_irq_lines(struct kvm_vcpu *vcpu)
>   {
>   	struct realm_rec *rec = &vcpu->arch.rec;
> @@ -168,6 +188,8 @@ int handle_rec_exit(struct kvm_vcpu *vcpu, int rec_run_ret)
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

