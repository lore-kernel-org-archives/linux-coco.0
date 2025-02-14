Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61DCE1FDE03
	for <linux-coco@lists.linux.dev>; Fri, 14 Feb 2025 23:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739576327; cv=none; b=b2QBEkbMk+NeiBvh3OAxh59H01SlnqRSvruCg0uWyjHKSsqYMl2ycFPa2yQsdazupz7bgUyr/JA5GGMp65tQJIPy99n4K6hu4ysSFThmMW3M4h2tTl6Du1qElV5eFyTLZLmdwEZpLgm2OL5g+bbVL7yDzs6JWPsVVReftMUntJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739576327; c=relaxed/simple;
	bh=3FgOVFO8GNqDS2zLxm0cMMBnAmqo1GiengKzpNDRW/g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l4+8UlyBGPPXQP14S37PvLMsnKKScIOyATP6SGwR0ONGf/g6FWJEdsoE48ZxMy/ck2G8wvQP5qlAEDdyJG8m29TIYsow/OaLI/1Y+0lClIHRKNqhwaKXYADWUWTeWNPGjF+qvimojdW6i/2QNpwxQNsX4bw58vX2qJ/0UQXNC9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=djL3CMHi; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="djL3CMHi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739576323;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=dkl08VAARbn7X2yB9Abn8zNYw7VapeXfiEWGo0rvbzs=;
	b=djL3CMHit+bg3N+hWicN9LYIyCccqQ+L5+Mj8u9D3HsTNc+/W1O6Vt5GOlFEl8OAcC8SQQ
	RA4XrvGiGCP2JpqDOLyVBQGEgUhJhwpdyaH1iJ6P+hmZ/ljUWwVrJ7h19XkZddE3HVTzm2
	COSNjMbbeYXSF4ZbR4LzdL8koAmdlRw=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-386-DrjGyoG1O8e_L6zl3u_FMg-1; Fri, 14 Feb 2025 18:38:41 -0500
X-MC-Unique: DrjGyoG1O8e_L6zl3u_FMg-1
X-Mimecast-MFC-AGG-ID: DrjGyoG1O8e_L6zl3u_FMg_1739576319
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-38f2c0aa6d6so779660f8f.0
        for <linux-coco@lists.linux.dev>; Fri, 14 Feb 2025 15:38:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739576319; x=1740181119;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dkl08VAARbn7X2yB9Abn8zNYw7VapeXfiEWGo0rvbzs=;
        b=FodGOcYUzG9bNmbUsWbgSgEKtpsNZgCefD5CKY4moaWp19H1CjNK4vKtmX+TaHK98R
         f6O+9Ekd2iEfCjOhj3m4zN46PlmyxM9GcO8Jgv4r7ATjvz8rp+6s+SZNa5nl0yKN7pef
         u5xmP9Ij+snBaogFUfY23VkJHBcRrNySSZpAUBer1Xf/CtngIZr0PcYtRR7zZqWfF/88
         XKwzc4gwz4IreOIqqiAYecTKmqLm/tGaEMGXc4Q4ySU2NkSkxR7t5Q4X39fUPrpmoVdd
         CYwZ9fz0hjwd2LrQ6nL50HXJywLkJiqhTY42/6J8VdfrIUuePMHIRvH+ajYxLeyr78TC
         SSxw==
X-Forwarded-Encrypted: i=1; AJvYcCXm4Bdqw2b9wDGPV+rhnkV1XCO8HxKo+uyuFD9RRCMNlWhiWQ0t4VCN9Iovmu3YojeE0CY3tj3z5/T3@lists.linux.dev
X-Gm-Message-State: AOJu0YxiupNTBWlMFJRhk5d6HRmrPCqKVbl1gzwECIOA0+bsKLFQy/X5
	EABwvtG/5qRCSyIETfq+y08RiqfQJW4Kh3tbdXBiK/5zNRrx6OTRR3GNHV6EX88TnfNSP2oYWmY
	aFPaB8DUTK+QFYpwakGijYCnjPpinp8yg96l9uZHlFQ3oUGWt+jz0/pEpryk=
