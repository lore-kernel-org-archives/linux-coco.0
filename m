Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 451591F03C9
	for <linux-coco@lists.linux.dev>; Thu,  1 May 2025 03:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746068694; cv=none; b=UyHyCYOrdGmolKEo8D6yrVJ69gUnsdDrMcm3dW5FHjEUBuCiyAKnoAkKLLTiUmG5jw0kZNbkwiMeiCGxXlKqWOr+R6boHlTN5EjTolJ6BvSlrr5Gm8wSO1hWm3mn4IpfYOwefmWygynfrNC2ThXLI8CqyeRsuMqDh2nQb+hQeO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746068694; c=relaxed/simple;
	bh=1ObrGtB9IokARfmRtsVBE9r1D8oh4jqlTgFcAClMTMQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LkwjdqtNU9YDgKatgBjGEk6nc4XMZQw4wK4RiimTeBgP7f+dxpeR/vVOmW7qUvUaXABi+xWGJBkvt1fTx5032M/WtdHXnDWZkg/VWY+xuSyKCb1CKma8JJyPdNImvxrDKU4IGstxuKvWoIOmWjgdW3zJdS40QQpFoksGlJIZovk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ac6wenrQ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ac6wenrQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746068692;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=c6EHKP8IMf41CnMw8MbfWQc4SNnrbtpA2MJtfflzP38=;
	b=ac6wenrQLCWsbTg4QnkJwU756IuMt/GSbbl/k1wASDfXrqFn5CMp5yPK90us2N6ezyHqo4
	V3FIjb/R0SbOx6JQrOPx/eign0G+TliUBSZD58WhmjCfJAFdvUgVeXeTMzkdmF3psC2qFf
	HSaJTy3LuuSBZMks+PMbP2ucITEvcHY=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-647-uxifhq-yPY2KMLiNgekNQQ-1; Wed, 30 Apr 2025 23:04:50 -0400
X-MC-Unique: uxifhq-yPY2KMLiNgekNQQ-1
X-Mimecast-MFC-AGG-ID: uxifhq-yPY2KMLiNgekNQQ_1746068689
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-227e2faab6dso4358295ad.1
        for <linux-coco@lists.linux.dev>; Wed, 30 Apr 2025 20:04:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746068689; x=1746673489;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c6EHKP8IMf41CnMw8MbfWQc4SNnrbtpA2MJtfflzP38=;
        b=q3AH3c416l4LKeRRlKFnb0XWTI8rbuZNUx7ulPT5ib6vPYiALknYCKg3vJVsLa1/kA
         KjjFnwR8f7bmwnh931xM/CHd695HdYz0uXsQNZVgpwoOWQyDYjGZQNNrI1ld9Kspjj1A
         6qJHo2zoDocwIblgiyDUe0UWFw62HvVdrDbydz0owkZ1GyhdvS4ILdpY8K1/5QTkONvq
         TpO9jvaLSYFK+ZkOF3WFJeKMmnuFuuUdu93PhaI+LjqhFos+AQvWW0/7p7Cij9bwd0Xo
         XdDwv6ep/ckS47KBqhfJx/6Ns5tUVvP/hkkNnfLHBVEQ4dRzDf2XK5r0E4Ih9Y1UO9mv
         unyw==
X-Forwarded-Encrypted: i=1; AJvYcCUu+h+NPdkhrP5z3s8w4G//YsrLLJIsPZkrIKTTh1zJkA+lkEw9LcsaBTWew0eoEunUXiNCZK/Ds9C8@lists.linux.dev
X-Gm-Message-State: AOJu0Yz2OgTf1XntKIvKw3gYEbHzHm2mpFGgUrshPbJAIkmX5mUjwVX4
	G2i9mQ+IFZWUMVRdUJq6sJtPSbVo9AM8vLr3u0+5B+MHCSnqgYRCbbzVM2Qlw3bpoSsb65O+IW8
	5dAGIHG4UswmFVwWXc3t36ksc1FoWP/AAGqy3Ta9I0qZQBRcbOyv+wIulLEg=
X-Gm-Gg: ASbGncsltNf2RcERF+HBo2vD5X8WiSI8y6vLbWbMXDGbV4r9KjcsGZmAMpfEtidd3vB
	k32s4GHKDlDmy9Q6tJCoq1B5vg0N8ntXktAMSTpDl5YWs9Ww/esErGG0rNlH+vA3HWZ413jkfpP
	B2Gns2V0iE554LMkylbSGX/9XfRwztIdmIVjXxSuCJ6QxCyofEFpnGSzCmxSBJ17RyDfG4A704J
	/HilGOa/evlYAq4giZqhv5yqlb/b5n93fYqGLyV9YfG7E8amsAwKKQhjLDcsip5xKe1M3JyeO1A
	WqIOLw4gotWw
X-Received: by 2002:a17:902:ecc3:b0:224:76f:9e59 with SMTP id d9443c01a7336-22e040b0136mr23366965ad.10.1746068689280;
        Wed, 30 Apr 2025 20:04:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG1HYZaymy6EVaTH4wKRIzEm7W7NnVNI2iwuZwa7SP72F5l7R9CUpKQ6EYxkWw1HKHA9Whnjg==
X-Received: by 2002:a17:902:ecc3:b0:224:76f:9e59 with SMTP id d9443c01a7336-22e040b0136mr23366505ad.10.1746068688970;
        Wed, 30 Apr 2025 20:04:48 -0700 (PDT)
Received: from [192.168.68.51] ([180.233.125.65])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30a244bd4e2sm3593226a91.0.2025.04.30.20.04.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Apr 2025 20:04:48 -0700 (PDT)
Message-ID: <e26e4225-e9a8-40b6-bafb-9a007b20db96@redhat.com>
Date: Thu, 1 May 2025 13:04:39 +1000
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 42/43] KVM: arm64: Expose KVM_ARM_VCPU_REC to user
 space
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
References: <20250416134208.383984-1-steven.price@arm.com>
 <20250416134208.383984-43-steven.price@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20250416134208.383984-43-steven.price@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 0vHHs6lW9bj2H6ETwvJ-4wDYyXsMT78VA919ZHURt-k_1746068689
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/16/25 11:42 PM, Steven Price wrote:
> Increment KVM_VCPU_MAX_FEATURES to expose the new capability to user
> space.
> 
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
> *NOTE*: This also exposes KVM_ARM_VCPU_HAS_EL2/KVM_ARM_VCPU_HAS_EL2_E2H0
> (as they are both less than KVM_ARM_VCPU_REC) - so this currently
> depends on nested virt being 'finished' before merging.
> 
> So this should be merged after: "KVM: arm64: Allow userspace to request
> KVM_ARM_VCPU_EL2*":
> https://lore.kernel.org/r/20250408105225.4002637-17-maz%40kernel.org
> ---
>   arch/arm64/include/asm/kvm_host.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>

