Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7CC31DA61B
	for <linux-coco@lists.linux.dev>; Sun,  2 Mar 2025 23:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740959046; cv=none; b=AOCmOLmzsxqOXvycVejqAUlxp3kaEpa4I6h3MxToSycsOvs6/j7KqKDmM0EcZZIarNNnp8jwwK0Lk1/YMrGkVDDl7NeCklm0plT7Tfh2CKjHmLPsMHyIhVUah0FCfowbpmDOQp5GF2L6mR7jBV6nkcCfO1ae+ht0QqbHZnahg4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740959046; c=relaxed/simple;
	bh=sTCLWPm34augivVf+k+p8TpTc7zDld5RdFOwiFSrPQY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UCB03RYdo6JfGN7y46k/B+RhONZnEfsL7bwSYXf19sb6aXbXLTxBJbzDcZoEXesmuQLnSd87DHmu6DHOoKcimKDEubSNUoQxXYlVvrpqq01UktvcUFcxIvB73XThszB3QkjGMH9y2qrfTBP0wb5XtvkJswAknaep1t+qqYaH7RI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UjuO6F5h; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UjuO6F5h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740959043;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=apls3JT829ifJDsJne75u3rNFMkdEv5XlW99N9rTPso=;
	b=UjuO6F5hR2Ylkj2tPt2cBDqVvmTz4M/DjPoAWMNpzpP/T8xLxbTM/5WdKNFJqGH5uVR7Dt
	1uXgoCZ6UPBUHXYU1Z/YP80b3+nwkjMwkfHj5A5SjOvJplpLtDkfz8MbbdwZotRQpBXMii
	vOn64nZUbvHujjgAsaK2G2DMAAq2/wo=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-267-v8dfOi3bNTStW4DhDB11Og-1; Sun, 02 Mar 2025 18:44:02 -0500
X-MC-Unique: v8dfOi3bNTStW4DhDB11Og-1
X-Mimecast-MFC-AGG-ID: v8dfOi3bNTStW4DhDB11Og_1740959042
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-223477ba158so119530725ad.0
        for <linux-coco@lists.linux.dev>; Sun, 02 Mar 2025 15:44:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740959041; x=1741563841;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=apls3JT829ifJDsJne75u3rNFMkdEv5XlW99N9rTPso=;
        b=op88y930rLLHYRUP3U7vA3fxaXEKvPACMvXzMwKXRYL8CkUdivvKaXWCrI4sq/fDN1
         glW3Tk4HpgG+GCkkoBjx8rn8i+S2zzER49cWjhfNnjkjDMaoqa/AXbRuwJnKVfLaxUnb
         ewJ9lha/k/p8WW1FFlHs4EF1f+M+HcfydonOVSHrH/CKp7SodlZk34aGq7bJqMl3F6qM
         p0cHUQmUv4yyGg+SFw/A0nRDyvMuujIfP+zMjJv6/SIA7ELu3UjwmwRvKxzDzGU+ne/u
         gLQOTUGQBSgWVP8Kf3fbXrIFyYCbTcsfdPfdoBysMnHBGbRqpACk3PK25a+0YalKLmkQ
         NZfw==
X-Forwarded-Encrypted: i=1; AJvYcCWgVEuQ6jlL8AOrQHT4SMPBn0gPQ6CNERLN7K0w4rCccly65ScNKrcIZfkEJTMSCS2HLB8PFn4p7tYd@lists.linux.dev
X-Gm-Message-State: AOJu0Yy5U3vivQ1R2nfA5g6q4Q3IBakgdrkCopIxFkCbqyrH/+hrXYLq
	aLMxUKvBzHebDAAvQyLqYG9kteC4AhseeQdPKf2gtKD5227iU7DPfMRM2vdlPlFNCukjVNQv2iS
	S4MueoB+R9x8DXKCOVtccAA3mjtwEKhywzdLSkn/ycX15AVCpvLiOorFtM64=
X-Gm-Gg: ASbGncsCSoHpjBu8KCwuMxOf8n9yzHG5bx2SV+XeQvx714S9PSJ3GKCzWXOIwNeuIqY
	auxjdo3F1wTs3uUUJ475EzfS/GY2seg4zRbc71DKh8HwGPT2dRJmgb3RWCtI58AVx8Ci57mi8Az
	JZ9JNtn7v6A6hy4J/jRBt8VfGMPTtVQvBQrrTIbCCaxKbq1IcEdWDewZbzc7aj5ndGwSKHL2qjO
	Wx4WeSxodH8iWEW1eQSnUsFNsbbGVvpfMNjWA9Q/qRM30XafgJZj1lGhL+pfkjvyiBOb2RWZaAd
	3T5I5mc9s0FKk5Eohg==
X-Received: by 2002:a17:903:1252:b0:223:26da:4b6f with SMTP id d9443c01a7336-22368f74891mr183107305ad.14.1740959041705;
        Sun, 02 Mar 2025 15:44:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGFYssys7UGoPXMBxe9bSswsi7jbUP9yKeJMmGxQGuBfHCIW8f2mxFgGu/EUcQbiuyd2gk6SQ==
X-Received: by 2002:a17:903:1252:b0:223:26da:4b6f with SMTP id d9443c01a7336-22368f74891mr183107165ad.14.1740959041447;
        Sun, 02 Mar 2025 15:44:01 -0800 (PST)
Received: from [192.168.68.55] ([180.233.125.164])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-223501fd28dsm65811695ad.94.2025.03.02.15.43.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Mar 2025 15:44:00 -0800 (PST)
Message-ID: <9dbebd7b-b441-405d-8c45-0dfa4d3df9e3@redhat.com>
Date: Mon, 3 Mar 2025 09:43:52 +1000
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 03/45] arm64: RME: Handle Granule Protection Faults
 (GPFs)
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
 <20250213161426.102987-4-steven.price@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20250213161426.102987-4-steven.price@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 5T9ekqslqIEI0xAi1NCxlVRMfPOVYHOQgDJdwG3OGO8_1740959042
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/14/25 2:13 AM, Steven Price wrote:
> If the host attempts to access granules that have been delegated for use
> in a realm these accesses will be caught and will trigger a Granule
> Protection Fault (GPF).
> 
> A fault during a page walk signals a bug in the kernel and is handled by
> oopsing the kernel. A non-page walk fault could be caused by user space
> having access to a page which has been delegated to the kernel and will
> trigger a SIGBUS to allow debugging why user space is trying to access a
> delegated page.
> 
> Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
> Changes since v2:
>   * Include missing "Granule Protection Fault at level -1"
> ---
>   arch/arm64/mm/fault.c | 31 +++++++++++++++++++++++++------
>   1 file changed, 25 insertions(+), 6 deletions(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>

