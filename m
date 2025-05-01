Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A4551EB193
	for <linux-coco@lists.linux.dev>; Thu,  1 May 2025 03:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746071447; cv=none; b=BWKGrGiHyQlPUWENAIclz/ETI+gBj225L5ka3ZuvHrQwNzDu8WsyvS7mainKUDwxtyD1hnPZhfgLBSjfzvnhw/K4vP9AoijoaXkAF4vPscHVFVSiyQiVgXKAYFKJR+6mNtsOZQ8OmXgaP06aBn8sJZm2cy2PA6fFqpTgGSAd5yI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746071447; c=relaxed/simple;
	bh=2dAVFnoSWIkTOqjHfYENLB8pzU1NdvuV0xq8Gvel9G0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Gejz3FMwUc2p2UZR71bpqU/CBKKqaT6zjLpC7ulf516MN132iNFaMWxhZSNUHsagWYs/unM7K5c/L+QlmYDdoIkuk2UHL9uQBanug0/MJFRuyidb+kJBBaeFgY1HYc8+Y5pXZl3NN5LpfCiFVTxIfggX5mGRciytZag/KR7ndls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IQWibwIc; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IQWibwIc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746071444;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xu+Kf0+DFCNXRO2ndZGA8xUx9TD/werA57XUeiFDww0=;
	b=IQWibwIcdfF/tz6XEWtD69Y1E/jrvkb0eq6SmtQgm9vHB40Dx3kTY6bgi/7VmTXnLwLtdX
	O5EnP7FCTnfsFxF38MrkTFgB0XNUmimQMjEia4geXwnjptjzG9yGqQ6ns15Jej8fjhOHhY
	Lagw9xCQvOAg30I/L/5WGh3xgWRkNFU=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-623-OMflJPWFNaaVG1xyKUgnkw-1; Wed, 30 Apr 2025 23:50:41 -0400
X-MC-Unique: OMflJPWFNaaVG1xyKUgnkw-1
X-Mimecast-MFC-AGG-ID: OMflJPWFNaaVG1xyKUgnkw_1746071441
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7401179b06fso538964b3a.1
        for <linux-coco@lists.linux.dev>; Wed, 30 Apr 2025 20:50:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746071441; x=1746676241;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xu+Kf0+DFCNXRO2ndZGA8xUx9TD/werA57XUeiFDww0=;
        b=HNlaW7UpakhFZ7SzCChMO6UzogY6Q6xuscb9dI0ne91BJ7yqlc0/HeLRgQlL2xoM4u
         FvuLQjjDGAkI6xp1/oCUxPKJvwQMcu2NXVoQBb+JHCpLcGMTQQYf7eh8juwsFrGyabZU
         C8zpoB+mybL5WdyDdWa1ztXBJ6q+FI/Duo0ggepL09QdcH3Jw/G2xV//9VJBnC2XbBp+
         w1yrIhCoLCLU2Oh47xej606VPjcwKqQaxcJ4fUyig26CKRDU4v7JgM3AuIuSpQJAmEvI
         grJuQV3nSbAg4VC66uNnojz6IYWYfRhRf02tM6CzLppdd5fc85H/Hagut/lCe6pe9vE+
         /EbA==
X-Forwarded-Encrypted: i=1; AJvYcCXuIJcxvs44zFZGFlwQ66FI5BD82RtjewdF6ffC75KlwDlRKi7HsEn541ytnh7Ca1CJ8I/XSpv/lhAC@lists.linux.dev
X-Gm-Message-State: AOJu0Yx3e1rdDuDCtgyYBEfVmn0mIbXgi8bWhL2k8KSrJ9NLzhI7fFeS
	PTAe0s9f6/iwPqYRPy4naVGxz6gLVeA8n/6u/yIgbcc73j6iBfVagwdlpg4/7PzS5722v9PV1KA
	2s44b3Zz+8VwYItCzF3hzlvnW1ZS0I/zJduTZCejo33oCnp/iQKAeMkC/wq0=
X-Gm-Gg: ASbGncsBj1DbPbzZmxDm9i85MvYl/zSnQODy3AaAC4aZ5CwnLZgHyw0LRabD682db7r
	CYWl+tUi/j78Vfkfavm/gVYAnKQj+WDSx2NxC06ogFJf0uLWI13bMYx1HAA4+2aSPUR7rKw11Tb
	1TL2mc3CE81eypVm86REuWppiyvWIKW9yDcEdLIwy+EVL78lNTUX2O4onlxQb3UyQOUGzuz4RVc
	80C1LXY4XouMSAjSOAJwvCh1Vx3h8AL6WnfsmbAZXdqet02CqsyUBwBEkkYPtYxERQABzwx4cTP
	ptUup2bj7CKc
X-Received: by 2002:a05:6a00:2da3:b0:736:a82a:58ad with SMTP id d2e1a72fcca58-7404923a33dmr1298201b3a.15.1746071440950;
        Wed, 30 Apr 2025 20:50:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF+2TUVWiAQRNStfJKlXXyrEy8i+Rkh7KlouLhbtQWVsBfOICdI6sUfx8nwE+QueIaBYA6F7Q==
X-Received: by 2002:a05:6a00:2da3:b0:736:a82a:58ad with SMTP id d2e1a72fcca58-7404923a33dmr1298168b3a.15.1746071440658;
        Wed, 30 Apr 2025 20:50:40 -0700 (PDT)
Received: from [192.168.68.51] ([180.233.125.65])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74039a2e5ccsm2541439b3a.110.2025.04.30.20.50.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Apr 2025 20:50:40 -0700 (PDT)
Message-ID: <87f40de1-dd3b-43e2-aa67-8d7b6288acf8@redhat.com>
Date: Thu, 1 May 2025 13:50:31 +1000
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 38/43] arm64: RME: Configure max SVE vector length for
 a Realm
To: Steven Price <steven.price@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>,
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
 <20250416134208.383984-39-steven.price@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20250416134208.383984-39-steven.price@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: k7h7MVqaqTvnyHPMUuZ99c4rVWAHE6jwc4hBuh0ktEw_1746071441
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/16/25 11:42 PM, Steven Price wrote:
> From: Jean-Philippe Brucker <jean-philippe@linaro.org>
> 
> Obtain the max vector length configured by userspace on the vCPUs, and
> write it into the Realm parameters. By default the vCPU is configured
> with the max vector length reported by RMM, and userspace can reduce it
> with a write to KVM_REG_ARM64_SVE_VLS.
> 
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
> Changes since v6:
>   * Rename max_vl/realm_max_vl to vl/last_vl - there is nothing "maximum"
>     about them, we're just checking that all realms have the same vector
>     length
> ---
>   arch/arm64/kvm/guest.c |  3 ++-
>   arch/arm64/kvm/rme.c   | 42 ++++++++++++++++++++++++++++++++++++++++++
>   2 files changed, 44 insertions(+), 1 deletion(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>

