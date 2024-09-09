Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35C811AC8AD
	for <linux-coco@lists.linux.dev>; Mon,  9 Sep 2024 04:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725855205; cv=none; b=TWCWJ21w493ArBL0bT2jqwv0TG+Tu/Qvstia5ARc7QEA8cUjG7VqHV6jeZ0fni50W6RlNCSMSBY75dHo8thRgPHSB0TgYQV8DYvhXe42UUgJydVyVCgSTksMGanXBK0seFUA2AsLYXoVbI92Ukq2Kq2ZYLsjPZtfBRbX7W+xabw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725855205; c=relaxed/simple;
	bh=8LirZ0HmrIsAJ3anUuOVRBCsmWxH2T4HZt4fknhF9Ic=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P17RcxdH+LttTbF9jNXedEjytKF45+Gk3i2HrfphvNbkSvKaAo0eAuLgFDk0AGDh9F+vA40PBU4yKUDzn3Pi8HAwAx1vpDhw1z1l8LsDYnkfVb7MOXKW5m/s4Njg0I/USDtLl/oyfnaX3IjPvRTnUV+AxxyVoI782gyt6SCpoRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DA9dD2x7; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DA9dD2x7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1725855202;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qWJH4JtiF+rIHPnRLC4WN/TNvZ/uRdMkrGB+YOGo0Hs=;
	b=DA9dD2x7vPw34bxW17AfPrR6uE02ZZ8JsiSeX0+aYTfsNETwUFd50ejnXuUnwQXYKzOzDa
	17V4YlvQPx29ENl7TQqYn60QodwYcSiF4uUgqIFL7hR4X6N697wxJkzYwkUzzMmcg9L+BB
	9KpGD2ErVJJpQ3EHJmaT4hx2wQiKUi4=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-495-3vPVUfg2OsONR3cWUiGseQ-1; Mon, 09 Sep 2024 00:13:18 -0400
X-MC-Unique: 3vPVUfg2OsONR3cWUiGseQ-1
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-717948624beso4637154b3a.1
        for <linux-coco@lists.linux.dev>; Sun, 08 Sep 2024 21:13:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725855198; x=1726459998;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qWJH4JtiF+rIHPnRLC4WN/TNvZ/uRdMkrGB+YOGo0Hs=;
        b=Cavw4DVfec8HVI6Up9CIX7swTNVtErbs49ha0epluhbsX8WALs28w01I0uQFEqSK+F
         l1Iu623HuUo7lBzkO+bnVQE9AdLTNWrHXJ6NNZva34V6C5oifmN6+mXDhenjAcwo0ktR
         S2O9dGbCBGDOBFJbdGA82e0qbF0LZ27Sr19KiFNV7ElltieRe0vLJKHoBURc0I6zfu0p
         NMK+TJl76bNvCnnXIU1FdGCrrVWxmWiBeSIFJMrPKvkx8v6VReQulpBuws4rbHNrAhMS
         I4++VoZdahNLtoPUzV4C7DYqBZ2nGqNORxblgC1l8d5jrAvG+jaw7y4MhWfSIBkiHq15
         z3gw==
X-Forwarded-Encrypted: i=1; AJvYcCUJOg5JoYUreiZSfhaGVUnmK5YeO45+O9Ktg9JsWJkcZBHN+5WYjOUaJcXwmntg8fHoqkd73xYYdLLE@lists.linux.dev
X-Gm-Message-State: AOJu0YxfwmJPEe4qOEWf/QcG/6F7eD2S6RqxOjDWlbXnZeN86sdOoPfY
	BjlRDOlF/DwVup/5DcgyUi9q64b6mzcpW6/drYYzEu0xnlmDweB+OAn8q9ABosG6JK8nWqxCqyM
	aUkscZRW0bk57lBlUvYhatMlt5VbnFgLGSlLDjnyqwP38iC3qIwAxY7Sp0Lg=
