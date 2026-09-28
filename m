Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1472A2E8B83
	for <linux-coco@lists.linux.dev>; Mon, 28 Sep 2026 00:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790554478; cv=none; b=CgQ0JSSbtR2LMnQ5P9OrJdGNpJnH6fVVEp423NxB4WjK+0Nm4qbaQVQpoesfaK8TDt6BADnhxsm79g7F7vSj8eTC4pH5oUqHSqTs1V6fxfbqfBSO3KwMOufJP4KAeV0HahaWQEQEThA8NgB+Bp7unuK4pna4qbyTdmkkSo0DBog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790554478; c=relaxed/simple;
	bh=IWNXAcTPuVoDpaI/S3Bd3QXcIjw/fAWvlfconBsmVgQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cdERVYAaXpcepjkgv4ABwJXSPCW/sC+PheS3u1HqYTq/M9/gk85bKRX2DlmYRC8ZysEh4RQIe1FLsiTwLZCWP5EQsGhbHGkAWnr2HIYCqkFDxymppL/a/vtCFzWp/Dyd93sKU5fqAY3YUeuZULt+DCSviVjMaLOAZp0BOO9qIZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PI3WuFQT; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PI3WuFQT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790554467;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3pHPTXlsx3JeIcn/vypuvLo0a6E/wjvoL+H11fk+xgI=;
	b=PI3WuFQTe8P7TF928g/BtMZyJtZK1fs8cXQuEhfPNChrL0xxoGc/GJkUb+ZMoczNgWzR9p
	+3carlVkHKQVVRSytanrdTi+7zyjtGVoy6iFl8P0FBbLAyIfpZg5uOzmwpoXsx7Btba9F2
	uvoytPPbLRnSqFz/MJV4HwqzZJOD6fA=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-151-4NA-Dh4_Nz-D2qOWE7d7Tw-1; Sun, 27 Sep 2026 20:14:24 -0400
X-MC-Unique: 4NA-Dh4_Nz-D2qOWE7d7Tw-1
X-Mimecast-MFC-AGG-ID: 4NA-Dh4_Nz-D2qOWE7d7Tw_1790554463
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-39de4e72b33so4794374a91.2
        for <linux-coco@lists.linux.dev>; Sun, 27 Sep 2026 17:14:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790554463; x=1791159263;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3pHPTXlsx3JeIcn/vypuvLo0a6E/wjvoL+H11fk+xgI=;
        b=iJxp0jyQGFrJY4k/xRDIQTDH6X4WMFh7s3wjZ7ur6eGef0CR8SD423AK12ca9ilH5X
         sJjLBumdrOtYgyax+/ps1Yp5SYuEqEUSPTKMf1OAplQGjvYnCkzBMG39fyLrdzDTTChV
         ulwQr2+Zou3CEMON44NMY0jPVOFew7XlUvUiipqwIoZ8Ro8kkxQjW03UqikQpXi/OFSx
         MoW5nbnHiEnzUio4hiBMJH8d3iiZvL45nOJjxRCzHip4okWnvjGdpJEovIJJiR4BNxj8
         t4g2gRUPhbfgPRKcuj0xu0qSjHLG8IHKii6Xvl5c88AFCMB6eCBtei16eAVN7y1j+ymO
         9wRw==
X-Forwarded-Encrypted: i=1; AKwUvBwGnvVgOANL+3WVEMofx5poZWjju9G65FZHjAtQdYOqAO/KSsckSn4WVxjcWy8/wV4FJYa72M0RrRd3@lists.linux.dev
X-Gm-Message-State: AFq9FYJN3jUZoEj06BRzRI8L+NRQPNW7W7Upq1SUBKxGDJ4CLBXSCUeW
	GQQjQnIFe+PEpT3Xk0JkdwJ87dMoFIse4Usml91dp6zxvuW9tlOxFzqM5TiOM/hsg8aDHJCBoYZ
	ia3LeEyMNbDbJacjfI/UtXPBm5M3kv8VeSM1weeUMNkwgVGOHho8OCfwh34KuwxU=
X-Gm-Gg: AYBFou2D0r1UtCEjzYnZXtg/i/Kzj3TTdUBrYEop/Ih3Rz7eNX8EXn8xdJ9Ee5vh/CM
	7lZ303cZzLZ+0da2ouCyzW5iiuqJ0eSb5dnB3Mww0bqeqRvU266hUqGfSbm+lT4Li7U9RZiPjLg
	YDB0y7E3Q0NzW42w2kvy7sJJLj1lX7WR64wRS0JkRSPQRUtyDhfgO4KTf0tqqx6yxA0ObntXcz/
	09goOvzviYqSsJtMBKGdl5AkxAZyKQ5NtUCa17BL8Ge867t3K0oF9///rZrU+mxFPSxaflauG1W
	mpqlItZcCbWpvLL/CEPdyiuOUsy9ci28bb0ntQr342q00eblL2PGvO3R32IrcB2cD2oU0Xx8FFN
	Vhvm92LGWBbqa/pprqnOLALofxqJexJAoljgLSOwv+g==
X-Received: by 2002:a17:90b:274b:b0:39e:6ec6:f4d0 with SMTP id 98e67ed59e1d1-3a0bb553222mr5783311a91.8.1790554463435;
        Sun, 27 Sep 2026 17:14:23 -0700 (PDT)
X-Received: by 2002:a17:90b:274b:b0:39e:6ec6:f4d0 with SMTP id 98e67ed59e1d1-3a0bb553222mr5783291a91.8.1790554462940;
        Sun, 27 Sep 2026 17:14:22 -0700 (PDT)
Received: from [192.168.68.52] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0bec30aaasm16424179a91.15.2026.09.27.17.14.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Sep 2026 17:14:22 -0700 (PDT)
Message-ID: <5987866e-92b6-41d7-87a7-ca1dee2647af@redhat.com>
Date: Mon, 28 Sep 2026 10:14:15 +1000
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v19 02/20] KVM: arm64: Disable Steal time accounting for
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
 Fuad Tabba <fuad.tabba@linux.dev>
References: <20260920212845.707-1-suzuki.poulose@arm.com>
 <20260920212845.707-3-suzuki.poulose@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260920212845.707-3-suzuki.poulose@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: n_4WB3Q4OB0tso4z7-9TkgAz2BTY4cRPAyDPFHbeA-o_1790554463
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/21/26 7:28 AM, Suzuki K Poulose wrote:
> PVTIME support is advertised by KVM_CAP_STEAL_TIME, which doesn't take into
> account the kvm instance. Even with that, a VMM could skip the CAP check
> and proceed to configure the PVTIME as we don't do further check on the
> DEVICE_CTRL. Tighten this up by passing the KVM instance around wherever
> possible and catch things early.
> 
> Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> ---
>   arch/arm64/include/asm/kvm_host.h |  2 +-
>   arch/arm64/kvm/arm.c              |  2 +-
>   arch/arm64/kvm/pvtime.c           | 14 +++++++-------
>   3 files changed, 9 insertions(+), 9 deletions(-)
>
Reviewed-by: Gavin Shan <gshan@redhat.com>

