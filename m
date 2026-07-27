Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6F473C13E0
	for <linux-coco@lists.linux.dev>; Mon, 27 Jul 2026 18:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785178439; cv=pass; b=QHjIIdwe2X2mIVCJCSzzhqfZVRBnw37rsyjQE4RVXLWpxeIs+jwnYppT2O+duHmkJCp+w5ZRu/OdO9z8xQjv6Mbsops9eaigJFOu3dBeV+qVCl98ry7+wIkWKEGjtR/r6FngnwZzpTUnuzmv8a2CehLOd7E+A/GELxRRd2iN+J8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785178439; c=relaxed/simple;
	bh=jBGj3vq73TpQNUHtZ8hP8T9s3Rn/i9PzV5LYqBYc5Jk=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N/OmDLyreEyUpjvxQ883sqoZbQl3mHm4kxZa6dbLG3tLOT7Lppuc7eHyJ5f1t2CuYf7g7adnwiBmlgH+kof2nSd9JdkXKLn7a19qXGmkrkJxEfdj3yDk/hW3v4piMxqRmnmygTVTwIg/PD3Tt6+C3kQZXvmMrxU4/EbAWx+I8wA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=t5X4yEWp; arc=pass smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="t5X4yEWp"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-84864086bfeso2968310b3a.1
        for <linux-coco@lists.linux.dev>; Mon, 27 Jul 2026 11:53:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785178437; cv=none;
        d=google.com; s=arc-20260327;
        b=fKczn/Etw2kwE8eCO//dtyytFd+rwhJ/qM/UHqHmxenClzI2OzFqFCkmEuh19R6fwx
         r+xwJDISoylt6PLJDivWrn8lvx1uOxYOrVm26DmZHmZG+QDevipwIk7mzaBM0u1ZdNtJ
         3OKjvNkvuW4ikvOn5to8bmR7NGmasbAzG7yLaxmr0e/oNqLHBQxs0GUB1nXlnBwp/yQ3
         JlQ8UsfnXFvkkIU+I3QqaZTLDdPOkY1itT20gJKdjFZxWnzDBwqTFCBzyMTDA5T1pdsy
         WgrJZxwVKDzha1hevZei4jzAOm2uHSgdvGmC5ILGyDWn1NyJUt3cmXgUnTFW9T3R/O9A
         kTVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=Ezc2drTNkvx/EGjvXJcxB1ItRYJScaQpIm5JRHoUsx4=;
        fh=UYWaBhoWeYcN9JgexLBpddBWCxsHytTQd3UeVoC/2Vk=;
        b=lg7ucCAlCwM2spXzNt5ONOtPXNAvuXyVyBmW3N9qXI5+WfG6UySK+j7ow6cyYCvRJ9
         xo2VNbj1XsSMxsS7jjPQrXmDkfMdh2gIC5XNSy8kR5cEk4FO8rxURoFVAnZBOcD7r9xS
         xJvuI0XiPYVFJ7sbwFzG6mnFhIPuz6SORTxpFn/9J+VWO5H2LfSO5MFkTWvzRNiUkPez
         /fg8/14h1ZEtt9iZC5/oiUu0vaHGQONkciEUV8Q9C+HFxyjJsBf1ixmCZqrbXnk+DAns
         UNtuiijmjqAKj4YQ0SN1iGrMaDbcyJfs23RLMOrm1GRcHE3xYeU0VvKx1AOhQkgMtlqx
         o3OQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785178437; x=1785783237; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ezc2drTNkvx/EGjvXJcxB1ItRYJScaQpIm5JRHoUsx4=;
        b=t5X4yEWp7mr+pHxTincS18rD6fCwNmEtaXdrtF+l34vqPJlu7AYiYg3+DjAgx8FJcP
         BcJHehIrNaQq8XahL3MVesOJS3kJ2feiEHPZ1I8GSSaMBqouNUa0z8La1hvVG+u22KxE
         XxmILmTEV28Pd6wDNA2jzsMd/7ND7gjPd6MmFB8cn3+QC9qZS3Vg4aYZGIDhi7DzumS6
         SGqd6QvaYyYfkhtsOAx+AH9FEFR6K4nLX5V+/m0LOQ5gm/6GqiRKoi2pkwPXVv6heqJ1
         sSr4J+xxQAUTK621j78vZK+bMHvgMWDPijA+derSvfbK8HZsHnDivNW902jzzlRBmvAq
         WkpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785178437; x=1785783237;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ezc2drTNkvx/EGjvXJcxB1ItRYJScaQpIm5JRHoUsx4=;
        b=lfWnv36IVAW6GVpSfXOEjpRcr0hio0cJhKtjkxYeKWu9XoAMMkgGqbEEfqQv/GoXDL
         peqG7QVbyeoR4d5qNm050rh7Wd25LpSRxbSKgYsqOEfr8HGzsQBhIb8FZ9aNspivtxsu
         gGGljb7+rQWufYiUi9oEERttVNHoSqP3oE1fha0sF8G0DNU3YUYsz4KQXVJ3K0BBYX8A
         /jO2veyazEqxdXG5a4qiMqSI1OahwX4Tyji2++Arw8/ko+rLJsJDnReUvGPnRT34LPxJ
         167asOiJU0+9wYhwKDZ2weOByP3nLU/s1JAeSJBcZ1iJxBUgmDuMbLnlHrA2iNR5CI7R
         DYXg==