X-Received: by 2002:a05:6a20:d49b:b0:1cf:3b22:feca with SMTP id adf61e73a8af0-1cf3b230136mr3918230637.15.1725855197879;
        Sun, 08 Sep 2024 21:13:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEnUKDaM2E6KNKbxP6Avir+4/JCbohvZZf9a+5rUYwTHzqD3kkO8haVPQRh64vM65/fXpKKbA==
X-Received: by 2002:a05:6a20:d49b:b0:1cf:3b22:feca with SMTP id adf61e73a8af0-1cf3b230136mr3918188637.15.1725855197215;
        Sun, 08 Sep 2024 21:13:17 -0700 (PDT)
Received: from [192.168.68.54] ([103.210.27.31])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7d823cf3b1fsm2543061a12.33.2024.09.08.21.13.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Sep 2024 21:13:16 -0700 (PDT)
Message-ID: <3aea7984-6e84-4bc5-9cd6-55b2a45d71c0@redhat.com>
Date: Mon, 9 Sep 2024 14:13:06 +1000
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 19/19] virt: arm-cca-guest: TSM_REPORT support for
 realms
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
 <alpergun@google.com>, Sami Mujawar <sami.mujawar@arm.com>
References: <20240819131924.372366-1-steven.price@arm.com>
 <20240819131924.372366-20-steven.price@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20240819131924.372366-20-steven.price@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/19/24 11:19 PM, Steven Price wrote:
> From: Sami Mujawar <sami.mujawar@arm.com>
> 
> Introduce an arm-cca-guest driver that registers with
> the configfs-tsm module to provide user interfaces for
> retrieving an attestation token.
> 
> When a new report is requested the arm-cca-guest driver
> invokes the appropriate RSI interfaces to query an
> attestation token.
> 
> The steps to retrieve an attestation token are as follows:
>    1. Mount the configfs filesystem if not already mounted
>       mount -t configfs none /sys/kernel/config
>    2. Generate an attestation token
>       report=/sys/kernel/config/tsm/report/report0
>       mkdir $report
>       dd if=/dev/urandom bs=64 count=1 > $report/inblob
>       hexdump -C $report/outblob
>       rmdir $report
> 
> Signed-off-by: Sami Mujawar <sami.mujawar@arm.com>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
> v3: Minor improvements to comments and adapt to the renaming of
> GRANULE_SIZE to RSI_GRANULE_SIZE.
> ---
>   drivers/virt/coco/Kconfig                     |   2 +
>   drivers/virt/coco/Makefile                    |   1 +
>   drivers/virt/coco/arm-cca-guest/Kconfig       |  11 +
>   drivers/virt/coco/arm-cca-guest/Makefile      |   2 +
>   .../virt/coco/arm-cca-guest/arm-cca-guest.c   | 211 ++++++++++++++++++
>   5 files changed, 227 insertions(+)
>   create mode 100644 drivers/virt/coco/arm-cca-guest/Kconfig
>   create mode 100644 drivers/virt/coco/arm-cca-guest/Makefile
>   create mode 100644 drivers/virt/coco/arm-cca-guest/arm-cca-guest.c
> 

[...]

> +
> +/**
> + * arm_cca_report_new - Generate a new attestation token.
> + *
> + * @report: pointer to the TSM report context information.
> + * @data:  pointer to the context specific data for this module.
> + *
> + * Initialise the attestation token generation using the challenge data
> + * passed in the TSM decriptor. Allocate memory for the attestation token
                         ^^^^^^^^^

Typo. s/decriptor/descriptor as reported by './scripts/checkpatch.pl --codespell'


> + * and schedule calls to retrieve the attestation token on the same CPU
> + * on which the attestation token generation was initialised.
> + *
> + * The challenge data must be at least 32 bytes and no more than 64 bytes. If
> + * less than 64 bytes are provided it will be zero padded to 64 bytes.
> + *
> + * Return:
> + * * %0        - Attestation token generated successfully.
> + * * %-EINVAL  - A parameter was not valid.
> + * * %-ENOMEM  - Out of memory.
> + * * %-EFAULT  - Failed to get IPA for memory page(s).
> + * * A negative status code as returned by smp_call_function_single().
> + */

Thanks,
Gavin

