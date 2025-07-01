Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A11D626AD9
	for <linux-coco@lists.linux.dev>; Tue,  1 Jul 2025 06:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751352139; cv=none; b=BJsJ6GhdV39kXK/u40cgSnum8CQsTgJZ4zMNtZSwgc480Ne4JCM5+P8+bKRnfbMNsE8dLUPq/+U1Y8psyfB2liJGZhUUMTfiFsoZ8fzwSMo15dQhqzDpVYfm+EfkNnDnOdddUJYZ5TVK9txLfiD6vglSfpD5TinCSq+gY/Dq+ds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751352139; c=relaxed/simple;
	bh=K3Al7D1G7wePfIr0haOB5cZ0BREvvGzr3BvThBzFKuM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cMP3ug80h4QT6Iw9KU4QWzy28rdwlJZCFdr4u5cqCnqSvJU96YxftM4xp+xWBXbFByg08QqaNYDGoDzbt9Javdx/jt7FmA9/bN7I8jfeh5jyz+O0yRUoENp6lhHRnJsIdkBBf7igY0/+n5Ax0iUUdl6Agu3D1GIImQhJ2KsCxhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Is02P+Lg; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Is02P+Lg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751352136;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nh2uVd7pRoUTCK6irPkfWlzRluxl2PTNeAPLCnx0f8I=;
	b=Is02P+LgaAixPv2TF+Lc1hrJIHV1uiOGmEtSBWx72sLgEZe1n7rkHDPUhJF3eqLDq2uy3O
	QMrxPleZgIzvC5qtuM/rOVfQH18PHayt6VTp96UBH4NsxJgPFp2VE8tmzXOuR9HrlVX1q8
	SRaR+ocAKXCfH1NfL9sZpVup+CcsIZA=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-602-VdZH5CmzOZOTVHXStggmZg-1; Tue, 01 Jul 2025 02:42:15 -0400
X-MC-Unique: VdZH5CmzOZOTVHXStggmZg-1
X-Mimecast-MFC-AGG-ID: VdZH5CmzOZOTVHXStggmZg_1751352134
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-235e3f93687so42868195ad.2
        for <linux-coco@lists.linux.dev>; Mon, 30 Jun 2025 23:42:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751352134; x=1751956934;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nh2uVd7pRoUTCK6irPkfWlzRluxl2PTNeAPLCnx0f8I=;
        b=qIenPdnLFfZEbkGIiS9mkQGeHJupWe/skMP7bra+Mrg7qbXZoOB3ARIzOGRAfpW/k4
         42GPpUDcS6HIvS83NU4EtHKBJoCpyxOQuqU4I0tvD/JNI0+HKGa5tk3YoF2x8llf4txw
         HR3IMsI8d8CV9YIieFMSxMJbi3vClasrLuulWJainRGI6xSAizfvbeHedU+cuUQfWX0z
         JfzYr43vHLpC6fh5F2VRUbdEwEH0+KOEG5OgpFgSZzzuwDVWn7tqZjip8fAlg1uYZwW1
         2Gc2QmvWNELMGno4lJ2H1YyPiPXDNF5OGc54A2CkZZa1hFPPPfLg7cGJmj9vvUNunqui
         6g9g==
X-Forwarded-Encrypted: i=1; AJvYcCURQQWBhZJmCuY4UJOmF0W1iwteePWaHgB5sr0hCcbzrQ5EQ+0U0OBYroEzlr5qZw8xCtvJS2+Oz2Sg@lists.linux.dev
X-Gm-Message-State: AOJu0YwT9CWKpkzpAt68bQjoJ/ReBxxIqiYHAI0/0QcQCpl5nQAQAb96
	tFSBxz3uTSLle/oAPzi5iT4L0QSAZspmMjigK0YJIDrXgUK8QyuoUCwM9fRhFF5M2WfdxKg18Mj
	3IcH/4BubBss09iLl0ChKXVWkMK7kQX8E87gu+NWgEJ16OC36mJo+RfJ/z8ZcOFk=
X-Gm-Gg: ASbGnctyyK1+HUkHKoEVvUDXDB6Yrf+L9Ba3WkQYxCcf/2oWZhhPRMzGU8zelNJdHiE
	4QdDGCv0xBi08bZewIGLkuwCxnufnQsxUaW+R/JIAt5qINTYPNPdulzpW64wBsKHB3LoWmnZHlw
	LIlvvX4J+JZM02VyQzRJ/klbC39ZDQeTBWv4ySTW9jNpzLCK5FMC/xidbMA8gSSX0YGeFO1DU7B
	DKwdi8Z5skHpbwK4ogtKXV1F9IQqHhsyWtyUj7ecQgSOofeJNyR0hFaiI8uAuK00VYXxBIQb5du
	3b/olAYTvbij5a2zQKYGXV531dREDPqpfAL/l4f0RojQvBatMQN6Z/nFYZnY7g==
X-Received: by 2002:a17:903:1aab:b0:235:eefe:68f4 with SMTP id d9443c01a7336-23ac46066bcmr278419905ad.29.1751352134057;
        Mon, 30 Jun 2025 23:42:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHl2aE+m8eiWUtPLXKvS7q68VAQ4UGGYsv/Yl574znsMqgsWf8nwxSoY/4U5XcisW0xX3aQWQ==
X-Received: by 2002:a17:903:1aab:b0:235:eefe:68f4 with SMTP id d9443c01a7336-23ac46066bcmr278419475ad.29.1751352133719;
        Mon, 30 Jun 2025 23:42:13 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-62-5.mrk21.qld.optusnet.com.au. [175.34.62.5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb3c689bsm97301335ad.224.2025.06.30.23.42.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jun 2025 23:42:10 -0700 (PDT)
Message-ID: <5d520f90-f49d-4926-bc04-80979531aa11@redhat.com>
Date: Tue, 1 Jul 2025 16:42:01 +1000
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 14/43] KVM: arm64: Support timers in realm RECs
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
 <alpergun@google.com>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
 Emi Kisanuki <fj0570is@fujitsu.com>
References: <20250611104844.245235-1-steven.price@arm.com>
 <20250611104844.245235-15-steven.price@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20250611104844.245235-15-steven.price@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: p1KkvuyT1_-3T4oSz5WSH5ZVH5q0xCZtWRDmIS2F7rk_1751352134
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/11/25 8:48 PM, Steven Price wrote:
> The RMM keeps track of the timer while the realm REC is running, but on
> exit to the normal world KVM is responsible for handling the timers.
> 
> The RMM doesn't provide a mechanism to set the counter offset, so don't
> expose KVM_CAP_COUNTER_OFFSET for a realm VM.
> 
> A later patch adds the support for propagating the timer values from the
> exit data structure and calling kvm_realm_timers_update().
> 
> Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
> Changes since v7:
>   * Hide KVM_CAP_COUNTER_OFFSET for realm guests.
> ---
>   arch/arm64/kvm/arch_timer.c  | 48 +++++++++++++++++++++++++++++++++---
>   arch/arm64/kvm/arm.c         |  2 +-
>   include/kvm/arm_arch_timer.h |  2 ++
>   3 files changed, 47 insertions(+), 5 deletions(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>

