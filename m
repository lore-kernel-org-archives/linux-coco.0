Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A85679FD
	for <linux-coco@lists.linux.dev>; Tue,  8 Oct 2024 00:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728347481; cv=none; b=q+EWuEsjsqICL7ZgKZxojBvz6sWpqJXH6OWPU4yot7cVNxxTlVScp878HVhlDtbaMMUL9cRtKwhI9TgSWeJbW67H0iAf0p0zvor8JoVNSpe+5DaCFJDx8myY8inRenGeS86EOPYSfEGkR6ylzrUPhqJsUklCMqhMb5TyiPORkuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728347481; c=relaxed/simple;
	bh=tbchR47/dXjjE+PvPFck7xaGHnvKhi2I53EICNbpweQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lN0txMLTuB8XvHu0EcSGWdK1fr0wJ4DYWw49I8ZAz6dfI2WoQzMwPmAo0MspuPRYURKnMUIZKbiL1laGTpSkXzj3hBTOBCXyMlZS8wLrhthn6m2gUUah7YN9PGKCNgpt0hBTbmhnUHwsmoYNEcIpqMD0SnSTe3NkwkkgFKoBiEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=c3eIDp2S; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="c3eIDp2S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1728347478;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8CIn7L4t98gFCcpAeot65WzEAFvBmvmwmESlA16rbdY=;
	b=c3eIDp2SvIwRk1WQDK+dteyvrryqP6taGtVPy8iP0lI4dmSOKkv7ra1FyCbNtP5UlqdjSR
	q+IB/OI/TjR0EycLj9roX/ev0tx7drKWke592kzY812ujlvKZEOWwKbaPnB6YpeyqRPsD5
	a3AwJrITyq7NXsYHRb1sKIBUPJU3dhs=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-501-SlJrbpnKMsefPO_W4jiirw-1; Mon, 07 Oct 2024 20:31:17 -0400
X-MC-Unique: SlJrbpnKMsefPO_W4jiirw-1
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-2e08517d5afso4686866a91.1
        for <linux-coco@lists.linux.dev>; Mon, 07 Oct 2024 17:31:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728347477; x=1728952277;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8CIn7L4t98gFCcpAeot65WzEAFvBmvmwmESlA16rbdY=;
        b=dC8gMtuzhARbskgQKAKSThb1I8QsOXM5/WF1Ls1U1leUgKRbq/UHzvBE0W70RnwHYp
         4UrkngqcNVWxf+zEe8UBkakuFHdDhRa9CelAeLlbeDWeOxowQ99V8Exwg1XodBfFF5BL
         reWu2MD7GxGjB2aa8NWBzokG4dxETwocfI3jiGvhKbFAli1wVEAXwvHOrGHPdguMbvm3
         b7OasWhVcIZAQWG55q7H3kH4D/IkejGwdYEffH1r5M/a0QYxrqHSGPk1mU2VyQ4uFW6N
         e2CIExu8toplXBO5VT+uLM7qnDEVBsSFTx56xEuL49/Rib3gPlBR6P55vxumEXr9PNNb
         zmWg==
X-Forwarded-Encrypted: i=1; AJvYcCWEHvgMrfiqv5rz62wbEWM8bhECWdoFfOK7XIyWS+VpJgPu8GzfLW+QArjLsyierP0kZBKl/z27IUNj@lists.linux.dev
X-Gm-Message-State: AOJu0YxUcnQ8Ztqo/pdjqjSp3zRJ51KvcVV8DmCdKyuaw8V3nRR2I39e
	3AmaaqPFVs9WXZSdP/b8UNdxnTQvH/6ezL0CAnszQRtcnrSfnynT9Xnbr+rhOXEmA/BOiKJ5nCR
	Sk/D68ve0v4srH1POaRClbAk62R/Z7eQYPeVUBK4ksUCdujI6Uh9kGC00Wrc=
X-Received: by 2002:a17:90a:db8d:b0:2d8:9fbe:6727 with SMTP id 98e67ed59e1d1-2e27dd46589mr2313519a91.4.1728347476905;
        Mon, 07 Oct 2024 17:31:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE5g/BMfTrnv3FT9lAmYAR1aeLFXOfl3JqwydJK0b/zrgK05aYoww94UM4wvonucrKKC1IEwA==
X-Received: by 2002:a17:90a:db8d:b0:2d8:9fbe:6727 with SMTP id 98e67ed59e1d1-2e27dd46589mr2313484a91.4.1728347476546;
        Mon, 07 Oct 2024 17:31:16 -0700 (PDT)
Received: from [192.168.68.54] ([103.210.27.132])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e20aebf399sm6231462a91.17.2024.10.07.17.31.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Oct 2024 17:31:15 -0700 (PDT)
Message-ID: <e21481a9-3e36-4a5d-9428-0f5ef8083676@redhat.com>
Date: Tue, 8 Oct 2024 10:31:06 +1000
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 05/11] arm64: rsi: Map unprotected MMIO as decrypted
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
 <20241004144307.66199-6-steven.price@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20241004144307.66199-6-steven.price@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/5/24 12:43 AM, Steven Price wrote:
> From: Suzuki K Poulose <suzuki.poulose@arm.com>
> 
> Instead of marking every MMIO as shared, check if the given region is
> "Protected" and apply the permissions accordingly.
> 
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
> New patch for v5
> ---
>   arch/arm64/kernel/rsi.c | 15 +++++++++++++++
>   1 file changed, 15 insertions(+)
> 

With the following potential issue addressed:

Reviewed-by: Gavin Shan <gshan@redhat.com>

> diff --git a/arch/arm64/kernel/rsi.c b/arch/arm64/kernel/rsi.c
> index d7bba4cee627..f1add76f89ce 100644
> --- a/arch/arm64/kernel/rsi.c
> +++ b/arch/arm64/kernel/rsi.c
> @@ -6,6 +6,8 @@
>   #include <linux/jump_label.h>
>   #include <linux/memblock.h>
>   #include <linux/psci.h>
> +
> +#include <asm/io.h>
>   #include <asm/rsi.h>
>   
>   struct realm_config config;
> @@ -92,6 +94,16 @@ bool arm64_is_protected_mmio(phys_addr_t base, size_t size)
>   }
>   EXPORT_SYMBOL(arm64_is_protected_mmio);
>   
> +static int realm_ioremap_hook(phys_addr_t phys, size_t size, pgprot_t *prot)
> +{
> +	if (arm64_is_protected_mmio(phys, size))
> +		*prot = pgprot_encrypted(*prot);
> +	else
> +		*prot = pgprot_decrypted(*prot);
> +
> +	return 0;
> +}
> +

We probably need arm64_is_mmio_private() here, meaning arm64_is_protected_mmio() isn't
sufficient to avoid invoking SMCCC call SMC_RSI_IPA_STATE_GET in a regular guest where
realm capability isn't present.

>   void __init arm64_rsi_init(void)
>   {
>   	if (arm_smccc_1_1_get_conduit() != SMCCC_CONDUIT_SMC)
> @@ -102,6 +114,9 @@ void __init arm64_rsi_init(void)
>   		return;
>   	prot_ns_shared = BIT(config.ipa_bits - 1);
>   
> +	if (arm64_ioremap_prot_hook_register(realm_ioremap_hook))
> +		return;
> +
>   	arm64_rsi_setup_memory();
>   
>   	static_branch_enable(&rsi_present);

Thanks,
Gavin

