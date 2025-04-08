Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 913C21B21AA
	for <linux-coco@lists.linux.dev>; Tue,  8 Apr 2025 05:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744088614; cv=none; b=A88RJvDluSyfzb6u9PUku0If1OUCeXwp86Qi9ErVshzn9jxGK6LxwP2nIm6TJMU434CgwOyBaRwmmGmiLU8UtMEcTOHAUHG/NtfrlYi7pBToliO0kLB9ktJksM9nYIyfI78qBLsqPrWahLa8Fc+qVsNYihUNwQr//GpU18PZQ28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744088614; c=relaxed/simple;
	bh=kCrdhF+yR04zpDgvPaEbwrTFya3LR3Mk7SW51smtES0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MvVnLoF9SFAy6/BUMbMKqmW/kmbjetwUF0Qm2bOVcaC19Fbaj/3+gBbe/HiEUvJ1m5UuHLikAeurKouBFNy8DwNmDm8C6odzg+FGPIih5hG8VkPoBYoqed4kba3DTRTXDJXovH71k67g6DoQGOKMMfAMmeYb8RSaQcGEVqaRKew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HGAIJtbQ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HGAIJtbQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744088611;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=08d10QPRbou7mD/4AaojdjLjtx5I6e0q1cXfeY1kUxQ=;
	b=HGAIJtbQanh9ngnQi72+Ut7n1QhrAWR1edZtwX14JU8fDy1BHpMS16X7xVWCQplgefKhBr
	sq6SVIawted8My2Y24fpytSj75FOxFkczWrDkmey5NQCw6C9JwysvIYsXw9pIYOcCcOjZg
	htW2dasuJAjUuWGwSF11SeUGGf0skEQ=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-154-8u_YYixKPRGWoGIqN1oGeA-1; Tue, 08 Apr 2025 01:03:29 -0400
X-MC-Unique: 8u_YYixKPRGWoGIqN1oGeA-1
X-Mimecast-MFC-AGG-ID: 8u_YYixKPRGWoGIqN1oGeA_1744088609
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2240a7aceeaso48783655ad.0
        for <linux-coco@lists.linux.dev>; Mon, 07 Apr 2025 22:03:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744088608; x=1744693408;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=08d10QPRbou7mD/4AaojdjLjtx5I6e0q1cXfeY1kUxQ=;
        b=B/sWHzOA8vQKfTFwDlzYQrgZY7YPSkpuSCBbBAaCM5cSFOhSohNaCxGcP6wpQS+xXk
         X8DBtc4bHn65vfTnTAT/0TsYDIkRzHRO9kCvkteD/a7kgEcNYKnLHi0JS/LjWqy6GCLn
         5nIHrUgeZDqo5Gzi6uVV++6xy4ATc0FzDHD/3cYXhvQgzSJAsxuOPsFQhAc2N2G2BzrF
         djeb666HYhdxGKdz1uelEnu1T//ygGoN1fpPs8dg7AJY+tfH7Q/Qa8YVqQfRv4SiqYbT
         ZH811Fdv89YUY/+V+OjMDnRuI8P7xElovuqMsyUg21tWOyPcYVJaKP4esY6PZ+MNs/Kj
         9o6g==
X-Forwarded-Encrypted: i=1; AJvYcCXbkEncdaKBIKqgagDfaHcc2HYYUg9nnq8jTD4CptZ3VmPeVejZ9KirbqFgBI2r9AQYxf5D8IoIpf4Q@lists.linux.dev
X-Gm-Message-State: AOJu0YwDkji93L6/Nte0IlTLE8kMV/RwY+qeWkBs+BfTNWLOPnwTFGmc
	BjzXAnxN6ElE5ZBKtHM3otQkwzsm8xUuhlvbvId3cP5ttGrBAzclJiaTi+sjh16tol6a6J5o/U1
	yryVTiGoDHuShrGgldDz53Bxg6tDZ5Vkpv7pqma0LCVPOX/0jFiH68XjP+6k=
