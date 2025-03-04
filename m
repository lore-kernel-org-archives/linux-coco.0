Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F03F126C03
	for <linux-coco@lists.linux.dev>; Tue,  4 Mar 2025 01:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741050221; cv=none; b=Nw86S+5lKKKxiIdWQ4+HmDp1s5aHStrPGhJnzBaZO9+zZBlcvkCt1MQtISkoWnzMRPop3mcJFVM2g3zfAsyMFEme6FKrDO4z/TqWSJNe3HTkO+2MM9FJBYEPiukp/UkNIcQf5vjai6/smke2vSMH4NRqgD0nNUoD1OfSYRqkeCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741050221; c=relaxed/simple;
	bh=X7vkqyMBNaheIUNkehORS3JSEiBfbHm+bdTobACrNNs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tAsJljPqzrD804/0/AN+dRjQqTdCv7fd0tUy1ubuHvnYp7MPENBGywi594njwGu9vpZd55yyn8WnXNvE4d15Y292Bbrmn/czwWexpkW7E7Kdik+2FpOx3WDS5qDZKmkvokYaNtuy3KlgYqKhaCCWAFfZ17LmamOL1jC1qUe4Tt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hletjzvA; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hletjzvA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741050219;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bnm2BczQeE+oTxQUkTu0mGWgYbP3KRiI/EZBYxWyGBw=;
	b=hletjzvA9q1YIVawpFfLTYWUC4V9U0xp3ClRrqjoDHJf7W6qJcMW/Q7jiinmOF2NduyjJk
	RaxR+tz87mIiRvM+Fpb38m4y3mwoRzYW2B1VcgDnjQCoc7C8NawRj/qjFu6XJBDA7dh8LQ
	rS1hgerFFPZP6Z9TxTjUn0WrIwRRx2I=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-460-aWhWki5mMQyCl_BFq0L3ng-1; Mon, 03 Mar 2025 20:03:33 -0500
X-MC-Unique: aWhWki5mMQyCl_BFq0L3ng-1
X-Mimecast-MFC-AGG-ID: aWhWki5mMQyCl_BFq0L3ng_1741050212
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-2fe8c5dbdb0so9873890a91.3
        for <linux-coco@lists.linux.dev>; Mon, 03 Mar 2025 17:03:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741050212; x=1741655012;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bnm2BczQeE+oTxQUkTu0mGWgYbP3KRiI/EZBYxWyGBw=;
        b=I9QcMPGVfU877jr3N54pLvBQ/zWwNXZ1HFp+sUEuhqEMnFcMg2yNTJMN7xhvGDThI7
         0e3fYVaBOaHsn41ce3d9ZXkWcMj732MsxJlzDEmRu9AUv55OyJqUDXlIzGYGQ5ekb4WD
         1lV4tE5shq/1xnDwGs9LoPmbFowrCRhmU2L1JbyoSaOj4DB593eS2SVcxZL10va/lDPD
         4LS4mSt2X09HFMot5yIFLZfmb5f/XoV0PRQc6eI3vf+J5rcUn02NyFz5ARgpfzdw0E+T
         tROgD+iTBxTKShphy60lMCDXAbCm3vK9vMufMP5oH2xoY3NtGekzU1miHzhCzSeER//X
         JKmA==
X-Forwarded-Encrypted: i=1; AJvYcCVcW36A1E0LpuE9ZXZK5ttyu5UTiuWnCg+aztBU8OjLiFIH+Gm0yD9Ox75OUnlMIfNrrO3GsyDMVhz3@lists.linux.dev
X-Gm-Message-State: AOJu0YxMJGVu40Uy4DycyN3aU8OLO7htqfBu1LUdOY+5eyyOFbO5kMph
	KrM4cHjWYodswbhWtuWbous8p5MyajB1Dlw2KsoP89DLi7Nh5Xw0/GR9oq7d3mDaZgg/A/T3/NC
	UkK5bHq2+tGtdwSxMFm40WrqoNfz0W+N+NDpm0zX8FZL6vw7YdC0qUj/mEK4=
X-Gm-Gg: ASbGncuXWbbYAqIPgJsICcFzXu4ZwqzxdAKiEVT824eFqfJR0B4Cpg7DlKlts2OhKbR
	OYUvK6RRW7fTQTP6SqDrW8FwrpSKVCUtVT3dCpHp9/wGgRWoAxfQXrDCbSKF0RxgoND3Urq3QS5
	8Elscky1/7yjaDa10o+RJghXW8zZyT2Sa7tdFGwdaYI50y33OxFWeghyGyU4NlsHzoSGe/S4p28
	d8TKBGwqMKBRS9x55G1SCo433QQOSbM98Pegtn2kzjRlJcI0eQsNETsmAHuVRzjRDxxl29Qw8w/
	ACt9iYlEFpQ0vJkReQ==
X-Received: by 2002:a05:6a20:1594:b0:1ee:650b:ac22 with SMTP id adf61e73a8af0-1f2f4e4c8e2mr29503589637.40.1741050211913;
        Mon, 03 Mar 2025 17:03:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEh6O0/XBxWNy8f6zQpOsX8TWQ/teZrvIDTKOnq0U3+AlSWoqSQsK295l3GALc1XNoc+vUz9w==
X-Received: by 2002:a05:6a20:1594:b0:1ee:650b:ac22 with SMTP id adf61e73a8af0-1f2f4e4c8e2mr29503541637.40.1741050211560;
        Mon, 03 Mar 2025 17:03:31 -0800 (PST)
