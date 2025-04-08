Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E71917A2F9
	for <linux-coco@lists.linux.dev>; Tue,  8 Apr 2025 05:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744089589; cv=none; b=ZzL0ZAlWRaHd1XnNRpp2HGkAbJjQqkwGPcKWTtKl1ezaMDZE2fxXuwL4oNrQeykBPTAVIhDVQVLWrjjSQmBT3HNRVDSIei5ZK2hvQtqmgH6J/0l9uVcNOIUTPFdRKEgvqivRtqMG8tzF7CjZ7F1mIm9167RsPl0lZ7VfyT+L54k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744089589; c=relaxed/simple;
	bh=es+SNh0P9NtPGWcq5WsV3Y8WBvXwDiLbdcGTXKuwMv8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DThxfR53CrSQ/okxlcddrfS6lE2B61J07FUPC9305CSKBwOJwK8yCd73X0fGNcO6JeFVQ8slmAm7VGSEIt926VFyTOS8IyTu60mbxL/84hvjNVE94t5BQ2jCCfs/VnQReLcIh3OPvcrkNOkVUYOuYlESWy5H6iL4Nnpp+t8CXYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WrOYkXME; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WrOYkXME"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744089585;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SZYs4PdDssFQWEmrDvKTFbTZUVJpYWm3vSQBh2J9Vlg=;
	b=WrOYkXMEUwuBUClT+qAn9IZX6qqBHVZFLy7PbhdtvWx1GbClOo8mPGnLdygk78G9vzm5Au
	ve8TpwOoRAfyQqAfI5EmCpCYNfmvLeN3tMyQe3u0YRhrVrnX+5Mqrq2XsLATZzKzMFMnte
	mpImUo7nzA7DhHA7LfGuuqByZX6NXQM=
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-170-W5nhAvRKPlWUG_iPv-7DCQ-1; Tue, 08 Apr 2025 01:19:43 -0400
X-MC-Unique: W5nhAvRKPlWUG_iPv-7DCQ-1
X-Mimecast-MFC-AGG-ID: W5nhAvRKPlWUG_iPv-7DCQ_1744089582
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-af5310c1ac1so3298060a12.2
        for <linux-coco@lists.linux.dev>; Mon, 07 Apr 2025 22:19:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744089582; x=1744694382;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SZYs4PdDssFQWEmrDvKTFbTZUVJpYWm3vSQBh2J9Vlg=;
        b=WP+J23tXioCncGDxM3Rf4NB9YDc+FNOtqVDH3X4UpxBew85mCHXacQZhuTwsSbS5t/
         yGGOSGmL+r9ncESRtgbtl5TpfUqxMNf+WoQqw9hAOGhdbeKM6VwGWqiblhdiRS34XSda
         4EPiXRV6LiaQxizpOiSbtgxyYbTjnW/+GcHfmOwVFdT8TaFx37wQ2Ebkpd0JKGJ7FeMx
         2y17azs8zdECjlTu/kD3VbTeLZGpdGg0clgKf8JCI+dK03x20T/vpH5+XJLzKPbgpGkX
         RNEisMP2Glk4jec5ucA/jlZQAgVBLTJBXLeUMHUjn2dERqvV1h1Y2+PKp+Ndpeu+7LZx
         tqJA==
X-Forwarded-Encrypted: i=1; AJvYcCWdatQg5wEtititn5sIrIvPFY1W+8cpBNhORQeZs45ec90NM2omeU3AzPI0JUPymNzh2KQg7+xLAoIu@lists.linux.dev
X-Gm-Message-State: AOJu0YxUX3y+l9iKvH0g891lyq/8FSR0mWES9urH72JgwLAGxqbDi9Mo
	O7Rmqd0EyqFxY60dL67R9rTHY/bLYiynVWC+6L3eh34B0q/QMSDBsQPr71BP5vlMoEfWs3P1/QH
	YleK0Fl76Dy5iMtRzsNw2E/tqvsRgQl10ZrYktCRh8VoFEr9sXcDL4DUZZQQ=
X-Gm-Gg: ASbGncsyY+GqxqeG+mAKdO6bln0SHUSdFsHjhYz065Mi+hwGZW/iVwDiBLOJtLiKrLC
	Y350Lh4NWY57Nu/tIY2rJNeCJ16uOVHh3PYb5QW5MZPF5mOydgdet5LL1GBNU/45aUyCTIVe0q1
	17ffxOmti3cwx+KEp71RN8MHmiCudCtyWP8jTnX4QWwpDiHJWAGeh0ooMqUL5dIBYD/3EKyj9k3
	2fIC8dzNeRfU6sAKKXrPJxZEx78aWKrzSNumjHm/srn8GBsOJZkw/WUbhLQ6xOA+Xl80pZc7F2L
	lgQ1/a9bnFknW8c6
X-Received: by 2002:a17:902:f610:b0:220:fce7:d3a6 with SMTP id d9443c01a7336-22a8a06b429mr204562325ad.23.1744089582287;
        Mon, 07 Apr 2025 22:19:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHON1uwm7bR+2w9kanWBPOGcZHKNZxG2Wp+hjgiN2PniqOi1+L2J3B1ic75+U0mQ/IeetE7VA==
X-Received: by 2002:a17:902:f610:b0:220:fce7:d3a6 with SMTP id d9443c01a7336-22a8a06b429mr204562115ad.23.1744089581919;
        Mon, 07 Apr 2025 22:19:41 -0700 (PDT)