X-Gm-Gg: ASbGncubSyq56RBMopqh/2YjQafnnW4EmZmP2cFiUttgmiQUCRzaXN4a2BpsDpX69fb
	KEdk/5PuS2+hoF117nIGN+oB9Yu6NMqqebM2VwIyOUDeGgaxQD8lDlfnFPkXjYiarg4mYydjVuB
	j3bphalMm+ls94wc0Gg64Y5hywmCe+KWWPb/SBJO/1wap3kDks7ZxgAVH8ba8+s0bX1vJSiQZ3Q
	HsvWorUYU+iaRKjkyVnF1Q7JNam+0DpF67ccu8GF3/gveQfyMQAPGuUMjlcpPSNhLR/DLnQ71i/
	ZyBqOeD4Aq5Z7nRi
X-Received: by 2002:a17:902:ccce:b0:215:8809:b3b7 with SMTP id d9443c01a7336-22a8a04593emr212605315ad.7.1744088608555;
        Mon, 07 Apr 2025 22:03:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGML8JrfPQSGP1sTXgAJbLiBC79RWpQvktKvDF6YE82nc5K0KhNIo0FYjrqKNMDpWPDe5wEjg==
X-Received: by 2002:a17:902:ccce:b0:215:8809:b3b7 with SMTP id d9443c01a7336-22a8a04593emr212604925ad.7.1744088608147;
        Mon, 07 Apr 2025 22:03:28 -0700 (PDT)
Received: from [192.168.68.55] ([180.233.125.65])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-229785c01b7sm90355785ad.96.2025.04.07.22.03.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Apr 2025 22:03:27 -0700 (PDT)
Message-ID: <005ccfb3-b616-4723-b039-b8a3d6fb10bc@redhat.com>
Date: Tue, 8 Apr 2025 15:03:19 +1000
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 17/45] arm64: RME: Handle realm enter/exit
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
 <20250213161426.102987-18-steven.price@arm.com>
 <80983793-5df7-4828-96e8-90540e7d9183@redhat.com>
 <95c06abf-591f-4dd0-b1fd-296b0d5ae924@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <95c06abf-591f-4dd0-b1fd-296b0d5ae924@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: hiR0Y41cuGJ0cHZzIrm-SgUiVG9Mqjw9HHppUe9OsgA_1744088609
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 4/8/25 2:34 AM, Steven Price wrote:
> On 04/03/2025 01:03, Gavin Shan wrote:
>> On 2/14/25 2:13 AM, Steven Price wrote:
>>> Entering a realm is done using a SMC call to the RMM. On exit the
>>> exit-codes need to be handled slightly differently to the normal KVM
>>> path so define our own functions for realm enter/exit and hook them
>>> in if the guest is a realm guest.
>>>
>>> Signed-off-by: Steven Price <steven.price@arm.com>
>>> ---
>>> Changes since v6:
>>>    * Use vcpu_err() rather than pr_err/kvm_err when there is an associated
>>>      vcpu to the error.
>>>    * Return -EFAULT for KVM_EXIT_MEMORY_FAULT as per the documentation for
>>>      this exit type.
>>>    * Split code handling a RIPAS change triggered by the guest to the
>>>      following patch.
>>> Changes since v5:
>>>    * For a RIPAS_CHANGE request from the guest perform the actual RIPAS
>>>      change on next entry rather than immediately on the exit. This allows
>>>      the VMM to 'reject' a RIPAS change by refusing to continue
>>>      scheduling.
>>> Changes since v4:
>>>    * Rename handle_rme_exit() to handle_rec_exit()
>>>    * Move the loop to copy registers into the REC enter structure from the
>>>      to rec_exit_handlers callbacks to kvm_rec_enter(). This fixes a bug
>>>      where the handler exits to user space and user space wants to modify
>>>      the GPRS.
>>>    * Some code rearrangement in rec_exit_ripas_change().
>>> Changes since v2:
>>>    * realm_set_ipa_state() now provides an output parameter for the
>>>      top_iap that was changed. Use this to signal the VMM with the correct
>>>      range that has been transitioned.
>>>    * Adapt to previous patch changes.
>>> ---
>>>    arch/arm64/include/asm/kvm_rme.h |   3 +
>>>    arch/arm64/kvm/Makefile          |   2 +-
>>>    arch/arm64/kvm/arm.c             |  19 +++-
>>>    arch/arm64/kvm/rme-exit.c        | 171 +++++++++++++++++++++++++++++++
>>>    arch/arm64/kvm/rme.c             |  19 ++++
>>>    5 files changed, 208 insertions(+), 6 deletions(-)
>>>    create mode 100644 arch/arm64/kvm/rme-exit.c
>>>
>>
>> With below nitpicks addressed:
>>
>> Reviewed-by: Gavin Shan <gshan@redhat.com>
>>
>> [...]
>>
>>> diff --git a/arch/arm64/kvm/rme-exit.c b/arch/arm64/kvm/rme-exit.c
>>> new file mode 100644
>>> index 000000000000..aae1adefe1a3
>>> --- /dev/null
>>> +++ b/arch/arm64/kvm/rme-exit.c
>>> @@ -0,0 +1,171 @@
>>> +// SPDX-License-Identifier: GPL-2.0-only
>>> +/*
>>> + * Copyright (C) 2023 ARM Ltd.
>>> + */
>>> +
>>> +#include <linux/kvm_host.h>
>>> +#include <kvm/arm_hypercalls.h>
>>> +#include <kvm/arm_psci.h>
>>> +
>>> +#include <asm/rmi_smc.h>
>>> +#include <asm/kvm_emulate.h>
>>> +#include <asm/kvm_rme.h>
>>> +#include <asm/kvm_mmu.h>
>>> +
>>> +typedef int (*exit_handler_fn)(struct kvm_vcpu *vcpu);
>>> +
>>
>> Duplicated to exit_handler_fn, defined in handle_exit.c, need move the
>> definition to header file.
> 
> While I get this is duplication, I'm a little reluctant to move it to a
> header file because this is completely internal to each C file (the
> xxx_exit_handler[] arrays are both static). If either side wants to e.g.
> add an extra argument there shouldn't be a requirement to reflect that
> change in the other.
> 
> Specifically I'm wondering if we're going to ever need to pass an RMI
> return status into the rme-exit callbacks at some point.
> 

