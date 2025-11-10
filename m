Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35F302EB87F
	for <linux-coco@lists.linux.dev>; Mon, 10 Nov 2025 11:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762775580; cv=none; b=tnlijVu4Vyx9UbWVdj5g861S319qSMPHH2ZAu5Xscqg9nMYb8IELLr/gTn0gkbgg/H0B9Z++hkmWpIWpiSkTdeojuVTor3aDtgC1zUCcx3wbJjp5Z5TzS7J5JqihNwJxFPmXCAeYvjivNVmBjt+ZNnB5r9Awyy1kfz4isqj5pl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762775580; c=relaxed/simple;
	bh=UInVXx6PfxMGWatXk87n8xA//u7uJm12qA+8CDGNxIQ=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cTWrGOesjF1yJIxSrYGRXWK1dpukeknjlAkFy0J1i9I1wxG5j5DLA5HXmW12RRpv/ClVpAOQ9tDAuBcq/yNARb/x+NaHqSWD7eKaomeAvRXqxDdmHPzwQ8yoa57HJ99CsOSJ/duwhgvAGqCHNQ65hfkF3MQeeHbnO1BnrKkRwzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4d4p1m2PNtzJ46h2;
	Mon, 10 Nov 2025 19:52:28 +0800 (CST)
Received: from dubpeml100005.china.huawei.com (unknown [7.214.146.113])
	by mail.maildlp.com (Postfix) with ESMTPS id 85A05140257;
	Mon, 10 Nov 2025 19:52:57 +0800 (CST)
Received: from localhost (10.203.177.15) by dubpeml100005.china.huawei.com
 (7.214.146.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Mon, 10 Nov
 2025 11:52:56 +0000
Date: Mon, 10 Nov 2025 11:52:55 +0000
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: <dan.j.williams@intel.com>
CC: <linux-pci@vger.kernel.org>, <linux-coco@lists.linux.dev>,
	<bhelgaas@google.com>, <aneesh.kumar@kernel.org>, <yilun.xu@linux.intel.com>,
	<aik@amd.com>
Subject: Re: [PATCH 3/6] PCI/IDE: Initialize an ID for all IDE streams
Message-ID: <20251110115255.000010f3@huawei.com>
In-Reply-To: <690be315ed059_74f761007a@dwillia2-mobl4.notmuch>
References: <20251105040055.2832866-1-dan.j.williams@intel.com>
	<20251105040055.2832866-4-dan.j.williams@intel.com>
	<20251105152704.00002741@huawei.com>
	<690be315ed059_74f761007a@dwillia2-mobl4.notmuch>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: lhrpeml500009.china.huawei.com (7.191.174.84) To
 dubpeml100005.china.huawei.com (7.214.146.113)


> > > ---
> > >  drivers/pci/pci.h       |   2 +
> > >  include/linux/pci-ide.h |   6 ++
> > >  include/linux/pci.h     |   1 +
> > >  drivers/pci/ide.c       | 133 ++++++++++++++++++++++++++++++++++++++++
> > >  drivers/pci/remove.c    |   1 +
> > >  5 files changed, 143 insertions(+)
> > > 
> > > diff --git a/drivers/pci/ide.c b/drivers/pci/ide.c
> > > index d7fc741f3a26..33b3c54c62a1 100644
> > > --- a/drivers/pci/ide.c
> > > +++ b/drivers/pci/ide.c

> 
> > > +}
> > > +
> > > +static bool claim_stream(struct pci_host_bridge *hb, u8 stream_id,
> > > +			 struct pci_dev *pdev, u8 stream_idx)
> > > +{
> > > +	dev_info(&hb->dev, "Stream ID %d active at init\n", stream_id);
> > > +	if (!reserve_stream_id(hb, stream_id)) {
> > > +		dev_info(&hb->dev, "Failed to claim %s Stream ID %d\n",
> > > +			 stream_id == PCI_IDE_RESERVED_STREAM_ID ? "reserved" :
> > > +								   "active",
> > > +			 stream_id);  
> > 
> > Good to have a comment on why we carry on anyway.  
> 
> ...but we do not carry on. When claim_stream() fails pci_ide_init()
> fails. So this dev_info() is there to clue in an admin wondering why IDE
> capabilities may not be available for some devices.

Ok. Failure isn't an error as such, but stuff just doesn't get set up.
Fair enough.


> > > +	if (!reserve_stream_id(hb, stream_id))
> > > +		return NULL;
> > > +
> > > +	*sid = (struct pci_ide_stream_id) {
> > > +		.hb = hb,
> > > +		.stream_id = stream_id,
> > > +	};
> > > +
> > > +	return sid;
> > > +}
> > > +DEFINE_FREE(free_stream_id, struct pci_ide_stream_id *,
> > > +	    if (_T) ida_free(&_T->hb->ide_stream_ids_ida, _T->stream_id))
> > > +
> > >  /**
> > >   * pci_ide_stream_register() - Prepare to activate an IDE Stream
> > >   * @ide: IDE settings descriptor
> > > @@ -313,6 +427,7 @@ int pci_ide_stream_register(struct pci_ide *ide)
> > >  {
> > >  	struct pci_dev *pdev = ide->pdev;
> > >  	struct pci_host_bridge *hb = pci_find_host_bridge(pdev->bus);
> > > +	struct pci_ide_stream_id __sid;
> > >  	u8 ep_stream, rp_stream;
> > >  	int rc;
> > >  
> > > @@ -321,6 +436,13 @@ int pci_ide_stream_register(struct pci_ide *ide)
> > >  		return -ENXIO;
> > >  	}
> > >  
> > > +	struct pci_ide_stream_id *sid __free(free_stream_id) =
> > > +		alloc_stream_id(hb, ide->stream_id, &__sid);  
> > 
> > Given the use of __sid as magic storage, I wonder if this can
> > be a CLASS with that storage wrapped up alongside a flag
> > we clear to make the destructor a no op. Similar to what happens for
> > spin_lock_irqsave where we stash flags etc via __DEFINE_UNLOCK_GUARD() 
> > 
> > Would need something a little more complex than current retain_and_null_ptr()
> > as it would need to set _T.ptr = NULL rather that _T = NULL.  
> 
> Interesting. It is rare to have this kind of request model in core code.
> Most of the "discover the platform published resource + request it"
> happens in driver probe contexts and devm cleanup is available for that
> (e.g.  devm_request_mem_region()). If we can find more users for such a
> scope-based-cleanup model I would cheer on the person that wanted to
> take that on.
> 
> Otherwise the "magic storage" approach is also taken with:
> 
>     struct stream_index __stream[PCI_IDE_HB + 1];
>     ...
>     alloc_stream_index(..., &__stream[...]);
> 
Agreed. Potentially this is something for another day. 

Jonathan


