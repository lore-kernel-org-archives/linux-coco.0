Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33D671F4CA3
	for <linux-coco@lists.linux.dev>; Tue,  4 Mar 2025 06:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741069448; cv=none; b=gOhBZqqClUI5JWV4ArBVhwEHfkEwSHzGthd4f+r7+U4qjt+Du2TPzEqE8B4rF6HDkmXZeAsmd6yTws1ik9KWHnfnKt5tcvAlytfh4PS2r2JQFoekxVABTUTYRHaJGsUFZd4xA/ike+iTTAPpSMLZbJUpd0S8SvtuqwoBYT71Niw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741069448; c=relaxed/simple;
	bh=0EYT/5igMmD/qVvWdRKvGmdh6E8JzSaWldlA7WO1ROk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JHIvwoG1j4yjiR4PNkKYgyfLQiU5i+RgDB6PbXY4ATnPqZ99kpCcTg8a9kppAbfUKj9VedyKVmU2ulJPlFMO1oVmXNr1zErmf4YWm1JmRHLpc0WtGQJm1jX698DoA1le0Z/V4KHNhVoiBhx5K6f0Bb5xFq0+OaosoldL67eWUIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=d4OoVye9; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="d4OoVye9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741069445;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UUEeo/X+MxYcAZNwznFspnaWG5EWN4eG0J5QKgSy/vw=;
	b=d4OoVye9D4qRh8/YTKNhCmIAhwO+ofR5jMczGG0SaVv1ifvBSuzD06+oMNYD2F7YtQO5Ux
	ctxaRQlUKonWF3Sq/iu4yQb/vgR69xtHYeWlpXbnIAwX4tJ57VblLQ/krvEDlrouDM9APi
	9A+djSQUJKBD+xkxb3jykU+YtYUuogQ=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-512-2UdPp9dsNKqnZMWzSGzh0Q-1; Tue, 04 Mar 2025 01:24:02 -0500
X-MC-Unique: 2UdPp9dsNKqnZMWzSGzh0Q-1
X-Mimecast-MFC-AGG-ID: 2UdPp9dsNKqnZMWzSGzh0Q_1741069441
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-22350e4b7baso92796665ad.3
        for <linux-coco@lists.linux.dev>; Mon, 03 Mar 2025 22:24:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741069441; x=1741674241;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UUEeo/X+MxYcAZNwznFspnaWG5EWN4eG0J5QKgSy/vw=;
        b=F+gbAAkgR3Lfd9NKUBz1TQ/v8ZqVCiJFhxfCIT2ZqbpDtLjNLGS9cl8uYICX4Yp/Kf
         HpgABGsePv9UEzrvxy8m8iLuklE1fXr6wZBfPU3gWrNnk4c9+VPIjlJ4dLs8r+yKvLAA
         2f6I7e5E5whNhGWdBRY59j8rGkMsXJuVNccPRiIaEx+T8Rtx6O5BXoFVeQvhaQzCAAlx
         Pm9KUx/5W8HDyeACATuwPd5JnMTl4nAUkRZpilToG+Z88vBzV7cSvG56syhNg6fz9R+G
         LcgK/A/pJ7viEUktxhzQj7btkGagnauUVcDEWJKnPc8Drcu5Y6qTT3jBCeNkHkiCAtG0
         nysw==
X-Forwarded-Encrypted: i=1; AJvYcCUQC5hfkpRLSJTuBH8acBszEiCvNLceCq9zz1mmzyIefOD7zecAyKhoLggEXgmV0TjdA1CiuSnXGOOI@lists.linux.dev
X-Gm-Message-State: AOJu0YxduknlWYvZZtf+c4xjgaq5StcQBMtzNTHqPCBhOCzNFm06veYL
	rCgfI0c8ok84OJhhJB9o8sW/5x+gLwfrPYFuEUtpZoEHn1COK5nzpJ8QtELgkS0Gt0N7gvrU0VA
	ldViaYXo20VmALALIEEZCBZTYW+sodagriRzlwhqYhHHEGKEY+Lv9OGIv8NE=
