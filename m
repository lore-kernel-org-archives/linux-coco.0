Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13B5D3CBE76
	for <linux-coco@lists.linux.dev>; Wed, 22 Apr 2026 10:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776852217; cv=none; b=AUrDbJ6WUpLkp6McvjiKc9ebW41GBer5otMUSfKDritba2eUJODWFwD6zkGPjnUOs8dp2lnjqK5VF+aB4eXHwzg+fxHUKjFIrTXyS4fsg2gkHMfxl4NAW0ydEBOyDJgg+wKWI9wBcZIEifgaS50LoqN936SyvfQBMFd6/D10RWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776852217; c=relaxed/simple;
	bh=hlm7gJqoYHUBtDZRYXpx+/LwwGMoasTHOJAJaQPz6Ig=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LhU+GLwJZBfnF1m2l3GGynAutmzS0aHMKzQNqAMpsvG7z/KF+PupYBQFVISq4t6Dg9OYxPQBRJKSy7BpPo/y4OvbC+HnlhTQAZ8pxYcbFhXQzzfXiQoNar0Si43Rd661QaCEnusw6OAvh152f3oPKw/U/ZSMDqpkPhurQUro3dY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ltXvs1I4; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ltXvs1I4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776852215; x=1808388215;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hlm7gJqoYHUBtDZRYXpx+/LwwGMoasTHOJAJaQPz6Ig=;
  b=ltXvs1I48k2k/5umbx+2ST+kPaYcUBZCxX4fIaG+/2F5LCLTE4hgXB4g
   0EJUrkRXXq/dab3Kj74XL6B1XdSD/RjyhqGBjadRc2/5Ifif54ZKgBOrx
   ch+ecr4Tg76KDXbIEXsIJnmf7u3O9X40srs9KQ+eru6VyU1U5JWWwNK9m
   lzMHIZPAKTKPpfaODL4WO8X/mAvC8SQ2dTXXdIHrQZnShishdorTae4/l
   J7HI7zM1ibqjtjv2LB/AAJ0HZ3/TpLkxWvz2zMxGGrGe89aEleoc+cFp9
   LpExVLzjVSV3kzs4c1m4t/uR6r6ir38C1GZJ2tPaDDOVwn4et9yXefr2Y
   g==;
X-CSE-ConnectionGUID: 2K68xA6bQ7aIbdj6Z1SJQw==
X-CSE-MsgGUID: NDzrbA9LQQ69ZmIc2ug5lg==
X-IronPort-AV: E=McAfee;i="6800,10657,11763"; a="88102801"
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; 
   d="scan'208";a="88102801"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2026 03:03:32 -0700
X-CSE-ConnectionGUID: CtWsiRoVRRCJop2UpLdhAw==
X-CSE-MsgGUID: VSoYH8akQhetqsoi3ykG2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; 
   d="scan'208";a="237308578"
Received: from yilunxu-optiplex-7050.sh.intel.com (HELO localhost) ([10.239.159.165])
  by fmviesa005.fm.intel.com with ESMTP; 22 Apr 2026 03:03:27 -0700
Date: Wed, 22 Apr 2026 17:41:14 +0800
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
Message-ID: <aeiXuludvkZedOg5@yilunxu-OptiPlex-7050>
References: <20260327160132.2946114-1-yilun.xu@linux.intel.com>
 <20260327160132.2946114-25-yilun.xu@linux.intel.com>
 <BN9PR11MB5276E1C73BFF4EF6A806F69D8C582@BN9PR11MB5276.namprd11.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BN9PR11MB5276E1C73BFF4EF6A806F69D8C582@BN9PR11MB5276.namprd11.prod.outlook.com>

On Thu, Apr 09, 2026 at 07:56:06AM +0000, Tian, Kevin wrote:
> > From: Xu Yilun <yilun.xu@linux.intel.com>
> > Sent: Saturday, March 28, 2026 12:01 AM
> > +
> > +static int __maybe_unused tdx_spdm_msg_exchange(struct tdx_tsm_link
> > *tlink,
> > +						void *request, size_t
> > request_sz,
> > +						void *response, size_t
> > response_sz)
> > +{
> > +	struct pci_dev *pdev = tlink->pci.base_tsm.pdev;
> 
> call it pci_spdm_msg_exchange() and pass in struct pci_dev directly.

I don't think so. There is kernel managed spdm transfer support WIP,
which is another topic.  We don't want to mix the namespace with that
one.

And we also don't name it tsm_spdm_msg_exchange, cause TSM firmwares
output different blobs for vendor TSM drivers to transfer. E.g. TDX
Module outputs buffers with DOE header & SPDM header, other vendors
(AMD IIRC) outputs buffers with only SPDM header. So this function is
TDX specific.

> 
> there is no other use of tlink in this function. could add a note that
> this should be moved to pci core when a 2nd user of raw frame comes.