X-Forwarded-Encrypted: i=1; AHgh+RpQXKNuj3N2hH1XVC9KJki8OxL2ATypat+ypTx5WGmnyE9bsYL9GqBndwMasGd8pRgcpqV46GCzKFU/@lists.linux.dev
X-Gm-Message-State: AOJu0YyvypCCM0tM+dyXMB5H8yy4RHAzuSZEG4B2lCgg8OS+RCyVeVe9
	LSFeeviPwZSiPH2OETd7pxZFecN6Jegg7GGw7MYWfs9bunH4So5Q3X4m6U3ekMNuNM3rXXyg1fM
	4XO+K3+hm3/0slLZjTlTgyo3UT3X1dwEmGjldbWDk
X-Gm-Gg: AR+sD12i7ed7Xo8c+xHU+aN7D4wRnYDy/fh1sVoryh6ZP8HFrBwbFmrNERj0YgAGvW6
	7ZG0japHInZfaRhZUpw7oBbBRPqfUeyFFOT9a5dOldIcfL6OslkmcdkUOC7UY9yCZvSNG0Vip0u
	gZ5FRmg/VYhVkFRgBqu3vht/sU/QmzhaSbV8ql/J/DqXMn2tIkfe5rE6L0yum/NrQoTo/ALDg1N
	0x8IP6CcGEzqOXVKOUWBUTNOuKNd4E0T3xQcCAfiidlgdjD6tZblxNwR47cAS3h0JSKGE/kr6Wp
	oLu9gSDfcqIrQhuvpnyNEicutd52PbXGZxYucDYvYU8opOs/
X-Received: by 2002:a05:6a20:6a05:b0:3c3:7a0a:18a7 with SMTP id
 adf61e73a8af0-3c6c7fb20d4mr796670637.55.1785178436210; Mon, 27 Jul 2026
 11:53:56 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 27 Jul 2026 11:53:55 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 27 Jul 2026 11:53:55 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <amcdueQI1voXWPQb@yilunxu-OptiPlex-7050>
References: <20250529053513.1592088-1-yilun.xu@linux.intel.com>
 <20250529053513.1592088-11-yilun.xu@linux.intel.com> <20250602133009.GC233377@nvidia.com>
 <CAEvNRgFpJWQ5M5sQhGpQUV3GbBq9N+MQhhaxdxa=D8ky94SCsw@mail.gmail.com>
 <20260712221934.GF674038@nvidia.com> <CAEvNRgEo2kLUmaGU-Vsgx2sTQvU_NNUJ4bRp5Z4Ygs_xvVLOYA@mail.gmail.com>
 <amcdueQI1voXWPQb@yilunxu-OptiPlex-7050>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Mon, 27 Jul 2026 11:53:55 -0700
