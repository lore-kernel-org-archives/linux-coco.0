Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E67F8356A38
	for <linux-coco@lists.linux.dev>; Mon, 28 Sep 2026 01:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790558985; cv=none; b=t2OIhycCO4b1KredLYFUJ+C4cZHb9RJX1NyLEuT14p22aSTvHVzBwSajeL5c7eIqS6bROOqxPXYESdYyaUkSo3dejrc03CKdyKDvT9iCWLJV3o24baDECQnHNhQBw02ucCMdYaP8KN9Et4z2KFnywDpUigGpoqG34hR6sG3th7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790558985; c=relaxed/simple;
	bh=6l5SM3odIjYsratn5+hyANF/3A4SjCbou9O2TWWTn/s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TQt1uSKGme8bmPIZXCy+CsyEGuIwPWDrE+cF9iNtwOso68rZrH83s5HmQNTzK/iY44eFlCpMdiEoLG8y7jHw4+sdNQpJ7ZIQTscybLdxram+slrqPuOlokblz8G8PCBoK3W0FGwdrODgU8q5DppcrYKldPjtR4jWUCV1lYkjjTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KSDwrziq; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KSDwrziq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790558976;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gPTRGSRmIEuAgsqdZVsCgUbEv8K5pyxuaYYIDQSv9zo=;
	b=KSDwrziq48M46PzA4sz3ZSf+m36zmFbBnu5O+eDDYZGAz7DZBpjPnLSii3S0K9YPMy05zP
	5CRv1/CtJ/AJkMF0PM/FsTvWTxRnuoHIRmfWdsxHucojXa8DiBvFALC4kmQK8QKYRExMj7
	paK1b8YhxqnNylkqAS09X70aulfWH8s=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-225-FQMPTseDMbuRbn37mhCcLQ-1; Sun, 27 Sep 2026 21:29:32 -0400
X-MC-Unique: FQMPTseDMbuRbn37mhCcLQ-1
X-Mimecast-MFC-AGG-ID: FQMPTseDMbuRbn37mhCcLQ_1790558972
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38e8fee6af3so2415878a91.1
        for <linux-coco@lists.linux.dev>; Sun, 27 Sep 2026 18:29:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790558972; x=1791163772;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gPTRGSRmIEuAgsqdZVsCgUbEv8K5pyxuaYYIDQSv9zo=;
        b=OHtycG7ma6S3QIoFEeDleZh+5XZpYcmj/LmL5f5Fl82OVoxcyBVGD1b/ZZ5S04Df9j
         FW0cBpuzQqOznn38WJJMtID4V4DF5sndczkogb5s46VW8/uIJDKNiW4Hi90lVtsaYWlM
         PCwh3MUM6hfMQotIlOnEsMa4vl8NCDfpyuERnKDluixf7gFvURrnJma6yJbZ98/4vAQU
         DpYePpX7P/u40ur7TEDLG7s8amYmemu4xpiqnaSvgHHNfG1Q18Get/qKHBzkcCle8Nwi
         L/661ivJnF2o9LwxFFdxQkHGy6plCJXQepezvQwMz9psfAxOt0scXg7OulKFI82N9cY2
         t05A==
X-Forwarded-Encrypted: i=1; AKwUvBxhPdJvL0xEauDVPBSeAJCgf3e8XFnq2T+xrg4EdOZyx/y+afNWsYCZBraRuJ7rQj2CHsel+mYl+fDS@lists.linux.dev
X-Gm-Message-State: AFq9FYKCUbgw+QoLwhSBEt0UkI95ifURUeOEBZzBOTFjC9Jt3tHgxjXH
	e3/N0Ptt0dgSyAjbpF+Y/+C7CBh1GNHrsHCUKIqHsCB7ZobTflNXD1Tmw9hRTm5xnWpoJWCcE9q
	PHX1iaiCkRKlnXXVPTS4B3C+XDgVurBx2qafQUDHVFodNZBPvHpUyRenOYfIXcxc=