X-Gm-Gg: ASbGncsc6LgscskwkbQm87kN9bF60Lt6t/4gTt6dUf5SXM6UGHbxYjDbrRBfs8yAHTh
	eW+EufXmrf6ig0p/dpujOD7LAgRoiWRN1p+M57067/4uX/Bge2gtYRU+FooJzHeOcF006lqyfTG
	DyhYMKWAPZ8rDJpb4SeRupiQ3gy6ElZOzMDdKUzZdEy+u4V8CFH2PCrUdY6T2SPxELvHM0zB1nU
	8/+4rfmMZq9f3nrI/nQS1EiXk1MWXMITmDp4D5qYliBA2kgwgV+dR5VoswNsm6VcsKnKRwAtqa2
	FplQ1BKoqWM=
X-Received: by 2002:a05:6000:1f8d:b0:38d:b028:d906 with SMTP id ffacd0b85a97d-38f33c20f7cmr1320378f8f.21.1739576319203;
        Fri, 14 Feb 2025 15:38:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGuwJR95sgolXJa3JZbal6oWOnodlKaw9NVdzdZq6kdIBfuHesYm3UO/VFsI1pO4iTzeaJo2w==
X-Received: by 2002:a05:6000:1f8d:b0:38d:b028:d906 with SMTP id ffacd0b85a97d-38f33c20f7cmr1320351f8f.21.1739576318838;
        Fri, 14 Feb 2025 15:38:38 -0800 (PST)
Received: from [192.168.10.48] ([176.206.122.109])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38f259f7987sm5694927f8f.87.2025.02.14.15.38.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Feb 2025 15:38:38 -0800 (PST)
Message-ID: <dbb0ceba-4748-47ca-9aae-affd189e2f92@redhat.com>
Date: Sat, 15 Feb 2025 00:38:36 +0100
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/3] Fix broken SNP support with KVM module built-in
To: Sean Christopherson <seanjc@google.com>,
 Ashish Kalra <Ashish.Kalra@amd.com>
Cc: tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
 thomas.lendacky@amd.com, john.allen@amd.com, herbert@gondor.apana.org.au,
 davem@davemloft.net, joro@8bytes.org, suravee.suthikulpanit@amd.com,
 will@kernel.org, robin.murphy@arm.com, michael.roth@amd.com,
 dionnaglaze@google.com, nikunj@amd.com, ardb@kernel.org,
 kevinloughlin@google.com, Neeraj.Upadhyay@amd.com, vasant.hegde@amd.com,
 Stable@vger.kernel.org, kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org, linux-coco@lists.linux.dev,
 iommu@lists.linux.dev
References: <cover.1739226950.git.ashish.kalra@amd.com>
 <Z6vByjY9t8X901hQ@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Autocrypt: addr=pbonzini@redhat.com; keydata=
 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
In-Reply-To: <Z6vByjY9t8X901hQ@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: L-Z79gr6H1TtIQOspNTqZOSUq8xf4JziwFbwx8Ghc0Y_1739576319
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/11/25 22:31, Sean Christopherson wrote:
> On Mon, Feb 10, 2025, Ashish Kalra wrote:
>> Ashish Kalra (1):
>>    x86/sev: Fix broken SNP support with KVM module built-in
>>
>> Sean Christopherson (2):
>>    crypto: ccp: Add external API interface for PSP module initialization
>>    KVM: SVM: Ensure PSP module is initialized if KVM module is built-in
> 
> Unless I've overlooked a dependency, patch 3 (IOMMU vs. RMP) is entirely
> independent of patches 1 and 2 (PSP vs. KVM).  If no one objects, I'll take the
> first two patches through the kvm-x86 tree, and let the tip/iommu maintainers
> sort out the last patch.
I'll queue them myself (yes I still exist...) since I have a largish PR 
from Marc anyway.

Paolo

