Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 532F9156F3C
	for <linux-coco@lists.linux.dev>; Tue,  4 Mar 2025 05:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741067290; cv=none; b=W/alC9v2dBDzOyrR9Lwq/MUUqb6+oGXvMkHXFO87s0RStba2zSI9xWBXra4dSKV2NZ6IKT+g+dgE9K6MCZsCteh+VxapWK2OacEVwVxszYg71uIWaHZ49ji5UfonDzKqTtVyNX+u9MZuS/SuwTP3JLidVini4cr9VYO67LISskY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741067290; c=relaxed/simple;
	bh=uIUop+r/l6xH3Ly39qJ0Hh+UtGOGfUCQ1Gk41ZgJy6s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oDrmQ08fUbXqh+LAMydL54C/OPWUO2ETMYGNfSmFr/eGG8al5Yd86eejo3iUtkCf1jMv2GoqIhzIFarQIjBpD8ugOhIk9tiC0qjRtUug2Io30U+uUea9uyF2QKv3ALS36fox0Qjp/B2WH3C8e8W1MK/ik7v07e91DP0+x+rlRcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NycfTGHA; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NycfTGHA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741067286;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ALe8gaqPx0ivwZMUhNjC7kbkgwdK+iS+cXrLOMiOcsg=;
	b=NycfTGHA0eLqmzIj8vT7DqR4/DIpBBqTzTf0zDSyy0kYqrOydj8XtBj4FvrQAc5VyARGsF
	uAXRO1MDUPKaAncBxFsZ9iydUBTuJd+tw65zrsnDVL0kwApeS+xVQHQtQQctScn00UQ/vH
	H9tS3wnEBjSXYMztIlIP/vmEH1EfUe4=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-13-LEd_qr8ZMdSeO8zrL5qgtg-1; Tue, 04 Mar 2025 00:48:00 -0500
X-MC-Unique: LEd_qr8ZMdSeO8zrL5qgtg-1
X-Mimecast-MFC-AGG-ID: LEd_qr8ZMdSeO8zrL5qgtg_1741067279
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-22367f4e9b9so70123245ad.0
        for <linux-coco@lists.linux.dev>; Mon, 03 Mar 2025 21:48:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741067279; x=1741672079;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ALe8gaqPx0ivwZMUhNjC7kbkgwdK+iS+cXrLOMiOcsg=;
        b=BXWtnHXzp7KO7Zqn4HKvcjo0/+TaI8jqCxMVW40NJEoEOQa817dYyGvbuavrg/Sceg
         dKotMDQnlBi+6PDlEoKR6pCgtDD2zuxRrksSFbyNl8GMUna+ywZci3RVMLGI7M38BM4d
         lldVYrc9Ge3Tl3TpgxlDesT+7VGuoqpL319ZT3r1Q4UnwE571FmvZtZthLXl1buxKw+u
         GzCbGZGuZGlR7T2WhupK59u6rO1d0f93eKdNJbR+9IKA5g2Go7QmV4nWe8iH4QNP5ZCb
         JWomST4nN7lDhUVqbm2Ay72I9bsEVo/KNFOK0NE0KVKKQ1pBdseSN919VIVcH5789kJE
         rGng==
X-Forwarded-Encrypted: i=1; AJvYcCUgnoX+ln+GD39DZfzB5sJny8GFXfDOvVu0GgmXA0A/mkZ2lP46IZ5TUSASOEHCWjJLN8Lpg7Q77jgR@lists.linux.dev
X-Gm-Message-State: AOJu0Yws07NVLKRdmjY8aSJ6sqIsYF+VpG8OX7rc3QJle/llVxbWeK6t
	qh+DgQGd4E9BFw/pLkAozn+mOkfQPVR4Sf2fFZ95OGA3KQlNiXlmYnkMpTIveFgH1boP9TyXOvd
	Fdx791DMy2ARCYWBXFGHBr6tCLAkvURjBaTvwNmncWawpdmB220fGup5yWvA=
X-Gm-Gg: ASbGnctaWrBQDJ2UiLF4PHh5bwlirCKrVcxSO5KJFs9N3mTeUf2MLD3Fre9+UnwbetX
	O33WVrBArZ2btxy4sWLAbc6XPsjt3tQz5pqOTwLglyhp3bGX33NT6swNcy/DohhijX/UQoBJnDw
	D5oe1w+WgTdqveS0/kqu5PhAXOE+EUjI0YkWGazH5Zw7bpv2gzLR5UJNQM+dO2DEtGL209EdVqI
	ztU5oMI35tV5N2RLGLW6bHG7PVwf+8gX8AO9WbRVY1mc82lVqUVjHbci6J+v53H4Oh7V0MNVY9D
	vxgajrOzVDUQ666oHw==
X-Received: by 2002:a17:903:1988:b0:220:eade:d77e with SMTP id d9443c01a7336-22369255615mr277878255ad.40.1741067279412;
        Mon, 03 Mar 2025 21:47:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFx0Lhe2HGT1KmpDnS5ZyyAdNkSfy6p9uQW7gR79fCGqriIN6Hj8entskHLAJfXfbmV6sWD4Q==
X-Received: by 2002:a17:903:1988:b0:220:eade:d77e with SMTP id d9443c01a7336-22369255615mr277877915ad.40.1741067279165;
        Mon, 03 Mar 2025 21:47:59 -0800 (PST)
Received: from [192.168.68.55] ([180.233.125.164])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-223501fae0esm87110695ad.93.2025.03.03.21.47.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Mar 2025 21:47:58 -0800 (PST)
Message-ID: <2505ead3-64a6-4135-a96c-85c5dfef26d0@redhat.com>
Date: Tue, 4 Mar 2025 15:47:50 +1000
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 27/45] arm64: rme: allow userspace to inject aborts
To: Steven Price <steven.price@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: Joey Gouly <joey.gouly@arm.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>,
 Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>,
 Oliver Upton <oliver.upton@linux.dev>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu
 <yuzenghui@huawei.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Alexandru Elisei <alexandru.elisei@arm.com>,
 Christoffer Dall <christoffer.dall@arm.com>, Fuad Tabba <tabba@google.com>,
 linux-coco@lists.linux.dev,
 Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
 Shanker Donthineni <sdonthineni@nvidia.com>, Alper Gun
 <alpergun@google.com>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>
References: <20250213161426.102987-1-steven.price@arm.com>
 <20250213161426.102987-28-steven.price@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20250213161426.102987-28-steven.price@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: wOu6-R-kyFGtlLlpDRbgtT5Utnb5j60ubljo8QYA9a4_1741067279
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/14/25 2:14 AM, Steven Price wrote:
> From: Joey Gouly <joey.gouly@arm.com>
> 
> Extend KVM_SET_VCPU_EVENTS to support realms, where KVM cannot set the
> system registers, and the RMM must perform it on next REC entry.
> 
> Signed-off-by: Joey Gouly <joey.gouly@arm.com>
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
>   Documentation/virt/kvm/api.rst |  2 ++
>   arch/arm64/kvm/guest.c         | 24 ++++++++++++++++++++++++
>   2 files changed, 26 insertions(+)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>