X-Gm-Gg: AYBFou3FL06A+4FUQT9ZOY0FGWXALI/r2DKmRkSEONyg9XhkHDJcHaKAmtuHAxq3cWG
	oZK89g82d9j0DtlLqAfxkPXpzKd7FGKDxK6yp8lzl4IzgcJAxOmyOINF0TXPO/ARs4onZALQI4e
	yY7bysTXnYMbheozthaQV/DiAr57BL3/vGqPxHgxYjME7wzoAP08rfbiqABc7EaSB0JP7HPlBlW
	vmgjeb2slGJzyHVagRM431N714/yeT1yHHIFzRj9MS+yX1KwDqnZwanLTfPVo5ZZGO8PP7x4Pk9
	oAufbeOe5S34ctrH8r7rTS7LCyBqrvlVGQYZGh0TksxqNxM901q68yT8ehnBu9HkkPiCkjhXUNw
	Z684hs+gAF32EMtTpJ4XM+vITw203c/GpnT8zvpcc1g==
X-Received: by 2002:a17:90b:2ec4:b0:3a2:b59f:639b with SMTP id 98e67ed59e1d1-3a2b59f6deamr1580717a91.54.1790558971584;
        Sun, 27 Sep 2026 18:29:31 -0700 (PDT)
X-Received: by 2002:a17:90b:2ec4:b0:3a2:b59f:639b with SMTP id 98e67ed59e1d1-3a2b59f6deamr1580702a91.54.1790558971111;
        Sun, 27 Sep 2026 18:29:31 -0700 (PDT)
Received: from [192.168.68.52] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df913ddc55sm32916295ad.23.2026.09.27.18.29.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Sep 2026 18:29:30 -0700 (PDT)
Message-ID: <d1ad37f1-f87b-4812-a202-8b5e949fa1a8@redhat.com>
Date: Mon, 28 Sep 2026 11:29:23 +1000
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v19 19/20] KVM: arm64: CCA: Expose SVE VL register before
 VCPU finalization
To: Suzuki K Poulose <suzuki.poulose@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: maz@kernel.org, will@kernel.org, catalin.marinas@arm.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 steven.price@arm.com, aneesh.kumar@kernel.org, oupton@kernel.org,
 joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
 linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
 sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
 WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com,
 Jean-Philippe Brucker <jean-philippe@linaro.org>
References: <20260920212845.707-1-suzuki.poulose@arm.com>
 <20260920212845.707-20-suzuki.poulose@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260920212845.707-20-suzuki.poulose@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: qUHu33SKmmuhVsgCt0PJI3pt2fQ9YCIgf2LzgfZLqvI_1790558972
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/21/26 7:28 AM, Suzuki K Poulose wrote:
> From: Jean-Philippe Brucker <jean-philippe@linaro.org>
> 
> Userspace must configure the SVE vector length before the Realm is created
> (as it is part of the parameter for Realm creation), but the Realm VCPUs
> cannot be finalized until after the Realm Descriptor has been created.
> 
> KVM_GET_REG_LIST currently rejects the unfinalized VCPUs, which prevents
> the userspace from discovering and configuring the VLs for  the Realm.
> 
> Allow KVM_GET_REG_LIST for unfinalized RECs and make the SVE register
> enumeration handle the unfinalized case explicitly. i.e., only expose
> KVM_REG_ARM64_SVE_VLS before SVE is finalized.
> 
> One adverse side effect of this change is that a KVM_GET_REG_LIST call that
> only probes for the array size will now succeed even if SVE is not
> finalized, but that seems harmless since the following KVM_GET_REG_LIST
> with the full array will fail.
> 
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> Signed-off-by: Steven Price <steven.price@arm.com>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> ---
> Changes since v17:
>   - Rewrite the commit description to clearly describe the purpose
> ---
>   arch/arm64/kvm/arm.c   | 15 ++++++++++++++-
>   arch/arm64/kvm/guest.c | 10 +++++-----
>   2 files changed, 19 insertions(+), 6 deletions(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>