Received: from [192.168.68.55] ([180.233.125.65])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-229786608d1sm91213655ad.120.2025.04.07.22.19.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Apr 2025 22:19:41 -0700 (PDT)
Message-ID: <b76ffc1c-32e1-4bf6-916a-41af9378fb4b@redhat.com>
Date: Tue, 8 Apr 2025 15:19:32 +1000
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
 <12b5ba41-4b1e-4876-9796-d1d6bb344015@redhat.com>
 <54f1fbb1-4fa1-4b09-bbac-3afcbb7ec478@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <54f1fbb1-4fa1-4b09-bbac-3afcbb7ec478@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Cv78Vu9crS7O84EH4MoBGxVuTLahvxhuZYKaxfRdXMY_1744089582
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 4/8/25 2:34 AM, Steven Price wrote:
> On 04/03/2025 06:01, Gavin Shan wrote:
>> On 2/14/25 2:14 AM, Steven Price wrote:
>>> From: Joey Gouly <joey.gouly@arm.com>
>>>
>>> Forward RSI_HOST_CALLS to KVM's HVC handler.
>>>
>>> Signed-off-by: Joey Gouly <joey.gouly@arm.com>
>>> Signed-off-by: Steven Price <steven.price@arm.com>
>>> ---
>>> Changes since v4:
>>>    * Setting GPRS is now done by kvm_rec_enter() rather than
>>>      rec_exit_host_call() (see previous patch - arm64: RME: Handle realm
>>>      enter/exit). This fixes a bug where the registers set by user space
>>>      were being ignored.
>>> ---
>>>    arch/arm64/kvm/rme-exit.c | 22 ++++++++++++++++++++++
>>>    1 file changed, 22 insertions(+)
>>>
>>> diff --git a/arch/arm64/kvm/rme-exit.c b/arch/arm64/kvm/rme-exit.c
>>> index c785005f821f..4f7602aa3c6c 100644
>>> --- a/arch/arm64/kvm/rme-exit.c
>>> +++ b/arch/arm64/kvm/rme-exit.c
>>> @@ -107,6 +107,26 @@ static int rec_exit_ripas_change(struct kvm_vcpu
>>> *vcpu)
>>>        return -EFAULT;
>>>    }
>>>    +static int rec_exit_host_call(struct kvm_vcpu *vcpu)
>>> +{
>>> +    int ret, i;
>>> +    struct realm_rec *rec = &vcpu->arch.rec;
>>> +
>>> +    vcpu->stat.hvc_exit_stat++;
>>> +
>>> +    for (i = 0; i < REC_RUN_GPRS; i++)
>>> +        vcpu_set_reg(vcpu, i, rec->run->exit.gprs[i]);
>>> +
>>> +    ret = kvm_smccc_call_handler(vcpu);
>>> +
>>> +    if (ret < 0) {
>>> +        vcpu_set_reg(vcpu, 0, ~0UL);
>>> +        ret = 1;
>>> +    }
>>> +
>>> +    return ret;
>>> +}
>>> +
>>
>> I don't understand how a negative error can be returned from
>> kvm_smccc_call_handler().
> 
> I don't believe it really can. However kvm_smccc_call_handler() calls
> kvm_psci_call() and that has a documentation block which states:
> 
>   * This function returns: > 0 (success), 0 (success but exit to user
>   * space), and < 0 (errors)
>   *
>   * Errors:
>   * -EINVAL: Unrecognized PSCI function
> 
> But I can't actually see code which returns the negative value...
> 

I think the comments for kvm_psci_call() aren't correct since its return value
can't be negative after 7e484d2785e2 ("KVM: arm64: Return NOT_SUPPORTED to guest
for unknown PSCI version"). The comments should have been adjusted in that commit.

Please take a look on 37c8e4947947 ("KVM: arm64: Let errors from SMCCC emulation
to reach userspace"). Similarly, the block of code to set GPR0 to ~0ULL when negative
error is returned from kvm_smccc_call_handler() in this patch needs to be dropped.

>> Besides, SMCCC_RET_NOT_SUPPORTED has been set to GPR[0 - 3] if the
>> request can't be
>> supported. Why we need to set GPR[0] to ~0UL, which corresponds to
>> SMCCC_RET_NOT_SUPPORTED
>> if I'm correct. I guess change log or a comment to explain the questions
>> would be
>> nice.
> 
> I'll add a comment explaining we don't expect negative codes. And I'll
> expand ~0UL to SMCCC_RET_NOT_SUPPORTED which is what it should be.
> 

Please refer to the above reply. The block of code needs to be dropped.

> Thanks,
> Steve
> 
>>>    static void update_arch_timer_irq_lines(struct kvm_vcpu *vcpu)
>>>    {
>>>        struct realm_rec *rec = &vcpu->arch.rec;
>>> @@ -168,6 +188,8 @@ int handle_rec_exit(struct kvm_vcpu *vcpu, int
>>> rec_run_ret)
>>>            return rec_exit_psci(vcpu);
>>>        case RMI_EXIT_RIPAS_CHANGE:
>>>            return rec_exit_ripas_change(vcpu);
>>> +    case RMI_EXIT_HOST_CALL:
>>> +        return rec_exit_host_call(vcpu);
>>>        }
>>>          kvm_pr_unimpl("Unsupported exit reason: %u\n",
>>

Thanks,
Gavin

