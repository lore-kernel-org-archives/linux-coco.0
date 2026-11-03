Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.219.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793747565;
	b=jCidfSbx7mATcOt9UwLPcR7HB18sKKiCCxS3VP6pMlmOYLsYU8jLB92UD0PrvqTuZS3i
	 /yhv+EFlAWXPNx0WjHaL4j3t1JLZzElg9Hfu8xVl++y5HLx/8USSg5a5Z0LP9A7yHd8W0
	 e08EZiycThvnRgtyuEznduQR9Ha1bDWiqigWWszwDQCOZsG26sgdrx5wstMqsSeKeOzvz
	 ILFm8crOBDKTwobMamB+7nI8E/kX1aPatBTF7lnElCpo7q5rthK9bZahAy70Jnz383ywf
	 m2qSFkDgF4CcdK1Q8ZpRcW95fe13QY/shh+HntxEiCbvOZa/uuqVzREBYBm0tMK4J/w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793747565;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:In-Reply-To:References:MIME-Version:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=ryvB2JGWPuZAAGR2GMJJClI5Kf6c0Mg6JzyuuAdWS2w=;
	b=PGqlExLzByfdXiVYHKRNx/fzP973DYSfF/CAwum/2f5bANcXorjbPgW27A9ZyqeieUT3
	 6aBTL0EU2M/HM+xNTutRUzpPmDGk/OBCbkqzhTXbIHObmtYMQt0KDqJ91eTgyeUvg3L2Q
	 g9nlr/dLRvqOCIXnbgge97ZWHoQYvM/7V4GCcVn6G7REk1GEkhX3SP/WuuyeHorOwyViA
	 BT4haisY9k4ds6/0E8VGzkdpIJ2kZXTRW+zLoCf2diHwZ2En3pI4vUL7AMAqKWRU3Yj5I
	 32bxtA7LDocOIbZGjNo6FE9LRVvevMv1eaMzJYGk1S/TQ8NIKPdHcao/br8lZ7Jk1Wg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Vh6WmtpO;
	arc=fail smtp.remote-ip=209.85.219.53
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06BED606A326
	for <linux-coco@lists.linux.dev>; Tue,  3 Nov 2026 23:12:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06BED606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Vh6WmtpO
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-91bb5795792so1554796d6.2
        for <linux-coco@lists.linux.dev>; Tue, 03 Nov 2026 15:12:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793747564; cv=none;
        d=google.com; s=arc-20260327;
        b=kpzQR/Kyb4s2r7GYcToOf/6B9Nc0Hj34UuNmEpJzzCUebuZQJeV60o6PuDnJLWjpfo
         gUBDgY788pn9DhdThWAqegpOVEpv47GomPXUAzfm3IlWPEabdAVHwD8JnDn7SOgqayAY
         XnXV0hHMZJZI8ki0qqL5f/s+KXCw4Ve8X1s22zzYheh8TqfcUTnixdl4BIeT8i70zYEF
         GSZug6IANWgRp1+PALI8cpxELkGRuBaY7/2OnR4VGivHISiDiDoCuG5tsAfTESLF4iRQ
         nZAqDMKuQMdc58aqUeJwWOuYctE7aVcD3QobWM8bBJO7I54ofzl7dPqsky/KHoHmcQtN
         vF2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=ryvB2JGWPuZAAGR2GMJJClI5Kf6c0Mg6JzyuuAdWS2w=;
        fh=iVFMNCbebUd+ND2cNok057PZe1VL3GEUJv/E/r9cGR4=;
        b=QC3HeLS+W7V4uPZyvHYMClh1fwsNCVqH3KHDmxs3GSt2R+2YJNyuf+cHdmKsJKXpHR
         MvyfdKXhmWvPirO+wwp3SwI2SHXTB5Zak9i1nMHZwm69+aRotz3/egOB03vfNmQ4k+hB
         HQYsBd+ZO8JcIFhwT+/6hYWY4iNNpy6tl8trqr6LnxLGLBExTDTQQtdZah+9+nVWee7+
         FrJPQ9u2I/eL2BqUnRL0iZb4HACXb4V14Kl/CvDsKvUPCDUSAdbF/tgK+ROcG3MjVx5C
         IITJbKg0Y49s5Vxu50pmeSp7kIvx+a6VPsw31vJCH689uOK94MTyCfNaNa3hUQPmvsgq
         3+3Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793747564; x=1794352364; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ryvB2JGWPuZAAGR2GMJJClI5Kf6c0Mg6JzyuuAdWS2w=;
        b=Vh6WmtpO4DFRjhgk2OSHe9dfcoVHHEJ7JDMGmG6L3flBWzxlr2j3LzAkLlFGiUWl4T
         LKZNwvNvdkAIB1vC7EVA44H/ocUACItm9cQJIJoiPEwu/3AwZmrdHw6M8d5cbQrbaYAi
         zqI4ddKdNpEIsKjwu6IH9pB0T5EzTvVpWnrUTA5WzcDxjgmXaGg7KSgC1EyjiBdAnt9n
         1Op3RlmiXsNu04BHVvg7dSGnbBz2D3XbowBOQJV6qfmMQzBncXwnlZdRC+oLc5erVqmg
         nBgJLpuYCtIELgxRVtnMctsbelnQh7hZIMawU3AUy+3Tl3ncF9x9Xt9wumFqBzLS1rYQ
         a7YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793747564; x=1794352364;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ryvB2JGWPuZAAGR2GMJJClI5Kf6c0Mg6JzyuuAdWS2w=;
        b=ZNSFTzfUV98hytl55q/ZWXZMdF8M7r3r4y1cnxUyR/Jg3JgbQWma8oQBhYovr+jcmO
         d18aMIQqsGUn3WyERwm+sNzU7JmPVPy2RnLhiBrltJplmO4iA6Nudq8DKcFijGvsBbmM
         OIdThBGC5tG+xo9g6sUe+eJlQ3D904iiEoPXUm3FEHm3aGVPaf2lhMQdI5szM70qNdoz
         gYf3GO+jZQA+VO13bNTQ/sb3mBNTxxRnWTSOPdxoTxWoEGJw8L1oV8Vs6XTQArHyvyau
         gIdMCAD8irfQejWWHdzDpBk/u0r7XMj+D/TcPQY15/aUnVbEhE88JgGYZInJahq+0R42
         QJBg==
