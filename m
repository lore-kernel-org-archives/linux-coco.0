Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4321142AA3
	for <linux-coco@lists.linux.dev>; Wed,  5 Mar 2025 03:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741146811; cv=none; b=OpT4LVXmslsh0+IBVbkQupiEiu+CyJGNFpN+2bNUej+wuy+EoxWA4w8fJf6bZsMbTtbUWUiXCugIpwgYUiqSUxF04650rXKykZD9x7133rVGHqeOlfxO2/6z+o392b5Cn1UHNJGeFlblOdcY7O4mxtH7/FJKTwMeP7gUj11NDMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741146811; c=relaxed/simple;
	bh=KYu15OTxtFs2mF10JuE1RcryLYxEkKONS/St8WU9dMw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lXmsB9RKFtSfx7DHcHEa7pi64XkXffkyBR1ClY4GOKbNooraLNxbRtI0TZ1lx+5idYR+WBkozg37dcFlI9yM/KN3B8WzzbmO5WOWNjjOM+xBnPvQsNqXhmPpGS8iYdcO3DZ6jApoq4/Pxkr0IQgrSQua5Ujdn8n2nukO7rUrFYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fqB2QLuD; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fqB2QLuD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741146809;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+mJRNWDqZaDl0D1j/RlDn06NEO5jFGolr9VYIE5+CIg=;
	b=fqB2QLuDuGWtmtYcRxw5h1rnGeXHUkfJ/7RahvZBAnUu0jgPmg15eTIQtHJE6vYEQPyNFP
	ikyEawHv5DUAyGMa2QljQy4zk6IlgGzrpAGhib6E6O3FUI6ijOy+hsu0RGLhDY/ZPepa4p
	emximgOa5XMvyKbAfaGdLav2DqECXeE=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-180-CtI7rqqoP8GOkVCeN_-08w-1; Tue, 04 Mar 2025 22:53:17 -0500
X-MC-Unique: CtI7rqqoP8GOkVCeN_-08w-1
X-Mimecast-MFC-AGG-ID: CtI7rqqoP8GOkVCeN_-08w_1741146796
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-2ff0875e92bso8717519a91.2
        for <linux-coco@lists.linux.dev>; Tue, 04 Mar 2025 19:53:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741146796; x=1741751596;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+mJRNWDqZaDl0D1j/RlDn06NEO5jFGolr9VYIE5+CIg=;
        b=SB9qhNNJhvoNyI8dlsc2mlMt+VT+nbrj5Guyip4jHFVBFjy4QlEaSnfxsUKzn+SpGY
         Lsot43WW/ckSBBZRKL1QCBQbSn58N5JqNa18JoAG39aNTbWp0zKQ+L3T7KNEGMCMb11+
         fmRGtFYIhZbDvdajUBx4u477EqkeKnK8dyV/abLWhXuG7/Y7dcW5eYad56/1S1mE4kid
         sHOVc4uB4PiJYxyapoPYl9aYIwz5qFDO+3DDTg3lqFz9xdjSKaeK65QbonL3GGKrEy4C
         PjI1OMACMJazclrISvoFQ5m21yO1OdWPd+8ZrJ0acO23+XUIwaNaeL1d4cop/ZUFxHD2
         LQQQ==
X-Forwarded-Encrypted: i=1; AJvYcCXj82TcFqFcQ6dkxE7Sv+psYkYjqd8+wznWMluDxkt35qrBdbeiUNOmEoSCSLoiHJkwMGR+8AXLEeRW@lists.linux.dev
X-Gm-Message-State: AOJu0YyffrIMUW9FO6Mn5Plv5OSeNkmWyyTLBfkXp8X3Pth1iuB9gwDU
	eAk5O5nsyPdTSmrwuKDBQZ5H9U+ACaNZNiIXY0fDsi8cMpGRZPemiMj0Sjvt9YbeN/lDF0HsGEX
	05NfgMJu+EhPjIEClb/55fZWVu9WlHtfjE/r/acMZwSoNIbtL07KcoyTqOUA=
X-Gm-Gg: ASbGncsahS8LlzW0Uga2THSWf2vWO80EJ5ebJDPXuzShhLqAx+KHglLQD8++3mwV8Nx
	7NnezhQYJs76tIoEL5Ow74MxS/nMcpXGpJpwtPDhn3NRKoUbrSDplVU6hoMpbczWrZ43jqlkfdO
	yuNGKU6ulngsrfpmJV3Xn5XxhkUAxXOIl3NBMSLpYyHGFa0v+CB5a9EOQ5wOdgT3sfMpkFtIT/B
	lfccwkoDhwNAl14YoZPX/PyJUGfaUTiMqcgkinCmUSZeKOiSA+KzW03GNjVRx0lrNZSZxlgyT9u
	LevTqUFeNng+bgQ=
X-Received: by 2002:a05:6a21:150c:b0:1ee:cf13:d4b5 with SMTP id adf61e73a8af0-1f3495afc1dmr2823091637.39.1741146796420;
        Tue, 04 Mar 2025 19:53:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFuyA16zIv02ugj3FPLruOV0ZdxdHMNTCUw0ZHSpkP3eGnIKTFgv0oqMKMfRXj1Nc/YwnybSw==
