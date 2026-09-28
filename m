Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A817830D419
	for <linux-coco@lists.linux.dev>; Mon, 28 Sep 2026 00:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790554677; cv=none; b=ZxV4rqw7ky4bF0I9ilHTNpdKGeaeRt3HmyIQIZgZNxf5yPFzur6MsELqrvjLlEvKKSnSh6lCLygBcX8JnwQqBs5WnKYfWe2gT3twMvWPIkR6bU0cciTQQ1U1PepEtIGzuHDkkfGGFAG7aCw3CJD6NKwoic/JThs7LFx37tViwvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790554677; c=relaxed/simple;
	bh=ifw+HzxZH0UaVzz+sFjUcHPMO+kHUsiZo7FPvHHz3Mc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ovwJaHsTqV3p2eRHSww5HjY14ElK31PW/5hfmSYko2NSGzarV1XS48uGX/BZ5KKjKeYJ1ZYOV2vcIyYlJjabmgOrwkivejKFRu8FvI4x9YFtbZN6KoFLoehJ/5fmB+bsjHk8bLa1OEYj8jM5HZUEAYFNO6de7oIFl4thlnF2e9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=N5Zf2s/9; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="N5Zf2s/9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790554674;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2m73jnLSddTXID/zMijmWEgMqVn35akPc9oFGshsowE=;
	b=N5Zf2s/9paGkejECMnnzGPhL2prmmz5nrs1a6+1a5D/9waaYvIiybSwrk0X/s0paJjOvvr
	2LTFHaj0DbwM8IEA58W/JpcyGS2NDwNooL5Ex7SwHWTkDT/oabF+rXs0Eq/DHIjfQZWU4d
	gu3SCYc3r2oGsHoH8Jtzo6VIdrDTJJo=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-13-NTfY9V1GMdqqrIVL2mZCUg-1; Sun, 27 Sep 2026 20:17:51 -0400
X-MC-Unique: NTfY9V1GMdqqrIVL2mZCUg-1
X-Mimecast-MFC-AGG-ID: NTfY9V1GMdqqrIVL2mZCUg_1790554670
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-86b70a52946so2019647b3a.2
        for <linux-coco@lists.linux.dev>; Sun, 27 Sep 2026 17:17:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790554670; x=1791159470;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2m73jnLSddTXID/zMijmWEgMqVn35akPc9oFGshsowE=;
        b=uXc48XsYXOfse8Ueu7X/UKQ0LpquKfotaK+KXQ7f3IX548PXWjQSsyHy2SGE72ql/V
         vfdRxemOv6V8RD9Qxt/V0wmsp+EULsX3cdR2N+dTHpqOQskhj/x6yGZ+Ts7ejEavJ/U5
         vq6RZW1Hf6/pt2Bb8U4TFOyX1W/d7bXaB5yCoaw4hvOyQuZJbD1HO5gjgMCa+gnv1Rew
         SirOev0EhWt4k5j3JnJqPpgHA1HtKvVvNJpBPxL+Rel9fcrTZZ2NilTs1tX5rkplQSYh
         PrYHAolQdAZwDxLqJlZfLwJ8PGK2FTwuu91UYx5xVZQHHDo9UxE+o/Fok5QjYdbpMOP1
         uPCA==
X-Forwarded-Encrypted: i=1; AKwUvBxpgOzov6VfgeTqceBVguoZo0mlvcAFQOPtyPwum1wqp4mSScgYGP3IXHAoPwqDQgVawPbf01IpFzul@lists.linux.dev
X-Gm-Message-State: AFuF++lVu8b4u5ePxWlo6HZRojYwjYx1cyzy0nflb7lNzvTLn0zQxkiI
	IsyOXzvFaVUeFJiKximVQbPSJMgy81yT5rEmOyrhceUX//kJdRWsciqYn9CBOfNqDpmo5txyf5r
	YhUM/I+LU6zIWWoqTmL6KSXtdPnpssmWY+0z5TGQCNRhh4lq4VRaEY1WBJdL6Ces=
X-Gm-Gg: AYBFou1RUkt9VYiHka/UepcdH2ZE2THuxLtIVf86ey/q/UgGzhGuZhKZHfwEgAf5GMv
	1aPuwrk3rnY3oyfInTbvkGau3DqFCeHf949N0urYtCQyd/CGNSLuKIRjM/VUFW/qWDJbRnsSCI2
	sJS+FgowwsSEf8Kj5u22ccDIpaYyFbBX5L9Mk5HHUGTx0fkj6g0IyfZxt+N5wYcti3dbv92+inw
	fBD7Unf9xKHbFGrtyMlyH+eZMRh5xHHyouDUoJzKG6wi6q7bjgGcIotkY210ta2T2RxOCRDBsDQ
	wVfSEVKAzB99PiMYtZdU7IdQ/gS2k+mkaCNVM14brPPUb5pOQbCt/f+gR6QqviWnIVfl8wcYuUS
	z4YGSTHxJouSe+v7xDMV9snkYtfXB+9OVk8ejS33QLA==
X-Received: by 2002:a05:6a00:90a6:b0:878:34e7:9a3c with SMTP id d2e1a72fcca58-87e9c06a4b9mr9378144b3a.53.1790554670302;
        Sun, 27 Sep 2026 17:17:50 -0700 (PDT)
X-Received: by 2002:a05:6a00:90a6:b0:878:34e7:9a3c with SMTP id d2e1a72fcca58-87e9c06a4b9mr9378123b3a.53.1790554669847;
        Sun, 27 Sep 2026 17:17:49 -0700 (PDT)
Received: from [192.168.68.52] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-880951dbb8esm2754588b3a.24.2026.09.27.17.17.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Sep 2026 17:17:48 -0700 (PDT)
Message-ID: <ca399842-678a-4c82-81fb-2c66b95329bb@redhat.com>
Date: Mon, 28 Sep 2026 10:17:40 +1000
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v19 08/20] KVM: arm64: Reuse kvm_stage2_unmap_range in
 kvm_unmap_gfn_range
To: Suzuki K Poulose <suzuki.poulose@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: maz@kernel.org, will@kernel.org, catalin.marinas@arm.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 steven.price@arm.com, aneesh.kumar@kernel.org, oupton@kernel.org,
 joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
 linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
 sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
 WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com,
 Fuad Tabba <fuad.tabba@linux.dev>
References: <20260920212845.707-1-suzuki.poulose@arm.com>
 <20260920212845.707-9-suzuki.poulose@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260920212845.707-9-suzuki.poulose@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 6VHZ5-qPH_AIxAK1-GbqZfz1cZckIOuJ_O78p9A51fQ_1790554670
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/21/26 7:28 AM, Suzuki K Poulose wrote:
> In preparation for adding VM specific backends for stage2 operation,
> switch to kvm_stage2_unmap_range() instead of __unmap_stage2_range()
> from the kvm_unmap_gfn_range(). Drop the bail out check for protected
> VMs and defer that to the one in kvm_stage2_unmap_range(). Later we
> would replace the logic in kvm_stage2_unmap_range() with VM specific
> backends.
> 
> No functional changes intended.
> 
> Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> ---
>   arch/arm64/kvm/mmu.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
Reviewed-by: Gavin Shan <gshan@redhat.com>

