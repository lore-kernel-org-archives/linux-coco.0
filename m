Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEC061F8BD6
	for <linux-coco@lists.linux.dev>; Tue,  4 Mar 2025 23:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741132025; cv=none; b=R88YKpZqojJhQvFP8F5ASoaDK8FbsQGhgWvn4/7H71S2Vzof3rx9h42W+SZweJ/ATDPbZeEhl29SDIIJ/NQBBFEBZm5xhJ2BUJCh5a9SjmfxsvxEIYP5aeXoMQU3f+tYEetDKLtm427Jf4ck71sruGNC/7c16jm5WSLNpSAeXSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741132025; c=relaxed/simple;
	bh=0vaMK1EzqAclihJeDZxRkFMmTm4waXR3LR9AN19QWDg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mhZ/eAhL2MC2V/+4kx4basNvZQfalLAYxc/Q/fvW9XhGPbki2/rVhAkJ++hm+TDZHrPhkxRUlkWTle4FvrdMRAXA8ZC0hnENvNSwzHwQhbe9MCPJiHPWIq12Cx8mj/xnw1RiCv4kBlIUHwnSeDJObYptOF+LAcdPCqxpCIioAFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OCM/2lH1; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OCM/2lH1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741132023;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=g6FYqCr6QwRqz7j744DqHTGMlLhF5qSIjaDfjqoangk=;
	b=OCM/2lH1kygr9cFXVHVMppidP1ttp+sa2B/vrI+nqYkfZ5f99tJeG6dxXG3qktg211nB7C
	QgV/7p00f77e6pXoy0+Zzsdc1z/Q4DIWAUVLY6kIw/XlfswPVbdQKLtlxx4gAn33LhRJkt
	pOmFnXeEynQKWbaXsg86zF8Z8q8sfzI=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-107-W14WwfKqM7GuyqEJU0tdgA-1; Tue, 04 Mar 2025 18:46:42 -0500
X-MC-Unique: W14WwfKqM7GuyqEJU0tdgA-1
X-Mimecast-MFC-AGG-ID: W14WwfKqM7GuyqEJU0tdgA_1741132001
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-22339923628so4268805ad.1
        for <linux-coco@lists.linux.dev>; Tue, 04 Mar 2025 15:46:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741132001; x=1741736801;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g6FYqCr6QwRqz7j744DqHTGMlLhF5qSIjaDfjqoangk=;
        b=UGKZmpUoO1R/yaYqkqxYG1Fv+8bZJCaeJnImqCKTHJHQdD7XP0dNqrQ7oGIclJNRd5
         iGWS8mlLRhY6+Y9G+BaqIf+hTHKMI/8GCERkLEr1G4djkQX1utqW6U+9Em9+ALBsr0i2
         WEAw1/Ox13xLg+eFS8Y6SYhP7TfhDCJdItc9NnAHQ3vTGPV/L8uReJAUK3wmvS5kcjG6
         E9iaCFNRYqxRWguKkpdeFMzyHAgSYyDVyltQxOXlV/q5/B8i1qLJyTvqO7RkRRb91EwA
         ATqLQanePBlTPwwvtokSzZ3KtngCXSbGfaVcRGOxSbEVH5XlMCofo5sD+YSQxO3Yvmmd
         EoHg==
X-Forwarded-Encrypted: i=1; AJvYcCXRi9JjnXD4TYRY5WgJeGCLofKvg33vFLvTpDuT9GRkbfBYBTYgXk9mX30l16+PX4RS/Sjj4VjXxKT1@lists.linux.dev
X-Gm-Message-State: AOJu0Yx7N5PLExGwU5AkHNUJOiPYgp39DmRjAlrU9J7dtB/aSnnhtfTW
	RRBt6cpbO+pUF/x7sgcoaN8HG5rRdWBwewPs9DHF1449VrQUa8ZHrIHiF0Yf7XdC6htxRFGHKfk
	VcAZtaiiy7oy7BoxQd7i/pAjODvMSaC4rAxaDm2/xt13Z2D2Yv4AOO64YOO0=
X-Gm-Gg: ASbGncs9341e7tKlC6nJkc2Zfq0BhtTDgCIzCaF8MYNJp3EQRauSIBH/EIQh0U8Kz3X
	gcFBJn5ntcHefZSqTBjSOHk67U6+O6c5vkGpcHPp48cOjgo7GtNg60RhdS+UmbgcUn5EIT0sCnC
	P1j2kKA3A1wlkaWatIsYXTJvNzC6oW0C8p+0mqE6PvGVFNBT8Jd4+gOqdBFGiXXb9KyM1t2OgK4
	PpHFSbFsC2+T6pLyaoA0DNOWd8TTjOt1LMZ/3ajAmsS/2TqPPd0IBlG+yKb1b4eoUCat5eyfZGN
	I4fHOm5jxW8TQIM=
X-Received: by 2002:a05:6a00:139c:b0:730:9637:b2ff with SMTP id d2e1a72fcca58-73681ea12f8mr1622603b3a.7.1741132001108;
        Tue, 04 Mar 2025 15:46:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEi8JMyb0mWMUpD1PTtuv+YTTWcm/STeWKBdnRr6BiZi8G3Jvspyz2BgiTf4N+sfAjC+o/22Q==
X-Received: by 2002:a05:6a00:139c:b0:730:9637:b2ff with SMTP id d2e1a72fcca58-73681ea12f8mr1622559b3a.7.1741132000737;
        Tue, 04 Mar 2025 15:46:40 -0800 (PST)
Received: from [192.168.68.55] ([180.233.125.1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7363f2e8a34sm6324254b3a.168.2025.03.04.15.46.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Mar 2025 15:46:40 -0800 (PST)
Message-ID: <f331382f-5747-4837-ae60-42e9cb37ecd4@redhat.com>
Date: Wed, 5 Mar 2025 09:46:31 +1000
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 36/45] arm64: RME: Set breakpoint parameters through
 SET_ONE_REG
To: Steven Price <steven.price@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>,
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
 <alpergun@google.com>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>
References: <20250213161426.102987-1-steven.price@arm.com>
 <20250213161426.102987-37-steven.price@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20250213161426.102987-37-steven.price@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 4_br8LV5R_oNmCTn6J71VcqYM0-P2VgjoBLBQbt3ZDw_1741132001
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/14/25 2:14 AM, Steven Price wrote:
> From: Jean-Philippe Brucker <jean-philippe@linaro.org>
> 
> Allow userspace to configure the number of breakpoints and watchpoints
> of a Realm VM through KVM_SET_ONE_REG ID_AA64DFR0_EL1.
> 
> The KVM sys_reg handler checks the user value against the maximum value
> given by RMM (arm64_check_features() gets it from the
> read_sanitised_id_aa64dfr0_el1() reset handler).
> 
> Userspace discovers that it can write these fields by issuing a
> KVM_ARM_GET_REG_WRITABLE_MASKS ioctl.
> 
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
>   arch/arm64/kvm/guest.c    |  2 ++
>   arch/arm64/kvm/rme.c      |  3 +++
>   arch/arm64/kvm/sys_regs.c | 17 +++++++++++------
>   3 files changed, 16 insertions(+), 6 deletions(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>

