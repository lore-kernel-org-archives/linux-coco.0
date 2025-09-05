Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 586242FB092
	for <linux-coco@lists.linux.dev>; Fri,  5 Sep 2025 16:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757089383; cv=none; b=dcdogGWf5Y9D/EYyUmu8RI7XSTDQOLz7K9vq5ccULtXQsO3SK0JvyMpoi/xzJNDQlvnvLE3TfvhK8RfTvLNhmiFvkJl6vsQ7hoaf8SMzFUs/sscXLk8fZqsk37DHwB/X3ZLBEFETcPcmomovLAFJ1FZn7KEfic2flbbrpuH6vN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757089383; c=relaxed/simple;
	bh=FQ7VSQDMZ26MKHHuRF6ZOu5yejO3Qto6Ugr32kBm5c8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aJcsDjtOuw4IEHC8kLWQkSVJkMD1swyF4zGahojNcestHtu2wkY0mNkAJNng/+zZonQBBTZRmGVj/B59UYxUJje6VzaMVs2fyxpMhQ8QUd0nJFuc7rrRr2Sg2fby6Pc0pgzUwrg/tBSVs60GwgX9ODBhKSzzGk9EgAx5dxkbQxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=Rj00CBox; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="Rj00CBox"
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-7211b09f639so25125666d6.3
        for <linux-coco@lists.linux.dev>; Fri, 05 Sep 2025 09:23:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1757089380; x=1757694180; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ad13/2gQOL6Gr085zJwP5rL6z3rEqez1d11xvvV7kSE=;
        b=Rj00CBoxI16iXoXGDDgrppgUpgVzQ2gmhfVQQTSQOCwkYVFxoztZaH7HAlpAz1D7OY
         krzPfrEWttXWxgDhwnm7oBbQ3fKQOVq9tIpUB15yg5/myBIb5SyZlsuQgeMeJWgSAgx9
         +kNk2eAd0cCI3ML1c6LujfciSnlLPmE+f9zu6nTI1a4PTPBYTEbSxNnXL1/nwYP7OTbr
         EdBLWZ5A0+cETvIp7bAIjISPOJfoiNHXpXA6iAB32ARRkaVlI+K+Vc2gRomYXfKk/9w4
         onohpdmtYrLq4D3qpaiv/h0N+J1JKKYP3ujmTiNKrY5zclRwgp4lbXAxYl2/8MQwomeC
         zoFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757089380; x=1757694180;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ad13/2gQOL6Gr085zJwP5rL6z3rEqez1d11xvvV7kSE=;
        b=T+l0m+65MPyYVuxTp48Rw43uj7Rfc0kKlID+S4QNWepvzd7o6GQq631avXlTwbdCfz
         sxYJurkHwdLQGJ9+n4pbm7NsDuHDsAqdnZkq/ws6ENzF7G+YL4JsIc+iiETonhdYBN7e
         igvt1aU8t46sL5/oOt8nS4iYTTvokW2wNBOvZcfujqDiSl3LD4KGjQ5oTpN1vU0kmLaO
         OsXO51ASWQ6nxgo+Y19eIcPRQq1W7gYRRjDlMic1a9TI/ngTOmwhUWcDNuUezwg9zNUt
         +KCkHu6MuPSa/FDfmbQGNOGZf81TjOZWa2Q3PHSFcau4MoaXErDcVp01xdgWbnc/D7Hh
         8YGg==
X-Forwarded-Encrypted: i=1; AJvYcCX6mPx5kCtaQ5PiODsLU8WOx+KmRD4xh5Iu/YRJI7KY1UuVyFQfqxrhZdkDl3LaTWFDS6Ikxa7luQ02@lists.linux.dev
X-Gm-Message-State: AOJu0Yz83Shok+yM1xqCouqe3e9qWD2js/cD3xj7yfS2rGaybmezP0Da
	oHZldjCBzWAFkI0SpiBgLJOAXWDo5zJXSxMa4X0OtcHxaZ/nfQ2n0NXgUs2Eg9LhXP4=
X-Gm-Gg: ASbGncuFpsOzM/2CAPiK9dg+U6YV4QbZj2piS5VkuAGdMMZG/bzlC1SIn0G9CsQ3sIb
	Tz0VTwZgp1bP3QfzScXS1w3VUB+/AAPMV/8IQJL0eQjEQUEUJ290BOzLVij5HQjUhZlgQIefoFe
	8CZiLor7NbuP4a3JjRVTW8Fy+sBtEq+lN+g3UCQOVXdCK9+DDv51u5ENsRSIc39LT+jxDPs5gyG
	Q+hADwAgrED4iKbrKiL96AYpk8JaBPsDTIm84NyX4E/ILCG4Wd6QEBwO6RbsFw3pf9o9L8VubMQ
	hrOmRFapN0RMG69DAxhynXKIdQtY+AWXKwFhzU43M4Fh3fpFj7Cj6LqY8U9J2uQ16XGQkZSrdn9
	I5Qw44xwFjLMYaB9LbQVtpa3cjKz9rLaTpyGONstMYremMAwASGFLMM0/8WUotL7ED8pY
