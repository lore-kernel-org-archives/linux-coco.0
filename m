Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29E998488
	for <linux-coco@lists.linux.dev>; Mon, 22 Sep 2025 00:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758499403; cv=none; b=DUFtwlfFtOqmmqjCb97WxjxdpIoH6LUq9AvM4NjuYkE8vjsXCv7kaBHzIjcd5WuzI2KV+PdstUppiXIUVNTo5E8ctDkSGvt7A8GC0WOOyHgPgkhCbcniKPWacRYT8dalRS5ArNIg6cOS9qscLfX1VOitXwBcGJjmebBhzLCFg8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758499403; c=relaxed/simple;
	bh=5S1RAPbr3qVsBqfhEwUmh/5GNlslYTzXJY2zUUc9kcM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FPeDjtiCae2BmqfbpO0BauzuIf41N3DWC66eA6YrP0/LVyhrJ/kbOWHQopb7nml+agsP7d2WAVprDSgiE4yprnR6ZOm2fiPoPkRAai/ZN1Te+/UPosOMlot56kQXJKaT0jEYI2rtp7kcLiJO5Kj0HhHgOovZGJd6rDEaE7YxCJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LsdmvbXW; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LsdmvbXW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1758499401;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PDXuqYgBTFSeTj9HmL3kCs/tVEJAWswdP19jlLEVGcM=;
	b=LsdmvbXWofc6PRa7bwSzMMOOyB/NYk2S1hiedUqC2QcEOfK8P4tcutlO5AkyNtxCr2WhtW
	sHu2LERZXDpQMpQWYy7PBNe1RlXA+1vEhUZlF5WwKvXRSSxCYwd9kExk8e5FSECmkJ1UmZ
	+noeM2MXkrVIK3wiaE5pfFzN9D9JKuA=
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-112-b2E9kW6lO4-PqEKO9bLOqg-1; Sun, 21 Sep 2025 20:03:19 -0400
X-MC-Unique: b2E9kW6lO4-PqEKO9bLOqg-1
X-Mimecast-MFC-AGG-ID: b2E9kW6lO4-PqEKO9bLOqg_1758499399
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b5514519038so3751780a12.0
        for <linux-coco@lists.linux.dev>; Sun, 21 Sep 2025 17:03:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758499399; x=1759104199;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PDXuqYgBTFSeTj9HmL3kCs/tVEJAWswdP19jlLEVGcM=;
        b=IgGz4YRmo9HtVO9Yk1jUlervxoizbInEm6BuYoxrLjO83B2Og8j6UpfkikccpO6HdM
         xH1ZhjMfju8UTGtScA8Hx3I6zfqjTJITP+auQuybkLoVCd05I1lnUVgC/ftPnet2j2Br
         MxqepiD94sIwpHAVj37d7N6LZucLqVhEWHCklhmOl7Ppl+fbXQZy4PtRO4hZSWaEfFhn
         978/DXzZCu7EpkCdOujd7Zhr6cR2VUvQXiPtHjOr37tgCM1x1/y2xLLpksyqyXbylNT9
         VkA5F/hyX3PHDr1gSGfobDML4aOg48BlUp/xHn3ZufSa+K7ecCliXnEMBA/DmnQs21YC
         mO/g==
X-Forwarded-Encrypted: i=1; AJvYcCXyqqAzs5w6uHrk1w70RUw8phAzwHVV78IuSUPnF7SRSwvQYf5T6E0LfxKl58FeY652K2XxYmnNnIE+@lists.linux.dev
X-Gm-Message-State: AOJu0Yws3zhUptuPkgWw8tkWXuadiSqR2P+MQzju+eCl11rYc2wJECfj
	gL+MeZaxqhys6H2hffoTGDejjF4QTjt5G4p9GFFTjgh0D351Z+8VZqilhzLDn3SP6M86KMpDYVs
	QKyezSf/uTqJICZMzWCeP6gSi0202GMgot9/F5w4ACwGvDpFhkMHlq0ofhOGU5Ow=
X-Gm-Gg: ASbGnctZpIUsYKVFlmyoNlYsDEPgjhLx6vzihPikeexL98p6rrX+cJuPiOxB12rFDzQ
	H1V+UOtMFHceUXPEgc+/0FNmMWMwowYq2aterhqyEGklupKUn8sPwEICbj3/iD1R1WcyvDEErFQ
	afYGX3xhXburEZQzK42/R3mFXxPosIiJV8zMVm2OELej/eKtUlBD+NemOrAn1WRfOH4jW0460tD
	AAkp/Ny0ykVsRI2ND4MhxLDEgBx6pWCtzCXoS7r3T1UoETgv3MKp/De8eYu12WEJ1mPV82z9tW0
	76HC9qLVxVpmEuMG1p35fcS5cRUrfkmF5noXZzHxuXEG8SGLo75lyv762jSe1xn2k04kzUhbFUq
	ePW2W
X-Received: by 2002:a17:903:2f83:b0:265:bb0:cbc with SMTP id d9443c01a7336-269ba559260mr154624285ad.47.1758499398738;
        Sun, 21 Sep 2025 17:03:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE0MfGExlYWTmOjV1WzK5kji6eVj+QSqlsV+EO7ogGlqCirbQxRS/TDHG9aRgu0NS0ideP2VQ==
X-Received: by 2002:a17:903:2f83:b0:265:bb0:cbc with SMTP id d9443c01a7336-269ba559260mr154623995ad.47.1758499398419;
        Sun, 21 Sep 2025 17:03:18 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-62-5.mrk21.qld.optusnet.com.au. [175.34.62.5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-269803601e3sm114894975ad.144.2025.09.21.17.03.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Sep 2025 17:03:17 -0700 (PDT)
Message-ID: <a836c085-9bd2-4160-9bf8-81c186f7535c@redhat.com>
Date: Mon, 22 Sep 2025 10:03:07 +1000
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 31/43] arm_pmu: Provide a mechanism for disabling the
 physical IRQ
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
 <alpergun@google.com>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
 Emi Kisanuki <fj0570is@fujitsu.com>, Vishal Annapurve <vannapurve@google.com>
References: <20250820145606.180644-1-steven.price@arm.com>
 <20250820145606.180644-32-steven.price@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20250820145606.180644-32-steven.price@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 8c0lQRewzb6aJEksnYhW7FJ3e2y7qfzXEkmqZJXmEZ0_1758499399
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/21/25 12:55 AM, Steven Price wrote:
> Arm CCA assigns the physical PMU device to the guest running in realm
> world, however the IRQs are routed via the host. To enter a realm guest
> while a PMU IRQ is pending it is necessary to block the physical IRQ to
> prevent an immediate exit. Provide a mechanism in the PMU driver for KVM
> to control the physical IRQ.
> 
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
> v3: Add a dummy function for the !CONFIG_ARM_PMU case.
> ---
>   drivers/perf/arm_pmu.c       | 15 +++++++++++++++
>   include/linux/perf/arm_pmu.h |  5 +++++
>   2 files changed, 20 insertions(+)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>

