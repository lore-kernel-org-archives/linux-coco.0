Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8886D18BC3F
	for <linux-coco@lists.linux.dev>; Wed, 29 Jan 2025 03:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738123058; cv=none; b=mgPHdGIqrynUgIB4Hp+QeDG5UwkHb+9RSaevaOpPqCsz724IvF9YGBgUCEQbI4Pf9SiFy6Z8lTsoIz8tMe1jkAbDC9eQVmdbeZQutn9CPEYXM6Kotz1vytSoZ26D1N4KE7I9Hmlr57enyS4sArG2QBD6miClQRf+yia/YNYjhg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738123058; c=relaxed/simple;
	bh=w1SayiDT6fHbjeRtPtYcD6dD/o7ljGA0MzGpca4ixSg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RDkCgI4nBt9iKphsHKrjl+zm67pwYVhXVOgnCRtTa/fpXTOHUkJ9Np+H+bRFvCWO2mFUTxtMdh4TTwqRRuszwkF4r0QGdCBlJEP8RCvpgmR8iKHmIxz4+vYEcb5fG0dcAs7a1iZ2dbPf9AeRZGy7aPJbkTXeSsezd+oJ7tfdiVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=glfDfJHa; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="glfDfJHa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738123055;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zB7bwFdWnORe6bKwIQ/6vJQvYuugxQ4y04Yn/yJKnPc=;
	b=glfDfJHajjkpoKDbP3N33S3bXnJA7RdqnC1+DmMqevCoZGr6Wb2eZ/iwYppMR6D+URFx+Y
	gVTtyPluhFS3EyBMMhcs8XZ1zJJeBfDi/zLZRJedtt+PUho7NbbAdvNIT6MlvZXA5oo6wa
	uPVFW2N6QiIDeoS7vNGjvyPTclXhItk=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-649-zelSUaQVMtqFeLjbBfQtXw-1; Tue, 28 Jan 2025 22:57:33 -0500
X-MC-Unique: zelSUaQVMtqFeLjbBfQtXw-1
X-Mimecast-MFC-AGG-ID: zelSUaQVMtqFeLjbBfQtXw
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-21655569152so129203885ad.2
        for <linux-coco@lists.linux.dev>; Tue, 28 Jan 2025 19:57:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738123052; x=1738727852;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zB7bwFdWnORe6bKwIQ/6vJQvYuugxQ4y04Yn/yJKnPc=;
        b=e8gCKfSYlxBrS03X+DPqUWjNWWdHbR1vxbKA9zODGOktqZaBl5j+IG0LgqGwVWgY1x
         4ojMqALNnP0+WoVL3KYuDrYX2OHDOzTsYSbJ5c4w368BZsb3LpxWHEVyKT24tDNrhNxt
         mPxFvst/vnRkIjuIn1u1OeL0rpUApS19U9z0B6hioVLZxk/w31XB9VMxyw11mqsa2ec+
         rF+q2sXApA54OYNaHY6dzmo02/fh6rR2sTlr0upjEp2kkBLroAb1oTA+xdk3eIA9KD5j
         xINczMPFNXP6LhDrIMl26Xu0XU/S5CLzPC6JrHB5HvMHrv5rv8ISZ6237V4TtaTxKJWS
         72Fw==
X-Forwarded-Encrypted: i=1; AJvYcCWRUt2wqetkS29FgPnr+vrmaA3Zw1CTEAg2s+49X+Tdhdk65kyunorbCGN7eKCcV8AEsflgDEsiU8LD@lists.linux.dev
X-Gm-Message-State: AOJu0YwXFaVulICXBDnsmqCla6zYhgla5TEajD4Byx8w6ccI9Kk7axSQ
	XlBSAsCmfp/aOjnt/BQkeJ2Nd3pr7BRsv3VvqLCPfDfUwzdIrwa/7bfpwnbXNuwA4BjnAd1wdpg
	EXNkJHN4/V8MGtgOC5UYVUxvXDeDZc0bEJCEpR6Y4miETnLSIif/xOktdMIk=
