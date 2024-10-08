Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F35987DA7F
	for <linux-coco@lists.linux.dev>; Tue,  8 Oct 2024 04:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728361044; cv=none; b=uD1k4VaAfVS9PUb8iPtEkYG2cHYCaEVzVbloN2qoCRfN2vp0GVOxFko8xJJ549Sn75oKh2yjCj9+tCnuTbqfBbesAqZDr0Eu2cFfgBnPADgMWJP85Zm30RarpQ2b16sDwTZohlMs4LtfDOUoCYKnrAiIk4axXz96ZvNZYxTC8eE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728361044; c=relaxed/simple;
	bh=iMlXn95lsVNsLjKDst9hTcZBOaf6Cfjj7y6Z9vIOTog=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d8DquDYTsqNlBykL6Sjtu+E6Xf0iRex+ZTAj4XT/+OE+svIveTCpAbD0+Dfk0iLmSkXY58cyneMF2DdZ3k8M9jqHV4sfL5FwMDnTyXcFHQ6UwmgxJzqHlm6rKUMsyaOsOItr8aTe5aaOmWrd88CKSiYawoymNo9H2kjam5Gy9fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=D3b6tJNu; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="D3b6tJNu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1728361042;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=f61bqhCr/dcQZbMurDXm0sPwEi+RQMeAt5XgpaR2Hcw=;
	b=D3b6tJNubS0KIg+YmPnDa3ZyweYcmOHaKlBZuno7g1ufGCr6V8c7MwHhyGwu57DJ6mb4iA
	pwN3QonPNQQjp4WKSOEk0BwgwI8zx68fqrCUg4Az5DXo8bIYEBqVmFIV+0JJHjYA2r8PFT
	/3WluPZvLk1zkqr+WOjmS/GRsEJ6QEs=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-38-MQVBIL_SM0C2c2gF-Gm4aw-1; Tue, 08 Oct 2024 00:17:15 -0400
X-MC-Unique: MQVBIL_SM0C2c2gF-Gm4aw-1
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-71df2e5e4beso2782600b3a.0
        for <linux-coco@lists.linux.dev>; Mon, 07 Oct 2024 21:17:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728361034; x=1728965834;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f61bqhCr/dcQZbMurDXm0sPwEi+RQMeAt5XgpaR2Hcw=;
        b=dO4XKf2yLzmggCoal3HuU8uTbq/a8ZTu6cY0m9izSZrbmIFPjCSMnopLLt1fl3xwB7
         lN7nS1TPlrYHjfu6JhixKPbPYfSQaDc2Nxu+Vj6brcUftLbnq4CFGhSbYbyQdAwNw52d
         Ho0FGx4CLEDHTrQBKuIe15EdXhYbe2RrlQedn59ta+ScB43dejjpXApMyaX0tT6VBcdW
         PSg4G7GpGVeAT4DZ71yKqbd+k5AipuLDKSpp5VEAHqT14xxQiV7ssmFpmDxJFiw+y/hU
         a/eVlmMHgTnEObmRUt3ORw2ajCFjkC9IBYnUHQBW+eWJjUn0M+ll7bPoKDRp1xWcWVSU
         8rAg==
X-Forwarded-Encrypted: i=1; AJvYcCUmat3XO+1mQraICX7+uKWuyRzyKy4e9g8XoMSkQ1HqkmRxuhhA2DL63Gur/kuHPRkrH36ln5rGUHtY@lists.linux.dev
X-Gm-Message-State: AOJu0YzrQixndv+FeMm66P1QzIJklRE92Md3HmNjpzu9+IuFuRouQVzY
	9sjXqIjULq9DMUowubpwp7wdqhXkgiv9e3ctgR5W3EzjHTtSdeB6v6mtQETcdWTpzYAr7Wk37jX
	p+1xAK+czx2ktz4BoTdRogsAWDZeFfeVxtyzqdiWb2m5ybeQ+L2X90x571B4=
X-Received: by 2002:a05:6a00:a96:b0:714:2dc9:fbaf with SMTP id d2e1a72fcca58-71de24514e3mr21564744b3a.18.1728361034342;
        Mon, 07 Oct 2024 21:17:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFpPFYi5/75nkediY8DO4Wu6TCkkIkTn8IxFnQ74JNSHVIEvH9PD/xbYAIthgHX0w8NyyIQ8g==
X-Received: by 2002:a05:6a00:a96:b0:714:2dc9:fbaf with SMTP id d2e1a72fcca58-71de24514e3mr21564704b3a.18.1728361033989;
        Mon, 07 Oct 2024 21:17:13 -0700 (PDT)
Received: from [192.168.68.54] ([103.210.27.132])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71df0d7ced7sm5196665b3a.191.2024.10.07.21.17.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Oct 2024 21:17:13 -0700 (PDT)
Message-ID: <f0e83860-15a5-48d2-a256-60db70c974a3@redhat.com>
Date: Tue, 8 Oct 2024 14:17:04 +1000
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 11/11] arm64: Document Arm Confidential Compute
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
 <20241004144307.66199-12-steven.price@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20241004144307.66199-12-steven.price@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/5/24 12:43 AM, Steven Price wrote:
> Add some documentation on Arm CCA and the requirements for running Linux
> as a Realm guest. Also update booting.rst to describe the requirement
> for RIPAS RAM.
> 
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
>   Documentation/arch/arm64/arm-cca.rst | 67 ++++++++++++++++++++++++++++
>   Documentation/arch/arm64/booting.rst |  3 ++
>   Documentation/arch/arm64/index.rst   |  1 +
>   3 files changed, 71 insertions(+)
>   create mode 100644 Documentation/arch/arm64/arm-cca.rst
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>

