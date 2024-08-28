Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23C421AD418
	for <linux-coco@lists.linux.dev>; Wed, 28 Aug 2024 23:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724888565; cv=none; b=kfOrAP38gtV/f8rTCbgjUvMCLyc29YIhccJN3meCsAY8RWrwYv3IruEAS63OUcQSSsZ6JeTNMw//+HNdtDmVubSfUGvK/BlLlv86Wegm1JrUJA/5AkmhXbYO9s9uY+wbqDQ8ZB97BPVoSP8fxcYIfyjxbFOYWEYAOnPV4vYWR/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724888565; c=relaxed/simple;
	bh=W5uolkqDwgsWdSean2w7EiUZlwf6BZ0RGmrOWG3KAts=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IpXzS8ZxAkK+Z7AIF6wgciU5P9AhumIDN+tQHgAhqxeE1jCxuBA0y7W9Wz7pqwRhfBk6texVpSEHzL8XGLICC4qOf9+2DOVY8AXlXIxjlOjRZIQ57+R/u6mksed8R1dcOYa9A3jmgZJLYhKMYS5uk/NxX1Lyxt+hCWXuxRHWLPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=J/SwSwEk; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="J/SwSwEk"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-4567ec27dd7so116461cf.2
        for <linux-coco@lists.linux.dev>; Wed, 28 Aug 2024 16:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1724888562; x=1725493362; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0rwIUi17tsjeH1VmJPms0B2GoXRPH3G8D0KT2rkLg3Y=;
        b=J/SwSwEkI4ZviAyDeje2E9LsmRigoKtlUJ+rP+QgtbVzgDGwlBrdp4yVLPRApqMvib
         F6y/6KtzXB7g72T6h3h3BZLAaO60wnFybNglmJkbDA9CBovL2jVW91f+igR1apKXcWGx
         hvUCUw2Eq+4Y5E7PpMS1+YYMFk8Y229/6MAy0nMbRq/s6xCYVe0N9HcSM29JCBrmNrCl
         dmncgvj2PmgAn7RC+tBL1sgcHEo0/EoC8h09W3o/KpfRcHJiYGm+pBJe3nEhXvYvya8a
         PSgkqLWGgXxJHfxpJzsq59ytvuzt/OeyiUKnPFil+JPVyrEjM8ZAxH89cUEEBgfOi19W
         Mlzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724888562; x=1725493362;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0rwIUi17tsjeH1VmJPms0B2GoXRPH3G8D0KT2rkLg3Y=;
        b=TGrTs1JRpdCVG5WGP4I30Hm5pqwPgVKI/QEL1gKjJeg5m+z/qC4/PnUZM2vGIQnIGb
         VW4DzuAbAM/6GUcO8wujoZBku61Z+kGF3AksIDO3W9d2NJNgK+s0I+WTADgv1Oh9XqHS
         uAzqCInBI2BKKtQ086fEK8ImK3N7WcFyN2wq2p+B/IPVCd09R7WRW65dOoq08h5K4orY
         nlNSWuzb6hhs+Jw80UnurPhD3BXoNh4zPB0ywYSWl92tNYMeZcV7UzgZzBCbSO5PNpW5
         tKyQgrzkGKAGAeoiwmjfBqFUkRz1HYEZi4MkqTQTCkPD/yAOneirJQoEj7ITGIaucR9q
         M9GA==
X-Forwarded-Encrypted: i=1; AJvYcCWM7LeG0Kygq+apnw1vNglWjjolpso1b1swC2uT2EnXCYCAeugdZtZa203pfnF3IyKNZF26I0zYYX+b@lists.linux.dev
X-Gm-Message-State: AOJu0YwC8xDEulT9bsI+R4zknDd1D489h7gKXhfFaa3yIa8nC7IPeHUW
	SBtpaSMYm3+C/BF73QVld1Qlc5GJgD7PeTXb8/+DpxxZKW+hrBRx4Nwkst86F0I=
