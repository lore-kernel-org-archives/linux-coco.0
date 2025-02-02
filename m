Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8FAC2F3B
	for <linux-coco@lists.linux.dev>; Sun,  2 Feb 2025 06:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738479182; cv=none; b=qflmxfVj6sRpiWWlVieVlQph4/1up2Lx4xaZ8HEqLmel8UUgvjdHF48yKkTJ0qhTB5souX+D39FnvhR/s0E0BiX+8zDwYxw6yJ85sHKachU2U4WU8x3Y7HvgBF67psL8MBOwVDrMyYDoZBBAF8zSzjU9TUxqqdeqQELvIbczva0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738479182; c=relaxed/simple;
	bh=+XQoM2eQ5of19S1D3GwOInAKkzoHqEfVZIdX70/L1xE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mO4YmaIcMUDkbuLOyrHBeCsRWTpBVMUMYDbr1fsT3WyY+/aApvy2br8oHeFd29ujnmCKFlYORyOPzhYO2DxopC8NaKPBR+GMXa+HTK/Npr4mWw9xxfX5ShB/xH6etYxvEMEVdj9P0CtR1yuSEi86IWjJcMPrq9xAEkpQDQI1OVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Q1pMLCBc; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Q1pMLCBc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738479178;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dmFZPr7vvicMrPdu+ITYGzZQ8FMqK4dGeuyKQ/HiL5g=;
	b=Q1pMLCBc0rasqGXCGTeNKk8uEBtee+GaVk+LCgZEm7d7y04QL8G+36Eo61anUtzXWqiUFy
	UJVUvqKTvRtN/oCM8qBGjBRxbJ0mM2/hv8IwlP+mNte2IGytUiWafBSqHRnhFsrtpkFJ35
	3yRVw6U/H//QwlRTUOBCPVT5/rQXSjo=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-493-3-8L4PRoNKq-oZ3GSCBfJA-1; Sun, 02 Feb 2025 01:52:57 -0500
X-MC-Unique: 3-8L4PRoNKq-oZ3GSCBfJA-1
X-Mimecast-MFC-AGG-ID: 3-8L4PRoNKq-oZ3GSCBfJA
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-216311faa51so59741365ad.0
        for <linux-coco@lists.linux.dev>; Sat, 01 Feb 2025 22:52:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738479176; x=1739083976;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dmFZPr7vvicMrPdu+ITYGzZQ8FMqK4dGeuyKQ/HiL5g=;
        b=CdDdM8lcrFOeou7J2dYk1UYwsXoHnWCEKAryNQvnF4UjYt5t13tbP1kcI2/3XbeDqU
         ynntEjPt7M2/fwvSbQJAoM4/iS9N+LLuCYnlLvBMw2hKCItTuQhgH85H3sxFGgX5QNV3
         uKCtKz6xlagVYAhDngRuL0Knj7v6YC6MYzQIWF5shd0QD4d58t1mYkWsxmmg/n4l7JAp
         +Jo19gnhAu/EGUCKRhPRbgPqWkB0t3QgQsfujQosXPL5KzcmjOHtBje1nnKtV6LVvEEp
         lrHI/a3fsXBG8EpGgICE7VXsLYXm5HHgD0n8l2yhYgU/IX36aaA8KSvWjFn8QdEe9KIJ
         Mvag==
X-Forwarded-Encrypted: i=1; AJvYcCUbGrS2jAL8PuxHQAKPng2d/OCHZRcqdh5MrIdHjpH9Ct8tApsQTgohLYraggeAJnnETjfwuF+R4YJH@lists.linux.dev
X-Gm-Message-State: AOJu0YzNu1lGZaDOnLkMUPRs/+gzF6MU9Ac1e7FsBtHXK3/tGagkb8pi
	Zn3sAwCfPYwS3yxv9qu0djrLC/lHrM7yoAEDn740iG3FkyajEd/XEby+ziVIfUPLdVqXWkORJPK
	IuLVxzfpcW7WI2cHmMkFDK/ODGsoo+X5qqBeVL4AHKl+BXEkY1TDY6MtemmM=
X-Gm-Gg: ASbGncsJx3KP+OolmBzjc2uCLVDOW92EVNQv3AMc5c5XefM/AqZg8aYTFj1ky3GzX4S
	raQx1Yn+mIIu/HQFnLu31nIo3MiuWg/WA2H5tsu2BjH1vF6RZO20qWEP3AB0yDFqmTT68DvcBE+
	q5eTdgq/qtaD5wt/SZeXUtnClun1cpUvNtuzTrp/ZnQdVE8EoqmIjoA3wWZ4hqJmRyuPpGZu99h
	sGwNNa5Kd8GE0fLfQcjqvS/6xVNNAUrj6aL5wb2WXDbt/Ui2OKuacvM1N7Ho+cFkKoUFCgIpmfc
	3FqMEw==
X-Received: by 2002:a17:903:246:b0:215:b1e3:c051 with SMTP id d9443c01a7336-21de1968f37mr191228095ad.11.1738479176570;
        Sat, 01 Feb 2025 22:52:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGr8YDEgf3AQME0gtW8Rc2bNGoGwAlcqKLbbyp/bsjze7Hnub47aEwGNl8h+IYW0bDy17/2PA==
X-Received: by 2002:a17:903:246:b0:215:b1e3:c051 with SMTP id d9443c01a7336-21de1968f37mr191227855ad.11.1738479176239;
        Sat, 01 Feb 2025 22:52:56 -0800 (PST)
Received: from [192.168.68.55] ([180.233.125.64])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de3335cc9sm54443775ad.258.2025.02.01.22.52.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 Feb 2025 22:52:55 -0800 (PST)
Message-ID: <82659880-f7a6-48ad-bf54-8371fc3d41d8@redhat.com>
Date: Sun, 2 Feb 2025 16:52:47 +1000
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 29/43] arm64: RME: Always use 4k pages for realms
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
 <20241212155610.76522-30-steven.price@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20241212155610.76522-30-steven.price@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Fmz3PEiZelGu-V29V8uv6AOpoZEIKlTo962CJ4uD0ag_1738479177
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/13/24 1:55 AM, Steven Price wrote:
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
> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> index e88714903ce5..9ede143ccef1 100644
> --- a/arch/arm64/kvm/mmu.c
> +++ b/arch/arm64/kvm/mmu.c
> @@ -1603,6 +1603,10 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
>   	if (logging_active) {
>   		force_pte = true;
>   		vma_shift = PAGE_SHIFT;
> +	} else if (kvm_is_realm(kvm)) {
> +		// Force PTE level mappings for realms
> +		force_pte = true;
> +		vma_shift = PAGE_SHIFT;
>   	} else {
>   		vma_shift = get_vma_page_shift(vma, hva);
>   	}

Since a memory abort is specific to a vCPU instead of a VM, so vcpu_is_rec()
instead of kvm_is_realm() is more accurate for the check. Besides, it looks
duplicate to the check added by "PATCH[20/43] arm64: RME: Runtime faulting
of memory", which is as below.

        /* FIXME: We shouldn't need to disable this for realms */
        if (vma_pagesize == PAGE_SIZE && !(force_pte || device || kvm_is_realm(kvm))) {
                                                                  ^^^^^^^^^^^^^^^^^
                                                                  Can be dropped now.

Thanks,
Gavin
                  


