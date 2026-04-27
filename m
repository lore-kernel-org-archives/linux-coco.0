Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 149043644CF
	for <linux-coco@lists.linux.dev>; Mon, 27 Apr 2026 03:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777262194; cv=none; b=l92mZCwPqZMKOUgJiHLNOuGxaBUCZWoDb3qPxDeaE26hZfPqih3ZJAbFEyPKgmhWmX3WP5CJ8ZvhGN9QmWD9RJ2UDLHgDOS/7vyDX1VZG0dy7HL/wOqO6sy6iT4RTJ2tIS3tSWI5aUzeNIghXspkiHs1KPukHIA9Gp9AyGB6jF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777262194; c=relaxed/simple;
	bh=U5eB27EPhFnEq25cMqaEKtuW8hppFXLa4DWUWniTY3c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s7G9JVNvx5mB/pOfTlODpgacSrk6juqsxMoX5ft3Q2itJCRELGlFbcFyFYyOBKGnP/jpP5FbtAfIhQEf8XgS4MvMTZSMDZuIF4/Qaujpz8PGcGvqRnZM9poDO0Ul5GeTUWyvjTXRMIl8nMeD6Wy9jTdXedLLC9RMlu98DoaodjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EIQvFcRm; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EIQvFcRm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777262193; x=1808798193;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=U5eB27EPhFnEq25cMqaEKtuW8hppFXLa4DWUWniTY3c=;
  b=EIQvFcRmWRVVuc9BI7pUnDOdz2Uk1umr1wmXexlGM2JPj5JjJ9iz4WYe
   PXM4odkHQSjehTqXCQ4bNINMQ7PYnvYvqtfmQ1rde4ri8lG75rGD7rFY/
   K8LudotQMtpwZ73JyWqEl89Nd+WDgINkeQOdXkgbXCLZQ2kJA5Op47Yum
   EX06s5+ZMerMh2O5UUVhJQ4RsrLlpmu96MJgtSu/7YLFSOHLOtaBtuYKv
   rF40744stUXVYo6njGxqQItXoEX6Z8FZIme/ol5S+t+SfobO12h+3LxLu
   MwaaDTW8T9qI41pEV9cRvxecAOEM+Loyv7Soz/OND1ZeGw0/pgJkcnk5T
   w==;
X-CSE-ConnectionGUID: llg8tYygTemXwpUTMsd9Rw==
X-CSE-MsgGUID: RcWmUIprQAOdjK3zhF9XmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11768"; a="100798227"
X-IronPort-AV: E=Sophos;i="6.23,201,1770624000"; 
   d="scan'208";a="100798227"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2026 20:56:33 -0700
X-CSE-ConnectionGUID: mYmK07pcQ6OWdus7p0Sfag==
X-CSE-MsgGUID: tO9C6WKTTdKqQrv4zzRAzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,201,1770624000"; 
   d="scan'208";a="226984187"
Received: from yilunxu-optiplex-7050.sh.intel.com (HELO localhost) ([10.239.159.165])
  by fmviesa009.fm.intel.com with ESMTP; 26 Apr 2026 20:56:28 -0700
Date: Mon, 27 Apr 2026 11:34:01 +0800
From: Xu Yilun <yilun.xu@linux.intel.com>
To: "Tian, Kevin" <kevin.tian@intel.com>
Cc: "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"Williams, Dan J" <dan.j.williams@intel.com>,
	"x86@kernel.org" <x86@kernel.org>, "Gao, Chao" <chao.gao@intel.com>,
	"Jiang, Dave" <dave.jiang@intel.com>,
	"baolu.lu@linux.intel.com" <baolu.lu@linux.intel.com>,
	"Xu, Yilun" <yilun.xu@intel.com>,
	"Duan, Zhenzhong" <zhenzhong.duan@intel.com>,
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>,
	"Edgecombe, Rick P" <rick.p.edgecombe@intel.com>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
	"kas@kernel.org" <kas@kernel.org>,
	"Li, Xiaoyao" <xiaoyao.li@intel.com>,
	"Verma, Vishal L" <vishal.l.verma@intel.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 24/31] coco/tdx-host: Add a helper to exchange SPDM
 messages through DOE
Message-ID: <ae7ZKa5AQ3lQunfq@yilunxu-OptiPlex-7050>
References: <20260327160132.2946114-1-yilun.xu@linux.intel.com>
 <20260327160132.2946114-25-yilun.xu@linux.intel.com>
 <BN9PR11MB5276E1C73BFF4EF6A806F69D8C582@BN9PR11MB5276.namprd11.prod.outlook.com>
 <aeiXuludvkZedOg5@yilunxu-OptiPlex-7050>
 <BN9PR11MB52767B17432AF4A2622091608C2B2@BN9PR11MB5276.namprd11.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BN9PR11MB52767B17432AF4A2622091608C2B2@BN9PR11MB5276.namprd11.prod.outlook.com>

On Fri, Apr 24, 2026 at 07:01:32AM +0000, Tian, Kevin wrote:
> > From: Xu Yilun <yilun.xu@linux.intel.com>
> > Sent: Wednesday, April 22, 2026 5:41 PM
> > 
> > On Thu, Apr 09, 2026 at 07:56:06AM +0000, Tian, Kevin wrote:
> > > > From: Xu Yilun <yilun.xu@linux.intel.com>
> > > > Sent: Saturday, March 28, 2026 12:01 AM
> > > > +
> > > > +static int __maybe_unused tdx_spdm_msg_exchange(struct
> > tdx_tsm_link
> > > > *tlink,
> > > > +						void *request, size_t
> > > > request_sz,
> > > > +						void *response, size_t
> > > > response_sz)
> > > > +{
> > > > +	struct pci_dev *pdev = tlink->pci.base_tsm.pdev;
> > >
> > > call it pci_spdm_msg_exchange() and pass in struct pci_dev directly.
> > 
> > I don't think so. There is kernel managed spdm transfer support WIP,
> > which is another topic.  We don't want to mix the namespace with that
> > one.
> 
> pci_spdm_raw_msg_exchange() then, since you said currently only
> one user i.e. tdx?
> 
> If the kernel managed spdm doesn't support the raw format, then there
> won't be conflict.

I think kernel managed spdm APIs should not support the raw format (with
DOE header). SPDM protocol could be run on various transit so make no
sense to have special care for DOE.

So this "raw_msg_exchange" is dedicated for PCI/TSM. Yes there won't be
conflict, but it's important "pci_spdm_" prefix only serve kernel
managed spdm. PCI_TSM managed SPDM has fundamental logical differences
with the kernel managed one.

> 
> if it supports (i.e. the 2nd user), then this should be moved to pci core.
> 
> > 
> > And we also don't name it tsm_spdm_msg_exchange, cause TSM firmwares
> > output different blobs for vendor TSM drivers to transfer. E.g. TDX
> > Module outputs buffers with DOE header & SPDM header, other vendors
> > (AMD IIRC) outputs buffers with only SPDM header. So this function is
> > TDX specific.
> > 
> 
> TDX is just an user of that. All the logic here is about handling the
> raw format, nothing specific to tdx.

It is special, kernel managed spdm won't expect an all-in-one format,
other vendors either. It is TDX's decision to output this all-in-one
format for OS to transfer.
