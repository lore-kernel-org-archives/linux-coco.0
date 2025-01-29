Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6DAD1B219F
	for <linux-coco@lists.linux.dev>; Wed, 29 Jan 2025 23:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738192023; cv=none; b=Ej9tbJmHKjpoj4f9N9oDLK1ipWfxWCUzpkdKHuroaefXwx4g3eQ18nqE07O8kezObFZFp5C5fmPxSig2tw8hVfd0/R+8y5AypOl1+o4dpHvgYklPtpqDHWEcgH4A9AJFk2z//w/KIq57iYSNtqkglGrOIZkKRA6X1NIWdKFuRI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738192023; c=relaxed/simple;
	bh=zUh44u3xHyFvSH3tS0Wr7/FzaJHez2vFFdMcDL88fsI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d7Y2ez/hrpQCp/fjRSndQXeVmSjtPUTtVwla7xo6yO5VKiTdx0WV4EGZZIe28CQmGoQLqF1e+UPTsgt/o1/8XR164lCo8PAmQieGvMiiqaUE96u3jsThvCaSCmkNcmK55OzHO7D9YtWXGQYYOh5JmCWqsGZhvoKh+5bMwOC1QYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KteLBHJa; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KteLBHJa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738192020;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KyHbZ+Pwxh06r8uU1Lo24oDU5q1mx0zS6wBE1H4R6WI=;
	b=KteLBHJaIjpXykHoSc18ntQCt8uHLITmhWoJuVEurqZb2gC1J9u+dX04lmhyJXuCFptfuJ
	qRBcvryOzibiImWdhsu+rbuKpo8RqjxbMcmOhauH3w9l688pTBBVCmJ+as/t9r3tySl+Gw
	VpeaWCa/zrhQ4fDsSmKpcac7dGHg9gw=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-421-09f6sapTN2qmYk8sWdabaw-1; Wed, 29 Jan 2025 18:06:57 -0500
X-MC-Unique: 09f6sapTN2qmYk8sWdabaw-1
X-Mimecast-MFC-AGG-ID: 09f6sapTN2qmYk8sWdabaw
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-2f129f7717fso288644a91.0
        for <linux-coco@lists.linux.dev>; Wed, 29 Jan 2025 15:06:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738192016; x=1738796816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KyHbZ+Pwxh06r8uU1Lo24oDU5q1mx0zS6wBE1H4R6WI=;
        b=vzrL0stdtRSBCycCBSOTL7mgo+6YFCwID/D1w1dg+7V1J6lx53cdm+HplY1yEMXkR3
         wHosWv+Wwp5TH7M2QFWlQYy+tZFGKE+rCfiKhIoCjfy6uLbYQe/fOGnVHKKjSbK6R5Be
         lqeBhuaosvCh44lLiaqEvwwqTYAYSaODts1tTICu4Lwq7oPHwWRkL2iaaHzVBn/GJhoN
         a+ueeMZu6IRUxCH0NZU3FWClgYjQlqylc21ii6x795klluGvSOO8vmu+3EodWTpX1uRE
         b3XMZBUOgSO658lsZzZKm0Xsr4tOPSUZxulctySiewTRwnbnl6HjPwQ+iI15novNhpG0
         Uelg==
X-Forwarded-Encrypted: i=1; AJvYcCWpbDQ+aI4PjbmfyMD0gePoUXO1AsUJnzUudCySFOpbA38nEubwL6XS59MPufWUNsZaBGjJK06BZCZE@lists.linux.dev
X-Gm-Message-State: AOJu0YzfjyQZGrUG3r+2NCet3W44BPUptkdBPHo8BQl0C7klBK7hlsyP
	0odJqw95mZMRs826BoanFn0HJLdO8h8FZwRsMhrre7Ds15ZctMWh1lCq4ryMIrqeC308n3QVZSk
	qd+IoXrMNHuu6+KNdVa1usr8PgGJmmxW3pgHzmeQIVOsPJO9QdKPx1ss5XC0=
X-Gm-Gg: ASbGncvnJmfM/7OKgXVoUwG6B5vfp42JiL2QwW/QeOi6R33NuMcUg7mmrYTAgmk19pd
	OQB3VBSaeVQV3fcYxRFChj3VFV6HUyfyz5KlVg3ApMMyyWZ5Ud4Ib9KnwLSsy8Y5UsfgiCvoG+v
	LVjvIyZPA5OQdYz3SQCZz2Jm+EaNelwKDKP9dK4lsIuz2I2ev7JjF2LbcP7NwtKT/VMWjQPIx+v
	8wnPlBweVMNqvQZoocYOuP1D6z0gx4fWg/0PQTuvAsQ2P72SS+Xo8zlHH27Fzvh4evpsp2FyaOu
	cESvoQ==