X-Gm-Features: AUfX_mylYj_x8eQp0BvgfyW8gHfhB_jFskLbUbWzV0Fgf00qZT4Qn9h3hPlqeKo
Message-ID: <CAEvNRgGYc0B1YyhDhS0Khfm3N85hbkYGMTfDLiXYn+WHTLF2EQ@mail.gmail.com>
Subject: Re: [RFC PATCH 10/30] vfio/pci: Export vfio dma-buf specific info for importers
To: Xu Yilun <yilun.xu@linux.intel.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>, kvm@vger.kernel.org, sumit.semwal@linaro.org, 
	christian.koenig@amd.com, pbonzini@redhat.com, seanjc@google.com, 
	alex.williamson@redhat.com, dan.j.williams@intel.com, aik@amd.com, 
	linux-coco@lists.linux.dev, dri-devel@lists.freedesktop.org, 
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
	vivek.kasireddy@intel.com, yilun.xu@intel.com, linux-kernel@vger.kernel.org, 
	lukas@wunner.de, yan.y.zhao@intel.com, daniel.vetter@ffwll.ch, 
	leon@kernel.org, baolu.lu@linux.intel.com, zhenzhong.duan@intel.com, 
	tao1.su@intel.com, linux-pci@vger.kernel.org, zhiw@nvidia.com, 
	simona.vetter@ffwll.ch, shameerali.kolothum.thodi@huawei.com, 
	aneesh.kumar@kernel.org, iommu@lists.linux.dev, kevin.tian@intel.com
Content-Type: text/plain; charset="UTF-8"

Xu Yilun <yilun.xu@linux.intel.com> writes:

>> > If VFIO can create one
>
> It is an interesting idea to let VFIO create a guest_memfd instance, if
> DMABUF doesn't work. But to achieve this goal, I think we still need to
> refactor guest_memfd to allow for different memory/MMIO resource
> exporters/creators, and different resource importers/users like KVM MMU
> & IOMMUFD.
>

Yup I think both ways we'd need some level of integration from both
sides :)

>>
>> At guest_memfd creation time, guest_memfd is always created for a
>> KVM. This is the first place where it is bound to a kvm instance. This
>> is one place where it helps Yilun with Confidential VMs, so KVM can be
>> sure that the memory was meant for a specific CoCo kvm and not any VM.
>>
>> I think it might be weird to have VFIO take a kvm fd to create a
>> guest_memfd?
>
> I think having VFIO create a guest_memfd is better than having KVM
> create a guest_memfd on behalf of VFIO.
>
> The lifecycle of the MMIO resources should be managed by VFIO, cause
> the availability of these MMIO resouces are impacted by device
> operations, e.g., device reset, PCI Memory Space Enable (MSE) ...
> You can't export MMIO resources to KVM MMU without VFIO's awareness.
>

Thanks for explaining the above!

Do you mean that as long as VFIO knows that some addresses are not
usable, those addressses have to be removed from the stage 2 page tables
that KVM manages?

> And VFIO doesn't have to take a kvm fd paramter to create a guest_memfd,
> VFIO has got the kvm instance via KVM_DEV_VFIO_FILE_ADD.
>

I'm new to this - looks to me KVM_DEV_VFIO_FILE_ADD is for linking VFIO
to KVM but some mmap-ing is also required (pre-CoCo) to set up memslots?

With CoCo, setting up memslots would use some fd (guest_memfd wrapping
VFIO or the VFIO-created guest_memfd like you were suggesting) and I'd
think there will still be some notifiers between KVM and VFIO for the
mapping.

Btw is it right to say that KVM_DEV_VFIO_FILE_ADD is only in the case of
setting up irqchip? Is irqchip a requirement for Confidential IO?


Hope you also had a chance to look at [1] that David Woodhouse is
working on :)

[1] https://lore.kernel.org/all/1dc299af6b795a40c8887b3d84f915024f6446a9.camel@infradead.org/

>>
>> I was thinking that the userspace VMM could do something like:
>>
>>   int vfio_fd = open("/dev/vfio/devices/vfio0");
>>   int gmem_fd = ioctl(KVM_CREATE_GUEST_MEMFD, { .fd = vfio_fd });
