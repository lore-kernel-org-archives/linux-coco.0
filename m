Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ACBF23F396
	for <linux-coco@lists.linux.dev>; Sun,  2 Mar 2025 23:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740958797; cv=none; b=HUhDcBH9powmpdl1C1s4AbSKMe+cGI97h3VMVHuwoZiPXtT8qEwZqgi4HucVObFjeYgfAzl6bH/FdvXGzM1QOo13i2cEp6y2UJw8+Yfp3U7WZPHsntpV6Qsg43bMAuqAqhKKYIHWjK9eA6CV68ANAcE+4FZiamTdv+HHdk7mOIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740958797; c=relaxed/simple;
	bh=D9aHcBSNUOKIFyFQgdytxMHadQ9miqe4zl49cgpQmPw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BBi60PFmnIL7gBm9aEusxp+vFukkJEzsS0HTZF1OGIm1X6qrKSgQ28Z6r0tnbmX33cbzxEOPzn7EX4BfFGG8icKyPvuwBCLZ/TgfsBRmP2mIkiMPHEYpXZWgP0OuvFflfiQqC7W6BOf+dHe7XgO8iYBc2YuqzY5wt5UKZyPk2Kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=R7we3vMe; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="R7we3vMe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740958794;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GBo5+OYmEobg6wfjqU2wwAFpXo5iLmkJqiW1kfdikek=;
	b=R7we3vMe93/38J4TK9zJfLwUK2mQCLw3VGmTixDN7bDbZVmnEZJa6MjnkAqyNhUreC3qSy
	75dzAXHWyPfymZR+wCVhR+ifPqSlKIJdSkPP4wtTfzEDG+wqwod56CFlzZJQ6qHKGQHBGk
	+vFPvBxUEV1IFLTsgLuYtRTMS5JGJYs=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-141-g9PD4a6VMQ6EAMIOXGhJew-1; Sun, 02 Mar 2025 18:39:52 -0500
X-MC-Unique: g9PD4a6VMQ6EAMIOXGhJew-1
X-Mimecast-MFC-AGG-ID: g9PD4a6VMQ6EAMIOXGhJew_1740958792
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2235667c974so99550385ad.0
        for <linux-coco@lists.linux.dev>; Sun, 02 Mar 2025 15:39:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740958792; x=1741563592;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GBo5+OYmEobg6wfjqU2wwAFpXo5iLmkJqiW1kfdikek=;
        b=jcgNl+jyWAF91kQeYq92DKXDLxNhLjnJuEhbDuubMy7pPvlBVp3MxluLaNG4ACVlUr
         kOXxwbzUssenwoKLPgeHotseaZ2glaLBbv0q71F/OsK1efH9oBjrLAf8ZF79DpWuVheD
         L/1lKgUZ8CPRrB9HGQmGmEuztW6dMI6i67W9iLOjI7GfsU6wiYH8t3iardmH+TrB1hlQ
         66a+NaZy59UDsA+YO0IHNfwLZLe9FDNE1x0LECVhBPxj6fP68AtXVTVFdWcmPB7zAvKA
         ci4BpFQ4IcCbeDjqoiueyh8iQf9seRyfElPWcrGKQatLGOsukS5Qbe7xfH+kqgq5eCom
         SL8Q==
X-Forwarded-Encrypted: i=1; AJvYcCUkTswtGhmgWx/TOn0+vWLQn8Q3ogeaPr2/pE49QYKSmdxJQijM8OR+SOnUt0R71HBpts5NS0xvDk2i@lists.linux.dev
X-Gm-Message-State: AOJu0YyNUp0h2G7I+DjhdMQ2PJEGhqaElEAY1HtIk5k5kUBXPjwIdJI5
	f+nLUNBazmzm6rU+8NEodBpczFFfnjv6z+Yk7vl2X7HcUmMheWBHDIJjEwNNvSgr+ub415p9JG8
	szdPN3ArzLi6yl9R/d9dalO2aoESyB80SFA9m2e13UNltzulRrCoNunqcPUM=
X-Gm-Gg: ASbGncuUArJiFyLP8KSqS3FZivkrYrYcm1J3dEMkOjmplOmkfh04qRuocUzcPk5q97t
	jxCCrkQUiMMBPPKCFv1Ub/BymryKKMOnPVw+GPgtZrB5i52OqIGUFnn1LBVgg7V/7juOpSk4HC6
	qalsC4y8oOoT5s39TgyaESDBHGcowtPSDYgRFEI+x3XTTbysTIxrG3U8YrD4Qm7pOZDZ+0ypwq/
	P8zBi7iYbeYKqJ2IOyZDxg2+ocAW/5oN02ARtb+owIdLKLJM/arSIqEvIjPzBjKS4SPRKR7lamY
	l7anl9Hxafsh4uqdzQ==
X-Received: by 2002:a17:903:32c8:b0:220:be86:a421 with SMTP id d9443c01a7336-22369258505mr198701965ad.38.1740958791839;
        Sun, 02 Mar 2025 15:39:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGtWQhLEYN86O3XnJuZetDZhwrb65+Q6vvyxqpw4uBVTdAA/3YJ21/tM+WdLRJLHGH6Np0Auw==
X-Received: by 2002:a17:903:32c8:b0:220:be86:a421 with SMTP id d9443c01a7336-22369258505mr198701625ad.38.1740958791506;
        Sun, 02 Mar 2025 15:39:51 -0800 (PST)
Received: from [192.168.68.55] ([180.233.125.164])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-223501d26acsm66078035ad.9.2025.03.02.15.39.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Mar 2025 15:39:50 -0800 (PST)
Message-ID: <a7077902-4286-4b3d-913a-20083ff260f4@redhat.com>
Date: Mon, 3 Mar 2025 09:39:43 +1000
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 02/45] kvm: arm64: Include kvm_emulate.h in
 kvm/arm_psci.h
To: Steven Price <steven.price@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>,
 Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>,
 Oliver Upton <oliver.upton@linux.dev>, Zenghui Yu <yuzenghui@huawei.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Joey Gouly <joey.gouly@arm.com>, Alexandru Elisei
 <alexandru.elisei@arm.com>, Christoffer Dall <christoffer.dall@arm.com>,
 Fuad Tabba <tabba@google.com>, linux-coco@lists.linux.dev,
 Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
 Shanker Donthineni <sdonthineni@nvidia.com>, Alper Gun
 <alpergun@google.com>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>
References: <20250213161426.102987-1-steven.price@arm.com>
 <20250213161426.102987-3-steven.price@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20250213161426.102987-3-steven.price@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: xerGC8aYAwKKXjhppd3yG18MivaBE16aQfRCROYw_2c_1740958792
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2/14/25 2:13 AM, Steven Price wrote:
> From: Suzuki K Poulose <suzuki.poulose@arm.com>
> 
> Fix a potential build error (like below, when asm/kvm_emulate.h gets
> included after the kvm/arm_psci.h) by including the missing header file
> in kvm/arm_psci.h:
> 
> ./include/kvm/arm_psci.h: In function ‘kvm_psci_version’:
> ./include/kvm/arm_psci.h:29:13: error: implicit declaration of function
>     ‘vcpu_has_feature’; did you mean ‘cpu_have_feature’? [-Werror=implicit-function-declaration]
>     29 |         if (vcpu_has_feature(vcpu, KVM_ARM_VCPU_PSCI_0_2)) {
> 	         |             ^~~~~~~~~~~~~~~~
> 			       |             cpu_have_feature
> 
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
>   include/kvm/arm_psci.h | 2 ++
>   1 file changed, 2 insertions(+)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>

