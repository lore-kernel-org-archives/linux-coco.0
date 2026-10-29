Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793282931;
	b=xqqlke/YVXKYZU4D+/NrZ8ebCOESIfICgIXbcBdRvszQMcL1udqv7+uwXDmdhHF+5tB1
	 XA/6SmG400SvEvRfJy4CIMremHs1zOY9iKOrJhzLfPEoogPgfhQS3eQt7YuKaCAScqMCf
	 DOTnXe7ffaU8VBBjq588XKvm2jQn3dc3VtEE4Aue8UmAU4bRsZiEVD82sLn9tk2mx6rez
	 DpiYFNkxuyl1KAH+ANkR0WScP/VHvvY3HuYdojB4s2DomGlEeMZffS0A1GcOu2TjAEF9J
	 D1SiQG7FJLy4PfgzV0z9jqQO6uw0/ePjlsjUBkSjtzCKjOwQp7BPeiFqoVjEKc+MSwA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793282931;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:In-Reply-To:References:MIME-Version:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=H7Sot6fFV/mqoa6U1RpNz1ThNjxhsXi7WSqRiEBh7pk=;
	b=M3cyRZtkGGiEw6zy00llx2/7wWJnTZLTUiEuOo/ArIfAimhtohNF7HsuP2t3+d1ekzS/
	 6wGUrPslcHTOeel5pQDGc+vqACVEJarX8DBGZoYPGnH4QYlKvgUnGpxqWPVWLxYrLJOzZ
	 Lnn0PzfXeFN+adM8cMWFkOgUPgE3tXVxBUrl+jmKJt2Ma+sB9AEjDrb0sZwb+gY/d9uPZ
	 mcRBuNA8y1G2e7OUxdn9U5oWOqr4hUhUYeb1sJamNugeCxN4ybGkwM2eXr753jzvWX2Kh
	 fnehNhcfdcjGTQLD3qOb99Dd04BItGblW6mqeoq+Qljr8IbbIsEK19Fz5sjvJI5/BJQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=UKPeO9+2;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.43
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3797606A31C
	for <linux-coco@lists.linux.dev>; Thu, 29 Oct 2026 14:08:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3797606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=UKPeO9+2
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-91b9e758c50so10979976d6.1
        for <linux-coco@lists.linux.dev>; Thu, 29 Oct 2026 07:08:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793282930; cv=none;
        d=google.com; s=arc-20260327;
        b=Uv2xJoeJexnJN2aop0JliKWtMG3IBkQhDdU0uzSiKA0zVwaw7mvj90Nfk6zul+oWCm
         PYGjv5TtNKOED+X3m2ZxqJ0IqUavoQl/EFKOsnV/YRY9yJA+OChxJb8BfAnYU13gOmF2
         nyg17jCFj1FHuIeLvmv6OaXsD12awyyKY+Mh86Fhec8fAoBRNi05XfB89+CVDIclUhLF
         iZeVacUSU9/ki21MBtS6Rj9cgBOGIPQE0tCadONxKx/jS8ckCZyCmZ4FkHLvXwYjginx
         jn97Y1pDGTwUeAOaQNCF2WFY5nINbuEzB9bQmV7Vhyg1zwmhE/1MAIR2rk6SogN6g7PE
         /O6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=H7Sot6fFV/mqoa6U1RpNz1ThNjxhsXi7WSqRiEBh7pk=;
        fh=fGa7oSvIHdltPJGlYLmsiZagQ1xqpZBdsg8smV0o7bY=;
        b=QdSsdJEU8b9Dl1SA1RHNiufVIvjN0hfADM+Cuv0D1Z18vCP3/j6HiM0wU+NzCGg5a7
         1HgqJeNH/PdU46lZUd643iVKZ+2jfCJz/PR0a42EnxrP3rw661mrUEEbZfMhMQzAz8yI
         PNEPwqoYr2hzmZocwnkiERM+H2u6tlTkvVllfnvSpLKQBOydsBnP/lePnGkU+8XV6LBO
         tm25WcfD9aSwBm5wApq329mHyo+lza1zBTGgAEE37RyYjSke1GYdVq5orPJMqeI5Fjij
         MdqjU3PB/FzkQjbsGdyZLYfwrGoc1iL/LP3ACPCDRy/6wTEg3CGw0BnLMdMZoO+ydu/8
         hH/A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793282930; x=1793887730; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H7Sot6fFV/mqoa6U1RpNz1ThNjxhsXi7WSqRiEBh7pk=;
        b=UKPeO9+2qc7xiP4MPR/7cBIz6CgSwDcTHk45ktToipsszvxPHPiYYVGrSoRIEsYOKU
         yYIUyssYdajaP0O1EwL1yGuyxeVszaFRgMqvjX8eBPT2JHtAkbYe1rFqa9KXjCcpw2x8
         R9BCKatTJWQ12u7STYp8MgIywDsCnxTKlDdYyy1ssXR5RPPDLFnmI0vS/ZFO5xwr+Tke
         9YedEadMsVQhl6mRgcIi7Al38f4wOuA/sJooJuiTpoZzzXvlHcdvIuCrjORUBK/zV5He
         KHxVsz8eHJZenkpFoIjQesAuAmJvnc3UG00g2gASZwaQIgUE/h+ufl5rsYsl+gy7OEbW
         IoTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793282930; x=1793887730;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H7Sot6fFV/mqoa6U1RpNz1ThNjxhsXi7WSqRiEBh7pk=;
        b=zqlfQ64xM4v+TZn7CR66RMovs2hGsUFdJI5fl38f4rt1U/8RfKfun0WyT0le8dAFUK
         C04peIVjhdefxQU9vQ8GUSmU2pWMRkefce2VG8dM4PxM+bYnDI1svx4uRi8EXmeh6vCM
         5TYb7daY32IxydiPayOVVhI2H+d4fR4kaGQ9ATVAGsi+71DXrhdZdx0yfxhR4Zkx4gzp
         nzLbzB5EDWyijzuLcnsjMkvh4Tonqjf8/tT12s9THzmlBeZFno6ESDrui7NcArHxE9S/
         HNsj9Dt6sGVamdUKPcIiD3yNmEN5Yv3Snfl7AXnTWgApOHxgdmnawvJ9Mq3922Gu1GX/
         hI3Q==
