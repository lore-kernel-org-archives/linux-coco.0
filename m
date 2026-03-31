Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FF4B34CFCF
	for <linux-coco@lists.linux.dev>; Tue, 31 Mar 2026 06:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774938326; cv=none; b=sobMh5NLEUU1tXN5H4kzvNS1YphrGRUb92zcRHTjbsnQ66jKM+0a1rEPF6NXwxhhRC1qnrQt/U/xpzB8d4fQ5OOxcEAh1Sspax7id2ji8mXUgg4dggJe8Yo4M0pLgs5SxrIt2+LTvcOx1FoE/KYqbHHndIUDsTeBQk2j1rX+fAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774938326; c=relaxed/simple;
	bh=UhU7giXO/4/XwBFR6g8fWJ7VGxRAyzkloQXuM0newp8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Uh9iAm0cP+jCBtHFiyW65kKw0vf9JDFoSOoRDvkNP5RLpYLra8BzmbkGuGIeucaBwbl6XG8+xYZkSJfJ5OaemJnKVU7piBUqG4ZSUR/CObhlfI2eFKOvP4HvqBptqnd5AlqW+XP30vQd8iexjY+c4u8ZsXvqnLBf2wMJ72swmAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A1evgneC; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A1evgneC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774938324; x=1806474324;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UhU7giXO/4/XwBFR6g8fWJ7VGxRAyzkloQXuM0newp8=;
  b=A1evgneCxPt3QsSgkuMMoUeWlUcSpqw8PUzwwzcecI6wgDIsQcCqU8vU
   6utGgK3Mfcrbnam0/kpm8EYXOVLYiq3ndijUo8milYUhQt4MG1+t+JApq
   8Un5UEC4W9chz6MBtD1Bg1wNxnTPXMw5A+pFKY6z7q6k5cqY8HFIZfqHW
   kPg6aWt/8M6p7asdKNBrZevUUsLMMYf5tM9oaH33K/LqxCvWtid5ZdxZ8
   mrd4b2xbNtvvIvqAYDyiflsz8kL+/xZB2NzknCV8eUR1GV1fZAbEEw0d8
   FcXWWMNjVN1QtyltqrGK4oVQRe4KLghFz6DZjrgp/ntSrNX6O93K1vvv2
   Q==;
X-CSE-ConnectionGUID: 1w007vRqS6Kyt1U5P4fL/A==
X-CSE-MsgGUID: C02jAKEdSAeat0Pub/7zqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11744"; a="98548905"
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; 
   d="scan'208";a="98548905"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2026 23:25:24 -0700
X-CSE-ConnectionGUID: fDCrYkeNTcCE7MyMjV2QuA==
X-CSE-MsgGUID: J2lxHIqFQlSV8pOohhyOfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; 
   d="scan'208";a="221402278"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.246.52])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2026 23:25:18 -0700
Date: Tue, 31 Mar 2026 09:25:14 +0300
From: Tony Lindgren <tony.lindgren@linux.intel.com>
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
Cc: "yilun.xu@linux.intel.com" <yilun.xu@linux.intel.com>,
	"Gao, Chao" <chao.gao@intel.com>, "Xu, Yilun" <yilun.xu@intel.com>,
	"x86@kernel.org" <x86@kernel.org>,
	"kas@kernel.org" <kas@kernel.org>,
	"baolu.lu@linux.intel.com" <baolu.lu@linux.intel.com>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
	"Li, Xiaoyao" <xiaoyao.li@intel.com>,
	"Williams, Dan J" <dan.j.williams@intel.com>,
	"Jiang, Dave" <dave.jiang@intel.com>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"Duan, Zhenzhong" <zhenzhong.duan@intel.com>,
	"Verma, Vishal L" <vishal.l.verma@intel.com>,
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>
Subject: Re: [PATCH v2 03/31] x86/virt/tdx: Add tdx_page_array helpers for
 new TDX Module objects
Message-ID: <actoyocXRKv8_Kcc@tlindgre-MOBL1>
References: <20260327160132.2946114-1-yilun.xu@linux.intel.com>
 <20260327160132.2946114-4-yilun.xu@linux.intel.com>
 <1dd0b8f4d1ad5cd07b5139ed8c944e1e1d004661.camel@intel.com>
 <acpPsPivfllpWfv1@yilunxu-OptiPlex-7050>
 <23b92a154c859450d106de6c9badbe284e3aa19f.camel@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <23b92a154c859450d106de6c9badbe284e3aa19f.camel@intel.com>

On Mon, Mar 30, 2026 at 11:25:08PM +0000, Edgecombe, Rick P wrote:
> On Mon, 2026-03-30 at 18:25 +0800, Xu Yilun wrote:
> > Yes in POC code we do write dedicated code for each type, but it ends up
> > with plenty of similar logics on caller side about root page
> > manipulation. By now, the differences are not much, but I think we
> > should not write copies for every type, we should stop new types.
> 
> Hmm, doesn't it seem like this is quickly becoming complicated though, to
> combine all the different types together? And it seems there are more coming
> that people want to add to this.

Most of the list entry types are the same with just some bits unused.

Regards,

Tony