X-Google-Smtp-Source: AGHT+IGahpiUClMcLLVXgS5mwb3H7pF6RD7KDX0AnnNYHP758kBLVwSbh/Pr8Ncjrvt8ub1MMqdwLg==
X-Received: by 2002:a05:6214:b03:b0:727:e45a:562c with SMTP id 6a1803df08f44-727e45a5b36mr82427466d6.45.1757089379823;
        Fri, 05 Sep 2025 09:22:59 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-47-55-120-4.dhcp-dynamic.fibreop.ns.bellaliant.net. [47.55.120.4])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-720b5b9ceb1sm67962746d6.57.2025.09.05.09.22.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 09:22:59 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uuZDG-00000002sWI-1ORv;
	Fri, 05 Sep 2025 13:22:58 -0300
Date: Fri, 5 Sep 2025 13:22:58 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
	linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
	linux-coco@lists.linux.dev, will@kernel.org, maz@kernel.org,
	tglx@linutronix.de, robin.murphy@arm.com, suzuki.poulose@arm.com,
	akpm@linux-foundation.org, steven.price@arm.com
Subject: Re: [RFC PATCH] arm64: swiotlb: dma: its: Ensure shared buffers are
 properly aligned
Message-ID: <20250905162258.GA483339@ziepe.ca>
References: <20250905055441.950943-1-aneesh.kumar@kernel.org>
 <aLrh_rbzWLPw9LnH@arm.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aLrh_rbzWLPw9LnH@arm.com>

On Fri, Sep 05, 2025 at 02:13:34PM +0100, Catalin Marinas wrote:
> Hi Aneesh,
> 
> On Fri, Sep 05, 2025 at 11:24:41AM +0530, Aneesh Kumar K.V (Arm) wrote:
> > When running with private memory guests, the guest kernel must allocate
> > memory with specific constraints when sharing it with the hypervisor.
> > 
> > These shared memory buffers are also accessed by the host kernel, which
> > means they must be aligned to the host kernel's page size.
> 
> So this is the case where the guest page size is smaller than the host
> one. Just trying to understand what would go wrong if we don't do
> anything here. Let's say the guest uses 4K pages and the host a 64K
> pages. Within a 64K range, only a 4K is shared/decrypted. If the host
> does not explicitly access the other 60K around the shared 4K, can
> anything still go wrong? Is the hardware ok with speculative loads from
> non-shared ranges?

+1 I'm also confused by this description.

I thought the issue here was in the RMM. The GPT or S2 min granule
could be > 4k and in this case an unaligned set_memory_decrypted()
from the guest would have to fail inside the RMM as impossible to
execute?

Though I'm a little unclear on when and why the S2 needs to be
manipulated. Can't the S2 fully map both the protected and unprotected
IPA space and rely on the GPT for protection?

I do remember having a discussion that set_memory_decrypted() has
nothing to do with the VM's S1 granule size, and it is a mistake to
have linked these together. The VM needs to understand what
granularity the RMM will support set_memory_decrypted() for and follow
that.

I don't recall there is also an issue on the hypervisor? I thought GPT
faults on ARM were going to work well, ie we could cleanly segfault
the VMM process if it touches any protected memory that may have been
mapped into it, and speculation was safe?

> > @@ -213,16 +213,20 @@ static gfp_t gfp_flags_quirk;
> >  static struct page *its_alloc_pages_node(int node, gfp_t gfp,
> >  					 unsigned int order)
> >  {
> > +	long new_order;
> >  	struct page *page;
> >  	int ret = 0;
> >  
> > -	page = alloc_pages_node(node, gfp | gfp_flags_quirk, order);
> > +	/* align things to hypervisor page size */
> > +	new_order = get_order(ALIGN((PAGE_SIZE << order), arch_shared_mem_alignment()));
> > +
> > +	page = alloc_pages_node(node, gfp | gfp_flags_quirk, new_order);
> >  
> >  	if (!page)
> >  		return NULL;
> >  
> >  	ret = set_memory_decrypted((unsigned long)page_address(page),
> > -				   1 << order);
> > +				   1 << new_order);
> 
> At some point this could move to the DMA API.

I don't think we should be open coding these patterns.

Esepcially given the above, it makes no sense to 'alloc page' and then
'decrypt page' on ARM CCA. decryption is not really a OS page level
operation. I suggest coming with some series to clean these up into a
more sensible API.

Everything wanting decrypted memory should be going through some more
general API that has some opportunity to use pools.

DMA API may be one choice, but I know we will need more options in
RDMA land :|

Jason
