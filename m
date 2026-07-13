Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3477F38C40E
	for <linux-coco@lists.linux.dev>; Mon, 13 Jul 2026 22:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783982424; cv=pass; b=Mj8dAWTcuU2RYx2ZRYGjBiwi9Uqjo7As4po/I/7dCbVExjnQ+H4QM7yoOm0nrNFFr+gPNN4w7pavdpiDHZEajCwefG3UDZxGxJww/DpsYI8m9PBpv4ZoEanNYOB59daAc3504VL1w1v8Et+JdJo00sLNOA8zRaALjMUIIf7RfUg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783982424; c=relaxed/simple;
	bh=7LkfD6aXl9dK90wHStXoX1dSfuVb2Ck7kctZehI6Xxk=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qIqhvCieTlIDAuxPGnEBvvF+X0xUfc9Y7PEI0bSilrIpCQHnO0MgsL1n9B8EM04OU65nQ7yW1XIWPFfi4/T8LVnukLySiEh9kBYHYbGcnQvx6sMrANpIcNY2BnE8CTOqJO1vIDPkBEXkXGiP9/9SGobIeL1WYdjm6mfwM6TiKLw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lQdRmQZ0; arc=pass smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lQdRmQZ0"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-69a5ecbbfb2so534424a12.2
        for <linux-coco@lists.linux.dev>; Mon, 13 Jul 2026 15:40:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783982421; cv=none;
        d=google.com; s=arc-20260327;
        b=HZTSWGFqW2pV0RjVEQAoIIe9x2SuScfXb5z64NrLA33qO59kx1SYDe3z4yn7siE0lw
         XS9Dx8x7m315k2jdj+FVBBbgjOElMLOm5PgHq79vXTNf+9tJP6thT2VyBC1it/Nv29qv
         +Xwz98mXOPQzAPliBQQAFBNUlyv4LWVWr8TFC21C/JRztz/Bu+zylq/vqSNFRZkZq54i
         oHgEXU4dl8VAdPZ5kmglBcVvrwNPQe7DERPmE2mU79SSCc69YJAJdgHFoLS6C24FQ3uD
         xLSk4ejixLWIIFwLoZWDXiuTTTEqbW7KTOMo6LDVBywa/YcE5J9Yl7hF6AkK3pHQo8w1
         mhFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=7LkfD6aXl9dK90wHStXoX1dSfuVb2Ck7kctZehI6Xxk=;
        fh=n0Bn8i6fz5MCQTHEtPr+IxfXCZCGya3aHwAUbhaGgXk=;
        b=ldGQwJ05MTesTSmDYR81/pSL9TO780Rq+2f+rQ+f6OD8VH5esCC9kW2hd9XYlaeifU
         d4LDQWLQClzqaQ7hZJz9e2nGcnB7GfxJWiOM8TRWbJVWeXvvu20Gl+XWpB4xWEyM3JjZ
         D6/ZVSatcrC9T4wwDR/gW9ON73WABh6R3jZy/i5Ok+7ogP+zAWqWTj/yiendS3fa2nUs
         TWxQTD6loAOrMPGozFf0RaqjTtPIkLPEcHMSyj+aw0IKBti7Blslbn+pz2AweyK9Jz5j
         O+ApoSiK4OGT726aGlb72WoBeQj5E5RBvJiO3l2mc65NPs9QXTqipytmUN5JPZfi5+2+
         a24g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783982421; x=1784587221; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7LkfD6aXl9dK90wHStXoX1dSfuVb2Ck7kctZehI6Xxk=;
        b=lQdRmQZ0weChvZ2e+odDAbnTiM3ZvFnJIQAK8wPeiKYMtCBuEuyWa889Db9ttX7rIy
         QeJcwWyTmxN//SeyQy5ZWp4mSenAkfZ1W5VuOeUDf5XuK+DiVVDoypoQeXkhMf69G9GF
         lAHV8Su9r9V14C1aiajNAfx5YnYKxlj962NMG8PqxK6iq5G30zPzUszct04Zep+0d26C
         hBEZZligxFi5CFfNGCznc9ad4OuEkyrcCvu7XtRE2GlV8fiXgLdFC3v43UcOzQV43nrk
         bNaX8sF5wlbGJhAjjnwWAo33qRxdlANP7uCf806X54V9XB9dUwdx77BRyyrG6OsPpHkW
         lOZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783982421; x=1784587221;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7LkfD6aXl9dK90wHStXoX1dSfuVb2Ck7kctZehI6Xxk=;
        b=XuVXQ2l+1bIjDckBeq+SQe7zWelhKgPuy3khQVQ+pbTpEDYq2pi2bKXR8VmTsZzAXg
         RMs04f/kbsawJyOPMCgHBNm/aMCy5GC4YpG4u12JuYoi7/2s1Bn8jDtYmtWFd+FwVETV
         Nndq4FfeI8Xwq9y8WPhjbMzNl8ca1Eqfrwpsv+/7sPCWhsUOCNraTvdzt+MpENzUrkEd
         51c8tCPMWeIOJcdkosR84Vq3L9yagvP3dZhBT75qA0Ceban6jtua+YrQWhlyiwPryj/z
         /C29xTKaPDyRLffcHi94L/BDUl81t+WO7DzBA6Pp2w3rdvmoNOB+t0BzpuuRYVVrUO/6
         /3mA==
