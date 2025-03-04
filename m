Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D5EF8837
	for <linux-coco@lists.linux.dev>; Tue,  4 Mar 2025 05:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741066731; cv=none; b=KKeIoi7sI6o0i+sQ+PurflLdx10hk0DpByhBhcflBp7JNrFokzKueeCaFLDBDCxQRW9kGqJq3Uyb7/v6YsZh2fIFzkdnsA9XfArJCiFiO+zSj4vbl2Cp8vVIZG5OaTKcs7plio3Qj/fu6MgYCjmTao9DjeAKzR8Z1M7YTvanPmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741066731; c=relaxed/simple;
	bh=bq1rEvMgUCO+z9mqMh3toWqnhddFvqq5Jt040KPfC+8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u32X5I1xDtUr32peVRdv4yxpMazvBv/o273arlJOrnLpUPsyLlnZcgoeaUAXAzRszYXBkasynf2AlOOK3iVCgiHactNMfaKVhV/bgxeyu4h8EHcHx8gnQjEOddowA6Tqupi8VFUWValGaPidS8R9aOLBqxNj6GBtuk6CjNvXvHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gzlxiAK9; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gzlxiAK9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741066729;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rhnvguDUl9b0lKjHpwaAt3YEx23OG5Tvc8nGcNEISp4=;
	b=gzlxiAK9RV/b+N3lo8EvEqs6UxqLfIdBIosqoj6ZfCFN8bfpyTQ7bnhIKnhL5/G/2UCK2n
	xcDKeqQrTZSVeYM8MGNJryDyN08dTRz/aW1Bx96h0NqbQNqnowBNTeax9EdDnVm43/c+a1
	pI5C/cx9GMXTXttzMHtYK6RQPQyo6Pw=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-193-rn3bV6f0MneKlLCVLUDrWw-1; Tue, 04 Mar 2025 00:38:37 -0500
X-MC-Unique: rn3bV6f0MneKlLCVLUDrWw-1
X-Mimecast-MFC-AGG-ID: rn3bV6f0MneKlLCVLUDrWw_1741066717
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-2feb47c6757so8528067a91.3
        for <linux-coco@lists.linux.dev>; Mon, 03 Mar 2025 21:38:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741066717; x=1741671517;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rhnvguDUl9b0lKjHpwaAt3YEx23OG5Tvc8nGcNEISp4=;
        b=Wlrv2ym2zUl58A/YYvDKK8s1F7jpbqWyyQ+Z8Wmhmmdy6BvxnHx/0s91DIgoau2xbE
         1OKq0QuNABvd9CnFAaBuBLi3c3ICMy+ffRkZsNrmjxYfrP06kn4YL9S4uoQ9thQMDgWe
         JdNVYYoodTgQePeVDvfmhe9S6VyFWfv07i00QrjQfjnRsCHXxnUy8WN3gepRXN2QTz70
         ZUMECC5sqmAxK9I4Q4KakostWuFudgASK11GhNb2v1MjD27xlDSW+6tstQugxFMYBhMw
         /rxgzkcKQ+xE5kKoYJZrSL1EFpve6OpcLxEYM/gvqfafv9e+F9WEBN0P25mBfQ0WUGvq
         GDAQ==
X-Forwarded-Encrypted: i=1; AJvYcCXFLxBsok0KCnpfqmYpZDOxf4NWxu44UMAMbKoBJl8Z1uSSUrOBwxJHqhM4osLIiWYOB2SwIVlP6jkq@lists.linux.dev
X-Gm-Message-State: AOJu0YzIk7tZcSvlWlid8MR2r1kpDrtAybSQvk2fzFBoClOdNnQr3KeU
	7K+M2hK2Wc/+xcKdV/DDD3fB/DeC9nS61tKA2YfsaJhNxG+ug0B4zTM8r6ElgSErLPRgibZQ5il
	lV07svgGpClzrKKDAzx4J9PLIsOTpA9czgjXX8RU2u6ncQa/mnW4X6qxzhxY=
X-Gm-Gg: ASbGnctBIwle+PY2hMfi8Cz6AfSXsr3ZauMnkKhc4vc7VvA1aooontA2GYixSQyIyTd
	B99+olyQPPBa1xVoqhHjhnK+KTxbUpnbb2g/uR5r6w5HBSNAva2DzbemurKiWWosnalqWzDzbKJ
	ht1SbxVXEZ9k0UjKQQ+ZVx6tc9I6HEQh9cO0AeXt9APnw4N6oyLkwboNcC4ZOMKb8MN9npUXb9q
	ZgDRTbcQMHLFKaw3+5aqlNavgVTv+4n8rwfx+KMkmVNNWOYPyP0Vht8GtsJvKxA2XU4yASR6EEx
	EBnCzvD09NX11KOjZQ==
X-Received: by 2002:a17:90b:2f8d:b0:2fa:228d:5af2 with SMTP id 98e67ed59e1d1-2febab6c68emr25331694a91.15.1741066716884;
        Mon, 03 Mar 2025 21:38:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF612ZxdojGbx89Aqh0mhvbM65hIZPcepIXHF98wxNJcpuaTGS26LwyEfOvsNmDG1/FgXRbOg==
X-Received: by 2002:a17:90b:2f8d:b0:2fa:228d:5af2 with SMTP id 98e67ed59e1d1-2febab6c68emr25331658a91.15.1741066716552;
        Mon, 03 Mar 2025 21:38:36 -0800 (PST)
Received: from [192.168.68.55] ([180.233.125.164])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2235050d7c1sm87354825ad.198.2025.03.03.21.38.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Mar 2025 21:38:35 -0800 (PST)
Message-ID: <5008db08-c153-48c0-90b3-39fa0297ba1e@redhat.com>
Date: Tue, 4 Mar 2025 15:38:27 +1000
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 24/45] KVM: arm64: Handle Realm PSCI requests
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
 <20250213161426.102987-25-steven.price@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20250213161426.102987-25-steven.price@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: -Mug5xVbKInB1bpxK2TVsCS-LqFUD8Yyps5HoxMD-3o_1741066717
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/14/25 2:14 AM, Steven Price wrote:
> The RMM needs to be informed of the target REC when a PSCI call is made
> with an MPIDR argument. Expose an ioctl to the userspace in case the PSCI
> is handled by it.
> 
> Co-developed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
> Changes since v6:
>   * Use vcpu_is_rec() rather than kvm_is_realm(vcpu->kvm).
>   * Minor renaming/formatting fixes.
> ---
>   arch/arm64/include/asm/kvm_rme.h |  3 +++
>   arch/arm64/kvm/arm.c             | 25 +++++++++++++++++++++++++
>   arch/arm64/kvm/psci.c            | 30 ++++++++++++++++++++++++++++++
>   arch/arm64/kvm/rme.c             | 14 ++++++++++++++
>   4 files changed, 72 insertions(+)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>

