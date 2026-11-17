Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794924346;
	b=RtzUk1ua4wGTtAPDi1ivBJRkpl11RQtQajM8UGT8cErraIGo5Kwn/TxigoxfgqAI9/Wd
	 7um+GFD/Qcsk5RvYcx2La8JdvMQWgo9XMx092Y5RmiSCYVdAGx0hdIKxDSupEJqT3uiuM
	 V2jqW1vP4nBDDC/bwiuZuZlTqGvf0oY/CM9NvVN/ocLRrEN8GTsAHbxAMyHQae13w+eB9
	 /VQnVbicsYZFmHq3pMQ1j4BL5Cp/Mn/NR1Tz1T7tBu/TDRIZguvMrxqcibZYF/FybMwbz
	 cyFDyyRSoD2BxFDJk92XizhFJhQ7s268bRtJ9DVnTiUGS3APPBG+9ITaPdoTPiPIDPA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794924346;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=ngfsadg2SKwRZORmemooRU9fe+LsEp8AELUWW3EroVQ=;
	b=GYZNApNJJpG7mYtNLxQTx3XX2CmnzPaPBOfk1xrWLx0W0KnuqBpz1UP3bRxE8NJZw42j
	 Xzl6toFMEvWC2kkrBlMy/Vi6tgW9XffXGzO/5c15hWkBmAEXS0XeWsUwLOpe/Zw9bNi7f
	 c/Rix/kN02Q70EPhCok/UE/A6A1veklSU/8PUvKoSwAQ+WzmeooVFfBSCkyGuXEtfH7pI
	 xyEQ7IJ0soFNwH3M1uxmTrlyl91vRWLiZ0stk/n2NRvCnAzuEoaOAKebOEdKV2UWxlJtU
	 EEnAmPflOwWQ5CnOTwtxjyBWDwif6vtAPINLx/1rUXWdeZqJT83fzRasZrBqJx4MSBQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=CSdIYHHV;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.53
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27AD9606A33D
	for <linux-coco@lists.linux.dev>; Tue, 17 Nov 2026 14:05:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27AD9606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=CSdIYHHV
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5be58ad9600so8834e87.0
        for <linux-coco@lists.linux.dev>; Tue, 17 Nov 2026 06:05:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794924344; cv=none;
        d=google.com; s=arc-20260327;
        b=pSE9jtEkGAp1Nm9VeSpV32vXkVSdmV4U88WrZBN0lFiTCDIpJsDkB2brJgo+6awL69
         1jJUxnDkXps8nA5DmgTZCv25vCyTuOvAv/D7ca+SvEYIzp0fpVhGv9pJ2flsPjSS+NXc
         yC/XAc528ADoBDxcV0z+F8bNxpdRW0JZKy0ZHmNeXI2JQe5020qCIUPAD73MSO4LrzOz
         ARCJ43IbfJs/dpPJOt8Zp+U05IFRuG1CPTP0AzzOcEjhXxIGIXXdwsMH5OEedLHLElG6
         Vr0H2FtjfSiyqfX2U1PudKu2TFJOW/opUhdzcb4EwNPjKfpHBvFqRQgVik4CKR7PN9iO
         cA4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ngfsadg2SKwRZORmemooRU9fe+LsEp8AELUWW3EroVQ=;
        fh=gAi31Q/l43pD23/UVd46+zr75fOOMQvyFaHBb9AedZs=;
        b=Mem0kHCqTWmA1wf8ckpv1AQCz2UZ2szMM8SJbiwy3vRxbh4n0j0Kjg3n2FKH2fxfya
         mMspp8HKOeUyuaSzJAzIyEadu56HENfEacglQs4C0Ol4PVLBV7rHqvFsBfjRV3RVkzuj
         cFpYQxp9sLDyIccp0rSKvQ+0lLRzU/VKMGDsKiirqhLiQe7graseqZalXdicHcwwvHRJ
         gIpFlaGhfvnaPsb3t7QoHpqKtgoeq4BvS9M7At7XZxuWzkcAigAopxSgd5J0U1DfXTye
         +cNq1a2rDiS3eoO7LwIv4E5hIfcZ4FxIUii5FjrLdO/GUOtjRdcs+2MzlXPSkyTYOSM8
         PJsg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794924344; x=1795529144; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ngfsadg2SKwRZORmemooRU9fe+LsEp8AELUWW3EroVQ=;
        b=CSdIYHHVbaGD89gVt9GkCpt7UbtNi8wJI8Sd/AhfL4c9DNNDfHABzrjnojEStI0wKf
         nmP3fNFf10Hvk5PWBFt8FjVp0O5wzl4sZyE5wDypfQroQ9n/EEAlt5vmm+HKUh5yQ9Uj
         r4DKOAle0TiGhb6+CABB2aEDy5xh/CELs3eZ8zesoigPP3suaUdRePRgSYt/G7gGJxr1
         Ur/TaaxFLHbv/sNHBorQZeCz//NX8M7tT4cy3l+wj9ftbKo/jSGmFfrCwGtbHnaa18XA
         bJucMt5+31sEUbAngl1eyHp97y2legaTkwyxnjzhOQvx5YGJDJa65pgBU8CnHqwWPvA9
         dR5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794924344; x=1795529144;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ngfsadg2SKwRZORmemooRU9fe+LsEp8AELUWW3EroVQ=;
        b=RsrdNtKCA39Gu4Yzi+ifOropDt0hPyDNRMNS741ZS+GVnPPtnW1mYbp3LMxm6zq8D/
         oY1nzZGHrIICoq05b0uEKDnerYv5ZK8OQ8K8wR2ZiHwb9Faz6XFI2qR0U0wj3uncwcFG
         0TSa4SookBBJJcgnVqlZUHdEKXt/FRmHTNAS2k3vpJlPiHe33sGkp698aimCqMewVXkY
         rwe8GZ2nHvJ2ZGpbvb0oPObe6ZH1WMDSbX1g5e89aDL3tuf838eUIBO49AJAFhFhIvoU
         bvTqCxRY73Tugr/nOrGTF3s6HGohOHaIR4lG+Cb13vPh8uDCVLGqt5QUKuW6P34aLKJQ
         BA/Q==
