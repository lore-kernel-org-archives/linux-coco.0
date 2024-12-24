Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E011E1392
	for <linux-coco@lists.linux.dev>; Tue, 24 Dec 2024 11:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735039661; cv=none; b=G2+l4Jb0l75t3GcdnyxGCxBOaiDMHWXIj1hTLl0/jAkjggl7CHG/yC/Zq7sv0qNTtWG4yl52zHYBec+vX8Cg3VRRSoSX/suZTtHHdtER+Ny/g7wV3AeKzf7fOcM6h/i69Ti1V0mW1yhidR9OkJTCEXYRKIP9+rG5XDnjrpb1mgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735039661; c=relaxed/simple;
	bh=UN4/jIruCRlS7xOU6AqGYHUFKE0unPvvcrhmvaDmovc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GrHYIGwWV9FZ0Gys8KhPRHa206Vjz1F6b3aGX8rPVvqppSDWEK09ATaoF7ecNgBfAyJRB4oN1Fm30sr81hSG4AAUwQpmu1EnSchDnQx2R4nksH+h3nNpuv+tHKNLkiIJpuk66wia9R2ps2uAcsk8Y5qUFsayfrqrTj06Vng9u0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=aFfSOn0m; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aFfSOn0m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1735039658;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=6FMB8h6XQ7wLfkg2ADGWAcnweaxoT94bFHCCnfiyr5M=;
	b=aFfSOn0mzqaaEGMi0rAhN7r6YdTA0g+kWZzPZAJnviW9Q6ArJz7FEO0lOEX6Pyax2X+aMt
	d2kbtfFPFlmHQmGJjyQvD/IpAOW+HSX6Zc+Vt91X9igAPH0xR3LFTvPJU7uw52UN32iQZg
	M2nwjFpujDN6Esb1plZgETvWjPifzJs=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-357-KxtzLTxtOCCSzGcJzsMLmQ-1; Tue, 24 Dec 2024 06:27:37 -0500
X-MC-Unique: KxtzLTxtOCCSzGcJzsMLmQ-1
X-Mimecast-MFC-AGG-ID: KxtzLTxtOCCSzGcJzsMLmQ
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-43582d49dacso37477215e9.2
        for <linux-coco@lists.linux.dev>; Tue, 24 Dec 2024 03:27:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735039656; x=1735644456;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6FMB8h6XQ7wLfkg2ADGWAcnweaxoT94bFHCCnfiyr5M=;
        b=I5inb6gLE6zEGDMZfV7oQPwJmkixfqHNc74HbHWjC5dORWUSy/MaB+4cmfxRjQT9mL
         87TBorKk/n4BLFm4jW+BfOwBy1XSIq/dd/gXFngVWvU/WRBoeQ1/LFx6IJmPQJkVrAbl
         iNXs1qGTdDSjlg1zEVwu8TIKXru+HydrMVtnI4G9a5FpNTN4JsEl5iORL3eHUw/Avszj
         /Z33JMPbBOlT5HkqULAShnEOQk6hL1TqF6P6vdynGDoKeRn6H17R2GqSuqB7y21JoT9u
         VqbjJqZRTuwO2EN8lUGN907x/yF/Wy0vjQnT3tLbiXlIgPqxSdh+uI7v1ztGmH7h3urR
         E3TQ==
X-Gm-Message-State: AOJu0YwECBS8+XNKQ6ndOXSGF6iNMWK9Hl8Dpnohuudr69hhsGODNLNp
	LtqJfIEu6RTnITV3WKFYVDodNHr8kJ8JhQ8WXu4VclSRF9xo5HYgLpU6Bf77eNgNLeKEWeyyU88
	XNSw6Bf2OH0bAGO0/sI/VhoUI+xZvE2YlNVLw/4t+KdLzBpoXYZ3kV6WJ+5U=
X-Gm-Gg: ASbGncvRe5gqgXMRGkGbyQMCtrt0ugvJDbVBqs5tXVLrmyppnwyIGkmwmlhLliu8O8W
	cqY95NVtEvVLvM8SIWU+fFs+P/tLRR3ooCWl5jcSSjht2aI/Wom1lT6BLyYmn6i4AK7IQsLoBBu
	WDr4k8rrTLTD9FfpTVJ+zBA7suUO1vCMqHA/oVKJrha9wlzPtyH35JZeztl1Sd9wK7229ILIgCx
	Ecw/EKGLaDpb32/7oTKy8lm1G6q+16XK24bOGiNcMokBha+O8nvshUP7DMm+kCmFtYwa3E1Dj4a
	/BFaeezJ1MGOLGZbgiQTS9VpbRYzlwx+fQx4hZdNYS2mjeyD+KJc0zMjN6eSGrBQ4bLr5SHUu8w
	T27yaTHPJ
