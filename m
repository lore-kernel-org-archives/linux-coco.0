Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF04B1FDE1A
	for <linux-coco@lists.linux.dev>; Tue,  4 Mar 2025 11:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741089100; cv=none; b=DcNNbtamTewErxWieu3f5chzdO8hsde62pEhx59xAf8BZUIrU9ReuCE/a2LCclJ11WeXT9DQumCOxUsHwEsCS4RwNNJJshAUBsvFCr0bzJKOsfW4Mjx0X4jEjfZSbopP9oi+TuA5h9uq534yksu/gExSNViJQlC4avBIx9r/9K0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741089100; c=relaxed/simple;
	bh=yWbmFnDDcW7+/qnqF0tm/sx+AWkJjTYVTQwvn5TuuzI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=glKW65BFkI1O3RowPyyf9SmYlUylxKsdt2Mi7w/XbSEe5Ow584q9n58MIrPhBFZfhFwrXGaRkBKFP+hScTsznyn+iRGlfvOd5VSsqyo4d3uwFn/2la/oNBJ3tvmvNeXDGM3+LTdZOVYnj0Wh4ie6Bj8xIW6ZpGkbRo74pXo2DjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YNvLCemJ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YNvLCemJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741089097;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9SvHiAzkhpGOwKIBXJW3ZvTlN3vuL1LXpAI2oO3MJds=;
	b=YNvLCemJTRA8RCZdFg7mYgXMDzdtp7Ca5LEuaGUwgibWL3m4zNcT67tUHK8ihToPVNBYnN
	76C+0WJgu0Ujhwztl7de/4DHXbiYtePKRwWIMyElXcfllnRfRPZpQnm0FDba4Prds/Arug
	RALTztKxBkNQ6bMMa4i9h62asxoFeJI=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-690-rz7Y3Je8PFeyCEG_q9RZ7g-1; Tue, 04 Mar 2025 06:51:36 -0500
X-MC-Unique: rz7Y3Je8PFeyCEG_q9RZ7g-1
X-Mimecast-MFC-AGG-ID: rz7Y3Je8PFeyCEG_q9RZ7g_1741089095
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-223725aa321so7029395ad.2
        for <linux-coco@lists.linux.dev>; Tue, 04 Mar 2025 03:51:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741089095; x=1741693895;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9SvHiAzkhpGOwKIBXJW3ZvTlN3vuL1LXpAI2oO3MJds=;
        b=vQz4ptui4FANabchBeW/OfpUKAYigrWBFp+PVX8Yz2qfj5tcqo4G5E3slL70U5wfC8
         yv4nk4MrHmh1c50mKS4HQARoVcTQ6IDjIEk02kSKmKfGmOqdB60xaN+q5Bae4zZlmZmZ
         BddOVvhE/rjZwJpQAMMWVBns86DzDnrZzv5LKA9aQMgQJrdeiO14OKK8NS3ClrgBOjIl
         C0oRTVSCaitwzKLWEwidcf2A1srucJ16EeCNcxHeiMi++f2z9aI9bgJUaLCD8ziJZnQk
         XlDhvB3Go2uvBZxLtoRVXhQ/LhXvL6dTz2NtGlmQIm3ahpYXDIOFJTE4DKYpfPrStJup
         aLRQ==
X-Forwarded-Encrypted: i=1; AJvYcCUsUlGdLOTd/RisO7XEy7/LkkBzPAPsz9hrkjkRXaworAK4Kqhd9kTkvpJtQ8ExkjMLiYNC9WVbwU8m@lists.linux.dev
X-Gm-Message-State: AOJu0YwGCWKsI+YXQMLPLHmAyhybPuROSqQW8QBalHXRDPNu4zzPtTQw
	H8eKm3QpRSNo0zQrh5CV7sy7J2zaaqmaxEpMMWYaznR8vUbwbqngjH2KOiEut3Mb6pl8Yzx9mto
	ZCJfOOFAJm1v4AJtipgh95QWHYDRmzUxK3ryDKUISyhlaga+z0hOCXUz4SYg=
