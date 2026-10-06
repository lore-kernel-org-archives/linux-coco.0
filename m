Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1A19296BB8
	for <linux-coco@lists.linux.dev>; Tue,  6 Oct 2026 03:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791258598; cv=none; b=u5ycGRBnv+BapXNAn72yp8mP9kO74aAQZVczLbWvwJaRIc0nUsR6nueaOoU51dVi7Q8Z0grZKJx6kcSfApKvIYQpckQgEW80YI2Z6P/wgcfDAkxKse3mPxWtrrwuqDMs7N3nxNnZ6U+LpVceygngbTddW/Ud1FQVOMKh5BcAFQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791258598; c=relaxed/simple;
	bh=9NW5It6o5eoUftkY9ls5gsc+2gvCsipwEhZuTUOLJ2o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=vEtuHdzSuSFn2qEl3d1tyM8wHW4b0UJapMYVyuwEl1wMKnQyAwuealPQBtj6k2ELCWHTBdp8nfE0dqjZAO30Toml04+6fQlyMFKdMWp61jZ8YSx/QOZncDoYAgez9E0QvQT8RKqYp7tk+K8+nLhFXLzNXq+nJI+JGaL0m98FKPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XhnNjAWL; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XhnNjAWL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791258595;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ikmq0G2vWuzS8RQjLvE7O0ZgTT2QCtc6oU8WM5b+mQo=;
	b=XhnNjAWLVsgwxjJ7x2WM2t5njlqOGejaTBLuoCGNPVbnvPOxpNu86ufQXy6pRT5Wv3sUcf
	eQ4ykXxBNishJE47jijz2x/YFH5IvnxefEiiIg9ZBIkfQaneV8nL/skbfWhH9IGvVwsWyj
	xA8jtArtBJUuiT50kO+Azes1fgQObzg=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-449-giWP4diwM8GJb1P2O1fdMQ-1; Mon, 05 Oct 2026 23:49:54 -0400
X-MC-Unique: giWP4diwM8GJb1P2O1fdMQ-1
X-Mimecast-MFC-AGG-ID: giWP4diwM8GJb1P2O1fdMQ_1791258593
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3a813204f87so1335214a91.3
        for <linux-coco@lists.linux.dev>; Mon, 05 Oct 2026 20:49:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791258593; x=1791863393;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ikmq0G2vWuzS8RQjLvE7O0ZgTT2QCtc6oU8WM5b+mQo=;
        b=d8ckhF8nmesbgwZtNMBwZuvVxgt2GtG3J7mjeXvENRxyUYnFEdZ1H517cesRyYQo/h
         eG3/uANUrw03xAn0lipaRPY7UVgsSRd0SQuW+8gK9p2JNadaRU8ugIp83pzYKsKuSkPl
         Xc1719a0WJ4krTC4BCBfNZedIjRp7Ng1coWe7PpvZIQLiIF/Xlhv5eYxHCYWOmgziYvF
         4pGjHu6XXha24BrNTQUnVuYhxSAGQg15axdEiTldu9uQvq73Eubb2u/ZpAcVvCY+++DD
         kPfkj8FlfxJjUjjLyyG2MJ7pCvnRBwu2NA13T6eppcPuCEix/dh6bgwIe9yS6YQO5Jt5
         K9MQ==
X-Forwarded-Encrypted: i=1; AKwUvBy/ui1sEVYxotkfZA1Q+9B779FuvYdKpfR8Igf4WtpQkbT1n0nFD0HOfN8rvMeXdCLk4ua2gvfeRsJr@lists.linux.dev
X-Gm-Message-State: AFq9FYIhYiLdGOXWQoeSIOtzyeSpSS0JOhEYjbZ57cLrl21k+w5/uGbh
	sw1BxsBWOwDZhfv1b/zSNfQi4xSxp9VRsgLv3mQM7gccaTQD2GKhJRy/lvnFO91NeO7ZKz7yZ0x
	BTUv2QxesfPwdGYPvOsI6BqhDYCva0bM8t/MxfwSINLFPhGrWKv87I8BvwrPZQGQ=
X-Gm-Gg: AYBFou02UJLJjWl0pS+IBz+onyt97WsYI5sfvAZK7z76hTBRRLDdpKU9SykSgLhlLJY
	3FsI0oJsZz2dE5J/ImcIBKiYe/v6UHKmYwA7g09u1J5WWlcXJIO4rDU4V70mtRXpxP5/juIRvpF
	Z7mk6zm5WqwZncJvyYBfPejCkSH2sGduqTq9TFepid/79VhmaWiS4L6frqcibyV5kO+awu1qdlE
	AOyZmMCffVTLQEVFQKEnffSGj84dNj81bQKFQUG9fr1itwmOqljvh8HOB1dJ7xs2tgg6qMo/zqC
	+U1Ml6qk37S++vKNPVZkTC07dbSIJe0jvKSu+kJJtQ+CeRPUcnYwYXQSquzSL08Q2UIb1dOcrUn
	HU35S+kAlu79d69BUpQWWbM3fZ2cBu7nizx1APIhz4Q==
X-Received: by 2002:a17:90b:2e45:b0:3a8:1745:6c01 with SMTP id 98e67ed59e1d1-3a873697b75mr93401a91.35.1791258593284;
        Mon, 05 Oct 2026 20:49:53 -0700 (PDT)
X-Received: by 2002:a17:90b:2e45:b0:3a8:1745:6c01 with SMTP id 98e67ed59e1d1-3a873697b75mr93373a91.35.1791258592828;
        Mon, 05 Oct 2026 20:49:52 -0700 (PDT)
Received: from [192.168.68.52] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a853889667sm2507543a91.1.2026.10.05.20.49.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Oct 2026 20:49:52 -0700 (PDT)
Message-ID: <2e83d025-2edb-43bb-a9fe-cdc09ac2320a@redhat.com>
Date: Tue, 6 Oct 2026 13:49:42 +1000
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v22 20/23] KVM: arm64: CCA: WARN on injected undef
 exceptions
To: Suzuki K Poulose <suzuki.poulose@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: maz@kernel.org, will@kernel.org, catalin.marinas@arm.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 steven.price@arm.com, aneesh.kumar@kernel.org, oupton@kernel.org,
 joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
 linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
 sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
 WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com,
 sudeep.holla@arm.com, jonathan.cameron@oss.qualcomm.com
References: <20261005090754.2140522-1-suzuki.poulose@arm.com>
 <20261005090754.2140522-21-suzuki.poulose@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20261005090754.2140522-21-suzuki.poulose@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: civTLQisxT-W7jqiH5iPHCiSgf0Dj738EyIWbiiIWBM_1791258593
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/5/26 7:07 PM, Suzuki K Poulose wrote:
> From: Steven Price <steven.price@arm.com>
> 
> The RMM doesn't allow injection of a undefined exception into a realm
> guest. Add a WARN to catch if this ever happens.
> 
> Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
> Signed-off-by: Steven Price <steven.price@arm.com>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> ---
>   arch/arm64/kvm/inject_fault.c | 1 +
>   1 file changed, 1 insertion(+)
> 
Reviewed-by: Gavin Shan <gshan@redhat.com>