X-Google-Smtp-Source: AGHT+IHEcKouyVFR1WkcCDWhLufxB/kd0gjuitct1+jIU+BLxqDtsKTkt3UjERwCooXxsxHYmrhtIA==
X-Received: by 2002:a05:622a:548d:b0:456:8172:972c with SMTP id d75a77b69052e-4568172981dmr4371791cf.5.1724888561761;
        Wed, 28 Aug 2024 16:42:41 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-68-80-239.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.80.239])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-45682d97716sm169421cf.85.2024.08.28.16.42.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2024 16:42:41 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1sjSJE-006MUq-9P;
	Wed, 28 Aug 2024 20:42:40 -0300
Date: Wed, 28 Aug 2024 20:42:40 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Alexey Kardashevskiy <aik@amd.com>
Cc: kvm@vger.kernel.org, iommu@lists.linux.dev, linux-coco@lists.linux.dev,
	linux-pci@vger.kernel.org,
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	Dan Williams <dan.j.williams@intel.com>,
	pratikrajesh.sampat@amd.com, michael.day@amd.com,
	david.kaplan@amd.com, dhaval.giani@amd.com,
	Santosh Shukla <santosh.shukla@amd.com>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Michael Roth <michael.roth@amd.com>, Alexander Graf <agraf@suse.de>,
	Nikunj A Dadhania <nikunj@amd.com>,
	Vasant Hegde <vasant.hegde@amd.com>, Lukas Wunner <lukas@wunner.de>
Subject: Re: [RFC PATCH 07/21] pci/tdisp: Introduce tsm module
Message-ID: <20240828234240.GR3468552@ziepe.ca>
References: <20240823132137.336874-1-aik@amd.com>
 <20240823132137.336874-8-aik@amd.com>
 <20240827123242.GM3468552@ziepe.ca>
 <6e9e4945-8508-4f48-874e-9150fd2e38f3@amd.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6e9e4945-8508-4f48-874e-9150fd2e38f3@amd.com>

On Wed, Aug 28, 2024 at 01:00:46PM +1000, Alexey Kardashevskiy wrote:
> 
> 
> On 27/8/24 22:32, Jason Gunthorpe wrote:
> > On Fri, Aug 23, 2024 at 11:21:21PM +1000, Alexey Kardashevskiy wrote:
> > > The module responsibilities are:
> > > 1. detect TEE support in a device and create nodes in the device's sysfs
> > > entry;
> > > 2. allow binding a PCI device to a VM for passing it through in a trusted
> > > manner;
> > 
> > Binding devices to VMs and managing their lifecycle is the purvue of
> > VFIO and iommufd, it should not be exposed via weird sysfs calls like
> > this. You can't build the right security model without being inside
> > the VFIO context.
> 
> Is "extend the MAP_DMA uAPI to accept {gmemfd, offset}" enough for the VFIO
> context, or there is more and I am missing it?

No, you need to have all the virtual PCI device creation stuff linked
to a VFIO cdev to prove you have rights to do things to the physical
device.
 
> > I'm not convinced this should be in some side module - it seems like
> > this is possibly more logically integrated as part of the iommu..
> 
> There are two things which the module's sysfs interface tries dealing with:
> 
> 1) device authentication (by the PSP, contrary to Lukas'es host-based CMA)
> and PCIe link encryption (PCIe IDE keys only programmable via the PSP);

So when I look at the spec I think that probably TIO_DEV_* should be
connected to VFIO, somewhere as vfio/kvm/iommufd ioctls. This needs to
be coordinated with everyone else because everyone has *some kind* of
"trusted world create for me a vPCI device in the secure VM" set of
verbs.

TIO_TDI is presumably the device authentication stuff?

This is why I picked on tsm_dev_connect_store()..

> Besides sysfs, the module provides common "verbs" to be defined by the
> platform (which is right now a reduced set of the AMD PSP operations but the
> hope is it can be generalized); and the module also does PCIe DOE bouncing
> (which is also not uncommon). Part of this exercise is trying to find some
> common ground (if it is possible), hence routing everything via this module.

I think there is a seperation between how the internal stuff in the
kernel works and how/what the uAPIs are.

General stuff like authenticate/accept/authorize a PCI device needs
to be pretty cross platform.

Stuff like creating vPCIs needs to be ioctls linked to KVM/VFIO
somehow and can have more platform specific components.

I would try to split your topics up more along those lines..

Jason
