Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793248141;
	b=VxRuxd3Iz5SDz+2MNpyoTexv4K0bHWoMdNNIt5oH7sK54Jr2z6MGFcmm9/XvGeFjwtXW
	 /eeYQXJK/WQUjaVuOwM9YEEipwmUZexpTHIodguzUgxYfduFs2K5kVBNpgD+noGomxOC7
	 WIM4aaP5dpzLJAnc5+lv4TvGIDOr8mAWGqw/RsmmcAgDhqtG60RkPCaE4g5OhbhsIpASS
	 vUeC38tx+WR5vefJIgTdaRYBZWyrSzmVCOoLTfFdmZTXdxoJ15lEIuvjhDRQFE586YjJE
	 TyCzNWdlxGX6YG6vagJShVAnFevpxvg9PYngqFAsjkweW9vpZn91a2clbdb6Ot1jkHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793248141;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=rzYTe3CAmln9p4nHbX2TG5gIE9RDWcbeR5wsihoOolA=;
	b=JWLnfZRzA4LJvWMFzkjgopLwIrsAAnQu0Qbz7thgqeYPiGZ+sNuN3t/nfw+U2YMIhdLI
	 nI71+xbLCfibuw4zA1SDNAej3cRpSY4/CUgvZ4a9nim7C7KlNO3aoZrXEk07b4TWuKoyE
	 5EOc0fzW1K3wdYyccuqMkpZPa7C0WhUpD66IyqH3k13Qx331gt2IjVK5wurRnCVTz2k+h
	 pEYWNHOnkx3j5ZunNZWw78MTtZg0scb8+zgZDnmXTaG1MQnE8dEcU752ABN90kI9pmRcq
	 CuchbrlcceCtRWPOz5b0DBBVd1FevGuNdlxlBUOpCbQY4NjQSRq5mmzjYrrj4vAlWIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mVFqIl7i;
	arc=none smtp.remote-ip=192.198.163.9
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63068606A31D;
	Thu, 29 Oct 2026 04:29:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63068606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mVFqIl7i
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793248140; x=1824784140;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Jwzke+C5vjNMWt9GhijAMYGap9eff9wd25DcLISYkNM=;
  b=mVFqIl7iGKaU6y5yzwOWRTSpigVTMq6021gq5g+lUkPLc33FkD1KrtPA
   q6Ae0sJHopZaFv4n0E46U1YAInSyOHbKHqlim+01KVGaLLUH5H3J810lH
   yfEgwlazIGpLZSQa/f2n2nKxPPSbdvLzjjIC18ejwnRq9u7Gf7cmfCPrg
   0ZTV/SYoSwhwnHMJW5oBpkUOBohQUusSdZFfX2YGj02pGsG7ZqiwXczsE
   59ugmbNGhGL4K5kWGtfKseZ+9bmfmpwfONgr6586EFfc00h/JmT6mJ/j0
   tG1TWMfYTcbiCvWw9xc17utn6ciuxAyssqdVGsGEgC45Jm24WTAVgx68c
   Q==;
X-CSE-ConnectionGUID: q8+8PIImTSaVcwj1Sj8y1g==
X-CSE-MsgGUID: A79Kc930Q4+dLCBJhK/WwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="1864189"
X-IronPort-AV: E=Sophos;i="6.27,183,1787036400"; 
   d="scan'208";a="1864189"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2026 21:29:00 -0700
X-CSE-ConnectionGUID: osN9a3PLRlOOr9m7+NTyIg==
X-CSE-MsgGUID: mvmHAIL2QW2K62VmmX1+6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,183,1787036400"; 
   d="scan'208";a="5143691"
Received: from yilunxu-optiplex-7050.sh.intel.com (HELO localhost) ([10.239.47.46])
  by fmviesa002.fm.intel.com with ESMTP; 28 Oct 2026 21:28:59 -0700
Date: Thu, 29 Oct 2026 12:22:52 +0800
From: Xu Yilun <yilun.xu@linux.intel.com>
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Cc: Jason Gunthorpe <jgg@nvidia.com>, sashiko-reviews@lists.linux.dev,
	linux-coco@lists.linux.dev, kvm@vger.kernel.org,
	linux-pci@vger.kernel.org
