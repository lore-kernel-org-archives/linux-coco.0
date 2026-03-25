Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 812EC27AC45
	for <linux-coco@lists.linux.dev>; Wed, 25 Mar 2026 04:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774411656; cv=none; b=sflKSmk7LWv5dhg3KnmO773wBEjdCBQkq6bjBKq65ZUZpd/WRGzQr0iOD1nk+I1TTRNTqnMBC4xDFto5dlaZuOvas2odIdmvKKoew1fvsTv1uAfxzX6v//noKtKHZTpUUnZOaa6O5S8h7NVTV4oWerAH72GVIRQrqFzqBPmrHLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774411656; c=relaxed/simple;
	bh=gtXzY3UzOa0u/JZYAGdbeFTboh1lX32MreW71F1IG5Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RcQ5fQ25hwQO9xiGzTlM7vbKKgRVyfEqYf98L5Kye9x6dOTk//ixVHA2Fh1tsJcWxmC6UgUQnrj+GCzI/M5DfLtSh95x070Pesf6LZds7ICHuDq1lW8nyj1H4xlDFUZcgBfe9ckw6AjtB8FVCkhlSGuq7Sj/qwvB/CwPLsR2s+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KJiEylZP; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KJiEylZP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774411654;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WgjWcQoj7oLaeFNKzaIEePhWh+sZwFHeBhNTOW06Lw4=;
	b=KJiEylZPUYBssMIfScr/luqG8DYqb0+4EQsSlg1mYENqqsenBB7zP4wPd1A2n6fE28X76h
	id3ZzRLU2QkU2bQz3p1PrXzOcfGUHdbwvuw3T1Mc/AsYZoGd9C0gF5KCs+MS/elzezvEk5
	O0Zk4XmDqq3RR7dgFUTXDkdTKYebT64=
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-639-3oQ-sHGBPnWNNo_eEJr5Og-1; Wed, 25 Mar 2026 00:07:31 -0400
X-MC-Unique: 3oQ-sHGBPnWNNo_eEJr5Og-1
X-Mimecast-MFC-AGG-ID: 3oQ-sHGBPnWNNo_eEJr5Og_1774411651
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c74262a2988so18202108a12.1
        for <linux-coco@lists.linux.dev>; Tue, 24 Mar 2026 21:07:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774411650; x=1775016450;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WgjWcQoj7oLaeFNKzaIEePhWh+sZwFHeBhNTOW06Lw4=;
        b=MyulooxhxAmCyzRFiLEdErfNb9vCHQ887D7K7WjX4Yt6GLzBEnRJsA08gSivHPkIF7
         GfwV22XllbjUSV5GQHb6/XTKdINZkZFq0RnVU1e7k9T8harw3Pe0XYQ+ZnxkrRjlrdSb
         c3piYCcqwLZDgwzVFBoUSQ1Mz/Tarp4DNF94ov5HrBcfBdVFvkkGp9ltY/kTUqySPC2M
         HjEk+BMzsh/SE/SEstvw0/4SeR5YcXksas+fJwRCW3cB/fFJ1oPLikN91Txk5ML9FPO5
         EoN7gEaOM+5Cje81vkkpj/50UAJpo7GM9nwiFadS6YPoagPAWG8mY8iIAljRGNQ+3gMw
         Imgg==
X-Forwarded-Encrypted: i=1; AJvYcCVpDz77M96ZzkMLij61owH52Ed2ACNHt4F+ExxAAx9OPtsED9AtzbT209jAl0g1KOJ7fLRQyXY6RFQL@lists.linux.dev
X-Gm-Message-State: AOJu0YxzDgKQAzJYjQabXs5peiYVgcw0zYj/nFB9LPyoPKEzwhbI+Qbo
	kUOArSBChcPJ7sJYM4u4W/melJ9bhI851UTPF5xO9CMq/c6YRTWfjNk4onEu738xaePhIzuCHpl
	kRGCMA1NdGOAXuPSOZom2jEK9kXLxx7Ks0K9fuSU+aD2PE84U8MonaHlX28Brj6g=
X-Gm-Gg: ATEYQzw7OizYaqOt1RlJT9qy9DKDwyxCwCwquRmhaHp8thKftJyW/GAgp4wQIOy+9X5
	iN8edXyrknstZqeIzF0QVGnUNZOVmh/Xc71eVVipRcwXcjSivgDqDiTtEJXtTmR44jzd6EjuAKZ
	o3/DCFzxn56i+zX0TDWATkMuIUMMtu8nE2StcUqjrLJuGhMiOPOv7/M27lJSjP19pSHTlOM9O++
	il9uS2S+9p06MMZ1DWmfy9rhlSUG8H3yBC2v6HDo1N6h3Mf0jASlzoWjeglCfM3IsaY9LblD3jM
	F/tTUTi4Fc1fLjjQZBMx6GevjddeH7PuMEpwxsunwjrudtmu+DEVPsPmofAaK8sD+PtKc2PDR5s
	FQC8tUN9SCHlkrC+aBCqLaYaA95Zs2TNaK+drwC6Gv8ikBrmtDjUjkNqAqyeVgIpl