X-Gm-Gg: ASbGncsdO2/oxcyDNe4fw130BgJ8A3DtaVac9FgTRYG0526DfTZT9NYK2XRwcsA3jvb
	M8LM5T6pWfDrdYWnTimAoZ4ULSY66m8YiIIvpCyIb93cx1F6zVMB1W0vUQMsYvNY2O2uizBsGWt
	8wRKFYaC+RA8Ryokb71Y1+O3XwfFqH9kBHytjDLl7VHtLDXDRjeRpCpRvEUxaoXiD8I60hSBNgB
	0PJDOPYcPV6FSMpQcvJ8WGD9TDSfwCEhT//7RhYYo2liC8ATMRzJxC+V/VlRyDaTZScFbm+WOLf
	Cxt3vA==
X-Received: by 2002:a17:902:ce8f:b0:215:9d29:9724 with SMTP id d9443c01a7336-21dd7ddfdc9mr26688155ad.38.1738123052533;
        Tue, 28 Jan 2025 19:57:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFdY9KvQ422zqadztWkjkXDL2LuY//Pm08gZwRPHxwWf8KuGeFvCcuuj/IQ8VEC/M+7z5zZXw==
X-Received: by 2002:a17:902:ce8f:b0:215:9d29:9724 with SMTP id d9443c01a7336-21dd7ddfdc9mr26687925ad.38.1738123052171;
        Tue, 28 Jan 2025 19:57:32 -0800 (PST)
Received: from [192.168.68.55] ([180.233.125.64])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21da3d9cac3sm89760675ad.38.2025.01.28.19.57.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jan 2025 19:57:31 -0800 (PST)
Message-ID: <7271b3ff-8665-4a98-b3dd-77417f85d5e3@redhat.com>
Date: Wed, 29 Jan 2025 13:57:23 +1000
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 06/43] arm64: RME: Check for RME support at KVM init
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
References: <20241212155610.76522-1-steven.price@arm.com>
 <20241212155610.76522-7-steven.price@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20241212155610.76522-7-steven.price@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 6Ydcailk87GJs9xtUb-8hcm66nFBIu0Wpcx1SIsfHls_1738123052
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/13/24 1:55 AM, Steven Price wrote:
> Query the RMI version number and check if it is a compatible version. A
> static key is also provided to signal that a supported RMM is available.
> 
> Functions are provided to query if a VM or VCPU is a realm (or rec)
> which currently will always return false.
> 
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
> Changes since v5:
>   * Reword "unsupported" message from "host supports" to "we want" to
>     clarify that 'we' are the 'host'.
> Changes since v2:
>   * Drop return value from kvm_init_rme(), it was always 0.
>   * Rely on the RMM return value to identify whether the RSI ABI is
>     compatible.
> ---
>   arch/arm64/include/asm/kvm_emulate.h | 18 +++++++++
>   arch/arm64/include/asm/kvm_host.h    |  4 ++
>   arch/arm64/include/asm/kvm_rme.h     | 56 ++++++++++++++++++++++++++++
>   arch/arm64/include/asm/virt.h        |  1 +
>   arch/arm64/kvm/Makefile              |  3 +-
>   arch/arm64/kvm/arm.c                 |  6 +++
>   arch/arm64/kvm/rme.c                 | 50 +++++++++++++++++++++++++
>   7 files changed, 137 insertions(+), 1 deletion(-)
>   create mode 100644 arch/arm64/include/asm/kvm_rme.h
>   create mode 100644 arch/arm64/kvm/rme.c
> 

[...]

> +
> +static inline bool kvm_is_realm(struct kvm *kvm)
> +{
> +	if (static_branch_unlikely(&kvm_rme_is_available) && kvm)
> +		return kvm->arch.is_realm;
> +	return false;
> +}
> +

kvm->arch.is_realm won't be true when kvm_rme_is_available is false. It's set
in kvm_arch_init_vm() of PATCH[10]. So it's safe to be simplified as below if
the changes to kvm_arch_init_vm() is slightly modified, more details can be
found from the comments to PATCH[10]

With the changes, we don't have to check kvm_rme_is_available every time.

static inline bool kvm_is_realm(struct kvm *kvm)
{
	return (kvm && kvm->arch.is_realm);
}

Thanks,
Gavin

