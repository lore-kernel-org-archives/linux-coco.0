Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794925056;
	b=FwvggXfTFkKGdfx+PoMmRLZWsOK2smBdGkIxjayLkmKoDyTwcnC+kTa8z3N38IC4+4pU
	 p93wbUkRgRkh5tEeVjezVOKOn7CvWiShTZVx9n4nzOeMKoL3KJiesY1E1swNX2BOc/1Oc
	 4hnZC2VQhTpmiLcDWfmKrbmxpkvqbqeN93lFCghjXUhCyYj1d7WeyPq5rMltR4sYvhvA5
	 vNyQrkh3K4EGvLClP05pC/+bo8wOTfn+g8/d2/dEs9e1DhVPY22NxVfq9ktbIjXI0aIrf
	 Y5Y7YxjmZsBf0eBtMXy5+hAoT2Uz/JazAUJT9fODUhcyr6vSZP/j1Cxjf01/y5+qC+w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794925056;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=BLybj40HRrk+JRnjEtELwllmhvie6n0a34/NGObtXmQ=;
	b=ZMweW47YqCzhj0cjKHqd2A4Jy2rNtsUroPogHqiUNbmXf6ejeYL55qOb8U4BLN/2JEWm
	 SJgmQHOUOzp7WD0iOBiTdUF6Ze280xFrhY+hXc1OLHcxaQVKzYVhxkOLRYNdzNPMy0Wn+
	 Mt03VrmyxFlzbDb5P6z2g1G0BF4SqOTP+Fd3c09ICg3lYn8KPAzh9iEuqHylKPfEmPdV3
	 nz4HUpp2/msICaFgHTMR8giBW9uIddIOubEUdHs1f6ujNdRp5aYnZbpgyUGVY1oBN7OAN
	 VwnPhZUumSgW+QgpSvy3EDORWetLPcg9VAN1KGZh75U5VByEZEVHP6yFU4u+8dDiptw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Zy7Y2I2V;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.54
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 734FD606A32A
	for <linux-coco@lists.linux.dev>; Tue, 17 Nov 2026 14:17:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 734FD606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Zy7Y2I2V
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5c144eb2f43so6219e87.1
        for <linux-coco@lists.linux.dev>; Tue, 17 Nov 2026 06:17:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794925054; cv=none;
        d=google.com; s=arc-20260327;
        b=qfVwU6pZkQm0JBL7JFkRNNpDsI5nTAIk9RsWMOcHH85IODucbTSXEDwP03ALy00Nw1
         YK4U1Zbgly3NYzasy/c056VRCkNLoIKSV7EN88VKCp48nTySEcH6FqmhCYWk6UDZzY6n
         OZxq/DXkRKDN3LlVXIh/pBIPAeDJ8EqCMqkiBzt8kvEEiRoNAcTUWuzID8YztztUaez4
         w2B+2okGJxEwNtbA1k9mgePbXqEANJLS1qxgOXSlIO9DEXNfknKtW4vbxflwrQPZEwLW
         mIhwXfC7MBPJLFgMbKBQCjYTlhKqLvqMBylcAybyuewBhrnq0+zXhhFpIaid4ScqhpA+
         boOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=BLybj40HRrk+JRnjEtELwllmhvie6n0a34/NGObtXmQ=;
        fh=A8vJOFa40sWviltKpNDbKCp0YZOeX1FPn7/T9FkhQeU=;
        b=LjCBgtIbw42MYznaabB+xCRUudkjAMbAwQkZ5A2LwpVHlhbRmuKpIacnIcKtaYn/FQ
         QzRCOH5Zr3S3000NcScuU9POs78blTswio0wzobo6DAnCt4qSeAYf1efm+bePqbknKOb
         m4dvRsTSwNX3oGvZqS32IFanMbwetgWBowo0gNiiuiQZQNmOQYyug2HdlJZVN7nKCySR
         wwqIxJSOlPG8mVZIcYZHWCq1grkuYDB6LBior11C1kJvOLyyYWQ+Mj1ENiLkC6DPDYqH
         3V5DWTtE2tQCpzhpOwXN87IAMZVSzvh3HnUCCUTydEbo8hpHNz+CbqEt0OpPlg+X1UqP
         vg+Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794925054; x=1795529854; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BLybj40HRrk+JRnjEtELwllmhvie6n0a34/NGObtXmQ=;
        b=Zy7Y2I2V4Gu/thzoHqPBjMuzhdVyAiTKPySRmgGAf+r23tCJT89onYGEyoLIdNTiGK
         nT55I7je2PM/1av0glt/NIRNwhKi9+cq2jAAylcQGlPLpsBmmjWsBd0nCFkJg+sgWdTM
         QqrabDJeEajXOJLo+3GWPGjFeSAd7Pwzw/opRrAPPfpLdWUdz/aL0ft4hN25QkGTTMw8
         TwVuToIGmsKIU6M3yox1KKFfzLoRl7IcXeT6KDbmS5Imv9lmPSTJvZk1JlJTpqfgvFXP
         GV0x7vdoLh4azaJgQ9OsPKeqVjdwxiwaFcpWj0+7VKeUFtC/TJA06qVF46smdE17UJOf
         igsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794925054; x=1795529854;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=BLybj40HRrk+JRnjEtELwllmhvie6n0a34/NGObtXmQ=;
        b=oR+UM7V0dmB7xosDW02EVXxm/O5i2dcQBKpp8CWNzFuO9dFdctPGxXV4kw/6aNn7kc
         outb5Nf5oAEfErUFwFrHqJLmgcNjiUOWSU2tU002eXDbQKYSQ8fv26esk1ACcAj7tIKq
         aYmUe3i+xL+Z5ToMw9syIriAmMGwIf/k9iUaR5fcmEP55F8Bd8UIT6r7jX4T+c1keifg
         nrlaHJ8w8+y/ryf4rBOZ06shV9gxEnwoSmQIranutwA+FOSC2TXuoXRHwNN78AGVXpV7
         dcmsA+a/hAiR5ypDDAt3jZ3+V3eM1ZBEyuM4//BP82m+qy4D7g+U/UczzH7Fwa3Ir0pg
         s6eQ==
