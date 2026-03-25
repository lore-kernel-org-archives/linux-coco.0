Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F6EC35AC12
	for <linux-coco@lists.linux.dev>; Wed, 25 Mar 2026 06:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774420691; cv=none; b=QJaa6ekko48rHKwuqXIC8xbzqC8mXYpIq7ewsXkHjLnHyguB1poUBMaxQoRUHTjXvWxVP6nJg3L1d1pDH63e6DkwyodIiKdAy3qOBF3dTPqH+u5KsmpkkS8J+1Q+PmV+1TvS5tBS9EQIDTgGHp3dWd3KZm5uoV+VWRrP5HqY7IY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774420691; c=relaxed/simple;
	bh=yZtfD8ZbhUWOVtqgdCaXlBQFYIVZsgKdxdefJ6np6Dc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZZR0D78dVLFF5sgEgzhONx9/rVlnxYyA7DpwZPp5sqAzMla7c1prSOO15QfHGw/LG+iYBVnlp7QdeCKgF/pPr6NKsGxnAir2jUso1xiHpMNettuYz8qdlukGmfllADGCH9ADRq8wfKfn22Q0VfZFIkxGdYqgB2moRPKL0K+OSUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UyfJxPsq; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UyfJxPsq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774420689;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pf2aP5j0cWMrde9xV40F9uxk8K2GUvZ19JNXNz1B5Hc=;
	b=UyfJxPsqm56282CR41FJhpdC29YfqaInW4E4ccIaOV6gXRjGt9zGnt1U4tCdc63EE5hstg
	S14JnN/9Q8KnjD4iJkIWGzbH6x3IA9pOXXjH3xG10dgNy69gl3X38lQyERKkkipq2Pn4CQ
	WrsTWjYQg/QOubYe3pFrOv2D4CMpHjc=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-645-O9TtQQwdP5KRnf1G6VlRog-1; Wed, 25 Mar 2026 02:38:05 -0400
X-MC-Unique: O9TtQQwdP5KRnf1G6VlRog-1
X-Mimecast-MFC-AGG-ID: O9TtQQwdP5KRnf1G6VlRog_1774420685
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82c71a8969eso255768b3a.1
        for <linux-coco@lists.linux.dev>; Tue, 24 Mar 2026 23:38:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774420684; x=1775025484;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pf2aP5j0cWMrde9xV40F9uxk8K2GUvZ19JNXNz1B5Hc=;
        b=gGYBG0hwi8LjuzM1ZNn8m6j/nqsxkxuH4J50c2qfMMh0V5A9bbasLyM1LWgUAlxxFP
         QbOHDGRnS/HdCqDS5hwu03eCrEPO+DpaOH43OdS/Q3BDTcc6/ZiYqSjY7FtV+YTW5cYm
         x3l4tsKQzpGMABD3aGEilvISluucirahcoGPtPDrII1QDa4xiyg+Gpg11CzAHlCqpdMa
         9KEMWJT9uXWrLPKg0kght8KUdSmawZew0X7hzjC5voHkIzPDkBm1vn8/em+BhN24fOZT
         ilE8ueYXN8jcfVoMq7TKKf1tGXH8d29La/qXyWs++5IdCUq4QZSEtPE7g1Hjj/KqwsOC
         DIuw==
X-Forwarded-Encrypted: i=1; AJvYcCXy9rhUWTG9zk9lw9HROiyMu5nWMSyxiDNIzxCQjROO0mvwhMrj09UjOwQ7U4qIDhcI706w/YdmLgzE@lists.linux.dev
X-Gm-Message-State: AOJu0YwXCcOY4bdnw4XmKkglofeD+bFEkMP0dbGOsrZmp8vH80HitQSj
	pg2/dNpry5WkkSnTWDMhh4+7uPsGkMZ5mx2Kw2EBFDaDahQ2zLkIF1bkFc0m8RgKhiXACjtC7/F
	+PesNdbOY4P7mU2rFn0PY6YuyPXRFqoGNIn5SntGnHlxBFioCFlYWEcfLqFbmgvM=