Ok, thanks for explaining it in details. In that case, I think it's fine
to keep exit_handler_fn in rme-exit.c.

>>> +static int rec_exit_reason_notimpl(struct kvm_vcpu *vcpu)
>>> +{
>>> +    struct realm_rec *rec = &vcpu->arch.rec;
>>> +
>>> +    vcpu_err(vcpu, "Unhandled exit reason from realm (ESR: %#llx)\n",
>>> +         rec->run->exit.esr);
>>> +    return -ENXIO;
>>> +}
>>> +
>>> +static int rec_exit_sync_dabt(struct kvm_vcpu *vcpu)
>>> +{
>>> +    return kvm_handle_guest_abort(vcpu);
>>> +}
>>> +
>>> +static int rec_exit_sync_iabt(struct kvm_vcpu *vcpu)
>>> +{
>>> +    struct realm_rec *rec = &vcpu->arch.rec;
>>> +
>>> +    vcpu_err(vcpu, "Unhandled instruction abort (ESR: %#llx).\n",
>>> +         rec->run->exit.esr);
>>> +    return -ENXIO;
>>> +}
>>> +
>>> +static int rec_exit_sys_reg(struct kvm_vcpu *vcpu)
>>> +{
>>> +    struct realm_rec *rec = &vcpu->arch.rec;
>>> +    unsigned long esr = kvm_vcpu_get_esr(vcpu);
>>> +    int rt = kvm_vcpu_sys_get_rt(vcpu);
>>> +    bool is_write = !(esr & 1);
>>> +    int ret;
>>> +
>>> +    if (is_write)
>>> +        vcpu_set_reg(vcpu, rt, rec->run->exit.gprs[0]);
>>> +
>>> +    ret = kvm_handle_sys_reg(vcpu);
>>> +
>>> +    if (ret >= 0 && !is_write)
>>> +        rec->run->enter.gprs[0] = vcpu_get_reg(vcpu, rt);
>>> +
>>
>> Unncessary blank line and the conditon isn't completely correct:
>> kvm_handle_sys_reg()
>> should return 0 if the requested emulation fails, even it always returns
>> 1 for now.
> 
> It shouldn't matter, but like you say it's not technically the correct
> condition so I'll fix this up.
> 

Ok.

> Thanks,
> Steve
> 
>>      ret = kvm_handle_sys_reg(vcpu);
>>      if (ret > 0 && !is_write)
>>          rec->run->enter.gprs[0] = vcpu_get_reg(vcpu, rt);
>>
>>> +    return ret;
>>> +}
>>> +
>>

Thanks,
Gavin

