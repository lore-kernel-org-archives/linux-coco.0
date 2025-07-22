Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A028F2E406
	for <linux-coco@lists.linux.dev>; Tue, 22 Jul 2025 15:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753197726; cv=none; b=mKvJCa8KQENRVqoXfDBczD6BXAByAf3H+MK7ekFfZIWx0kjU/fdDd1PfAWoN80LSOCELq+uA/3PETXVoI2GGQNkeLFvw+RqO3WYQTydKaAZv0yAKs3TpzdyD7ALgV30ACUabIixm59vwnFR/8bAv6Ryv66c4B8pa4uY+G/kM/Lc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753197726; c=relaxed/simple;
	bh=Bz0qVqHYmaFGLr0K3Aste3DeRRvF4uZB3IkjMQ1SJXE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WSpglSUPRJlW6FBLjslurKl0Jdv9yUm+0CPDfNIJOp1LYoGXKMjqXAMlwWhOx7kBljKTFCQ5CgFiJcLkWlYE7c1rHTZN9YG1GndVcsgHXaKNOVfRRUjEafEAdqVLNWe1fTe1NIar0z7c/RmdxXvDKeYe8Geeadl0k6Ygjq6UoT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ejy+f3cs; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ejy+f3cs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1753197722;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=3lGVCvSvU+dwTTyQ/1aMBu54ELfXmjnvHtRzgY3JvgA=;
	b=ejy+f3csqtu+uZ/r5jNAJCd2kkybjaoE12doyjvvlcHAW1KDpGfnVmdzOJvOW0IkGqMGP9
	VxdGMS+A2jQ0fbw6MyzXD574B+ULVVPJ/gZRSf2o5J7MSnysCxn9MgtgK4Br5RpvSog7hU
	gXIvakECo9JVQztWxoGUVr0TgjGc/CI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-154-fzEz20OTM_6usIjevWIYzw-1; Tue, 22 Jul 2025 11:21:59 -0400
X-MC-Unique: fzEz20OTM_6usIjevWIYzw-1
X-Mimecast-MFC-AGG-ID: fzEz20OTM_6usIjevWIYzw_1753197717
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-451d7de4ae3so32011095e9.2
        for <linux-coco@lists.linux.dev>; Tue, 22 Jul 2025 08:21:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753197717; x=1753802517;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3lGVCvSvU+dwTTyQ/1aMBu54ELfXmjnvHtRzgY3JvgA=;
        b=L/N21BdMaazbJJ6sktN6HpfMGtS+6BsHOBcYZ3Bw56hk0qXpk+S0pC9yUM9gOz0EVx
         AUCb3nsY6EMFPFZC3M5AQ2wyV7p8vDRr3pk/nb1RVQDNSmKD6yts05SOOOSaDkP322GP
         KKi6qHlFrFpkFevlYb//nSVMw1VTYuBjXcfcGdEhXINIoGCB3aO/EVwnuimXGsqX3WrV
         a9CRgF1Q6QiiuXXbNrYxuKokOVwFL/YT6mN8N+xkJ7hqdIhT5C1sV3AcodeNR7tO7A2S
         WoO0YejxXKASG/FyP+5AQyFyp5XbgVVZv0SNjBEjWzK/LBKXYIdE5p/s2H3h9GjVdWIk
         4x6A==
X-Forwarded-Encrypted: i=1; AJvYcCUKoxj9GY9DSV0zNseuigl0Cip36dlLRTY6elQeCChCqLaE8zcqwV4SpbfydQox8sp3FyALBybUDDhk@lists.linux.dev
X-Gm-Message-State: AOJu0YzRkOGZ0SEJmGh4A6EbteuQfYL2+sjnxPMxbbiIgc2js/IlohNO
	jOc9cAj2WCS1VycGyqIG8+w9nqupNGRvACTYH2/hmSm4thEJnkND/BGJdQONxoJuLp3lVmK/Xdq
	ARRBrwrfXDp/H5SRp8A62/GjtmBHSFzSkfv9ziqTxQgvF6YO4fA17+sYXnGn0T8I=
X-Gm-Gg: ASbGnctUUCwVkY9ybxdlQWp6bLGfDlwDCPYiLSpu452U0vIDbZK+16Xd/KK+vnCbkaM
	N1X3FnFtLNk5viSLXrtCpajzXRiVJth1qHSkIGqQF028ImfdZu+40X/UnHZHULON1L5kQwYoXnL
	ffvlqX6AEIU+g91p5nWGORBEkPdPnd4oivuzduOcuKiINdvMMo0FaQvLLkUcL+P1Xt3O/s+1QQm
	OlQsqtR+H8A6j09euR3Yz9iQwTHwG/4HbHf2eqKT+bDMvgI3rF9DTyj/ouSG+RIwt5NzyL2Z56E
	j57/REdfeeyby6dZM8p78QNpPyMz5t+O8pajqV0W/ijqeCZLghRwZSISms3WYTb+TIPSP9No9Yc
	eh/YbU1D9OB0FxE3t0ovmMKa0ru3En0DeMewkn3NzD6ftAJpx+c+S+d2eachbLj+OfMk=
