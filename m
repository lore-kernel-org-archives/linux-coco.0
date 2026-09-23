Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B42375349D6
	for <linux-coco@lists.linux.dev>; Wed, 23 Sep 2026 15:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790176880; cv=none; b=NOrEf9TOyQ0mhbjQZA06944X1QaPj3jX4zyyjakC3rE1fdsNLJprUvR0QR3aiUsZMDdMIEFfhx4hh5/0qQuXwnQS8WJFrFLjI3fqo63Cn+FtMvsDEhYKdCAT2QJW2etfKhPAZZTWJRjUD8qzrp/0YInZaM4O4I9d/H/KcOtGi58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790176880; c=relaxed/simple;
	bh=3T521fW/HpOHDQpMbkHPHKx9NXhNDw5nf7wdl09SmWQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iIMxUlzoVBX4vAAArdowig+s64LRsY4+TI3WYWESFAm/xu1P+VCAsn4z0DpIe3cVoLDI0wCvnpwkgwDOVq4jHVlO31vccr4Gxcg2GkoWfIbLoHclxzJbtpQMBItW198W4f0WiVEkSBEoGENtFAco3Jnht3kLGRdOqq+pDNsYuW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CsXO/FPW; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CsXO/FPW"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-49ccf12bed0so51545e9.1
        for <linux-coco@lists.linux.dev>; Wed, 23 Sep 2026 08:21:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790176877; x=1790781677; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EE5PAnd1Wf6p3SmBC2optXiNbJWsLePJtC5K69fq2H0=;
        b=CsXO/FPWOaEILKQAbqU/ktArJ+XV68gJT6kFKFVavxelHJymWyqriBNfR3uE7u/ouI
         +bGZliNRbWBIyU6yUZsfkinUjx9nEeHBqyKliube6/pjeJZmbi3IsVh5+4pjI+7IbNm+
         5tKdQzPFQJdQok7nPQkxckJbH4oEs2j9TPhsCqFCNsiriuoENO1+KluUhdWb5492i1+5
         Imx+k6PXxNL0KNOh7kx0TzL0hBgD//9i4NsOD5wbEZgoQ4AkEB1n2NOBLhvshVnaGiwd
         SKuR1SaiYSQNbz+Q/HaF/5sNp0nBOiwZ6p19DQxsjgfiC5uHbft/12cEcd5ceq7oepJw
         BIJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790176877; x=1790781677;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EE5PAnd1Wf6p3SmBC2optXiNbJWsLePJtC5K69fq2H0=;
        b=hKlxFqzM/lniWPnj7hWcWnlgEtKGQOTakFrxd2eZLvfYjNZcSjN3M9BdIqxXpeDrNo
         ZuCjyjJQDO8/zQKRqzjvWSQiNFxRcieiG644UoJ63+Vny7dkYNQ/y5HQT/dxsgj9Lnhu
         9w1tQLRNyK1Yubuf0SDdHZg/mtwZtXXJH2jcdZKzQAXEuDpJAOjW9/lALXQEUo+w+Yxv
         HgQ7/AXrBenn/+octI9C2y0H3LPu9IYckBGXpOC/7ZgOCD1S8YQ4rCFf6ULri0BJQvX7
         lQUPHO3vlgcftkgHH7k8J4dras+L+IHWwtrytXTojyhXb+XKCV9bF9D0ZhXs8wyo0vsP
         8Qzg==
X-Forwarded-Encrypted: i=1; AKwUvByVoCVkvfwXE0A5lvo/ztBAtCyukOa71Z9rxuwc2GjCkNTgHJtyrNS9jG//HvGcP3f9AbyD2qnsQ+cO@lists.linux.dev
X-Gm-Message-State: AFuF++nLBmRfAiPAmMp4+r6XNS0D11lyALm5aYHTSfNJ2uUtNkafbWY/
	y/lajLCGUhKhbWrKQ1sSKPBOkisjVpW42w7jdwOBcC2ijpKHzA8AJ0zG7/1MSX/fog==
