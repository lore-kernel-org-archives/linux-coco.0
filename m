Received: from out-173.mta0.migadu.com (out-173.mta0.migadu.com [91.218.175.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4D534071E9
	for <linux-coco@lists.linux.dev>; Thu, 30 Jul 2026 11:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785409300; cv=none; b=BJDxDkh4bcafkYl/Vu1Wx4/Vc5/MX/f8OfXOvqaCRPGew6dklugjesZ+jswvylXaRCk/wQaDgJ88eYy+fOPSajw8oY8l4MzxNTQ3r3TNsOutZD/Zm0UUjEclPmIuwmXJwer8/wvU/EWde1FI2Gryj1EezZtuvl8gVbvYau7J8eM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785409300; c=relaxed/simple;
	bh=MTbnHVaGs+oJ8/iRE8SGUTfgRyNeD2t1YHYfV3s4MaU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lP35IcUIMbQyH/lO/j7zSYSGq/Zj0CMJmOXkQEtV3x0t6iGjUGF0fUJtnySavAjG/cJeahe3BsUQETT/aST8sOTDuuq+Fhhh0iiD7KC72Q+CfrEPmLpRByFJq7Fk/kTtHSrgQzFiY/UrSWBMvHxyEYgzM1s6vRwDc61B1fCB06I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=GoBTe6eN; arc=none smtp.client-ip=91.218.175.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="GoBTe6eN"
X-Forwarded-Encrypted: i=1; AHgh+Rqpsjr0jVQjF5pvp8weIsRiEeGqH3bAo7zvKxQXa9rIIyqsPIWItG42yPhpSDvLD6bCNhWpvtEN7+NA@lists.linux.dev
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1785409296;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=e/kRpQrpUg02tctY6yhu6jWBSJHpdY77PwAU3jL1bxM=;
	b=GoBTe6eN7veQEHal0hk+10POM/dxyAo8SpbineZakun/HtQyfay7U42NR5/RYJ5zAZ115v
	rJ/isKUH9jqp3HoE+ZVHqlkjRfes0A/B8s9mrhnadowZbqzTHOhCR9xRFTVimNwqAHNBji
	n8rsEtecqfPmlag8Fcivdd01n/kzJOo=
X-Gm-Message-State: AOJu0YyBxJ3KEr+7wf7/9JwYJITHPs2THRnlZ/XkTYPocz6Abvffy1hh
	XJPm7MZihouvNIc4WycV/wrX/8Q18Vw40L6lLb9XR2PDmYHv0jwIGRjOlyjLo2fhaNv6p467twE
	El988Yx39Vj+U/ijw81bGPkaYnbqJRKxhsfnj2PND
X-Received: by 2002:a05:622a:684e:20b0:517:5ac7:332e with SMTP id
 d75a77b69052e-52b3933f844mr9328641cf.6.1785409276641; Thu, 30 Jul 2026
 04:01:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250529053513.1592088-1-yilun.xu@linux.intel.com>
 <20250529053513.1592088-11-yilun.xu@linux.intel.com> <20250602133009.GC233377@nvidia.com>
 <CAEvNRgFpJWQ5M5sQhGpQUV3GbBq9N+MQhhaxdxa=D8ky94SCsw@mail.gmail.com>
 <20260712221934.GF674038@nvidia.com> <CAEvNRgEo2kLUmaGU-Vsgx2sTQvU_NNUJ4bRp5Z4Ygs_xvVLOYA@mail.gmail.com>
 <amcdueQI1voXWPQb@yilunxu-OptiPlex-7050>
In-Reply-To: <amcdueQI1voXWPQb@yilunxu-OptiPlex-7050>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Thu, 30 Jul 2026 12:00:39 +0100
X-Gmail-Original-Message-ID: <CA+EHjTz82R_hJXHfPG2OLqkB9kVq1=exE_9Cn=2GXQYpbtaBkQ@mail.gmail.com>
X-Gm-Features: AUfX_mze5Bz4sCJxR7dQfrTfBjLkX9Ma4V02Tb4h9t58N81ewiYYgPohtp6A6lI
Message-ID: <CA+EHjTz82R_hJXHfPG2OLqkB9kVq1=exE_9Cn=2GXQYpbtaBkQ@mail.gmail.com>
Subject: Re: [RFC PATCH 10/30] vfio/pci: Export vfio dma-buf specific info for importers
To: Xu Yilun <yilun.xu@linux.intel.com>
Cc: Ackerley Tng <ackerleytng@google.com>, Jason Gunthorpe <jgg@nvidia.com>, kvm@vger.kernel.org, 
	sumit.semwal@linaro.org, christian.koenig@amd.com, pbonzini@redhat.com, 
	seanjc@google.com, alex.williamson@redhat.com, dan.j.williams@intel.com, 
	aik@amd.com, linux-coco@lists.linux.dev, dri-devel@lists.freedesktop.org, 
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
	vivek.kasireddy@intel.com, yilun.xu@intel.com, linux-kernel@vger.kernel.org, 
	lukas@wunner.de, yan.y.zhao@intel.com, daniel.vetter@ffwll.ch, 
	leon@kernel.org, baolu.lu@linux.intel.com, zhenzhong.duan@intel.com, 
	tao1.su@intel.com, linux-pci@vger.kernel.org, zhiw@nvidia.com, 
	simona.vetter@ffwll.ch, shameerali.kolothum.thodi@huawei.com, 
	aneesh.kumar@kernel.org, iommu@lists.linux.dev, kevin.tian@intel.com
Content-Type: text/plain; charset="UTF-8"
X-Migadu-Flow: FLOW_OUT

On Mon, 27 Jul 2026 at 10:03, Xu Yilun <yilun.xu@linux.intel.com> wrote:
>
> > > If VFIO can create one
>
> It is an interesting idea to let VFIO create a guest_memfd instance, if
> DMABUF doesn't work. But to achieve this goal, I think we still need to
> refactor guest_memfd to allow for different memory/MMIO resource
> exporters/creators, and different resource importers/users like KVM MMU
> & IOMMUFD.

I don't have a strong view on which side creates the fd, and the
argument that MMIO lifecycle belongs to VFIO makes sense to me. But
the refactor you describe is the part I'd like to make sure we get
right for the non-MMIO case, because pKVM needs ordinary guest RAM to
keep working through it.

Two properties we depend on today, both of which are easy to lose if
guest_memfd grows an exporter abstraction designed around MMIO:

Conversion has to stay page-granular on subsets of a region. A pKVM
guest shares and unshares ranges with hypercalls and has no idea what
is backing them, so we can't require whole-region transitions. This is
fine for assigned MMIO, where the shared parts are static, but it
isn't a property we can give up for memory.

Shared pages have to stay mmapable by the VMM and GUP-able through
those mappings. That's what the VMM does I/O on. It's the reason a
CMA-heap dmabuf turned out not to work for us, since that mmap path is
VM_PFNMAP.

So my suggestion is narrow: if guest_memfd grows a notion of an
external exporter, could the memory case keep going through the normal
guest_memfd allocation and mapping paths, rather than being folded
into whatever form the MMIO case needs? I'm not asking for anything
new here, just that the refactor not quietly close the door.

Cheers,
/fuad



> > At guest_memfd creation time, guest_memfd is always created for a
> > KVM. This is the first place where it is bound to a kvm instance. This
> > is one place where it helps Yilun with Confidential VMs, so KVM can be
> > sure that the memory was meant for a specific CoCo kvm and not any VM.
> >
> > I think it might be weird to have VFIO take a kvm fd to create a
> > guest_memfd?
>
> I think having VFIO create a guest_memfd is better than having KVM
> create a guest_memfd on behalf of VFIO.
>
> The lifecycle of the MMIO resources should be managed by VFIO, cause
> the availability of these MMIO resouces are impacted by device
> operations, e.g., device reset, PCI Memory Space Enable (MSE) ...
> You can't export MMIO resources to KVM MMU without VFIO's awareness.
>
> And VFIO doesn't have to take a kvm fd paramter to create a guest_memfd,
> VFIO has got the kvm instance via KVM_DEV_VFIO_FILE_ADD.
>
> >
> > I was thinking that the userspace VMM could do something like:
> >
> >   int vfio_fd = open("/dev/vfio/devices/vfio0");
> >   int gmem_fd = ioctl(KVM_CREATE_GUEST_MEMFD, { .fd = vfio_fd });
>
