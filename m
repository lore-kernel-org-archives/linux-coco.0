Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06059197A8B
	for <linux-coco@lists.linux.dev>; Thu, 16 Jan 2025 08:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737016375; cv=none; b=WSQbMwe0gbNvlQpK30+Hw63Ko1O/fVyzu2nRqDeSNOGyqhqosi3Vyj4fQtj9dUnrMvUEMLNbR9NC6hNCkMrxaQan+1rHsVNxupSK/GgQoWo7tFiiA8H/cQlHNRfhQG+H9Dl26H1jK41HcEta1XyBf7FgMKZzFyCdtSML7HTnFAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737016375; c=relaxed/simple;
	bh=VGrWjvhJhhUTVfrWrN34OBRcBc2wi3Pd0KUwUFHy7HQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bxkPozW8rm+LQB4zHiZtAlMrwtzGlC4v42OR5NW8m9OAmowdi8tNyHFHoFROSl4vL78hL26O3eGrUY5Wq3I+q38ORnKt4tVlO6X1VayeX9wnIAuh7wfxaggTiayscQ9XSfTHGTqp86zcjum1k+aMln8JITKY4Cx3JRITmtg31Io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PlC9kpSb; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PlC9kpSb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737016374; x=1768552374;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VGrWjvhJhhUTVfrWrN34OBRcBc2wi3Pd0KUwUFHy7HQ=;
  b=PlC9kpSbEgj6zBI6vvKgDreFC5sQ1AyOuqYGrzH3Yc1nBjl5/otwEbml
   r12M0W/fjl7peM2iXHzlf/VMGF8hKoYEDD0I+y8zslTd6hCnxaQA/7Yeo
   owthyYJeqa6UUGwoYgkNaAMSTv/2Gmi7HQCpdEVHgFOwBpwdx8o630Erk
   JlmJ9tB/VHr2zaBFSc/yTbfZLnLFHwUaPeeyeUxoDCiDHGWu6O9vqdgUU
   KIzXLAJCh3SxG+zBpGaTjVnAHnjkY3bkounK6JVoSNiJRxB8EFnbTz9zu
   GtqxhOw1plsw+WVGzbwtVfYVkpPXIQowdVU+BL58ZEF4miQnhU/L4VSX+
   Q==;
X-CSE-ConnectionGUID: ssTQbpguTweyRs8zYRMfUA==
X-CSE-MsgGUID: 8WWYITraRDuGcJzXHLcBeg==
X-IronPort-AV: E=McAfee;i="6700,10204,11316"; a="48782708"
X-IronPort-AV: E=Sophos;i="6.13,208,1732608000"; 
   d="scan'208";a="48782708"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2025 00:32:54 -0800
X-CSE-ConnectionGUID: RHQ6cZtPQfClhhKO2tTqFw==
X-CSE-MsgGUID: eaHL4luvRdGgumdMQzCsTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,208,1732608000"; 
   d="scan'208";a="105178638"
Received: from yilunxu-optiplex-7050.sh.intel.com (HELO localhost) ([10.239.159.165])
  by orviesa009.jf.intel.com with ESMTP; 16 Jan 2025 00:32:49 -0800
Date: Thu, 20 Jun 2024 07:39:36 +0800
From: Xu Yilun <yilun.xu@linux.intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: Jason Gunthorpe <jgg@nvidia.com>,
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
	Leon Romanovsky <leonro@nvidia.com>, kvm@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org, sumit.semwal@linaro.org,
	pbonzini@redhat.com, seanjc@google.com, alex.williamson@redhat.com,
	vivek.kasireddy@intel.com, dan.j.williams@intel.com, aik@amd.com,
	yilun.xu@intel.com, linux-coco@lists.linux.dev,
	linux-kernel@vger.kernel.org, lukas@wunner.de, yan.y.zhao@intel.com,
	leon@kernel.org, baolu.lu@linux.intel.com, zhenzhong.duan@intel.com,
	tao1.su@intel.com
Subject: Re: [RFC PATCH 01/12] dma-buf: Introduce dma_buf_get_pfn_unlocked()
 kAPI
Message-ID: <ZnNsOOqM4ziy2reV@yilunxu-OptiPlex-7050>
References: <58e97916-e6fd-41ef-84b4-bbf53ed0e8e4@amd.com>
 <Z38FCOPE7WPprYhx@yilunxu-OptiPlex-7050>
 <Z4F2X7Fu-5lprLrk@phenom.ffwll.local>
 <20250110203838.GL5556@nvidia.com>
 <Z4Z4NKqVG2Vbv98Q@phenom.ffwll.local>
 <20250114173103.GE5556@nvidia.com>
 <Z4d4AaLGrhRa5KLJ@phenom.ffwll.local>
 <20250115093234.GB6805@lst.de>
 <20250115133419.GN5556@nvidia.com>
 <20250116053348.GA24046@lst.de>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250116053348.GA24046@lst.de>

On Thu, Jan 16, 2025 at 06:33:48AM +0100, Christoph Hellwig wrote:
> On Wed, Jan 15, 2025 at 09:34:19AM -0400, Jason Gunthorpe wrote:
> > > Or do you mean some that don't have pages associated with them, and
> > > thus have pfn_valid fail on them?  They still have a PFN, just not
> > > one that is valid to use in most of the Linux MM.
> > 
> > He is talking about private interconnect hidden inside clusters of
> > devices.
> > 
> > Ie the system may have many GPUs and those GPUs have their own private
> > interconnect between them. It is not PCI, and packets don't transit
> > through the CPU SOC at all, so the IOMMU is not involved.
> > 
> > DMA can happen on that private interconnect, but from a Linux
> > perspective it is not DMA API DMA, and the addresses used to describe
> > it are not part of the CPU address space. The initiating device will
> > have a way to choose which path the DMA goes through when setting up
> > the DMA.
> 
> So how is this in any way relevant to dma_buf which operates on
> a dma_addr_t right now and thus by definition can't be used for
> these?

One part of dma-buf is the fd-based machanism for exporters to share
buffers across devices & subsystems, while still have buffer's lifetime
controlled by exporters.  Another part is the way the importers use
the buffer (i.e. the dma_addr_t based kAPI).

The fd-based exporting machanism is what we want to dmaareuse for buffer
sharing. But we are pursuing some extended buffer sharing and DMA usage
which doesn't fit into existing DMA API mapping, e.g. for GPA/userspace
IOVA accessing, or IIUC other side channel DMA, multi-channel DMA ...

Thanks,
Yilun 