X-Received: by 2002:a05:6a21:150c:b0:1ee:cf13:d4b5 with SMTP id adf61e73a8af0-1f3495afc1dmr2823058637.39.1741146796108;
        Tue, 04 Mar 2025 19:53:16 -0800 (PST)
Received: from [192.168.68.55] ([180.233.125.1])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-aee7ddf20b8sm11041231a12.7.2025.03.04.19.53.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Mar 2025 19:53:15 -0800 (PST)
Message-ID: <af65c1ea-202a-4a60-ab13-0c325385b7ec@redhat.com>
Date: Wed, 5 Mar 2025 13:53:06 +1000
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 00/45] arm64: Support for Arm CCA in KVM
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
References: <20250213161426.102987-1-steven.price@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20250213161426.102987-1-steven.price@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: VzwkVy0pYPFngJhRnG-dr52LLlxpaG5UGh_js_-Liz4_1741146796
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2/14/25 2:13 AM, Steven Price wrote:

[...]

> 
> The ABI to the RMM (the RMI) is based on RMM v1.0-rel0 specification[1].
> 
> This series is based on v6.14-rc1. It is also available as a git
> repository:
> 
> https://gitlab.arm.com/linux-arm/linux-cca cca-host/v7
> 
> Work in progress changes for kvmtool are available from the git
> repository below:
> 
> https://gitlab.arm.com/linux-arm/kvmtool-cca cca/v5
> 
> [1] https://developer.arm.com/documentation/den0137/1-0rel0/
> [2] https://lore.kernel.org/r/a7011738-a084-46fa-947f-395d90b37f8b%40arm.com
> 

I had a chance to test it by following Jean's instructions [1-2]. The guest can
boot up and kvmtool also can boot the guest. I'm listing the repositories I used
in case some body else want to give it a try.

[1] Jean's guide to build software components needed by ARM CCA stack
     https://linaro.atlassian.net/wiki/spaces/QEMU/pages/29051027459/Building+an+RME+stack+for+QEMU
[2] Jean's guide to build firmware needed by the emulated host

host
====
tf-rmm    https://git.codelinaro.org/linaro/dcap/rmm.git                       (cca/v4)
edk2:     git@github.com:tianocore/edk2.git                                    (edk2-stable202411)
tf-a:     https://git.codelinaro.org/linaro/dcap/tf-a/trusted-firmware-a.git   (cca/v4)
qemu      https://git.qemu.org/git/qemu.git                                    (stable-9.2)
linux     https://git.gitlab.arm.com/linux-arm/linux-cca.git                   (cca-host/v7)
buildroot https://github.com/buildroot/buildroot                               (master)

guest
=====
qemu      https://git.codelinaro.org/linaro/dcap/qemu.git                      (cca/latest)
kvmtool   https://gitlab.arm.com/linux-arm/kvmtool-cca                         (cca/latest)
linux     https://git.gitlab.arm.com/linux-arm/linux-cca.git                   (cca-guest/v7)

Command lines to start the host
================================
[gshan@virtlab723 host]$ cat start.sh
#!/bin/sh
HOST_PATH=/home/gshan/sandbox/qemu/host
GUEST_PATH=/home/gshan/sandbox/qemu/guest

sudo ${HOST_PATH}/qemu/build/qemu-system-aarch64                      \
-M virt,virtualization=on,secure=on,gic-version=3,acpi=off            \
-cpu max,x-rme=on -m 4G -smp 8                                        \
-serial mon:stdio -monitor none -nographic -nodefaults                \
-bios ${HOST_PATH}/tf-a/flash.bin                                     \
-kernel ${HOST_PATH}/linux/arch/arm64/boot/Image                      \
-initrd ${HOST_PATH}/buildroot/output/images/rootfs.cpio.xz           \
-device pcie-root-port,bus=pcie.0,chassis=1,id=pcie.1                 \
-device pcie-root-port,bus=pcie.0,chassis=2,id=pcie.2                 \
-device pcie-root-port,bus=pcie.0,chassis=3,id=pcie.3                 \
-device pcie-root-port,bus=pcie.0,chassis=4,id=pcie.4                 \
-device virtio-9p-device,fsdev=shr0,mount_tag=shr0                    \
-fsdev local,security_model=none,path=${GUEST_PATH},id=shr0           \
-netdev tap,id=tap1,script=/etc/qemu-ifup,downscript=/etc/qemu-ifdown \
-device virtio-net-pci,bus=pcie.2,netdev=tap1,mac=78:ac:44:2b:43:f0

Command lines to start the guest
================================
[gshan@virtlab723 guest]$ cat start_guest.sh
#!/bin/sh
key="VGhlIHJlYWxtIGd1ZXN0IHBlcnNvbmFsaXphdGlvbiBrZXkga"
key+="W4gZm9ybWF0IG9mIGJhc2U2NCAgICAgICAgIA=="

qemu-system-aarch64 -enable-kvm                                                     \
-object rme-guest,id=rme0,measurement-algorithm=sha512,personalization-value=${key} \
-M virt,gic-version=3,its=on,confidential-guest-support=rme0                        \
-cpu host -smp 2 -m 1024M                                                           \
-serial mon:stdio -monitor none -nographic -nodefaults                              \
-kernel /mnt/linux/arch/arm64/boot/Image                                            \
-initrd /mnt/buildroot/output/images/rootfs.cpio.xz                                 \
-append earlycon=pl011,mmio,0x10009000000

Thanks,
Gavin

