Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFE26EEBA
	for <linux-coco@lists.linux.dev>; Mon,  7 Oct 2024 23:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728343924; cv=none; b=SM1aY8CS7ISn022/XuOoX0FyFWitjQ3+iuGgG1bHE8cgFAcXbrTagkC7E3KyHEJpTqX8DQlPr7eG9PwjXIH54zEDF7b2V3VNoxTl88WdBSG1I2XD6O+ASP+GcTht2TIgNPb3rE0ppv9/W8BwQgDzso1qH6cKryp8wRQ9S1kZocg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728343924; c=relaxed/simple;
	bh=Ht1Yy0iypTEXR9ooaGcICtut0Uoo+ne0wlENoJN2QuA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZGN/lXuVTNXgZL64uRRg/i8xDHOnYwl0ZEG9WyzJj3xsoOfIGvix3EFfLp4jTsqcMocuOXMx0gDJPDVGG99viu+MEQ4/b8WxExu4DA28XtxZB8yJtWnXKzauGBKa2WFB33b8//p2TFR1aVYpKuKQZgD4gFYkVEanwr0/T4sPgOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dn2dUekK; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dn2dUekK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1728343920;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xn5VipfFAx/hyoeUIyAKV9cybG6lqWlq3DSCdiVR8XQ=;
	b=dn2dUekK/1P2lVovucHldZo3W1w63jD3QfYp72l/TPBuWKvtKFKGEuDlZxnQmwBB7571w3
	+PmWA9ypcuejOJgOaGvPrDZgLcbwFgrjUCh5Guos+/vaNWjKTMMLO7mWRBKK3ImXTdLbZ3
	BF93LxJDUM1YF05wprCeAUd9BNuRjHo=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-544-90FtsoRpPMuCcoNnnqGM1w-1; Mon, 07 Oct 2024 19:31:59 -0400
X-MC-Unique: 90FtsoRpPMuCcoNnnqGM1w-1
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-207510f3242so64680495ad.0
        for <linux-coco@lists.linux.dev>; Mon, 07 Oct 2024 16:31:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728343919; x=1728948719;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xn5VipfFAx/hyoeUIyAKV9cybG6lqWlq3DSCdiVR8XQ=;
        b=u+MhKw3E7Hs0CRD15ksmglYvr5mceA21NNicCXYX1IbUCPAcbv995hYUPk7sEdsn7H
         F729R8e6YUxm73KqBQ+dIvzfyyK5G5mJnVdbiKUZZpNuqAquEOb6Fq2J+QqXc31p8vF6
         edTIAP5heTCF4Kcddg2ofnvQ/3NiiL+Au3Qrfx17kBRVGhCbUlONrRi6jOBDQZ5+KQt6
         w+iX/XvEdvN7os56wWe16RvojoEf3HgfjD1u/wKRTvO5KmKUeYa3CG3J1s+ZKQnqwevt
         wnm4Sag80i6Xq3FxTdt3AvJK+IJHPXvgxk+JPtQ1H39rE2aXZGoaUAkePwtJRTqYP/rI
         MRRQ==
X-Forwarded-Encrypted: i=1; AJvYcCWwfSBxk5gt5nPTvvt4GIDDQnCI9BR+Waf4JGVCP9hMmOdAe5KBcuh+5UBUEkiQbzAzdvTYzMCgFsC2@lists.linux.dev
X-Gm-Message-State: AOJu0YwweGXM7jDLfF1vt4/IrmY4forJnj6GNaI6RhTIuOloM4is58kC
	FoIt2M9vovAhOpFTEAdJW4C1JqOgNO8SXSz/VpExFGA0G/DD4SOn/p3ChGez9dbRDOKiH+eziN3
	vJyiIrpxqpfC2KzMZoL8U8qPyMHKLXI2Jb0UibxVZ4jzu5i7qwxU7L4wpDkg=
X-Received: by 2002:a17:902:e94e:b0:20b:ce4e:b9e4 with SMTP id d9443c01a7336-20bfe044af6mr203338225ad.29.1728343918761;
        Mon, 07 Oct 2024 16:31:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG1W8ebPVGuqJ+AYS94dnhWBYhQJ4Y/2xEe8XcKTYkZf8a1TIxLuURCjOjtoXj9xhC2Yn9qpA==
X-Received: by 2002:a17:902:e94e:b0:20b:ce4e:b9e4 with SMTP id d9443c01a7336-20bfe044af6mr203337805ad.29.1728343918380;
        Mon, 07 Oct 2024 16:31:58 -0700 (PDT)
Received: from [192.168.68.54] ([103.210.27.132])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c1395dc41sm44463875ad.217.2024.10.07.16.31.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Oct 2024 16:31:57 -0700 (PDT)
Message-ID: <8a8ad27f-dc8f-4d44-bb35-67fd1133afbb@redhat.com>
Date: Tue, 8 Oct 2024 09:31:49 +1000
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 02/11] arm64: Detect if in a realm and set RIPAS RAM
To: Steven Price <steven.price@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>,
 Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>,
 Oliver Upton <oliver.upton@linux.dev>, Zenghui Yu <yuzenghui@huawei.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Joey Gouly <joey.gouly@arm.com>, Alexandru Elisei
 <alexandru.elisei@arm.com>, Christoffer Dall <christoffer.dall@arm.com>,
 Fuad Tabba <tabba@google.com>, linux-coco@lists.linux.dev,
 Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
 Shanker Donthineni <sdonthineni@nvidia.com>, Alper Gun
 <alpergun@google.com>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>
