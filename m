Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4BE71F4264
	for <linux-coco@lists.linux.dev>; Tue,  4 Mar 2025 06:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741068199; cv=none; b=jHz1seaxg+t9YktcquDwEjRI1oUhXqkUeItkqO4yf7YLyq08XsofPY2u8gTA0HdZQUK7xmUJB5TPcYqt4FcTNtNQgndNhC8MNXWbLUkcQRbArzdmXM6/HduepLAxtc4PFZjRr+5tdxGJTnuDITmlqJPBE7JJw22qZ+ufuK0ZYCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741068199; c=relaxed/simple;
	bh=yzDD33Es1OjfbExLpccU0Xk3cqZvakHg4nxFLrMGGCw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DD8ob4t+PtkmKz+UHvhabeSMG9zFxGc0Q8LwASHKmV+EtiV4oJC4Kwm8aWPrDK5jCpTgIqoX4uYrReHvZ/mLjw0QA0FNrdwhaptPvTk2jK42pwq35e4f3ulzyTmNF9XHMfaniAuyLJXWuwBEbxZIYzcUMyfLWmZEVPhHYWQPFjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Dg1QdK/+; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Dg1QdK/+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741068196;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nYQ+hp2BxThyEpl72nHuJbwMjHhQjin3JtMynxdNsGU=;
	b=Dg1QdK/+3d+GieAnPr5xcSqZOxbnysApE4LDYBss2BN/u4rdE+KNhjS3dwyXb2McaruzdW
	qd/r6MKjeFD0SAjlwYl0IRELROEewAPKmYl8+Mv/YED9B620RowAzMGHCuxDWz0MGovtJP
	JuteqgaPE8svVy0ew5cGE/QTGtb36jI=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-32-VvmTEyjLPw-lIcv2lzOp4g-1; Tue, 04 Mar 2025 01:02:55 -0500
X-MC-Unique: VvmTEyjLPw-lIcv2lzOp4g-1
X-Mimecast-MFC-AGG-ID: VvmTEyjLPw-lIcv2lzOp4g_1741068174
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-22331df540aso158401645ad.1
        for <linux-coco@lists.linux.dev>; Mon, 03 Mar 2025 22:02:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741068174; x=1741672974;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nYQ+hp2BxThyEpl72nHuJbwMjHhQjin3JtMynxdNsGU=;
        b=u35SDcoMqtU0JJk+b1J6e+bVKwYty0zgkWslXrEjIdELnxEnM384+XRnnZKW/Afruw
         NN1ekfsmn6YxWeLrkeOqiFk8ujNWANJzwUVV8HFoOuKlQ+7xlOIpyIezY79nukN0Dxc5
         pmS08bMxhJRXHOdCTV6LLxUC1+YI71bzTrE3jYJkD0EuPrx3sliXDDXqGEgAV+7vJ4Fr
         o/xBrYD6GzkX1Bh5If4dc46KHu265L2PYbBXTJlsPMQBpI5BlLmfWr5ZoeZ3Z+ZHvGE9
         66yyue6MKm1hohtswozqFTiGXmpbfM+CZayf7qOlAkGd7HxNEclgEd6zELw2YjBfxRF5
         SlyQ==
X-Forwarded-Encrypted: i=1; AJvYcCWAPnXK3Uq1tvkQ84H6xHClT9hAAHvhhgVBYn26ynd2nRHW6INaclEZriY1RL4xYi5nUUrBxPK527r9@lists.linux.dev
X-Gm-Message-State: AOJu0YwOi+75yALq6i7NPzhJdj8sWbyXXuo5bPQ2F/VHF6v6ZKAxIbIc
	4uANd+kG95gFSaqFkPkRjZT0sz1oubQSXbNvfIa38J2QG9Otw3pwiltHnPCdhCEKHP20xSETTLM
	f6V0XWoY5RRLWHOF1soS8oHMZrYEsI7aFiw7xH0U+mRMIOaY8nogY7cOrf0Q=
X-Gm-Gg: ASbGncubYRqMdTakvAQPUouWrwGZ933MB4Yl+L/e6kRf724dJX9MQH3LJzJlMBGYko7
	fU9rKQcxX0u1JxoAnVISEJcJNnZmBcrvh6Asw4ABuk5f0+HfoNNedtURDtYG64BVuhXZ4buzFgq
	aEgElryht14ybPj6OSyNIpoWxtNTMc6kcSeR5y7ItozOom5/WvOyd2oEXzpXRIVk0zeNmANkymz
	jrxZsDuYhMCy55/RXKkDyykIocEXkzYfugg4fhyrsw7fPyaeTBe9qv8AvEeErekh0LJ36Dk37Kd
	G+B9QZprJYBhGPzAjQ==
X-Received: by 2002:a17:902:e84a:b0:220:c143:90a0 with SMTP id d9443c01a7336-223690e0257mr268865375ad.24.1741068174600;
        Mon, 03 Mar 2025 22:02:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF17jp+SvVB8oKouybsWd/JrJXK2VcB5np1hjZzRt0dKWL0IvRPywYjYwGiuuPFEXE57B3yZw==
X-Received: by 2002:a17:902:e84a:b0:220:c143:90a0 with SMTP id d9443c01a7336-223690e0257mr268864905ad.24.1741068174278;
        Mon, 03 Mar 2025 22:02:54 -0800 (PST)
Received: from [192.168.68.55] ([180.233.125.164])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2234fdb5b02sm87962675ad.0.2025.03.03.22.02.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Mar 2025 22:02:53 -0800 (PST)
Message-ID: <5587ca83-bb19-42ae-8297-676588502e5e@redhat.com>
Date: Tue, 4 Mar 2025 16:02:45 +1000
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 29/45] arm64: rme: Allow checking SVE on VM instance
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
References: <20250213161426.102987-1-steven.price@arm.com>
 <20250213161426.102987-30-steven.price@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20250213161426.102987-30-steven.price@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: rmn1cEu6-Nus2_bW4UX2nPp_hQC8rLGlbJGFFmBI1s8_1741068174
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/14/25 2:14 AM, Steven Price wrote:
> From: Suzuki K Poulose <suzuki.poulose@arm.com>
> 
> Given we have different types of VMs supported, check the
> support for SVE for the given instance of the VM to accurately
> report the status.
> 
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
>   arch/arm64/include/asm/kvm_rme.h | 2 ++
>   arch/arm64/kvm/arm.c             | 5 ++++-
>   arch/arm64/kvm/rme.c             | 5 +++++
>   3 files changed, 11 insertions(+), 1 deletion(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>

