Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5D8E322A
	for <linux-coco@lists.linux.dev>; Tue,  6 Oct 2026 00:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791245010; cv=none; b=fQV9hjYx8DvRbDYsh9krp0Yd0xXF1tbOxkwxLK8gDZDdQvOczrcvWBBARDuhMGYmfoiGcUsrnw/KReeGYJv2yE/Me3TdqpOGjd3WmZFRLLTZUWIPFDCwHbo1jU/fwBMnOqHSDGH9D06G/I6KwF1YaziuSpOoT9kD6zEtUvO4ai4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791245010; c=relaxed/simple;
	bh=r/xyKW/+NyCSyYJfFfr1Na2zRDCsUAkIxdQRW3XIkgY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oyQGofNDf+0iMHNisuM6cEGYO27TL4VirQlK78iSe8EkZZpTUseLJ5VRF4P6MGEulraxT+20LPSH/My0EykxMU7Ph8gWPI2jb+3Q4tu8jFzkrPYRZcEGNm4XCL5IKNzu9pPtS0eftRBSojDc1cRl8g5KA3Y2rY7qkVJGzpqJx2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cNep+JQo; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cNep+JQo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791245007;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3isgNN8kiLtIbsG19uUxm1RN+HXpbBndqmLznSpT6Ig=;
	b=cNep+JQo4axXB+zS+kBdZCbLlodDSmYNKCYbbgyAUdqHB2hv4phi2K7+Ya2jUGKKxUKcTk
	dTk7Pt0tYZ38aYqcxCUsz14ttvpGW7yRjUi2k9u+WfeDv/AKdzfANCljwFW8ns4kL39cbn
	F+RuIuihirMcHiqbiyReq7ejXgno4KY=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-558-Zr0pzVFxM3OhDrrCfDye3A-1; Mon, 05 Oct 2026 20:03:23 -0400
X-MC-Unique: Zr0pzVFxM3OhDrrCfDye3A-1
X-Mimecast-MFC-AGG-ID: Zr0pzVFxM3OhDrrCfDye3A_1791245003
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-39deb05ef51so2188187a91.3
        for <linux-coco@lists.linux.dev>; Mon, 05 Oct 2026 17:03:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791245003; x=1791849803;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3isgNN8kiLtIbsG19uUxm1RN+HXpbBndqmLznSpT6Ig=;
        b=UiwgGvjs6O9110AVKw83jdQEjzQUlm7/hIGxnSxIpszP6lgT57Jv6lhWcan2JP9pS8
         8cdGWdrC6AQfRMUefGKl33O7GF+SAppPDy5j+XjgMoOZDk5zjdbQ4+8K7+Cn4wkXR7Kw
         m4rxrXcurLoLRB9OQ03HY7fZUU2gcDY1yDfALs0i+0RJZd1RrKanFe4ewUVDytMp9bim
         cvWj2BiVgSKp1Iy4a+BkBZGWY0bXDZ9ZHgDrT4ovjfZVhpx7ZzLIhWSR9+s6sdtNJYka
         45OP+V8cXc8RLpjoBgPFntYgwDUN+MgsP0RhVxoXphFI6WmXyjnIjkIjE4a2jrJXdJAC
         g/Xw==
X-Forwarded-Encrypted: i=1; AKwUvBzH/KwKoxlyX2ELYC1++21+g2zIz6uLj7ewo8ZdkRG7szhxn4HTGMydyKslk78vMyaqwyETFZfFv23r@lists.linux.dev
X-Gm-Message-State: AFq9FYLZ1ZObmY8M6XaBC8RMXzeKeOz39vTKpGJ3Ey35nI3aMJuThIUm
	NMRCgoaYUpM5Re8NzpsZS9hHzYxaAbfDI7dOvg0lXVrQk0o6wRaDMGW9Ol3txrIM2LG8vMwY9Cg
	UCmolpmj3lzLJ/6JuX7vUqP1/nogCU2lFxlh1Wg9hsG7bpn8MvNnloVXO9AWjnsQ=
X-Gm-Gg: AYBFou1ZT83JQ+m+yMGCXvSSvaC2f82tLGFl1c2pymk4HQ+OVWJv+otyFOrxwG0aVfQ
	gSF2hnnWZk4ML2WUgdCOBxJhfy8bnthLT+tSQlW9VS/9KxyL4+LlNHRx8vBPg9KGQ+wihXoFCmz
	z7HpgoMOgWlo1FSVDYuWt+Guk1eNk6ZMRa6P1bq+hE73E1se0UFmWiad8AVAkffwIb+OT0d4tx9
	ME60wkHenYRYFPKD5nFIldQPha1w65Pjx/5f5QkslYZfIGjxvnXrcAdLPIAI4CemkhsxX/qu5uy
	LyrVE+NUW2IKSjzSZVzdrnSkAqr1cGeFMnlvc74Wxm6jib7qcao8+12U4TENIyJIF0hW2tL/l0J
	ZcwJI6PjK2Z5zLXUrFPZxBtfTzeOnAU4HIJdkfn2WLA==
X-Received: by 2002:a17:90b:39b0:b0:3a4:c8d2:6c2c with SMTP id 98e67ed59e1d1-3a6ce845d78mr5199391a91.49.1791245002610;
        Mon, 05 Oct 2026 17:03:22 -0700 (PDT)
X-Received: by 2002:a17:90b:39b0:b0:3a4:c8d2:6c2c with SMTP id 98e67ed59e1d1-3a6ce845d78mr5199369a91.49.1791245002098;
        Mon, 05 Oct 2026 17:03:22 -0700 (PDT)
Received: from [192.168.68.52] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a6dcbdd97fsm8611158a91.0.2026.10.05.17.03.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Oct 2026 17:03:21 -0700 (PDT)
Message-ID: <7b196a7f-d31a-4acd-9f3f-a24c0e78db43@redhat.com>
Date: Tue, 6 Oct 2026 10:03:11 +1000
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v22 02/23] KVM: arm64: Disable Steal time accounting for
 protected guests
To: Suzuki K Poulose <suzuki.poulose@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: maz@kernel.org, will@kernel.org, catalin.marinas@arm.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 steven.price@arm.com, aneesh.kumar@kernel.org, oupton@kernel.org,
 joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
 linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
 sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
 WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com,
 sudeep.holla@arm.com, jonathan.cameron@oss.qualcomm.com,
 Fuad Tabba <fuad.tabba@linux.dev>
References: <20261005090754.2140522-1-suzuki.poulose@arm.com>
 <20261005090754.2140522-3-suzuki.poulose@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20261005090754.2140522-3-suzuki.poulose@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 1ai-2mw_WPpiaLGpKhdwdeVzrnqSsNx1AZyLsMI7JAw_1791245003
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/5/26 7:07 PM, Suzuki K Poulose wrote:
> PVTIME support is advertised by KVM_CAP_STEAL_TIME, which doesn't take into
> account the kvm instance. Even with that, a VMM could skip the CAP check
> and proceed to configure the PVTIME as we don't do further check on the
> DEVICE_CTRL. Tighten this up by passing the KVM instance around wherever
> possible and catch things early.
> 
> Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
> Tested-by: Gavin Shan <gshan@redhat.com>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> ---
>   arch/arm64/include/asm/kvm_host.h |  2 +-
>   arch/arm64/kvm/arm.c              |  2 +-
>   arch/arm64/kvm/pvtime.c           | 14 +++++++-------
>   3 files changed, 9 insertions(+), 9 deletions(-)
> 
Reviewed-by: Gavin Shan <gshan@redhat.com>