X-Forwarded-Encrypted: i=1; AL+hErEqoICzOUK+LWLmLEN+hf2lmFxJTCfVPUPv/fZd0lpOv5P5DfVT8p8s5/Ka1QLVlQZ2MCKCIAPNSGE+@lists.linux.dev
X-Gm-Message-State: APuU4Z9eP+V4quVbQ6ISZZoOnoK5sivwPpgt9t7NnmoBYFcbtdOEjZjS
	dObbhy/g6pMdR8/KgO+pUj3zGCUOkt7BVgLG6+qq3H53kRD16CXIKD+EB8FXMbcTr25OZuNmx+5
	TnVKnU4wh4zyLZ2ej7MOY7lQZQ66VmtDLB1hUgWgy
X-Gm-Gg: AYBFou1xsxdMpQK619Ay/aJDigqxqcuHE6CjnzvJ4am0T8DDJaGRUXjK3K0EhPgs+gB
	Gc+uJlkLtxjDtNG2i9uUo2UCH3ExfVYtg2ISOi6xriZdmTod9iSzLIVk1xruuewMbU4EjWB3dwe
	eR/QAYwM7Gz8kptp5qU3+4K9jyB6leDEX+UL40KXCKbV7MwveOyiX5svnpOU7TTq7ciPMVxTF6i
	LZ0nt3TksExxrYW833RVxL+I09oDgRUWq1T9qMPO00LyWpuf01EQpBil3AwjDDTMmENvBoLJej2
	Sbmr98RTpT4nCTvGzoAVxNo7JxQtUtHWIwI3wp7hLQgPXk6cN+tHhJqM1DrhEn40osTF4cdMTKQ
	DIHFDvRrhfVtN1dHPZS/In897INJmO15gnxhiXY493Yzv1KMtuDpAcUnGuifiJQdhl6PzrytXbO
	E0/1dSegYaA2PrjyR4P2ViBU0=
X-Received: by 2002:a05:6512:1320:b0:5bf:f060:c0f3 with SMTP id
 2adb3069b0e04-5c1a218237bmr141450e87.12.1794925053973; Tue, 17 Nov 2026
 06:17:33 -0800 (PST)
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Post: <mailto:linux-coco@lists.linux.dev>
List-Help: <mailto:linux-coco+help@lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-coco+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261116164358.142785-1-steven.price@arm.com> <20261116164358.142785-4-steven.price@arm.com>
In-Reply-To: <20261116164358.142785-4-steven.price@arm.com>
From: Fuad Tabba <tabba@google.com>
Date: Tue, 17 Nov 2026 14:16:57 +0000
X-Gm-Features: AclHuK961RRQGs05YcwTvTpXpMcWfGbS65nrobWrGykL5gw3Ev5XjAPi08pa1t0
Message-ID: <CA+EHjTyeE0gbLgfiDePPVRR88GFVa7G-G8sr8k6vzM7v_uHxdA@mail.gmail.com>
Subject: Re: [PATCH v3 03/11] KVM: arm64: Handle attributes in stage2_unmap_range
To: Steven Price <steven.price@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>, 
	Oliver Upton <oliver.upton@linux.dev>, Zenghui Yu <yuzenghui@huawei.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Joey Gouly <joey.gouly@arm.com>, Alexandru Elisei <alexandru.elisei@arm.com>, 
	Christoffer Dall <christoffer.dall@arm.com>, linux-coco@lists.linux.dev, 
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>, Gavin Shan <gshan@redhat.com>, 
	Shanker Donthineni <sdonthineni@nvidia.com>, Alper Gun <alpergun@google.com>, 
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, Emi Kisanuki <fj0570is@fujitsu.com>, 
	Vishal Annapurve <vannapurve@google.com>, WeiLin.Chang@arm.com, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Kohei Enju <enju.kohei@fujitsu.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 16 Nov 2026 16:43:49 +0000, Steven Price <steven.price@arm.com> wrote:
[...]
> With the introduction of private memory support, we need to
> handle invalidation requests with filters for a given type.
> Add support for passing the attributes down.

nit: what this passes down is a filter rather than attributes, in both
the subject and the message.

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>

Cheers,
/fuad
