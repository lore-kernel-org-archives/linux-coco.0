Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 368933208
	for <linux-coco@lists.linux.dev>; Mon, 22 Sep 2025 00:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758499426; cv=none; b=sslu92iiAjMvhh3Op5r4YdB62JD738H6AoqUQbhKgGp7JV/FquJZUaOd0bNHhWG+8QsuX38o39djSvOrQ3GTN8q5I2eniG7WOdxXv6ZZFS46mVJHfhih7qt+DNtNin1fl09ZIoGZiN+rdxStbYrpSuDK39158910+JwTQiACN8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758499426; c=relaxed/simple;
	bh=Vc+qe4oStpGOoYeSI9upVtp+ku6eEr6v6jB1FhStksw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cKj9sH6QyqPB7RqROM9ue3gVeQyt64WqKOYY+I7gfwVETRjaqnjJVNmMDhcliWoQMwrTofuvmBmksmbJVagXsGRifdIL3yglxV+DC/XdbmWivcrP7wrmnmP1lcE4YUKV425pKiBNNJSKr0Cb/dc4aLVXcqrkc4RKeTj3dtRsQBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fvP74Jpx; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fvP74Jpx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1758499424;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BqKU8AOkK2sYZLUnyHJFIE8wA4u3vUpzgORbVfbSXxw=;
	b=fvP74JpxbQmNo1FWFWCMdszGDxrQqjXZf9hGtyR3JdCWJ7C4aGAQMJi+fqRlk57bJCknjy
	zHxcQH8OH3FCohUXycdn/+l2L7gxlGpk1oZWNcsrPf1puPgHJ6emb7u7491VgmWXXXv0WK
	EPH+912XEk04qryV9HeA4y8bh8JTJjo=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-245-g9UEumX9N6axJooyqvQC8g-1; Sun, 21 Sep 2025 20:03:42 -0400
X-MC-Unique: g9UEumX9N6axJooyqvQC8g-1
X-Mimecast-MFC-AGG-ID: g9UEumX9N6axJooyqvQC8g_1758499422
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-77dff701fb8so2279823b3a.1
        for <linux-coco@lists.linux.dev>; Sun, 21 Sep 2025 17:03:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758499422; x=1759104222;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BqKU8AOkK2sYZLUnyHJFIE8wA4u3vUpzgORbVfbSXxw=;
        b=dVowt9Q5ehIgp4VOmFpqeHGUqFjRHnrEZrifySkjX/XF3gw67tbd/V+eC9X/up5AP1
         FDQVff66AmIrixYLlGt0m5YDKkDf5V2mQnP6GVTbPM/uERfETQ5zMtq0kiuk7geNHmJ4
         v0Qxh3wcYeR0QCXSG3bIbPdMxySsiZ3E6a+wPp57LDmt9ywm5TqDiDoekbFejkPCHZUk
         NkAsH3pcQVoGYXsIdQIoeMgXPKKrSKr2jRi1l+zxi8QLIZO4TtLPtrospru73VKJU/vr
         M8SaVCbXuMRNfXfrk7EUeM1iwa4o79TSZzSVA3AR8Ta2VnDTgKmjtEA4T1nyNtYEpbw1
         d3lQ==
X-Forwarded-Encrypted: i=1; AJvYcCXlq9Jaf+Eqg1+feSTkdgd2S4gr3ee0+E6oD5AHkD0/PAw1tGtXNjdUcx87ygM5ZVlwbxy/Eey885Jg@lists.linux.dev
X-Gm-Message-State: AOJu0YwP4DdS0thIxURbN8v+BFtvlvPFuvHOdGUutGTNiQBt70NBWwTM
	GJ6ZNmKr+wJcsKqiUtdzmN4BcPoR6yDPbhopBWcNftgLXHl27WDoxekaJiLSuG+CZGpR0nT6tll
	ST+s4fKHTNdc0jBqRFR4tRIccN+IGhJF/e7lb7bC6TA3JttdnFD9RwNu98VKsmxw=