Subject: Re: [PATCH v7 09/16] tsm: Remove the device from lookup before PCI
 teardown
Message-ID: <auLKHDLCg5XKDIWv@yilunxu-OptiPlex-7050>
References: <20261008055955.4014342-1-aneesh.kumar@kernel.org>
 <20261008055955.4014342-10-aneesh.kumar@kernel.org>
 <sashiko-outbox-163673@kernel.org>
 <yq5a33ub5lgt.fsf@kernel.org>
 <20261012130109.GK13920@nvidia.com>
 <yq5ald82q934.fsf@kernel.org>
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Post: <mailto:linux-coco@lists.linux.dev>
List-Help: <mailto:linux-coco+help@lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-coco+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <yq5ald82q934.fsf@kernel.org>

On Tue, Oct 13, 2026 at 02:19:03PM +0530, Aneesh Kumar K.V wrote:
> Jason Gunthorpe <jgg@nvidia.com> writes:
> 
> > On Mon, Oct 12, 2026 at 02:44:58PM +0530, Aneesh Kumar K.V wrote:
> >> sashiko-bot@kernel.org writes:
> >> 
> >> > Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> >> > - [Medium] tsm: race in tsm_register() error path leads to UAF and NULL pointer deref
> >> > --
> >> >
> >> > commit f9b77b7469552ae6078c3a47333908a88eec2474
> >> > Author: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
> >> >
> >> > tsm: Remove the device from lookup before PCI teardown
> >> >
> >> > This commit modifies the teardown flow to remove the TSM device from
> >> > lookup before tearing down the PCI state. It also adjusts the setup
> >> > flow in tsm_register() to handle PCI registration failures differently.
> >> >
> >> >> diff --git a/drivers/virt/coco/tsm-core.c b/drivers/virt/coco/tsm-core.c
> >> >> --- a/drivers/virt/coco/tsm-core.c
> >> >> +++ b/drivers/virt/coco/tsm-core.c
> >> >> @@ -56,26 +56,25 @@ static struct tsm_dev *alloc_tsm_dev(struct device *parent)
> >> > [ ... ]
> >> >> -static struct tsm_dev *tsm_register_pci_or_reset(struct tsm_dev *tsm_dev,
> >> >> -						 struct pci_tsm_ops *pci_ops)
> >> >> +static int tsm_register_pci(struct tsm_dev *tsm_dev, struct pci_tsm_ops *pci_ops)
> >> >>  {
> >> > [ ... ]
> >> >>  	tsm_dev->pci_ops = pci_ops;
> >> >>  	rc = pci_tsm_register(tsm_dev);
> >> >>  	if (rc) {
> >> >> +		tsm_dev->pci_ops = NULL;
> >> >
> >> > [Severity: Medium]
> >> > Does this unprotected write to tsm_dev->pci_ops introduce a race condition?
> >> >
> >> > If pci_tsm_register() returns an error early (e.g. if a driver incorrectly 
> >> > provides both link_ops and devsec_ops, returning -EINVAL before acquiring 
> >> > pci_tsm_rwsem), a concurrent userspace write to the connect sysfs attribute 
> >> > might trigger connect_store().
> >> >
> >> > If connect_store() evaluates is_link_tsm() concurrently, this lockless 
> >> > assignment to NULL on the error path could cause the compiler to reload the 
> >> > pointer after the NULL check. Could this lead to a NULL pointer dereference 
> >> > when accessing ->link_ops.probe?
> >> >
> >> >>  		dev_err(tsm_dev->dev.parent,
> >> >>  			"PCI/TSM registration failure: %d\n", rc);
> >> >> -		device_unregister(&tsm_dev->dev);
> >> >> -		return ERR_PTR(rc);
> >> >> +		return rc;
> >> >>  	}
> >> > [ ... ]
> >> >> @@ -96,15 +95,22 @@ struct tsm_dev *tsm_register(struct device *parent, struct pci_tsm_ops *pci_ops)
> >> >>  	if (rc)
> >> >>  		return ERR_PTR(rc);
> >> >>  
> >> >> -	return tsm_register_pci_or_reset(no_free_ptr(tsm_dev), pci_ops);
> >> >> +	rc = tsm_register_pci(tsm_dev, pci_ops);
> >> >> +	if (rc) {
> >> >> +		device_del(dev);
> >> >
> >> > [Severity: Medium]
> >> > Can this error path lead to a use-after-free if PCI registration fails?
> >> >
> >> > Since device_add() is called prior to tsm_register_pci() in tsm_register(), 
> >> > the device is already exposed via class_find_device(). If a concurrent 
> >> > connect_store() finds the device and proceeds to pci_tsm_connect() before 
> >> > this error path cleans it up, it will attach the PCI context to tsm_dev.
> >> >
> >> > When this error path calls device_del() and returns, the __free(put_tsm_dev) 
> >> > guard at the top of tsm_register() will drop the primary reference to 
> >> > tsm_dev, freeing its memory.
> >> >
> >> > Because the attached PCI context stores the pointer without taking an 
> >> > additional device reference, wouldn't this leave a dangling pointer in the 
> >> > PCI context, resulting in a use-after-free on subsequent accesses?
> >> >
> >> >> +		return ERR_PTR(rc);
> >> >> +	}
> >> >> +	return no_free_ptr(tsm_dev);
> >> >>  }
> >> 
> >> 
> >> I think this problem already exists upstream. We should delay
> >> device_add() until PCI/TSM registration succeeds. The kobject event
> >> should also be emitted after device_add(). I will add the fix as a
> >> separate patch.
> >
> > Sigh, trying to do all this stuff through sysfs makes such an
> > mess.. Nothing gets to be atomic in sysfs land so..
> >
> > It looks like this ordering is to ensure that when connect appears on
> > the pci device it can immediately be used with the tsm that triggered
> > it's creation. I'm not sure this is valuable but I haven't worked out
> > how a userspace is even supposed to exist with all these troublesome
> > races.
> >
> 
> The issue is theoretical and does not arise with a single link TSM
> driver. The PCI device's "connect" attribute is added only after
> pci_tsm_register() succeeds.
> 
> The race can occur when registering a second TSM. The "connect"
> attribute already exists, and userspace may try to connect using the new
> link driver, for example "tsm1". connect_store() then looks up ID 1 and
> can find the new tsm_dev in tsm_class because device_add() has already
> completed.
> 
> The proposed fix is to reorder registration so that device_add() is
> called last.