X-Forwarded-Encrypted: i=1; AKwUvBzm/Bc/hdGVF0EBTovCQh2uRoKoew67u56w2geB7QGd8elQcfpXK9BhHog3qeW8J1KkyZQ6cVUm5dal@lists.linux.dev
X-Gm-Message-State: APuU4Z/Tqd3qpHlImVeZ56isJKWkZc2S98annGMJjz71Hp0P8QSCADQQ
	Floi+BStXiVjOrh1AZ/xgsRE43LnxVsjHoe16oKMWX83Vs4qHr7hnoN67OZXC7arnYtJK55VeK5
	lpR8ZsUyZTc/oaorsJinC/XUmBN9Qe52vagqKZJvO
X-Gm-Gg: AYBFou1pNEd+8RXjH/D4NIQ7ia60df4XqcyXZW97NfaXrfhPc4Oh2ZMlGKfALRyWVWg
	YnEmmWlALGxZEJgcaiNZkJ6KI3MTzOVRxYqhZHXEBg97efSYylfcGXNTkRMhqgZB0d4QRJPZIqz
	joZ+1mC/pEKcj9u+7c4RZlEPcDmoMbU/eUrNNtDEYGAvEKBEWErnczLTNXSInzpW9ti1tlnVQLZ
	ksPlANIQD6HVKt4cVYdrp4PkWS/ePaCZZXot/e5uWB0BjGrVinQL53/D0tRBsYz/FoLRYrCCFIo
	1rCqQyk3BYM0kaGghhter/EKfWPPXy3uhvVGnlgFdot1IAv6aj5Ec0LFtV0LYrNrygApvbgs0ur
	KIKPgpkcWpFdJEj1EnU2EVMit10c5DXmRyxc4ZigpvAthUzLcCBonz3P9vW5lbbEgGlK7+g2fyZ
	lqipn5lIgSacdmaK/YzpoB1W0=
X-Received: by 2002:a05:6214:570d:b0:91b:832d:ce5a with SMTP id
 6a1803df08f44-91ca4b833acmr247908926d6.48.1793747563253; Tue, 03 Nov 2026
 15:12:43 -0800 (PST)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 3 Nov 2026 15:12:42 -0800
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20261101071928.2462549-7-aneesh.kumar@kernel.org>
References: <20261101071928.2462549-1-aneesh.kumar@kernel.org> <20261101071928.2462549-7-aneesh.kumar@kernel.org>
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Post: <mailto:linux-coco@lists.linux.dev>
List-Help: <mailto:linux-coco+help@lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-coco+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Date: Tue, 3 Nov 2026 15:12:42 -0800
X-Gm-Features: AclHuK-a6U90XRQ86I28YCLgetKuFVa0CnGLyQ5k0MglUtI4Y2OMEO9n6VKxkJo
Message-ID: <CAEvNRgEL5SuPBwGqwrUzD3Gb1iUonhvM488-3khHpQk8OkWr+A@mail.gmail.com>
Subject: Re: [RFC PATCH v3 06/13] KVM: guest_memfd: Support device-backed PFN providers
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>, linux-coco@lists.linux.dev
Cc: Alex Williamson <alex@shazbot.org>, David Woodhouse <dwmw2@infradead.org>, 
	David Hildenbrand <david@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>, "Joerg Roedel (AMD)" <joro@8bytes.org>, 
	Kevin Tian <kevin.tian@intel.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Robin Murphy <robin.murphy@arm.com>, Sean Christopherson <seanjc@google.com>, Will Deacon <will@kernel.org>, 
	Alexey Kardashevskiy <aik@amd.com>, Xu Yilun <yilun.xu@linux.intel.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Steven Price <steven.price@arm.com>, Fred Griffoul <griffoul@gmail.com>, iommu@lists.linux.dev, 
	kvm@vger.kernel.org, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

"Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org> writes:

> Device resources such as PCI BARs supply PFNs directly and cannot use
> the folio allocation path. Store the mapping owner and device ID in the
> core context during attach(), and use them when preparing device
> memslots. Keep device memory separate from ordinary PFN-backed RAM.
>

I'm really hoping that device providers are just another kind of PFN
providers and not special in some way.

Please give me some time to prototype so I can see what can't be
achieved.

> Require device providers to use PFN_MODE and INIT_SHARED with
> architecture support for protected device mappings. Device providers
> require get_pfn(), but not the lookup_pfn_range() callback.
>
> Mark device memslots as guest_memfd-only and pass their device binding
> to the architecture. Resolve guest PFN lookup through get_pfn() for
> either shared or private attributes; the architecture decides how to
> establish mappings. Include both mapping types in generic invalidation,
> using the memslot binding to select the architecture unmap path. Host
> userspace access still requires shared attributes.
>
> Skip RAM population and PFN reclamation for device MMIO, which has no
> RAM pages to initialize or reclaim.
>
> Keep mmap, fallocate and attribute changes on device-backed guest_memfd
> files disabled until device mapping and conversion support is added.
>
>
> [...snip...]
>
