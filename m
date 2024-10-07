Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 073C5EEBA
	for <linux-coco@lists.linux.dev>; Mon,  7 Oct 2024 23:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728344022; cv=none; b=mCRsOVQI/zs00H1HHFdc4NBWZ3tzlJ342lhe83te+qddNicTdDgC8joLbOWfmPvcrBx85a6dJh8zqXjOFiN1P61twkw+ATxCdW2i93HZZ1DOgatTfyietPKvLW2htd4DXQWba6lD88ShCD6wFipoT9DFOziJkbRncEzkKvIlI6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728344022; c=relaxed/simple;
	bh=MrDTR2RWvkLILCduhS7Qm7of3YNeohC1Y4ELsDjirfw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YhhNvK/gSBRjx6DoTtVB4caHX12ZC+rvvON33tdgi5MV+4v/2t1P3vQB0i20H4UZxhFlE3MqN29WLm6g7dmJXX+Fg4XcwxiM/zu3NcaPGSDMwm1UBCuXRNjUBs4l0PdIOczxzOB2cIeaC/ZUv/S7naKV6+NiL9F+hwvQheixrGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Qe86oudE; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Qe86oudE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1728344020;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oUAx6nXlr893COLcXh7JrWdAKfzazyJiQwKWV+hUdVA=;
	b=Qe86oudETuf+sfObPF9D+Yfvbyqv51Ch6OKTM0dUOxFJaiQbLo8KNuyioVMc3n/NJZdPp5
	ssAlQwkowOu9/LzQbk/N5GFkAhRKp8yvfMbfxewAlBzE1lnxPr3uVg6gOKYAB69XHRPeur
	9fE6QWCOOgbmZ8MqA41vKbOR2o6FpcU=
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-259-2ysYeJdcNM-e2uG0WfMM4g-1; Mon, 07 Oct 2024 19:33:39 -0400
X-MC-Unique: 2ysYeJdcNM-e2uG0WfMM4g-1
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-7163489149fso5808994a12.3
        for <linux-coco@lists.linux.dev>; Mon, 07 Oct 2024 16:33:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728344017; x=1728948817;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oUAx6nXlr893COLcXh7JrWdAKfzazyJiQwKWV+hUdVA=;
        b=FQQ+exMQavixzrqsd4YkC5FGZsim+UApP7ZB7eTLt+frf1KaDqERqTdeHTyhZVcrEP
         ZLYnZkjCEMmI4lnuN4DMJHfNEVpHlZVFfG3WTyYE+dro2TzjApfB2nkR5zgOAvp3fiC9
         2obZefDnlxoFD7NxcDDUPKd4FYiNIx2SZFkukVs2sD53mAW/UUZrzXitxkCvVGy1DNRA
         vo7ncYBmetCN0NeCZ8D9Wgfwh9q5qpTIqJw631/iibkWu35AH09tUpoBkCKAs6Zg1Fep
         UrNP1SM4ZIvcZPLFNh3r9PcZ/zl5Wdijj0nTE4QKnGJzla2GIkaMnshCSVXQRcqOX/LD
         1KIg==
X-Forwarded-Encrypted: i=1; AJvYcCWNVt4Oc5ndFZGZV42+PWI92YmVuLCyigLJTM113w/9kCHLn4bJ0uN98OzJqR/3ck4QRi9xGaVpulrp@lists.linux.dev
X-Gm-Message-State: AOJu0YyBHjsAHsJUbJalKA5H/8sqy37ANC99x+pu1mOIbwvGfPueMu70
	twAo4KG0gceHhMEzOKN+eIM5yI75h3GSFUzVfcZZrnGY0fTNP2Ioeecmr9FKa0RMikzsWhp9+dR
	GDmTlh6/1WHvVrfqNirx/Yuz64xnHcxmQemgOcfoOBGNHbSplgorf6CwbFqHl353eEUA=
X-Received: by 2002:a05:6a20:c707:b0:1d2:bbf2:4c0e with SMTP id adf61e73a8af0-1d6dfafbee2mr18065607637.43.1728344017614;
        Mon, 07 Oct 2024 16:33:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE3uOhYexO703NofjJ/K1+V6Z0EqfLIjrytFm7WskmOCohACxWBRCDtgqXpyOZ0bCoE9smNBQ==
X-Received: by 2002:a17:90b:302:b0:2d8:d098:4f31 with SMTP id 98e67ed59e1d1-2e1e626c06amr14188663a91.17.1728344006795;
        Mon, 07 Oct 2024 16:33:26 -0700 (PDT)
Received: from [192.168.68.54] ([103.210.27.132])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e1e85d93b1sm7767761a91.25.2024.10.07.16.33.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Oct 2024 16:33:26 -0700 (PDT)
Message-ID: <07d1c00d-fcdc-4121-a766-2eb0c149bb8d@redhat.com>
Date: Tue, 8 Oct 2024 09:33:17 +1000
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

> diff --git a/arch/arm64/include/asm/rsi.h b/arch/arm64/include/asm/rsi.h
> index e4c01796c618..acba065eb00e 100644
> --- a/arch/arm64/include/asm/rsi.h
> +++ b/arch/arm64/include/asm/rsi.h
> @@ -27,7 +27,7 @@ static inline int rsi_set_memory_range(phys_addr_t start, phys_addr_t end,
>   
>   	while (start != end) {
>   		ret = rsi_set_addr_range_state(start, end, state, flags, &top);
> -		if (WARN_ON(ret || top < start || top > end))
> +		if (ret || top < start || top > end)
>   			return -EINVAL;
>   		start = top;
>   	}

I think the changes belong to PATCH[02/11] :)

Thanks,
Gavin

