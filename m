Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 411DD37B01F
	for <linux-coco@lists.linux.dev>; Tue,  6 Oct 2026 06:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791267841; cv=none; b=pa1m/xIzamUotRwQqH4FFMOTerwxeSx1lo5o7JI7X4Lzf0AGVtrWdKORbit63An3/C41S2OnBC+Xt6cvaiPe8Riu5HP7U8KWS1LuHwQNahrBsgHuuXjVtXXMRlH+uD3h+nx+Rmhl/SCp3W9zZZiaEFpMgAO5+ajcKkRV3z8FwCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791267841; c=relaxed/simple;
	bh=SMeDTIX8jSBWXiQnBBwSiyWPRzAqbGBsla0efRqXLEM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=krN2kD1WQoO9tLc538BZpNPLUeceIRqgC9geEYSJDVgAD6tGdN8y27keIXyyqYgMuBFzvT05g/D5AKLpLSyz7RujQReF6+F9C8ZSkRTObpZrKf24MfM4Rpt2PZEWey17q52B0gvun+iig2SQmorn96xwBoG9r70dZXlBjKMqcx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=d+525Zx7; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="d+525Zx7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791267837;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DLLq1R13uyDoTfMnvHZDH/2dbxOMckf2plTOpZS7OhQ=;
	b=d+525Zx7h/e+KpJVNOOAPUkoMx0+Y+i3LIadOdKs8TpdkroQ2E2Ub/evfGQa4h6wjrU/XI
	ZivwCuzVEWoW2StqVvHxcArRMgLT2yVOWa5pngfIUkbo3k7ZmhNy0pPBCYUQJ8oNlbjR3w
	VMXDHzeCwPViPeKBDq8raqFYrBg8P7s=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-112-z1-HeT43MAmlOjradOsYcQ-1; Tue, 06 Oct 2026 02:23:56 -0400
X-MC-Unique: z1-HeT43MAmlOjradOsYcQ-1
X-Mimecast-MFC-AGG-ID: z1-HeT43MAmlOjradOsYcQ_1791267835
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3a7d2f25f65so504454a91.0
        for <linux-coco@lists.linux.dev>; Mon, 05 Oct 2026 23:23:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791267835; x=1791872635;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DLLq1R13uyDoTfMnvHZDH/2dbxOMckf2plTOpZS7OhQ=;
        b=N8FXawZAjgy4lUoPXV9JE/UZwNQ9IzqRYVCxG30nHErUu/TL+U/vMukSat7b0PKEJZ
         sn3VW1PVBiHVajClhVZHMxiG+Hlfnpanq/OK8Q4v/oyOumbUjDvkd+6pKYf9eqIRv9e5
         be8M+pw5m3Zy6y7wYiRLKkgzv/zClyxOZs1VlWDGF5rRSJHzKpPL4WxZduzPmYpYOWv9
         ilfs5iRSBnXHWT8Bbb6eQt/I8LzBp19h2OJ6hArW+L+ktELxfzS2WoqMmOQJ4jUevh1W
         ukgP80xbJCAxwu1TVc8vQVTSjP3Xp7amhTRMMnjwYeWisV2Zv3Fsqj7zV+vqCkfCfv9o
         YI/w==
X-Forwarded-Encrypted: i=1; AKwUvByop5oDWvqHMSmp7HBe/MLdp6+MncfZknpS2xb7EAIbOYiI7ZYqRGLF7sDZp3FF2BDDdQXNxpHzTyGK@lists.linux.dev
X-Gm-Message-State: AFq9FYI+t+lDrhuR+MBGuWkXVxM4V73J7FecvX3nXO5cvHemfv0bCMJ0
	pMWnAnzWRsUuXTGYbt2u2fRRhLEvY5tFwlxeZK14cRoQUnu4BOsB7oQnRcaLo6xS08h3IRjJv/C
	nLmEoWzPmrnGsPHJzhvl+7tSOYXOmHD6BFzEzNZWNVFIIqT6/YIODcZE0+mOkdFU=
X-Gm-Gg: AYBFou3FAusDqIg854UJypL2PQ4Fw7RWqpLMTSLm2qReHevj9W1BF3Kkwo8iPRVs/3s
	420gjQF/WgGoPUjIJNgqmCOHRlZv3sdRZExbwFgOZT7qofZ+XrXKh4GM8O5xzZFPJnBZuLC5qk4
	cNsUixKjjAlM4Usbl/9jifXuRbSpGKHWWJG+NvccNy9rsNlrvjoUkK+xg3juzelb8iL48s3cQIO
	9mEaA3Tybd5/VZy7ZXAkKD4D23rLDr+S4I+JGbUJ3diOZrQiKaaHHZzhTHirrf862u34EAVEVZ5
	BCAD9JRqdkOaRWcqoYwXJymY0jXkERuXUXpIxafFEL1aDun1PIny267XaT0++DxOlH3GvCsHDU1
	qw3uGegz01ZSvlgKIht0Vr5HIs4Yf/Dd9cVmhC4S2pw==
X-Received: by 2002:a17:90b:1f92:b0:3a4:e635:a8c3 with SMTP id 98e67ed59e1d1-3a8545cceb1mr1330582a91.20.1791267834670;
        Mon, 05 Oct 2026 23:23:54 -0700 (PDT)
X-Received: by 2002:a17:90b:1f92:b0:3a4:e635:a8c3 with SMTP id 98e67ed59e1d1-3a8545cceb1mr1330556a91.20.1791267834199;
        Mon, 05 Oct 2026 23:23:54 -0700 (PDT)