References: <20241004144307.66199-1-steven.price@arm.com>
 <20241004144307.66199-3-steven.price@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20241004144307.66199-3-steven.price@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/5/24 12:42 AM, Steven Price wrote:
> From: Suzuki K Poulose <suzuki.poulose@arm.com>
> 
> Detect that the VM is a realm guest by the presence of the RSI
> interface. This is done after PSCI has been initialised so that we can
> check the SMCCC conduit before making any RSI calls.
> 
> If in a realm then all memory needs to be marked as RIPAS RAM initially,
> the loader may or may not have done this for us. To be sure iterate over
> all RAM and mark it as such. Any failure is fatal as that implies the
> RAM regions passed to Linux are incorrect - which would mean failing
> later when attempting to access non-existent RAM.
> 
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> Co-developed-by: Steven Price <steven.price@arm.com>
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
> Changes since v5:
>   * Replace BUG_ON() with a panic() call that provides a message with the
>     memory range that couldn't be set to RIPAS_RAM.
>   * Move the call to arm64_rsi_init() later so that it is after PSCI,
>     this means we can use arm_smccc_1_1_get_conduit() to check if it is
>     safe to make RSI calls.
> Changes since v4:
>   * Minor tidy ups.
> Changes since v3:
>   * Provide safe/unsafe versions for converting memory to protected,
>     using the safer version only for the early boot.
>   * Use the new psci_early_test_conduit() function to avoid calling an
>     SMC if EL3 is not present (or not configured to handle an SMC).
> Changes since v2:
>   * Use DECLARE_STATIC_KEY_FALSE rather than "extern struct
>     static_key_false".
>   * Rename set_memory_range() to rsi_set_memory_range().
>   * Downgrade some BUG()s to WARN()s and handle the condition by
>     propagating up the stack. Comment the remaining case that ends in a
>     BUG() to explain why.
>   * Rely on the return from rsi_request_version() rather than checking
>     the version the RMM claims to support.
>   * Rename the generic sounding arm64_setup_memory() to
>     arm64_rsi_setup_memory() and move the call site to setup_arch().
> ---
>   arch/arm64/include/asm/rsi.h | 66 +++++++++++++++++++++++++++++++
>   arch/arm64/kernel/Makefile   |  3 +-
>   arch/arm64/kernel/rsi.c      | 75 ++++++++++++++++++++++++++++++++++++
>   arch/arm64/kernel/setup.c    |  3 ++
>   4 files changed, 146 insertions(+), 1 deletion(-)
>   create mode 100644 arch/arm64/include/asm/rsi.h
>   create mode 100644 arch/arm64/kernel/rsi.c
> 

Two nitpicks below.

Reviewed-by: Gavin Shan <gshan@redhat.com>

> diff --git a/arch/arm64/include/asm/rsi.h b/arch/arm64/include/asm/rsi.h
> new file mode 100644
> index 000000000000..e4c01796c618
> --- /dev/null
> +++ b/arch/arm64/include/asm/rsi.h
> @@ -0,0 +1,66 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (C) 2024 ARM Ltd.
> + */
> +
> +#ifndef __ASM_RSI_H_
> +#define __ASM_RSI_H_
> +
> +#include <linux/errno.h>
> +#include <linux/jump_label.h>
> +#include <asm/rsi_cmds.h>
> +
> +DECLARE_STATIC_KEY_FALSE(rsi_present);
> +
> +void __init arm64_rsi_init(void);
> +
> +static inline bool is_realm_world(void)
> +{
> +	return static_branch_unlikely(&rsi_present);
> +}
> +
> +static inline int rsi_set_memory_range(phys_addr_t start, phys_addr_t end,
> +				       enum ripas state, unsigned long flags)
> +{
> +	unsigned long ret;
> +	phys_addr_t top;
> +
> +	while (start != end) {
> +		ret = rsi_set_addr_range_state(start, end, state, flags, &top);
> +		if (WARN_ON(ret || top < start || top > end))
> +			return -EINVAL;
> +		start = top;
> +	}
> +
> +	return 0;
> +}
> +

The WARN_ON() is redundant when the caller is arm64_rsi_setup_memory(), where
system panic is invoked on any errors. So we perhaps need to drop the WARN_ON().

[...]

> +
> +static void __init arm64_rsi_setup_memory(void)
> +{
> +	u64 i;
> +	phys_addr_t start, end;
> +
> +	/*
> +	 * Iterate over the available memory ranges and convert the state to
> +	 * protected memory. We should take extra care to ensure that we DO NOT
> +	 * permit any "DESTROYED" pages to be converted to "RAM".
> +	 *
> +	 * panic() is used because if the attempt to switch the memory to
> +	 * protected has failed here, then future accesses to the memory are
> +	 * simply going to be reflected as a SEA (Synchronous External Abort)
> +	 * which we can't handle.  Bailing out early prevents the guest limping
> +	 * on and dying later.
> +	 */
> +	for_each_mem_range(i, &start, &end) {
> +		if (rsi_set_memory_range_protected_safe(start, end))
> +			panic("Failed to set memory range to protected: %pa-%pa",
> +			      &start, &end);
> +	}
> +}
> +

{} is needed since the panic statement spans multiple lines.

Thanks,
Gavin