X-Gm-Gg: ASbGnctzo2A5OgtlAh9DhYFVUTZ9kKqhdoGSpkuX4mVx0aNTsNtnehRVmLOPm+HSNhP
	OpX98GZG1X4A2A8fLULi/xrcpjLe735PiGWC9gI05PtZypw5tJh3aR1uemwjIumCE9Q1ThV+B0t
	z2rAP4nirG1aglOj5fbLpOY77TAYu9WwM38+HhRfEq2ECxIF1NJ5W+BTMpkEnW7wHg73uSiki7Q
	qIU1qhUrGlNq+GP3eAmkpu6t1CWIPW8x4l1II7bdj5UGYqCj1HFJLvOpKUluflnjh6tMW6VFb3O
	MqcnAjCz+LPuTlFFGXoZ7V2TGLuYUySGC2mwJZmqIO9HRufOSIj88whuAFRb4V+oYGGeA0SRVC/
	jeuxy
X-Received: by 2002:a05:6a00:10c5:b0:77f:2efb:11d5 with SMTP id d2e1a72fcca58-77f2efb19b5mr3965873b3a.1.1758499421859;
        Sun, 21 Sep 2025 17:03:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEV+P3PLtWMFz48LpuCCUOGv1CdGlTH41uj5nbM1D8BAHioMb2Zl8ZXd6r9GdYmEpNm+I3zQw==
X-Received: by 2002:a05:6a00:10c5:b0:77f:2efb:11d5 with SMTP id d2e1a72fcca58-77f2efb19b5mr3965847b3a.1.1758499421542;
        Sun, 21 Sep 2025 17:03:41 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-62-5.mrk21.qld.optusnet.com.au. [175.34.62.5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77f30749642sm2123356b3a.100.2025.09.21.17.03.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Sep 2025 17:03:41 -0700 (PDT)
Message-ID: <59d78787-1871-41ba-9a2e-30d1596c021f@redhat.com>
Date: Mon, 22 Sep 2025 10:03:32 +1000
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 32/43] arm64: RME: Enable PMU support with a realm
 guest
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
 Emi Kisanuki <fj0570is@fujitsu.com>, Vishal Annapurve <vannapurve@google.com>
References: <20250820145606.180644-1-steven.price@arm.com>
 <20250820145606.180644-33-steven.price@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20250820145606.180644-33-steven.price@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: sCDXHbut23Bx74kDDiz4s8KMzCpwyKpLUDmoYvP2MoQ_1758499422
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/21/25 12:55 AM, Steven Price wrote:
> Use the PMU registers from the RmiRecExit structure to identify when an
> overflow interrupt is due and inject it into the guest. Also hook up the
> configuration option for enabling the PMU within the guest.
> 
> When entering a realm guest with a PMU interrupt pending, it is
> necessary to disable the physical interrupt. Otherwise when the RMM
> restores the PMU state the physical interrupt will trigger causing an
> immediate exit back to the host. The guest is expected to acknowledge
> the interrupt causing a host exit (to update the GIC state) which gives
> the opportunity to re-enable the physical interrupt before the next PMU
> event.
> 
> Number of PMU counters is configured by the VMM by writing to PMCR.N.
> 
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
> Changes since v2:
>   * Add a macro kvm_pmu_get_irq_level() to avoid compile issues when PMU
>     support is disabled.
> ---
>   arch/arm64/kvm/arm.c      | 11 +++++++++++
>   arch/arm64/kvm/guest.c    |  7 +++++++
>   arch/arm64/kvm/pmu-emul.c |  3 +++
>   arch/arm64/kvm/rme.c      |  8 ++++++++
>   arch/arm64/kvm/sys_regs.c |  5 +++--
>   include/kvm/arm_pmu.h     |  4 ++++
>   6 files changed, 36 insertions(+), 2 deletions(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>