Received: from [192.168.68.52] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a6f734ae3dsm9932948a91.2.2026.10.05.23.23.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Oct 2026 23:23:53 -0700 (PDT)
Message-ID: <7bbee080-e8b9-4f8e-a4bd-c24f0b3b815f@redhat.com>
Date: Tue, 6 Oct 2026 16:23:44 +1000
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v22 23/23] KVM: arm64: CCA: Control user register access
 for Realms
To: Suzuki K Poulose <suzuki.poulose@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: maz@kernel.org, will@kernel.org, catalin.marinas@arm.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 steven.price@arm.com, aneesh.kumar@kernel.org, oupton@kernel.org,
 joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
 linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
 sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
 WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com,
 sudeep.holla@arm.com, jonathan.cameron@oss.qualcomm.com,
 Jean-Philippe Brucker <jean-philippe@linaro.org>
References: <20261005090754.2140522-1-suzuki.poulose@arm.com>
 <20261005090754.2140522-24-suzuki.poulose@arm.com>
 <52e3e45a-751e-40b2-8dd3-3db589ddebee@redhat.com>
 <7b6ed626-eca4-41f2-ae56-0af59a931b29@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <7b6ed626-eca4-41f2-ae56-0af59a931b29@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 5hB8VZ7UB06gvR3ybuwXsv7O3BmNqgNyffhJduPkUcU_1791267835
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/6/26 4:01 PM, Suzuki K Poulose wrote:
> On 06/10/2026 06:47, Gavin Shan wrote:
>> On 10/5/26 7:07 PM, Suzuki K Poulose wrote:
>>> From: Jean-Philippe Brucker <jean-philippe@linaro.org>
>>>
>>> The RMM restricts the access to the register states that the host can
>>> read/modify for a given Realm.
>>>
>>> e.g., At VCPU creation, can modify GPRS (x0-x30) and PC.
>>>        While servicing SMCCC calls via RSI_HOST_CALL or servicing PSCI
>>>        requests.
>>>        MMIO emulation in the unprotected space.
>>>
>>> Additionally we use the sysreg configuration to advertise/configure the
>>> following Realm parameters, which are required before the Realm Descriptor
>>> is created:
>>>   - SVE Vector Length
>>>   - Number of HW Breakpoints/Watchpoints
>>>   - PMU Counters.
>>>
>>> Thus KVM also additionally allows access to ID_AA64DFR0_EL1 and SVE_VLS for
>>> the configuration of Realm creation parameters. We don't support PMUs for
>>> the Realm VMs yet, so PMCR is not exposed.
>>>
>>> The RMM makes similar restrictions for reading of the guest's registers
>>> (this is *confidential* compute after all), however we don't impose the
>>> restriction here. This allows the VMM to read (stale) values from the
>>> registers which might be useful to read back the initial values even if
>>> the RMM doesn't provide the latest version. For migration of a realm VM,
>>> a new interface will be needed so that the VMM can receive an
>>> (encrypted) blob of the VM's state.
>>>
>>> Reflect the above in KVM_GET_REG_LIST, KVM_SET_ONE_REG calls.
> 
>>>   static int core_reg_size_from_offset(const struct kvm_vcpu *vcpu, u64 off)
>>>   {
>>>       int size;
>>> @@ -553,6 +572,9 @@ static int copy_core_reg_indices(const struct kvm_vcpu *vcpu,
>>>           u64 reg = KVM_REG_ARM64 | KVM_REG_ARM_CORE | i;
>>>           int size = core_reg_size_from_offset(vcpu, i);
>>> +        if (vcpu_is_rec(vcpu) && !kvm_realm_validate_core_reg(i))
>>> +            continue;
>>> +
>>>           if (size < 0)
>>>               continue;
>>> @@ -598,6 +620,9 @@ static unsigned long num_sve_regs(const struct kvm_vcpu *vcpu)
>>>       if (!vcpu_has_sve(vcpu))
>>>           return 0;
>>> +    if (kvm_vm_is_realm(vcpu->kvm))
>>> +        return 1; /* KVM_REG_ARM64_SVE_VLS */
>>> +
>>>       if (!kvm_arm_vcpu_sve_finalized(vcpu))
>>>           return 1; /* KVM_REG_ARM64_SVE_VLS */
>>>
>>
>> Aren't above two checks conflicting to each other?
> 
> Do they? We allow SVE_VLS only for the Realms and we allow that
> before the vCPUs are finalized. For normal VMs, depending on
> whether the vcpus are finalized, we either send 1 or the full list.
> 

num_sve_regs() can be called for 3 cases: (a) non-finalized realm vCPU; (b) finalized
realm vCPU; (c) Other finalized vCPUs, correct? The check "if (kvm_vm_is_realm(vcpu->kvm))",
which would be "if (vcpu_is_rec(vcpu))", covers (a) and (b). The second check
"if (!kvm_arm_vcpu_sve_finalized(vcpu))" isn't used. The check here would be something
as below after this series is applied:

	/*
	 * Only KVM_REG_ARM64_SVE_VLS is visible on realm vCPUs no matter if
	 * they have been finalized.
	 */
	if (vcpu_is_rec(vcpu))
		return 1;

Besides, this check "if (vcpu_is_rec(vcpu))" belongs to PATCH[22]. Hope I make myself
clear :-)

>>
>>> @@ -625,6 +650,10 @@ static int copy_sve_reg_indices(const struct kvm_vcpu *vcpu,
>>>           return -EFAULT;
>>>       ++num_regs;
>>> +    /* For Realms only support SVE_VLS */
>>> +    if (kvm_vm_is_realm(vcpu->kvm))
>>> +        return num_regs;
>>> +
>>>       if (!kvm_arm_vcpu_sve_finalized(vcpu))
>>>           return num_regs;
>>
>> Same question here.
> 
> As above.
> 
> Suzuki

Thanks,
Gavin

