Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59F2E31ED80
	for <linux-coco@lists.linux.dev>; Fri, 22 May 2026 23:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779490959; cv=pass; b=qMsn1/7XCoxhDu0L6JFKWKJBPaFAloNTsgNYpLOPKgXqCJsj68PgOn4gpyKqsfqN5DxN7UW+MVyi/nxu4NEKd+PFO4mfvrf/hDNOU4vyuQX4+E4sNNZsMTYMloqQx43MVVh9uxOPpISx5bJcIq/uTjSx6xlD3ym6RCHV8ByHL+A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779490959; c=relaxed/simple;
	bh=ibZMSZEwhsHjGnLBrHCL/QtGJncXCz0nJYgEJjvO8KA=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o/lpp1mwRuh8VIlsagYI64QC7Nu37gzWTqgKEcYlJ+lEZ3qQdPGegID3yTO7mIJvCPwt3iH9w0CubxrpuR99b1eYpwlCJ0nB6poc/o55xPElmMdi/jDB5rOtqHR7CKoefklwqDxmuoitRtCNznmakNIi6yo+TtcJcglx2+MR6OY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aiwANXjK; arc=pass smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aiwANXjK"
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-575171b1ce7so2575637e0c.1
        for <linux-coco@lists.linux.dev>; Fri, 22 May 2026 16:02:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779490957; cv=none;
        d=google.com; s=arc-20240605;
        b=C4rHsiciYz6uowVIs/0zAd5oyMAoN1dFzOIongOZMGdXAZboiBb+D1QDFT43HsB98p
         /Lc2nU9Vux/RMtcjYqYp4ayHOtISTX9Wt0aPwi6AHi17ZRyJ9y23h9bfOxtHHhqhQWXZ
         f7JzOskvWPXU7zuGZOZoOolqOY8GoJhx/YgItH0uVyvB004xuzU9tjjW+w3gpefae5qg
         vfrF2uVaTDTVv16RUpmXjBTFip2RwCBK/YRRO2jFOCKB9y1775fgNn4rgVt+8ZBVwwhG
         LFQqnQDD6XN92zdA0WLom2ehJMNBjx7H5vPAF+MYkljyIsmPphY0zvvOvmBgTVZr/v1b
         RiAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=+lqWW5xTN76UwAfrRbxGlO2NBxcf8RIbZZTDif3+3JY=;
        fh=ylgXCtMaoZzmd2aOcSCjgVL9VMv9vF9Pd0PzBSEM34I=;
        b=lTyCdVNAJH943lksX5yAlwkugrJGrPY+1ld+V1uUhIxV+9Q7pwS16Y/jgNPLTj0xyi
         nk8kEv3OMwL9t5Vm2Nutww68sdpoIn03oJ2t8gkJx0mW9J6tNtNeoJK9vOPViXwdMsiJ
         7niGbBvDRUL4U4iFlw7GxZPZcgcUOh1IgO/xDpKs0u5TWD9MQfZTGQy+ab9O9zTCZSBg
         bY4tUv5wSbiJG6DF3BwuB193xmucikn9I9z2sdkzD1jAYWbcHQEZeAtWAQuBEB7jVBqi
         N6e2l4s4vqfJDNhjwy+t+IeSEhKCsSs+/oxvdAHbtHb71oXVLntQZsxfVAIxaZIwgJoz
         /nhA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779490957; x=1780095757; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=+lqWW5xTN76UwAfrRbxGlO2NBxcf8RIbZZTDif3+3JY=;
        b=aiwANXjK8c+bpxEGHlkq0P4CdJcRw7AE+jiF+ag+EDffNr7USPlRu8TjXu0OKOrMKO
         pOQNYukqFwGhtrxBv/JFMRGnaNfz2iU/CpR9aFTJmXzzznXFnRqev3xMOIhsdqvfrMHa
         aV9g64XvEt81nNE1rWHMgxWx17dOh++v7rMVsd9dpwdwNvt/RhVrmyXifIl4ggQunOKe
         h08wQUoUlFt7nJ6bJyg0fwRLfjBgQm1tPDtz0o9FAzpAS+G9PsHpFxm31U1e/WDBDlU1
         balV9JuE8EQr4ixp7kez/f9RNK3F/zYCV2LYeC5P8FzAUXADol6BGNNABPZahigstB/L
         2Thg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779490957; x=1780095757;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+lqWW5xTN76UwAfrRbxGlO2NBxcf8RIbZZTDif3+3JY=;
        b=Dqozy2MGYcLNnaIRkRoy2OdiP9RwuysV1VpBoLI06YZD0/JVz6280k2OmVOtATjmfA
         wjE511WyP5DW9XF0pDR9vb54sQVw5WF3PryT/vi4UPPKNHjvhDzqjLeKFKH1Xkc+cjEd
         JX8fCCDJC56wSE97nmyUqQfUg7ZwVL93Ec8fO7/1vsUTV7ZuEVytjU5+8Wip6tj/l8Eq
         F7s2FM1ArJseg7a++mM0lZzVpJnmSKbLrdvT0IBrzl0UrCxaCisIkPFNryk8iujbTcdd
         zyFGBpGv7/nJOWM+9xH4JVRKUHloALWCzxTJsm7AF0HA2s1J8+aHbpRyl6ZdnLVNLh2l
         qCNQ==
X-Forwarded-Encrypted: i=1; AFNElJ8Z4MW0wGXDAodXi2VNsAGCBIMPD0yZbbfa9J0UlBBs+2bo1SAD+kxv3f8445TaTZyEyRBGCwUuFocQ@lists.linux.dev
X-Gm-Message-State: AOJu0YxUyWWaHIbOTz3E44fWI2+zTWvslRltGe0LDDzCsgHehyFZtxQP
	tNud+vTzUtZ3rt0IEHUmR+6vhsOdu0eScgGs2eCDlEFHuzBWDRTsuurx4IfyYAnaTsFLmV7yk4S
	OUqn/MYj2PhvE3I277eLC+FM5PPA33hx6LAfqdT6P
