Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4524426C3BF
	for <linux-coco@lists.linux.dev>; Wed, 17 Sep 2025 03:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758081427; cv=none; b=usJg9qvd8qlGewo4SSQRuLM0QtgPmCEGk7sO3eSp4pvHK/275LfinPMZTgqZcEfHtPrG2mZtBRgU7sPALsT/BDVvI3fx2w1ywtGMzk27/5WFz4B6Srkfx/5aD6vWgs7ERY0otzDF4pnzw7pdJ/eRtFy/KqCUGE4m4X1W/+MhyX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758081427; c=relaxed/simple;
	bh=BK2vt+oVFag+vs2ay9fYOX68fPEFL7tR8PLO+nSyEB8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B+mJiY02+rPbyDQpK48E4UULyHRvebWAaUuGnrhiuE34KwKVC0Ao5zkSwvqQ5P39z9GbC12R/yFkRWpDiX/oZyIsxYnsRYpRSXhCaKo6DGjkawzehXpXMC2Bt5ZUETJ1KgZqOHCzT7suXb5mUMceYaHX+dfvBxNK/HgIttSNrfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Q5mMTb8o; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Q5mMTb8o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1758081425;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XTGV/Lpx58Ur4YHkEVEE/DLD/lQA5hgEBF0FsirS0AA=;
	b=Q5mMTb8o5tAQu1gUCc+kS4QOA9+ygq5Dp/d2t6kxaKfUR4vIGNVFyIDlwYl1I5Ah/nG+c/
	pyUkrU74gvZoEb8MkGkP3kWcMnWq/meMrICFf731QOO+tOLwUqcrlq6rE/+Z+QoaBJgmyb
	SQwBJ83Bfhqg6VfWFDIwCV6rNR7DKOE=
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-315-0DAFq2i4MJm_jSGDXwqndw-1; Tue, 16 Sep 2025 23:57:04 -0400
X-MC-Unique: 0DAFq2i4MJm_jSGDXwqndw-1
X-Mimecast-MFC-AGG-ID: 0DAFq2i4MJm_jSGDXwqndw_1758081422
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b52047b3f1dso8158158a12.2
        for <linux-coco@lists.linux.dev>; Tue, 16 Sep 2025 20:57:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758081422; x=1758686222;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XTGV/Lpx58Ur4YHkEVEE/DLD/lQA5hgEBF0FsirS0AA=;
        b=d3dMv/rZVpfElf6imLybUBTvHqI5dys4nJLS4IMlLOPxn4jR+FmSlieuR3OU+MV2C1
         8kl2oDCvsEZRU2wqDc73Wy1NGS6VondJjoHYlJYNJBcF3UXLZnMzU4WP9ksjnnKQ5BYU
         a5GsfArVT0jF5bGONgHvMlvX79e6KTjm7yIZy/5XUlcpUqK0JjyncoBE2U3Med+YI/k4
         AZgrSFZoTAWIFN9/0bbpSjkuD+MrB0rCNolGGMktQhf+XrKNUPNuOBW7V/+fNYHd8ChK
         M+EyYjfnIN4r7A6kgcZ/NMv3XFZr5qIS+EcPP+6E2XRVNHbGGYatuhWXMBKoJxD86fc+
         r0rA==
X-Forwarded-Encrypted: i=1; AJvYcCVRAFuntU9bIRjT8h3zQ1Pb7HgB3hd2iL8LU+Foz18f5DLq29uPndMiiMY35CapEyqLOPTHo6ZdMchC@lists.linux.dev
X-Gm-Message-State: AOJu0YwkLqoOwJ4FIQbPgE6t8mx6TUotM9qkDEysJmhnXHUFn/KrPsoq
	iBdXgKPk9iUGCfKYF/B6JLbNsWOjnhA6IPi1trLM6lBE+Efdz52Maq5FR6AKW1pSj0UQYPWhVUf
	VSWsCv4gB310ueHssvW+z6OsTJ1SueMTRaQhKZWO6d3WfpNfN7IMKfDPQwe03jAI=
X-Gm-Gg: ASbGncs9R+GoTSGiLnWv64jdsi4lUbPyO2LOHB3udFIp5AzlNlJBqDIzkissPQSC8hA
	kHqoowiQ87Opk2UWSL6eSu3fvdUqKhWC7AiEig0pvMoUWMy2RdaWxC9p3xPaXRxb6qZ0XbMgYs9
	XNVDpqzeVriGp+AYrDfEw4yM6DJlwDjr0+ztKnlwTxmvl0y85EvrknHbhUxg4qadORjejPEg95V
	ZJv3AV1I8bBQODksrwvSQr9KHgvh0x1Q97INdEKmbJhqjHq6mhMgxt4Yga47HBbIfxTM3RGT6Sa
	IldvZbbvaX0ZebQJaCW8jNXYpsJdBFmHMFkTsfHDhNytIfYhzzG51ko8+BiInI0k1n2HWK2P+RX
	flMzq
X-Received: by 2002:a05:6a20:430d:b0:252:f0b6:bde with SMTP id adf61e73a8af0-27aa2e9fe25mr909374637.24.1758081422423;
        Tue, 16 Sep 2025 20:57:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGMc2O27tB3E/QqyAooDB3y7jr/wt0/Bey9oUtK/NtFfEn70CrDz7Artb0At8viujU7do8N/g==
X-Received: by 2002:a05:6a20:430d:b0:252:f0b6:bde with SMTP id adf61e73a8af0-27aa2e9fe25mr909353637.24.1758081422069;
        Tue, 16 Sep 2025 20:57:02 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-62-5.mrk21.qld.optusnet.com.au. [175.34.62.5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77613e4308csm14709454b3a.73.2025.09.16.20.56.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Sep 2025 20:57:01 -0700 (PDT)
Message-ID: <4e618201-05dd-46e1-8ca8-3956dc738300@redhat.com>
Date: Wed, 17 Sep 2025 13:56:55 +1000
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: acpi: Enable ACPI CCEL support
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
 linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev,
 catalin.marinas@arm.com, will@kernel.org, aneesh.kumar@kernel.org,
 sami.mujawar@arm.com, sudeep.holla@arm.com, steven.price@arm.com
References: <20250908223519.1759020-1-suzuki.poulose@arm.com>
 <20250908223519.1759020-4-suzuki.poulose@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20250908223519.1759020-4-suzuki.poulose@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: DDvrP573av9KIf2HhjvJDPlbK3caQXTc7d5leXGtbxs_1758081422
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/9/25 8:35 AM, Suzuki K Poulose wrote:
> Add support for ACPI CCEL by handling the EfiACPIMemoryNVS type memory.
> As per UEFI specifications NVS memory is reserved for Firmware use even
> after exiting boot services. Thus map the region as read-only.
> 
> Cc: Sami Mujawar <sami.mujawar@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
> Cc: Steven Price <steven.price@arm.com>
> Cc: Sudeep Holla <sudeep.holla@arm.com>
> Cc: Gavin Shan <gshan@redhat.com>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> ---
> Changes since v1
>   - Map NVS region as read-only, update comment to clarify that the region
>     is reserved for firmware use.
> 
> ---
>   arch/arm64/kernel/acpi.c | 11 +++++++++++
>   1 file changed, 11 insertions(+)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>

