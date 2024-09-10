Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CC6917E016
	for <linux-coco@lists.linux.dev>; Tue, 10 Sep 2024 04:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725941755; cv=none; b=OvtUmvqGLRYBELVFG6sxNw2Jg8uaBsetNqxPV3VqVE2L+Cv4u/5z/mmqghjkUBhLxwwNwl7XlxMmW8MBMN6Gsz6A9C/ySoq4drjlLI522o9lOy40Z90+GqUml1fh4f+81kQdFTbn70teL5MJLJSJpSsVh1DdOMduOM2Nz28I50g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725941755; c=relaxed/simple;
	bh=gkZzcVeOY1zKE6Oa+cxE4jiLx/E16ZR2j2sfe3+e4vI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CQxEAkeEdzSJ2j4Uk8lxUe/2vYea3S3G8K2gaaWfCf+bzl/hyOs77fhlRgdOA19TbIzmFWv2BPuugEJML6Vlltd+LwY0gEuCjHzX1pHyjVayp67uTh5HcDhM0Fy1JOCJXgUXUc9ng/PtFWuFGwz6E7UgBLp/X0zkANA74cKm0mY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dqWdq0/S; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dqWdq0/S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1725941752;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=u/+FRQQ8Ru8+M5tm0CToElnSS7luR16tiIP4Dg8B3y8=;
	b=dqWdq0/SMJnTpdZNVVG3YYLM2yKiE4Uujv0Lx7TJsxW/Fj+Gx0FVNPzeKjZ39nGzzRt8WT
	Fr5S/rO9ITSDEzjFAPYaDFTlpMPUfFdw50rP12VtlE79Pocor+PBug2qT1R8IqwQHqye9W
	W5PdGKvODRrTM7YCml59ZwQvg8tl9ug=
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-442-LAPqP0FfNVymw-hccHQn6Q-1; Tue, 10 Sep 2024 00:15:50 -0400
X-MC-Unique: LAPqP0FfNVymw-hccHQn6Q-1
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-7d50777abf1so2931574a12.3
        for <linux-coco@lists.linux.dev>; Mon, 09 Sep 2024 21:15:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725941749; x=1726546549;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u/+FRQQ8Ru8+M5tm0CToElnSS7luR16tiIP4Dg8B3y8=;
        b=c1qWkhZdcafp0g+7BpystXuL1NN6uUL5DKzKug2sp75q3pvxFOvttYoLzUB0QeylCG
         3HvNo4fEjyMHk4K5687tPwCqnyIYQACTMk+VqoWG0JihFNkYa/4/2hb+yviU8TF9ebKe
         jADOeK4r5sQcDGsH7HHnpP6/Nxz2ct3Pd39gAkYUR52CuwY2l4UDqjdHRLkuu4DxA72P
         BGkIFUgkDHyd82YkLnbpG96Rb0QYoUltBl6s1ysRk/9F9bzaYM7bK7oyjoyniSrf3j8v
         MO2TPjPbS8Trtf2+HTOLhvj8oqU6NPOemRWtG2cDTbaJzwYvxdJpKrtiSw0koQH2ybeE
         VbHw==
X-Forwarded-Encrypted: i=1; AJvYcCW6Ga47TXAHHAxv6NR9Z8fJrWLyQjmFKQelJdSYHnKQMA2a+G5jcHXflCpFFvNuJYnDT4WefuG3m6VC@lists.linux.dev
X-Gm-Message-State: AOJu0Yx66NX1CT8GTHRlcLwkiq/S3TPY8WouG7U+NeTk8iTHbkYmjdHM
	5sbzDq5mE7ieY6Lej9gf8svsgoL3KFILppYpwT1s7xAo5mV3TXeKe9LynnSCgCrFNR+yNt4OnLs
	3zAeKzrdy4WT1RZlR34yurwdqEYh4Ic5/cMSdc39xg8zY52koYWSlfO43CQw=
X-Received: by 2002:a17:902:f549:b0:202:5af:47fc with SMTP id d9443c01a7336-206f0511f66mr213103755ad.13.1725941749245;
        Mon, 09 Sep 2024 21:15:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IESpzFJPvUaYPPTKHz8T4YHLbc03zqgmBJU6sgzN1/EtRPQmV6cfuytRj9V1iBRvh9wsUVF0g==
X-Received: by 2002:a17:902:f549:b0:202:5af:47fc with SMTP id d9443c01a7336-206f0511f66mr213103255ad.13.1725941748534;
        Mon, 09 Sep 2024 21:15:48 -0700 (PDT)
Received: from [192.168.68.54] ([103.210.27.31])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20710e0efbesm40682855ad.40.2024.09.09.21.15.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Sep 2024 21:15:48 -0700 (PDT)
Message-ID: <29016e56-e632-422d-a4d2-1891fad2c565@redhat.com>
Date: Tue, 10 Sep 2024 14:15:39 +1000
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 12/19] efi: arm64: Map Device with Prot Shared
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
 Shanker Donthineni <sdonthineni@nvidia.com>, Alper Gun <alpergun@google.com>
References: <20240819131924.372366-1-steven.price@arm.com>
 <20240819131924.372366-13-steven.price@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20240819131924.372366-13-steven.price@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/19/24 11:19 PM, Steven Price wrote:
> From: Suzuki K Poulose <suzuki.poulose@arm.com>
> 
> Device mappings need to be emualted by the VMM so must be mapped shared
> with the host.
> 
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
> Changes since v4:
>   * Reworked to use arm64_is_iomem_private() to decide whether the memory
>     needs to be decrypted or not.
> ---
>   arch/arm64/kernel/efi.c | 12 ++++++++++--
>   1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/kernel/efi.c b/arch/arm64/kernel/efi.c
> index 712718aed5dd..95f8e8bf07f8 100644
> --- a/arch/arm64/kernel/efi.c
> +++ b/arch/arm64/kernel/efi.c
> @@ -34,8 +34,16 @@ static __init pteval_t create_mapping_protection(efi_memory_desc_t *md)
>   	u64 attr = md->attribute;
>   	u32 type = md->type;
>   
> -	if (type == EFI_MEMORY_MAPPED_IO)
> -		return PROT_DEVICE_nGnRE;
> +	if (type == EFI_MEMORY_MAPPED_IO) {
> +		pgprot_t prot = __pgprot(PROT_DEVICE_nGnRE);
> +
> +		if (arm64_is_iomem_private(md->phys_addr,
> +					   md->num_pages << EFI_PAGE_SHIFT))
> +			prot = pgprot_encrypted(prot);
> +		else
> +			prot = pgprot_decrypted(prot);
> +		return pgprot_val(prot);
> +	}
>   

Question: the second parameter (@size) passed to arm64_is_iomem_private() covers the
whole region. In [PATCH v5 10/19] arm64: Override set_fixmap_io, the size has been
truncated to the granule size (4KB). They look inconsistent and I don't understand
the reason.

Thanks,
Gavin

