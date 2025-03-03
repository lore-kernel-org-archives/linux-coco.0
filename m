Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE51F1E47A3
	for <linux-coco@lists.linux.dev>; Mon,  3 Mar 2025 06:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740983162; cv=none; b=CiMxFTH+1jGiiv+GOUeVf+14BGO3I7HxJ9MxgnKvyzpDN/2/igFFrh1VD/ZoJfvYT18vGlqGC2wpr7qm2OG0UiegHdfivWFrT1hvhLvmf1VziFhZs4iPwwxgDc9h+S/UQvX3sPFIzAFFu4+pTYv7zB/xzeuxLh4eKN5ow/STPLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740983162; c=relaxed/simple;
	bh=7M+DRz2hm03rBgj2x3UrNt6vpeHXng5+xitohQvfcAY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NqI5b6VVVRURlsIXnjhDVIpCRuMC2BG2Kk9w+/ZwQlgxUzzmvnPEdl/rZHAM2cBMKfLdQxFB+/XcHhTDsoNSjV18llj8EbkZhPO1fxIb7uIIosoblVHjX7KCvtmlxj3FwQz2LmqzKxnUnGixbtAzyRB+nLil1I1D+Afqf0f9I5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XjwU5P4B; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XjwU5P4B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740983159;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=N+ANXerGfs05Qx5JuBBnd1YtOYkq281duKe5pNwiLBs=;
	b=XjwU5P4BipKFB3PnMww7FkDxuhqtkJ4RXL1JGHDmcWkz79M00BeiAJ2E+HGPhuTUMpVa5G
	N0VhTQcZJCYkyflHU2iiPL8gEyKtRpFhItRtYWqyzFWyYKimVj5zNvfDVs9K4sJ9fhg7n2
	puDDYCeYZ7O6wpkdPMjrzZAgMhZ/7Vo=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-79-BLSMFMJQMx-HHVgXJuYUzA-1; Mon, 03 Mar 2025 01:25:58 -0500
X-MC-Unique: BLSMFMJQMx-HHVgXJuYUzA-1
X-Mimecast-MFC-AGG-ID: BLSMFMJQMx-HHVgXJuYUzA_1740983158
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-22107b29ac3so65953495ad.1
        for <linux-coco@lists.linux.dev>; Sun, 02 Mar 2025 22:25:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740983157; x=1741587957;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N+ANXerGfs05Qx5JuBBnd1YtOYkq281duKe5pNwiLBs=;
        b=CZ7N/Wiuqe4Xej3QaITtEi1kh72dCQU9HdU7g9F2XG6eggTXsoYAUojlo2p2Dvh/5i
         0F4qfoPP/nldsCtDidY8ohvNw/v90SkxvD2ywNmwqsf3eRsFSoX9amZ1ibQKDYw2eQWw
         TRU7dMCneSfyyUC9pMoOZp7FAHJam4hnCrBnhfsSoVA8wEW/tWUStrctfu4lvZjxgIWp
         CA1+C0331WecPv7SklJtvmfJeclA9JQQteEWgHm1+AWS7J8L4+KStTYrkse3rqQpba9h
         Yqt/JJw2SE5N+K1l2Uf9eN0QqP57qh9R4B20fis5g6HNRNShEvEKFX0MoosjPZWqUCXP
         pPCg==
X-Forwarded-Encrypted: i=1; AJvYcCV5vLTPVWq4qjat4sC5cEOzQSnLHnjc1ZUQP2yQT1woVyM3bIOHcqVSkQiYG3HkB2ouyJelIbaOprL0@lists.linux.dev
X-Gm-Message-State: AOJu0YyOCj1okxDq1eBBXeklOH1eVW2Xg6ltuTDgbDObDyAGyz9mju6t
	tVH9kUhuVfpp3dsOD6eVjJSdi1AaSGUcw2Xcj0bjBflPGD1vO2O5cWeZLLH4JAYvWgXZq1eplPg
	6jxKqUWnOhkAMMuEurVebBe3piYNIOxjeoS4COySyHzwhv/La4dnRZYfPWv4=
X-Gm-Gg: ASbGnct0lUk7LBlQwflhTGmP6fH34iSAL5f43umWXvxgX3wFwRW9vReG3cuhedJQA4G
	0lI7rblGjd0XWoO6FcoUuQwY7+Vibob8bl74FyDpjqzyR1Y4g/km+BDKRZa1K/FCnIIfZKeeFqU
	LZqfLRTX+yLvaYYKXydP9U/rtT3UoxVMfl1WXsBo/hqJ+yM8XWpVtBrA0ALNuunbeyHdQk0Y07M
	gCxgMfBdPW+IUwMqV/6y0zbWeE5854JKAzpFgxkxV4woAPnMShO7ETV3HMRbRZNBYsD0J0/n3Dk
	deqFXAn4n5kCU5D4HQ==
X-Received: by 2002:a17:902:e5cf:b0:220:ff82:1c60 with SMTP id d9443c01a7336-2234a4891c5mr239752345ad.14.1740983157572;
        Sun, 02 Mar 2025 22:25:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFpXtcArHUqT2hI5ax8evJjGCyGJEtPHCAmH1OVzs9dnw0tbzauezRsGnlG5Grz1mEDveiZtg==
X-Received: by 2002:a17:902:e5cf:b0:220:ff82:1c60 with SMTP id d9443c01a7336-2234a4891c5mr239752075ad.14.1740983157279;
        Sun, 02 Mar 2025 22:25:57 -0800 (PST)
Received: from [192.168.68.55] ([180.233.125.164])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-223504c59e1sm70112765ad.158.2025.03.02.22.25.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Mar 2025 22:25:56 -0800 (PST)
Message-ID: <e432ee67-6afb-40c8-9542-48770834ee40@redhat.com>
Date: Mon, 3 Mar 2025 16:25:48 +1000
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 11/45] arm64: RME: RTT tear down
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
 <20250213161426.102987-12-steven.price@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20250213161426.102987-12-steven.price@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: B_pY55-zt7aaf16c-oKE-aNgja083hzZFl0yoUqbPKQ_1740983158
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/14/25 2:13 AM, Steven Price wrote:
> The RMM owns the stage 2 page tables for a realm, and KVM must request
> that the RMM creates/destroys entries as necessary. The physical pages
> to store the page tables are delegated to the realm as required, and can
> be undelegated when no longer used.
> 
> Creating new RTTs is the easy part, tearing down is a little more
> tricky. The result of realm_rtt_destroy() can be used to effectively
> walk the tree and destroy the entries (undelegating pages that were
> given to the realm).
> 
> Signed-off-by: Steven Price <steven.price@arm.com>
> Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> ---
> Changes since v6:
>   * Move rme_rtt_level_mapsize() and supporting defines from kvm_rme.h
>     into rme.c as they are only used in that file.
> Changes since v5:
>   * Rename some RME_xxx defines to do with page sizes as RMM_xxx - they are
>     a property of the RMM specification not the RME architecture.
> Changes since v2:
>   * Moved {alloc,free}_delegated_page() and ensure_spare_page() to a
>     later patch when they are actually used.
>   * Some simplifications now rmi_xxx() functions allow NULL as an output
>     parameter.
>   * Improved comments and code layout.
> ---
>   arch/arm64/include/asm/kvm_rme.h |   7 ++
>   arch/arm64/kvm/mmu.c             |   6 +-
>   arch/arm64/kvm/rme.c             | 128 +++++++++++++++++++++++++++++++
>   3 files changed, 138 insertions(+), 3 deletions(-)

Reviewed-by: Gavin Shan <gshan@redhat.com>