X-Gm-Gg: ASbGncsGxNK7gentVmQwz5Z/CMdgXYJoRUu4PhtQu8HGnQAAOHAkCcX09hp/4qgsvcN
	Zp6eB+IJFz1ySliI3khsnrOlGLBM3L42mkWNqCq/2LB7JA4xF7llQ6ZA+CfIVtTKAzrqJ97zVIW
	GlTH42tyAJ3Xf56fAzTd5TTSmzAAZOD2cEafXkhJl0+pU5P2MUOunbusNbiAY/RqNtNdGFWF32f
	eBJw/ZF3q1RyISzZpKlQz1xPSfPY0pRR2/dYgh4QLPAymzZrH/lUKwhvjpBndo1wDE3OPKBfaok
	50enI+8oMDMWspQUJw==
X-Received: by 2002:a17:902:ec92:b0:21f:6ce6:7243 with SMTP id d9443c01a7336-2236922454fmr215973875ad.51.1741069441096;
        Mon, 03 Mar 2025 22:24:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGeWcLcszVzswCV3IlHec2C4u9Iv8biEcHW4AvArM9d+exFu3qcTvk3+Js7kBLoNIjChH7Sog==
X-Received: by 2002:a17:902:ec92:b0:21f:6ce6:7243 with SMTP id d9443c01a7336-2236922454fmr215973585ad.51.1741069440784;
        Mon, 03 Mar 2025 22:24:00 -0800 (PST)
Received: from [192.168.68.55] ([180.233.125.164])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-223501d323bsm87972535ad.3.2025.03.03.22.23.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Mar 2025 22:24:00 -0800 (PST)
Message-ID: <9d32bfed-31f2-49ad-ae43-87e60957ad74@redhat.com>
Date: Tue, 4 Mar 2025 16:23:52 +1000
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 30/45] arm64: RME: Always use 4k pages for realms
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
 <20250213161426.102987-31-steven.price@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20250213161426.102987-31-steven.price@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: KtYsn-ApzBxHTjdTNWmYsfCWqkzXq243Xjim_jHhC0g_1741069441
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/14/25 2:14 AM, Steven Price wrote:
> Always split up huge pages to avoid problems managing huge pages. There
> are two issues currently:
> 
> 1. The uABI for the VMM allows populating memory on 4k boundaries even
>     if the underlying allocator (e.g. hugetlbfs) is using a larger page
>     size. Using a memfd for private allocations will push this issue onto
>     the VMM as it will need to respect the granularity of the allocator.
> 
> 2. The guest is able to request arbitrary ranges to be remapped as
>     shared. Again with a memfd approach it will be up to the VMM to deal
>     with the complexity and either overmap (need the huge mapping and add
>     an additional 'overlapping' shared mapping) or reject the request as
>     invalid due to the use of a huge page allocator.
> 
> For now just break everything down to 4k pages in the RMM controlled
> stage 2.
> 
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
>   arch/arm64/kvm/mmu.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 

The change log looks confusing to me. Currently, there are 3 classes of stage2 faults,
handled by their corresponding handlers like below.

stage2 fault in the private space: private_memslot_fault()
stage2 fault in the MMIO space:    io_mem_abort()
stage2 fault in the shared space:  user_mem_abort()

Only the stage2 fault in the private space needs to allocate a 4KB page from guest-memfd.
This patch is changing user_mem_abort(), which is all about the stage2 fault in the shared
space, where a guest-memfd isn't involved. The only intersection between the private/shared
space is the stage2 page table. I'm guessing we want to have enforced 4KB page is due to
the shared stage2 page table by the private/shared space, or I'm wrong.

What I'm understanding from the change log: it's something to be improved in future due to
only 4KB pages can be supported by guest-memfd. Please correct me if I'm wrong.

> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> index 994e71cfb358..8c656a0ef4e9 100644
> --- a/arch/arm64/kvm/mmu.c
> +++ b/arch/arm64/kvm/mmu.c
> @@ -1641,6 +1641,10 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
>   	if (logging_active || is_protected_kvm_enabled()) {
>   		force_pte = true;
>   		vma_shift = PAGE_SHIFT;
> +	} else if (vcpu_is_rec(vcpu)) {
> +		// Force PTE level mappings for realms
> +		force_pte = true;
> +		vma_shift = PAGE_SHIFT;
>   	} else {
>   		vma_shift = get_vma_page_shift(vma, hva);
>   	}

Thanks,
Gavin

