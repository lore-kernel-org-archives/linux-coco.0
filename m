Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EC191C173C
	for <linux-coco@lists.linux.dev>; Thu,  1 May 2025 03:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746068778; cv=none; b=EnPxS9lOvpWihkBYF5V7oZsLRHKizm/pV4Zd5Dwuc3aVtNXCRjyiFoBWfa8fuTkpc2V22n+Z962m8Nf2mhqPv78cgdzwuZAcKCtRRwb0xBc0XPvBBQToXkYSm+eM7jYP6sUYYfaJQRmOjNv00KXjmepR2HBU5ri3AxDHb++5XJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746068778; c=relaxed/simple;
	bh=X/XhkrFmWidZvhk9MnMyADxxQYnJ6LlWfI1v/DRQrcw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LhBUHzNRg8xPZvZFmBVG59VBVxGuZwD6ULqMLFmbGjTCIGV9kWMHquRdc3DuQOXVMOL58Fw9/LkReUGaps2V875wABqATAudN+wmH3THk5aLw2Wa07qGxKFF6CZX5Yf5oCCpKo4ixl62VO7TUniCssOWn0pdgdVlivqb474QAGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JtokJqUR; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JtokJqUR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746068774;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zBUyB0Q8zMsFcB5UcneuetEe4xDQ4aVw4JfTOnTTULU=;
	b=JtokJqURdh01b9DFtx37qYtU9VpbM9VXAghoNEOksKvk6w7d/OGl1c1N51g9pLdhqcBMNj
	tlMCbDDS0YxxPqgNX7LZ4kWXbPGm2TxCTZu2rOva4RBmIrx6PdsHERIHx47xPKbYU3I7l+
	y2w9oAoC+7RQygHRKqf+YVx5tiLSYLY=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-653-FSjZ0NamO6urORJS_vI1Lw-1; Wed, 30 Apr 2025 23:06:13 -0400
X-MC-Unique: FSjZ0NamO6urORJS_vI1Lw-1
X-Mimecast-MFC-AGG-ID: FSjZ0NamO6urORJS_vI1Lw_1746068772
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-736b22717f1so930353b3a.1
        for <linux-coco@lists.linux.dev>; Wed, 30 Apr 2025 20:06:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746068772; x=1746673572;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zBUyB0Q8zMsFcB5UcneuetEe4xDQ4aVw4JfTOnTTULU=;
        b=C5417IspRcptoFYqpyO4VRYf1Fpap+ByE8PUJOvwSszt4JLW7XZPu9cWzSocq0if1P
         8nIvpsPK1jsVEahPNVTPfLsGlUhLtUkRUGCH1S0elgZP9smvnf7KUmgGdKPgr2W8mWU7
         sbzm/KYlDZ+VuKNHYID4Jw1oFdhO5lMNwqj71w+UKKjwj4Y3DiBiyHEOXcFAw4JQI9Ky
         Mpy5drtJQQoxHrNcSkRFpTKQ54y99qYrMpuMADd5H4o4bFkyJTJ7Ny5Kdb74rfc61bRU
         /86DoYJCu+ofmrgAjhzxmb/ujArSMb4ydFDVqb2yfimRRZpiebnoXvutDVPFfCGGX+E1
         rARw==
X-Forwarded-Encrypted: i=1; AJvYcCUgB/3UYGnnY13ctoAO4redpaHO7+v2xx+HIJwKJQ7af29zabK/jP/6k2fDZBmjNM/R3o51BVknH0qW@lists.linux.dev
X-Gm-Message-State: AOJu0YyiHBtykHm6E+IBMj0ytj/zKi5dceGGg493EA9KNFS893zLJolU
	lgjWzorvaQjH2Nn3AaV9n0SqrU1m8MILvzHqbyWM4tz/e6+xhxy0tmgBO8llaltILDbNY4ErPK7
	plaXvg1fWp+unMId5bJlmxBknMurJrVlVF1QZKegHmg3WlaNUdQwRFsU6/VE=
X-Gm-Gg: ASbGncsE4TVD0IWTj/Ao7ACFpduAmClt2KL4FU5htby+yubeRRQ02UJVJazkeIBeP+a
	K79p4UjwkBZC6YqzJGBG3zLrT/pj/HYaQscr+zKvNtIT275c/fgIkG8tHHjoQkrZ1nc0KDKwbsF
	WtrBJIWS8buzUY1GRs+4nYbGR2SvqqH1OBW9l5cCyEeixuOmWpSd5I6KD4f0tRBNKrYj06EJaCY
	UV6XO/zwrvrKwTK1Gfg14xgB5zw/PcCUdHhNmlFzzk6y6nnTJCDpPCsnNjgTdtqHv2Tvtgt0EKV
	AtqKEYj6Tt7i
X-Received: by 2002:a05:6a00:35c8:b0:736:bced:f4cf with SMTP id d2e1a72fcca58-7404927930fmr1444806b3a.0.1746068772420;
        Wed, 30 Apr 2025 20:06:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEqFyaQqRxd5YG/d2aF2wgTwFAOyBR0cwvIicbDZqnls7TSQ0mJMT278uEe4KH0+EWzXzgDGQ==
X-Received: by 2002:a05:6a00:35c8:b0:736:bced:f4cf with SMTP id d2e1a72fcca58-7404927930fmr1444772b3a.0.1746068772121;
        Wed, 30 Apr 2025 20:06:12 -0700 (PDT)
Received: from [192.168.68.51] ([180.233.125.65])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74039a600a7sm2560107b3a.130.2025.04.30.20.06.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Apr 2025 20:06:11 -0700 (PDT)
Message-ID: <8a21a392-5ae6-4d55-905a-0956f48853ba@redhat.com>
Date: Thu, 1 May 2025 13:06:02 +1000
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 43/43] KVM: arm64: Allow activating realms
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
 <20250416134208.383984-44-steven.price@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20250416134208.383984-44-steven.price@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: DaN1FfZL54hDi_uEYNmEpP8tAv1SsEP2U-kWkyG50uY_1746068772
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/16/25 11:42 PM, Steven Price wrote:
> Add the ioctl to activate a realm and set the static branch to enable
> access to the realm functionality if the RMM is detected.
> 
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
>   arch/arm64/kvm/rme.c | 19 ++++++++++++++++++-
>   1 file changed, 18 insertions(+), 1 deletion(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>

