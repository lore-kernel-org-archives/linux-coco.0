Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 472D823A0
	for <linux-coco@lists.linux.dev>; Sun,  2 Feb 2025 02:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738462300; cv=none; b=LEDN9mP+jk6g+A7f6zeDB7Fki+MYpPJN+0zlkrnRJyYOLzs4NZHcMB3jOtXE6ZAKEfiOq6XWmBvXdlTz4bTIkwqS6f+1oNwvxblZc3omeZOSDyVaXitRCTRIG7IyyAeUk4/8bdJCP7i/ecT6iV4nozxBqLwKfRGLFy555hgUeNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738462300; c=relaxed/simple;
	bh=f/Xz711tH686KIYj8B5uhbPaXR1gbd0LuSh4loqolqI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cGS0HLHe60eUNYyz1V2PT1FfVkGp3hYuhZ7hjAW9khylJ9TVg44YsgkBBgg3ous7y+kchtF+IZIGn5M5fIZwvTIIDslRcay53hV5TJDoQr73ivcU8iHMYoBgW2bLpblcpA/IocMoj002EotpdtZRcd/+QJZ2tD7QOqZJHmBd5hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ay7Z8cun; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ay7Z8cun"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738462297;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jz0tT2FTFLvNvj61SDsLmOkHBQ46Tt26HSOtiuLa6z4=;
	b=Ay7Z8cuniJy2H7KL4tHWi/1++8tOtG9gplccW3L/xEI+N12N6BeqxNbasXKXMbXusqMwDX
	a0LXg0Xlp9YowmrjkpHlDyzlqm6xTETSFMh6qC7ofw3aFN6IgMcawbPSkbAXBWLYDCgCeD
	VLFaKPORJ49YlhFWngl8uCSbuFXv/28=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-659-rW4spBJqP9q7vjXVVHY_1g-1; Sat, 01 Feb 2025 21:11:36 -0500
X-MC-Unique: rW4spBJqP9q7vjXVVHY_1g-1
X-Mimecast-MFC-AGG-ID: rW4spBJqP9q7vjXVVHY_1g
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2164861e1feso62933545ad.1
        for <linux-coco@lists.linux.dev>; Sat, 01 Feb 2025 18:11:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738462295; x=1739067095;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jz0tT2FTFLvNvj61SDsLmOkHBQ46Tt26HSOtiuLa6z4=;
        b=NF3PEMT5SNDrKCOAGVfB5720tvzniVFUNBybpjzA9G5jn3PoAN1YYE4Q3B78XHEC81
         CHjCnzsNHHDD7Ywlj+lCGrccObjx4CTYmYmHFYdrlZEOeJFEZZHCpeSA+hcEXO/uZ2QT
         F7k1enPoaTlH6XAHGT3VPm6UaBMV8l+8eqRDgjZAJxFHj2XH+k6647Tci3gc3sjJShay
         3CzejVl81BnGCcxcISvXe4c9RBngRwRhrv03bz1ri3itixQORo3CnJteOU+/rt7QaUge
         7YTJWfh1Dfq0OQ2RBMHDyIeHYwey9s84uDgxCxBqSR2IbhplN3M4H7ZSYshFmAWoQW2M
         nUyQ==
X-Forwarded-Encrypted: i=1; AJvYcCVGxhj4I6axJHul6gLCfvmkd32MbgjzJ8r0Ug3ejEuTWpqqlGO8YJR4QHcKsnTFwrtc/WoNgXFTzTMj@lists.linux.dev
X-Gm-Message-State: AOJu0Ywu6M5/HjmroGE6tH3/HcBsVxMgogmtRpNb9EgT4MTs9rEi8bLc
	yf4pAaStEKVxtCCo90Hgp+Oq/WoHRfAAzOLY/N8OD/vyEamvTsRUHQMiMakcR5Hr0c8OU34rerB
	Ep8cNaIzFPQ7eCwkxLlGoC3s6//B4ZRJsu3qbsNNxk0j4zZbevXR2nPyQfHU=
X-Gm-Gg: ASbGncs2dgnZLUGrA1Wxbgs8BRWHKA5KBg1mp2BTWn7sKpTyGpEbsbsh+oLoSIXkF9j
	lUusRoyJKajBUFkPJC4LsHsgEwMeU6fGJ63/i018FahoolyJHMcodi+QIwxZDJPQRecezHF3nw5
	kXI/bTzSHRSX4ub7GU7BTTC2jgt+Ndnjp8woKxBYeY6/aZrjYhZGI31Elmj8jwb+nKgWWyK9Kad
	6LT3BxoiPRExIT19/tBSB8rvBNsHaoKqWRTrjOCgvRaByveOrS3sXJT+WgZonga61d3n1DCgV/p
	3x5vLQ==
X-Received: by 2002:a17:902:ec90:b0:21c:15b3:e3a8 with SMTP id d9443c01a7336-21dd7db9401mr253960105ad.37.1738462295042;
        Sat, 01 Feb 2025 18:11:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEznBpra764QOyQOK6CFRr1iAthLIwu66BAhbI5avSF//jD31IMMeDXBhhitA9mMZwWv411Bw==
X-Received: by 2002:a17:902:ec90:b0:21c:15b3:e3a8 with SMTP id d9443c01a7336-21dd7db9401mr253959935ad.37.1738462294746;
        Sat, 01 Feb 2025 18:11:34 -0800 (PST)
Received: from [192.168.68.55] ([180.233.125.64])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21ee2bae0a5sm24864345ad.19.2025.02.01.18.11.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 Feb 2025 18:11:34 -0800 (PST)
Message-ID: <8606c5b1-075e-43c8-a58e-bfd5b90f3dcb@redhat.com>
Date: Sun, 2 Feb 2025 12:11:26 +1000
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 24/43] KVM: arm64: WARN on injected undef exceptions
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
 <20241212155610.76522-25-steven.price@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20241212155610.76522-25-steven.price@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: gPuHcQm0QX6FEZJG5UmpcaexI4UTs-JYyWnR3KR-rXY_1738462295
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/13/24 1:55 AM, Steven Price wrote:
> The RMM doesn't allow injection of a undefined exception into a realm
> guest. Add a WARN to catch if this ever happens.
> 
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
>   arch/arm64/kvm/inject_fault.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/kvm/inject_fault.c b/arch/arm64/kvm/inject_fault.c
> index 611867b81ac2..705463058ce0 100644
> --- a/arch/arm64/kvm/inject_fault.c
> +++ b/arch/arm64/kvm/inject_fault.c
> @@ -226,6 +226,8 @@ void kvm_inject_size_fault(struct kvm_vcpu *vcpu)
>    */
>   void kvm_inject_undefined(struct kvm_vcpu *vcpu)
>   {
> +	if (vcpu_is_rec(vcpu))
> +		WARN(1, "Cannot inject undefined exception into REC. Continuing with unknown behaviour");

May be more compact with:

	WARN(vcpu_is_rec(vcpu), "Unexpected undefined exception injection to REC");

>   	if (vcpu_el1_is_32bit(vcpu))
>   		inject_undef32(vcpu);
>   	else

Thanks,
Gavin