X-Gm-Gg: Acq92OFPYO9jhmY1teVH+BF486ZUerB6HMSJwuY+4KWFQVvwcA95CWcHrDGEaGtrHL3
	MOPquHh9ngnpQAIoETg/qaFruYG6N0TD1nHJ8DuO0sIF9Pl82A+MnmiNTE6/VNekyR4MrdZzJea
	2jH0RGOvtg3j6GfioqETj3Q+BQSqUT/+2NYOgzvBLCuZXjMkp3+B2cNdL9/sMidEnsdJ835XMb7
	FipSfhxpxAF1r/CSNXy2UBX8cXCzmHBYCT+xMI4WmGoMU85lJXkEF+SIH5mtFEB7UgO/9c6NTmH
	mnSoq/RGLOqoYv0FCuroxIk5+L4zOoalC4QJdP0mdAgXLsrmILSwpB/ddjzBMpFWqOJnsTwwvev
	E8x/4
X-Received: by 2002:a05:6122:1796:b0:56c:db8b:504e with SMTP id
 71dfb90a1353d-58663966692mr3461861e0c.13.1779490953839; Fri, 22 May 2026
 16:02:33 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 22 May 2026 16:02:33 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 22 May 2026 16:02:33 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20260507-gmem-inplace-conversion-v6-25-91ab5a8b19a4@google.com>
References: <20260507-gmem-inplace-conversion-v6-0-91ab5a8b19a4@google.com> <20260507-gmem-inplace-conversion-v6-25-91ab5a8b19a4@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Fri, 22 May 2026 16:02:33 -0700
X-Gm-Features: AVHnY4KLpjLWXQlawB-gZxOwicuZUmspmndJ5b1mQf8zRUUhG2Ao-NrVmxpOgcg
Message-ID: <CAEvNRgEHf67kpLtNyET7cvE5hWfXHqNrwv9cP9bRUgk_NKb+0A@mail.gmail.com>
Subject: Re: [PATCH v6 25/43] KVM: selftests: Add support for mmap() on
 guest_memfd in core library
To: Ackerley Tng via B4 Relay <devnull+ackerleytng.google.com@kernel.org>, aik@amd.com, 
	andrew.jones@linux.dev, binbin.wu@linux.intel.com, brauner@kernel.org, 
	chao.p.peng@linux.intel.com, david@kernel.org, ira.weiny@intel.com, 
	jmattson@google.com, jthoughton@google.com, michael.roth@amd.com, 
	oupton@kernel.org, pankaj.gupta@amd.com, qperret@google.com, 
	rick.p.edgecombe@intel.com, rientjes@google.com, shivankg@amd.com, 
	steven.price@arm.com, tabba@google.com, willy@infradead.org, 
	wyihan@google.com, yan.y.zhao@intel.com, forkloop@google.com, 
	pratyush@kernel.org, suzuki.poulose@arm.com, aneesh.kumar@kernel.org, 
	liam@infradead.org, Paolo Bonzini <pbonzini@redhat.com>, 
	Sean Christopherson <seanjc@google.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Shuah Khan <shuah@kernel.org>, Vishal Annapurve <vannapurve@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>, 
	Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Nhat Pham <nphamcs@gmail.com>, Baoquan He <bhe@redhat.com>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Youngjun Park <youngjun.park@lge.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Kiryl Shutsemau <kas@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>, Vlastimil Babka <vbabka@kernel.org>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Ackerley Tng via B4 Relay <devnull+ackerleytng.google.com@kernel.org>
writes:

>
> [...snip...]
>
> @@ -1078,13 +1077,17 @@ void vm_mem_add(struct kvm_vm *vm, enum vm_mem_backing_src_type src_type,
>  	}
>
>  	region->fd = -1;
> -	if (backing_src_is_shared(src_type))
> +	if (flags & KVM_MEM_GUEST_MEMFD && gmem_flags & GUEST_MEMFD_FLAG_MMAP) {
> +		region->fd = kvm_dup(gmem_fd);
> +		mmap_offset = gmem_offset;
> +	} else if (backing_src_is_shared(src_type)) {
>  		region->fd = kvm_memfd_alloc(region->mmap_size,
>  					     src_type == VM_MEM_SRC_SHARED_HUGETLB);
> +	}
>
> -	region->mmap_start = kvm_mmap(region->mmap_size, PROT_READ | PROT_WRITE,
> -				      vm_mem_backing_src_alias(src_type)->flag,
> -				      region->fd);
> +	region->mmap_start = __kvm_mmap(region->mmap_size, PROT_READ | PROT_WRITE,
> +					vm_mem_backing_src_alias(src_type)->flag,
> +					region->fd, mmap_offset);

Sashiko pointed out these:

1. When mmap() is done for region->mmap_alias, it doesn't use
   mmap_offset. I'll fix that in the next revision.

2. mmap() may map past the end of the guest_memfd if, due to alignment,
   the mmap_size is increased. That is true, but I feel that that fix
   should go with a bigger clean up for vm_mem_add().

3. vm_mem_backing_src_alias(src_type)->flag may contain incompatible
   mmap flags. This is true. For now, when guest_memfd is used with
   vm_mem_add, the src_type passed has to be VM_MEM_SRC_SHMEM. I think
   this also falls in the category of doing a bigger clean up for
   vm_mem_add().

>
> [...snip...]
>