Received: from [192.168.68.55] ([180.233.125.164])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-aee7ddf2444sm9001374a12.3.2025.03.03.17.03.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Mar 2025 17:03:30 -0800 (PST)
Message-ID: <80983793-5df7-4828-96e8-90540e7d9183@redhat.com>
Date: Tue, 4 Mar 2025 11:03:21 +1000
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
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20250213161426.102987-18-steven.price@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: HfIuDI_GgZr3CmYWCbmvlokad9dXE0gzSe6s2fiGvWc_1741050212
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/14/25 2:13 AM, Steven Price wrote:
> Entering a realm is done using a SMC call to the RMM. On exit the
> exit-codes need to be handled slightly differently to the normal KVM
> path so define our own functions for realm enter/exit and hook them
> in if the guest is a realm guest.
> 
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
> Changes since v6:
>   * Use vcpu_err() rather than pr_err/kvm_err when there is an associated
>     vcpu to the error.
>   * Return -EFAULT for KVM_EXIT_MEMORY_FAULT as per the documentation for
>     this exit type.
>   * Split code handling a RIPAS change triggered by the guest to the
>     following patch.
> Changes since v5:
>   * For a RIPAS_CHANGE request from the guest perform the actual RIPAS
>     change on next entry rather than immediately on the exit. This allows
>     the VMM to 'reject' a RIPAS change by refusing to continue
>     scheduling.
> Changes since v4:
>   * Rename handle_rme_exit() to handle_rec_exit()
>   * Move the loop to copy registers into the REC enter structure from the
>     to rec_exit_handlers callbacks to kvm_rec_enter(). This fixes a bug
>     where the handler exits to user space and user space wants to modify
>     the GPRS.
>   * Some code rearrangement in rec_exit_ripas_change().
> Changes since v2:
>   * realm_set_ipa_state() now provides an output parameter for the
>     top_iap that was changed. Use this to signal the VMM with the correct
>     range that has been transitioned.
>   * Adapt to previous patch changes.
> ---
>   arch/arm64/include/asm/kvm_rme.h |   3 +
>   arch/arm64/kvm/Makefile          |   2 +-
>   arch/arm64/kvm/arm.c             |  19 +++-
>   arch/arm64/kvm/rme-exit.c        | 171 +++++++++++++++++++++++++++++++
>   arch/arm64/kvm/rme.c             |  19 ++++
>   5 files changed, 208 insertions(+), 6 deletions(-)
>   create mode 100644 arch/arm64/kvm/rme-exit.c
> 

With below nitpicks addressed:

Reviewed-by: Gavin Shan <gshan@redhat.com>

[...]

> diff --git a/arch/arm64/kvm/rme-exit.c b/arch/arm64/kvm/rme-exit.c
> new file mode 100644
> index 000000000000..aae1adefe1a3
> --- /dev/null
> +++ b/arch/arm64/kvm/rme-exit.c
> @@ -0,0 +1,171 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2023 ARM Ltd.
> + */
> +
> +#include <linux/kvm_host.h>
> +#include <kvm/arm_hypercalls.h>
> +#include <kvm/arm_psci.h>
> +
> +#include <asm/rmi_smc.h>
> +#include <asm/kvm_emulate.h>
> +#include <asm/kvm_rme.h>
> +#include <asm/kvm_mmu.h>
> +
> +typedef int (*exit_handler_fn)(struct kvm_vcpu *vcpu);
> +

Duplicated to exit_handler_fn, defined in handle_exit.c, need move the
definition to header file.

> +static int rec_exit_reason_notimpl(struct kvm_vcpu *vcpu)
> +{
> +	struct realm_rec *rec = &vcpu->arch.rec;
> +
> +	vcpu_err(vcpu, "Unhandled exit reason from realm (ESR: %#llx)\n",
> +		 rec->run->exit.esr);
> +	return -ENXIO;
> +}
> +
> +static int rec_exit_sync_dabt(struct kvm_vcpu *vcpu)
> +{
> +	return kvm_handle_guest_abort(vcpu);
> +}
> +
> +static int rec_exit_sync_iabt(struct kvm_vcpu *vcpu)
> +{
> +	struct realm_rec *rec = &vcpu->arch.rec;
> +
> +	vcpu_err(vcpu, "Unhandled instruction abort (ESR: %#llx).\n",
> +		 rec->run->exit.esr);
> +	return -ENXIO;
> +}
> +
> +static int rec_exit_sys_reg(struct kvm_vcpu *vcpu)
> +{
> +	struct realm_rec *rec = &vcpu->arch.rec;
> +	unsigned long esr = kvm_vcpu_get_esr(vcpu);
> +	int rt = kvm_vcpu_sys_get_rt(vcpu);
> +	bool is_write = !(esr & 1);
> +	int ret;
> +
> +	if (is_write)
> +		vcpu_set_reg(vcpu, rt, rec->run->exit.gprs[0]);
> +
> +	ret = kvm_handle_sys_reg(vcpu);
> +
> +	if (ret >= 0 && !is_write)
> +		rec->run->enter.gprs[0] = vcpu_get_reg(vcpu, rt);
> +

Unncessary blank line and the conditon isn't completely correct: kvm_handle_sys_reg()
should return 0 if the requested emulation fails, even it always returns 1 for now.

	ret = kvm_handle_sys_reg(vcpu);
	if (ret > 0 && !is_write)
		rec->run->enter.gprs[0] = vcpu_get_reg(vcpu, rt);

> +	return ret;
> +}
> +

[...]

Thanks,
Gavin