X-Forwarded-Encrypted: i=1; AHgh+RqJh12s0s3rb29ot88+vvApu+LkaFdSFQ96QQA1vxvyGXePybL0koZByP/qbSvD0ySLsaUeL/+bIwpi@lists.linux.dev
X-Gm-Message-State: AOJu0YwSFjn983H4QFhq2u7qo8GJV1tm7jhFGbYTjmeD6wi7dhUoQtat
	Q145Bmt5ZCCNoVokFzI0dvFOXv+liO1EcjhnuYStkOdpq0BYj2ZKuh8SrE7vGRIkpkqFSD78OO3
	1IefhU3oLCn3JXtAI4YOzqB39os+TNH90GZ3PGTCf
X-Gm-Gg: AfdE7ckLjCGcFezEb/Do7eQdnIUmvFOBCsQK8OYjGZ3rqf3PNkERDpe2T6ccGxMN5ob
	/o5msRnn/Eaph+nDpr0ua6hEIMmsrtEnWSjPEMRGobn2cf+0amAFEH5CmX5iHG9pEUkd/nZJXXf
	nFLPvsHuEljUlrPP8kU1ikUFzKmDlwrrcdjkJYq0E0pz5MKx28z6ZOKKAHiig92CAbZ6/jwvebe
	BtkyddTid4V24Nwm4rb/reC/hpPkiYoKVODbjXAVmZ3dUzhvTy9h94CyhW1/sH9q2kWw+0yvIYl
	NVDtoIX5rEStYW1KjlIaeW2kSkjE/y6G5YoYA5BDbX25YGuOGx5xtxR6ln0=
X-Received: by 2002:a17:907:398c:b0:c16:13e7:fd63 with SMTP id
 a640c23a62f3a-c161de05ceemr462764166b.0.1783982420699; Mon, 13 Jul 2026
 15:40:20 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 13 Jul 2026 15:40:18 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 13 Jul 2026 15:40:18 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20260713191727.GH674038@nvidia.com>
References: <20250529053513.1592088-1-yilun.xu@linux.intel.com>
 <20250529053513.1592088-11-yilun.xu@linux.intel.com> <20250602133009.GC233377@nvidia.com>
 <CAEvNRgFpJWQ5M5sQhGpQUV3GbBq9N+MQhhaxdxa=D8ky94SCsw@mail.gmail.com>
 <CA+EHjTwd9uku-ZV5y8xcK8VWdOfhcchyW=_fzjpCf5Vk2wQoGQ@mail.gmail.com> <20260713191727.GH674038@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Mon, 13 Jul 2026 15:40:18 -0700
X-Gm-Features: AVVi8CeLrPp9U0h6s0bW1dfkDuvwNQDlx835UcZJGSgXNK2eLWnyQH0juXRBY34
Message-ID: <CAEvNRgEvGmOK3dXD4qdw5uXYD2sXNEVGT9NV2Zz-4H8VPb+KUw@mail.gmail.com>
Subject: Re: [RFC PATCH 10/30] vfio/pci: Export vfio dma-buf specific info for importers
To: Jason Gunthorpe <jgg@nvidia.com>, Fuad Tabba <fuad.tabba@linux.dev>
Cc: Xu Yilun <yilun.xu@linux.intel.com>, kvm@vger.kernel.org, sumit.semwal@linaro.org, 
	christian.koenig@amd.com, pbonzini@redhat.com, seanjc@google.com, 
	alex.williamson@redhat.com, dan.j.williams@intel.com, aik@amd.com, 
	linux-coco@lists.linux.dev, dri-devel@lists.freedesktop.org, 
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
	vivek.kasireddy@intel.com, yilun.xu@intel.com, linux-kernel@vger.kernel.org, 
	lukas@wunner.de, yan.y.zhao@intel.com, daniel.vetter@ffwll.ch, 
	leon@kernel.org, baolu.lu@linux.intel.com, zhenzhong.duan@intel.com, 
	tao1.su@intel.com, linux-pci@vger.kernel.org, zhiw@nvidia.com, 
	simona.vetter@ffwll.ch, shameerali.kolothum.thodi@huawei.com, 
	aneesh.kumar@kernel.org, iommu@lists.linux.dev, kevin.tian@intel.com, 
	fvdl@google.com
Content-Type: text/plain; charset="UTF-8"

Jason Gunthorpe <jgg@nvidia.com> writes:

