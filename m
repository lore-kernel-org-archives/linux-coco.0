Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE8181E535
	for <linux-coco@lists.linux.dev>; Tue,  8 Oct 2024 02:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728355943; cv=none; b=NcGVOedETftGkb4ugaZd3s7B2O8B6w9CThIp/y6zayjPmFFj4vZi6/VtuYaZdIX06mWohrlMpeDyS2y3WCIoz0xuEe7JiseIJgqNRKSVW/3lxv/Sbdj/Yr0sA3z1mXEUFGJobIqIFaD2xC3fV4tVLHw/oz9cAu0/JtqfNHs4QyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728355943; c=relaxed/simple;
	bh=tSvTHzhJ7hY0Co3waacqVaZp8uierrT18ii5XkgbO2w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BCvIiFCGLoSwMHH5hS0e+gicCbZlzJTR7L94XsS5Dc4Ug6vlmmVST74cccuvXfXndI4q6WJjH/QMOTzZpZGxonzcvKefCY3QgsNJLRHbyaj+3YSWJmZM55ypxvXsD8GzD7WbvvoMR3TCzDLYBpgPAAntT9/JSwQgVH2IzlQargo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=f0i2Sy+r; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="f0i2Sy+r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1728355939;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=411PCtmrgkUidrOIqeQapBevB2yXfvIcGC2vMMOYdOE=;
	b=f0i2Sy+rGhZX3iH4cjjCB/lrLvSeUryU5983gzrVlUF3QoS2VhwJ6EHf3qCeE63H7OqMpW
	k+v7Ilm3TSyBN6jtvK0pwX+/2YktOXxJMY+hjxo6U5wF5DMRI0dHLCAK5yVZ3j+XwOFqbe
	kA8F3wOkVxgMNX4VMVMyZu4Ul/c4NJo=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-605-NZpKBNobOFq_e5f3Zp7BEA-1; Mon, 07 Oct 2024 22:52:18 -0400
X-MC-Unique: NZpKBNobOFq_e5f3Zp7BEA-1
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-71e0217c5fdso2411175b3a.3
        for <linux-coco@lists.linux.dev>; Mon, 07 Oct 2024 19:52:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728355937; x=1728960737;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=411PCtmrgkUidrOIqeQapBevB2yXfvIcGC2vMMOYdOE=;
        b=eCTwq375OKAcieqmSomIgz2+0pqd15p7F+uidW6KG2gEUq9BynXmN5tsYmteE/16HM
         WI2tFz/4Ecsm/QQq6Ps5TN7jePkNN1OAc5PRvNsx5viZIArpMpW4rtAm43d1JnSzKbVy
         oMxukdU4qJtvcLjdjUtjX3ZCyDWhjv+tJfav3h1IWy3b2VoSRpRVrZv8p1p9eeyaI1ih
         xppBZ7OiWrybquje7GlobQDH3XTjnSRnJl13Er/zR8TSXxonenbH3ENu+UJA3JgiYUvy
         Cew9pUu1VM6UYfPTqRhkGdTy6ghFGqqetzxYa1SE2BBTbLtAOw9k7o3SnWNsL7Ai33c3
         4cUw==
X-Forwarded-Encrypted: i=1; AJvYcCU6TR/mHb17mrtMGH9PW+HBH+eyCLSBeoxjFgz4SeSv3hzt3vhnQToTh63ZwiEaPdkSs3wC24mv1Mv3@lists.linux.dev
X-Gm-Message-State: AOJu0YxYXKT4qYyzcVbOeAFbywoiUxx9diAvKyh6os1Lx2I2V1onnurA
	WL7kE7JAzKDLyiw0SfKoswFxSunJNOZwBftgKfeHr7+U7auVPbYTvN1AyfBW5to4eFKhYfi4bgs
	czdh64sX0/73Y40jtygURJg7V5usvYcnWYpVTENxC6ZpoiMFH/z/J23AD7K4=
X-Received: by 2002:a05:6a21:a24c:b0:1cf:3d14:6921 with SMTP id adf61e73a8af0-1d6dfabc386mr1247890637.35.1728355937669;
        Mon, 07 Oct 2024 19:52:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IENsa/q7SoMe551s0e4cZsDtqunjGqFm6PflV4U0LuYkndGEcrIqyHC1aiUGs/dtevm0SUCUA==
X-Received: by 2002:a05:6a21:a24c:b0:1cf:3d14:6921 with SMTP id adf61e73a8af0-1d6dfabc386mr1247865637.35.1728355937364;
        Mon, 07 Oct 2024 19:52:17 -0700 (PDT)
Received: from [192.168.68.54] ([103.210.27.132])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71df0cd2a1bsm5112671b3a.85.2024.10.07.19.52.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Oct 2024 19:52:16 -0700 (PDT)
Message-ID: <85192743-4bb0-41bb-8ac6-6965cb149307@redhat.com>
Date: Tue, 8 Oct 2024 12:52:08 +1000
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 08/11] arm64: mm: Avoid TLBI when marking pages as
 valid
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
References: <20241004144307.66199-1-steven.price@arm.com>
 <20241004144307.66199-9-steven.price@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20241004144307.66199-9-steven.price@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/5/24 12:43 AM, Steven Price wrote:
> When __change_memory_common() is purely setting the valid bit on a PTE
> (e.g. via the set_memory_valid() call) there is no need for a TLBI as
> either the entry isn't changing (the valid bit was already set) or the
> entry was invalid and so should not have been cached in the TLB.
> 
> Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
> v4: New patch
> ---
>   arch/arm64/mm/pageattr.c | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>

