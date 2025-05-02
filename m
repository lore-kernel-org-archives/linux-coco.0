Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E9A91F92E
	for <linux-coco@lists.linux.dev>; Fri,  2 May 2025 00:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746146780; cv=none; b=LYNm/j2TulF8EmEefmj+JoFiTPkGcVZd3vyPCemDNh1Pihnej3MKT30Rge1EndDJ14qgreL3eBMfKSmXGnOJ/qIr8K45U7U7R7QkzPOtGLf54u5QK1a2hXt4PsA759BYKL28wzqVKA3iSlyVoeyN3TfHfrgu/4VvSTVc2EymW/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746146780; c=relaxed/simple;
	bh=jpFTB7+Fe9GetEM5S34MRK+mjeh4+kvCjqKf5I8R+DM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RVRm1cz9aO6fGUJNviDHFDSTRUVTrjFhkv99Y0YM/EgtOI8IlgyE/cEx1xq5OckDT3h+AfFuoYmQYRiluk1z+zQQRK+SHBGA7TYxAyProoRTPfSXKi2lEpedUa7iqusqQE81F/qYiHNDVrSduhmNsaAWrhk3eYg9uCNkNPTp9Js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Fbxi0bTT; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Fbxi0bTT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746146777;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RzVNeQVSuEn+p0XG3JKage9a7jPIIY+5Xq1YW6zJmmc=;
	b=Fbxi0bTTc2pssX1Rp98C4emA4S1Pma690ST+KY9c7qD1kxexCUdxgXt5/e7RdVOrhfj05u
	5wKK8t6kPYS4E+TZcq3EvZuAPYkP6eoLzO75Cp3K74JlfAYCKeW3imCNLPInmGyBBrtAmZ
	Bby7E5B2XPmvOFZT7RJeheZD51RjGTI=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-264-lsi3H5W6P_y8kjg541vxsw-1; Thu, 01 May 2025 20:46:16 -0400
X-MC-Unique: lsi3H5W6P_y8kjg541vxsw-1
X-Mimecast-MFC-AGG-ID: lsi3H5W6P_y8kjg541vxsw_1746146775
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-30a0a8ddcc4so1701687a91.3
        for <linux-coco@lists.linux.dev>; Thu, 01 May 2025 17:46:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746146770; x=1746751570;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RzVNeQVSuEn+p0XG3JKage9a7jPIIY+5Xq1YW6zJmmc=;
        b=HtoxxHFvW7keVB4qrRNxb/zCjx6k3zq8ThSbpn2vqkThMXmuCk7or94cmC7OE73VUt
         caHkT5giX5LcJvkCh+kWAw9smdB8QjAjtLfsp1hIbWmy6j45HkdFIV/FVfMwzN0IMkoS
         CufbXNxdjnnpeUPqiWBLMbzKz/AKFLpCxPy7EY/EziZGNLaUlHGPk2oAZIiPUnUtZpRh
         FBUYNygaSmIrkdcotmLglN8DmKj6AB1BqgFRGLf8eEYgJ2RuDJrR9mxXVKdgqSLSJx3w
         SyLgX2AhLWKVdFbCn1c0ptXCnEprlU24gcQXH8PPrX/C2kHVP0hy+iAKeJ7lWBYwvEKW
         5Mmg==
X-Forwarded-Encrypted: i=1; AJvYcCWcu9PK5/Lx4fphrHZVy80p3bpW8MgNwts/6Z8LTEYI+S/u8tVYd1ZcTEAIKgFkZ94P/A5zSMJmODwL@lists.linux.dev
X-Gm-Message-State: AOJu0Yx3eS/y0dioxWd1ulB+C8X9gi201hqrgJdoh0CEWDQnqo5fe9Hx
	J+l+Z2N9H2fe8zkoJgoXZJpNuFXRtfleg/Nxcyyki1YDRWWC0BWsmpkW+5wdOLIYV6PakLxMjs/
	y0vQwpeT7dkcGLqaCX1UmO5DqKtLA4K7UoILgcgq8ZlUPxPXA49otdy9yQ6Y=
X-Gm-Gg: ASbGncu9GEbc1uwdEksDwXg0Bk17vyTYnQO/uD40l5hIg1aYrs2iwY1OYngsL7z0n60
	ESwJLyEvpAb5qiTTshP3+OK8IJ8vyJAll9NKUbtM0iLNcoST7Nk+E2FPDDVMxH9PgSc+h+SO7YJ
	crubTCXlhVdiN1bpYHnUdzxlkyYEfy2oEwGsk8P4Rtz5T6G6AOvuRZSodKgbzv5NSOhHEsyrWVK
	THhw2c7Ooh0nBUIj4zh0cFUyDycd1qxErJk2iCFwQWWMkyHuCnddJVvw2CwxGrZQhIDT7HkFCMx
	GWg7xEnCQoVu
X-Received: by 2002:a17:90b:5867:b0:2ee:7c65:ae8e with SMTP id 98e67ed59e1d1-30a4e5959b2mr1601380a91.11.1746146770098;
        Thu, 01 May 2025 17:46:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEiL3PaKpNDJ5GxpdjSgGj8jbC5Fiag7sifRcEucRKRUwL1HksU1Lw6rYRFG+qnRZ9Au1gJFw==
X-Received: by 2002:a17:90b:5867:b0:2ee:7c65:ae8e with SMTP id 98e67ed59e1d1-30a4e5959b2mr1601341a91.11.1746146769647;
        Thu, 01 May 2025 17:46:09 -0700 (PDT)
