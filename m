Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E94F7489FBC
	for <linux-coco@lists.linux.dev>; Thu, 10 Sep 2026 12:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789044398; cv=none; b=oSWx/Az2O7qd88ilw17V+oIg8Nc38jNSYCIQL9pQ/EQMJAfDF1jXS0O1oWk1FU+V0g2MsJRbWPmq5zotRs7kuTn5ZE4si8SMv5Ds/xOQehJa1Qq2NwvsxfpkA365mnW23pOJIGhKRZeHrLEn7ym1xozSR/IDoSpmP6t7BJe4y08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789044398; c=relaxed/simple;
	bh=BHjSrs+Mxio25cWIAgxeq9qg9MSFeun0di9yy9+Eyro=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WfjLP5bE+7aA5eSDNjPcldhMBKXC5apSR/z9K//tnkcrBS4wfHCjCrnI8ZnmLwU26K7K09zuLlsbWrg2eovfMIpJswXbedeyS7QS6YrICMDHXe1ziV8tk+iClc+n9bOM4QNO+y2GoL/aiot2gEEfsFRdr8KGKT2kRHTEVcgpDB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=lttFIk6j; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="lttFIk6j"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-90e7fd978beso112966706d6.1
        for <linux-coco@lists.linux.dev>; Thu, 10 Sep 2026 05:46:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1789044395; x=1789649195; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Y0IKNLxM5TSX9mM0DsyrNhze53zUnc7LA/ctMt4Lh+M=;
        b=lttFIk6j3BiKlafEl4QBzeTid+9h+vSYiBYgKMpnZR5aGNmaewjAUJ5MGcxeROXjhp
         wEkbVMk5hSqZwmyzVBYNOsUOdHGrHffkYUkIxrzDK4jBcVda+unv+F4dqIIUvr4Oe/w3
         oGw6T6KU44/SviDEklm4u0UT7wctspwADioOZQs4rHa+85vyAxi0yRwgqkE4+Vdr/SSj
         jCk7czi+n3+lu1qBKi4h40WG8MF9ZkpVY9ulMSE5hOM7hYszmabl3jb9gdDk8iOD0zDQ
         G/CENJcnakdWOhg6M53O4TzD9YwH9WY22woHXXfnArvpbKXnAbjqB+eTFKPYMwDEE7BU
         JT2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789044395; x=1789649195;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y0IKNLxM5TSX9mM0DsyrNhze53zUnc7LA/ctMt4Lh+M=;
        b=Fta1TkavOUldYmHFjMZxKrrOgw9mulkHa9TgQoP7aIAgMfYa62BtDiLNs87x7OLile
         TM7BEehMlVSwyuQ9qoX3eisBr0gZE+K7WbkEyYdfVoW/tWcyiMVDDYK+KpCMSJVU45Gf
         2nB96mu5DXlwkwWnVOUWGAkGhV7ugeK6QyyYcJVXUsTmW2eo3oN29Cgrf6Qc5iV4jzzQ
         mxR6ojMff73cGi5DDLP1z9D+V56+rM9NJrOxg+LgWGC7suEuAJYpfbDqzMlep6reJsrs
         TsKp/MWPR2UuvWm7JJLG7Tq822eM++1w5kG2sd0JE6DUMBhqBc258gqEZ2OXzAbOHphy
         j6KA==
X-Forwarded-Encrypted: i=1; AKwUvBxE3cOYt3uIEpKNHv5IKRRgxqfmSzcTy5wGullppCZUKFy+mrCYhmgnE0WxehjL43G5t3eb7w3C2Kh5@lists.linux.dev
X-Gm-Message-State: AFuF++lwiRHOcRhaPRzQKfTox1PshEE8jO1DEzxlUVX+A6FCpO9g1j9J
	ji4m6Ik8EiI5zoVO1Wn2lZ+VNB3jt68mH72tX5/RNrrhpAqXdwl4m0koL5PJGA60zow=
X-Gm-Gg: AYBFou0x+UNoUHDzY8TuqOmCfwo9iG8Ayn7A3cXosh1kmZhfESXrQj4RI0FlwD6JHrx
	4DBXZpHoNTiPAdI5v17D9ykJh3EVbjPiWPW28g8s6vsj+4zykdL6crWInUtFMPf4hLE+Yrismsu
	iidAs0MSrB2M0Krh79mPHW8t0yGEkCV2fJ3nuEsJW+idnf6JCQsRy8OLbX0P3yF15LPh5WEuyRv
	gFV4cPjnX3Y4d4PQghEad6jFhxVjV4owhUOFQFIUKAQXMuGuZnplV9BpRwFn0W137Tl3gansRZf
	Q+pvaYoBC7/OKSuVFPvs5ZM9l3Iv7997qy6LtJzQ1RMj1BVx6Md4dYoDlfhnc6Qa9oZX3T5JU2U
	ZYp9VfVDZ1MMjXa92zczesvwZflTVswapMMxrzqbOgP2GUsA0gJHQW41dTXb/RLlTShy2z57U5x
	qc5EyndJs3easTt4M4Yx8KdOwWFAhiZPAuhSA3yGbK2x3IyZedowxTA1GkAGPlKcmEFt+N617Yl
	iiaLOA0rjmGpVpCIl8GF4uSzNq1RpdjaUICmLzCuIkllWFKy+or9gmJaXm7iajyNI4=
X-Received: by 2002:a05:6214:d89:b0:910:4b85:a298 with SMTP id 6a1803df08f44-9104b85a587mr381394946d6.26.1789044394511;
        Thu, 10 Sep 2026 05:46:34 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9104059615dsm168922596d6.3.2026.09.10.05.46.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 05:46:33 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1x4eAi-00000002O5s-42fb;
	Thu, 10 Sep 2026 09:46:32 -0300
