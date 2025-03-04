Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDA6F1F4734
	for <linux-coco@lists.linux.dev>; Tue,  4 Mar 2025 06:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741069688; cv=none; b=JyuVBPo5NkrCL6/DCK6Buo6a2SAPypCsxfONZo6IeL8g2oo50oN/SwjN0yHTaq9nH9FvJ3Q+c87fHav6U7SNxCFWfyaIkB7aKrmaSBsayAPH1i75Sp94MHBx50YCLdVNfGH7HKX6PX4u8+ypP5u9lKkr24jQGutO0TqTKh3XgBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741069688; c=relaxed/simple;
	bh=sANxphPEpJhSoJRv2v+wz0k0ncvT/idn6pMCGmv7Dyg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bjZGZjNfpgof6VTZyxEBBL5R3+hm+u1494CaKQATc+ErgrjLtzNGbGWNO9Yn9KxZoVgvF4Jz1Vq0MRYasA1ZYEwqU8QmIoWRIu6LrvG8YiRrcbqbGC9Sor6PxS1Um/aOnemVBmD7L5MI7Y55TjXOEwLm+bBHX+JlR+6QnWdtTqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iLch63xH; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iLch63xH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741069684;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iAefvd9tbj7LNYMHtdDRot9Yl7dRO2WNDbwoA2ZpIZQ=;
	b=iLch63xHmsEu5A+DvPOvFeMkcbqJ8/+1UioiD4rJzw0bHgngXQPcOxQcWh9ho8LaRzvCmJ
	DDn/dx3laB8gJtyjiVDRbow+Tp9XO89x/498UO6Cwry4a10gO3qm71MHBSlwaeUGPWrh8J
	1PyQ3eSNS0OP0c3E0tmhOFLa+XDbaXQ=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-137-N2CODmX9P9CjWFY8V8rGKA-1; Tue, 04 Mar 2025 01:27:58 -0500
X-MC-Unique: N2CODmX9P9CjWFY8V8rGKA-1
X-Mimecast-MFC-AGG-ID: N2CODmX9P9CjWFY8V8rGKA_1741069678
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-2fe98fad333so10540014a91.2
        for <linux-coco@lists.linux.dev>; Mon, 03 Mar 2025 22:27:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741069678; x=1741674478;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iAefvd9tbj7LNYMHtdDRot9Yl7dRO2WNDbwoA2ZpIZQ=;
        b=NNAVHA8PHuSFJ/QRLhm1Ou0palBD7Brrfp6tLSvaaVw0xDKWYZbU/cUGd+r1irGH1w
         Z4cu7MDwA+YQnrb9lMd2cuRml1LkLs1YFX1Cxzb9+TVX0MWStscItiKgfnQC9DBcdPfR
         +F9s8z9ROcNPmyHI8ehYo0xVbW6N+LXnXlGmx+E6YH7sjzKXoU6IjpsIS4c4+pJHpVQt
         ZfkeMV/Ec0A9dQIklvGr8RW6fKInbhnMugGi4fRNFOi2yPsxy+7LayGj+TuNpwPUCcOT
         RNDSs4J9Wg73dM8z4hDL67kBpgy6f+ElJWzQKAYHYBbEBWbnNuN15AZM3PXzh1IRq/LE
         QKfg==
X-Forwarded-Encrypted: i=1; AJvYcCW7GeYB2Q8Bns1LpWXSUtesaJzSrxg+U/+9572hsa4NttX8YcMWPwODi/Gceev9G4BFLBSbYkKrNFXS@lists.linux.dev
X-Gm-Message-State: AOJu0YwF4c6Nm8LXrO82ZKIV8e1WMmZvVYtphTiTWYMQDJHnCk94mfgt
	ozKrTLUyjsWfcK9WQTgVnY5yrMkQrCiZZN9K8jrlp71jqDNy+0jMg34hnBpRaoGrDYzQM4lsheH
	hhebUGR+LbQzSa7JYLg3XHeohOxrKSTvzhVllOQQZM+s+2rLU6WfIZiaWAtk=
X-Gm-Gg: ASbGnctGAkqGtUtY/PVz1kMid7+rLtUMnQ06aeY2THv+loekY7zOKSbWi7SWp0oZ1mF
	VU6tXKn3eo2uNobP8eNULlYY+ptS6Eg66Q6Em6qMg8gYInqJkCRuMUTK6zhYW/tleg03qeYmXvP
	5MJPntRcdo8gZmNExx/8vHuwvvUSeipviC8uTdtzWytlVKiH/QSYA7eLwXwxdKrnvnmOmuyP212
	+HLh28UBgm4ibn1h0IMNGdzz50L09Qg/yTHxmetetCE8N+ouTttPas8s7XICikkgL5up7X2nFu/
	oVa8BQ/+BbyTjaS75Q==
X-Received: by 2002:a05:6a00:230c:b0:736:7270:4d18 with SMTP id d2e1a72fcca58-73672704d81mr1945042b3a.14.1741069677582;
        Mon, 03 Mar 2025 22:27:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGMjQLRj3AUSUbMsClYXUXqxqJWhk5KrbeXBQgXSoViyrHJ8djjcdkYHY0nBVtVH5e57rXWYg==
X-Received: by 2002:a05:6a00:230c:b0:736:7270:4d18 with SMTP id d2e1a72fcca58-73672704d81mr1945005b3a.14.1741069677191;
        Mon, 03 Mar 2025 22:27:57 -0800 (PST)
Received: from [192.168.68.55] ([180.233.125.164])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7363986010asm5850843b3a.52.2025.03.03.22.27.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Mar 2025 22:27:56 -0800 (PST)
Message-ID: <780f593c-81cd-495c-8ca6-38ecd64ddb35@redhat.com>
Date: Tue, 4 Mar 2025 16:27:48 +1000
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 31/45] arm64: rme: Prevent Device mappings for Realms
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
 <20250213161426.102987-32-steven.price@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20250213161426.102987-32-steven.price@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: kjSEPn4d3jW-tlTDDUfceS9aX6x1ubSe3_W1Xju6iDA_1741069678
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/14/25 2:14 AM, Steven Price wrote:
> Physical device assignment is not yet supported by the RMM, so it
> doesn't make much sense to allow device mappings within the realm.
> Prevent them when the guest is a realm.
> 
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
> Changes from v6:
>   * Fix the check in user_mem_abort() to prevent all pages that are not
>     guest_memfd() from being mapped into the protected half of the IPA.
> Changes from v5:
>   * Also prevent accesses in user_mem_abort()
> ---
>   arch/arm64/kvm/mmu.c | 13 +++++++++++++
>   1 file changed, 13 insertions(+)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>