X-Gm-Gg: ASbGncubN30Q75nG9RrYhv0CAHHPZImC2WXB+cQmR0Q50u1KFO2kmqdqB1vEia6IdVT
	1SR7x1jwvsWSDOMp0qxIjurNsAwlb1Q5du18e1TAP0CO+iNy/+Y/ezvt+TyG8cNgLVy/SlKFWki
	w9uXqbxUOsAbNvZOIqbRms1lV/7/6RS0ErPXLp7wKLUTgsZWLNW93bjC9LY/5zH6Zyr8n3+7Ius
	85WAd6WgRypkGnz05VaR6dC3R7PDTtDK7MOlpm3RID++kvWXYM/81fY0Mib2/SDPxAY/QtUMH+P
	Tb4Rrw7BvuL6tXc/fA==
X-Received: by 2002:a17:902:d48f:b0:220:c164:6ee1 with SMTP id d9443c01a7336-2236924786cmr286757025ad.32.1741089095305;
        Tue, 04 Mar 2025 03:51:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGqkDc//0lhtuEEGTLRirsOl+2zU34lz3XcWjEj6faC+59ETLrTC0850jV9RLUFK6Nc4S9jqg==
X-Received: by 2002:a17:902:d48f:b0:220:c164:6ee1 with SMTP id d9443c01a7336-2236924786cmr286756495ad.32.1741089094965;
        Tue, 04 Mar 2025 03:51:34 -0800 (PST)
Received: from [192.168.68.55] ([180.233.125.164])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2235052beaasm93466525ad.233.2025.03.04.03.51.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Mar 2025 03:51:34 -0800 (PST)
Message-ID: <32a09a27-f131-44dd-8959-abb63b2089a8@redhat.com>
Date: Tue, 4 Mar 2025 21:51:26 +1000
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 34/45] kvm: rme: Hide KVM_CAP_READONLY_MEM for realm
 guests
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
 <20250213161426.102987-35-steven.price@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20250213161426.102987-35-steven.price@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: WPi-AoM4MXC5B4nT-QllLT8Yl1IFCaAU_g2bnUbxuS8_1741089095
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/14/25 2:14 AM, Steven Price wrote:
> For protected memory read only isn't supported. While it may be possible
> to support read only for unprotected memory, this isn't supported at the
> present time.
> 
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
>   arch/arm64/kvm/arm.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 

It's worthy to explain why KVM_CAP_READONLY_MEM isn't supported and its
negative impact. It's something to be done in the future if I'm correct.

 From QEMU's perspective, all ROM data, which is populated by it, can
be written. It conflicts to the natural limit: all ROM data should be
read-only.

QEMU
====
rom_add_blob
   rom_set_mr
     memory_region_set_readonly
       memory_region_transaction_commit
         kvm_region_commit
           kvm_set_phys_mem
             kvm_mem_flags                                    // flag KVM_MEM_READONLY is missed
             kvm_set_user_memory_region
               kvm_vm_ioctl(KVM_SET_USER_MEMORY_REGION2)

non-secure host
===============
rec_exit_sync_dabt
   kvm_handle_guest_abort
     user_mem_abort
       __kvm_faultin_pfn					   // writable == true
         realm_map_ipa
           WARN_ON(!(prot & KVM_PGTABLE_PROT_W)

non-secure host
===============
kvm_realm_enable_cap(KVM_CAP_ARM_RME_POPULATE_REALM)
   kvm_populate_realm
     __kvm_faultin_pfn					  // writable == true
       realm_create_protected_data_page

> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> index 1f3674e95f03..0f1d65f87e2b 100644
> --- a/arch/arm64/kvm/arm.c
> +++ b/arch/arm64/kvm/arm.c
> @@ -348,7 +348,6 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
>   	case KVM_CAP_ONE_REG:
>   	case KVM_CAP_ARM_PSCI:
>   	case KVM_CAP_ARM_PSCI_0_2:
> -	case KVM_CAP_READONLY_MEM:
>   	case KVM_CAP_MP_STATE:
>   	case KVM_CAP_IMMEDIATE_EXIT:
>   	case KVM_CAP_VCPU_EVENTS:
> @@ -362,6 +361,7 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
>   	case KVM_CAP_COUNTER_OFFSET:
>   		r = 1;
>   		break;
> +	case KVM_CAP_READONLY_MEM:
>   	case KVM_CAP_SET_GUEST_DEBUG:
>   		r = !kvm_is_realm(kvm);
>   		break;

Thanks,
Gavin

