Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0F11172BB9
	for <linux-coco@lists.linux.dev>; Tue, 15 Oct 2024 03:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728964572; cv=none; b=sbKhlQkgyxP40BD71CE1uIqSkxSQ9P2cHd+gvAasmu+XXmgq9PZRUb10gf8meeyLzGwH4d8XbdrevKPVO+h/vi6tMevToBe7hrkDcpoHan2YKZDoN+0x8ngqVZaDrkO7ZYIGOy/7qiAgoYBgzV5EVMu59VCmFwFOx/9sV9qSRZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728964572; c=relaxed/simple;
	bh=MgtyB/AAROrtxH1XraK2lYAW3vbCsCYiprQHNQSY0ag=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kVS1kU4TkGnpAX+6hWSPfHXAprk6CKQBMWKcVkhbmr2W2kd8rJW4ENHEpQFVrniHtRXccLdQYMdUnyHbHKLiCLYeoqvii0o8yuolKZCXk2mdNjk1FDjImrH9/isb+ePnmneH2U+rKbXcTe+OV+JnaPpNajIOsKq+URZqYyVGj1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FcqLoKGo; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FcqLoKGo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1728964569;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/gQj7yhKGwHX3tay3bEUPL2aqsF2Bb60CY1YisKDKbg=;
	b=FcqLoKGoNl+x90sZU/+prbL9oXBlyyJDvugCNuPbGeuhTosFUc6xRzbYtOzD9KUOCDoChU
	81Njh09lUqGKJgTZjr4lXjEEXM+fyTu5O8aAlmrrOHiz2xaUeUUAQfMg/4C7ypoHAFNqx4
	Ml9xypt30jSaRq1sjAtH0j12t+IwmF8=
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-411-J0UiS9n_PlGOyluXqGselw-1; Mon, 14 Oct 2024 23:56:07 -0400
X-MC-Unique: J0UiS9n_PlGOyluXqGselw-1
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-7db8197d431so6600426a12.0
        for <linux-coco@lists.linux.dev>; Mon, 14 Oct 2024 20:56:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728964563; x=1729569363;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/gQj7yhKGwHX3tay3bEUPL2aqsF2Bb60CY1YisKDKbg=;
        b=uUK6o7+LQJ80MBJeRAH0hmW4XvqaCY0YOZM7vdwZMVODx5Le5rz5138PsNnv1FelRK
         ACUIFMkQ++coDn6iT5DRe0kL5dNiiVZWEmx5HVWxBuLVHLKD6GInQJcg9+dmdYSef42w
         ifV7BNNW67W83mP7buYG6S0UKZnUeLTz2Q1565vkhNR+DYUR/OqidiiYCxuv71BMc6CE
         8SYq1Lu56YXoWmjbBjmCqmdQ3mOQZO9aF9xPtDa54Z2790yNlzojSTZhiYEQqQDUbDMB
         qzRDz5ohCz7GxqV2HH2ro2vnPVHR84j4nL5U+ak4HpP/ru2BFeaxC0W1VWXkomrnJuw1
         xKBg==
X-Forwarded-Encrypted: i=1; AJvYcCXgUpQ1GLHK5gkSsYyJwVKn3G/hJs0QMdy/RdbhMuxQ6pM2FXP6J/5hsMLnAn9mvIuVHyyI6EwTXtjP@lists.linux.dev
X-Gm-Message-State: AOJu0YyPJR1K4anyba/E82HVTL2w2I2duf5EKG2d95SuMJJYOrOmeEIO
	3Is6td2nkyi5UsBdxJpryD9BwD+vrHp54lJjnzOR1HbFatW1WnwuarF50qIy0E+3GjgxPqY9ikD
	M/F8c1XCsilDbZ4cbyWy0dsecxb5jQVFiHB8NoNKJwdqe1muZtKG+fNgyK1c=
X-Received: by 2002:a05:6a21:4d8c:b0:1d8:f894:43f9 with SMTP id adf61e73a8af0-1d8f89445eamr681090637.11.1728964563169;
        Mon, 14 Oct 2024 20:56:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGybMblrnhP5WbRv8pGItZKUwHcNnS++KdeQ7wfVC+XkNBJwpsFwHEmwrwG693wjo55GOXWsQ==
X-Received: by 2002:a05:6a21:4d8c:b0:1d8:f894:43f9 with SMTP id adf61e73a8af0-1d8f89445eamr681045637.11.1728964562725;
        Mon, 14 Oct 2024 20:56:02 -0700 (PDT)
Received: from [192.168.68.54] ([180.233.125.129])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7ea9c6ba2d4sm339896a12.11.2024.10.14.20.55.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Oct 2024 20:56:02 -0700 (PDT)
Message-ID: <2352629a-3742-45e9-a38f-196989918c9b@redhat.com>
Date: Tue, 15 Oct 2024 13:55:53 +1000
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 03/11] arm64: realm: Query IPA size from the RMM
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
References: <20241004144307.66199-1-steven.price@arm.com>
 <20241004144307.66199-4-steven.price@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20241004144307.66199-4-steven.price@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/5/24 12:42 AM, Steven Price wrote:
> The top bit of the configured IPA size is used as an attribute to
> control whether the address is protected or shared. Query the
> configuration from the RMM to assertain which bit this is.
> 
> Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
> Reviewed-by: Gavin Shan <gshan@redhat.com>
> Co-developed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
> Changes since v4:
>   * Make PROT_NS_SHARED check is_realm_world() to reduce impact on
>     non-CCA systems.
> Changes since v2:
>   * Drop unneeded extra brackets from PROT_NS_SHARED.
>   * Drop the explicit alignment from 'config' as struct realm_config now
>     specifies the alignment.
> ---
>   arch/arm64/include/asm/pgtable-prot.h | 4 ++++
>   arch/arm64/include/asm/rsi.h          | 2 +-
>   arch/arm64/kernel/rsi.c               | 8 ++++++++
>   3 files changed, 13 insertions(+), 1 deletion(-)
> 

[...]

> diff --git a/arch/arm64/kernel/rsi.c b/arch/arm64/kernel/rsi.c
> index 9bf757b4b00c..a6495a64d9bb 100644
> --- a/arch/arm64/kernel/rsi.c
> +++ b/arch/arm64/kernel/rsi.c
> @@ -8,6 +8,11 @@
>   #include <linux/psci.h>
>   #include <asm/rsi.h>
>   
> +struct realm_config config;
> +

Nit: I think this variable is file-scoped since it has a generic name.
In this case, 'static' is needed to match with the scope.

> +unsigned long prot_ns_shared;
> +EXPORT_SYMBOL(prot_ns_shared);
> +
>   DEFINE_STATIC_KEY_FALSE_RO(rsi_present);
>   EXPORT_SYMBOL(rsi_present);
>   
> @@ -67,6 +72,9 @@ void __init arm64_rsi_init(void)
>   		return;
>   	if (!rsi_version_matches())
>   		return;
> +	if (WARN_ON(rsi_get_realm_config(&config)))
> +		return;
> +	prot_ns_shared = BIT(config.ipa_bits - 1);
>   
>   	arm64_rsi_setup_memory();
>   

Thanks,
Gavin