X-Gm-Gg: AYBFou3FsoUAkrDHT33TAp5curDFNZpEclPx2gylyH1+beshUIYlKDVyrVT8TOE9UrR
	k3kAJUwAgY1/lLmR+QLysjFke6b/CefZs2OIncB970gONJrGVR1yh8H1jkEd+eFu6MJgA6tNI0u
	LrJ8VZ0JvEKUvehUqmFZTvkXPLMjBdJxtfln2ORnfOpLAV+6ngmxQBAJEiYjYGQc8JJTAnDFNJh
	Dm/6BVuNO+DHLVo3K/vLDiuYfBi9jMd1xbqdu4IuNIIYCa8rQgUxWGaAvkRjYZgXh3TEQMmB8z9
	w4DS85VmjYhX6RK4cbvdSMoQ151T50v4qV2RM2rwLWwYiZq8aslCfXIAJgdPqrIsxp+iaoXQ11I
	48iCQk1e3UOA+HeC8tXQuRDXZa8EizxgM31SBu3jtVvWcDQgs3afDQ0Y12fHvpQDDXXD3W+r1ra
	k14CMnCyGy2nl7h+LbkPzxUqnf+8ml81LhiWlimeU4jFplrStX2/UXyClNNW+oiUk+bhcNMUm0d
	pyNrRqfipkr1HelcGPGHj5hPGdQq7heGKtVBgMe
X-Received: by 2002:a05:600c:4e8f:b0:49f:e1d3:fe03 with SMTP id 5b1f17b1804b1-49fe586ff32mr27765e9.3.1790176875531;
        Wed, 23 Sep 2026 08:21:15 -0700 (PDT)
Received: from google.com (250.192.189.35.bc.googleusercontent.com. [35.189.192.250])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe0c3ed96sm1697075e9.2.2026.09.23.08.21.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 08:21:13 -0700 (PDT)
Date: Wed, 23 Sep 2026 15:20:43 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	linux-coco@lists.linux.dev, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev, Andrew Morton <akpm@linux-foundation.org>,
	christian.koenig@amd.com, Joerg Roedel <joro@8bytes.org>,
	Marc Zyngier <maz@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Steven Price <steven.price@arm.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Thomas Gleixner <tglx@kernel.org>, Will Deacon <will@kernel.org>,
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
	linux-media@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [RFC PATCH v7 02/13] mm: Add an allocator for CoCo shared memory
Message-ID: <arPuS9FXrkYJhbiA@google.com>
References: <20260921144847.501151-1-aneesh.kumar@kernel.org>
 <20260921144847.501151-3-aneesh.kumar@kernel.org>
 <arKsFofudnTYpXj1@arm.com>
 <yq5aik3w344o.fsf@kernel.org>
 <arOfD6syXOgQhZYA@arm.com>
 <20260923130031.GE1540250@ziepe.ca>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260923130031.GE1540250@ziepe.ca>

On Wed, Sep 23, 2026 at 10:00:31AM -0300, Jason Gunthorpe wrote:
> On Wed, Sep 23, 2026 at 10:42:39AM +0100, Catalin Marinas wrote:
> 
> > On pKVM, we want set_memory_decrypted() to zero the buffer
> > before the host can access it (I guess currently relying on __GFP_ZERO
> > allocations). Since no cryptographic encryption takes place, there's not
> > much point in memset'ing again after the operation as the content was
> > already zeroed.
> 
> It sounds like this a pkvm unique thing, since RMM always makes the
> memory hidden, pkvm flow should do it too. Either inside its guest
> set_memory_decrypted() or inside the hypervisor like RMM.
> 

pKVM doesn't clear memory on sharing (see __pkvm_guest_share_host()),
and that is not a documented behaviour for ARM_SMCCC_KVM_FUNC_MEM_SHARE
(see Documentation/virt/kvm/arm/hypercalls.rst) which implements
set_memory_decrypted().

The guest is definitely the one knowing what is inside the pages and
whether it can be shared or not.
For example, a while ago I was experimenting with inline decryption
to avoid bouncing, and I imagine it might be used to build on in the
future.
Also as these hypercalls are ABI, I'd argue we shouldn't change their
semantics.


> Hypervisor doing it is the right place, hypervisor always needs to
> ensure guest memory is cleansed whenever the guest gives it up. Either
> via a private to shared, unmap or just exiting.
> 

"gives it up" is different than sharing, for example:
- When the guest dies pKVM will zero the memory before returning it
  back to the host.
- At the moment the guest can not relinquish memory (ballooning) but
  that is supported in Android which can zero the page.

Thanks,
Mostafa

> > I don't think cc_make_shared() has the right information on how to
> > safely and efficiently do the zeroing. That's only known to the
> > set_memory_* backend. So you'd have to propagate the flag down.
> 
> +1
> 
> Jason
> 