X-Received: by 2002:a05:6a00:298e:b0:81e:d7c3:2f3a with SMTP id d2e1a72fcca58-82c6e0d1e6emr1790884b3a.46.1774411650508;
        Tue, 24 Mar 2026 21:07:30 -0700 (PDT)
X-Received: by 2002:a05:6a00:298e:b0:81e:d7c3:2f3a with SMTP id d2e1a72fcca58-82c6e0d1e6emr1790860b3a.46.1774411650026;
        Tue, 24 Mar 2026 21:07:30 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82c38565096sm8738528b3a.51.2026.03.24.21.07.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 21:07:29 -0700 (PDT)
Message-ID: <779079e1-7193-46e9-b18c-9ab5e69bb077@redhat.com>
Date: Wed, 25 Mar 2026 14:07:17 +1000
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 00/48] arm64: Support for Arm CCA in KVM
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
References: <20260318155413.793430-1-steven.price@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260318155413.793430-1-steven.price@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Y-g3TDH4BtpePIus_qfQ9EqTXcmqYIEO7qhIbpj8RGM_1774411651
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Steven,

On 3/19/26 1:53 AM, Steven Price wrote:
> 
> This series is based on v7.0-rc1. It is also available as a git
> repository:
> 
> https://gitlab.arm.com/linux-arm/linux-cca cca-host/v13
> 
> Work in progress changes for kvmtool are available from the git
> repository below:
> 
> https://gitlab.arm.com/linux-arm/kvmtool-cca cca/v11
> 

Could you please share if we have a working qemu repository on top of this
(v13) series? The previous qemu repository [1] seems out of dated for long
time. I heard Jean won't be able to continue his efforts on QEMU part, who
is going to pick it up in this case.

[1] https://git.codelinaro.org/linaro/dcap/qemu.git    (branch: cca/latest)

> Note that the kvmtool code has been tidied up (thanks to Suzuki) and
> this involves a minor change in flags. The "--restricted_mem" flag is no
> longer recognised (or necessary).
> 
> The TF-RMM has not yet merged the RMMv2.0 support, so you will need to
> use the following branch:
> 
> https://git.trustedfirmware.org/TF-RMM/tf-rmm.git topics/rmm-v2.0-poc
> 

I'm seeing error to initialize RMM with the suggested RMM branch (topics/rmm-v2.0-poc)
and the upstream TF-A [1]. It seems the problem is compatible issue in the
RMM-EL3 interface. RMM requires verion 2.0 while TF-A only supports 0.8. So
I guess I must be using a wrong TF-A repository. Could you please share which
TF-A repository you use for testing?

[1] git@github.com:ARM-software/arm-trusted-firmware.git    (branch: master)

Booting logs
=============
NOTICE:  Booting Trusted Firmware
NOTICE:  BL1: v2.14.0(debug):67edb4f8e
NOTICE:  BL1: Built : 00:01:39, Mar 25 2026
INFO:    BL1: RAM 0xe0ee000 - 0xe0f7000
INFO:    BL1: Loading BL2
INFO:    Loading image id=1 at address 0xe05b000
INFO:    Image id=1 loaded: 0xe05b000 - 0xe0642bc
NOTICE:  BL1: Booting BL2
INFO:    Entry point address = 0xe05b000
INFO:    SPSR = 0x3cd
NOTICE:  BL2: v2.14.0(debug):67edb4f8e
NOTICE:  BL2: Built : 00:01:39, Mar 25 2026
INFO:    BL2: Doing platform setup
INFO:    Reserved RMM memory [0x40100000, 0x418fffff] in Device tree
INFO:    BL2: Loading image id 3
INFO:    Loading image id=3 at address 0xe090000
INFO:    Image id=3 loaded: 0xe090000 - 0xe0a292b
INFO:    BL2: Loading image id 35
INFO:    Loading image id=35 at address 0x40100000
INFO:    Image id=35 loaded: 0x40100000 - 0x401a11e0
INFO:    BL2: Loading image id 5
INFO:    Loading image id=5 at address 0x60000000
INFO:    Image id=5 loaded: 0x60000000 - 0x60200000
NOTICE:  BL2: Booting BL31
INFO:    Entry point address = 0xe090000
INFO:    SPSR = 0x3cd
INFO:    GPT: Boot Configuration
INFO:      PPS/T:     0x2/40
INFO:      PGS/P:     0x0/12
INFO:      L0GPTSZ/S: 0x0/30
INFO:      PAS count: 6
INFO:      L0 base:   0xedfe000
INFO:    Enabling Granule Protection Checks
NOTICE:  BL31: v2.14.0(debug):67edb4f8e
NOTICE:  BL31: Built : 00:01:39, Mar 25 2026
INFO:    GICv3 without legacy support detected.
INFO:    ARM GICv3 driver initialized in EL3
INFO:    Maximum SPI INTID supported: 287
INFO:    BL31: Initializing runtime services
INFO:    RMM setup done.
INFO:    BL31: Initializing RMM
INFO:    RMM init start.
ERROR:   RMM init failed: -2                           <<<< Error raised by RMM here
WARNING: BL31: RMM initialization failed
INFO:    BL31: Preparing for EL3 exit to normal world
INFO:    Entry point address = 0x60000000
INFO:    SPSR = 0x3c9
UEFI firmware (version  built at 19:33:51 on Mar  3 2026)


Thanks,
Gavin