X-Gm-Gg: ATEYQzxASSu1UAjYrqGjwDEChoRDb8U8He9aaYRnmr5WU/yoLpqyQI0Z0kXV+j03vq5
	80dT3weZms3La0UdcMW6WXXS6A4NsMAqKnE/BATRt1YGRMo8hGhCuyI1e03uyVazHND758Di7GG
	++ae8ej305Ev2E/2uCb7EHhCorZ/I5f/fVX328mDgk6mw9rVuZ1ZTmVdrlojVJITjuPBwTktT4w
	iQt4NgdRRqrV0O9zXAJSwrOnewlL44D7NRUFM/8NxMZoSjXGqgwZzGet7y/QarK7VHbDXYv/zto
	EjpDuJ92oX9iMGidXsKVL78c14UsrxjTskYokGI450YHELt7d2VxTXapWA9Lus3JYbCECcwcJLC
	B8f3FJPMvJaF7YfCimUZwGonifYYw/jOF9uu2q4v2sJftEm/8l1j+fLEDHg+g1SUE
X-Received: by 2002:a05:6a00:1f0d:b0:829:8041:83f with SMTP id d2e1a72fcca58-82c6ded62f5mr2295343b3a.7.1774420684571;
        Tue, 24 Mar 2026 23:38:04 -0700 (PDT)
X-Received: by 2002:a05:6a00:1f0d:b0:829:8041:83f with SMTP id d2e1a72fcca58-82c6ded62f5mr2295316b3a.7.1774420684086;
        Tue, 24 Mar 2026 23:38:04 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b03bbf0c2sm17111626b3a.15.2026.03.24.23.37.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 23:38:03 -0700 (PDT)
Message-ID: <0b7121e7-3c74-4303-a200-01d2b7c535ce@redhat.com>
Date: Wed, 25 Mar 2026 16:37:52 +1000
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 00/48] arm64: Support for Arm CCA in KVM
To: Steven Price <steven.price@arm.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev,
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
 <alpergun@google.com>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
 Emi Kisanuki <fj0570is@fujitsu.com>, Vishal Annapurve <vannapurve@google.com>
References: <20260318155413.793430-1-steven.price@arm.com>
 <abyAbPIkDn2bGZwd@p14s> <37bc1222-6fc7-48f0-94d3-6eaac420aa55@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <37bc1222-6fc7-48f0-94d3-6eaac420aa55@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: fZRVqoLWraIAKlklQvevZGtAAoXHEBkr5cv44YXYLQA_1774420685
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Steven,

On 3/21/26 2:45 AM, Steven Price wrote:
> On 19/03/2026 23:02, Mathieu Poirier wrote:

[...]

>>>
>>> The TF-RMM has not yet merged the RMMv2.0 support, so you will need to
>>> use the following branch:
>>>
>>> https://git.trustedfirmware.org/TF-RMM/tf-rmm.git topics/rmm-v2.0-poc
>>
>> This RMM version is expecting a RMM EL3 interface version of at least 2.0.  Do
>> you have a TF-A to use with it?
> 
> You should be able to use the 'master' branch of the TF-A repository.
> For now you need to set RMM_V1_COMPAT=0 to enable 2.0 support.
> 

In upstream TF-A repository [1], I don't see the config option 'RMM_V1_COMPAT'.
would it be something else?

[1] git@github.com:ARM-software/arm-trusted-firmware.git    (branch: master)

I use the following command to build TF-A image. The RMM-EL3 compatible issue is
still seen.

     TFA_PATH=$PWD
     EDK2_IMAGE=${TFA_PATH}/../edk2/Build/ArmVirtQemuKernel-AARCH64/RELEASE_GCC5/FV/QEMU_EFI.fd
     RMM_IMAGE=${TFA_PATH}/../tf-rmm/build-qemu/Debug/rmm.img
     
     make CROSS_COMPILE=aarch64-none-elf-                               \
          PLAT=qemu ENABLE_RME=1 RMM_V1_COMPAT=0 DEBUG=1 LOG_LEVEL=40   \
          QEMU_USE_GIC_DRIVER=QEMU_GICV3                                \
          BL33=${EDK2_IMAGE} RMM=${RMM_IMAGE}                           \
          -j 8 all fip

Booting messages
================
INFO:    BL31: Initializing runtime services
INFO:    RMM setup done.
INFO:    BL31: Initializing RMM
INFO:    RMM init start.
ERROR:   RMM init failed: -2
WARNING: BL31: RMM initialization failed

Thanks,
Gavin