X-Received: by 2002:a05:6a00:1396:b0:725:db34:6a7d with SMTP id d2e1a72fcca58-72fd0c7c6c5mr7442936b3a.23.1738192016164;
        Wed, 29 Jan 2025 15:06:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHK+GFtKGuVAzhj66wtlYDvlWWvG3WVubkOllbBq8t3Ltf+GMVUhA51a8pFaMKDNQBYDvAy4Q==
X-Received: by 2002:a05:6a00:1396:b0:725:db34:6a7d with SMTP id d2e1a72fcca58-72fd0c7c6c5mr7442904b3a.23.1738192015836;
        Wed, 29 Jan 2025 15:06:55 -0800 (PST)
Received: from [192.168.68.55] ([180.233.125.64])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72fe631bfb0sm30521b3a.23.2025.01.29.15.06.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jan 2025 15:06:55 -0800 (PST)
Message-ID: <dcb08082-4048-4573-9dd4-bf3b81a06bb9@redhat.com>
Date: Thu, 30 Jan 2025 09:06:47 +1000
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 11/43] arm64: RME: RTT tear down
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
References: <20241212155610.76522-1-steven.price@arm.com>
 <20241212155610.76522-12-steven.price@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20241212155610.76522-12-steven.price@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: CZV9yMP9q5XrscS0Dnfzt-dztQdwol4N24Fose3SVBw_1738192016
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/13/24 1:55 AM, Steven Price wrote:
> The RMM owns the stage 2 page tables for a realm, and KVM must request
> that the RMM creates/destroys entries as necessary. The physical pages
> to store the page tables are delegated to the realm as required, and can
> be undelegated when no longer used.
> 
> Creating new RTTs is the easy part, tearing down is a little more
> tricky. The result of realm_rtt_destroy() can be used to effectively
> walk the tree and destroy the entries (undelegating pages that were
> given to the realm).
> 
> Signed-off-by: Steven Price <steven.price@arm.com>
> Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> ---
> Changes since v5:
>   * Rename some RME_xxx defines to do with page sizes as RMM_xxx - they are
>     a property of the RMM specification not the RME architecture.
> Changes since v2:
>   * Moved {alloc,free}_delegated_page() and ensure_spare_page() to a
>     later patch when they are actually used.
>   * Some simplifications now rmi_xxx() functions allow NULL as an output
>     parameter.
>   * Improved comments and code layout.
> ---
>   arch/arm64/include/asm/kvm_rme.h |  19 ++++++
>   arch/arm64/kvm/mmu.c             |   6 +-
>   arch/arm64/kvm/rme.c             | 112 +++++++++++++++++++++++++++++++
>   3 files changed, 134 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/kvm_rme.h b/arch/arm64/include/asm/kvm_rme.h
> index 209cd99f03dd..32bdedf1d866 100644
> --- a/arch/arm64/include/asm/kvm_rme.h
> +++ b/arch/arm64/include/asm/kvm_rme.h
> @@ -71,5 +71,24 @@ u32 kvm_realm_ipa_limit(void);
>   int kvm_realm_enable_cap(struct kvm *kvm, struct kvm_enable_cap *cap);
>   int kvm_init_realm_vm(struct kvm *kvm);
>   void kvm_destroy_realm(struct kvm *kvm);
> +void kvm_realm_destroy_rtts(struct kvm *kvm, u32 ia_bits);
> +
> +#define RMM_RTT_BLOCK_LEVEL	2
> +#define RMM_RTT_MAX_LEVEL	3
> +
> +#define RMM_PAGE_SHIFT		12
> +#define RMM_PAGE_SIZE		BIT(RMM_PAGE_SHIFT)
> +/* See ARM64_HW_PGTABLE_LEVEL_SHIFT() */
> +#define RMM_RTT_LEVEL_SHIFT(l)	\
> +	((RMM_PAGE_SHIFT - 3) * (4 - (l)) + 3)
> +#define RMM_L2_BLOCK_SIZE	BIT(RMM_RTT_LEVEL_SHIFT(2))
> +
> +static inline unsigned long rme_rtt_level_mapsize(int level)
> +{
> +	if (WARN_ON(level > RMM_RTT_MAX_LEVEL))
> +		return RMM_PAGE_SIZE;
> +
> +	return (1UL << RMM_RTT_LEVEL_SHIFT(level));
> +}
>   
>   #endif

All those definitions can be moved to rme.c since they're only used in rme.c

Thanks,
Gavin