X-Received: by 2002:a5d:59ab:0:b0:385:fd31:ca31 with SMTP id ffacd0b85a97d-38a223fd39fmr18037790f8f.53.1735039656351;
        Tue, 24 Dec 2024 03:27:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGTsBBAOHLHVRvbW+Q7P3Y2vp14B374OUvcCGZ+g9p7tmbmw7Y0qOWnpTeii8Y42OoLbPwYNg==
X-Received: by 2002:a5d:59ab:0:b0:385:fd31:ca31 with SMTP id ffacd0b85a97d-38a223fd39fmr18037765f8f.53.1735039655950;
        Tue, 24 Dec 2024 03:27:35 -0800 (PST)
Received: from ?IPV6:2003:cb:c72a:da00:e63f:f575:6b1a:df4e? (p200300cbc72ada00e63ff5756b1adf4e.dip0.t-ipconnect.de. [2003:cb:c72a:da00:e63f:f575:6b1a:df4e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4366127c488sm163896265e9.27.2024.12.24.03.27.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Dec 2024 03:27:35 -0800 (PST)
Message-ID: <82c53460-a550-4236-a65a-78f292814edb@redhat.com>
Date: Tue, 24 Dec 2024 12:27:33 +0100
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Invitation] bi-weekly guest_memfd upstream call on 2024-11-14
To: Alexey Kardashevskiy <aik@amd.com>, Chao Gao <chao.gao@intel.com>
Cc: linux-coco@lists.linux.dev, "linux-mm@kvack.org" <linux-mm@kvack.org>,
 KVM <kvm@vger.kernel.org>, Fuad Tabba <tabba@google.com>
References: <6f2bfac2-d9e7-4e4a-9298-7accded16b4f@redhat.com>
 <ZzRBzGJJJoezCge8@intel.com>
 <08602ef7-6d28-471d-89c0-be3d29eb92a9@redhat.com>
 <ZzVgFGBEUO7sU3E4@intel.com> <d6b74ccd-47d3-4fd6-96e7-3027dd13faa0@amd.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <d6b74ccd-47d3-4fd6-96e7-3027dd13faa0@amd.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: bCOO7NLSgqILtaR0LBEfFejnAu2NTQUaNzfADpvxOYU_1735039656
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24.12.24 05:21, Alexey Kardashevskiy wrote:
> On 14/11/24 13:27, Chao Gao wrote:
>>>> With in-place conversion, QEMU can map shared memory and supply the virtual
>>>> address to VFIO to set up DMA mappings. From this perspective, in-place
>>>> conversion doesn't change or require any changes to the way QEMU interacts
>>>> with VFIO. So, the key for device assignment remains updating DMA mappings
>>>> accordingly during shared/private conversions. It seems that whether in-place
>>>> conversion is in use (i.e., whether shared memory is managed by guest_memfd or
>>>> not) doesn't require big changes to that proposal. Not sure if anyone thinks
>>>> otherwise. We want to align with you on the direction for device assignment
>>>> support for guest_memfd.
>>>> (I set aside the idea of letting KVM manage the IOMMU page table in the above
>>>>     analysis because we probably won't get that support in the near future)
>>>
>>> Right. So devices would also only be to access "shared" memory.
>>
>> Yes, this is the situation without TDX-Connect support. Even when TDX-Connect
>> comes into play, devices will initially be attached in shared mode and later
>> converted to private mode. From this perspective, TDX-Connect will be built on
>> this shared device assignment proposal.
>>
>>>
>>>>
>>>> Could you please add this topic to the agenda?
>>>
>>> Will do. But I'm afraid the agenda for tomorrow is pretty packed, so we might
>>> not get to talk about it in more detail before the meeting in 2 weeks.
>>
>> Understood. is there any QEMU patch available for in-place conversion? we would
>> like to play with it and also do some experiments w/ assigned devices. This
>> might help us identify more potential issues for discussion.
> 
> 
> Have you found out if there are patches, somewhere? I am interested too.

I remember that so far only Kernel patches are available [1], I assume 
because Google focuses on other user space than QEMU. So I suspect the 
QEMU integration is still TBD.


[1] https://lkml.kernel.org/r/20241213164811.2006197-1-tabba@google.com

-- 
Cheers,

David / dhildenb