X-Forwarded-Encrypted: i=1; AKwUvBykzalEkj6KhLFMYDeGCXckZr+t0VHwTrk7qEMwx5i0DBB+QTrm5sKyYro/Fq/xk0iwF7KmIR/GZi6z@lists.linux.dev
X-Gm-Message-State: AFq9FYJ9HdqSkz/tuRYjq9QC3XCCpYOexM79lu1kYEXrwYhAs209+G/N
	HGryu6AlKJ9xmMM86DgAD6HNBg21DMhHvKzdUHp9LP2RwHd5a7r8RyRW0F6ZqqqFgSHCPVwGjWu
	27xREBORZxj0O4p3H0mvljDjfHGm1dZKecolJHKvp
X-Gm-Gg: AYBFou1v4Cyu5Wcu4qnw1h5MM2CfIJaJ79aln2BacINbAYz5ARY5PgnZqTit+SBEHLn
	u4w60xDRBOEYHNQ5fbEywuVcE63nMFYs9ozTojvHvS5xpI+yxIAeT+2RnG/B92S+cZctSlneISH
	/fE5770MKSfp6bXk3OyWZwochD8lqHytRwqQKppWc19GAlCOblHONTq6aUkXclcXorGE6b6ifoS
	W+T3tFXJH9Kcd986kDMCCl+m9WrThfQRKUaumWz2tKkMif/DwhzSlxrMk1y1RrdzhWew94WVMpc
	nQ82JF0WLnb77QVM+36dNjWJAEaSoqxopZTPLL2ioPAy5Z5oHi1u2v6a1i+aLsEZz1VQSGPYXy9
	Q4PhZxGjnuzY7DjmLPbEE44FdPkhFaPektpk2vUhs4Ne77l0hpJRoGxZvaFGyo98XvA==
X-Received: by 2002:ad4:5dc3:0:b0:917:9703:48b5 with SMTP id
 6a1803df08f44-91c90742c32mr40775726d6.26.1793282928607; Thu, 29 Oct 2026
 07:08:48 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 29 Oct 2026 07:08:47 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20261017073149.1303738-1-aneesh.kumar@kernel.org>
References: <20261017073149.1303738-1-aneesh.kumar@kernel.org>
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Post: <mailto:linux-coco@lists.linux.dev>
List-Help: <mailto:linux-coco+help@lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-coco+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Date: Thu, 29 Oct 2026 07:08:47 -0700
X-Gm-Features: AclHuK_fk7ikZ1Ry_rR0lNw1rkr7m6j782yki2DT2D_WNr6A4h89KzpbSsJWlnU
Message-ID: <CAEvNRgFb5zLkTph_9k3io=7UD6S-j3QPnjE3qVTvzeGZxEJSHg@mail.gmail.com>
Subject: Re: [RFC PATCH v2 00/13] KVM/VFIO: guest_memfd support for device
 MMIO resources
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