> On Mon, Jul 13, 2026 at 08:08:14PM +0100, Fuad Tabba wrote:
>> On Sun, 12 Jul 2026 at 02:02, Ackerley Tng <ackerleytng@google.com> wrote:
>> >
>> > Jason Gunthorpe <jgg@nvidia.com> writes:
>> >
>> > > On Thu, May 29, 2025 at 01:34:53PM +0800, Xu Yilun wrote:
>> > >> Export vfio dma-buf specific info by attaching vfio_dma_buf_data in
>> > >> struct dma_buf::priv. Provide a helper vfio_dma_buf_get_data() for
>> > >> importers to fetch these data. Exporters identify VFIO dma-buf by
>> > >> successfully getting these data.
>> > >>
>> > >> VFIO dma-buf supports disabling host access to these exported MMIO
>> > >> regions when the device is converted to private. Exporters like KVM
>> > >> need to identify this type of dma-buf to decide if it is good to use.
>> > >> KVM only allows host unaccessible MMIO regions been mapped in private
>> > >> roots.
>> > >>
>> > >> Export struct kvm * handler attached to the vfio device. This
>> > >> allows KVM to do another sanity check. MMIO should only be assigned to
>> > >> a CoCo VM if its owner device is already assigned to the same VM.
>> > >
>> > > This doesn't seem right, it should be encapsulated into the standard
>> > > DMABUF API in some way.
>> > >
>> >
>> > I'd like to propose an alternative. I've been working on guest_memfd and
>> > new to the world of IO, please help me along! :)
>> >
>> > It seems like using dmabufs are used a little awkwardly here. IIUC
>> > dmabufs were originally meant to expose memory of one device to another
>> > device, mostly meant to share memory. Dmabufs do expose MMIO too, for
>> > device to device communications. Without virtualization, userspace MMIO
>> > would be done by mmap()-ing a VFIO fd and having the userspace program
>> > write to the userspace addresses.
>> >
>> > Before CoCo, device passthrough (MMIO) is mostly handled by mmap()-ing a
>> > VFIO fd and setting up the userspace address in a KVM memslot for the
>> > guest.
>> >
>> > With CoCo, is the problem we're solving that we want KVM to know what
>> > pfns to set up in stage 2 page tables, but not via userspace addresses?
>> >
>> > guest_memfd already does that for regular host memory, tracks the
>> > private/shared-ness of the memory, tracks which struct kvm the memory
>> > belongs to.
>> >
>> > guest_memfd functions as KVM's bridge to host memory. KVM already can
>> > ask guest_memfd for the pfn to map into stage 2 page tables, and already
>> > asks guest_memfd for the shared/private state of the memory. guest_memfd
>> > already also blocks the host from faulting guest private memory
>> > (mmap()-ing is always allowed).
>> >
>> >
>> > Instead of using dmabuf as the intermediary between the MMIO PFNs and
>> > KVM, why not use guest_memfd?
>> >
>> > What if we make guest_memfd accept a VFIO fd, or a dmabuf fd?
>>
>> This is interesting for pKVM too, provided it covers more than MMIO.
>>
>> We need guest_memfd to be backable by a dmabuf for ordinary guest memory, not
>> only for device MMIO. There is mobile hardware that doesn't tolerate scattered
>> private memory (DMA engines that can't gather, IOMMU page-table size
>> constraints), and a CMA-backed dmabuf heap is the practical way to get
>> contiguous memory at runtime.
>
> Why can't guestmemfd allocate directly from CMA? Allocating struct
> page memory through dmabuf just to put it back in a guestmemfd sounds
> very ugly to me.
>

I'd like to understand this use case better too, is using CMA through
dmabuf basically because CMA doesn't really have a direct userspace
interface? As in, for HugeTLB there's fd = memfd_create(HUGETLB) and
HugeTLBfs fds, but not CMA?

I did hope for this API shape to extend beyong VFIO and HugeTLB to
anything that has an fd today, but Frank did bring up the counter point
that not all memory has an fd.

>> HugeTLB doesn't help, it wants boot-time
>> reservation. Those pages are struct-page backed, so it's a different problem
>> from the non-struct-page MMIO case, and the shared parts still need to be
>> GUP-able.
>
> Isn't dmabuf pretty allergic to mmaping refcounted struct page backed
> memory since that wrecks its lifetime model?
>
>> More important for the API shape: conversions have to work on subsets of such a
>> region, at page granularity. A pKVM guest doesn't know what backs its memory, so
>> it will issue share/unshare hypercalls over arbitrary ranges of whatever it was
>> given.

For my future reference, does this mean for the CMA case, some page
splitting on conversion to shared (so each page can have its own
refcount to track users) will be necessary? (and merging)

>> If a dmabuf-backed guest_memfd can only be converted as a whole, we can't
>> use it for memory, and the guest can't be taught to care.
>
> More reasons not to involve DMABUF since guestmemfd already does all
> of this...
>
> Jason
