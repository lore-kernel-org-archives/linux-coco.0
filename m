Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DCF046444
	for <linux-coco@lists.linux.dev>; Tue, 10 Sep 2024 03:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725940288; cv=none; b=ghNBiI1opn/3FC0ARh6W7ey3gLmkOum2a5HNPzxn8qVeV3RuFCzJnrVfPA42t1GVSU791BLzj4Wt2dqe1BtN5I3flue/i7VpeGPPkTQSJJdu5CFAzfFeigF4fU1SQv7auDf9FKawaMtbWrBTiVix/WVE4GWeJQKEXUd3HWOsld0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725940288; c=relaxed/simple;
	bh=ccnQ8BldDhlgnZ8uiHo0FZ7kW1WSeCWe7cu8HrONIcg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Pj0bmLGq3lRkXDxlh4ChRIKEiA82QlWZO/Aku+/arePBVZ6b8ubn7BQ8HbHAhJXM81AL53nNU0oMyJDuC/Vqs6aVHnZove0aONtVv24n1SHyJ34NzH2Y5zco0XiQNWMyfHcWCv7K4vpF8ebOFRO97sH19VejbxWN174bH441Ths=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=c+5hdPHf; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="c+5hdPHf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1725940285;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/I3+YXY+JwS3qdscq18bmJNKDLcufBeHf8bjRwDJT1w=;
	b=c+5hdPHfRuuBh2r7s7bPcADU06J4M8mQz0s7v5qRGvmItZ55s4OD2fWp6c/W20kV8vEF9p
	ychf1NTz9TYg1CbfkZgcIph93vZk6jYmSOt7aYz2iX7hG719Mu2ryZZSYUsEZ8GM9AqwQ1
	4LVQVc4GaNL3hr3BrJEwNlWg2sW8RYw=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-55-HX-husc5NRaiiXIIruJv2A-1; Mon, 09 Sep 2024 23:51:24 -0400
X-MC-Unique: HX-husc5NRaiiXIIruJv2A-1
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-71791a81824so4878028b3a.0
        for <linux-coco@lists.linux.dev>; Mon, 09 Sep 2024 20:51:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725940283; x=1726545083;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/I3+YXY+JwS3qdscq18bmJNKDLcufBeHf8bjRwDJT1w=;
        b=kgEAto4z5g4WxgZQIxOMkbnnZ+RasYELye2NRAMZo9G8wryf4G+HfBLrJPzXaoKpCY
         iW+cJ1g5nyUVr22IHy6Ct3JQT5sPqP1ucnbZi5MuEe8OuZuZOnQTo2hCPyHFZJq5FZ9d
         IQTQmkBmbee6bxychEVzCR/ZRtnSmtZVU2mCJm7pro0NgXexe6i/BfbnCPkU+8d+PeQh
         RNmNQgVmj+9eEeCyCKFz55wSCVQNRI9bqYjo5Dqztv6Vjq0TFGYEcOmwrhgRt0U4gUC6
         rhUt4LArqsGx1FfezBVRwJ91KpEP+SAbbEyH+J4dREDS8d+ipAj2vsJZsxUBpuEIX25a
         0vqw==
X-Forwarded-Encrypted: i=1; AJvYcCVmVCfjREgTBfvzYt7kh1DkM7QEtviie3z8a6oYb5nUEnXEa3Hx83hm5zuCK/IEsQG5CSIAlBr9K3zf@lists.linux.dev
X-Gm-Message-State: AOJu0YzdmeXO6G+yuUTOtPw7/ywb6XXWshLbYnIUV6uyPRyA1HpfhXQt
	iAxGSmvBd+KjsS2eBuiyDahkJS2ylLTKpWVwakId++RP69wJEL6lQI1p9psp8j8gJrwZXRdqgJh
	akb2r1q0i0RK/raxz28hZWxjkGm2pGKqxixn2ouJuFO14207v/uxb2szSM04=
