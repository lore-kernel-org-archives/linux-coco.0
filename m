Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF93870805
	for <linux-coco@lists.linux.dev>; Thu,  1 May 2025 03:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746068674; cv=none; b=ncw3IJm/wuse67NO67H8DNqXwSZQMxN5qhso4hIYAsJ5Z58rUXcYoyJe4R1wbbXJi4PF2awxjF3SEdXRiGnjpgScMcxaTM/lWS0RjXxsk8jqDUG85l9xzSCSwQ4ZJTXVGx63C1WmI+97pWo1ri5MEHZBaE4HDRY5elYsqgV5rxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746068674; c=relaxed/simple;
	bh=tZi2NdvmQc65SnA/rYIjU5Jj7gqR962wW3qNHQ5VACU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZEIZPtV66XIPR03fHwwRXduvfqj3/pqbGddC3HqAYFd6bu1su5e5ZXAPceebE6aZeVQhoK04ta8ghYqt4HOzY9H7OHPxmMoO5OOOqXBNgGgyd3b58gLfGAH2FYcoIW8+EmOyl0hrvTHpwQaZtpINHe/Ej4+3sb28Ks3c7WZPUBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZAQyPRSW; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZAQyPRSW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746068672;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pesLTZdr5/HKcumUkD4qePwEkxoOaQwmkc5fPPAZSRc=;
	b=ZAQyPRSWzL+i6DXL7RQ18HpJNvyfwboJn3YM1fxE98vL+6NdJZWnFu1ANphdcjC3siJ7CF
	/NWJ1uT2Unt/i5jg/ZpKLsmdp/usV3dz0S8E3vlN9KLpowsPIrlyM+8ouFrwu3AzqoJuOE
	8FiquvKi1jAGtp4U5Ywq+XeQQ3Cr0BU=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-287-aEwhC7NPPLWmQmdF5YoESg-1; Wed, 30 Apr 2025 23:04:30 -0400
X-MC-Unique: aEwhC7NPPLWmQmdF5YoESg-1
X-Mimecast-MFC-AGG-ID: aEwhC7NPPLWmQmdF5YoESg_1746068669
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-227ea16b03dso7431765ad.3
        for <linux-coco@lists.linux.dev>; Wed, 30 Apr 2025 20:04:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746068669; x=1746673469;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pesLTZdr5/HKcumUkD4qePwEkxoOaQwmkc5fPPAZSRc=;
        b=kYd2GrKR4KuUhBLiWgOw467VuuD0sIeWfwY2+znXqTXoZXKSB8H18Cr21OWEvl/TVt
         aUO0a09pyJCEse0pZQ40kA5v4bp9YqLWAs6SJT6wjjGkUT/bvlF0oquJdkr5+xkvF1zR
         nx2ANxJSUaZsiNRcDPgF5GRGVzXRppnCLMEww2A5vzeWiQI5uIn1vNdV2c7SZbvrpHbr
         b9riXi6S8HF2bS7oFkSTthy0L9oYKY/BU3VN/tU1omkFKkKrCtQa0IagYLI2i3naPRUI
         ygHvpwTJq4kJbKepJwhN2Hn1/TKHHSz+gsD9JXEbp4vaZa6yrq7UBYUBz/lojnZnyEnW
         zhEw==
X-Forwarded-Encrypted: i=1; AJvYcCXXhOD+zrlt1dpheziWqI4u4Ge2Cp+Q1M5CQMgzB1SZEkMOMENX6/GUgxQXYkXYufkQjjRbcJIOuq3f@lists.linux.dev
X-Gm-Message-State: AOJu0Yzora+OFu+mL0sZAgS0mnNCrF8tFEzIYPpnemoC+uOXjhGAqO5g
	YOG2NPXyOXVd/R5ScilSiM1ydSypoPyquW5NnoayV7nraOhH7918e2zE1TGVRa+714pxtG9kq+p
	sp96UdhJv10gBoLfUOLqB2XpWSfwwlG5QV38NEasYsD+hkX6qbeZT08izEEw=
X-Gm-Gg: ASbGncux4u4LnF0qBevITZbn4NvEXCMc8HmqUKn5kBj2ZrgCAvwnYwe9m/qa247Zaf9
	3M8M/ZvdiEItiu6ED8cg3wsFxcxg9saL0q21uoVruKyUpaa40D19nwEAEWel7DUXdVIN3XcMOkZ
	yAzyQd+p7nMx4t6QqBKp7frDeBH4luRPlUCvkbYwp8IT7lLK/+t+VC1B/BIKXF7HXBicxoqTxiP
	YBNH1MyqmKQGzv0d0MCN28cqG+5dp0rjCOTLxj8KT+l5GFy2EjjhdYWJpnltbN6IF9HbwNowax5
	AfuWxR5PpJPS
X-Received: by 2002:a17:902:ce92:b0:227:e6fe:2908 with SMTP id d9443c01a7336-22df5837638mr79119495ad.48.1746068669229;
        Wed, 30 Apr 2025 20:04:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHBHru6AxoF/0GFxqHSMv5iJLveZy61hLLoLevsQlDtlaYL5OE3bmqNgmfr/Tilhp0TcTxL9w==
X-Received: by 2002:a17:902:ce92:b0:227:e6fe:2908 with SMTP id d9443c01a7336-22df5837638mr79119055ad.48.1746068668908;
        Wed, 30 Apr 2025 20:04:28 -0700 (PDT)
Received: from [192.168.68.51] ([180.233.125.65])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db50e7a1dsm130579985ad.140.2025.04.30.20.04.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Apr 2025 20:04:28 -0700 (PDT)
Message-ID: <b1ac33d6-13ed-4870-aa60-36393516d593@redhat.com>
Date: Thu, 1 May 2025 13:04:19 +1000
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 41/43] KVM: arm64: Expose support for private memory
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
 <20250416134208.383984-42-steven.price@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20250416134208.383984-42-steven.price@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: p3NSCJqSvYEcV_PZvsA7XTWquO0SrA2yc41t6K7UD9o_1746068669
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/16/25 11:42 PM, Steven Price wrote:
> Select KVM_GENERIC_PRIVATE_MEM and provide the necessary support
> functions.
> 
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
> Changes since v2:
>   * Switch kvm_arch_has_private_mem() to a macro to avoid overhead of a
>     function call.
>   * Guard definitions of kvm_arch_{pre,post}_set_memory_attributes() with
>     #ifdef CONFIG_KVM_GENERIC_MEMORY_ATTRIBUTES.
>   * Early out in kvm_arch_post_set_memory_attributes() if the WARN_ON
>     should trigger.
> ---
>   arch/arm64/include/asm/kvm_host.h |  6 ++++++
>   arch/arm64/kvm/Kconfig            |  1 +
>   arch/arm64/kvm/mmu.c              | 24 ++++++++++++++++++++++++
>   3 files changed, 31 insertions(+)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>