X-Forwarded-Encrypted: i=1; AL+hErERWCIyHkUPlGdL12UixRv77I5Fi9V9iNFrxMOzyQ9zUILdY+iHWozBAnlZS5wuQ9Tas+kGMq8U5aHh@lists.linux.dev
X-Gm-Message-State: APuU4Z+RAnumG/S/0Yc9cZcnMlmLGecqjGfyuwBXzQJ5x2SFhhIAzZ3j
	AcZXR8fniW18TIzsrd/J2JxSlxOO+MwbkW5lKyIa9KmvSLmBXVdqP+2MW92zgm89zsJyXPXmNOA
	KKU+5C0lefJb/Kn8ML+j0uMwjPj2sOrmHOX4fYcni
X-Gm-Gg: AYBFou3/wklvwQs1mujnCuJxyQRxn58Bw5d1R4WlIGc6GnvDsdZJQlQbSFrkezI4C0J
	w7cxqhWrueHWtIE+M2dPISZaXMn5cLMj7OhWLB72IgRN99FvuEkhK3l9F+diIke2nU8+9/r+xiq
	28f04ZOdXF9kSrWTPupe0MGn7JV2/qBArqtTjDWGyQjhbEGkgKRhm/TdgB6b/2uKMVizb9t/gkX
	OLTp8Y8+4OmNc9WT/UUvLP6tviSUcuT8d5rGmQPFThdxDSLGW/mcvdH6yhOWIVwuYDBYysoEvHh
	5qNlclChd1KMSn7ox0o+gSZAyD5Fw12PLFnbdAIt1pOxGLXeiMrcQsdLX6JuncLAX+b38W2OfDv
	YVUVSUVt6sQk1WSPla9oI41js7IEs+OgoMhJNaaCjAKsKr+vrdBi2JMDgNP9WguFDwHSwgqEYWj
	7l2QWB+W5f6EEsh0dnlP8pZTU=
X-Received: by 2002:a05:6512:1111:b0:5c1:4f9f:1ae6 with SMTP id
 2adb3069b0e04-5c1a217f086mr131117e87.15.1794924343575; Tue, 17 Nov 2026
 06:05:43 -0800 (PST)
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Post: <mailto:linux-coco@lists.linux.dev>
List-Help: <mailto:linux-coco+help@lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-coco+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261116164358.142785-1-steven.price@arm.com> <20261116164358.142785-2-steven.price@arm.com>
In-Reply-To: <20261116164358.142785-2-steven.price@arm.com>
From: Fuad Tabba <tabba@google.com>
Date: Tue, 17 Nov 2026 14:05:07 +0000
X-Gm-Features: AclHuK9jKHIPqUkK3esGB7IzhXZkIYCyUzZ9ZlR4n4bgSHCJJEi20GuUOPH-oTg
Message-ID: <CA+EHjTy5xBmavNWSYPjqU9qXtssV3ZHzsUr1s_4bVOt1GnDLVg@mail.gmail.com>
Subject: Re: [PATCH v3 01/11] KVM: arm64: guest_memfd: Check mmap support when
 preparing memslot
To: Steven Price <steven.price@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>, 
	James Morse <james.morse@arm.com>, Oliver Upton <oliver.upton@linux.dev>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Joey Gouly <joey.gouly@arm.com>, Alexandru Elisei <alexandru.elisei@arm.com>, 
	Christoffer Dall <christoffer.dall@arm.com>, linux-coco@lists.linux.dev, 
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>, Gavin Shan <gshan@redhat.com>, 
	Shanker Donthineni <sdonthineni@nvidia.com>, Alper Gun <alpergun@google.com>, 
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, Emi Kisanuki <fj0570is@fujitsu.com>, 
	Vishal Annapurve <vannapurve@google.com>, WeiLin.Chang@arm.com, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Kohei Enju <enju.kohei@fujitsu.com>
Content-Type: text/plain; charset="UTF-8"

Hi Steven,

On Mon, 16 Nov 2026 16:43:47 +0000, Steven Price <steven.price@arm.com> wrote:
> Check the guest_memfd backing file when deciding whether an arm64
> memslot has mappable memory rather than checking whether the slot is
> gmem only. A public helper function is added to be able to reuse the
> static kvm_gmem_supports_mmap() function.

nit: could the message say why this is needed? It's a no-op until
patch 8 defines kvm_arch_has_private_mem(), which makes every
guest_memfd slot gmem-only.

Cheers,
/fuad