X-Received: by 2002:a05:6a00:17a9:b0:714:20a8:d79f with SMTP id d2e1a72fcca58-718d5e52b97mr16304615b3a.14.1725940282890;
        Mon, 09 Sep 2024 20:51:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE/d19sKSMFsfHliPT47QFiITi7JaTPVoNF1P6pGKw0CeBAi1klKPcTxxhOABv3xB54UTlCPw==
X-Received: by 2002:a05:6a00:17a9:b0:714:20a8:d79f with SMTP id d2e1a72fcca58-718d5e52b97mr16304574b3a.14.1725940282285;
        Mon, 09 Sep 2024 20:51:22 -0700 (PDT)
Received: from [192.168.68.54] ([103.210.27.31])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71908feb36dsm462585b3a.58.2024.09.09.20.51.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Sep 2024 20:51:21 -0700 (PDT)
Message-ID: <a64defd3-d202-4b65-9ebb-46821717cf20@redhat.com>
Date: Tue, 10 Sep 2024 13:51:12 +1000
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 07/19] arm64: rsi: Add support for checking whether an
 MMIO is protected
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
 <20240819131924.372366-8-steven.price@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20240819131924.372366-8-steven.price@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/19/24 11:19 PM, Steven Price wrote:
> From: Suzuki K Poulose <suzuki.poulose@arm.com>
> 
> On Arm CCA, with RMM-v1.0, all MMIO regions are shared. However, in
> the future, an Arm CCA-v1.0 compliant guest may be run in a lesser
> privileged partition in the Realm World (with Arm CCA-v1.1 Planes
> feature). In this case, some of the MMIO regions may be emulated
> by a higher privileged component in the Realm world, i.e, protected.
> 
> Thus the guest must decide today, whether a given MMIO region is shared
> vs Protected and create the stage1 mapping accordingly. On Arm CCA, this
> detection is based on the "IPA State" (RIPAS == RIPAS_IO). Provide a
> helper to run this check on a given range of MMIO.
> 
> Also, provide a arm64 helper which may be hooked in by other solutions.
> 
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
> New patch for v5
> ---
>   arch/arm64/include/asm/io.h       |  8 ++++++++
>   arch/arm64/include/asm/rsi.h      |  3 +++
>   arch/arm64/include/asm/rsi_cmds.h | 21 +++++++++++++++++++++
>   arch/arm64/kernel/rsi.c           | 26 ++++++++++++++++++++++++++
>   4 files changed, 58 insertions(+)
> 
> diff --git a/arch/arm64/include/asm/io.h b/arch/arm64/include/asm/io.h
> index 1ada23a6ec19..a6c551c5e44e 100644
> --- a/arch/arm64/include/asm/io.h
> +++ b/arch/arm64/include/asm/io.h
> @@ -17,6 +17,7 @@
>   #include <asm/early_ioremap.h>
>   #include <asm/alternative.h>
>   #include <asm/cpufeature.h>
> +#include <asm/rsi.h>
>   
>   /*
>    * Generic IO read/write.  These perform native-endian accesses.
> @@ -318,4 +319,11 @@ extern bool arch_memremap_can_ram_remap(resource_size_t offset, size_t size,
>   					unsigned long flags);
>   #define arch_memremap_can_ram_remap arch_memremap_can_ram_remap
>   
> +static inline bool arm64_is_iomem_private(phys_addr_t phys_addr, size_t size)
> +{
> +	if (unlikely(is_realm_world()))
> +		return arm64_rsi_is_protected_mmio(phys_addr, size);
> +	return false;
> +}
> +

I guess it might be better to unify the function names here. The name of
arm64_is_iomem_private() indicates the IO region is private, while the
name of arm64_rsi_is_protected_mmio() indicates the IO region is protected.
I think it would be nice to rename arm64_is_iomem_private() arm64_is_protected_iomem(),
or rename arm64_rsi_is_protected_mmio() to arm64_rsi_is_private_iomem().

Thanks,
Gavin