Received: from [192.168.68.51] ([180.233.125.65])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30a34826677sm4323342a91.40.2025.05.01.17.46.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 May 2025 17:46:08 -0700 (PDT)
Message-ID: <fa874ef5-5da5-44de-a9d0-24663eb684a0@redhat.com>
Date: Fri, 2 May 2025 10:46:00 +1000
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 00/43] arm64: Support for Arm CCA in KVM
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
References: <20250416134208.383984-1-steven.price@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20250416134208.383984-1-steven.price@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: oPGK0b-ZxMw9MCGzp7U1KJij-pqKJVbPs_JZqcZfrIc_1746146775
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/16/25 11:41 PM, Steven Price wrote:

[...]

> 
> The ABI to the RMM (the RMI) is based on RMM v1.0-rel0 specification[1].
> 
> This series is based on v6.15-rc1. It is also available as a git
> repository:
> 
> https://gitlab.arm.com/linux-arm/linux-cca cca-host/v8
> 
> Work in progress changes for kvmtool are available from the git
> repository below:
> 
> https://gitlab.arm.com/linux-arm/kvmtool-cca cca/v6
> 
> [1] https://developer.arm.com/documentation/den0137/1-0rel0/
> [2] https://lore.kernel.org/r/20250408105225.4002637-17-maz%40kernel.org
> 

I got a chance to try the following combination, the guest can boot using
qemu/kvmtool except a RCU stall is observed (more details provided below)

host.tf-rmm      https://git.codelinaro.org/linaro/dcap/rmm.git                      (cca/v8)
host.edk2        git@github.com:tianocore/edk2.git                                   (edk2-stable202411)
host.tf-a        https://git.codelinaro.org/linaro/dcap/tf-a/trusted-firmware-a.git  (cca/v4)
host.qemu        https://git.qemu.org/git/qemu.git                                   (stable-9.2)
host.linux       https://git.gitlab.arm.com/linux-arm/linux-cca.git                  (cca-host/v8)
host.buildroot   https://github.com/buildroot/buildroot                              (master)
guest.qemu       https://git.codelinaro.org/linaro/dcap/qemu.git                     (cca/latest)
guest.kvmtool    https://gitlab.arm.com/linux-arm/kvmtool-cca                        (cca/latest)
guest.buildroot  https://github.com/buildroot/buildroot                              (master)

RCU stall report
----------------

[ 7816.381336] rcu: INFO: rcu_preempt self-detected stall on CPU
[ 7816.382816] rcu:     6-....: (5249 ticks this GP) idle=3a4c/1/0x4000000000000000 softirq=6001/6003 fqs=2624
[ 7816.384399] rcu:     (t=5250 jiffies g=29821 q=47 ncpus=8)
[ 7816.386059] CPU: 6 UID: 0 PID: 203 Comm: qemu-system-aar Not tainted 6.15.0-rc1-gavin-g78b23c56de79 #34 PREEMPT
[ 7816.387133] Hardware name: QEMU QEMU Virtual Machine, BIOS unknown 02/02/2022
[ 7816.387926] pstate: 61402009 (nZCv daif +PAN -UAO -TCO +DIT -SSBS BTYPE=--)
[ 7816.388678] pc : realm_unmap_private_range+0x19c/0x2c0
[ 7816.389878] lr : realm_unmap_private_range+0x94/0x2c0
[ 7816.390388] sp : ffff80008095bb60
[ 7816.390765] x29: ffff80008095bb60 x28: 000000007caef000 x27: ffffba3322764000
[ 7816.392321] x26: 00007fffffffffff x25: 000000007caf0000 x24: 0001000000000000
[ 7816.393168] x23: 00000000c4000155 x22: ffff8000801b5e98 x21: 0000000106481000
[ 7816.393999] x20: 000000007caef000 x19: 0000000000000000 x18: 0000000000000000
[ 7816.394833] x17: 0000000000000000 x16: 0000000000000000 x15: 0000ffff8e997058
[ 7816.395668] x14: 0000000000000000 x13: 0000000000000000 x12: 0000000000000000
[ 7816.396548] x11: 0000000038e38e39 x10: 0000000000000004 x9 : ffffba33218a2564
[ 7816.397419] x8 : ffff8000801b5e98 x7 : 000000003fffffff x6 : 0000000000000001
[ 7816.398243] x5 : 000000011e795000 x4 : 0000000000000002 x3 : 0000000000000000
[ 7816.399062] x2 : 000000007caf0000 x1 : 000000011e796000 x0 : 0000000000000000
[ 7816.400021] Call trace:
[ 7816.400604]  realm_unmap_private_range+0x19c/0x2c0 (P)
[ 7816.401347]  kvm_realm_unmap_range+0x94/0xb0
[ 7816.401894]  __unmap_stage2_range+0x70/0xa0
[ 7816.402421]  kvm_arch_post_set_memory_attributes+0x68/0xa8
[ 7816.403011]  kvm_vm_ioctl+0x6bc/0x1b58
[ 7816.403509]  __arm64_sys_ioctl+0xa4/0xe8
[ 7816.404020]  invoke_syscall+0x50/0x120
[ 7816.404562]  el0_svc_common.constprop.0+0x48/0xf0
[ 7816.405113]  do_el0_svc+0x24/0x38
[ 7816.405584]  el0_svc+0x34/0xf0
[ 7816.406045]  el0t_64_sync_handler+0x10c/0x138
[ 7816.406571]  el0t_64_sync+0x1ac/0x1b0

Thanks,
Gavin