X-Received: by 2002:a05:600c:1389:b0:456:26a1:a0c1 with SMTP id 5b1f17b1804b1-456437a59efmr137996465e9.17.1753197716899;
        Tue, 22 Jul 2025 08:21:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF5enLdCYgzjySAx4ybbYU0jMVafZgCttcr6BLFjBoC3XlTsR3XaXP1SUNWMbt7hDHDm6g3EA==
X-Received: by 2002:a05:600c:1389:b0:456:26a1:a0c1 with SMTP id 5b1f17b1804b1-456437a59efmr137995965e9.17.1753197716277;
        Tue, 22 Jul 2025 08:21:56 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f28:de00:1efe:3ea4:63ba:1713? (p200300d82f28de001efe3ea463ba1713.dip0.t-ipconnect.de. [2003:d8:2f28:de00:1efe:3ea4:63ba:1713])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4562e802ae4sm192273375e9.13.2025.07.22.08.21.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Jul 2025 08:21:55 -0700 (PDT)
Message-ID: <33da1127-f00e-446f-891f-01ccbd53efd6@redhat.com>
Date: Tue, 22 Jul 2025 17:21:52 +0200
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V9 3/7] mm/filemap: Extend __filemap_get_folio() to
 support NUMA memory policies
To: Shivank Garg <shivankg@amd.com>, seanjc@google.com, vbabka@suse.cz,
 willy@infradead.org, akpm@linux-foundation.org, shuah@kernel.org,
 pbonzini@redhat.com, brauner@kernel.org, viro@zeniv.linux.org.uk
Cc: ackerleytng@google.com, paul@paul-moore.com, jmorris@namei.org,
 serge@hallyn.com, pvorel@suse.cz, bfoster@redhat.com, tabba@google.com,
 vannapurve@google.com, chao.gao@intel.com, bharata@amd.com, nikunj@amd.com,
 michael.day@amd.com, shdhiman@amd.com, yan.y.zhao@intel.com,
 Neeraj.Upadhyay@amd.com, thomas.lendacky@amd.com, michael.roth@amd.com,
 aik@amd.com, jgg@nvidia.com, kalyazin@amazon.com, peterx@redhat.com,
 jack@suse.cz, rppt@kernel.org, hch@infradead.org, cgzones@googlemail.com,
 ira.weiny@intel.com, rientjes@google.com, roypat@amazon.co.uk,
 ziy@nvidia.com, matthew.brost@intel.com, joshua.hahnjy@gmail.com,
 rakie.kim@sk.com, byungchul@sk.com, gourry@gourry.net,
 kent.overstreet@linux.dev, ying.huang@linux.alibaba.com, apopple@nvidia.com,
 chao.p.peng@intel.com, amit@infradead.org, ddutile@redhat.com,
 dan.j.williams@intel.com, ashish.kalra@amd.com, gshan@redhat.com,
 jgowans@amazon.com, pankaj.gupta@amd.com, papaluri@amd.com,
 yuzhao@google.com, suzuki.poulose@arm.com, quic_eberman@quicinc.com,
 aneeshkumar.kizhakeveetil@arm.com, linux-fsdevel@vger.kernel.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-security-module@vger.kernel.org, kvm@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-coco@lists.linux.dev
References: <20250713174339.13981-2-shivankg@amd.com>
 <20250713174339.13981-6-shivankg@amd.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 g3eXuA==
Organization: Red Hat
In-Reply-To: <20250713174339.13981-6-shivankg@amd.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: tY6gqBWuGoKKADy064nRpRTgLI1him0UopizfQ_Deg4_1753197717
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13.07.25 19:43, Shivank Garg wrote:
> From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
> 
> Extend __filemap_get_folio() to support NUMA memory policies by
> renaming the implementation to __filemap_get_folio_mpol() and adding
> a mempolicy parameter. The original function becomes a static inline
> wrapper that passes NULL for the mempolicy.
> 
> This infrastructure will enable future support for NUMA-aware page cache
> allocations in guest_memfd memory backend KVM guests.
> 
> Reviewed-by: Pankaj Gupta <pankaj.gupta@amd.com>
> Reviewed-by: Vlastimil Babka <vbabka@suse.cz>
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> Signed-off-by: Shivank Garg <shivankg@amd.com>
> ---

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb

