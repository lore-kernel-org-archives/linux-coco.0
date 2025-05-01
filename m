Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AC5C1AF0C8
	for <linux-coco@lists.linux.dev>; Thu,  1 May 2025 03:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746071424; cv=none; b=hY2JotM862raOQxReSOQgkSPpMW8Oyirqt8YnPT+X449moWIF0m85jwXMBBAl2paZrUUB47wE5VKDYwpEG8br3i85BAu95MnqjPNlYuG2AS1vdzp1fvseQUMDtkfJDePehPFTSroEtiy5i/92DQ5O/hfObbYJL3mlaWhpyKfglc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746071424; c=relaxed/simple;
	bh=PO+3BQsPIF+4e0+asMRXeh+QLcIUVpdmgRa7WCUfcr8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BwIagpKBIuKW1GLN/NQcYhjkQD26dh2EJk4+s19ZZAeO/qKiXK2DZrBJFCKk1B6jMxBQJcSp1z4DouuAb0Eiy7M12heukehtDbkcSlKv3ybcexc6k1qArbXveiNcHzrA7q0aqKO4vXDLMN7nwfPmi2JZqPq9V4XQH/ytzQSd4tE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VvtVvuRn; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VvtVvuRn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746071422;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eCg3VHmOtxCvew5eYi3QzhfJ1vb1uNXc4Xa6k7JPpko=;
	b=VvtVvuRnXUp04++ObLq/ENJatsQKtnlZsf/uo3WSQWZINGiYKUCRfKCGriOFtztSDo/Dfw
	QED4ZIDmRM4RRJ8nNoI3P73z1hUmjfC5TAPIXnimrxXVipznwMuXeeQxKMfAQMasxG2cj7
	tRzelyQ/5M+X095A+kBIwCEUJCnj904=
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-335-U68AmEUUOdGpJyQHW2LX5w-1; Wed, 30 Apr 2025 23:50:20 -0400
X-MC-Unique: U68AmEUUOdGpJyQHW2LX5w-1
X-Mimecast-MFC-AGG-ID: U68AmEUUOdGpJyQHW2LX5w_1746071420
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-af8f28f85a7so340503a12.2
        for <linux-coco@lists.linux.dev>; Wed, 30 Apr 2025 20:50:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746071419; x=1746676219;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eCg3VHmOtxCvew5eYi3QzhfJ1vb1uNXc4Xa6k7JPpko=;
        b=ajV4Mu71ff+9YXppSCj7RUDcy5JJ+tecRvqCUKApf8FmbCDiFEdlVfQOPF2iC+k4Xk
         I3XYNz0nXBjXmPi9n9QT4I828n63JT171xzze8OAveXoBvQux0drm0WJ0Ny7dM/m1AV7
         dR/68MEIuFXuRB7HeqjLI1KrOlZqp/ZLkusPizzZSabco+g6Ui94Xje7HmzpahZgZc/C
         92TYrIbtPC36eYXvtIDTnYFXyXqceb0NhJIqy4OH5Ls7fqPhBY5WIsRG1Ig4qMw4goSq
         +pixoU67JH54t1wXl569BzYoDD5ldwREOpf9PEWlDHXNBDYtYIqok2QE7VaqPHRyRVlQ
         FdSQ==
X-Forwarded-Encrypted: i=1; AJvYcCWsHXCFdRgV3zMsiPGInQ4KlxenKxT2R+zN+FpnV0AJtU+oW9J4cD2Zhxd1t6i84jCDO2kIAAWTZ9dr@lists.linux.dev
X-Gm-Message-State: AOJu0Yz4DH2wXwDhUAJHyO6wz+TGyyPjI+dMe2f3BBYaEcyKrPHzrZVt
	Ci65GSKHBby0heL5taxdrVe88Xds/6HlPGmuYYBVAsFOI5D5Yn3wKMwc2HRAn8y+qzTeBQ4ZZXK
	V+VbSSj2zTwwkmOFS/l1v/zzTMrDM39agHHoFilcLcELWYfdglagrcUgPN1k=
X-Gm-Gg: ASbGncthkp8HQzpllz8elfhVZoiEcfjRcoj52WgV10+yTTEXw8A633IJjCIJKG/OxFR
	GtE4CuVcaKGwIIUBN+vG/Vr5tND+s89/G8M2XgcuCwqKuIcgwG0riFikL3zjMd3JupKFSzzrPW+
	zio1tP+HpXOeqtX4/popODgqAHWNJ9AYhYbrXecyU6U/XWAm/IbXHhuw+rDa+E/3ajS6GmPQzGR
	qm/IhLtxkGDnNTQl5eO5A9Vj4F2TgKZQ84oZcRO1GPOJD64RFJJWIc32Z8qjagCNDYiXiwu2eQj
	SNhdT7Q38TCe
X-Received: by 2002:a17:902:ce82:b0:224:e33:889b with SMTP id d9443c01a7336-22e040bf632mr26267655ad.12.1746071419635;
        Wed, 30 Apr 2025 20:50:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHjGXYl1nbElt//Y7QO+1qgJyi9H/AWK7L3Z8v+0R5cqVKw1fIlymBvwS8voAmkMjppWWC63Q==
X-Received: by 2002:a17:902:ce82:b0:224:e33:889b with SMTP id d9443c01a7336-22e040bf632mr26267185ad.12.1746071419220;
        Wed, 30 Apr 2025 20:50:19 -0700 (PDT)
Received: from [192.168.68.51] ([180.233.125.65])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db5100c70sm130601505ad.166.2025.04.30.20.50.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Apr 2025 20:50:18 -0700 (PDT)
Message-ID: <b10f429b-7009-4399-966c-430ad1e02d05@redhat.com>
Date: Thu, 1 May 2025 13:50:10 +1000
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 37/43] arm64: RME: Propagate max SVE vector length from
 RMM
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
 <20250416134208.383984-38-steven.price@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20250416134208.383984-38-steven.price@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: EMV5V0lnU6nBSSunvfbDNS0Xv0HqZ2HWSJiVgdyX5G4_1746071420
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/16/25 11:41 PM, Steven Price wrote:
> From: Jean-Philippe Brucker <jean-philippe@linaro.org>
> 
> RMM provides the maximum vector length it supports for a guest in its
> feature register. Make it visible to the rest of KVM and to userspace
> via KVM_REG_ARM64_SVE_VLS.
> 
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
>   arch/arm64/include/asm/kvm_host.h |  2 +-
>   arch/arm64/include/asm/kvm_rme.h  |  1 +
>   arch/arm64/kvm/guest.c            |  2 +-
>   arch/arm64/kvm/reset.c            | 12 ++++++++++--
>   arch/arm64/kvm/rme.c              |  6 ++++++
>   5 files changed, 19 insertions(+), 4 deletions(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>