Date: Thu, 10 Sep 2026 09:46:32 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Tian, Kevin" <kevin.tian@intel.com>
Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	Nicolin Chen <nicolinc@nvidia.com>,
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
	"kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Alexey Kardashevskiy <aik@amd.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Joerg Roedel <joro@8bytes.org>, Jonathan Cameron <jic23@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Pranjal Shrivastava <praan@google.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Samuel Ortiz <sameo@rivosinc.com>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Will Deacon <will@kernel.org>, Xu Yilun <yilun.xu@linux.intel.com>,
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Subject: Re: [RFC PATCH v4 03/16] iommu/arm-smmu-v3: Add initial pSMMU realm
 viommu plumbing
Message-ID: <20260910124632.GB4083318@ziepe.ca>
References: <yq5aik4nztdt.fsf@kernel.org>
 <yq5aecfbzjyk.fsf@kernel.org>
 <20260902235609.GG2890729@ziepe.ca>
 <yq5a8q5izxz4.fsf@kernel.org>
 <20260903171704.GK2890729@ziepe.ca>
 <yq5acxupjsy2.fsf@kernel.org>
 <20260907125228.GB667892@ziepe.ca>
 <yq5atsnyag84.fsf@kernel.org>
 <20260909124628.GH2543240@ziepe.ca>
 <CO1PR11MB4835512E374074A5F4AD0A6C8CBF2@CO1PR11MB4835.namprd11.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CO1PR11MB4835512E374074A5F4AD0A6C8CBF2@CO1PR11MB4835.namprd11.prod.outlook.com>

On Thu, Sep 10, 2026 at 09:52:12AM +0000, Tian, Kevin wrote:
> > The mmio is owned by vfio, there should be a handshake in VFIO to
> > remove mmio when it becomes private, otherwise I don't think we need
> > to do anything more?
> 
> for TDX a callback in VFIO is invoked to revoke the dmabuf.
> 
> btw I didn't see any dmabuf related in this series (even in a hackish
> way as Yilun sent out last year). Is it not required by CCA or just
> skipped now waiting for the framework to be settled?

I think just one step at a time :\ I think CCA needs it as well, you
also cannot safely leave private MMIO floating around the host
userspace on CCA.

> So viommu will become the abstraction point for tsm operations and
> directly talks to the tsm driver instead of going through the merged 
> tsm_ops (bind/unbind/guest_req).

More precisely for what was being called the TDI - ie it is the
abstraction point for the host side of a guest virtual PCI device.

iommufd vdevice already represents this, so we use it again.
 
> currently what tsm_ops provides additionally is more about synchronization
> with connect/disconnect, otherwise just calls into underlying tsm driver. As
> long as viommu creation holds a reference to tsm then disconnection is
> blocked then it's safe.

Yes, this already has to be true or our lifecylce model is
nonsense. Once the iommufd creates the vdevice the guest is running
and we cannot disconnect it without unplugging it from the guest. Thus
the locking can rely on that. Within an iommufd ioctl context the vdev
and underlying connection must be stable.

> and IOMMU_VDEVICE_TSM_BIND will be removed. 

Replaced, the same logical operations should flow through the viommu
command ioctl

> Seems originally this series
> does SMC_RMI_VDEV_CREATE and SMC_RMI_VDEV_LOCK both in tsm
> bind op. Then the proposal is moving them all to vdevice creation time so
> no separate bind step is required.

Hmm, lock still should be guest visible on CCA, and the device has to
start up in the guest as TDISP unlocked. I'm not 100% on the RMI side
of the flow, but this does not look right.

VDEV create should be done before the realm is started. We need this
setup right because Linux VM is going to validate the vdev during boot
if it is affiliated to a vSMMU. lock should be done only when
requested by the guest. The guest must start with a normal unlocked
T=0 PCI device.

> Does it mean that ARM CCA is essentially an early-bind model i.e. the TDI
> starts in locked state from guest p.o.v.?

No

> but https://lore.kernel.org/all/yq5aecfbzjyk.fsf@kernel.org/ seems to indicate
> that guest_req() still handles the bind request from the guest:
> 
> "
> - cca_tsm_guest_req() now handles TSM_REQ_SET_TDI_STATE requests for
>    the unlocked, locked, and running states.
> "

Right the guest side request to lock should come that way.

> 
> a bit confusing, but maybe due to stale info cited from different timing...
> 
> for TDX we're currently pursuing a late-bind model (i.e. TDI starts in shared
> state in guest), so a separate bind interface is still necessary. We could look
> at whether it should be an explicit @bind viommu op or carried by 
> @guest_req (say, if most preparation works can be moved to vdevice creation).

It should go over the viommu command ioctl. It looked like there was
alway some iommu specific format to the command in the tsm version of
this, so that is the appropriate way.

> btw per past discussions VFIO should block some operations (reset, etc.)
> while a TDI is locked. Do we expect a callback into VFIO to notify the locked
> state, or require VFIO's own interface to place a cdev into a special state
> which prevents sensitive operations even before binding it to iommufd
> (and allow creating TDI vdevice only on such idevice)?

At a minimum I think we have to synchronize with vfio, somehow, that
when the device enforces its private MMIO so it can unmap it. Thay may
be an argument we need a few standard viommu ops so the core code can
capture lock/unlocks and do this prep work. Or maybe a special cdev
state is simpler.

This should be figured out before any uapi is settled.

I don't know about reset, that sounds like something the pci core
should deal with?

Jason