Yes, since the cleanup path is changed to:

 device_del()
 pci_tsm_unregister()
 put_device()

the initialization patch should be:

 device_initialize()
 pci_tsm_register()
 device_add()

> 
> ie, changes the sequence from:
> 
> 	rc = dev_set_name(dev, "tsm%d", tsm_dev->id);
> 	if (rc)
> 		return ERR_PTR(rc);
> 
> 	rc = device_add(dev);
> 	if (rc)
> 		return ERR_PTR(rc);
> 
> 	return tsm_register_pci_or_reset(no_free_ptr(tsm_dev), pci_ops);
> 
> to this.
> 
> 	rc = dev_set_name(dev, "tsm%d", tsm_dev->id);
> 	if (rc)
> 		return ERR_PTR(rc);
> 
> 	/* Complete PCI registration before exposing the TSM to class lookup. */
> 	rc = tsm_register_pci(tsm_dev, pci_ops);

Maybe we don't need the helper any more, open code pci_tsm_register(),
align with tsm_unregister(), seems clearer to me.

> 	if (rc)
> 		return ERR_PTR(rc);
> 
> 	rc = device_add(dev);
> 	if (rc) {
> 		if (pci_ops)
> 			pci_tsm_unregister(tsm_dev);
> 		return ERR_PTR(rc);
> 	}
> 
> 	/* Notify TSM userspace that PCI/TSM operations are now possible. */
> 	if (pci_ops)
> 		kobject_uevent(&dev->kobj, KOBJ_CHANGE);
> 

I'm good to the analysis and good to the fix. I was confused why the
original patch refactored tsm_register_pci_or_reset() with no functional
change. But with this proposal, the change becomes reasonable.

I haven't finished the series yet and am not sure why this fix is needed
in this series, how it affects the following patches. But it is a good
fix standalone.