> This series adds a guest_memfd device-resource framework for exposing PCI
> BAR memory to guests. The intended use is confidential device assignment,
> where KVM needs to coordinate private device mappings with shared access
> through VFIO. The Arm CCA backend is provided separately; these patches
> contain the guest_memfd, VFIO and IOMMUFD interfaces it uses.

Thank you for this revision to guest_memfd + VFIO support!

>
> The guest_memfd framework and Arm CCA backend are available together at:
>
>   https://git.gitlab.arm.com/linux-arm/linux-cca.git cca/topics/cca-da-gmem-backend
>
> Userspace creates a device-backed guest_memfd using the ordinary VFIO
> device fd as resource_fd, with GUEST_MEMFD_FLAG_USE_RESOURCE and
> GUEST_MEMFD_FLAG_INIT_SHARED.
> The resource mapping superblock selects its
> provider; get_pfn identifies PFN-backed memory. Eligible BAR intervals are
> registered as guest_memfd memslots.

> File offsets use the existing VFIO
> region-offset namespace,

Yes, this is great, thank you. I think we should have guest_memfd and
VFIO share the same offset to PFN mapping.

> allowing one guest_memfd to cover multiple BAR
> intervals.

Yes, this is an advantage I see of using guest_memfd to wrap VFIO too,
instead of requiring separate memslots for each shared/private range.

> The device-backed guest_memfd fd rejects mmap and fallocate;
> shared guest faults obtain bare BAR PFNs from the provider instead of
> resolving the memslot HVA or allocating folios.
>
> IOMMUFD resolves and pins the device's existing vDEVICE after its backend
> validates the VM association. Its MMIO mutex coordinates conversion and
> device state changes. VFIO supplies BAR PFNs, validates eligible ranges
> and excludes dma-buf exports while a guest_memfd provider is attached.
>
> Without GUEST_MEMFD_FLAG_MMAP, attachment rejects existing VFIO BAR VMAs,
> and new VFIO mmap calls. With the flag, existing and new BAR VMAs are
> allowed through the VFIO fd. Attachment invalidates existing BAR mappings,
> including huge mappings. Subsequent faults use base-page mappings so each
> page's shared-range attributes are checked separately. Mapping the
> PFN-backed guest_memfd fd remains disabled (We can decide on this later).
>

I saw your other email regarding how to handle read/write/faulting
(mmap). I still think we should have all these be blocked on the wrapped
VFIO fd and have it handled through guest_memfd.

The gmem_device_host_accessible() function in this series has a comment
that explains this, which is that the shared/private attribute is
guarded by filemap_invalidate_lock() in guest_memfd, and so having
providers call back into guest_memfd is probably going to cause locking
issues. That's also what I figured when I was trying to implement the
integration with the sample memory provider in [1].

[1] https://lore.kernel.org/all/20261022-gmem-alternative-providers-v2-45-5dd1dc6c660a@google.com/

> VFIO BAR read/write, ioeventfd and userspace mapping faults check the
> requested range's guest_memfd attributes.
>

Thanks for calling out ioeventfd, this is one other backdoor to possibly
access guest-private memory. To avoid calling back into guest_memfd to
check shared/private status, I have these suggestions:

1. Treat the ioeventfd setup as yet another "mapping" alongside stage 2,
   host userspace, IOMMU page tables. For IOMMU page tables, guest_memfd
   will have to do mappings eagerly on conversion to shared since the
   IOMMU cannot handle faults. We could also "zap" the eventfd-to-VFIO
   connection on conversion to private and "map" the connection back on
   conversion to shared.
2. Take a shortcut for now and say that if the VFIO is wrapped by
   guest_memfd, always block ioeventfd setup.

> This series depends on:
> * Ackerley Tng's "Allow guest_memfd to be created using a resource (pool)
>   fd" RFC, which provides the tmpfs resource-provider API:
>   https://lore.kernel.org/all/20260925-gmem-tmpfs-backend-v1-0-d36159822d18@google.com/
> * The IOMMUFD/TSM series, which provides the vIOMMU and vDEVICE interfaces:
>   https://lore.kernel.org/all/20261008055955.4014342-1-aneesh.kumar@kernel.org/
>

For easier testing, is there a VFIO sample we could use? How about mdpy?
Is mdpy representative enough for selftests?

>
> [...snip...]
>
